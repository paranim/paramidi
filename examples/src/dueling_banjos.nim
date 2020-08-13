from common import nil
import paramidi
import paramidi/tsf
import paramidi_soundfonts

const
  measure1 = (1/16, b, `c+`, 1/8, `d+`, b, `c+`, a, b, g, a)
  measure2 = (1/16, g, g, 1/8, g, a, b, `c+`, `d+`, `c+`, 1/2, b)
  score =
    ((tempo: 80, octave: 3),
     (guitar, measure1),
     (banjo, measure1),
     (guitar, measure1),
     (guitar, 1/2, d, 1/8, g, g, a, b, g, b, 1/2, a),
     (banjo, 1/8, g, g, a, b, 1/2, g),
     (guitar, (octave: 2), measure2),
     (banjo, (octave: 3), measure2),
     (guitar, (octave: 2), measure2),
     (banjo, (octave: 3), measure2),
     (guitar, (octave: 3), measure2),
     (banjo, (octave: 3), measure2),
     ((mode: concurrent),
      (banjo, (octave: 3), 1/16, b, `c+`, 1/8, `d+`, b, `c+`, a, b, g, a),
      (guitar, (octave: 3), 1/16, r, r, 1/8, g, r, d, r, g, g, d)),
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
