import paramidi/tsf
import slappy
import os
import dr_wav

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

  slappyInit()
  #let sound = newSound("xylophone-sweep.wav")
  let sound = newSound("output.wav")
  discard sound.play()
  sleep(2500)
