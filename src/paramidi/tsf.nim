{.compile: "tsf.c".}

type tsf* = object

proc tsf_load_filename*(filename: cstring): ptr tsf {.cdecl, importc.}
##  Load a SoundFont from a block of memory

proc tsf_load_memory*(buffer: pointer; size: cint): ptr tsf {.cdecl, importc.}
##  Stream structure for the generic loading

type
  tsf_stream* {.bycopy.} = object
    data*: pointer             ##  Custom data given to the functions as the first parameter
    ##  Function pointer will be called to read 'size' bytes into ptr (returns number of read bytes)
    read*: proc (data: pointer; `ptr`: pointer; size: cuint): cint ##  Function pointer will be called to skip ahead over 'count' bytes (returns 1 on success, 0 on error)
    skip*: proc (data: pointer; count: cuint): cint


##  Generic SoundFont loading method using the stream structure above

proc tsf_load*(stream: ptr tsf_stream): ptr tsf {.cdecl, importc.}
##  Free the memory related to this tsf instance

proc tsf_close*(f: ptr tsf) {.cdecl, importc.}
##  Stop all playing notes immediatly and reset all channel parameters

proc tsf_reset*(f: ptr tsf) {.cdecl, importc.}
##  Returns the preset index from a bank and preset number, or -1 if it does not exist in the loaded SoundFont

proc tsf_get_presetindex*(f: ptr tsf; bank: cint; preset_number: cint): cint {.cdecl, importc.}
##  Returns the number of presets in the loaded SoundFont

proc tsf_get_presetcount*(f: ptr tsf): cint {.cdecl, importc.}
##  Returns the name of a preset index >= 0 and < tsf_get_presetcount()

proc tsf_get_presetname*(f: ptr tsf; preset_index: cint): cstring {.cdecl, importc.}
##  Returns the name of a preset by bank and preset number

proc tsf_bank_get_presetname*(f: ptr tsf; bank: cint; preset_number: cint): cstring {.cdecl, importc.}
##  Supported output modes by the render methods

type
  TSFOutputMode* = enum         ##  Two channels with single left/right samples one after another
    TSF_STEREO_INTERLEAVED,   ##  Two channels with all samples for the left channel first then right
    TSF_STEREO_UNWEAVED,      ##  A single channel (stereo instruments are mixed into center)
    TSF_MONO


##  Thread safety:
##  Your audio output which calls the tsf_render* functions will most likely
##  run on a different thread than where the playback tsf_note* functions
##  are called. In which case some sort of concurrency control like a
##  mutex needs to be used so they are not called at the same time.
##  Alternatively, you can pre-allocate a maximum number of voices that can
##  play simultaneously by calling tsf_set_max_voices after loading.
##  That way memory re-allocation will not happen during tsf_note_on and
##  TSF should become mostly thread safe.
##  There is a theoretical chance that ending notes would negatively influence
##  a voice that is rendering at the time but it is hard to say.
##  Also be aware, this has not been tested much.
##  Setup the parameters for the voice render methods
##    outputmode: if mono or stereo and how stereo channel data is ordered
##    samplerate: the number of samples per second (output frequency)
##    global_gain_db: volume gain in decibels (>0 means higher, <0 means lower)

proc tsf_set_output*(f: ptr tsf; outputmode: TSFOutputMode; samplerate: cint;
                    global_gain_db: cfloat) {.cdecl, importc.}
##  Set the global gain as a volume factor
##    global_gain: the desired volume where 1.0 is 100%

proc tsf_set_volume*(f: ptr tsf; global_gain: cfloat) {.cdecl, importc.}
##  Set the maximum number of voices to play simultaneously
##  Depending on the soundfond, one note can cause many new voices to be started,
##  so don't keep this number too low or otherwise sounds may not play.
##    max_voices: maximum number to pre-allocate and set the limit to

proc tsf_set_max_voices*(f: ptr tsf; max_voices: cint) {.cdecl, importc.}
##  Start playing a note
##    preset_index: preset index >= 0 and < tsf_get_presetcount()
##    key: note value between 0 and 127 (60 being middle C)
##    vel: velocity as a float between 0.0 (equal to note off) and 1.0 (full)
##    bank: instrument bank number (alternative to preset_index)
##    preset_number: preset number (alternative to preset_index)
##    (bank_note_on returns 0 if preset does not exist, otherwise 1)

proc tsf_note_on*(f: ptr tsf; preset_index: cint; key: cint; vel: cfloat) {.cdecl, importc.}
proc tsf_bank_note_on*(f: ptr tsf; bank: cint; preset_number: cint; key: cint; vel: cfloat): cint {.cdecl, importc.}
##  Stop playing a note
##    (bank_note_off returns 0 if preset does not exist, otherwise 1)

proc tsf_note_off*(f: ptr tsf; preset_index: cint; key: cint) {.cdecl, importc.}
proc tsf_bank_note_off*(f: ptr tsf; bank: cint; preset_number: cint; key: cint): cint {.cdecl, importc.}
##  Stop playing all notes (end with sustain and release)

proc tsf_note_off_all*(f: ptr tsf) {.cdecl, importc.}
##  Returns the number of active voices

proc tsf_active_voice_count*(f: ptr tsf): cint {.cdecl, importc.}
##  Render output samples into a buffer
##  You can either render as signed 16-bit values (tsf_render_short) or
##  as 32-bit float values (tsf_render_float)
##    buffer: target buffer of size samples * output_channels * sizeof(type)
##    samples: number of samples to render
##    flag_mixing: if 0 clear the buffer first, otherwise mix into existing data

proc tsf_render_short*(f: ptr tsf; buffer: ptr cshort; samples: cint; flag_mixing: cint) {.cdecl, importc.}
proc tsf_render_float*(f: ptr tsf; buffer: ptr cfloat; samples: cint; flag_mixing: cint) {.cdecl, importc.}
##  Higher level channel based functions, set up channel parameters
##    channel: channel number
##    preset_index: preset index >= 0 and < tsf_get_presetcount()
##    preset_number: preset number (alternative to preset_index)
##    flag_mididrums: 0 for normal channels, otherwise apply MIDI drum channel rules
##    bank: instrument bank number (alternative to preset_index)
##    pan: stereo panning value from 0.0 (left) to 1.0 (right) (default 0.5 center)
##    volume: linear volume scale factor (default 1.0 full)
##    pitch_wheel: pitch wheel position 0 to 16383 (default 8192 unpitched)
##    pitch_range: range of the pitch wheel in semitones (default 2.0, total +/- 2 semitones)
##    tuning: tuning of all playing voices in semitones (default 0.0, standard (A440) tuning)
##    (set_preset_number and set_bank_preset return 0 if preset does not exist, otherwise 1)

proc tsf_channel_set_presetindex*(f: ptr tsf; channel: cint; preset_index: cint) {.cdecl, importc.}
proc tsf_channel_set_presetnumber*(f: ptr tsf; channel: cint; preset_number: cint;
                                  flag_mididrums: cint): cint {.cdecl, importc.}
proc tsf_channel_set_bank*(f: ptr tsf; channel: cint; bank: cint) {.cdecl, importc.}
proc tsf_channel_set_bank_preset*(f: ptr tsf; channel: cint; bank: cint;
                                 preset_number: cint): cint {.cdecl, importc.}
proc tsf_channel_set_pan*(f: ptr tsf; channel: cint; pan: cfloat) {.cdecl, importc.}
proc tsf_channel_set_volume*(f: ptr tsf; channel: cint; volume: cfloat) {.cdecl, importc.}
proc tsf_channel_set_pitchwheel*(f: ptr tsf; channel: cint; pitch_wheel: cint) {.cdecl, importc.}
proc tsf_channel_set_pitchrange*(f: ptr tsf; channel: cint; pitch_range: cfloat) {.cdecl, importc.}
proc tsf_channel_set_tuning*(f: ptr tsf; channel: cint; tuning: cfloat) {.cdecl, importc.}
##  Start or stop playing notes on a channel (needs channel preset to be set)
##    channel: channel number
##    key: note value between 0 and 127 (60 being middle C)
##    vel: velocity as a float between 0.0 (equal to note off) and 1.0 (full)

proc tsf_channel_note_on*(f: ptr tsf; channel: cint; key: cint; vel: cfloat) {.cdecl, importc.}
proc tsf_channel_note_off*(f: ptr tsf; channel: cint; key: cint) {.cdecl, importc.}
proc tsf_channel_note_off_all*(f: ptr tsf; channel: cint) {.cdecl, importc.}
## end with sustain and release

proc tsf_channel_sounds_off_all*(f: ptr tsf; channel: cint) {.cdecl, importc.}
## end immediatly
##  Apply a MIDI control change to the channel (not all controllers are supported!)

proc tsf_channel_midi_control*(f: ptr tsf; channel: cint; controller: cint;
                              control_value: cint) {.cdecl, importc.}
##  Get current values set on the channels

proc tsf_channel_get_preset_index*(f: ptr tsf; channel: cint): cint {.cdecl, importc.}
proc tsf_channel_get_preset_bank*(f: ptr tsf; channel: cint): cint {.cdecl, importc.}
proc tsf_channel_get_preset_number*(f: ptr tsf; channel: cint): cint {.cdecl, importc.}
proc tsf_channel_get_pan*(f: ptr tsf; channel: cint): cfloat {.cdecl, importc.}
proc tsf_channel_get_volume*(f: ptr tsf; channel: cint): cfloat {.cdecl, importc.}
proc tsf_channel_get_pitchwheel*(f: ptr tsf; channel: cint): cint {.cdecl, importc.}
proc tsf_channel_get_pitchrange*(f: ptr tsf; channel: cint): cfloat {.cdecl, importc.}
proc tsf_channel_get_tuning*(f: ptr tsf; channel: cint): cfloat {.cdecl, importc.}
