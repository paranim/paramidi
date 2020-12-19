from common import nil
import paramidi
import paramidi/tsf
import paramidi_soundfonts

const
  score =
    ((octave: 3), banjo,

     1/8, g, a, 1/4, b, +d, 1/8, +d, 1/4, +e,
     1/8, +e, +e, +e, +d, +d, 1/4, b,
     1/8, g, b, b, +d, +g, 1/4, +e,
     1/8, +e, +e, +e, +d, +d, 1/4, b,
     1/8, g, +g, +fx, 1/4, +e,
     1/8, +e, +e, +e, +d, +d, 1/4, b,
     1/8, g, a, b, +d, 1/4, +c,
     1/8, +c, +c, +c, b, b, 1/4, g,
     )

when isMainModule:
  # get the sound font
  # in a release build, embed it in the binary.
  const filename = "fluid-r3-0.1.1/fluid-r3.sf2"
  when defined(release):
    const soundfont = staticRead(filename)
    var sf = tsf_load_memory(soundfont.cstring, soundfont.len.cint)
  # during dev, read it from the disk
  else:
    var sf = tsf_load_filename(filename)
  # render the score
  const sampleRate = 44100
  tsf_set_output(sf, TSF_MONO, sampleRate, 0)
  var res = render[cshort](compile(score), sf, sampleRate)
  # create the wav file and play it
  const
    writeToDisk = true # if false, the wav file will only exist in memory
    padding = 500f # add a half second so it doesn't cut off abruptly
  when writeToDisk:
    common.writeFile("output.wav", res.data, res.data.len.uint32, sampleRate)
    common.play("output.wav", int(res.seconds * 1000f + padding))
  else:
    let wav = common.writeMemory(res.data, res.data.len.uint32, sampleRate)
    common.play(wav, int(res.seconds * 1000f + padding))
