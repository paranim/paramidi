from sequtils import nil
from algorithm import nil

type
  Note* = enum
    c, cx, d, dx, e, f, fx, g, gx, a, ax, b,
    r, # rest
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
  EventKind* = enum
    Single, On, Off,
  Event = object
    note*: Note
    time*: float
    instrument*: Instrument
    octave: range[1..7]
    case kind*: EventKind
      of Single:
        length*: float
      else:
        nil
  Context = object
    events: seq[Event]
    time: float
    instrument: Instrument
    octave: range[1..7]
    length: float

proc parse(ctx: var Context, note: Note) =
  if ctx.instrument == none:
    raise newException(Exception, $ note & " note cannot be played without an instrument")
  let event = Event(
    kind: Single,
    note: note,
    time: ctx.time,
    instrument: ctx.instrument,
    octave: ctx.octave,
    length: ctx.length,
  )
  ctx.events.add(event)
  ctx.time += ctx.length

proc parse(ctx: var Context, instrument: Instrument) =
  ctx.instrument = instrument

proc parse(ctx: var Context, t: tuple) =
  for k, v in t.fieldPairs:
    when k == "length":
      ctx.length =
        when v is int:
          v.float
        else:
          v
    else:
      parse(ctx, v)

proc splitEvents(events: var seq[Event]): seq[Event] =
  for event in events:
    var e1 = Event(
      kind: On,
      note: event.note,
      time: event.time,
      instrument: event.instrument,
      octave: event.octave,
    )
    var e2 = Event(
      kind: Off,
      note: event.note,
      time: event.time + event.length,
      instrument: event.instrument,
      octave: event.octave,
    )
    result.add(e1)
    result.add(e2)
  algorithm.sort(result, proc (x, y: Event): int =
    if x.time < y.time:
      -1
    elif x.time > y.time:
      1
    else:
      0
  )

proc parse*(content: tuple): seq[Event] =
  var ctx = Context(
    time: 0,
    instrument: none,
    octave: 4,
    length: 1/4,
  )
  parse(ctx, content)
  splitEvents(ctx.events)
