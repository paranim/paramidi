import paramidi/tsf
import parasound/dr_wav
import parasound/miniaudio
import paramidi_soundfonts
import os

const
  sampleRate = 44100
  numSamples = 1 * sampleRate

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
    #ma_device_uninit(deviceAddr)
    discard ma_decoder_uninit(decoderAddr)
    quit("Failed to start playback device.")

  sleep(sleepMsecs)
  discard ma_device_stop(deviceAddr)
  #ma_device_uninit(deviceAddr)
  discard ma_decoder_uninit(decoderAddr)

proc writeFile(filename: string, data: var openArray[cshort]) =
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
  tsf_note_on(sf, 0, 60, 1.0f) #preset 0, middle C
  var data: array[numSamples, cshort] # synthesize 1 second
  tsf_render_short(sf, cast[ptr cshort](data.addr), data.len.cint, 0)
  writeFile("output.wav", data)
  playFile("output.wav", 1000)
