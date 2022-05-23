from common import nil
import paramidi
import paramidi/tsf
import paramidi_soundfonts

func longChord(chord: set[Note], otherNotes: tuple): auto =
  # play the given chord for a half note
  # while the other notes are played
  ((mode: concurrent), (1/2, chord), (1/8, r, otherNotes))

const
  over_yonder_in_the_graveyard =
    (1/8, g, a, 1/4, b, +d, 1/8, +d, +e, longChord({d, g, b, +e}, (1/8, +d, 1/4, b, +d)),
     1/4, +e, 1/8, +e, +d, 1/4, b, 1/8, g, a, 1/4, b,
     longChord({d, g, b, +d}, (1/8, +g, 1/4, +d)), longChord({d, g, b, +d}, (1/8, +g, 1/4, b)),)
  where_the_wild_wildflowers_grow =
    (1/8, g, a, 1/4, b, +d, 1/8, +d, +e, longChord({d, g, b, +e}, (1/8, +d, 1/4, b, +d)),
     1/4, +e, +fx, 1/8, +e, +d, b, a, 1/4, b,
     longChord({d, g, b, +d}, (1/8, +g, 1/4, +d)), longChord({d, g, b, +d}, (1/8, +g, 1/4, b)),)
  oh_there_they_laid_my_own_true_lover =
    (1/8, b, +d, a, +d, 1/4, g,
     1/8, d, e, 1/4, {+g, +d}, 1/8, g, +d, +g, +d, 1/4, d,
     1/8, g, a, a, g, g,
     1/8, d, e, 1/4, {+g, +d}, 1/8, g, +d, +g, +d, 1/4, d,)
  shes_gone_from_me_forevermore =
    (1/8, b, +d, a, +d, 1/4, g,
     1/8, d, e, 1/4, {+g, +d}, 1/8, g, +d, +g, +d, 1/4, d,
     1/8, a, b, a, g, g,
     1/8, d, e, 1/4, {+g, +d}, 1/8, g, +d, +g, +d, 1/4, d,)

  she_was_fairier_than_the_sweetest_flower = over_yonder_in_the_graveyard
  restless_as_the_wildest_wind = where_the_wild_wildflowers_grow
  oh_born_with_love_deep_as_the_ocean = oh_there_they_laid_my_own_true_lover
  that_was_the_girl_i_did_win = shes_gone_from_me_forevermore

  i_left_her_there_back_in_the_mountains = over_yonder_in_the_graveyard
  to_see_the_world_riches_to_gain = where_the_wild_wildflowers_grow
  when_i_returned_no_earthly_treasure = oh_there_they_laid_my_own_true_lover
  could_ease_this_heart_so_full_of_pain = shes_gone_from_me_forevermore

  from_way_up_high_upon_that_mountain = over_yonder_in_the_graveyard
  beneath_a_little_mound_of_clay = where_the_wild_wildflowers_grow
  the_girl_that_i_returned_to_marry = oh_there_they_laid_my_own_true_lover
  so_still_among_the_flowers_did_lay = shes_gone_from_me_forevermore

  ill_go_away_and_i_will_wander = over_yonder_in_the_graveyard
  lay_aside_my_earthly_gains = where_the_wild_wildflowers_grow
  and_ill_not_end_as_a_man_with_riches = oh_there_they_laid_my_own_true_lover
  undone_in_sorrow_ill_remain = shes_gone_from_me_forevermore

  score =
    ((octave: 3), banjo,

     over_yonder_in_the_graveyard,
     where_the_wild_wildflowers_grow,
     oh_there_they_laid_my_own_true_lover,
     shes_gone_from_me_forevermore,

     she_was_fairier_than_the_sweetest_flower,
     restless_as_the_wildest_wind,
     oh_born_with_love_deep_as_the_ocean,
     that_was_the_girl_i_did_win,
     
     i_left_her_there_back_in_the_mountains,
     to_see_the_world_riches_to_gain,
     when_i_returned_no_earthly_treasure,
     could_ease_this_heart_so_full_of_pain,

     from_way_up_high_upon_that_mountain,
     beneath_a_little_mound_of_clay,
     the_girl_that_i_returned_to_marry,
     so_still_among_the_flowers_did_lay,

     ill_go_away_and_i_will_wander,
     lay_aside_my_earthly_gains,
     and_ill_not_end_as_a_man_with_riches,
     undone_in_sorrow_ill_remain,
     undone_in_sorrow_ill_remain,
     )

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
