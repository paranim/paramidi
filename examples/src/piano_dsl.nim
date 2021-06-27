from common import nil
import paramidi
import paramidi/[tsf, utils]
import paramidi_soundfonts

const
  score = makeMusic:
    piano:
      tempo = 74
      1/8: {-d, -a, e, fx}
      1/2: {fx, +d}
      1/8: [{-e, e, +c}, a]
      1/2: {c, e}
      1/8: [{-d, -a, e, fx}, a, +d, +cx, +e, +d, b, +cx]
      1/2: [{-e, c, a}, {c, e}]

when isMainModule:
  # get the sound font
  # in a release build, embed it in the binary.
  when defined(release):
    const soundfont = staticRead("paramidi_soundfonts/generaluser.sf2")
    var sf = tsf_load_memory(soundfont.cstring, soundfont.len.cint)
  # during dev, read it from the disk
  else:
    var sf = tsf_load_filename(paramidi_soundfonts.getSoundFontPath("generaluser.sf2"))
  # render the score
  const sampleRate = 44100
  tsf_set_output(sf, TSF_MONO, sampleRate, 0)
  var res = render[cshort](compile(score), sf, sampleRate)
  # create the wav file and play it
  const
    writeToDisk = true # if false, the wav file will only exist in memory
    padding = 500f     # add a half second so it doesn't cut off abruptly
  when writeToDisk:
    common.writeFile("output.wav", res.data, res.data.len.uint32, sampleRate)
    common.play("output.wav", int(res.seconds * 1000f + padding))
  else:
    let wav = common.writeMemory(res.data, res.data.len.uint32, sampleRate)
    common.play(wav, int(res.seconds * 1000f + padding))
