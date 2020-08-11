import unittest
import paramidi/tsf

test "load soundfont":
  var sf = tsf_load_filename("../paramidi_soundfonts/src/paramidi_soundfonts/aspirin.sf2")
  tsf_set_output(sf, TSF_MONO, 44100, 0) #sample rate
  tsf_note_on(sf, 0, 60, 1.0f) #preset 0, middle C
  var halfSecond: array[22050, cshort] # synthesize 0.5 seconds
  tsf_render_short(sf, cast[ptr cshort](halfSecond.addr), halfSecond.len.cint, 0)
