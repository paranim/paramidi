import paramidi/tsf
import dr_wav
import miniaudio
import os

when isMainModule:
  const
    sampleRate = 44100
    numSamples = 1 * sampleRate
  var sf = tsf_load_filename("../aspirin.sf2")
  tsf_set_output(sf, TSF_MONO, sampleRate, 0) #sample rate
  tsf_note_on(sf, 0, 60, 1.0f) #preset 0, middle C
  var sec: array[numSamples, cshort] # synthesize 1 second
  tsf_render_short(sf, cast[ptr cshort](sec.addr), sec.len.cint, 0)

  var wav*: drwav
  var format*: drwav_data_format
  format.container = drwav_container_riff
  format.format = DR_WAVE_FORMAT_PCM
  format.channels = 1
  format.sampleRate = sampleRate
  format.bitsPerSample = 16
  doAssert drwav_init_file_write(wav.addr, "output.wav", addr(format), nil)
  doAssert numSamples == drwav_write_pcm_frames(wav.addr, numSamples, sec.addr)
  discard drwav_uninit(wav.addr)

  var
    res: ma_result
    decoder = newSeq[uint8](ma_decoder_size())
    decoderAddr = cast[ptr ma_decoder](decoder[0].addr)
    deviceConfig = newSeq[uint8](ma_device_config_size())
    deviceConfigAddr = cast[ptr ma_device_config](deviceConfig[0].addr)
    device = newSeq[uint8](ma_device_size())
    deviceAddr = cast[ptr ma_device](device[0].addr)
  res = ma_decoder_init_file("output.wav", nil, decoderAddr)
  doAssert res == MA_SUCCESS

  proc data_callback(pDevice: ptr ma_device; pOutput: pointer; pInput: pointer; frameCount: ma_uint32) {.cdecl.} =
    discard ma_decoder_read_pcm_frames(decoderAddr, pOutput, frameCount)

  ma_device_config_init_with_decoder(deviceConfigAddr, ma_device_type_playback, decoderAddr, data_callback)
  if ma_device_init(nil, deviceConfigAddr, deviceAddr) != MA_SUCCESS:
    discard ma_decoder_uninit(decoderAddr)
    quit("Failed to open playback device.")

  if ma_device_start(deviceAddr) != MA_SUCCESS:
    #ma_device_uninit(deviceAddr)
    discard ma_decoder_uninit(decoderAddr)
    quit("Failed to start playback device.")

  sleep(2000)
  #discard ma_device_stop(deviceAddr)
  #ma_device_uninit(deviceAddr)
  discard ma_decoder_uninit(decoderAddr)
