import unittest
import paramidi, paramidi/tsf
from os import nil

test "load soundfont":
  const sfPath = "../paramidi_soundfonts/src/paramidi_soundfonts/aspirin.sf2"
  static: assert os.fileExists(sfPath)
  var sf = tsf_load_filename(sfPath)
  tsf_set_output(sf, TSF_MONO, 44100, 0) #sample rate
  tsf_note_on(sf, 0, 60, 1.0f) #preset 0, middle C
  var halfSecond: array[22050, cshort] # synthesize 0.5 seconds
  tsf_render_short(sf, cast[ptr cshort](halfSecond.addr), halfSecond.len.cint, 0)

from algorithm import nil

proc sortEvents(events: var seq[Event]) =
  # since the order of notes in a chord can be unpredictable,
  # the only way we can compare the outputs below is by
  # sorting them so the result is deterministic
  algorithm.sort(events, proc (x, y: Event): int =
    if x.time < y.time:
      -1
    elif x.time > y.time:
      1
    elif x.note.ord < y.note.ord:
      -1
    elif x.note.ord > y.note.ord:
      1
    else:
      0
  )

import json

test "JSON simple":
  var
    score1 = compile((piano, 1/4, c, 2, d))
    score2 = compile(%*["piano", 1/4, "c", 2, "d"])
  score1.sortEvents
  score2.sortEvents
  check score1 == score2

from dueling_banjos import nil
from dueling_banjos_json import nil

test "JSON dueling banjos":
  var
    score1 = compile(dueling_banjos.score)
    score2 = compile(dueling_banjos_json.score)
  score1.sortEvents
  score2.sortEvents
  check score1 == score2

test "relative octaves":
  var
    score1 = compile((piano, c, (octave: 3), d, (octave: 5), e))
    score2 = compile((piano, c, (octave: `-1`), d, (octave: `+2`), e))
    score3 = compile(%*["piano", "c", {"octave": "-1"}, "d", {"octave": "+2"}, "e"])
  score1.sortEvents
  score2.sortEvents
  score3.sortEvents
  check score1 == score2
  check score1 == score3
