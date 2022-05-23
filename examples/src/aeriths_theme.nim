from common import nil
import paramidi
import paramidi/tsf
import paramidi_soundfonts

const
  score =
    (piano,
      (tempo: 74),
      # 1
      (1/8, {-d, -a, e, fx}, a,
       1/2, {fx, +d},
       1/8, {-e, e, +c}, a,
       1/2, {c, e},
       1/8, {-d, -a, e, fx}, a, +d, +cx, +e, +d, b, +cx,
       1/2, {-e, c, a}, 1/2, {c, e}),
      # 5
      (1/8, {-d, -a, e, fx}, a,
       1/4, {fx, +d}, e, d,
       (tempo: 140),
       1/8, {a-2, c, +c}, a,
       1/4, {c, e}, -b, -a),
      # 7
      (1/8, d, e, {-d, d, fx, +d}, -a, d, -a, fx, -a,
       d, -a, -d, -a, d,
       1/4, {d, fx},
       1/8, {-d, d}, {-cx, e}, {b-2, fx}, -fx, d, -b,
       1/4, d,
       1/8, {-fx, -a, d, fx}, g, {a-2, a}, -fx, cx, -a,
       1/4, {cx, fx},
       1/8, {-g, d, g, b}, +cx, {b-2, +d}, -d,
       {-b, g, b}, -g,
       1/4, -b, {-g, e, g},
       1/16, {-d, fx, a}, b,
       1/8, {-a, a}, e, -a,
       1/4, fx),
      # 15
      (1/8, {-d, a}, fx, {a-2, cx}, -fx, -a, cx, {a-2, +cx},
       -fx, -a, cx, {a-2, b}, -fx, -a, fx, {a-2, a}, -fx),
      # 17
      (1/8, {-a, b}, a, {b-2, d}, -d, -a, -b, {-d, b}, -a,
       -b, d, {-d, a}, -a, -b, d,
       {g, -d}, -a),
      # 19
      (1/8, {a, -b}, fx, {a-2, cx}, -gx, -a, cx, {a-2, +cx},
       -gx, -a, cx, {b, a-2}, -gx, -a, cx,
       {-fx, a}, -gx),
      # 21
      (1/8, {-a, b}, +cx, {-g, +d}, d, g, a, b, +d,
       1/4, {fx, b, +d},
       1/8, -d, -g,
       1/4, {-b, g, +d}, {-g, a, +cx}),
      # 23
      (1/4, {-g, g, b}, {-d, d, fx, a},
       1/8, -d, -a, {e, fx}, -a, {e, fx}, -a,
       -d, -g, {b, +d}, -d, {a, +cx}, -d,
       {g, b}, -d, {-a, +cx}),
      # 25
      (1/8, -d,
       1/4, {-a, +cx},
       1/8, a-2, +fx, {a-2, +fx}, cx,
       1/4, fx,
       1/8, b-2, -d, {a, +cx}, -d, {g, b}, -d,
       1/4, {-a, +cx},
       1/2, {-e, d, g, a}, {-e, d, e}, {a-2, -g, d, e},
       1/4, {a-2, -a, cx},
       1/8, {e, d}),
      # 27
      (1/8, {fx, a}, {-g, g, b}, {fx, a}, {e, g},
       1/4, {d, fx},
       1/8, -d, -g, -b, d, g,
       1/4, b,
       1/8, {-g, g, b}, {fx, a}, {d, fx}),
      # 31
      (1/8, {e, g}, {-d, fx}, -a, d, fx,
       1/2, +d,
       1/4, +d, +cx, b),
      # 33
      (1/2, {-e, d, g, a}, {-fx, -a, cx, e},
       1/16, e, fx,
       1/8, {-g, g}, fx, e,
       1/2, d),
      # 35
      (1/8, -g, +d, b, a, +fx, +cx, b, g,
       {-d, -a, e, fx}, a,
       1/2, {fx, +d}),
      # 37
      ((tempo: 156),
       1/8, {a-2, c, +c}, a,
       1/4, {c, e}, -b, -a),
      # 38
      (tempo: 80),
      (1/8, d, e,
       1/4, {d, ax-2}, -g,
       1/8, {f, -ax}, e,
       d, e, {d, ax-2}, -d, -g, (1/4, -a), -g,
       -ax, d, {+d, fx, d, -d}, -a, d, fx, d),
      # 41
      (1/8, d, -a, -d, -a, d, -a, fx, -a,
       1/4, d, 1/2, -a),
      # 43
      (1/16, +d, d, fx, +cx, d, fx,
       1/8, b, 1/2, {a, g, d, -e},
       {e, cx, -a, -fx}, 1/16, e, fx,
       1/4, {g, -g}, 1/8, {+f, cx}, {+e, +c}),
      # 45
      (tempo: 72),
      (1/8, {+d, b}, 1/2, {g, -b, -g}, 1/4, {b, d, -a}, a-2),
      # 46
      (tempo: 66),
      (1/4, {+d, fx, d, -d}, 1/8, -a, 1, {fx, e, -a, -d}))

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
  tsf_close(sf)
  # create the wav file and play it
  const
    writeToDisk = true # if false, the wav file will only exist in memory
    padding = 500f # add a half second so it doesn't cut off abruptly
  when writeToDisk:
    common.writeFile("output.wav", res.data, res.data.len.uint32, sampleRate)
    discard common.play("output.wav", int(res.seconds * 1000f + padding))
  else:
    let wav = common.writeMemory(res.data, res.data.len.uint32, sampleRate)
    discard common.play(wav, int(res.seconds * 1000f + padding))
