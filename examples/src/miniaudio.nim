{.compile: "miniaudio.c".}
{.push cdecl, importc.}

type
  ma_int8* = int8
  ma_uint8* = uint8
  ma_int16* = int16
  ma_uint16* = uint16
  ma_int32* = int32
  ma_uint32* = uint32
  ma_int64* = int64
  ma_uint64* = uint64
  ma_bool8* = ma_uint8
  ma_bool32* = ma_uint32
  ma_handle* = pointer
  ma_ptr* = pointer
  ma_proc* = proc () {.cdecl.}
  wchar_t* = ma_uint16
  ma_channel* = ma_uint8

const
  MA_CHANNEL_NONE* = 0
  MA_CHANNEL_MONO* = 1
  MA_CHANNEL_FRONT_LEFT* = 2
  MA_CHANNEL_FRONT_RIGHT* = 3
  MA_CHANNEL_FRONT_CENTER* = 4
  MA_CHANNEL_LFE* = 5
  MA_CHANNEL_BACK_LEFT* = 6
  MA_CHANNEL_BACK_RIGHT* = 7
  MA_CHANNEL_FRONT_LEFT_CENTER* = 8
  MA_CHANNEL_FRONT_RIGHT_CENTER* = 9
  MA_CHANNEL_BACK_CENTER* = 10
  MA_CHANNEL_SIDE_LEFT* = 11
  MA_CHANNEL_SIDE_RIGHT* = 12
  MA_CHANNEL_TOP_CENTER* = 13
  MA_CHANNEL_TOP_FRONT_LEFT* = 14
  MA_CHANNEL_TOP_FRONT_CENTER* = 15
  MA_CHANNEL_TOP_FRONT_RIGHT* = 16
  MA_CHANNEL_TOP_BACK_LEFT* = 17
  MA_CHANNEL_TOP_BACK_CENTER* = 18
  MA_CHANNEL_TOP_BACK_RIGHT* = 19
  MA_CHANNEL_AUX_0* = 20
  MA_CHANNEL_AUX_1* = 21
  MA_CHANNEL_AUX_2* = 22
  MA_CHANNEL_AUX_3* = 23
  MA_CHANNEL_AUX_4* = 24
  MA_CHANNEL_AUX_5* = 25
  MA_CHANNEL_AUX_6* = 26
  MA_CHANNEL_AUX_7* = 27
  MA_CHANNEL_AUX_8* = 28
  MA_CHANNEL_AUX_9* = 29
  MA_CHANNEL_AUX_10* = 30
  MA_CHANNEL_AUX_11* = 31
  MA_CHANNEL_AUX_12* = 32
  MA_CHANNEL_AUX_13* = 33
  MA_CHANNEL_AUX_14* = 34
  MA_CHANNEL_AUX_15* = 35
  MA_CHANNEL_AUX_16* = 36
  MA_CHANNEL_AUX_17* = 37
  MA_CHANNEL_AUX_18* = 38
  MA_CHANNEL_AUX_19* = 39
  MA_CHANNEL_AUX_20* = 40
  MA_CHANNEL_AUX_21* = 41
  MA_CHANNEL_AUX_22* = 42
  MA_CHANNEL_AUX_23* = 43
  MA_CHANNEL_AUX_24* = 44
  MA_CHANNEL_AUX_25* = 45
  MA_CHANNEL_AUX_26* = 46
  MA_CHANNEL_AUX_27* = 47
  MA_CHANNEL_AUX_28* = 48
  MA_CHANNEL_AUX_29* = 49
  MA_CHANNEL_AUX_30* = 50
  MA_CHANNEL_AUX_31* = 51
  MA_CHANNEL_LEFT* = MA_CHANNEL_FRONT_LEFT
  MA_CHANNEL_RIGHT* = MA_CHANNEL_FRONT_RIGHT
  MA_CHANNEL_POSITION_COUNT* = (MA_CHANNEL_AUX_31 + 1)

type
  ma_result* = cint

const
  MA_SUCCESS* = 0
  MA_ERROR* = -1
  MA_INVALID_ARGS* = -2
  MA_INVALID_OPERATION* = -3
  MA_OUT_OF_MEMORY* = -4
  MA_OUT_OF_RANGE* = -5
  MA_ACCESS_DENIED* = -6
  MA_DOES_NOT_EXIST* = -7
  MA_ALREADY_EXISTS* = -8
  MA_TOO_MANY_OPEN_FILES* = -9
  MA_INVALID_FILE* = -10
  MA_TOO_BIG* = -11
  MA_PATH_TOO_LONG* = -12
  MA_NAME_TOO_LONG* = -13
  MA_NOT_DIRECTORY* = -14
  MA_IS_DIRECTORY* = -15
  MA_DIRECTORY_NOT_EMPTY* = -16
  MA_END_OF_FILE* = -17
  MA_NO_SPACE* = -18
  MA_BUSY* = -19
  MA_IO_ERROR* = -20
  MA_INTERRUPT* = -21
  MA_UNAVAILABLE* = -22
  MA_ALREADY_IN_USE* = -23
  MA_BAD_ADDRESS* = -24
  MA_BAD_SEEK* = -25
  MA_BAD_PIPE* = -26
  MA_DEADLOCK* = -27
  MA_TOO_MANY_LINKS* = -28
  MA_NOT_IMPLEMENTED* = -29
  MA_NO_MESSAGE* = -30
  MA_BAD_MESSAGE* = -31
  MA_NO_DATA_AVAILABLE* = -32
  MA_INVALID_DATA* = -33
  MA_TIMEOUT* = -34
  MA_NO_NETWORK* = -35
  MA_NOT_UNIQUE* = -36
  MA_NOT_SOCKET* = -37
  MA_NO_ADDRESS* = -38
  MA_BAD_PROTOCOL* = -39
  MA_PROTOCOL_UNAVAILABLE* = -40
  MA_PROTOCOL_NOT_SUPPORTED* = -41
  MA_PROTOCOL_FAMILY_NOT_SUPPORTED* = -42
  MA_ADDRESS_FAMILY_NOT_SUPPORTED* = -43
  MA_SOCKET_NOT_SUPPORTED* = -44
  MA_CONNECTION_RESET* = -45
  MA_ALREADY_CONNECTED* = -46
  MA_NOT_CONNECTED* = -47
  MA_CONNECTION_REFUSED* = -48
  MA_NO_HOST* = -49
  MA_IN_PROGRESS* = -50
  MA_CANCELLED* = -51
  MA_MEMORY_ALREADY_MAPPED* = -52
  MA_AT_END* = -53

##  General miniaudio-specific errors.

const
  MA_FORMAT_NOT_SUPPORTED* = -100
  MA_DEVICE_TYPE_NOT_SUPPORTED* = -101
  MA_SHARE_MODE_NOT_SUPPORTED* = -102
  MA_NO_BACKEND* = -103
  MA_NO_DEVICE* = -104
  MA_API_NOT_FOUND* = -105
  MA_INVALID_DEVICE_CONFIG* = -106

##  State errors.

const
  MA_DEVICE_NOT_INITIALIZED* = -200
  MA_DEVICE_ALREADY_INITIALIZED* = -201
  MA_DEVICE_NOT_STARTED* = -202
  MA_DEVICE_NOT_STOPPED* = -203

##  Operation errors.

const
  MA_FAILED_TO_INIT_BACKEND* = -300
  MA_FAILED_TO_OPEN_BACKEND_DEVICE* = -301
  MA_FAILED_TO_START_BACKEND_DEVICE* = -302
  MA_FAILED_TO_STOP_BACKEND_DEVICE* = -303

##  Standard sample rates.

const
  MA_SAMPLE_RATE_8000* = 8000
  MA_SAMPLE_RATE_11025* = 11025
  MA_SAMPLE_RATE_16000* = 16000
  MA_SAMPLE_RATE_22050* = 22050
  MA_SAMPLE_RATE_24000* = 24000
  MA_SAMPLE_RATE_32000* = 32000
  MA_SAMPLE_RATE_44100* = 44100
  MA_SAMPLE_RATE_48000* = 48000
  MA_SAMPLE_RATE_88200* = 88200
  MA_SAMPLE_RATE_96000* = 96000
  MA_SAMPLE_RATE_176400* = 176400
  MA_SAMPLE_RATE_192000* = 192000
  MA_SAMPLE_RATE_352800* = 352800
  MA_SAMPLE_RATE_384000* = 384000
  MA_MIN_CHANNELS* = 1
  MA_MAX_CHANNELS* = 32
  MA_MAX_FILTER_ORDER* = 8

const
  MA_MIN_SAMPLE_RATE* = MA_SAMPLE_RATE_8000
  MA_MAX_SAMPLE_RATE* = MA_SAMPLE_RATE_384000

type ##
    ##     I like to keep these explicitly defined because they're used as a key into a lookup table. When items are
    ##     added to this, make sure there are no gaps and that they're added to the lookup table in ma_get_bytes_per_sample().
    ##
  ma_stream_format* = enum
    ma_stream_format_pcm = 0
  ma_stream_layout* = enum
    ma_stream_layout_interleaved = 0, ma_stream_layout_deinterleaved
  ma_dither_mode* = enum
    ma_dither_mode_none = 0, ma_dither_mode_rectangle, ma_dither_mode_triangle
  ma_format* = enum
    ma_format_unknown = 0,      ##  Mainly used for indicating an error, but also used as the default for the output format for decoders.
    ma_format_u8 = 1, ma_format_s16 = 2, ##  Seems to be the most widely supported format.
    ma_format_s24 = 3,          ##  Tightly packed. 3 bytes per sample.
    ma_format_s32 = 4, ma_format_f32 = 5, ma_format_count
  ma_channel_mix_mode* = enum
    ma_channel_mix_mode_rectangular = 0, ##  Simple averaging based on the plane(s) the channel is sitting on.
    ma_channel_mix_mode_simple, ##  Drop excess channels; zeroed out extra channels.
    ma_channel_mix_mode_custom_weights ##  Use custom weights specified in ma_channel_router_config.
  ma_standard_channel_map* = enum
    ma_standard_channel_map_microsoft, ma_standard_channel_map_alsa, ma_standard_channel_map_rfc3551, ##  Based off AIFF.
    ma_standard_channel_map_flac, ma_standard_channel_map_vorbis, ma_standard_channel_map_sound4, ##  FreeBSD's sound(4).
    ma_standard_channel_map_sndio ##  www.sndio.org/tips.html
  ma_performance_profile* = enum
    ma_performance_profile_low_latency = 0, ma_performance_profile_conservative
  ma_allocation_callbacks* {.bycopy.} = object
    pUserData*: pointer
    onMalloc*: proc (sz: csize; pUserData: pointer): pointer {.cdecl.}
    onRealloc*: proc (p: pointer; sz: csize; pUserData: pointer): pointer {.cdecl.}
    onFree*: proc (p: pointer; pUserData: pointer) {.cdecl.}

  ma_lcg* {.bycopy.} = object
    state*: ma_int32






const
  ma_channel_mix_mode_planar_blend = ma_channel_mix_mode_rectangular
  ma_channel_mix_mode_default = ma_channel_mix_mode_planar_blend

const
  ma_standard_channel_map_webaudio = ma_standard_channel_map_flac
  ma_standard_channel_map_default = ma_standard_channel_map_microsoft


when not defined(MA_NO_THREADING):
  ##  Thread priorties should be ordered such that the default priority of the worker thread is 0.
  type
    ma_thread_priority* = enum
      ma_thread_priority_idle = -5, ma_thread_priority_lowest = -4,
      ma_thread_priority_low = -3, ma_thread_priority_normal = -2,
      ma_thread_priority_high = -1, ma_thread_priority_highest = 0,
      ma_thread_priority_realtime = 1
    ma_spinlock* = cuchar
  const
    ma_thread_priority_default = ma_thread_priority_highest
  type
    ma_thread* = object
    ma_mutex* = object
    ma_event* = object
    ma_semaphore* = object

## Retrieves the version of miniaudio as separated integers. Each component can be NULL if it's not required.
##

proc ma_version*(pMajor: ptr ma_uint32; pMinor: ptr ma_uint32; pRevision: ptr ma_uint32)
##
## Retrieves the version of miniaudio as a string which can be useful for logging purposes.
##

proc ma_version_string*(): cstring
## *************************************************************************************************************************************************************
##
## Biquad Filtering
##
## ************************************************************************************************************************************************************

type
  ma_biquad_coefficient* {.bycopy.} = object {.union.}
    f32*: cfloat
    s32*: ma_int32

  ma_biquad_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    b0*: cdouble
    b1*: cdouble
    b2*: cdouble
    a0*: cdouble
    a1*: cdouble
    a2*: cdouble


proc ma_biquad_config_init*(format: ma_format; channels: ma_uint32; b0: cdouble;
                           b1: cdouble; b2: cdouble; a0: cdouble; a1: cdouble;
                           a2: cdouble): ma_biquad_config
type
  ma_biquad* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    b0*: ma_biquad_coefficient
    b1*: ma_biquad_coefficient
    b2*: ma_biquad_coefficient
    a1*: ma_biquad_coefficient
    a2*: ma_biquad_coefficient
    r1*: array[MA_MAX_CHANNELS, ma_biquad_coefficient]
    r2*: array[MA_MAX_CHANNELS, ma_biquad_coefficient]


proc ma_biquad_init*(pConfig: ptr ma_biquad_config; pBQ: ptr ma_biquad): ma_result
proc ma_biquad_reinit*(pConfig: ptr ma_biquad_config; pBQ: ptr ma_biquad): ma_result
proc ma_biquad_process_pcm_frames*(pBQ: ptr ma_biquad; pFramesOut: pointer;
                                  pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_biquad_get_latency*(pBQ: ptr ma_biquad): ma_uint32
## *************************************************************************************************************************************************************
##
## Low-Pass Filtering
##
## ************************************************************************************************************************************************************

type
  ma_lpf1_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    cutoffFrequency*: cdouble
    q*: cdouble

  ma_lpf2_config* = ma_lpf1_config

proc ma_lpf1_config_init*(format: ma_format; channels: ma_uint32;
                         sampleRate: ma_uint32; cutoffFrequency: cdouble): ma_lpf1_config
proc ma_lpf2_config_init*(format: ma_format; channels: ma_uint32;
                         sampleRate: ma_uint32; cutoffFrequency: cdouble; q: cdouble): ma_lpf2_config
type
  ma_lpf1* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    a*: ma_biquad_coefficient
    r1*: array[MA_MAX_CHANNELS, ma_biquad_coefficient]


proc ma_lpf1_init*(pConfig: ptr ma_lpf1_config; pLPF: ptr ma_lpf1): ma_result
proc ma_lpf1_reinit*(pConfig: ptr ma_lpf1_config; pLPF: ptr ma_lpf1): ma_result
proc ma_lpf1_process_pcm_frames*(pLPF: ptr ma_lpf1; pFramesOut: pointer;
                                pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_lpf1_get_latency*(pLPF: ptr ma_lpf1): ma_uint32
type
  ma_lpf2* {.bycopy.} = object
    bq*: ma_biquad             ##  The second order low-pass filter is implemented as a biquad filter.


proc ma_lpf2_init*(pConfig: ptr ma_lpf2_config; pLPF: ptr ma_lpf2): ma_result
proc ma_lpf2_reinit*(pConfig: ptr ma_lpf2_config; pLPF: ptr ma_lpf2): ma_result
proc ma_lpf2_process_pcm_frames*(pLPF: ptr ma_lpf2; pFramesOut: pointer;
                                pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_lpf2_get_latency*(pLPF: ptr ma_lpf2): ma_uint32
type
  ma_lpf_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    cutoffFrequency*: cdouble
    order*: ma_uint32          ##  If set to 0, will be treated as a passthrough (no filtering will be applied).


proc ma_lpf_config_init*(format: ma_format; channels: ma_uint32;
                        sampleRate: ma_uint32; cutoffFrequency: cdouble;
                        order: ma_uint32): ma_lpf_config
type
  ma_lpf* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    lpf1Count*: ma_uint32
    lpf2Count*: ma_uint32
    lpf1*: array[1, ma_lpf1]
    lpf2*: array[MA_MAX_FILTER_ORDER div 2, ma_lpf2]


proc ma_lpf_init*(pConfig: ptr ma_lpf_config; pLPF: ptr ma_lpf): ma_result
proc ma_lpf_reinit*(pConfig: ptr ma_lpf_config; pLPF: ptr ma_lpf): ma_result
proc ma_lpf_process_pcm_frames*(pLPF: ptr ma_lpf; pFramesOut: pointer;
                               pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_lpf_get_latency*(pLPF: ptr ma_lpf): ma_uint32
## *************************************************************************************************************************************************************
##
## High-Pass Filtering
##
## ************************************************************************************************************************************************************

type
  ma_hpf1_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    cutoffFrequency*: cdouble
    q*: cdouble

  ma_hpf2_config* = ma_hpf1_config

proc ma_hpf1_config_init*(format: ma_format; channels: ma_uint32;
                         sampleRate: ma_uint32; cutoffFrequency: cdouble): ma_hpf1_config
proc ma_hpf2_config_init*(format: ma_format; channels: ma_uint32;
                         sampleRate: ma_uint32; cutoffFrequency: cdouble; q: cdouble): ma_hpf2_config
type
  ma_hpf1* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    a*: ma_biquad_coefficient
    r1*: array[MA_MAX_CHANNELS, ma_biquad_coefficient]


proc ma_hpf1_init*(pConfig: ptr ma_hpf1_config; pHPF: ptr ma_hpf1): ma_result
proc ma_hpf1_reinit*(pConfig: ptr ma_hpf1_config; pHPF: ptr ma_hpf1): ma_result
proc ma_hpf1_process_pcm_frames*(pHPF: ptr ma_hpf1; pFramesOut: pointer;
                                pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_hpf1_get_latency*(pHPF: ptr ma_hpf1): ma_uint32
type
  ma_hpf2* {.bycopy.} = object
    bq*: ma_biquad             ##  The second order high-pass filter is implemented as a biquad filter.


proc ma_hpf2_init*(pConfig: ptr ma_hpf2_config; pHPF: ptr ma_hpf2): ma_result
proc ma_hpf2_reinit*(pConfig: ptr ma_hpf2_config; pHPF: ptr ma_hpf2): ma_result
proc ma_hpf2_process_pcm_frames*(pHPF: ptr ma_hpf2; pFramesOut: pointer;
                                pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_hpf2_get_latency*(pHPF: ptr ma_hpf2): ma_uint32
type
  ma_hpf_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    cutoffFrequency*: cdouble
    order*: ma_uint32          ##  If set to 0, will be treated as a passthrough (no filtering will be applied).


proc ma_hpf_config_init*(format: ma_format; channels: ma_uint32;
                        sampleRate: ma_uint32; cutoffFrequency: cdouble;
                        order: ma_uint32): ma_hpf_config
type
  ma_hpf* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    hpf1Count*: ma_uint32
    hpf2Count*: ma_uint32
    hpf1*: array[1, ma_hpf1]
    hpf2*: array[MA_MAX_FILTER_ORDER div 2, ma_hpf2]


proc ma_hpf_init*(pConfig: ptr ma_hpf_config; pHPF: ptr ma_hpf): ma_result
proc ma_hpf_reinit*(pConfig: ptr ma_hpf_config; pHPF: ptr ma_hpf): ma_result
proc ma_hpf_process_pcm_frames*(pHPF: ptr ma_hpf; pFramesOut: pointer;
                               pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_hpf_get_latency*(pHPF: ptr ma_hpf): ma_uint32
## *************************************************************************************************************************************************************
##
## Band-Pass Filtering
##
## ************************************************************************************************************************************************************

type
  ma_bpf2_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    cutoffFrequency*: cdouble
    q*: cdouble


proc ma_bpf2_config_init*(format: ma_format; channels: ma_uint32;
                         sampleRate: ma_uint32; cutoffFrequency: cdouble; q: cdouble): ma_bpf2_config
type
  ma_bpf2* {.bycopy.} = object
    bq*: ma_biquad             ##  The second order band-pass filter is implemented as a biquad filter.


proc ma_bpf2_init*(pConfig: ptr ma_bpf2_config; pBPF: ptr ma_bpf2): ma_result
proc ma_bpf2_reinit*(pConfig: ptr ma_bpf2_config; pBPF: ptr ma_bpf2): ma_result
proc ma_bpf2_process_pcm_frames*(pBPF: ptr ma_bpf2; pFramesOut: pointer;
                                pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_bpf2_get_latency*(pBPF: ptr ma_bpf2): ma_uint32
type
  ma_bpf_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    cutoffFrequency*: cdouble
    order*: ma_uint32          ##  If set to 0, will be treated as a passthrough (no filtering will be applied).


proc ma_bpf_config_init*(format: ma_format; channels: ma_uint32;
                        sampleRate: ma_uint32; cutoffFrequency: cdouble;
                        order: ma_uint32): ma_bpf_config
type
  ma_bpf* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    bpf2Count*: ma_uint32
    bpf2*: array[MA_MAX_FILTER_ORDER div 2, ma_bpf2]


proc ma_bpf_init*(pConfig: ptr ma_bpf_config; pBPF: ptr ma_bpf): ma_result
proc ma_bpf_reinit*(pConfig: ptr ma_bpf_config; pBPF: ptr ma_bpf): ma_result
proc ma_bpf_process_pcm_frames*(pBPF: ptr ma_bpf; pFramesOut: pointer;
                               pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_bpf_get_latency*(pBPF: ptr ma_bpf): ma_uint32
## *************************************************************************************************************************************************************
##
## Notching Filter
##
## ************************************************************************************************************************************************************

type
  ma_notch2_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    q*: cdouble
    frequency*: cdouble


proc ma_notch2_config_init*(format: ma_format; channels: ma_uint32;
                           sampleRate: ma_uint32; q: cdouble; frequency: cdouble): ma_notch2_config
type
  ma_notch2* {.bycopy.} = object
    bq*: ma_biquad


proc ma_notch2_init*(pConfig: ptr ma_notch2_config; pFilter: ptr ma_notch2): ma_result
proc ma_notch2_reinit*(pConfig: ptr ma_notch2_config; pFilter: ptr ma_notch2): ma_result
proc ma_notch2_process_pcm_frames*(pFilter: ptr ma_notch2; pFramesOut: pointer;
                                  pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_notch2_get_latency*(pFilter: ptr ma_notch2): ma_uint32
## *************************************************************************************************************************************************************
##
## Peaking EQ Filter
##
## ************************************************************************************************************************************************************

type
  ma_peak2_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    gainDB*: cdouble
    q*: cdouble
    frequency*: cdouble


proc ma_peak2_config_init*(format: ma_format; channels: ma_uint32;
                          sampleRate: ma_uint32; gainDB: cdouble; q: cdouble;
                          frequency: cdouble): ma_peak2_config
type
  ma_peak2* {.bycopy.} = object
    bq*: ma_biquad


proc ma_peak2_init*(pConfig: ptr ma_peak2_config; pFilter: ptr ma_peak2): ma_result
proc ma_peak2_reinit*(pConfig: ptr ma_peak2_config; pFilter: ptr ma_peak2): ma_result
proc ma_peak2_process_pcm_frames*(pFilter: ptr ma_peak2; pFramesOut: pointer;
                                 pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_peak2_get_latency*(pFilter: ptr ma_peak2): ma_uint32
## *************************************************************************************************************************************************************
##
## Low Shelf Filter
##
## ************************************************************************************************************************************************************

type
  ma_loshelf2_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    gainDB*: cdouble
    shelfSlope*: cdouble
    frequency*: cdouble


proc ma_loshelf2_config_init*(format: ma_format; channels: ma_uint32;
                             sampleRate: ma_uint32; gainDB: cdouble;
                             shelfSlope: cdouble; frequency: cdouble): ma_loshelf2_config
type
  ma_loshelf2* {.bycopy.} = object
    bq*: ma_biquad


proc ma_loshelf2_init*(pConfig: ptr ma_loshelf2_config; pFilter: ptr ma_loshelf2): ma_result
proc ma_loshelf2_reinit*(pConfig: ptr ma_loshelf2_config; pFilter: ptr ma_loshelf2): ma_result
proc ma_loshelf2_process_pcm_frames*(pFilter: ptr ma_loshelf2; pFramesOut: pointer;
                                    pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_loshelf2_get_latency*(pFilter: ptr ma_loshelf2): ma_uint32
## *************************************************************************************************************************************************************
##
## High Shelf Filter
##
## ************************************************************************************************************************************************************

type
  ma_hishelf2_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    gainDB*: cdouble
    shelfSlope*: cdouble
    frequency*: cdouble


proc ma_hishelf2_config_init*(format: ma_format; channels: ma_uint32;
                             sampleRate: ma_uint32; gainDB: cdouble;
                             shelfSlope: cdouble; frequency: cdouble): ma_hishelf2_config
type
  ma_hishelf2* {.bycopy.} = object
    bq*: ma_biquad


proc ma_hishelf2_init*(pConfig: ptr ma_hishelf2_config; pFilter: ptr ma_hishelf2): ma_result
proc ma_hishelf2_reinit*(pConfig: ptr ma_hishelf2_config; pFilter: ptr ma_hishelf2): ma_result
proc ma_hishelf2_process_pcm_frames*(pFilter: ptr ma_hishelf2; pFramesOut: pointer;
                                    pFramesIn: pointer; frameCount: ma_uint64): ma_result
proc ma_hishelf2_get_latency*(pFilter: ptr ma_hishelf2): ma_uint32
## ***********************************************************************************************************************************************************
## ************************************************************************************************************************************************************
##
## DATA CONVERSION
## ===============
##
## This section contains the APIs for data conversion. You will find everything here for channel mapping, sample format conversion, resampling, etc.
##
## ************************************************************************************************************************************************************
## **********************************************************************************************************************************************************
## *************************************************************************************************************************************************************
##
## Resampling
##
## ************************************************************************************************************************************************************

type
  ma_linear_resampler_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sampleRateIn*: ma_uint32
    sampleRateOut*: ma_uint32
    lpfOrder*: ma_uint32       ##  The low-pass filter order. Setting this to 0 will disable low-pass filtering.
    lpfNyquistFactor*: cdouble ##  0..1. Defaults to 1. 1 = Half the sampling frequency (Nyquist Frequency), 0.5 = Quarter the sampling frequency (half Nyquest Frequency), etc.


proc ma_linear_resampler_config_init*(format: ma_format; channels: ma_uint32;
                                     sampleRateIn: ma_uint32;
                                     sampleRateOut: ma_uint32): ma_linear_resampler_config
type
  ma_linear_resampler* = object


proc ma_linear_resampler_init*(pConfig: ptr ma_linear_resampler_config;
                              pResampler: ptr ma_linear_resampler): ma_result
proc ma_linear_resampler_uninit*(pResampler: ptr ma_linear_resampler)
proc ma_linear_resampler_process_pcm_frames*(pResampler: ptr ma_linear_resampler;
    pFramesIn: pointer; pFrameCountIn: ptr ma_uint64; pFramesOut: pointer;
    pFrameCountOut: ptr ma_uint64): ma_result
proc ma_linear_resampler_set_rate*(pResampler: ptr ma_linear_resampler;
                                  sampleRateIn: ma_uint32;
                                  sampleRateOut: ma_uint32): ma_result
proc ma_linear_resampler_set_rate_ratio*(pResampler: ptr ma_linear_resampler;
                                        ratioInOut: cfloat): ma_result
proc ma_linear_resampler_get_required_input_frame_count*(
    pResampler: ptr ma_linear_resampler; outputFrameCount: ma_uint64): ma_uint64
proc ma_linear_resampler_get_expected_output_frame_count*(
    pResampler: ptr ma_linear_resampler; inputFrameCount: ma_uint64): ma_uint64
proc ma_linear_resampler_get_input_latency*(pResampler: ptr ma_linear_resampler): ma_uint64
proc ma_linear_resampler_get_output_latency*(pResampler: ptr ma_linear_resampler): ma_uint64
type
  ma_resample_algorithm* = enum
    ma_resample_algorithm_linear = 0, ##  Fastest, lowest quality. Optional low-pass filtering. Default.
    ma_resample_algorithm_speex
  ma_resampler_config* = object



proc ma_resampler_config_init*(format: ma_format; channels: ma_uint32;
                              sampleRateIn: ma_uint32; sampleRateOut: ma_uint32;
                              algorithm: ma_resample_algorithm): ma_resampler_config
type
  ma_resampler* = object


##
## Initializes a new resampler object from a config.
##

proc ma_resampler_init*(pConfig: ptr ma_resampler_config;
                       pResampler: ptr ma_resampler): ma_result
##
## Uninitializes a resampler.
##

proc ma_resampler_uninit*(pResampler: ptr ma_resampler)
##
## Converts the given input data.
##
## Both the input and output frames must be in the format specified in the config when the resampler was initilized.
##
## On input, [pFrameCountOut] contains the number of output frames to process. On output it contains the number of output frames that
## were actually processed, which may be less than the requested amount which will happen if there's not enough input data. You can use
## ma_resampler_get_expected_output_frame_count() to know how many output frames will be processed for a given number of input frames.
##
## On input, [pFrameCountIn] contains the number of input frames contained in [pFramesIn]. On output it contains the number of whole
## input frames that were actually processed. You can use ma_resampler_get_required_input_frame_count() to know how many input frames
## you should provide for a given number of output frames. [pFramesIn] can be NULL, in which case zeroes will be used instead.
##
## If [pFramesOut] is NULL, a seek is performed. In this case, if [pFrameCountOut] is not NULL it will seek by the specified number of
## output frames. Otherwise, if [pFramesCountOut] is NULL and [pFrameCountIn] is not NULL, it will seek by the specified number of input
## frames. When seeking, [pFramesIn] is allowed to NULL, in which case the internal timing state will be updated, but no input will be
## processed. In this case, any internal filter state will be updated as if zeroes were passed in.
##
## It is an error for [pFramesOut] to be non-NULL and [pFrameCountOut] to be NULL.
##
## It is an error for both [pFrameCountOut] and [pFrameCountIn] to be NULL.
##

proc ma_resampler_process_pcm_frames*(pResampler: ptr ma_resampler;
                                     pFramesIn: pointer;
                                     pFrameCountIn: ptr ma_uint64;
                                     pFramesOut: pointer;
                                     pFrameCountOut: ptr ma_uint64): ma_result
##
## Sets the input and output sample sample rate.
##

proc ma_resampler_set_rate*(pResampler: ptr ma_resampler; sampleRateIn: ma_uint32;
                           sampleRateOut: ma_uint32): ma_result
##
## Sets the input and output sample rate as a ratio.
##
## The ration is in/out.
##

proc ma_resampler_set_rate_ratio*(pResampler: ptr ma_resampler; ratio: cfloat): ma_result
##
## Calculates the number of whole input frames that would need to be read from the client in order to output the specified
## number of output frames.
##
## The returned value does not include cached input frames. It only returns the number of extra frames that would need to be
## read from the input buffer in order to output the specified number of output frames.
##

proc ma_resampler_get_required_input_frame_count*(pResampler: ptr ma_resampler;
    outputFrameCount: ma_uint64): ma_uint64
##
## Calculates the number of whole output frames that would be output after fully reading and consuming the specified number of
## input frames.
##

proc ma_resampler_get_expected_output_frame_count*(pResampler: ptr ma_resampler;
    inputFrameCount: ma_uint64): ma_uint64
##
## Retrieves the latency introduced by the resampler in input frames.
##

proc ma_resampler_get_input_latency*(pResampler: ptr ma_resampler): ma_uint64
##
## Retrieves the latency introduced by the resampler in output frames.
##

proc ma_resampler_get_output_latency*(pResampler: ptr ma_resampler): ma_uint64
## *************************************************************************************************************************************************************
##
## Channel Conversion
##
## ************************************************************************************************************************************************************

type
  ma_channel_converter_config* {.bycopy.} = object
    format*: ma_format
    channelsIn*: ma_uint32
    channelsOut*: ma_uint32
    channelMapIn*: array[MA_MAX_CHANNELS, ma_channel]
    channelMapOut*: array[MA_MAX_CHANNELS, ma_channel]
    mixingMode*: ma_channel_mix_mode
    weights*: array[MA_MAX_CHANNELS, array[MA_MAX_CHANNELS, cfloat]] ##  [in][out]. Only used when mixingMode is set to ma_channel_mix_mode_custom_weights.


proc ma_channel_converter_config_init*(format: ma_format; channelsIn: ma_uint32;
                                      pChannelMapIn: ptr ma_channel;
                                      channelsOut: ma_uint32;
                                      pChannelMapOut: ptr ma_channel;
                                      mixingMode: ma_channel_mix_mode): ma_channel_converter_config
type
  ma_channel_converter* = object


proc ma_channel_converter_init*(pConfig: ptr ma_channel_converter_config;
                               pConverter: ptr ma_channel_converter): ma_result
proc ma_channel_converter_uninit*(pConverter: ptr ma_channel_converter)
proc ma_channel_converter_process_pcm_frames*(
    pConverter: ptr ma_channel_converter; pFramesOut: pointer; pFramesIn: pointer;
    frameCount: ma_uint64): ma_result
## *************************************************************************************************************************************************************
##
## Data Conversion
##
## ************************************************************************************************************************************************************

type
  ma_data_converter_config* = object


proc ma_data_converter_config_init_default*(): ma_data_converter_config
proc ma_data_converter_config_init*(formatIn: ma_format; formatOut: ma_format;
                                   channelsIn: ma_uint32; channelsOut: ma_uint32;
                                   sampleRateIn: ma_uint32;
                                   sampleRateOut: ma_uint32): ma_data_converter_config
type
  ma_data_converter* {.bycopy.} = object
    config*: ma_data_converter_config
    channelConverter*: ma_channel_converter
    resampler*: ma_resampler
    hasPreFormatConversion* {.bitsize: 1.}: ma_bool32
    hasPostFormatConversion* {.bitsize: 1.}: ma_bool32
    hasChannelConverter* {.bitsize: 1.}: ma_bool32
    hasResampler* {.bitsize: 1.}: ma_bool32
    isPassthrough* {.bitsize: 1.}: ma_bool32


proc ma_data_converter_init*(pConfig: ptr ma_data_converter_config;
                            pConverter: ptr ma_data_converter): ma_result
proc ma_data_converter_uninit*(pConverter: ptr ma_data_converter)
proc ma_data_converter_process_pcm_frames*(pConverter: ptr ma_data_converter;
    pFramesIn: pointer; pFrameCountIn: ptr ma_uint64; pFramesOut: pointer;
    pFrameCountOut: ptr ma_uint64): ma_result
proc ma_data_converter_set_rate*(pConverter: ptr ma_data_converter;
                                sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result
proc ma_data_converter_set_rate_ratio*(pConverter: ptr ma_data_converter;
                                      ratioInOut: cfloat): ma_result
proc ma_data_converter_get_required_input_frame_count*(
    pConverter: ptr ma_data_converter; outputFrameCount: ma_uint64): ma_uint64
proc ma_data_converter_get_expected_output_frame_count*(
    pConverter: ptr ma_data_converter; inputFrameCount: ma_uint64): ma_uint64
proc ma_data_converter_get_input_latency*(pConverter: ptr ma_data_converter): ma_uint64
proc ma_data_converter_get_output_latency*(pConverter: ptr ma_data_converter): ma_uint64
## ***********************************************************************************************************************************************************
##
## Format Conversion
##
## **********************************************************************************************************************************************************

proc ma_pcm_u8_to_s16*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_u8_to_s24*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_u8_to_s32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_u8_to_f32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_s16_to_u8*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_s16_to_s24*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s16_to_s32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s16_to_f32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s24_to_u8*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_s24_to_s16*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s24_to_s32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s24_to_f32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s32_to_u8*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_s32_to_s16*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s32_to_s24*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_s32_to_f32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_f32_to_u8*(pOut: pointer; pIn: pointer; count: ma_uint64;
                      ditherMode: ma_dither_mode)
proc ma_pcm_f32_to_s16*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_f32_to_s24*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_f32_to_s32*(pOut: pointer; pIn: pointer; count: ma_uint64;
                       ditherMode: ma_dither_mode)
proc ma_pcm_convert*(pOut: pointer; formatOut: ma_format; pIn: pointer;
                    formatIn: ma_format; sampleCount: ma_uint64;
                    ditherMode: ma_dither_mode)
proc ma_convert_pcm_frames_format*(pOut: pointer; formatOut: ma_format; pIn: pointer;
                                  formatIn: ma_format; frameCount: ma_uint64;
                                  channels: ma_uint32; ditherMode: ma_dither_mode)
##
## Deinterleaves an interleaved buffer.
##

proc ma_deinterleave_pcm_frames*(format: ma_format; channels: ma_uint32;
                                frameCount: ma_uint64;
                                pInterleavedPCMFrames: pointer;
                                ppDeinterleavedPCMFrames: ptr pointer)
##
## Interleaves a group of deinterleaved buffers.
##

proc ma_interleave_pcm_frames*(format: ma_format; channels: ma_uint32;
                              frameCount: ma_uint64;
                              ppDeinterleavedPCMFrames: ptr pointer;
                              pInterleavedPCMFrames: pointer)
## ***********************************************************************************************************************************************************
##
## Channel Maps
##
## **********************************************************************************************************************************************************
##
## Helper for retrieving a standard channel map.
##
## The output channel map buffer must have a capacity of at least `channels`.
##

proc ma_get_standard_channel_map*(standardChannelMap: ma_standard_channel_map;
                                 channels: ma_uint32; pChannelMap: ptr ma_channel)
##
## Copies a channel map.
##
## Both input and output channel map buffers must have a capacity of at at least `channels`.
##

proc ma_channel_map_copy*(pOut: ptr ma_channel; pIn: ptr ma_channel;
                         channels: ma_uint32)
##
## Determines whether or not a channel map is valid.
##
## A blank channel map is valid (all channels set to MA_CHANNEL_NONE). The way a blank channel map is handled is context specific, but
## is usually treated as a passthrough.
##
## Invalid channel maps:
##   - A channel map with no channels
##   - A channel map with more than one channel and a mono channel
##
## The channel map buffer must have a capacity of at least `channels`.
##

proc ma_channel_map_valid*(channels: ma_uint32; pChannelMap: ptr ma_channel): ma_bool32
##
## Helper for comparing two channel maps for equality.
##
## This assumes the channel count is the same between the two.
##
## Both channels map buffers must have a capacity of at least `channels`.
##

proc ma_channel_map_equal*(channels: ma_uint32; pChannelMapA: ptr ma_channel;
                          pChannelMapB: ptr ma_channel): ma_bool32
##
## Helper for determining if a channel map is blank (all channels set to MA_CHANNEL_NONE).
##
## The channel map buffer must have a capacity of at least `channels`.
##

proc ma_channel_map_blank*(channels: ma_uint32; pChannelMap: ptr ma_channel): ma_bool32
##
## Helper for determining whether or not a channel is present in the given channel map.
##
## The channel map buffer must have a capacity of at least `channels`.
##

proc ma_channel_map_contains_channel_position*(channels: ma_uint32;
    pChannelMap: ptr ma_channel; channelPosition: ma_channel): ma_bool32
## ***********************************************************************************************************************************************************
##
## Conversion Helpers
##
## **********************************************************************************************************************************************************
##
## High-level helper for doing a full format conversion in one go. Returns the number of output frames. Call this with pOut set to NULL to
## determine the required size of the output buffer. frameCountOut should be set to the capacity of pOut. If pOut is NULL, frameCountOut is
## ignored.
##
## A return value of 0 indicates an error.
##
## This function is useful for one-off bulk conversions, but if you're streaming data you should use the ma_data_converter APIs instead.
##

proc ma_convert_frames*(pOut: pointer; frameCountOut: ma_uint64;
                       formatOut: ma_format; channelsOut: ma_uint32;
                       sampleRateOut: ma_uint32; pIn: pointer;
                       frameCountIn: ma_uint64; formatIn: ma_format;
                       channelsIn: ma_uint32; sampleRateIn: ma_uint32): ma_uint64
proc ma_convert_frames_ex*(pOut: pointer; frameCountOut: ma_uint64; pIn: pointer;
                          frameCountIn: ma_uint64;
                          pConfig: ptr ma_data_converter_config): ma_uint64
## ***********************************************************************************************************************************************************
##
## Ring Buffer
##
## **********************************************************************************************************************************************************

type
  ma_rb* {.bycopy.} = object
    pBuffer*: pointer
    subbufferSizeInBytes*: ma_uint32
    subbufferCount*: ma_uint32
    subbufferStrideInBytes*: ma_uint32
    encodedReadOffset*: ma_uint32 ##  Most significant bit is the loop flag. Lower 31 bits contains the actual offset in bytes.
    encodedWriteOffset*: ma_uint32 ##  Most significant bit is the loop flag. Lower 31 bits contains the actual offset in bytes.
    ownsBuffer* {.bitsize: 1.}: ma_bool32 ##  Used to know whether or not miniaudio is responsible for free()-ing the buffer.
    clearOnWriteAcquire* {.bitsize: 1.}: ma_bool32 ##  When set, clears the acquired write buffer before returning from ma_rb_acquire_write().
    allocationCallbacks*: ma_allocation_callbacks


proc ma_rb_init_ex*(subbufferSizeInBytes: csize; subbufferCount: csize;
                   subbufferStrideInBytes: csize;
                   pOptionalPreallocatedBuffer: pointer;
                   pAllocationCallbacks: ptr ma_allocation_callbacks;
                   pRB: ptr ma_rb): ma_result
proc ma_rb_init*(bufferSizeInBytes: csize; pOptionalPreallocatedBuffer: pointer;
                pAllocationCallbacks: ptr ma_allocation_callbacks; pRB: ptr ma_rb): ma_result
proc ma_rb_uninit*(pRB: ptr ma_rb)
proc ma_rb_reset*(pRB: ptr ma_rb)
proc ma_rb_acquire_read*(pRB: ptr ma_rb; pSizeInBytes: ptr csize;
                        ppBufferOut: ptr pointer): ma_result
proc ma_rb_commit_read*(pRB: ptr ma_rb; sizeInBytes: csize; pBufferOut: pointer): ma_result
proc ma_rb_acquire_write*(pRB: ptr ma_rb; pSizeInBytes: ptr csize;
                         ppBufferOut: ptr pointer): ma_result
proc ma_rb_commit_write*(pRB: ptr ma_rb; sizeInBytes: csize; pBufferOut: pointer): ma_result
proc ma_rb_seek_read*(pRB: ptr ma_rb; offsetInBytes: csize): ma_result
proc ma_rb_seek_write*(pRB: ptr ma_rb; offsetInBytes: csize): ma_result
proc ma_rb_pointer_distance*(pRB: ptr ma_rb): ma_int32
##  Returns the distance between the write pointer and the read pointer. Should never be negative for a correct program. Will return the number of bytes that can be read before the read pointer hits the write pointer.

proc ma_rb_available_read*(pRB: ptr ma_rb): ma_uint32
proc ma_rb_available_write*(pRB: ptr ma_rb): ma_uint32
proc ma_rb_get_subbuffer_size*(pRB: ptr ma_rb): csize
proc ma_rb_get_subbuffer_stride*(pRB: ptr ma_rb): csize
proc ma_rb_get_subbuffer_offset*(pRB: ptr ma_rb; subbufferIndex: csize): csize
proc ma_rb_get_subbuffer_ptr*(pRB: ptr ma_rb; subbufferIndex: csize; pBuffer: pointer): pointer
type
  ma_pcm_rb* {.bycopy.} = object
    rb*: ma_rb
    format*: ma_format
    channels*: ma_uint32


proc ma_pcm_rb_init_ex*(format: ma_format; channels: ma_uint32;
                       subbufferSizeInFrames: ma_uint32;
                       subbufferCount: ma_uint32;
                       subbufferStrideInFrames: ma_uint32;
                       pOptionalPreallocatedBuffer: pointer;
                       pAllocationCallbacks: ptr ma_allocation_callbacks;
                       pRB: ptr ma_pcm_rb): ma_result
proc ma_pcm_rb_init*(format: ma_format; channels: ma_uint32;
                    bufferSizeInFrames: ma_uint32;
                    pOptionalPreallocatedBuffer: pointer;
                    pAllocationCallbacks: ptr ma_allocation_callbacks;
                    pRB: ptr ma_pcm_rb): ma_result
proc ma_pcm_rb_uninit*(pRB: ptr ma_pcm_rb)
proc ma_pcm_rb_reset*(pRB: ptr ma_pcm_rb)
proc ma_pcm_rb_acquire_read*(pRB: ptr ma_pcm_rb; pSizeInFrames: ptr ma_uint32;
                            ppBufferOut: ptr pointer): ma_result
proc ma_pcm_rb_commit_read*(pRB: ptr ma_pcm_rb; sizeInFrames: ma_uint32;
                           pBufferOut: pointer): ma_result
proc ma_pcm_rb_acquire_write*(pRB: ptr ma_pcm_rb; pSizeInFrames: ptr ma_uint32;
                             ppBufferOut: ptr pointer): ma_result
proc ma_pcm_rb_commit_write*(pRB: ptr ma_pcm_rb; sizeInFrames: ma_uint32;
                            pBufferOut: pointer): ma_result
proc ma_pcm_rb_seek_read*(pRB: ptr ma_pcm_rb; offsetInFrames: ma_uint32): ma_result
proc ma_pcm_rb_seek_write*(pRB: ptr ma_pcm_rb; offsetInFrames: ma_uint32): ma_result
proc ma_pcm_rb_pointer_distance*(pRB: ptr ma_pcm_rb): ma_int32
##  Return value is in frames.

proc ma_pcm_rb_available_read*(pRB: ptr ma_pcm_rb): ma_uint32
proc ma_pcm_rb_available_write*(pRB: ptr ma_pcm_rb): ma_uint32
proc ma_pcm_rb_get_subbuffer_size*(pRB: ptr ma_pcm_rb): ma_uint32
proc ma_pcm_rb_get_subbuffer_stride*(pRB: ptr ma_pcm_rb): ma_uint32
proc ma_pcm_rb_get_subbuffer_offset*(pRB: ptr ma_pcm_rb; subbufferIndex: ma_uint32): ma_uint32
proc ma_pcm_rb_get_subbuffer_ptr*(pRB: ptr ma_pcm_rb; subbufferIndex: ma_uint32;
                                 pBuffer: pointer): pointer
## ***********************************************************************************************************************************************************
##
## Miscellaneous Helpers
##
## **********************************************************************************************************************************************************
##
## Retrieves a human readable description of the given result code.
##

proc ma_result_description*(result: ma_result): cstring
##
## malloc(). Calls MA_MALLOC().
##

proc ma_malloc*(sz: csize; pAllocationCallbacks: ptr ma_allocation_callbacks): pointer
##
## realloc(). Calls MA_REALLOC().
##

proc ma_realloc*(p: pointer; sz: csize;
                pAllocationCallbacks: ptr ma_allocation_callbacks): pointer
##
## free(). Calls MA_FREE().
##

proc ma_free*(p: pointer; pAllocationCallbacks: ptr ma_allocation_callbacks)
##
## Performs an aligned malloc, with the assumption that the alignment is a power of 2.
##

proc ma_aligned_malloc*(sz: csize; alignment: csize;
                       pAllocationCallbacks: ptr ma_allocation_callbacks): pointer
##
## Free's an aligned malloc'd buffer.
##

proc ma_aligned_free*(p: pointer; pAllocationCallbacks: ptr ma_allocation_callbacks)
##
## Retrieves a friendly name for a format.
##

proc ma_get_format_name*(format: ma_format): cstring
##
## Blends two frames in floating point format.
##

proc ma_blend_f32*(pOut: ptr cfloat; pInA: ptr cfloat; pInB: ptr cfloat; factor: cfloat;
                  channels: ma_uint32)
##
## Retrieves the size of a sample in bytes for the given format.
##
## This API is efficient and is implemented using a lookup table.
##
## Thread Safety: SAFE
##   This API is pure.
##

proc ma_get_bytes_per_sample*(format: ma_format): ma_uint32
proc ma_get_bytes_per_frame*(format: ma_format; channels: ma_uint32): ma_uint32 =
  return ma_get_bytes_per_sample(format) * channels

##
## Converts a log level to a string.
##

proc ma_log_level_to_string*(logLevel: ma_uint32): cstring
## ***********************************************************************************************************************************************************
## ************************************************************************************************************************************************************
##
## DEVICE I/O
## ==========
##
## This section contains the APIs for device playback and capture. Here is where you'll find ma_device_init(), etc.
##
## ************************************************************************************************************************************************************
## **********************************************************************************************************************************************************

when true: #not defined(MA_NO_DEVICE_IO):
  type
    ma_context* = object
    ma_device* = object
  ##  Some backends are only supported on certain platforms.
  when defined(MA_WIN32):
    const
      MA_SUPPORT_WASAPI* = true
    when defined(MA_WIN32_DESKTOP): ##  DirectSound and WinMM backends are only supported on desktops.
      const
        MA_SUPPORT_DSOUND* = true
        MA_SUPPORT_WINMM* = true
        MA_SUPPORT_JACK* = true ##  JACK is technically supported on Windows, but I don't know how many people use it in practice...
  when defined(MA_UNIX):
    when defined(MA_LINUX):
      when not defined(MA_ANDROID): ##  ALSA is not supported on Android.
        const
          MA_SUPPORT_ALSA* = true
    when not defined(MA_BSD) and not defined(MA_ANDROID) and
        not defined(MA_EMSCRIPTEN):
      const
        MA_SUPPORT_PULSEAUDIO* = true
        MA_SUPPORT_JACK* = true
    when defined(MA_ANDROID):
      const
        MA_SUPPORT_AAUDIO* = true
        MA_SUPPORT_OPENSL* = true
    when defined(OpenBSD): ##  <-- Change this to "#if defined(MA_BSD)" to enable sndio on all BSD flavors.
      const
        MA_SUPPORT_SNDIO* = true ##  sndio is only supported on OpenBSD for now. May be expanded later if there's demand.
    when defined(NetBSD) or defined(OpenBSD):
      const
        MA_SUPPORT_AUDIO4* = true ##  Only support audio(4) on platforms with known support.
    when defined(FreeBSD) or defined(DragonFly):
      const
        MA_SUPPORT_OSS* = true  ##  Only support OSS on specific platforms with known support.
  when defined(MA_APPLE):
    const
      MA_SUPPORT_COREAUDIO* = true
  when defined(MA_EMSCRIPTEN):
    const
      MA_SUPPORT_WEBAUDIO* = true
  ##  Explicitly disable the Null backend for Emscripten because it uses a background thread which is not properly supported right now.
  when not defined(MA_EMSCRIPTEN):
    const
      MA_SUPPORT_NULL* = true
  when not defined(MA_NO_WASAPI) and defined(MA_SUPPORT_WASAPI):
    const
      MA_ENABLE_WASAPI* = true
  when not defined(MA_NO_DSOUND) and defined(MA_SUPPORT_DSOUND):
    const
      MA_ENABLE_DSOUND* = true
  when not defined(MA_NO_WINMM) and defined(MA_SUPPORT_WINMM):
    const
      MA_ENABLE_WINMM* = true
  when not defined(MA_NO_ALSA) and defined(MA_SUPPORT_ALSA):
    const
      MA_ENABLE_ALSA* = true
  when not defined(MA_NO_PULSEAUDIO) and defined(MA_SUPPORT_PULSEAUDIO):
    const
      MA_ENABLE_PULSEAUDIO* = true
  when not defined(MA_NO_JACK) and defined(MA_SUPPORT_JACK):
    const
      MA_ENABLE_JACK* = true
  when not defined(MA_NO_COREAUDIO) and defined(MA_SUPPORT_COREAUDIO):
    const
      MA_ENABLE_COREAUDIO* = true
  when not defined(MA_NO_SNDIO) and defined(MA_SUPPORT_SNDIO):
    const
      MA_ENABLE_SNDIO* = true
  when not defined(MA_NO_AUDIO4) and defined(MA_SUPPORT_AUDIO4):
    const
      MA_ENABLE_AUDIO4* = true
  when not defined(MA_NO_OSS) and defined(MA_SUPPORT_OSS):
    const
      MA_ENABLE_OSS* = true
  when not defined(MA_NO_AAUDIO) and defined(MA_SUPPORT_AAUDIO):
    const
      MA_ENABLE_AAUDIO* = true
  when not defined(MA_NO_OPENSL) and defined(MA_SUPPORT_OPENSL):
    const
      MA_ENABLE_OPENSL* = true
  when not defined(MA_NO_WEBAUDIO) and defined(MA_SUPPORT_WEBAUDIO):
    const
      MA_ENABLE_WEBAUDIO* = true
  when not defined(MA_NO_NULL) and defined(MA_SUPPORT_NULL):
    const
      MA_ENABLE_NULL* = true
  when defined(MA_SUPPORT_WASAPI):
    ##  We need a IMMNotificationClient object for WASAPI.
    type
      ma_IMMNotificationClient* {.bycopy.} = object
        lpVtbl*: pointer
        counter*: ma_uint32
        pDevice*: ptr ma_device

  ##  Backend enums must be in priority order.
  type
    ma_backend* = enum
      ma_backend_wasapi, ma_backend_dsound, ma_backend_winmm, ma_backend_coreaudio,
      ma_backend_sndio, ma_backend_audio4, ma_backend_oss, ma_backend_pulseaudio,
      ma_backend_alsa, ma_backend_jack, ma_backend_aaudio, ma_backend_opensl,
      ma_backend_webaudio, ma_backend_null ##  <-- Must always be the last item. Lowest priority, and used as the terminator for backend enumeration.
  ##
  ## The callback for processing audio data from the device.
  ##
  ## The data callback is fired by miniaudio whenever the device needs to have more data delivered to a playback device, or when a capture device has some data
  ## available. This is called as soon as the backend asks for more data which means it may be called with inconsistent frame counts. You cannot assume the
  ## callback will be fired with a consistent frame count.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the relevant device.
  ##
  ## pOutput (out)
  ##     A pointer to the output buffer that will receive audio data that will later be played back through the speakers. This will be non-null for a playback or
  ##     full-duplex device and null for a capture and loopback device.
  ##
  ## pInput (in)
  ##     A pointer to the buffer containing input data from a recording device. This will be non-null for a capture, full-duplex or loopback device and null for a
  ##     playback device.
  ##
  ## frameCount (in)
  ##     The number of PCM frames to process. Note that this will not necessarily be equal to what you requested when you initialized the device. The
  ##     `periodSizeInFrames` and `periodSizeInMilliseconds` members of the device config are just hints, and are not necessarily exactly what you'll get. You must
  ##     not assume this will always be the same value each time the callback is fired.
  ##
  ##
  ## Remarks
  ## -------
  ## You cannot stop and start the device from inside the callback or else you'll get a deadlock. You must also not uninitialize the device from inside the
  ## callback. The following APIs cannot be called from inside the callback:
  ##
  ##     ma_device_init()
  ##     ma_device_init_ex()
  ##     ma_device_uninit()
  ##     ma_device_start()
  ##     ma_device_stop()
  ##
  ## The proper way to stop the device is to call `ma_device_stop()` from a different thread, normally the main application thread.
  ##
  type
    ma_device_callback_proc* = proc (pDevice: ptr ma_device; pOutput: pointer;
                                  pInput: pointer; frameCount: ma_uint32) {.cdecl.}
  ##
  ## The callback for when the device has been stopped.
  ##
  ## This will be called when the device is stopped explicitly with `ma_device_stop()` and also called implicitly when the device is stopped through external forces
  ## such as being unplugged or an internal error occuring.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device that has just stopped.
  ##
  ##
  ## Remarks
  ## -------
  ## Do not restart or uninitialize the device from the callback.
  ##
  type
    ma_stop_proc* = proc (pDevice: ptr ma_device) {.cdecl.}
  ##
  ## The callback for handling log messages.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in)
  ##     A pointer to the context the log message originated from.
  ##
  ## pDevice (in)
  ##     A pointer to the device the log message originate from, if any. This can be null, in which case the message came from the context.
  ##
  ## logLevel (in)
  ##     The log level. This can be one of the following:
  ##
  ##     |----------------------|
  ##     | Log Level            |
  ##     |----------------------|
  ##     | MA_LOG_LEVEL_VERBOSE |
  ##     | MA_LOG_LEVEL_INFO    |
  ##     | MA_LOG_LEVEL_WARNING |
  ##     | MA_LOG_LEVEL_ERROR   |
  ##     |----------------------|
  ##
  ## message (in)
  ##     The log message.
  ##
  ##
  ## Remarks
  ## -------
  ## Do not modify the state of the device from inside the callback.
  ##
  type
    ma_log_proc* = proc (pContext: ptr ma_context; pDevice: ptr ma_device;
                      logLevel: ma_uint32; message: cstring) {.cdecl.}
    ma_device_type* = enum
      ma_device_type_playback = 1
      ma_device_type_capture = 2
      ma_device_type_duplex = 3 # ma_device_type_playback or ma_device_type_capture
      ma_device_type_loopback = 4
    ma_share_mode* = enum
      ma_share_mode_shared = 0, ma_share_mode_exclusive
  ##  iOS/tvOS/watchOS session categories.
  type
    ma_ios_session_category* = enum
      ma_ios_session_category_default = 0, ##  AVAudioSessionCategoryPlayAndRecord with AVAudioSessionCategoryOptionDefaultToSpeaker.
      ma_ios_session_category_none, ##  Leave the session category unchanged.
      ma_ios_session_category_ambient, ##  AVAudioSessionCategoryAmbient
      ma_ios_session_category_solo_ambient, ##  AVAudioSessionCategorySoloAmbient
      ma_ios_session_category_playback, ##  AVAudioSessionCategoryPlayback
      ma_ios_session_category_record, ##  AVAudioSessionCategoryRecord
      ma_ios_session_category_play_and_record, ##  AVAudioSessionCategoryPlayAndRecord
      ma_ios_session_category_multi_route ##  AVAudioSessionCategoryMultiRoute
  ##  iOS/tvOS/watchOS session category options
  type
    ma_ios_session_category_option* = enum
      ma_ios_session_category_option_mix_with_others = 0x00000001, ##  AVAudioSessionCategoryOptionMixWithOthers
      ma_ios_session_category_option_duck_others = 0x00000002, ##  AVAudioSessionCategoryOptionDuckOthers
      ma_ios_session_category_option_allow_bluetooth = 0x00000004, ##  AVAudioSessionCategoryOptionAllowBluetooth
      ma_ios_session_category_option_default_to_speaker = 0x00000008, ##  AVAudioSessionCategoryOptionDefaultToSpeaker
      ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others = 0x00000011, ##  AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers
      ma_ios_session_category_option_allow_bluetooth_a2dp = 0x00000020, ##  AVAudioSessionCategoryOptionAllowBluetoothA2DP
      ma_ios_session_category_option_allow_air_play = 0x00000040 ##  AVAudioSessionCategoryOptionAllowAirPlay
    ma_timer* {.bycopy.} = object {.union.}
      counter*: ma_int64
      counterD*: cdouble

    ma_device_id* {.bycopy.} = object {.union.}
      wasapi*: array[64, wchar_t] ##  WASAPI uses a wchar_t string for identification.
      dsound*: array[16, ma_uint8] ##  DirectSound uses a GUID for identification.
                                ## UINT_PTR
      winmm*: ma_uint32        ##  When creating a device, WinMM expects a Win32 UINT_PTR for device identification. In practice it's actually just a UINT.
      alsa*: array[256, char]   ##  ALSA uses a name string for identification.
      pulse*: array[256, char]  ##  PulseAudio uses a name string for identification.
      jack*: cint              ##  JACK always uses default devices.
      coreaudio*: array[256, char] ##  Core Audio uses a string for identification.
      sndio*: array[256, char]  ##  "snd/0", etc.
      audio4*: array[256, char] ##  "/dev/audio", etc.
      oss*: array[64, char]     ##  "dev/dsp0", etc. "dev/dsp" for the default device.
      aaudio*: ma_int32        ##  AAudio uses a 32-bit integer for identification.
      opensl*: ma_uint32       ##  OpenSL|ES uses a 32-bit unsigned integer for identification.
      webaudio*: array[32, char] ##  Web Audio always uses default devices for now, but if this changes it'll be a GUID.
      nullbackend*: cint       ##  The null backend uses an integer for device IDs.

    ma_device_info* = object

    ma_device_config* = object

    ma_context_config* = object

  ##
  ## The callback for handling device enumeration. This is fired from `ma_context_enumerated_devices()`.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in)
  ##     A pointer to the context performing the enumeration.
  ##
  ## deviceType (in)
  ##     The type of the device being enumerated. This will always be either `ma_device_type_playback` or `ma_device_type_capture`.
  ##
  ## pInfo (in)
  ##     A pointer to a `ma_device_info` containing the ID and name of the enumerated device. Note that this will not include detailed information about the device,
  ##     only basic information (ID and name). The reason for this is that it would otherwise require opening the backend device to probe for the information which
  ##     is too inefficient.
  ##
  ## pUserData (in)
  ##     The user data pointer passed into `ma_context_enumerate_devices()`.
  ##
  type
    ma_enum_devices_callback_proc* = proc (pContext: ptr ma_context;
                                        deviceType: ma_device_type;
                                        pInfo: ptr ma_device_info;
                                        pUserData: pointer): ma_bool32 {.cdecl.}


  ##
  ## Initializes a `ma_context_config` object.
  ##
  ##
  ## Return Value
  ## ------------
  ## A `ma_context_config` initialized to defaults.
  ##
  ##
  ## Remarks
  ## -------
  ## You must always use this to initialize the default state of the `ma_context_config` object. Not using this will result in your program breaking when miniaudio
  ## is updated and new members are added to `ma_context_config`. It also sets logical defaults.
  ##
  ## You can override members of the returned object by changing it's members directly.
  ##
  ##
  ## See Also
  ## --------
  ## ma_context_init()
  ##
  proc ma_context_config_init*(): ma_context_config
  ##
  ## Initializes a context.
  ##
  ## The context is used for selecting and initializing an appropriate backend and to represent the backend at a more global level than that of an individual
  ## device. There is one context to many devices, and a device is created from a context. A context is required to enumerate devices.
  ##
  ##
  ## Parameters
  ## ----------
  ## backends (in, optional)
  ##     A list of backends to try initializing, in priority order. Can be NULL, in which case it uses default priority order.
  ##
  ## backendCount (in, optional)
  ##     The number of items in `backend`. Ignored if `backend` is NULL.
  ##
  ## pConfig (in, optional)
  ##     The context configuration.
  ##
  ## pContext (in)
  ##     A pointer to the context object being initialized.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Unsafe. Do not call this function across multiple threads as some backends read and write to global state.
  ##
  ##
  ## Remarks
  ## -------
  ## When `backends` is NULL, the default priority order will be used. Below is a list of backends in priority order:
  ##
  ##     |-------------|-----------------------|--------------------------------------------------------|
  ##     | Name        | Enum Name             | Supported Operating Systems                            |
  ##     |-------------|-----------------------|--------------------------------------------------------|
  ##     | WASAPI      | ma_backend_wasapi     | Windows Vista+                                         |
  ##     | DirectSound | ma_backend_dsound     | Windows XP+                                            |
  ##     | WinMM       | ma_backend_winmm      | Windows XP+ (may work on older versions, but untested) |
  ##     | Core Audio  | ma_backend_coreaudio  | macOS, iOS                                             |
  ##     | ALSA        | ma_backend_alsa       | Linux                                                  |
  ##     | PulseAudio  | ma_backend_pulseaudio | Cross Platform (disabled on Windows, BSD and Android)  |
  ##     | JACK        | ma_backend_jack       | Cross Platform (disabled on BSD and Android)           |
  ##     | sndio       | ma_backend_sndio      | OpenBSD                                                |
  ##     | audio(4)    | ma_backend_audio4     | NetBSD, OpenBSD                                        |
  ##     | OSS         | ma_backend_oss        | FreeBSD                                                |
  ##     | AAudio      | ma_backend_aaudio     | Android 8+                                             |
  ##     | OpenSL|ES   | ma_backend_opensl     | Android (API level 16+)                                |
  ##     | Web Audio   | ma_backend_webaudio   | Web (via Emscripten)                                   |
  ##     | Null        | ma_backend_null       | Cross Platform (not used on Web)                       |
  ##     |-------------|-----------------------|--------------------------------------------------------|
  ##
  ## The context can be configured via the `pConfig` argument. The config object is initialized with `ma_context_config_init()`. Individual configuration settings
  ## can then be set directly on the structure. Below are the members of the `ma_context_config` object.
  ##
  ##     logCallback
  ##         Callback for handling log messages from miniaudio.
  ##
  ##     threadPriority
  ##         The desired priority to use for the audio thread. Allowable values include the following:
  ##
  ##         |--------------------------------------|
  ##         | Thread Priority                      |
  ##         |--------------------------------------|
  ##         | ma_thread_priority_idle              |
  ##         | ma_thread_priority_lowest            |
  ##         | ma_thread_priority_low               |
  ##         | ma_thread_priority_normal            |
  ##         | ma_thread_priority_high              |
  ##         | ma_thread_priority_highest (default) |
  ##         | ma_thread_priority_realtime          |
  ##         | ma_thread_priority_default           |
  ##         |--------------------------------------|
  ##
  ##     pUserData
  ##         A pointer to application-defined data. This can be accessed from the context object directly such as `context.pUserData`.
  ##
  ##     allocationCallbacks
  ##         Structure containing custom allocation callbacks. Leaving this at defaults will cause it to use MA_MALLOC, MA_REALLOC and MA_FREE. These allocation
  ##         callbacks will be used for anything tied to the context, including devices.
  ##
  ##     alsa.useVerboseDeviceEnumeration
  ##         ALSA will typically enumerate many different devices which can be intrusive and not user-friendly. To combat this, miniaudio will enumerate only unique
  ##         card/device pairs by default. The problem with this is that you lose a bit of flexibility and control. Setting alsa.useVerboseDeviceEnumeration makes
  ##         it so the ALSA backend includes all devices. Defaults to false.
  ##
  ##     pulse.pApplicationName
  ##         PulseAudio only. The application name to use when initializing the PulseAudio context with `pa_context_new()`.
  ##
  ##     pulse.pServerName
  ##         PulseAudio only. The name of the server to connect to with `pa_context_connect()`.
  ##
  ##     pulse.tryAutoSpawn
  ##         PulseAudio only. Whether or not to try automatically starting the PulseAudio daemon. Defaults to false. If you set this to true, keep in mind that
  ##         miniaudio uses a trial and error method to find the most appropriate backend, and this will result in the PulseAudio daemon starting which may be
  ##         intrusive for the end user.
  ##
  ##     coreaudio.sessionCategory
  ##         iOS only. The session category to use for the shared AudioSession instance. Below is a list of allowable values and their Core Audio equivalents.
  ##
  ##         |-----------------------------------------|-------------------------------------|
  ##         | miniaudio Token                         | Core Audio Token                    |
  ##         |-----------------------------------------|-------------------------------------|
  ##         | ma_ios_session_category_ambient         | AVAudioSessionCategoryAmbient       |
  ##         | ma_ios_session_category_solo_ambient    | AVAudioSessionCategorySoloAmbient   |
  ##         | ma_ios_session_category_playback        | AVAudioSessionCategoryPlayback      |
  ##         | ma_ios_session_category_record          | AVAudioSessionCategoryRecord        |
  ##         | ma_ios_session_category_play_and_record | AVAudioSessionCategoryPlayAndRecord |
  ##         | ma_ios_session_category_multi_route     | AVAudioSessionCategoryMultiRoute    |
  ##         | ma_ios_session_category_none            | AVAudioSessionCategoryAmbient       |
  ##         | ma_ios_session_category_default         | AVAudioSessionCategoryAmbient       |
  ##         |-----------------------------------------|-------------------------------------|
  ##
  ##     coreaudio.sessionCategoryOptions
  ##         iOS only. Session category options to use with the shared AudioSession instance. Below is a list of allowable values and their Core Audio equivalents.
  ##
  ##         |---------------------------------------------------------------------------|------------------------------------------------------------------|
  ##         | miniaudio Token                                                           | Core Audio Token                                                 |
  ##         |---------------------------------------------------------------------------|------------------------------------------------------------------|
  ##         | ma_ios_session_category_option_mix_with_others                            | AVAudioSessionCategoryOptionMixWithOthers                        |
  ##         | ma_ios_session_category_option_duck_others                                | AVAudioSessionCategoryOptionDuckOthers                           |
  ##         | ma_ios_session_category_option_allow_bluetooth                            | AVAudioSessionCategoryOptionAllowBluetooth                       |
  ##         | ma_ios_session_category_option_default_to_speaker                         | AVAudioSessionCategoryOptionDefaultToSpeaker                     |
  ##         | ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others | AVAudioSessionCategoryOptionInterruptSpokenAudioAndMixWithOthers |
  ##         | ma_ios_session_category_option_allow_bluetooth_a2dp                       | AVAudioSessionCategoryOptionAllowBluetoothA2DP                   |
  ##         | ma_ios_session_category_option_allow_air_play                             | AVAudioSessionCategoryOptionAllowAirPlay                         |
  ##         |---------------------------------------------------------------------------|------------------------------------------------------------------|
  ##
  ##     jack.pClientName
  ##         The name of the client to pass to `jack_client_open()`.
  ##
  ##     jack.tryStartServer
  ##         Whether or not to try auto-starting the JACK server. Defaults to false.
  ##
  ##
  ## It is recommended that only a single context is active at any given time because it's a bulky data structure which performs run-time linking for the
  ## relevant backends every time it's initialized.
  ##
  ## The location of the context cannot change throughout it's lifetime. Consider allocating the `ma_context` object with `malloc()` if this is an issue. The
  ## reason for this is that a pointer to the context is stored in the `ma_device` structure.
  ##
  ##
  ## Example 1 - Default Initialization
  ## ----------------------------------
  ## The example below shows how to initialize the context using the default configuration.
  ##
  ## ```c
  ## ma_context context;
  ## ma_result result = ma_context_init(NULL, 0, NULL, &context);
  ## if (result != MA_SUCCESS) {
  ##     // Error.
  ## }
  ## ```
  ##
  ##
  ## Example 2 - Custom Configuration
  ## --------------------------------
  ## The example below shows how to initialize the context using custom backend priorities and a custom configuration. In this hypothetical example, the program
  ## wants to prioritize ALSA over PulseAudio on Linux. They also want to avoid using the WinMM backend on Windows because it's latency is too high. They also
  ## want an error to be returned if no valid backend is available which they achieve by excluding the Null backend.
  ##
  ## For the configuration, the program wants to capture any log messages so they can, for example, route it to a log file and user interface.
  ##
  ## ```c
  ## ma_backend backends[] = {
  ##     ma_backend_alsa,
  ##     ma_backend_pulseaudio,
  ##     ma_backend_wasapi,
  ##     ma_backend_dsound
  ## };
  ##
  ## ma_context_config config = ma_context_config_init();
  ## config.logCallback = my_log_callback;
  ## config.pUserData   = pMyUserData;
  ##
  ## ma_context context;
  ## ma_result result = ma_context_init(backends, sizeof(backends)/sizeof(backends[0]), &config, &context);
  ## if (result != MA_SUCCESS) {
  ##     // Error.
  ##     if (result == MA_NO_BACKEND) {
  ##         // Couldn't find an appropriate backend.
  ##     }
  ## }
  ## ```
  ##
  ##
  ## See Also
  ## --------
  ## ma_context_config_init()
  ## ma_context_uninit()
  ##
  proc ma_context_init*(backends: ptr ma_backend; backendCount: ma_uint32;
                       pConfig: ptr ma_context_config; pContext: ptr ma_context): ma_result
  ##
  ## Uninitializes a context.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Unsafe. Do not call this function across multiple threads as some backends read and write to global state.
  ##
  ##
  ## Remarks
  ## -------
  ## Results are undefined if you call this while any device created by this context is still active.
  ##
  ##
  ## See Also
  ## --------
  ## ma_context_init()
  ##
  proc ma_context_uninit*(pContext: ptr ma_context): ma_result
  ##
  ## Retrieves the size of the ma_context object.
  ##
  ## This is mainly for the purpose of bindings to know how much memory to allocate.
  ##
  proc ma_context_sizeof*(): csize
  ##
  ## Enumerates over every device (both playback and capture).
  ##
  ## This is a lower-level enumeration function to the easier to use `ma_context_get_devices()`. Use `ma_context_enumerate_devices()` if you would rather not incur
  ## an internal heap allocation, or it simply suits your code better.
  ##
  ## Note that this only retrieves the ID and name/description of the device. The reason for only retrieving basic information is that it would otherwise require
  ## opening the backend device in order to probe it for more detailed information which can be inefficient. Consider using `ma_context_get_device_info()` for this,
  ## but don't call it from within the enumeration callback.
  ##
  ## Returning false from the callback will stop enumeration. Returning true will continue enumeration.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in)
  ##     A pointer to the context performing the enumeration.
  ##
  ## callback (in)
  ##     The callback to fire for each enumerated device.
  ##
  ## pUserData (in)
  ##     A pointer to application-defined data passed to the callback.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. This is guarded using a simple mutex lock.
  ##
  ##
  ## Remarks
  ## -------
  ## Do _not_ assume the first enumerated device of a given type is the default device.
  ##
  ## Some backends and platforms may only support default playback and capture devices.
  ##
  ## In general, you should not do anything complicated from within the callback. In particular, do not try initializing a device from within the callback. Also,
  ## do not try to call `ma_context_get_device_info()` from within the callback.
  ##
  ## Consider using `ma_context_get_devices()` for a simpler and safer API, albeit at the expense of an internal heap allocation.
  ##
  ##
  ## Example 1 - Simple Enumeration
  ## ------------------------------
  ## ma_bool32 ma_device_enum_callback(ma_context* pContext, ma_device_type deviceType, const ma_device_info* pInfo, void* pUserData)
  ## {
  ##     printf("Device Name: %s\n", pInfo->name);
  ##     return MA_TRUE;
  ## }
  ##
  ## ma_result result = ma_context_enumerate_devices(&context, my_device_enum_callback, pMyUserData);
  ## if (result != MA_SUCCESS) {
  ##     // Error.
  ## }
  ##
  ##
  ## See Also
  ## --------
  ## ma_context_get_devices()
  ##
  proc ma_context_enumerate_devices*(pContext: ptr ma_context;
                                    callback: ma_enum_devices_callback_proc;
                                    pUserData: pointer): ma_result
  ##
  ## Retrieves basic information about every active playback and/or capture device.
  ##
  ## This function will allocate memory internally for the device lists and return a pointer to them through the `ppPlaybackDeviceInfos` and `ppCaptureDeviceInfos`
  ## parameters. If you do not want to incur the overhead of these allocations consider using `ma_context_enumerate_devices()` which will instead use a callback.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in)
  ##     A pointer to the context performing the enumeration.
  ##
  ## ppPlaybackDeviceInfos (out)
  ##     A pointer to a pointer that will receive the address of a buffer containing the list of `ma_device_info` structures for playback devices.
  ##
  ## pPlaybackDeviceCount (out)
  ##     A pointer to an unsigned integer that will receive the number of playback devices.
  ##
  ## ppCaptureDeviceInfos (out)
  ##     A pointer to a pointer that will receive the address of a buffer containing the list of `ma_device_info` structures for capture devices.
  ##
  ## pCaptureDeviceCount (out)
  ##     A pointer to an unsigned integer that will receive the number of capture devices.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Unsafe. Since each call to this function invalidates the pointers from the previous call, you should not be calling this simultaneously across multiple
  ## threads. Instead, you need to make a copy of the returned data with your own higher level synchronization.
  ##
  ##
  ## Remarks
  ## -------
  ## It is _not_ safe to assume the first device in the list is the default device.
  ##
  ## You can pass in NULL for the playback or capture lists in which case they'll be ignored.
  ##
  ## The returned pointers will become invalid upon the next call this this function, or when the context is uninitialized. Do not free the returned pointers.
  ##
  ##
  ## See Also
  ## --------
  ## ma_context_get_devices()
  ##
  proc ma_context_get_devices*(pContext: ptr ma_context;
                              ppPlaybackDeviceInfos: ptr ptr ma_device_info;
                              pPlaybackDeviceCount: ptr ma_uint32;
                              ppCaptureDeviceInfos: ptr ptr ma_device_info;
                              pCaptureDeviceCount: ptr ma_uint32): ma_result
  ##
  ## Retrieves information about a device of the given type, with the specified ID and share mode.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in)
  ##     A pointer to the context performing the query.
  ##
  ## deviceType (in)
  ##     The type of the device being queried. Must be either `ma_device_type_playback` or `ma_device_type_capture`.
  ##
  ## pDeviceID (in)
  ##     The ID of the device being queried.
  ##
  ## shareMode (in)
  ##     The share mode to query for device capabilities. This should be set to whatever you're intending on using when initializing the device. If you're unsure,
  ##     set this to `ma_share_mode_shared`.
  ##
  ## pDeviceInfo (out)
  ##     A pointer to the `ma_device_info` structure that will receive the device information.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. This is guarded using a simple mutex lock.
  ##
  ##
  ## Remarks
  ## -------
  ## Do _not_ call this from within the `ma_context_enumerate_devices()` callback.
  ##
  ## It's possible for a device to have different information and capabilities depending on whether or not it's opened in shared or exclusive mode. For example, in
  ## shared mode, WASAPI always uses floating point samples for mixing, but in exclusive mode it can be anything. Therefore, this function allows you to specify
  ## which share mode you want information for. Note that not all backends and devices support shared or exclusive mode, in which case this function will fail if
  ## the requested share mode is unsupported.
  ##
  ## This leaves pDeviceInfo unmodified in the result of an error.
  ##
  proc ma_context_get_device_info*(pContext: ptr ma_context;
                                  deviceType: ma_device_type;
                                  pDeviceID: ptr ma_device_id;
                                  shareMode: ma_share_mode;
                                  pDeviceInfo: ptr ma_device_info): ma_result
  ##
  ## Determines if the given context supports loopback mode.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in)
  ##     A pointer to the context getting queried.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_TRUE if the context supports loopback mode; MA_FALSE otherwise.
  ##
  proc ma_context_is_loopback_supported*(pContext: ptr ma_context): ma_bool32
  ##
  ## Initializes a device config with default settings.
  ##
  ##
  ## Parameters
  ## ----------
  ## deviceType (in)
  ##     The type of the device this config is being initialized for. This must set to one of the following:
  ##
  ##     |-------------------------|
  ##     | Device Type             |
  ##     |-------------------------|
  ##     | ma_device_type_playback |
  ##     | ma_device_type_capture  |
  ##     | ma_device_type_duplex   |
  ##     | ma_device_type_loopback |
  ##     |-------------------------|
  ##
  ##
  ## Return Value
  ## ------------
  ## A new device config object with default settings. You will typically want to adjust the config after this function returns. See remarks.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Safe, but don't try initializing a device in a callback.
  ##
  ##
  ## Remarks
  ## -------
  ## The returned config will be initialized to defaults. You will normally want to customize a few variables before initializing the device. See Example 1 for a
  ## typical configuration which sets the sample format, channel count, sample rate, data callback and user data. These are usually things you will want to change
  ## before initializing the device.
  ##
  ## See `ma_device_init()` for details on specific configuration options.
  ##
  ##
  ## Example 1 - Simple Configuration
  ## --------------------------------
  ## The example below is what a program will typically want to configure for each device at a minimum. Notice how `ma_device_config_init()` is called first, and
  ## then the returned object is modified directly. This is important because it ensures that your program continues to work as new configuration options are added
  ## to the `ma_device_config` structure.
  ##
  ## ```c
  ## ma_device_config config = ma_device_config_init(ma_device_type_playback);
  ## config.playback.format   = ma_format_f32;
  ## config.playback.channels = 2;
  ## config.sampleRate        = 48000;
  ## config.dataCallback      = ma_data_callback;
  ## config.pUserData         = pMyUserData;
  ## ```
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_init()
  ## ma_device_init_ex()
  ##
  proc ma_device_config_init*(deviceType: ma_device_type): ma_device_config
  ##
  ## Initializes a device.
  ##
  ## A device represents a physical audio device. The idea is you send or receive audio data from the device to either play it back through a speaker, or capture it
  ## from a microphone. Whether or not you should send or receive data from the device (or both) depends on the type of device you are initializing which can be
  ## playback, capture, full-duplex or loopback. (Note that loopback mode is only supported on select backends.) Sending and receiving audio data to and from the
  ## device is done via a callback which is fired by miniaudio at periodic time intervals.
  ##
  ## The frequency at which data is delivered to and from a device depends on the size of it's period. The size of the period can be defined in terms of PCM frames
  ## or milliseconds, whichever is more convenient. Generally speaking, the smaller the period, the lower the latency at the expense of higher CPU usage and
  ## increased risk of glitching due to the more frequent and granular data deliver intervals. The size of a period will depend on your requirements, but
  ## miniaudio's defaults should work fine for most scenarios. If you're building a game you should leave this fairly small, whereas if you're building a simple
  ## media player you can make it larger. Note that the period size you request is actually just a hint - miniaudio will tell the backend what you want, but the
  ## backend is ultimately responsible for what it gives you. You cannot assume you will get exactly what you ask for.
  ##
  ## When delivering data to and from a device you need to make sure it's in the correct format which you can set through the device configuration. You just set the
  ## format that you want to use and miniaudio will perform all of the necessary conversion for you internally. When delivering data to and from the callback you
  ## can assume the format is the same as what you requested when you initialized the device. See Remarks for more details on miniaudio's data conversion pipeline.
  ##
  ##
  ## Parameters
  ## ----------
  ## pContext (in, optional)
  ##     A pointer to the context that owns the device. This can be null, in which case it creates a default context internally.
  ##
  ## pConfig (in)
  ##     A pointer to the device configuration. Cannot be null. See remarks for details.
  ##
  ## pDevice (out)
  ##     A pointer to the device object being initialized.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Unsafe. It is not safe to call this function simultaneously for different devices because some backends depend on and mutate global state. The same applies to
  ## calling this at the same time as `ma_device_uninit()`.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Unsafe. It is not safe to call this inside any callback.
  ##
  ##
  ## Remarks
  ## -------
  ## Setting `pContext` to NULL will result in miniaudio creating a default context internally and is equivalent to passing in a context initialized like so:
  ##
  ##     ```c
  ##     ma_context_init(NULL, 0, NULL, &context);
  ##     ```
  ##
  ## Do not set `pContext` to NULL if you are needing to open multiple devices. You can, however, use NULL when initializing the first device, and then use
  ## device.pContext for the initialization of other devices.
  ##
  ## The device can be configured via the `pConfig` argument. The config object is initialized with `ma_device_config_init()`. Individual configuration settings can
  ## then be set directly on the structure. Below are the members of the `ma_device_config` object.
  ##
  ##     deviceType
  ##         Must be `ma_device_type_playback`, `ma_device_type_capture`, `ma_device_type_duplex` of `ma_device_type_loopback`.
  ##
  ##     sampleRate
  ##         The sample rate, in hertz. The most common sample rates are 48000 and 44100. Setting this to 0 will use the device's native sample rate.
  ##
  ##     periodSizeInFrames
  ##         The desired size of a period in PCM frames. If this is 0, `periodSizeInMilliseconds` will be used instead. If both are 0 the default buffer size will
  ##         be used depending on the selected performance profile. This value affects latency. See below for details.
  ##
  ##     periodSizeInMilliseconds
  ##         The desired size of a period in milliseconds. If this is 0, `periodSizeInFrames` will be used instead. If both are 0 the default buffer size will be
  ##         used depending on the selected performance profile. The value affects latency. See below for details.
  ##
  ##     periods
  ##         The number of periods making up the device's entire buffer. The total buffer size is `periodSizeInFrames` or `periodSizeInMilliseconds` multiplied by
  ##         this value. This is just a hint as backends will be the ones who ultimately decide how your periods will be configured.
  ##
  ##     performanceProfile
  ##         A hint to miniaudio as to the performance requirements of your program. Can be either `ma_performance_profile_low_latency` (default) or
  ##         `ma_performance_profile_conservative`. This mainly affects the size of default buffers and can usually be left at it's default value.
  ##
  ##     noPreZeroedOutputBuffer
  ##         When set to true, the contents of the output buffer passed into the data callback will be left undefined. When set to false (default), the contents of
  ##         the output buffer will be cleared the zero. You can use this to avoid the overhead of zeroing out the buffer if you can guarantee that your data
  ##         callback will write to every sample in the output buffer, or if you are doing your own clearing.
  ##
  ##     noClip
  ##         When set to true, the contents of the output buffer passed into the data callback will be clipped after returning. When set to false (default), the
  ##         contents of the output buffer are left alone after returning and it will be left up to the backend itself to decide whether or not the clip. This only
  ##         applies when the playback sample format is f32.
  ##
  ##     dataCallback
  ##         The callback to fire whenever data is ready to be delivered to or from the device.
  ##
  ##     stopCallback
  ##         The callback to fire whenever the device has stopped, either explicitly via `ma_device_stop()`, or implicitly due to things like the device being
  ##         disconnected.
  ##
  ##     pUserData
  ##         The user data pointer to use with the device. You can access this directly from the device object like `device.pUserData`.
  ##
  ##     resampling.algorithm
  ##         The resampling algorithm to use when miniaudio needs to perform resampling between the rate specified by `sampleRate` and the device's native rate. The
  ##         default value is `ma_resample_algorithm_linear`, and the quality can be configured with `resampling.linear.lpfOrder`.
  ##
  ##     resampling.linear.lpfOrder
  ##         The linear resampler applies a low-pass filter as part of it's procesing for anti-aliasing. This setting controls the order of the filter. The higher
  ##         the value, the better the quality, in general. Setting this to 0 will disable low-pass filtering altogether. The maximum value is
  ##         `MA_MAX_FILTER_ORDER`. The default value is `min(4, MA_MAX_FILTER_ORDER)`.
  ##
  ##     playback.pDeviceID
  ##         A pointer to a `ma_device_id` structure containing the ID of the playback device to initialize. Setting this NULL (default) will use the system's
  ##         default playback device. Retrieve the device ID from the `ma_device_info` structure, which can be retrieved using device enumeration.
  ##
  ##     playback.format
  ##         The sample format to use for playback. When set to `ma_format_unknown` the device's native format will be used. This can be retrieved after
  ##         initialization from the device object directly with `device.playback.format`.
  ##
  ##     playback.channels
  ##         The number of channels to use for playback. When set to 0 the device's native channel count will be used. This can be retrieved after initialization
  ##         from the device object directly with `device.playback.channels`.
  ##
  ##     playback.channelMap
  ##         The channel map to use for playback. When left empty, the device's native channel map will be used. This can be retrieved after initialization from the
  ##         device object direct with `device.playback.channelMap`.
  ##
  ##     playback.shareMode
  ##         The preferred share mode to use for playback. Can be either `ma_share_mode_shared` (default) or `ma_share_mode_exclusive`. Note that if you specify
  ##         exclusive mode, but it's not supported by the backend, initialization will fail. You can then fall back to shared mode if desired by changing this to
  ##         ma_share_mode_shared and reinitializing.
  ##
  ##     capture.pDeviceID
  ##         A pointer to a `ma_device_id` structure containing the ID of the capture device to initialize. Setting this NULL (default) will use the system's
  ##         default capture device. Retrieve the device ID from the `ma_device_info` structure, which can be retrieved using device enumeration.
  ##
  ##     capture.format
  ##         The sample format to use for capture. When set to `ma_format_unknown` the device's native format will be used. This can be retrieved after
  ##         initialization from the device object directly with `device.capture.format`.
  ##
  ##     capture.channels
  ##         The number of channels to use for capture. When set to 0 the device's native channel count will be used. This can be retrieved after initialization
  ##         from the device object directly with `device.capture.channels`.
  ##
  ##     capture.channelMap
  ##         The channel map to use for capture. When left empty, the device's native channel map will be used. This can be retrieved after initialization from the
  ##         device object direct with `device.capture.channelMap`.
  ##
  ##     capture.shareMode
  ##         The preferred share mode to use for capture. Can be either `ma_share_mode_shared` (default) or `ma_share_mode_exclusive`. Note that if you specify
  ##         exclusive mode, but it's not supported by the backend, initialization will fail. You can then fall back to shared mode if desired by changing this to
  ##         ma_share_mode_shared and reinitializing.
  ##
  ##     wasapi.noAutoConvertSRC
  ##         WASAPI only. When set to true, disables WASAPI's automatic resampling and forces the use of miniaudio's resampler. Defaults to false.
  ##
  ##     wasapi.noDefaultQualitySRC
  ##         WASAPI only. Only used when `wasapi.noAutoConvertSRC` is set to false. When set to true, disables the use of `AUDCLNT_STREAMFLAGS_SRC_DEFAULT_QUALITY`.
  ##         You should usually leave this set to false, which is the default.
  ##
  ##     wasapi.noAutoStreamRouting
  ##         WASAPI only. When set to true, disables automatic stream routing on the WASAPI backend. Defaults to false.
  ##
  ##     wasapi.noHardwareOffloading
  ##         WASAPI only. When set to true, disables the use of WASAPI's hardware offloading feature. Defaults to false.
  ##
  ##     alsa.noMMap
  ##         ALSA only. When set to true, disables MMap mode. Defaults to false.
  ##
  ##     alsa.noAutoFormat
  ##         ALSA only. When set to true, disables ALSA's automatic format conversion by including the SND_PCM_NO_AUTO_FORMAT flag. Defaults to false.
  ##
  ##     alsa.noAutoChannels
  ##         ALSA only. When set to true, disables ALSA's automatic channel conversion by including the SND_PCM_NO_AUTO_CHANNELS flag. Defaults to false.
  ##
  ##     alsa.noAutoResample
  ##         ALSA only. When set to true, disables ALSA's automatic resampling by including the SND_PCM_NO_AUTO_RESAMPLE flag. Defaults to false.
  ##
  ##     pulse.pStreamNamePlayback
  ##         PulseAudio only. Sets the stream name for playback.
  ##
  ##     pulse.pStreamNameCapture
  ##         PulseAudio only. Sets the stream name for capture.
  ##
  ##
  ## Once initialized, the device's config is immutable. If you need to change the config you will need to initialize a new device.
  ##
  ## After initializing the device it will be in a stopped state. To start it, use `ma_device_start()`.
  ##
  ## If both `periodSizeInFrames` and `periodSizeInMilliseconds` are set to zero, it will default to `MA_DEFAULT_PERIOD_SIZE_IN_MILLISECONDS_LOW_LATENCY` or
  ## `MA_DEFAULT_PERIOD_SIZE_IN_MILLISECONDS_CONSERVATIVE`, depending on whether or not `performanceProfile` is set to `ma_performance_profile_low_latency` or
  ## `ma_performance_profile_conservative`.
  ##
  ## If you request exclusive mode and the backend does not support it an error will be returned. For robustness, you may want to first try initializing the device
  ## in exclusive mode, and then fall back to shared mode if required. Alternatively you can just request shared mode (the default if you leave it unset in the
  ## config) which is the most reliable option. Some backends do not have a practical way of choosing whether or not the device should be exclusive or not (ALSA,
  ## for example) in which case it just acts as a hint. Unless you have special requirements you should try avoiding exclusive mode as it's intrusive to the user.
  ## Starting with Windows 10, miniaudio will use low-latency shared mode where possible which may make exclusive mode unnecessary.
  ##
  ## When sending or receiving data to/from a device, miniaudio will internally perform a format conversion to convert between the format specified by the config
  ## and the format used internally by the backend. If you pass in 0 for the sample format, channel count, sample rate _and_ channel map, data transmission will run
  ## on an optimized pass-through fast path. You can retrieve the format, channel count and sample rate by inspecting the `playback/capture.format`,
  ## `playback/capture.channels` and `sampleRate` members of the device object.
  ##
  ## When compiling for UWP you must ensure you call this function on the main UI thread because the operating system may need to present the user with a message
  ## asking for permissions. Please refer to the official documentation for ActivateAudioInterfaceAsync() for more information.
  ##
  ## ALSA Specific: When initializing the default device, requesting shared mode will try using the "dmix" device for playback and the "dsnoop" device for capture.
  ## If these fail it will try falling back to the "hw" device.
  ##
  ##
  ## Example 1 - Simple Initialization
  ## ---------------------------------
  ## This example shows how to initialize a simple playback device using a standard configuration. If you are just needing to do simple playback from the default
  ## playback device this is usually all you need.
  ##
  ## ```c
  ## ma_device_config config = ma_device_config_init(ma_device_type_playback);
  ## config.playback.format   = ma_format_f32;
  ## config.playback.channels = 2;
  ## config.sampleRate        = 48000;
  ## config.dataCallback      = ma_data_callback;
  ## config.pMyUserData       = pMyUserData;
  ##
  ## ma_device device;
  ## ma_result result = ma_device_init(NULL, &config, &device);
  ## if (result != MA_SUCCESS) {
  ##     // Error
  ## }
  ## ```
  ##
  ##
  ## Example 2 - Advanced Initialization
  ## -----------------------------------
  ## This example shows how you might do some more advanced initialization. In this hypothetical example we want to control the latency by setting the buffer size
  ## and period count. We also want to allow the user to be able to choose which device to output from which means we need a context so we can perform device
  ## enumeration.
  ##
  ## ```c
  ## ma_context context;
  ## ma_result result = ma_context_init(NULL, 0, NULL, &context);
  ## if (result != MA_SUCCESS) {
  ##     // Error
  ## }
  ##
  ## ma_device_info* pPlaybackDeviceInfos;
  ## ma_uint32 playbackDeviceCount;
  ## result = ma_context_get_devices(&context, &pPlaybackDeviceInfos, &playbackDeviceCount, NULL, NULL);
  ## if (result != MA_SUCCESS) {
  ##     // Error
  ## }
  ##
  ## // ... choose a device from pPlaybackDeviceInfos ...
  ##
  ## ma_device_config config = ma_device_config_init(ma_device_type_playback);
  ## config.playback.pDeviceID       = pMyChosenDeviceID;    // <-- Get this from the `id` member of one of the `ma_device_info` objects returned by ma_context_get_devices().
  ## config.playback.format          = ma_format_f32;
  ## config.playback.channels        = 2;
  ## config.sampleRate               = 48000;
  ## config.dataCallback             = ma_data_callback;
  ## config.pUserData                = pMyUserData;
  ## config.periodSizeInMilliseconds = 10;
  ## config.periods                  = 3;
  ##
  ## ma_device device;
  ## result = ma_device_init(&context, &config, &device);
  ## if (result != MA_SUCCESS) {
  ##     // Error
  ## }
  ## ```
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_config_init()
  ## ma_device_uninit()
  ## ma_device_start()
  ## ma_context_init()
  ## ma_context_get_devices()
  ## ma_context_enumerate_devices()
  ##
  proc ma_device_init*(pContext: ptr ma_context; pConfig: ptr ma_device_config;
                      pDevice: ptr ma_device): ma_result
  ##
  ## Initializes a device without a context, with extra parameters for controlling the configuration of the internal self-managed context.
  ##
  ## This is the same as `ma_device_init()`, only instead of a context being passed in, the parameters from `ma_context_init()` are passed in instead. This function
  ## allows you to configure the internally created context.
  ##
  ##
  ## Parameters
  ## ----------
  ## backends (in, optional)
  ##     A list of backends to try initializing, in priority order. Can be NULL, in which case it uses default priority order.
  ##
  ## backendCount (in, optional)
  ##     The number of items in `backend`. Ignored if `backend` is NULL.
  ##
  ## pContextConfig (in, optional)
  ##     The context configuration.
  ##
  ## pConfig (in)
  ##     A pointer to the device configuration. Cannot be null. See remarks for details.
  ##
  ## pDevice (out)
  ##     A pointer to the device object being initialized.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Unsafe. It is not safe to call this function simultaneously for different devices because some backends depend on and mutate global state. The same applies to
  ## calling this at the same time as `ma_device_uninit()`.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Unsafe. It is not safe to call this inside any callback.
  ##
  ##
  ## Remarks
  ## -------
  ## You only need to use this function if you want to configure the context differently to it's defaults. You should never use this function if you want to manage
  ## your own context.
  ##
  ## See the documentation for `ma_context_init()` for information on the different context configuration options.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_init()
  ## ma_device_uninit()
  ## ma_device_config_init()
  ## ma_context_init()
  ##
  proc ma_device_init_ex*(backends: ptr ma_backend; backendCount: ma_uint32;
                         pContextConfig: ptr ma_context_config;
                         pConfig: ptr ma_device_config; pDevice: ptr ma_device): ma_result
  ##
  ## Uninitializes a device.
  ##
  ## This will explicitly stop the device. You do not need to call `ma_device_stop()` beforehand, but it's harmless if you do.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device to stop.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Unsafe. As soon as this API is called the device should be considered undefined.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Unsafe. It is not safe to call this inside any callback. Doing this will result in a deadlock.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_init()
  ## ma_device_stop()
  ##
  proc ma_device_uninit*(pDevice: ptr ma_device)
  ##
  ## Starts the device. For playback devices this begins playback. For capture devices it begins recording.
  ##
  ## Use `ma_device_stop()` to stop the device.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device to start.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. It's safe to call this from any thread with the exception of the callback thread.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Unsafe. It is not safe to call this inside any callback.
  ##
  ##
  ## Remarks
  ## -------
  ## For a playback device, this will retrieve an initial chunk of audio data from the client before returning. The reason for this is to ensure there is valid
  ## audio data in the buffer, which needs to be done before the device begins playback.
  ##
  ## This API waits until the backend device has been started for real by the worker thread. It also waits on a mutex for thread-safety.
  ##
  ## Do not call this in any callback.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_stop()
  ##
  proc ma_device_start*(pDevice: ptr ma_device): ma_result
  ##
  ## Stops the device. For playback devices this stops playback. For capture devices it stops recording.
  ##
  ## Use `ma_device_start()` to start the device again.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device to stop.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful; any other error code otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. It's safe to call this from any thread with the exception of the callback thread.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Unsafe. It is not safe to call this inside any callback. Doing this will result in a deadlock.
  ##
  ##
  ## Remarks
  ## -------
  ## This API needs to wait on the worker thread to stop the backend device properly before returning. It also waits on a mutex for thread-safety. In addition, some
  ## backends need to wait for the device to finish playback/recording of the current fragment which can take some time (usually proportionate to the buffer size
  ## that was specified at initialization time).
  ##
  ## Backends are required to either pause the stream in-place or drain the buffer if pausing is not possible. The reason for this is that stopping the device and
  ## the resuming it with ma_device_start() (which you might do when your program loses focus) may result in a situation where those samples are never output to the
  ## speakers or received from the microphone which can in turn result in de-syncs.
  ##
  ## Do not call this in any callback.
  ##
  ## This will be called implicitly by `ma_device_uninit()`.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_start()
  ##
  proc ma_device_stop*(pDevice: ptr ma_device): ma_result
  ##
  ## Determines whether or not the device is started.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device whose start state is being retrieved.
  ##
  ##
  ## Return Value
  ## ------------
  ## True if the device is started, false otherwise.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. If another thread calls `ma_device_start()` or `ma_device_stop()` at this same time as this function is called, there's a very small chance the return
  ## value will be out of sync.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Safe. This is implemented as a simple accessor.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_start()
  ## ma_device_stop()
  ##
  proc ma_device_is_started*(pDevice: ptr ma_device): ma_bool32
  ##
  ## Sets the master volume factor for the device.
  ##
  ## The volume factor must be between 0 (silence) and 1 (full volume). Use `ma_device_set_master_gain_db()` to use decibel notation, where 0 is full volume and
  ## values less than 0 decreases the volume.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device whose volume is being set.
  ##
  ## volume (in)
  ##     The new volume factor. Must be within the range of [0, 1].
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if the volume was set successfully.
  ## MA_INVALID_ARGS if pDevice is NULL.
  ## MA_INVALID_ARGS if the volume factor is not within the range of [0, 1].
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. This just sets a local member of the device object.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Safe. If you set the volume in the data callback, that data written to the output buffer will have the new volume applied.
  ##
  ##
  ## Remarks
  ## -------
  ## This applies the volume factor across all channels.
  ##
  ## This does not change the operating system's volume. It only affects the volume for the given `ma_device` object's audio stream.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_get_master_volume()
  ## ma_device_set_master_volume_gain_db()
  ## ma_device_get_master_volume_gain_db()
  ##
  proc ma_device_set_master_volume*(pDevice: ptr ma_device; volume: cfloat): ma_result
  ##
  ## Retrieves the master volume factor for the device.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device whose volume factor is being retrieved.
  ##
  ## pVolume (in)
  ##     A pointer to the variable that will receive the volume factor. The returned value will be in the range of [0, 1].
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful.
  ## MA_INVALID_ARGS if pDevice is NULL.
  ## MA_INVALID_ARGS if pVolume is NULL.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. This just a simple member retrieval.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Safe.
  ##
  ##
  ## Remarks
  ## -------
  ## If an error occurs, `*pVolume` will be set to 0.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_set_master_volume()
  ## ma_device_set_master_volume_gain_db()
  ## ma_device_get_master_volume_gain_db()
  ##
  proc ma_device_get_master_volume*(pDevice: ptr ma_device; pVolume: ptr cfloat): ma_result
  ##
  ## Sets the master volume for the device as gain in decibels.
  ##
  ## A gain of 0 is full volume, whereas a gain of < 0 will decrease the volume.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device whose gain is being set.
  ##
  ## gainDB (in)
  ##     The new volume as gain in decibels. Must be less than or equal to 0, where 0 is full volume and anything less than 0 decreases the volume.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if the volume was set successfully.
  ## MA_INVALID_ARGS if pDevice is NULL.
  ## MA_INVALID_ARGS if the gain is > 0.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. This just sets a local member of the device object.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Safe. If you set the volume in the data callback, that data written to the output buffer will have the new volume applied.
  ##
  ##
  ## Remarks
  ## -------
  ## This applies the gain across all channels.
  ##
  ## This does not change the operating system's volume. It only affects the volume for the given `ma_device` object's audio stream.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_get_master_volume_gain_db()
  ## ma_device_set_master_volume()
  ## ma_device_get_master_volume()
  ##
  proc ma_device_set_master_gain_db*(pDevice: ptr ma_device; gainDB: cfloat): ma_result
  ##
  ## Retrieves the master gain in decibels.
  ##
  ##
  ## Parameters
  ## ----------
  ## pDevice (in)
  ##     A pointer to the device whose gain is being retrieved.
  ##
  ## pGainDB (in)
  ##     A pointer to the variable that will receive the gain in decibels. The returned value will be <= 0.
  ##
  ##
  ## Return Value
  ## ------------
  ## MA_SUCCESS if successful.
  ## MA_INVALID_ARGS if pDevice is NULL.
  ## MA_INVALID_ARGS if pGainDB is NULL.
  ##
  ##
  ## Thread Safety
  ## -------------
  ## Safe. This just a simple member retrieval.
  ##
  ##
  ## Callback Safety
  ## ---------------
  ## Safe.
  ##
  ##
  ## Remarks
  ## -------
  ## If an error occurs, `*pGainDB` will be set to 0.
  ##
  ##
  ## See Also
  ## --------
  ## ma_device_set_master_volume_gain_db()
  ## ma_device_set_master_volume()
  ## ma_device_get_master_volume()
  ##
  proc ma_device_get_master_gain_db*(pDevice: ptr ma_device; pGainDB: ptr cfloat): ma_result
  ##
  ## Retrieves a friendly name for a backend.
  ##
  proc ma_get_backend_name*(backend: ma_backend): cstring
  ##
  ## Determines whether or not loopback mode is support by a backend.
  ##
  proc ma_is_loopback_supported*(backend: ma_backend): ma_bool32
when not defined(MA_NO_THREADING):
  ##
  ## Locks a spinlock.
  ##
  proc ma_spinlock_lock*(pSpinlock: ptr ma_spinlock): ma_result
  ##
  ## Locks a spinlock, but does not yield() when looping.
  ##
  proc ma_spinlock_lock_noyield*(pSpinlock: ptr ma_spinlock): ma_result
  ##
  ## Unlocks a spinlock.
  ##
  proc ma_spinlock_unlock*(pSpinlock: ptr ma_spinlock): ma_result
  ##
  ## Creates a mutex.
  ##
  ## A mutex must be created from a valid context. A mutex is initially unlocked.
  ##
  proc ma_mutex_init*(pMutex: ptr ma_mutex): ma_result
  ##
  ## Deletes a mutex.
  ##
  proc ma_mutex_uninit*(pMutex: ptr ma_mutex)
  ##
  ## Locks a mutex with an infinite timeout.
  ##
  proc ma_mutex_lock*(pMutex: ptr ma_mutex)
  ##
  ## Unlocks a mutex.
  ##
  proc ma_mutex_unlock*(pMutex: ptr ma_mutex)
  ##
  ## Initializes an auto-reset event.
  ##
  proc ma_event_init*(pEvent: ptr ma_event): ma_result
  ##
  ## Uninitializes an auto-reset event.
  ##
  proc ma_event_uninit*(pEvent: ptr ma_event)
  ##
  ## Waits for the specified auto-reset event to become signalled.
  ##
  proc ma_event_wait*(pEvent: ptr ma_event): ma_result
  ##
  ## Signals the specified auto-reset event.
  ##
  proc ma_event_signal*(pEvent: ptr ma_event): ma_result
## ***********************************************************************************************************************************************************
##
## Utiltities
##
## **********************************************************************************************************************************************************
##
## Adjust buffer size based on a scaling factor.
##
## This just multiplies the base size by the scaling factor, making sure it's a size of at least 1.
##

proc ma_scale_buffer_size*(baseBufferSize: ma_uint32; scale: cfloat): ma_uint32
##
## Calculates a buffer size in milliseconds from the specified number of frames and sample rate.
##

proc ma_calculate_buffer_size_in_milliseconds_from_frames*(
    bufferSizeInFrames: ma_uint32; sampleRate: ma_uint32): ma_uint32
##
## Calculates a buffer size in frames from the specified number of milliseconds and sample rate.
##

proc ma_calculate_buffer_size_in_frames_from_milliseconds*(
    bufferSizeInMilliseconds: ma_uint32; sampleRate: ma_uint32): ma_uint32
##
## Copies PCM frames from one buffer to another.
##

proc ma_copy_pcm_frames*(dst: pointer; src: pointer; frameCount: ma_uint64;
                        format: ma_format; channels: ma_uint32)
##
## Copies silent frames into the given buffer.
##
## Remarks
## -------
## For all formats except `ma_format_u8`, the output buffer will be filled with 0. For `ma_format_u8` it will be filled with 128. The reason for this is that it
## makes more sense for the purpose of mixing to initialize it to the center point.
##

proc ma_silence_pcm_frames*(p: pointer; frameCount: ma_uint64; format: ma_format;
                           channels: ma_uint32)
proc ma_zero_pcm_frames*(p: pointer; frameCount: ma_uint64; format: ma_format;
                        channels: ma_uint32) =
  ma_silence_pcm_frames(p, frameCount, format, channels)

##
## Offsets a pointer by the specified number of PCM frames.
##

proc ma_offset_pcm_frames_ptr*(p: pointer; offsetInFrames: ma_uint64;
                              format: ma_format; channels: ma_uint32): pointer
proc ma_offset_pcm_frames_const_ptr*(p: pointer; offsetInFrames: ma_uint64;
                                    format: ma_format; channels: ma_uint32): pointer
##
## Clips f32 samples.
##

proc ma_clip_samples_f32*(p: ptr cfloat; sampleCount: ma_uint64)
proc ma_clip_pcm_frames_f32*(p: ptr cfloat; frameCount: ma_uint64; channels: ma_uint32) =
  ma_clip_samples_f32(p, frameCount * channels)

##
## Helper for applying a volume factor to samples.
##
## Note that the source and destination buffers can be the same, in which case it'll perform the operation in-place.
##

proc ma_copy_and_apply_volume_factor_u8*(pSamplesOut: ptr ma_uint8;
                                        pSamplesIn: ptr ma_uint8;
                                        sampleCount: ma_uint32; factor: cfloat)
proc ma_copy_and_apply_volume_factor_s16*(pSamplesOut: ptr ma_int16;
    pSamplesIn: ptr ma_int16; sampleCount: ma_uint32; factor: cfloat)
proc ma_copy_and_apply_volume_factor_s24*(pSamplesOut: pointer;
    pSamplesIn: pointer; sampleCount: ma_uint32; factor: cfloat)
proc ma_copy_and_apply_volume_factor_s32*(pSamplesOut: ptr ma_int32;
    pSamplesIn: ptr ma_int32; sampleCount: ma_uint32; factor: cfloat)
proc ma_copy_and_apply_volume_factor_f32*(pSamplesOut: ptr cfloat;
    pSamplesIn: ptr cfloat; sampleCount: ma_uint32; factor: cfloat)
proc ma_apply_volume_factor_u8*(pSamples: ptr ma_uint8; sampleCount: ma_uint32;
                               factor: cfloat)
proc ma_apply_volume_factor_s16*(pSamples: ptr ma_int16; sampleCount: ma_uint32;
                                factor: cfloat)
proc ma_apply_volume_factor_s24*(pSamples: pointer; sampleCount: ma_uint32;
                                factor: cfloat)
proc ma_apply_volume_factor_s32*(pSamples: ptr ma_int32; sampleCount: ma_uint32;
                                factor: cfloat)
proc ma_apply_volume_factor_f32*(pSamples: ptr cfloat; sampleCount: ma_uint32;
                                factor: cfloat)
proc ma_copy_and_apply_volume_factor_pcm_frames_u8*(pPCMFramesOut: ptr ma_uint8;
    pPCMFramesIn: ptr ma_uint8; frameCount: ma_uint32; channels: ma_uint32;
    factor: cfloat)
proc ma_copy_and_apply_volume_factor_pcm_frames_s16*(pPCMFramesOut: ptr ma_int16;
    pPCMFramesIn: ptr ma_int16; frameCount: ma_uint32; channels: ma_uint32;
    factor: cfloat)
proc ma_copy_and_apply_volume_factor_pcm_frames_s24*(pPCMFramesOut: pointer;
    pPCMFramesIn: pointer; frameCount: ma_uint32; channels: ma_uint32; factor: cfloat)
proc ma_copy_and_apply_volume_factor_pcm_frames_s32*(pPCMFramesOut: ptr ma_int32;
    pPCMFramesIn: ptr ma_int32; frameCount: ma_uint32; channels: ma_uint32;
    factor: cfloat)
proc ma_copy_and_apply_volume_factor_pcm_frames_f32*(pPCMFramesOut: ptr cfloat;
    pPCMFramesIn: ptr cfloat; frameCount: ma_uint32; channels: ma_uint32;
    factor: cfloat)
proc ma_copy_and_apply_volume_factor_pcm_frames*(pFramesOut: pointer;
    pFramesIn: pointer; frameCount: ma_uint32; format: ma_format; channels: ma_uint32;
    factor: cfloat)
proc ma_apply_volume_factor_pcm_frames_u8*(pFrames: ptr ma_uint8;
    frameCount: ma_uint32; channels: ma_uint32; factor: cfloat)
proc ma_apply_volume_factor_pcm_frames_s16*(pFrames: ptr ma_int16;
    frameCount: ma_uint32; channels: ma_uint32; factor: cfloat)
proc ma_apply_volume_factor_pcm_frames_s24*(pFrames: pointer;
    frameCount: ma_uint32; channels: ma_uint32; factor: cfloat)
proc ma_apply_volume_factor_pcm_frames_s32*(pFrames: ptr ma_int32;
    frameCount: ma_uint32; channels: ma_uint32; factor: cfloat)
proc ma_apply_volume_factor_pcm_frames_f32*(pFrames: ptr cfloat;
    frameCount: ma_uint32; channels: ma_uint32; factor: cfloat)
proc ma_apply_volume_factor_pcm_frames*(pFrames: pointer; frameCount: ma_uint32;
                                       format: ma_format; channels: ma_uint32;
                                       factor: cfloat)
##
## Helper for converting a linear factor to gain in decibels.
##

proc ma_factor_to_gain_db*(factor: cfloat): cfloat
##
## Helper for converting gain in decibels to a linear factor.
##

proc ma_gain_db_to_factor*(gain: cfloat): cfloat
type
  ma_data_source* = object
  ma_data_source_callbacks* {.bycopy.} = object
    onRead*: proc (pDataSource: ptr ma_data_source; pFramesOut: pointer;
                 frameCount: ma_uint64; pFramesRead: ptr ma_uint64): ma_result {.cdecl.}
    onSeek*: proc (pDataSource: ptr ma_data_source; frameIndex: ma_uint64): ma_result {.cdecl.}
    onMap*: proc (pDataSource: ptr ma_data_source; ppFramesOut: ptr pointer;
                pFrameCount: ptr ma_uint64): ma_result {.cdecl.} ##  Returns MA_AT_END if the end has been reached. This should be considered successful.
    onUnmap*: proc (pDataSource: ptr ma_data_source; frameCount: ma_uint64): ma_result {.cdecl.}
    onGetDataFormat*: proc (pDataSource: ptr ma_data_source; pFormat: ptr ma_format;
                          pChannels: ptr ma_uint32): ma_result {.cdecl.}


proc ma_data_source_read_pcm_frames*(pDataSource: ptr ma_data_source;
                                    pFramesOut: pointer; frameCount: ma_uint64;
                                    pFramesRead: ptr ma_uint64; loop: ma_bool32): ma_result
##  Must support pFramesOut = NULL in which case a forward seek should be performed.

proc ma_data_source_seek_pcm_frames*(pDataSource: ptr ma_data_source;
                                    frameCount: ma_uint64;
                                    pFramesSeeked: ptr ma_uint64; loop: ma_bool32): ma_result
##  Can only seek forward. Equivalent to ma_data_source_read_pcm_frames(pDataSource, NULL, frameCount);

proc ma_data_source_seek_to_pcm_frame*(pDataSource: ptr ma_data_source;
                                      frameIndex: ma_uint64): ma_result
proc ma_data_source_map*(pDataSource: ptr ma_data_source; ppFramesOut: ptr pointer;
                        pFrameCount: ptr ma_uint64): ma_result
proc ma_data_source_unmap*(pDataSource: ptr ma_data_source; frameCount: ma_uint64): ma_result
##  Returns MA_AT_END if the end has been reached. This should be considered successful.

proc ma_data_source_get_data_format*(pDataSource: ptr ma_data_source;
                                    pFormat: ptr ma_format;
                                    pChannels: ptr ma_uint32): ma_result
type
  ma_audio_buffer_config* {.bycopy.} = object
    format*: ma_format
    channels*: ma_uint32
    sizeInFrames*: ma_uint64
    pData*: pointer            ##  If set to NULL, will allocate a block of memory for you.
    allocationCallbacks*: ma_allocation_callbacks


proc ma_audio_buffer_config_init*(format: ma_format; channels: ma_uint32;
                                 sizeInFrames: ma_uint64; pData: pointer;
    pAllocationCallbacks: ptr ma_allocation_callbacks): ma_audio_buffer_config
type
  ma_audio_buffer* {.bycopy.} = object
    ds*: ma_data_source_callbacks
    format*: ma_format
    channels*: ma_uint32
    cursor*: ma_uint64
    sizeInFrames*: ma_uint64
    pData*: pointer
    allocationCallbacks*: ma_allocation_callbacks
    ownsData*: ma_bool32       ##  Used to control whether or not miniaudio owns the data buffer. If set to true, pData will be freed in ma_audio_buffer_uninit().
    pExtraData*: array[1, ma_uint8] ##  For allocating a buffer with the memory located directly after the other memory of the structure.


proc ma_audio_buffer_init*(pConfig: ptr ma_audio_buffer_config;
                          pAudioBuffer: ptr ma_audio_buffer): ma_result
proc ma_audio_buffer_init_copy*(pConfig: ptr ma_audio_buffer_config;
                               pAudioBuffer: ptr ma_audio_buffer): ma_result
proc ma_audio_buffer_alloc_and_init*(pConfig: ptr ma_audio_buffer_config;
                                    ppAudioBuffer: ptr ptr ma_audio_buffer): ma_result
##  Always copies the data. Doesn't make sense to use this otherwise. Use ma_audio_buffer_uninit_and_free() to uninit.

proc ma_audio_buffer_uninit*(pAudioBuffer: ptr ma_audio_buffer)
proc ma_audio_buffer_uninit_and_free*(pAudioBuffer: ptr ma_audio_buffer)
proc ma_audio_buffer_read_pcm_frames*(pAudioBuffer: ptr ma_audio_buffer;
                                     pFramesOut: pointer; frameCount: ma_uint64;
                                     loop: ma_bool32): ma_uint64
proc ma_audio_buffer_seek_to_pcm_frame*(pAudioBuffer: ptr ma_audio_buffer;
                                       frameIndex: ma_uint64): ma_result
proc ma_audio_buffer_map*(pAudioBuffer: ptr ma_audio_buffer;
                         ppFramesOut: ptr pointer; pFrameCount: ptr ma_uint64): ma_result
proc ma_audio_buffer_unmap*(pAudioBuffer: ptr ma_audio_buffer; frameCount: ma_uint64): ma_result
##  Returns MA_AT_END if the end has been reached. This should be considered successful.

proc ma_audio_buffer_at_end*(pAudioBuffer: ptr ma_audio_buffer): ma_result
## ***********************************************************************************************************************************************************
##
## VFS
## ===
##
## The VFS object (virtual file system) is what's used to customize file access. This is useful in cases where stdio FILE* based APIs may not be entirely
## appropriate for a given situation.
##
## **********************************************************************************************************************************************************

type
  ma_vfs* = object
  ma_vfs_file* = ma_handle

const
  MA_OPEN_MODE_READ* = 0x00000001
  MA_OPEN_MODE_WRITE* = 0x00000002

type
  ma_seek_origin* = enum
    ma_seek_origin_start, ma_seek_origin_current, ma_seek_origin_end ##  Not used by decoders.
  ma_file_info* {.bycopy.} = object
    sizeInBytes*: ma_uint64

  ma_vfs_callbacks* {.bycopy.} = object
    onOpen*: proc (pVFS: ptr ma_vfs; pFilePath: cstring; openMode: ma_uint32;
                 pFile: ptr ma_vfs_file): ma_result {.cdecl.}
    onOpenW*: proc (pVFS: ptr ma_vfs; pFilePath: ptr wchar_t; openMode: ma_uint32;
                  pFile: ptr ma_vfs_file): ma_result {.cdecl.}
    onClose*: proc (pVFS: ptr ma_vfs; file: ma_vfs_file): ma_result {.cdecl.}
    onRead*: proc (pVFS: ptr ma_vfs; file: ma_vfs_file; pDst: pointer;
                 sizeInBytes: csize; pBytesRead: ptr csize): ma_result {.cdecl.}
    onWrite*: proc (pVFS: ptr ma_vfs; file: ma_vfs_file; pSrc: pointer;
                  sizeInBytes: csize; pBytesWritten: ptr csize): ma_result {.cdecl.}
    onSeek*: proc (pVFS: ptr ma_vfs; file: ma_vfs_file; offset: ma_int64;
                 origin: ma_seek_origin): ma_result {.cdecl.}
    onTell*: proc (pVFS: ptr ma_vfs; file: ma_vfs_file; pCursor: ptr ma_int64): ma_result {.cdecl.}
    onInfo*: proc (pVFS: ptr ma_vfs; file: ma_vfs_file; pInfo: ptr ma_file_info): ma_result {.cdecl.}



proc ma_vfs_open*(pVFS: ptr ma_vfs; pFilePath: cstring; openMode: ma_uint32;
                 pFile: ptr ma_vfs_file): ma_result
proc ma_vfs_open_w*(pVFS: ptr ma_vfs; pFilePath: ptr wchar_t; openMode: ma_uint32;
                   pFile: ptr ma_vfs_file): ma_result
proc ma_vfs_close*(pVFS: ptr ma_vfs; file: ma_vfs_file): ma_result
proc ma_vfs_read*(pVFS: ptr ma_vfs; file: ma_vfs_file; pDst: pointer;
                 sizeInBytes: csize; pBytesRead: ptr csize): ma_result
proc ma_vfs_write*(pVFS: ptr ma_vfs; file: ma_vfs_file; pSrc: pointer;
                  sizeInBytes: csize; pBytesWritten: ptr csize): ma_result
proc ma_vfs_seek*(pVFS: ptr ma_vfs; file: ma_vfs_file; offset: ma_int64;
                 origin: ma_seek_origin): ma_result
proc ma_vfs_tell*(pVFS: ptr ma_vfs; file: ma_vfs_file; pCursor: ptr ma_int64): ma_result
proc ma_vfs_info*(pVFS: ptr ma_vfs; file: ma_vfs_file; pInfo: ptr ma_file_info): ma_result
proc ma_vfs_open_and_read_file*(pVFS: ptr ma_vfs; pFilePath: cstring;
                               ppData: ptr pointer; pSize: ptr csize;
    pAllocationCallbacks: ptr ma_allocation_callbacks): ma_result
type
  ma_default_vfs* {.bycopy.} = object
    cb*: ma_vfs_callbacks
    allocationCallbacks*: ma_allocation_callbacks ##  Only used for the wchar_t version of open() on non-Windows platforms.


proc ma_default_vfs_init*(pVFS: ptr ma_default_vfs;
                         pAllocationCallbacks: ptr ma_allocation_callbacks): ma_result
when true: #not defined(MA_NO_DECODING) or not defined(MA_NO_ENCODING):
  type
    ma_resource_format* = enum
      ma_resource_format_wav
## ***********************************************************************************************************************************************************
##
## Decoding
## ========
##
## Decoders are independent of the main device API. Decoding APIs can be called freely inside the device's data callback, but they are not thread safe unless
## you do your own synchronization.
##
## **********************************************************************************************************************************************************

when true: #not defined(MA_NO_DECODING):
  type
    ma_decoder_config* = object
    ma_decoder* = object
    ma_decoder_read_proc* = proc (pDecoder: ptr ma_decoder; pBufferOut: pointer;
                               bytesToRead: csize): csize {.cdecl.}
    ma_decoder_seek_proc* = proc (pDecoder: ptr ma_decoder; byteOffset: cint;
                               origin: ma_seek_origin): ma_bool32 {.cdecl.}
    ma_decoder_read_pcm_frames_proc* = proc (pDecoder: ptr ma_decoder;
        pFramesOut: pointer; frameCount: ma_uint64): ma_uint64 {.cdecl.}
    ma_decoder_seek_to_pcm_frame_proc* = proc (pDecoder: ptr ma_decoder;
        frameIndex: ma_uint64): ma_result {.cdecl.}
    ma_decoder_uninit_proc* = proc (pDecoder: ptr ma_decoder): ma_result {.cdecl.}
    ma_decoder_get_length_in_pcm_frames_proc* = proc (pDecoder: ptr ma_decoder): ma_uint64 {.cdecl.}


  proc ma_decoder_config_init*(outputFormat: ma_format; outputChannels: ma_uint32;
                              outputSampleRate: ma_uint32): ma_decoder_config
  proc ma_decoder_init*(onRead: ma_decoder_read_proc; onSeek: ma_decoder_seek_proc;
                       pUserData: pointer; pConfig: ptr ma_decoder_config;
                       pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_wav*(onRead: ma_decoder_read_proc;
                           onSeek: ma_decoder_seek_proc; pUserData: pointer;
                           pConfig: ptr ma_decoder_config; pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_flac*(onRead: ma_decoder_read_proc;
                            onSeek: ma_decoder_seek_proc; pUserData: pointer;
                            pConfig: ptr ma_decoder_config;
                            pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_mp3*(onRead: ma_decoder_read_proc;
                           onSeek: ma_decoder_seek_proc; pUserData: pointer;
                           pConfig: ptr ma_decoder_config; pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vorbis*(onRead: ma_decoder_read_proc;
                              onSeek: ma_decoder_seek_proc; pUserData: pointer;
                              pConfig: ptr ma_decoder_config;
                              pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_raw*(onRead: ma_decoder_read_proc;
                           onSeek: ma_decoder_seek_proc; pUserData: pointer;
                           pConfigIn: ptr ma_decoder_config;
                           pConfigOut: ptr ma_decoder_config;
                           pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_memory*(pData: pointer; dataSize: csize;
                              pConfig: ptr ma_decoder_config;
                              pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_memory_wav*(pData: pointer; dataSize: csize;
                                  pConfig: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_memory_flac*(pData: pointer; dataSize: csize;
                                   pConfig: ptr ma_decoder_config;
                                   pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_memory_mp3*(pData: pointer; dataSize: csize;
                                  pConfig: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_memory_vorbis*(pData: pointer; dataSize: csize;
                                     pConfig: ptr ma_decoder_config;
                                     pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_memory_raw*(pData: pointer; dataSize: csize;
                                  pConfigIn: ptr ma_decoder_config;
                                  pConfigOut: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs*(pVFS: ptr ma_vfs; pFilePath: cstring;
                           pConfig: ptr ma_decoder_config; pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_wav*(pVFS: ptr ma_vfs; pFilePath: cstring;
                               pConfig: ptr ma_decoder_config;
                               pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_flac*(pVFS: ptr ma_vfs; pFilePath: cstring;
                                pConfig: ptr ma_decoder_config;
                                pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_mp3*(pVFS: ptr ma_vfs; pFilePath: cstring;
                               pConfig: ptr ma_decoder_config;
                               pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_vorbis*(pVFS: ptr ma_vfs; pFilePath: cstring;
                                  pConfig: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_w*(pVFS: ptr ma_vfs; pFilePath: ptr wchar_t;
                             pConfig: ptr ma_decoder_config;
                             pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_wav_w*(pVFS: ptr ma_vfs; pFilePath: ptr wchar_t;
                                 pConfig: ptr ma_decoder_config;
                                 pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_flac_w*(pVFS: ptr ma_vfs; pFilePath: ptr wchar_t;
                                  pConfig: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_mp3_w*(pVFS: ptr ma_vfs; pFilePath: ptr wchar_t;
                                 pConfig: ptr ma_decoder_config;
                                 pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_vfs_vorbis_w*(pVFS: ptr ma_vfs; pFilePath: ptr wchar_t;
                                    pConfig: ptr ma_decoder_config;
                                    pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file*(pFilePath: cstring; pConfig: ptr ma_decoder_config;
                            pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_wav*(pFilePath: cstring;
                                pConfig: ptr ma_decoder_config;
                                pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_flac*(pFilePath: cstring;
                                 pConfig: ptr ma_decoder_config;
                                 pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_mp3*(pFilePath: cstring;
                                pConfig: ptr ma_decoder_config;
                                pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_vorbis*(pFilePath: cstring;
                                   pConfig: ptr ma_decoder_config;
                                   pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_w*(pFilePath: ptr wchar_t;
                              pConfig: ptr ma_decoder_config;
                              pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_wav_w*(pFilePath: ptr wchar_t;
                                  pConfig: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_flac_w*(pFilePath: ptr wchar_t;
                                   pConfig: ptr ma_decoder_config;
                                   pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_mp3_w*(pFilePath: ptr wchar_t;
                                  pConfig: ptr ma_decoder_config;
                                  pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_init_file_vorbis_w*(pFilePath: ptr wchar_t;
                                     pConfig: ptr ma_decoder_config;
                                     pDecoder: ptr ma_decoder): ma_result
  proc ma_decoder_uninit*(pDecoder: ptr ma_decoder): ma_result
  ##
  ## Retrieves the length of the decoder in PCM frames.
  ##
  ## Do not call this on streams of an undefined length, such as internet radio.
  ##
  ## If the length is unknown or an error occurs, 0 will be returned.
  ##
  ## This will always return 0 for Vorbis decoders. This is due to a limitation with stb_vorbis in push mode which is what miniaudio
  ## uses internally.
  ##
  ## For MP3's, this will decode the entire file. Do not call this in time critical scenarios.
  ##
  ## This function is not thread safe without your own synchronization.
  ##
  proc ma_decoder_get_length_in_pcm_frames*(pDecoder: ptr ma_decoder): ma_uint64
  ##
  ## Reads PCM frames from the given decoder.
  ##
  ## This is not thread safe without your own synchronization.
  ##
  proc ma_decoder_read_pcm_frames*(pDecoder: ptr ma_decoder; pFramesOut: pointer;
                                  frameCount: ma_uint64): ma_uint64
  ##
  ## Seeks to a PCM frame based on it's absolute index.
  ##
  ## This is not thread safe without your own synchronization.
  ##
  proc ma_decoder_seek_to_pcm_frame*(pDecoder: ptr ma_decoder; frameIndex: ma_uint64): ma_result
  ##
  ## Helper for opening and decoding a file into a heap allocated block of memory. Free the returned pointer with ma_free(). On input,
  ## pConfig should be set to what you want. On output it will be set to what you got.
  ##
  proc ma_decode_from_vfs*(pVFS: ptr ma_vfs; pFilePath: cstring;
                          pConfig: ptr ma_decoder_config;
                          pFrameCountOut: ptr ma_uint64;
                          ppPCMFramesOut: ptr pointer): ma_result
  proc ma_decode_file*(pFilePath: cstring; pConfig: ptr ma_decoder_config;
                      pFrameCountOut: ptr ma_uint64; ppPCMFramesOut: ptr pointer): ma_result
  proc ma_decode_memory*(pData: pointer; dataSize: csize;
                        pConfig: ptr ma_decoder_config;
                        pFrameCountOut: ptr ma_uint64; ppPCMFramesOut: ptr pointer): ma_result
## ***********************************************************************************************************************************************************
##
## Encoding
## ========
##
## Encoders do not perform any format conversion for you. If your target format does not support the format, and error will be returned.
##
## **********************************************************************************************************************************************************

type
  ma_encoder* {.bycopy.} = object
    config*: ma_encoder_config
    onWrite*: ma_encoder_write_proc
    onSeek*: ma_encoder_seek_proc
    onInit*: ma_encoder_init_proc
    onUninit*: ma_encoder_uninit_proc
    onWritePCMFrames*: ma_encoder_write_pcm_frames_proc
    pUserData*: pointer
    pInternalEncoder*: pointer ##  <-- The drwav/drflac/stb_vorbis/etc. objects.
    pFile*: pointer            ##  FILE*. Only used when initialized with ma_encoder_init_file().
  ma_encoder_write_proc* = proc (pEncoder: ptr ma_encoder; pBufferIn: pointer;
                              bytesToWrite: csize): csize {.cdecl.}
  ma_encoder_seek_proc* = proc (pEncoder: ptr ma_encoder; byteOffset: cint;
                             origin: ma_seek_origin): ma_bool32 {.cdecl.}
  ma_encoder_init_proc* = proc (pEncoder: ptr ma_encoder): ma_result {.cdecl.}
  ma_encoder_uninit_proc* = proc (pEncoder: ptr ma_encoder) {.cdecl.}
  ma_encoder_write_pcm_frames_proc* = proc (pEncoder: ptr ma_encoder;
      pFramesIn: pointer; frameCount: ma_uint64): ma_uint64 {.cdecl.}
  ma_encoder_config* {.bycopy.} = object
    resourceFormat*: ma_resource_format
    format*: ma_format
    channels*: ma_uint32
    sampleRate*: ma_uint32
    allocationCallbacks*: ma_allocation_callbacks


proc ma_encoder_config_init*(resourceFormat: ma_resource_format; format: ma_format;
                            channels: ma_uint32; sampleRate: ma_uint32): ma_encoder_config


proc ma_encoder_init*(onWrite: ma_encoder_write_proc; onSeek: ma_encoder_seek_proc;
                     pUserData: pointer; pConfig: ptr ma_encoder_config;
                     pEncoder: ptr ma_encoder): ma_result
proc ma_encoder_init_file*(pFilePath: cstring; pConfig: ptr ma_encoder_config;
                          pEncoder: ptr ma_encoder): ma_result
proc ma_encoder_init_file_w*(pFilePath: ptr wchar_t; pConfig: ptr ma_encoder_config;
                            pEncoder: ptr ma_encoder): ma_result
proc ma_encoder_uninit*(pEncoder: ptr ma_encoder)
proc ma_encoder_write_pcm_frames*(pEncoder: ptr ma_encoder; pFramesIn: pointer;
                                 frameCount: ma_uint64): ma_uint64
## ***********************************************************************************************************************************************************
## ***********************************************************************************************************************************************************
##
## Generation
##
## **********************************************************************************************************************************************************

when not defined(MA_NO_GENERATION):
  type
    ma_waveform_type* = enum
      ma_waveform_type_sine, ma_waveform_type_square, ma_waveform_type_triangle,
      ma_waveform_type_sawtooth
    ma_waveform_config* {.bycopy.} = object
      format*: ma_format
      channels*: ma_uint32
      sampleRate*: ma_uint32
      `type`*: ma_waveform_type
      amplitude*: cdouble
      frequency*: cdouble

  proc ma_waveform_config_init*(format: ma_format; channels: ma_uint32;
                               sampleRate: ma_uint32; `type`: ma_waveform_type;
                               amplitude: cdouble; frequency: cdouble): ma_waveform_config
  type
    ma_waveform* {.bycopy.} = object
      ds*: ma_data_source_callbacks
      config*: ma_waveform_config
      advance*: cdouble
      time*: cdouble

  proc ma_waveform_init*(pConfig: ptr ma_waveform_config; pWaveform: ptr ma_waveform): ma_result
  proc ma_waveform_read_pcm_frames*(pWaveform: ptr ma_waveform; pFramesOut: pointer;
                                   frameCount: ma_uint64): ma_uint64
  proc ma_waveform_seek_to_pcm_frame*(pWaveform: ptr ma_waveform;
                                     frameIndex: ma_uint64): ma_result
  proc ma_waveform_set_amplitude*(pWaveform: ptr ma_waveform; amplitude: cdouble): ma_result
  proc ma_waveform_set_frequency*(pWaveform: ptr ma_waveform; frequency: cdouble): ma_result
  proc ma_waveform_set_sample_rate*(pWaveform: ptr ma_waveform;
                                   sampleRate: ma_uint32): ma_result
  type
    ma_noise_type* = enum
      ma_noise_type_white, ma_noise_type_pink, ma_noise_type_brownian
    ma_noise_config* {.bycopy.} = object
      format*: ma_format
      channels*: ma_uint32
      `type`*: ma_noise_type
      seed*: ma_int32
      amplitude*: cdouble
      duplicateChannels*: ma_bool32

  proc ma_noise_config_init*(format: ma_format; channels: ma_uint32;
                            `type`: ma_noise_type; seed: ma_int32;
                            amplitude: cdouble): ma_noise_config
  type
    ma_noise* = object

  proc ma_noise_init*(pConfig: ptr ma_noise_config; pNoise: ptr ma_noise): ma_result
  proc ma_noise_read_pcm_frames*(pNoise: ptr ma_noise; pFramesOut: pointer;
                                frameCount: ma_uint64): ma_uint64

proc ma_decoder_size*(): csize
proc ma_device_size*(): csize
proc ma_device_config_size*(): csize
proc ma_device_config_init_with_decoder*(deviceConfig: ptr ma_device_config, deviceType: ma_device_type, decoder: ptr ma_decoder, data_callback: ma_device_callback_proc)
