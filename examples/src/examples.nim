import paramidi
import paramidi/tsf
import parasound/dr_wav
import parasound/miniaudio
import paramidi_soundfonts
import os

const
  sampleRate = 44100
  minuteSecs = 60
  quarterNote = 1/4
  defaultTempo = 120

proc playFile(filename: string, sleepMsecs: int) =
  var
    decoder = newSeq[uint8](ma_decoder_size())
    decoderAddr = cast[ptr ma_decoder](decoder[0].addr)
    deviceConfig = newSeq[uint8](ma_device_config_size())
    deviceConfigAddr = cast[ptr ma_device_config](deviceConfig[0].addr)
    device = newSeq[uint8](ma_device_size())
    deviceAddr = cast[ptr ma_device](device[0].addr)
  doAssert MA_SUCCESS == ma_decoder_init_file(filename, nil, decoderAddr)

  proc data_callback(pDevice: ptr ma_device; pOutput: pointer; pInput: pointer; frameCount: ma_uint32) {.cdecl.} =
    let decoderAddr = ma_device_get_decoder(pDevice)
    discard ma_decoder_read_pcm_frames(decoderAddr, pOutput, frameCount)

  ma_device_config_init_with_decoder(deviceConfigAddr, ma_device_type_playback, decoderAddr, data_callback)
  if ma_device_init(nil, deviceConfigAddr, deviceAddr) != MA_SUCCESS:
    discard ma_decoder_uninit(decoderAddr)
    quit("Failed to open playback device.")

  if ma_device_start(deviceAddr) != MA_SUCCESS:
    ma_device_uninit(deviceAddr)
    discard ma_decoder_uninit(decoderAddr)
    quit("Failed to start playback device.")

  sleep(sleepMsecs)
  discard ma_device_stop(deviceAddr)
  ma_device_uninit(deviceAddr)
  discard ma_decoder_uninit(decoderAddr)

proc writeFile(filename: string, data: var openArray[cshort], numSamples: uint) =
  var wav: drwav
  var format: drwav_data_format
  format.container = drwav_container_riff
  format.format = DR_WAVE_FORMAT_PCM
  format.channels = 1
  format.sampleRate = sampleRate
  format.bitsPerSample = 16
  doAssert drwav_init_file_write(wav.addr, filename, addr(format), nil)
  doAssert numSamples == drwav_write_pcm_frames(wav.addr, numSamples, data.addr)
  discard drwav_uninit(wav.addr)

when isMainModule:
  var sf = tsf_load_filename(paramidi_soundfonts.getSoundFontPath("aspirin.sf2"))
  # if you want to embed the soundfont in the binary, do this instead:
  #const soundfont = staticRead("paramidi_soundfonts/aspirin.sf2")
  #var sf = tsf_load_memory(soundfont.cstring, soundfont.len.cint)
  tsf_set_output(sf, TSF_MONO, sampleRate, 0) #sample rate
  let
    content = (piano, c, d)
    parsedContent = parse(content)
    noteLength = parsedContent[0][0].length
    noteCount = parsedContent.len
    noteLengthSeconds = (minuteSecs / defaultTempo) * (noteLength / quarterNote)
    samplesPerNote = int(sampleRate * noteLengthSeconds)
    numSamples = noteCount * samplesPerNote
  var
    data = newSeq[cshort](noteCount * samplesPerNote)
    index = 0
  for events in parse(content):
    for event in events:
      tsf_note_on(sf, event.instrument.ord.cint, cint(event.note.ord + 60), 1.0f)
    tsf_render_short(sf, data[index * samplesPerNote].addr, samplesPerNote.cint, 0)
    tsf_note_off_all(sf)
    index += 1
  writeFile("output.wav", data, numSamples.uint)
  playFile("output.wav", int(noteCount.float * noteLengthSeconds * 1000f))
