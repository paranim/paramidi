import paramidi/tsf
import dr_wav
import miniaudio
import os

proc free*(x: pointer) {.cdecl, importc.}

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

  var res: ma_result
  var decoder = ma_decoder_new()
  var deviceConfig: ptr ma_device_config
  var device = ma_device_new()
  res = ma_decoder_init_file("output.wav", nil, decoder);
  doAssert res == MA_SUCCESS

  proc data_callback(pDevice: ptr ma_device; pOutput: pointer; pInput: pointer; frameCount: ma_uint32) {.cdecl.} =
    discard ma_decoder_read_pcm_frames(decoder, pOutput, frameCount)

  deviceConfig = ma_device_config_init_with_decoder(ma_device_type_playback, decoder, data_callback)
  if ma_device_init(nil, deviceConfig, device) != MA_SUCCESS:
    discard ma_decoder_uninit(decoder);
    quit("Failed to open playback device.")

  if ma_device_start(device) != MA_SUCCESS:
    #ma_device_uninit(device);
    discard ma_decoder_uninit(decoder);
    quit("Failed to start playback device.");

  sleep(2000)
  #discard ma_device_stop(device)
  #ma_device_uninit(device)
  discard ma_decoder_uninit(decoder)
  free(device)
  free(deviceConfig)
  free(decoder)
