from sequtils import nil
from algorithm import nil
import paramidi/tsf
from paramidi/constants import nil
import json, sets

type
  Note* = enum
    c, cx, d, dx, e, f, fx, g, gx, a, ax, b,
    r, # rest
    `c+`, `c+1`, `c+2`, `c+3`, `c+4`, `c+5`, `c+6`,
    `c-`, `c-1`, `c-2`, `c-3`, `c-4`, `c-5`, `c-6`,
    c1, c2, c3, c4, c5, c6, c7,
    `cx+`, `cx+1`, `cx+2`, `cx+3`, `cx+4`, `cx+5`, `cx+6`,
    `cx-`, `cx-1`, `cx-2`, `cx-3`, `cx-4`, `cx-5`, `cx-6`,
    cx1, cx2, cx3, cx4, cx5, cx6, cx7,
    `d+`, `d+1`, `d+2`, `d+3`, `d+4`, `d+5`, `d+6`,
    `d-`, `d-1`, `d-2`, `d-3`, `d-4`, `d-5`, `d-6`,
    d1, d2, d3, d4, d5, d6, d7,
    `dx+`, `dx+1`, `dx+2`, `dx+3`, `dx+4`, `dx+5`, `dx+6`,
    `dx-`, `dx-1`, `dx-2`, `dx-3`, `dx-4`, `dx-5`, `dx-6`,
    dx1, dx2, dx3, dx4, dx5, dx6, dx7,
    `e+`, `e+1`, `e+2`, `e+3`, `e+4`, `e+5`, `e+6`,
    `e-`, `e-1`, `e-2`, `e-3`, `e-4`, `e-5`, `e-6`,
    e1, e2, e3, e4, e5, e6, e7,
    `f+`, `f+1`, `f+2`, `f+3`, `f+4`, `f+5`, `f+6`,
    `f-`, `f-1`, `f-2`, `f-3`, `f-4`, `f-5`, `f-6`,
    f1, f2, f3, f4, f5, f6, f7,
    `fx+`, `fx+1`, `fx+2`, `fx+3`, `fx+4`, `fx+5`, `fx+6`,
    `fx-`, `fx-1`, `fx-2`, `fx-3`, `fx-4`, `fx-5`, `fx-6`,
    fx1, fx2, fx3, fx4, fx5, fx6, fx7,
    `g+`, `g+1`, `g+2`, `g+3`, `g+4`, `g+5`, `g+6`,
    `g-`, `g-1`, `g-2`, `g-3`, `g-4`, `g-5`, `g-6`,
    g1, g2, g3, g4, g5, g6, g7,
    `gx+`, `gx+1`, `gx+2`, `gx+3`, `gx+4`, `gx+5`, `gx+6`,
    `gx-`, `gx-1`, `gx-2`, `gx-3`, `gx-4`, `gx-5`, `gx-6`,
    gx1, gx2, gx3, gx4, gx5, gx6, gx7,
    `a+`, `a+1`, `a+2`, `a+3`, `a+4`, `a+5`, `a+6`,
    `a-`, `a-1`, `a-2`, `a-3`, `a-4`, `a-5`, `a-6`,
    a1, a2, a3, a4, a5, a6, a7,
    `ax+`, `ax+1`, `ax+2`, `ax+3`, `ax+4`, `ax+5`, `ax+6`,
    `ax-`, `ax-1`, `ax-2`, `ax-3`, `ax-4`, `ax-5`, `ax-6`,
    ax1, ax2, ax3, ax4, ax5, ax6, ax7,
    `b+`, `b+1`, `b+2`, `b+3`, `b+4`, `b+5`, `b+6`,
    `b-`, `b-1`, `b-2`, `b-3`, `b-4`, `b-5`, `b-6`,
    b1, b2, b3, b4, b5, b6, b7,
  Instrument* = enum
    none = -1,
    # Piano
    piano, # acoustic_grand_piano
    bright_acoustic_piano,
    electric_grand_piano,
    honky_tonk_piano,
    electric_piano_1,
    electric_piano_2,
    harpsichord,
    clavinet,
    # Chromatic Percussion
    celesta,
    glockenspiel,
    music_box,
    vibraphone,
    marimba,
    xylophone,
    tubular_bells,
    dulcimer,
    # Organ
    drawbar_organ,
    percussive_organ,
    rock_organ,
    organ, # church_organ
    reed_organ,
    accordion,
    harmonica,
    tango_accordion,
    # Guitar
    guitar, # acoustic_guitar_nylon
    acoustic_guitar_steel,
    electric_guitar_jazz,
    electric_guitar_clean,
    electric_guitar_palm_muted,
    electric_guitar_overdrive,
    electric_guitar_distorted,
    electric_guitar_harmonics,
    # Bass
    acoustic_bass,
    electric_bass, # electric_bass_finger
    electric_bass_pick,
    fretless_bass,
    bass_slap,
    bass_pop,
    synth_bass_1,
    synth_bass_2,
    # Strings
    violin,
    viola,
    cello,
    contrabass,
    tremolo_strings,
    pizzicato_strings,
    harp, # orchestral_harp
    timpani,
    # Ensemble
    string_ensemble_1,
    string_ensemble_2,
    synth_strings_1,
    synth_strings_2,
    choir_aahs,
    voice_oohs,
    synth_voice,
    orchestra_hit,
    # Brass
    trumpet,
    trombone,
    tuba,
    muted_trumpet,
    french_horn,
    brass_section,
    synth_brass_1,
    synth_brass_2,
    # Reed
    soprano_sax,
    alto_sax,
    tenor_sax,
    baritone_sax,
    oboe,
    english_horn,
    bassoon,
    clarinet,
    # Pipe
    piccolo,
    flute,
    recorder,
    pan_flute,
    bottle,
    shakuhachi,
    whistle,
    ocarina,
    # Synth Lead
    square_lead,
    saw_wave,
    calliope_lead,
    chiffer_lead,
    charang,
    solo_vox,
    fifths,
    bass_and_lead,
    # Synth Pad
    synth_pad_new_age,
    synth_pad_warm,
    synth_pad_polysynth,
    synth_pad_choir,
    synth_pad_bowed,
    synth_pad_metallic,
    synth_pad_halo,
    synth_pad_sweep,
    # Synth Effects
    fx_rain,
    fx_soundtrack,
    fx_crystal,
    fx_atmosphere,
    fx_brightness,
    fx_goblins,
    fx_echoes,
    fx_sci_fi,
    # Ethnic
    sitar,
    banjo,
    shamisen,
    koto,
    kalimba,
    bagpipes,
    fiddle,
    shehnai,
    # Percussive
    tinkle_bell,
    agogo,
    steel_drums,
    woodblock,
    taiko_drum,
    melodic_tom,
    synth_drum,
    reverse_cymbal,
    # Sound Effects
    guitar_fret_noise,
    breath_noise,
    seashore,
    bird_tweet,
    telephone_ring,
    helicopter,
    applause,
    gun_shot,
  RelativeOctave* = enum
    `+1`, `+2`, `+3`, `+4`, `+5`, `+6`,
    `-1`, `-2`, `-3`, `-4`, `-5`, `-6`,
  EventKind* = enum
    On, Off,
  Event* = object
    kind*: EventKind
    note*: Note
    time*: float
    instrument*: Instrument
    octave*: range[1..7]
    tempo*: int
  Mode* = enum
    sequential, concurrent,
  Context* = object
    events*: ref seq[Event]
    time*: float # total length of all notes
    seconds*: float # total number of seconds
    instrument*: Instrument
    octave*: range[1..7]
    tempo*: int
    length*: float
    play*: bool
    mode*: Mode
  RenderResult*[T] = object
    data*: seq[T]
    seconds*: float

proc getNote(note: Note): Note =
  case note:
    of c, cx, d, dx, e, f, fx, g, gx, a, ax, b, r:
      note
    of `c+`, `c+1`, `c+2`, `c+3`, `c+4`, `c+5`, `c+6`,
       `c-`, `c-1`, `c-2`, `c-3`, `c-4`, `c-5`, `c-6`,
       c1, c2, c3, c4, c5, c6, c7:
      c
    of `cx+`, `cx+1`, `cx+2`, `cx+3`, `cx+4`, `cx+5`, `cx+6`,
       `cx-`, `cx-1`, `cx-2`, `cx-3`, `cx-4`, `cx-5`, `cx-6`,
       cx1, cx2, cx3, cx4, cx5, cx6, cx7:
      cx
    of `d+`, `d+1`, `d+2`, `d+3`, `d+4`, `d+5`, `d+6`,
       `d-`, `d-1`, `d-2`, `d-3`, `d-4`, `d-5`, `d-6`,
       d1, d2, d3, d4, d5, d6, d7:
      d
    of `dx+`, `dx+1`, `dx+2`, `dx+3`, `dx+4`, `dx+5`, `dx+6`,
       `dx-`, `dx-1`, `dx-2`, `dx-3`, `dx-4`, `dx-5`, `dx-6`,
       dx1, dx2, dx3, dx4, dx5, dx6, dx7:
      dx
    of `e+`, `e+1`, `e+2`, `e+3`, `e+4`, `e+5`, `e+6`,
       `e-`, `e-1`, `e-2`, `e-3`, `e-4`, `e-5`, `e-6`,
       e1, e2, e3, e4, e5, e6, e7:
      e
    of `f+`, `f+1`, `f+2`, `f+3`, `f+4`, `f+5`, `f+6`,
       `f-`, `f-1`, `f-2`, `f-3`, `f-4`, `f-5`, `f-6`,
       f1, f2, f3, f4, f5, f6, f7:
      f
    of `fx+`, `fx+1`, `fx+2`, `fx+3`, `fx+4`, `fx+5`, `fx+6`,
       `fx-`, `fx-1`, `fx-2`, `fx-3`, `fx-4`, `fx-5`, `fx-6`,
       fx1, fx2, fx3, fx4, fx5, fx6, fx7:
      fx
    of `g+`, `g+1`, `g+2`, `g+3`, `g+4`, `g+5`, `g+6`,
       `g-`, `g-1`, `g-2`, `g-3`, `g-4`, `g-5`, `g-6`,
       g1, g2, g3, g4, g5, g6, g7:
      g
    of `gx+`, `gx+1`, `gx+2`, `gx+3`, `gx+4`, `gx+5`, `gx+6`,
       `gx-`, `gx-1`, `gx-2`, `gx-3`, `gx-4`, `gx-5`, `gx-6`,
       gx1, gx2, gx3, gx4, gx5, gx6, gx7:
      gx
    of `a+`, `a+1`, `a+2`, `a+3`, `a+4`, `a+5`, `a+6`,
       `a-`, `a-1`, `a-2`, `a-3`, `a-4`, `a-5`, `a-6`,
       a1, a2, a3, a4, a5, a6, a7:
      a
    of `ax+`, `ax+1`, `ax+2`, `ax+3`, `ax+4`, `ax+5`, `ax+6`,
       `ax-`, `ax-1`, `ax-2`, `ax-3`, `ax-4`, `ax-5`, `ax-6`,
       ax1, ax2, ax3, ax4, ax5, ax6, ax7:
      ax
    of `b+`, `b+1`, `b+2`, `b+3`, `b+4`, `b+5`, `b+6`,
       `b-`, `b-1`, `b-2`, `b-3`, `b-4`, `b-5`, `b-6`,
       b1, b2, b3, b4, b5, b6, b7:
      b

proc getOctave(ctx: Context, note: Note): range[1..7] =
  case note:
    of c, cx, d, dx, e, f, fx, g, gx, a, ax, b, r:
      ctx.octave
    of `c+`, `cx+`, `d+`, `dx+`, `e+`, `f+`, `fx+`, `g+`, `gx+`, `a+`, `ax+`, `b+`,
       `c+1`, `cx+1`, `d+1`, `dx+1`, `e+1`, `f+1`, `fx+1`, `g+1`, `gx+1`, `a+1`, `ax+1`, `b+1`:
      ctx.octave + 1
    of `c+2`, `cx+2`, `d+2`, `dx+2`, `e+2`, `f+2`, `fx+2`, `g+2`, `gx+2`, `a+2`, `ax+2`, `b+2`:
      ctx.octave + 2
    of `c+3`, `cx+3`, `d+3`, `dx+3`, `e+3`, `f+3`, `fx+3`, `g+3`, `gx+3`, `a+3`, `ax+3`, `b+3`:
      ctx.octave + 3
    of `c+4`, `cx+4`, `d+4`, `dx+4`, `e+4`, `f+4`, `fx+4`, `g+4`, `gx+4`, `a+4`, `ax+4`, `b+4`:
      ctx.octave + 4
    of `c+5`, `cx+5`, `d+5`, `dx+5`, `e+5`, `f+5`, `fx+5`, `g+5`, `gx+5`, `a+5`, `ax+5`, `b+5`:
      ctx.octave + 5
    of `c+6`, `cx+6`, `d+6`, `dx+6`, `e+6`, `f+6`, `fx+6`, `g+6`, `gx+6`, `a+6`, `ax+6`, `b+6`:
      ctx.octave + 6
    of `c-`, `cx-`, `d-`, `dx-`, `e-`, `f-`, `fx-`, `g-`, `gx-`, `a-`, `ax-`, `b-`,
       `c-1`, `cx-1`, `d-1`, `dx-1`, `e-1`, `f-1`, `fx-1`, `g-1`, `gx-1`, `a-1`, `ax-1`, `b-1`:
      ctx.octave - 1
    of `c-2`, `cx-2`, `d-2`, `dx-2`, `e-2`, `f-2`, `fx-2`, `g-2`, `gx-2`, `a-2`, `ax-2`, `b-2`:
      ctx.octave - 2
    of `c-3`, `cx-3`, `d-3`, `dx-3`, `e-3`, `f-3`, `fx-3`, `g-3`, `gx-3`, `a-3`, `ax-3`, `b-3`:
      ctx.octave - 3
    of `c-4`, `cx-4`, `d-4`, `dx-4`, `e-4`, `f-4`, `fx-4`, `g-4`, `gx-4`, `a-4`, `ax-4`, `b-4`:
      ctx.octave - 4
    of `c-5`, `cx-5`, `d-5`, `dx-5`, `e-5`, `f-5`, `fx-5`, `g-5`, `gx-5`, `a-5`, `ax-5`, `b-5`:
      ctx.octave - 5
    of `c-6`, `cx-6`, `d-6`, `dx-6`, `e-6`, `f-6`, `fx-6`, `g-6`, `gx-6`, `a-6`, `ax-6`, `b-6`:
      ctx.octave - 6
    of c1, cx1, d1, dx1, e1, f1, fx1, g1, gx1, a1, ax1, b1:
      1
    of c2, cx2, d2, dx2, e2, f2, fx2, g2, gx2, a2, ax2, b2:
      2
    of c3, cx3, d3, dx3, e3, f3, fx3, g3, gx3, a3, ax3, b3:
      3
    of c4, cx4, d4, dx4, e4, f4, fx4, g4, gx4, a4, ax4, b4:
      4
    of c5, cx5, d5, dx5, e5, f5, fx5, g5, gx5, a5, ax5, b5:
      5
    of c6, cx6, d6, dx6, e6, f6, fx6, g6, gx6, a6, ax6, b6:
      6
    of c7, cx7, d7, dx7, e7, f7, fx7, g7, gx7, a7, ax7, b7:
      7

proc getOctave(ctx: Context, relOctave: RelativeOctave): range[1..7] =
  case relOctave:
    of `+1`: ctx.octave + 1
    of `+2`: ctx.octave + 2
    of `+3`: ctx.octave + 3
    of `+4`: ctx.octave + 4
    of `+5`: ctx.octave + 5
    of `+6`: ctx.octave + 6
    of `-1`: ctx.octave - 1
    of `-2`: ctx.octave - 2
    of `-3`: ctx.octave - 3
    of `-4`: ctx.octave - 4
    of `-5`: ctx.octave - 5
    of `-6`: ctx.octave - 6

proc `+`*(note: Note): Note =
  case note:
    of c: `c+`
    of cx: `cx+`
    of d: `d+`
    of dx: `dx+`
    of e: `e+`
    of f: `f+`
    of fx: `fx+`
    of g: `g+`
    of gx: `gx+`
    of a: `a+`
    of ax: `ax+`
    of b: `b+`
    else:
      raise newException(Exception, $ note & " note cannot use +")

proc `-`*(note: Note): Note =
  case note:
    of c: `c-`
    of cx: `cx-`
    of d: `d-`
    of dx: `dx-`
    of e: `e-`
    of f: `f-`
    of fx: `fx-`
    of g: `g-`
    of gx: `gx-`
    of a: `a-`
    of ax: `ax-`
    of b: `b-`
    else:
      raise newException(Exception, $ note & " note cannot use -")

proc `+`*(note: Note, octave: range[1..6]): Note =
  case note:
    of c:
      case octave:
        of 1: `c+1`
        of 2: `c+2`
        of 3: `c+3`
        of 4: `c+4`
        of 5: `c+5`
        of 6: `c+6`
    of cx:
      case octave:
        of 1: `cx+1`
        of 2: `cx+2`
        of 3: `cx+3`
        of 4: `cx+4`
        of 5: `cx+5`
        of 6: `cx+6`
    of d:
      case octave:
        of 1: `d+1`
        of 2: `d+2`
        of 3: `d+3`
        of 4: `d+4`
        of 5: `d+5`
        of 6: `d+6`
    of dx:
      case octave:
        of 1: `dx+1`
        of 2: `dx+2`
        of 3: `dx+3`
        of 4: `dx+4`
        of 5: `dx+5`
        of 6: `dx+6`
    of e:
      case octave:
        of 1: `e+1`
        of 2: `e+2`
        of 3: `e+3`
        of 4: `e+4`
        of 5: `e+5`
        of 6: `e+6`
    of f:
      case octave:
        of 1: `f+1`
        of 2: `f+2`
        of 3: `f+3`
        of 4: `f+4`
        of 5: `f+5`
        of 6: `f+6`
    of fx:
      case octave:
        of 1: `fx+1`
        of 2: `fx+2`
        of 3: `fx+3`
        of 4: `fx+4`
        of 5: `fx+5`
        of 6: `fx+6`
    of g:
      case octave:
        of 1: `g+1`
        of 2: `g+2`
        of 3: `g+3`
        of 4: `g+4`
        of 5: `g+5`
        of 6: `g+6`
    of gx:
      case octave:
        of 1: `gx+1`
        of 2: `gx+2`
        of 3: `gx+3`
        of 4: `gx+4`
        of 5: `gx+5`
        of 6: `gx+6`
    of a:
      case octave:
        of 1: `a+1`
        of 2: `a+2`
        of 3: `a+3`
        of 4: `a+4`
        of 5: `a+5`
        of 6: `a+6`
    of ax:
      case octave:
        of 1: `ax+1`
        of 2: `ax+2`
        of 3: `ax+3`
        of 4: `ax+4`
        of 5: `ax+5`
        of 6: `ax+6`
    of b:
      case octave:
        of 1: `b+1`
        of 2: `b+2`
        of 3: `b+3`
        of 4: `b+4`
        of 5: `b+5`
        of 6: `b+6`
    else:
      raise newException(Exception, $ note & " note cannot use +")

proc `-`*(note: Note, octave: range[1..6]): Note =
  case note:
    of c:
      case octave:
        of 1: `c-1`
        of 2: `c-2`
        of 3: `c-3`
        of 4: `c-4`
        of 5: `c-5`
        of 6: `c-6`
    of cx:
      case octave:
        of 1: `cx-1`
        of 2: `cx-2`
        of 3: `cx-3`
        of 4: `cx-4`
        of 5: `cx-5`
        of 6: `cx-6`
    of d:
      case octave:
        of 1: `d-1`
        of 2: `d-2`
        of 3: `d-3`
        of 4: `d-4`
        of 5: `d-5`
        of 6: `d-6`
    of dx:
      case octave:
        of 1: `dx-1`
        of 2: `dx-2`
        of 3: `dx-3`
        of 4: `dx-4`
        of 5: `dx-5`
        of 6: `dx-6`
    of e:
      case octave:
        of 1: `e-1`
        of 2: `e-2`
        of 3: `e-3`
        of 4: `e-4`
        of 5: `e-5`
        of 6: `e-6`
    of f:
      case octave:
        of 1: `f-1`
        of 2: `f-2`
        of 3: `f-3`
        of 4: `f-4`
        of 5: `f-5`
        of 6: `f-6`
    of fx:
      case octave:
        of 1: `fx-1`
        of 2: `fx-2`
        of 3: `fx-3`
        of 4: `fx-4`
        of 5: `fx-5`
        of 6: `fx-6`
    of g:
      case octave:
        of 1: `g-1`
        of 2: `g-2`
        of 3: `g-3`
        of 4: `g-4`
        of 5: `g-5`
        of 6: `g-6`
    of gx:
      case octave:
        of 1: `gx-1`
        of 2: `gx-2`
        of 3: `gx-3`
        of 4: `gx-4`
        of 5: `gx-5`
        of 6: `gx-6`
    of a:
      case octave:
        of 1: `a-1`
        of 2: `a-2`
        of 3: `a-3`
        of 4: `a-4`
        of 5: `a-5`
        of 6: `a-6`
    of ax:
      case octave:
        of 1: `ax-1`
        of 2: `ax-2`
        of 3: `ax-3`
        of 4: `ax-4`
        of 5: `ax-5`
        of 6: `ax-6`
    of b:
      case octave:
        of 1: `b-1`
        of 2: `b-2`
        of 3: `b-3`
        of 4: `b-4`
        of 5: `b-5`
        of 6: `b-6`
    else:
      raise newException(Exception, $ note & " note cannot use -")

proc compileContent(ctx: var Context, note: Note) =
  if not ctx.play:
    return
  if ctx.instrument == none and note != r:
    raise newException(Exception, $ note & " note cannot be played without an instrument")
  let
    realNote = getNote(note)
    octave = getOctave(ctx, note)
  ctx.events[].add(Event(
    kind: On,
    note: realNote,
    time: ctx.time,
    instrument: ctx.instrument,
    octave: octave,
    tempo: ctx.tempo,
  ))
  ctx.events[].add(Event(
    kind: Off,
    note: realNote,
    time: ctx.time + ctx.length,
    instrument: ctx.instrument,
    octave: octave,
    tempo: ctx.tempo,
  ))
  ctx.time += ctx.length

proc compileContent(ctx: var Context, chord: set[Note]) =
  if not ctx.play:
    return
  let time = ctx.time
  for note in chord:
    compileContent(ctx, note)
    ctx.time = time
  ctx.time += ctx.length

proc compileContent(ctx: var Context, instrument: Instrument) =
  ctx.instrument = instrument

proc setLength(ctx: var Context, length: float) =
  ctx.length = length

proc setLength(ctx: var Context, length: int) =
  ctx.length = length.float

proc setLength(ctx: var Context, length: BiggestInt) =
  ctx.length = length.float

proc compileContent(ctx: var Context, length: float | int | BiggestInt) =
  setLength(ctx, length)

proc compileContent(ctx: var Context, content: tuple) =
  var
    temp = ctx
    concurrent = false
    longestTime = ctx.time
  for k, v in content.fieldPairs:
    when k == "length":
      setLength(ctx, v)
    elif k == "octave":
      when v is RelativeOctave:
        ctx.octave = getOctave(ctx, v)
      else:
        ctx.octave = v
    elif k == "play":
      ctx.play = v
    elif k == "mode":
      ctx.mode = v
    elif k == "tempo":
      ctx.tempo = v
    else:
      let mode = temp.mode
      compileContent(temp, v)
      if mode != temp.mode and temp.mode == Mode.concurrent:
        concurrent = true
        temp.mode = Mode.sequential
      if concurrent:
        if temp.time > longestTime:
          longestTime = temp.time
        temp.time = ctx.time
  if concurrent:
    ctx.time = longestTime
  else:
    ctx.time = temp.time

proc compileContent(ctx: var Context, node: JsonNode) =
  case node.kind:
  of JString:
    if constants.noteSet.contains(node.str):
      compileContent(ctx, Note(constants.notes.find(node.str)))
    elif constants.instruments.contains(node.str):
      compileContent(ctx, Instrument(constants.instruments.find(node.str)))
    else:
      raise newException(Exception, "Invalid value: " & $node & " (expected a note or instrument)")
  of JInt:
    compileContent(ctx, node.num)
  of JFloat:
    compileContent(ctx, node.fnum)
  of JBool, JNull:
    raise newException(Exception, "Invalid value: " & $node)
  of JObject:
    for k, v in node:
      if k == "length":
        case v.kind:
        of JInt:
          setLength(ctx, v.num)
        of JFloat:
          setLength(ctx, v.fnum)
        else:
          raise newException(Exception, "Invalid length: " & $v)
      elif k == "octave":
        if v.kind == JInt:
          ctx.octave = v.num
        elif v.kind == JString:
          if constants.relativeOctaveSet.contains(v.str):
            ctx.octave = getOctave(ctx, RelativeOctave(constants.relativeOctaves.find(v.str)))
          else:
            raise newException(Exception, "Invalid relative octave: " & $v)
        else:
          raise newException(Exception, "Invalid octave: " & $v)
      elif k == "play":
        if v.kind == JBool:
          ctx.play = v.bval
        else:
          raise newException(Exception, "Invalid play: " & $v)
      elif k == "mode":
        if v.kind == JString and constants.modeSet.contains(v.str):
          ctx.mode = Mode(constants.modes.find(v.str))
        else:
          raise newException(Exception, "Invalid mode: " & $v)
      elif k == "tempo":
        if v.kind == JInt:
          ctx.tempo = v.num.int
        else:
          raise newException(Exception, "Invalid tempo: " & $v)
      else:
        raise newException(Exception, "Invalid attribute: " & k)
  of JArray:
    var
      temp = ctx
      concurrent = false
      longestTime = ctx.time
    for item in node:
      let mode = temp.mode
      compileContent(temp, item)
      if mode != temp.mode and temp.mode == Mode.concurrent:
        concurrent = true
        temp.mode = Mode.sequential
      if concurrent:
        if temp.time > longestTime:
          longestTime = temp.time
        temp.time = ctx.time
    if concurrent:
      ctx.time = longestTime
    else:
      ctx.time = temp.time

proc initContext*(): Context =
  result = Context(
    time: 0,
    instrument: none,
    octave: 4,
    length: 1/4,
    play: true,
    mode: sequential,
    tempo: 120,
  )
  new result.events

proc compile*(ctx: var Context, content: tuple | JsonNode): seq[Event] =
  compileContent(ctx, content)
  result = ctx.events[]
  algorithm.sort(result, proc (x, y: Event): int =
    if x.time < y.time:
      -1
    elif x.time > y.time:
      1
    else:
      0
  )
  # calculate the total time in seconds
  var lastTime = 0.0
  ctx.seconds = 0
  const
    minuteSecs = 60
    quarterNote = 1/4
  for event in result:
    case event.kind:
      of On:
        discard
      of Off:
        let
          noteLength = event.time - lastTime
          noteLengthSeconds = (minuteSecs / event.tempo) * (noteLength / quarterNote)
        lastTime = event.time
        ctx.seconds += noteLengthSeconds

proc compile*(content: tuple | JsonNode): seq[Event] =
  var ctx = initContext()
  compile(ctx, content)

proc render*[T: cshort](events: seq[Event], soundFont: ptr tsf, sampleRate: int): RenderResult[T] =
  var lastTime = 0.0
  const
    scaleCount = 12
    minuteSecs = 60
    quarterNote = 1/4
  for event in events:
    let note = cint(event.note.ord + event.octave.ord * scaleCount + scaleCount)
    case event.kind:
      of On:
        if event.note != r:
          tsf_note_on(soundFont, event.instrument.ord.cint, note, 1.0f)
      of Off:
        let
          currentSize = result.data.len
          noteLength = event.time - lastTime
          noteLengthSeconds = (minuteSecs / event.tempo) * (noteLength / quarterNote)
          numSamples = sampleRate.float * noteLengthSeconds
          newSize = currentSize + numSamples.int
        if noteLength > 0:
          result.data.setLen(newSize)
          when T is cshort:
            tsf_render_short(soundFont, result.data[currentSize].addr, numSamples.cint, 0)
        if event.note != r:
          tsf_note_off(soundFont, event.instrument.ord.cint, note)
        lastTime = event.time
        result.seconds += noteLengthSeconds
