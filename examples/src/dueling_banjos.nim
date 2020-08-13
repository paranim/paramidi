from common import nil
import paramidi
import paramidi/tsf
import paramidi_soundfonts

const
  measure1 = (1/16, b, `c+`, 1/8, `d+`, b, `c+`, a, b, g, a)
  measure2 = (1/16, g, g, 1/8, g, a, b, `c+`, `d+`, `c+`, 1/2, b)
  measure3 = (1/16, {d, `b-`, `g-`}, {d, `b-`, `g-`},
              1/8, {d, `b-`, `g-`}, {e, c, `g-`}, {d, `b-`, `g-`})
  measure4 = (1/16, b, `c+`, 1/8, `d+`, b, `c+`, a, b, g, a)
  measure5 = (1/16, r, r, 1/8, g, r, d, r, g, g, d)
  measure6 = (1/4, g, 1/8, a, b, 1/4, g, 1/8, a, d)
  measure7 = (1/4, g, 1/8, a, b, 1/4, g, 1/8, {f, `a-`}, b, 1/4, c)
  score =
    ((tempo: 80, octave: 3),
     (guitar, measure1),
     (banjo, measure1),
     (guitar, measure1),
     (guitar, 1/2, d, 1/8, g, g, a, b, g, b, 1/2, a),
     (banjo, 1/8, g, g, a, b, 1/2, g),
     (guitar, (octave: 2), measure2),
     (banjo, measure2),
     (guitar, (octave: 2), measure2),
     (banjo, measure2),
     (guitar, measure2),
     (banjo, measure2),
     (octave: 4),
     (guitar, measure3),
     (banjo, measure3),
     (guitar, measure3),
     (banjo, measure3),
     (guitar, (octave: 2), measure1),
     (banjo, (octave: 3), measure1),
     (tempo: 120, octave: 3),
     ((mode: concurrent),
      (banjo, measure4),
      (guitar, measure5)),
     ((mode: concurrent),
      (banjo, measure4),
      (guitar, measure5)),
     ((mode: concurrent),
      (banjo, measure4),
      (guitar, measure6)),
     ((mode: concurrent),
      (banjo, measure4),
      (guitar, measure7)),
     1/2, r)

when isMainModule:
  var sf = tsf_load_filename(paramidi_soundfonts.getSoundFontPath("generaluser.sf2"))
  # if you want to embed the soundfont in the binary, do this instead:
  #const soundfont = staticRead("paramidi_soundfonts/generaluser.sf2")
  #var sf = tsf_load_memory(soundfont.cstring, soundfont.len.cint)
  tsf_set_output(sf, TSF_MONO, common.sampleRate, 0)
  var res = render[cshort](parse(score), soundFont = sf, sampleRate = common.sampleRate)
  common.writeFile("output.wav", res.data, res.data.len.uint)
  const padding = 500f # add a half second so it doesn't cut off abruptly
  common.playFile("output.wav", int(res.seconds * 1000f + padding))
