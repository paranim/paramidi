{.compile: "dr_wav.c".}

type
  drwav_int8* = cchar
  drwav_uint8* = cuchar
  drwav_int16* = cshort
  drwav_uint16* = cushort
  drwav_int32* = cint
  drwav_uint32* = cuint
  drwav_int64* = int64
  drwav_uint64* = uint64
  drwav_bool32* = bool
  drwav_result* = drwav_int32
  wchar_t* = cshort

const
  DRWAV_SUCCESS* = 0
  DRWAV_ERROR* = -1
  DRWAV_INVALID_ARGS* = -2
  DRWAV_INVALID_OPERATION* = -3
  DRWAV_OUT_OF_MEMORY* = -4
  DRWAV_OUT_OF_RANGE* = -5
  DRWAV_ACCESS_DENIED* = -6
  DRWAV_DOES_NOT_EXIST* = -7
  DRWAV_ALREADY_EXISTS* = -8
  DRWAV_TOO_MANY_OPEN_FILES* = -9
  DRWAV_INVALID_FILE* = -10
  DRWAV_TOO_BIG* = -11
  DRWAV_PATH_TOO_LONG* = -12
  DRWAV_NAME_TOO_LONG* = -13
  DRWAV_NOT_DIRECTORY* = -14
  DRWAV_IS_DIRECTORY* = -15
  DRWAV_DIRECTORY_NOT_EMPTY* = -16
  DRWAV_END_OF_FILE* = -17
  DRWAV_NO_SPACE* = -18
  DRWAV_BUSY* = -19
  DRWAV_IO_ERROR* = -20
  DRWAV_INTERRUPT* = -21
  DRWAV_UNAVAILABLE* = -22
  DRWAV_ALREADY_IN_USE* = -23
  DRWAV_BAD_ADDRESS* = -24
  DRWAV_BAD_SEEK* = -25
  DRWAV_BAD_PIPE* = -26
  DRWAV_DEADLOCK* = -27
  DRWAV_TOO_MANY_LINKS* = -28
  DRWAV_NOT_IMPLEMENTED* = -29
  DRWAV_NO_MESSAGE* = -30
  DRWAV_BAD_MESSAGE* = -31
  DRWAV_NO_DATA_AVAILABLE* = -32
  DRWAV_INVALID_DATA* = -33
  DRWAV_TIMEOUT* = -34
  DRWAV_NO_NETWORK* = -35
  DRWAV_NOT_UNIQUE* = -36
  DRWAV_NOT_SOCKET* = -37
  DRWAV_NO_ADDRESS* = -38
  DRWAV_BAD_PROTOCOL* = -39
  DRWAV_PROTOCOL_UNAVAILABLE* = -40
  DRWAV_PROTOCOL_NOT_SUPPORTED* = -41
  DRWAV_PROTOCOL_FAMILY_NOT_SUPPORTED* = -42
  DRWAV_ADDRESS_FAMILY_NOT_SUPPORTED* = -43
  DRWAV_SOCKET_NOT_SUPPORTED* = -44
  DRWAV_CONNECTION_RESET* = -45
  DRWAV_ALREADY_CONNECTED* = -46
  DRWAV_NOT_CONNECTED* = -47
  DRWAV_CONNECTION_REFUSED* = -48
  DRWAV_NO_HOST* = -49
  DRWAV_IN_PROGRESS* = -50
  DRWAV_CANCELLED* = -51
  DRWAV_MEMORY_ALREADY_MAPPED* = -52
  DRWAV_AT_END* = -53

##  Common data formats.

const
  DR_WAVE_FORMAT_PCM* = 0x00000001
  DR_WAVE_FORMAT_ADPCM* = 0x00000002
  DR_WAVE_FORMAT_IEEE_FLOAT* = 0x00000003
  DR_WAVE_FORMAT_ALAW* = 0x00000006
  DR_WAVE_FORMAT_MULAW* = 0x00000007
  DR_WAVE_FORMAT_DVI_ADPCM* = 0x00000011
  DR_WAVE_FORMAT_EXTENSIBLE* = 0x0000FFFE

##  Constants.

const
  DRWAV_MAX_SMPL_LOOPS* = 1

##  Flags to pass into drwav_init_ex(), etc.

const
  DRWAV_SEQUENTIAL* = 0x00000001

proc drwav_version*(pMajor: ptr drwav_uint32; pMinor: ptr drwav_uint32;
                   pRevision: ptr drwav_uint32) {.cdecl, importc.}
proc drwav_version_string*(): cstring {.cdecl, importc.}
type
  INNER_C_UNION_stuff_21* {.bycopy.} = object {.union.}
    fourcc*: array[4, drwav_uint8]
    guid*: array[16, drwav_uint8]

  drwav_seek_origin* = enum
    drwav_seek_origin_start, drwav_seek_origin_current
  drwav_container* = enum
    drwav_container_riff, drwav_container_w64
  drwav_chunk_header* {.bycopy.} = object
    id*: INNER_C_UNION_stuff_21 ##  The size in bytes of the chunk.
    sizeInBytes*: drwav_uint64 ##
                             ##     RIFF = 2 byte alignment.
                             ##     W64  = 8 byte alignment.
                             ##
    paddingSize*: cuint

  drwav_fmt* {.bycopy.} = object
    formatTag*: drwav_uint16 ##
                           ##     The format tag exactly as specified in the wave file's "fmt" chunk. This can be used by applications
                           ##     that require support for data formats not natively supported by dr_wav.
                           ##
    ##  The number of channels making up the audio data. When this is set to 1 it is mono, 2 is stereo, etc.
    channels*: drwav_uint16    ##  The sample rate. Usually set to something like 44100.
    sampleRate*: drwav_uint32  ##  Average bytes per second. You probably don't need this, but it's left here for informational purposes.
    avgBytesPerSec*: drwav_uint32 ##  Block align. This is equal to the number of channels * bytes per sample.
    blockAlign*: drwav_uint16  ##  Bits per sample.
    bitsPerSample*: drwav_uint16 ##  The size of the extended data. Only used internally for validation, but left here for informational purposes.
    extendedSize*: drwav_uint16 ##
                              ##     The number of valid bits per sample. When <formatTag> is equal to WAVE_FORMAT_EXTENSIBLE, <bitsPerSample>
                              ##     is always rounded up to the nearest multiple of 8. This variable contains information about exactly how
                              ##     many bits are valid per sample. Mainly used for informational purposes.
                              ##
    validBitsPerSample*: drwav_uint16 ##  The channel mask. Not used at the moment.
    channelMask*: drwav_uint32 ##  The sub-format, exactly as specified by the wave file.
    subFormat*: array[16, drwav_uint8]




proc drwav_fmt_get_format*(pFMT: ptr drwav_fmt): drwav_uint16 {.cdecl, importc.}
##
## Callback for when data is read. Return value is the number of bytes actually read.
##
## pUserData   [in]  The user data that was passed to drwav_init() and family.
## pBufferOut  [out] The output buffer.
## bytesToRead [in]  The number of bytes to read.
##
## Returns the number of bytes actually read.
##
## A return value of less than bytesToRead indicates the end of the stream. Do _not_ return from this callback until
## either the entire bytesToRead is filled or you have reached the end of the stream.
##

type
  drwav_read_proc* = proc (pUserData: pointer; pBufferOut: pointer; bytesToRead: csize): csize {.cdecl.}

##
## Callback for when data is written. Returns value is the number of bytes actually written.
##
## pUserData    [in]  The user data that was passed to drwav_init_write() and family.
## pData        [out] A pointer to the data to write.
## bytesToWrite [in]  The number of bytes to write.
##
## Returns the number of bytes actually written.
##
## If the return value differs from bytesToWrite, it indicates an error.
##

type
  drwav_write_proc* = proc (pUserData: pointer; pData: pointer; bytesToWrite: csize): csize {.cdecl.}

##
## Callback for when data needs to be seeked.
##
## pUserData [in] The user data that was passed to drwav_init() and family.
## offset    [in] The number of bytes to move, relative to the origin. Will never be negative.
## origin    [in] The origin of the seek - the current position or the start of the stream.
##
## Returns whether or not the seek was successful.
##
## Whether or not it is relative to the beginning or current position is determined by the "origin" parameter which will be either drwav_seek_origin_start or
## drwav_seek_origin_current.
##

type
  drwav_seek_proc* = proc (pUserData: pointer; offset: cint; origin: drwav_seek_origin): drwav_bool32 {.cdecl.}

##
## Callback for when drwav_init_ex() finds a chunk.
##
## pChunkUserData    [in] The user data that was passed to the pChunkUserData parameter of drwav_init_ex() and family.
## onRead            [in] A pointer to the function to call when reading.
## onSeek            [in] A pointer to the function to call when seeking.
## pReadSeekUserData [in] The user data that was passed to the pReadSeekUserData parameter of drwav_init_ex() and family.
## pChunkHeader      [in] A pointer to an object containing basic header information about the chunk. Use this to identify the chunk.
## container         [in] Whether or not the WAV file is a RIFF or Wave64 container. If you're unsure of the difference, assume RIFF.
## pFMT              [in] A pointer to the object containing the contents of the "fmt" chunk.
##
## Returns the number of bytes read + seeked.
##
## To read data from the chunk, call onRead(), passing in pReadSeekUserData as the first parameter. Do the same for seeking with onSeek(). The return value must
## be the total number of bytes you have read _plus_ seeked.
##
## Use the `container` argument to discriminate the fields in `pChunkHeader->id`. If the container is `drwav_container_riff` you should use `id.fourcc`,
## otherwise you should use `id.guid`.
##
## The `pFMT` parameter can be used to determine the data format of the wave file. Use `drwav_fmt_get_format()` to get the sample format, which will be one of the
## `DR_WAVE_FORMAT_*` identifiers.
##
## The read pointer will be sitting on the first byte after the chunk's header. You must not attempt to read beyond the boundary of the chunk.
##

type
  drwav_chunk_proc* = proc (pChunkUserData: pointer; onRead: drwav_read_proc;
                         onSeek: drwav_seek_proc; pReadSeekUserData: pointer;
                         pChunkHeader: ptr drwav_chunk_header;
                         container: drwav_container; pFMT: ptr drwav_fmt): drwav_uint64 {.cdecl.}
  drwav_allocation_callbacks* {.bycopy.} = object
    pUserData*: pointer
    onMalloc*: proc (sz: csize; pUserData: pointer): pointer {.cdecl.}
    onRealloc*: proc (p: pointer; sz: csize; pUserData: pointer): pointer {.cdecl.}
    onFree*: proc (p: pointer; pUserData: pointer) {.cdecl.}


##  Structure for internal use. Only used for loaders opened with drwav_init_memory().

type
  drwav_memory_stream* {.bycopy.} = object
    data*: ptr drwav_uint8
    dataSize*: csize
    currentReadPos*: csize


##  Structure for internal use. Only used for writers opened with drwav_init_memory_write().

type
  drwav_memory_stream_write* {.bycopy.} = object
    ppData*: ptr pointer
    pDataSize*: ptr csize
    dataSize*: csize
    dataCapacity*: csize
    currentWritePos*: csize

  drwav_data_format* {.bycopy.} = object
    container*: drwav_container ##  RIFF, W64.
    format*: drwav_uint32      ##  DR_WAVE_FORMAT_*
    channels*: drwav_uint32
    sampleRate*: drwav_uint32
    bitsPerSample*: drwav_uint32


##  See the following for details on the 'smpl' chunk: https://sites.google.com/site/musicgapi/technical-documents/wav-file-format#smpl

type
  INNER_C_STRUCT_stuff_278* {.bycopy.} = object
    iCurrentPCMFrame*: drwav_uint64 ##  The index of the next PCM frame that will be read by drwav_read_*(). This is used with "totalPCMFrameCount" to ensure we don't read excess samples at the end of the last block.

  INNER_C_STRUCT_stuff_284* {.bycopy.} = object
    bytesRemainingInBlock*: drwav_uint32
    predictor*: array[2, drwav_uint16]
    delta*: array[2, drwav_int32]
    cachedFrames*: array[4, drwav_int32] ##  Samples are stored in this cache during decoding.
    cachedFrameCount*: drwav_uint32
    prevFrames*: array[2, array[2, drwav_int32]] ##  The previous 2 samples for each channel (2 channels at most).

  INNER_C_STRUCT_stuff_295* {.bycopy.} = object
    bytesRemainingInBlock*: drwav_uint32
    predictor*: array[2, drwav_int32]
    stepIndex*: array[2, drwav_int32]
    cachedFrames*: array[16, drwav_int32] ##  Samples are stored in this cache during decoding.
    cachedFrameCount*: drwav_uint32

  drwav_smpl_loop* {.bycopy.} = object
    cuePointId*: drwav_uint32
    `type`*: drwav_uint32
    start*: drwav_uint32
    `end`*: drwav_uint32
    fraction*: drwav_uint32
    playCount*: drwav_uint32

  drwav_smpl* {.bycopy.} = object
    manufacturer*: drwav_uint32
    product*: drwav_uint32
    samplePeriod*: drwav_uint32
    midiUnityNotes*: drwav_uint32
    midiPitchFraction*: drwav_uint32
    smpteFormat*: drwav_uint32
    smpteOffset*: drwav_uint32
    numSampleLoops*: drwav_uint32
    samplerData*: drwav_uint32
    loops*: array[DRWAV_MAX_SMPL_LOOPS, drwav_smpl_loop]

  drwav* {.bycopy.} = object
    onRead*: drwav_read_proc   ##  A pointer to the function to call when more data is needed.
    ##  A pointer to the function to call when data needs to be written. Only used when the drwav object is opened in write mode.
    onWrite*: drwav_write_proc ##  A pointer to the function to call when the wav file needs to be seeked.
    onSeek*: drwav_seek_proc   ##  The user data to pass to callbacks.
    pUserData*: pointer        ##  Allocation callbacks.
    allocationCallbacks*: drwav_allocation_callbacks ##  Whether or not the WAV file is formatted as a standard RIFF file or W64.
    container*: drwav_container ##  Structure containing format information exactly as specified by the wav file.
    fmt*: drwav_fmt            ##  The sample rate. Will be set to something like 44100.
    sampleRate*: drwav_uint32  ##  The number of channels. This will be set to 1 for monaural streams, 2 for stereo, etc.
    channels*: drwav_uint16    ##  The bits per sample. Will be set to something like 16, 24, etc.
    bitsPerSample*: drwav_uint16 ##  Equal to fmt.formatTag, or the value specified by fmt.subFormat if fmt.formatTag is equal to 65534 (WAVE_FORMAT_EXTENSIBLE).
    translatedFormatTag*: drwav_uint16 ##  The total number of PCM frames making up the audio data.
    totalPCMFrameCount*: drwav_uint64 ##  The size in bytes of the data chunk.
    dataChunkDataSize*: drwav_uint64 ##  The position in the stream of the first byte of the data chunk. This is used for seeking.
    dataChunkDataPos*: drwav_uint64 ##  The number of bytes remaining in the data chunk.
    bytesRemaining*: drwav_uint64 ##
                                ##     Only used in sequential write mode. Keeps track of the desired size of the "data" chunk at the point of initialization time. Always
                                ##     set to 0 for non-sequential writes and when the drwav object is opened in read mode. Used for validation.
                                ##
    dataChunkDataSizeTargetWrite*: drwav_uint64 ##  Keeps track of whether or not the wav writer was initialized in sequential mode.
    isSequentialWrite*: drwav_bool32 ##  smpl chunk.
    smpl*: drwav_smpl          ##  A hack to avoid a DRWAV_MALLOC() when opening a decoder with drwav_init_memory().
    memoryStream*: drwav_memory_stream
    memoryStreamWrite*: drwav_memory_stream_write ##  Generic data for compressed formats. This data is shared across all block-compressed formats.
    compressed*: INNER_C_STRUCT_stuff_278 ##  Microsoft ADPCM specific data.
    msadpcm*: INNER_C_STRUCT_stuff_284 ##  IMA ADPCM specific data.
    ima*: INNER_C_STRUCT_stuff_295


##
## Initializes a pre-allocated drwav object for reading.
##
## pWav                         [out]          A pointer to the drwav object being initialized.
## onRead                       [in]           The function to call when data needs to be read from the client.
## onSeek                       [in]           The function to call when the read position of the client data needs to move.
## onChunk                      [in, optional] The function to call when a chunk is enumerated at initialized time.
## pUserData, pReadSeekUserData [in, optional] A pointer to application defined data that will be passed to onRead and onSeek.
## pChunkUserData               [in, optional] A pointer to application defined data that will be passed to onChunk.
## flags                        [in, optional] A set of flags for controlling how things are loaded.
##
## Returns true if successful; false otherwise.
##
## Close the loader with drwav_uninit().
##
## This is the lowest level function for initializing a WAV file. You can also use drwav_init_file() and drwav_init_memory()
## to open the stream from a file or from a block of memory respectively.
##
## Possible values for flags:
##   DRWAV_SEQUENTIAL: Never perform a backwards seek while loading. This disables the chunk callback and will cause this function
##                     to return as soon as the data chunk is found. Any chunks after the data chunk will be ignored.
##
## drwav_init() is equivalent to "drwav_init_ex(pWav, onRead, onSeek, NULL, pUserData, NULL, 0);".
##
## The onChunk callback is not called for the WAVE or FMT chunks. The contents of the FMT chunk can be read from pWav->fmt
## after the function returns.
##
## See also: drwav_init_file(), drwav_init_memory(), drwav_uninit()
##

proc drwav_init*(pWav: ptr drwav; onRead: drwav_read_proc; onSeek: drwav_seek_proc;
                pUserData: pointer;
                pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
proc drwav_init_ex*(pWav: ptr drwav; onRead: drwav_read_proc; onSeek: drwav_seek_proc;
                   onChunk: drwav_chunk_proc; pReadSeekUserData: pointer;
                   pChunkUserData: pointer; flags: drwav_uint32;
                   pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
##
## Initializes a pre-allocated drwav object for writing.
##
## onWrite   [in]           The function to call when data needs to be written.
## onSeek    [in]           The function to call when the write position needs to move.
## pUserData [in, optional] A pointer to application defined data that will be passed to onWrite and onSeek.
##
## Returns true if successful; false otherwise.
##
## Close the writer with drwav_uninit().
##
## This is the lowest level function for initializing a WAV file. You can also use drwav_init_file_write() and drwav_init_memory_write()
## to open the stream from a file or from a block of memory respectively.
##
## If the total sample count is known, you can use drwav_init_write_sequential(). This avoids the need for dr_wav to perform
## a post-processing step for storing the total sample count and the size of the data chunk which requires a backwards seek.
##
## See also: drwav_init_file_write(), drwav_init_memory_write(), drwav_uninit()
##

proc drwav_init_write*(pWav: ptr drwav; pFormat: ptr drwav_data_format;
                      onWrite: drwav_write_proc; onSeek: drwav_seek_proc;
                      pUserData: pointer;
                      pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
proc drwav_init_write_sequential*(pWav: ptr drwav; pFormat: ptr drwav_data_format;
                                 totalSampleCount: drwav_uint64;
                                 onWrite: drwav_write_proc; pUserData: pointer;
    pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
proc drwav_init_write_sequential_pcm_frames*(pWav: ptr drwav;
    pFormat: ptr drwav_data_format; totalPCMFrameCount: drwav_uint64;
    onWrite: drwav_write_proc; pUserData: pointer;
    pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
##
## Utility function to determine the target size of the entire data to be written (including all headers and chunks).
##
## Returns the target size in bytes.
##
## Useful if the application needs to know the size to allocate.
##
## Only writing to the RIFF chunk and one data chunk is currently supported.
##
## See also: drwav_init_write(), drwav_init_file_write(), drwav_init_memory_write()
##

proc drwav_target_write_size_bytes*(pFormat: ptr drwav_data_format;
                                   totalSampleCount: drwav_uint64): drwav_uint64 {.cdecl, importc.}
##
## Uninitializes the given drwav object.
##
## Use this only for objects initialized with drwav_init*() functions (drwav_init(), drwav_init_ex(), drwav_init_write(), drwav_init_write_sequential()).
##

proc drwav_uninit*(pWav: ptr drwav): drwav_result {.cdecl, importc.}
##
## Reads raw audio data.
##
## This is the lowest level function for reading audio data. It simply reads the given number of
## bytes of the raw internal sample data.
##
## Consider using drwav_read_pcm_frames_s16(), drwav_read_pcm_frames_s32() or drwav_read_pcm_frames_f32() for
## reading sample data in a consistent format.
##
## pBufferOut can be NULL in which case a seek will be performed.
##
## Returns the number of bytes actually read.
##

proc drwav_read_raw*(pWav: ptr drwav; bytesToRead: csize; pBufferOut: pointer): csize {.cdecl, importc.}
##
## Reads up to the specified number of PCM frames from the WAV file.
##
## The output data will be in the file's internal format, converted to native-endian byte order. Use
## drwav_read_pcm_frames_s16/f32/s32() to read data in a specific format.
##
## If the return value is less than <framesToRead> it means the end of the file has been reached or
## you have requested more PCM frames than can possibly fit in the output buffer.
##
## This function will only work when sample data is of a fixed size and uncompressed. If you are
## using a compressed format consider using drwav_read_raw() or drwav_read_pcm_frames_s16/s32/f32().
##
## pBufferOut can be NULL in which case a seek will be performed.
##

proc drwav_read_pcm_frames*(pWav: ptr drwav; framesToRead: drwav_uint64;
                           pBufferOut: pointer): drwav_uint64 {.cdecl, importc.}
proc drwav_read_pcm_frames_le*(pWav: ptr drwav; framesToRead: drwav_uint64;
                              pBufferOut: pointer): drwav_uint64 {.cdecl, importc.}
proc drwav_read_pcm_frames_be*(pWav: ptr drwav; framesToRead: drwav_uint64;
                              pBufferOut: pointer): drwav_uint64 {.cdecl, importc.}
##
## Seeks to the given PCM frame.
##
## Returns true if successful; false otherwise.
##

proc drwav_seek_to_pcm_frame*(pWav: ptr drwav; targetFrameIndex: drwav_uint64): drwav_bool32 {.cdecl, importc.}
##
## Writes raw audio data.
##
## Returns the number of bytes actually written. If this differs from bytesToWrite, it indicates an error.
##

proc drwav_write_raw*(pWav: ptr drwav; bytesToWrite: csize; pData: pointer): csize {.cdecl, importc.}
##
## Writes PCM frames.
##
## Returns the number of PCM frames written.
##
## Input samples need to be in native-endian byte order. On big-endian architectures the input data will be converted to
## little-endian. Use drwav_write_raw() to write raw audio data without performing any conversion.
##

proc drwav_write_pcm_frames*(pWav: ptr drwav; framesToWrite: drwav_uint64;
                            pData: pointer): drwav_uint64 {.cdecl, importc.}
proc drwav_write_pcm_frames_le*(pWav: ptr drwav; framesToWrite: drwav_uint64;
                               pData: pointer): drwav_uint64 {.cdecl, importc.}
proc drwav_write_pcm_frames_be*(pWav: ptr drwav; framesToWrite: drwav_uint64;
                               pData: pointer): drwav_uint64 {.cdecl, importc.}
##  Conversion Utilities

when not defined(DR_WAV_NO_CONVERSION_API):
  ##
  ## Reads a chunk of audio data and converts it to signed 16-bit PCM samples.
  ##
  ## pBufferOut can be NULL in which case a seek will be performed.
  ##
  ## Returns the number of PCM frames actually read.
  ##
  ## If the return value is less than <framesToRead> it means the end of the file has been reached.
  ##
  proc drwav_read_pcm_frames_s16*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                 pBufferOut: ptr drwav_int16): drwav_uint64 {.cdecl, importc.}
  proc drwav_read_pcm_frames_s16le*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                   pBufferOut: ptr drwav_int16): drwav_uint64 {.cdecl, importc.}
  proc drwav_read_pcm_frames_s16be*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                   pBufferOut: ptr drwav_int16): drwav_uint64 {.cdecl, importc.}
  ##  Low-level function for converting unsigned 8-bit PCM samples to signed 16-bit PCM samples.
  proc drwav_u8_to_s16*(pOut: ptr drwav_int16; pIn: ptr drwav_uint8; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 24-bit PCM samples to signed 16-bit PCM samples.
  proc drwav_s24_to_s16*(pOut: ptr drwav_int16; pIn: ptr drwav_uint8;
                        sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 32-bit PCM samples to signed 16-bit PCM samples.
  proc drwav_s32_to_s16*(pOut: ptr drwav_int16; pIn: ptr drwav_int32;
                        sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting IEEE 32-bit floating point samples to signed 16-bit PCM samples.
  proc drwav_f32_to_s16*(pOut: ptr drwav_int16; pIn: ptr cfloat; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting IEEE 64-bit floating point samples to signed 16-bit PCM samples.
  proc drwav_f64_to_s16*(pOut: ptr drwav_int16; pIn: ptr cdouble; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting A-law samples to signed 16-bit PCM samples.
  proc drwav_alaw_to_s16*(pOut: ptr drwav_int16; pIn: ptr drwav_uint8;
                         sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting u-law samples to signed 16-bit PCM samples.
  proc drwav_mulaw_to_s16*(pOut: ptr drwav_int16; pIn: ptr drwav_uint8;
                          sampleCount: csize) {.cdecl, importc.}
  ##
  ## Reads a chunk of audio data and converts it to IEEE 32-bit floating point samples.
  ##
  ## pBufferOut can be NULL in which case a seek will be performed.
  ##
  ## Returns the number of PCM frames actually read.
  ##
  ## If the return value is less than <framesToRead> it means the end of the file has been reached.
  ##
  proc drwav_read_pcm_frames_f32*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                 pBufferOut: ptr cfloat): drwav_uint64 {.cdecl, importc.}
  proc drwav_read_pcm_frames_f32le*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                   pBufferOut: ptr cfloat): drwav_uint64 {.cdecl, importc.}
  proc drwav_read_pcm_frames_f32be*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                   pBufferOut: ptr cfloat): drwav_uint64 {.cdecl, importc.}
  ##  Low-level function for converting unsigned 8-bit PCM samples to IEEE 32-bit floating point samples.
  proc drwav_u8_to_f32*(pOut: ptr cfloat; pIn: ptr drwav_uint8; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 16-bit PCM samples to IEEE 32-bit floating point samples.
  proc drwav_s16_to_f32*(pOut: ptr cfloat; pIn: ptr drwav_int16; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 24-bit PCM samples to IEEE 32-bit floating point samples.
  proc drwav_s24_to_f32*(pOut: ptr cfloat; pIn: ptr drwav_uint8; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 32-bit PCM samples to IEEE 32-bit floating point samples.
  proc drwav_s32_to_f32*(pOut: ptr cfloat; pIn: ptr drwav_int32; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting IEEE 64-bit floating point samples to IEEE 32-bit floating point samples.
  proc drwav_f64_to_f32*(pOut: ptr cfloat; pIn: ptr cdouble; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting A-law samples to IEEE 32-bit floating point samples.
  proc drwav_alaw_to_f32*(pOut: ptr cfloat; pIn: ptr drwav_uint8; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting u-law samples to IEEE 32-bit floating point samples.
  proc drwav_mulaw_to_f32*(pOut: ptr cfloat; pIn: ptr drwav_uint8; sampleCount: csize) {.cdecl, importc.}
  ##
  ## Reads a chunk of audio data and converts it to signed 32-bit PCM samples.
  ##
  ## pBufferOut can be NULL in which case a seek will be performed.
  ##
  ## Returns the number of PCM frames actually read.
  ##
  ## If the return value is less than <framesToRead> it means the end of the file has been reached.
  ##
  proc drwav_read_pcm_frames_s32*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                 pBufferOut: ptr drwav_int32): drwav_uint64 {.cdecl, importc.}
  proc drwav_read_pcm_frames_s32le*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                   pBufferOut: ptr drwav_int32): drwav_uint64 {.cdecl, importc.}
  proc drwav_read_pcm_frames_s32be*(pWav: ptr drwav; framesToRead: drwav_uint64;
                                   pBufferOut: ptr drwav_int32): drwav_uint64 {.cdecl, importc.}
  ##  Low-level function for converting unsigned 8-bit PCM samples to signed 32-bit PCM samples.
  proc drwav_u8_to_s32*(pOut: ptr drwav_int32; pIn: ptr drwav_uint8; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 16-bit PCM samples to signed 32-bit PCM samples.
  proc drwav_s16_to_s32*(pOut: ptr drwav_int32; pIn: ptr drwav_int16;
                        sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting signed 24-bit PCM samples to signed 32-bit PCM samples.
  proc drwav_s24_to_s32*(pOut: ptr drwav_int32; pIn: ptr drwav_uint8;
                        sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting IEEE 32-bit floating point samples to signed 32-bit PCM samples.
  proc drwav_f32_to_s32*(pOut: ptr drwav_int32; pIn: ptr cfloat; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting IEEE 64-bit floating point samples to signed 32-bit PCM samples.
  proc drwav_f64_to_s32*(pOut: ptr drwav_int32; pIn: ptr cdouble; sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting A-law samples to signed 32-bit PCM samples.
  proc drwav_alaw_to_s32*(pOut: ptr drwav_int32; pIn: ptr drwav_uint8;
                         sampleCount: csize) {.cdecl, importc.}
  ##  Low-level function for converting u-law samples to signed 32-bit PCM samples.
  proc drwav_mulaw_to_s32*(pOut: ptr drwav_int32; pIn: ptr drwav_uint8;
                          sampleCount: csize) {.cdecl, importc.}
##  High-Level Convenience Helpers

when not defined(DR_WAV_NO_STDIO):
  ##
  ## Helper for initializing a wave file for reading using stdio.
  ##
  ## This holds the internal FILE object until drwav_uninit() is called. Keep this in mind if you're caching drwav
  ## objects because the operating system may restrict the number of file handles an application can have open at
  ## any given time.
  ##
  proc drwav_init_file*(pWav: ptr drwav; filename: cstring;
                       pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_ex*(pWav: ptr drwav; filename: cstring;
                          onChunk: drwav_chunk_proc; pChunkUserData: pointer;
                          flags: drwav_uint32;
                          pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_w*(pWav: ptr drwav; filename: ptr wchar_t;
                         pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_ex_w*(pWav: ptr drwav; filename: ptr wchar_t;
                            onChunk: drwav_chunk_proc; pChunkUserData: pointer;
                            flags: drwav_uint32; pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  ##
  ## Helper for initializing a wave file for writing using stdio.
  ##
  ## This holds the internal FILE object until drwav_uninit() is called. Keep this in mind if you're caching drwav
  ## objects because the operating system may restrict the number of file handles an application can have open at
  ## any given time.
  ##
  proc drwav_init_file_write*(pWav: ptr drwav; filename: cstring;
                             pFormat: ptr drwav_data_format; pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_write_sequential*(pWav: ptr drwav; filename: cstring;
                                        pFormat: ptr drwav_data_format;
                                        totalSampleCount: drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_write_sequential_pcm_frames*(pWav: ptr drwav;
      filename: cstring; pFormat: ptr drwav_data_format;
      totalPCMFrameCount: drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_write_w*(pWav: ptr drwav; filename: ptr wchar_t;
                               pFormat: ptr drwav_data_format; pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_write_sequential_w*(pWav: ptr drwav; filename: ptr wchar_t;
      pFormat: ptr drwav_data_format; totalSampleCount: drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
  proc drwav_init_file_write_sequential_pcm_frames_w*(pWav: ptr drwav;
      filename: ptr wchar_t; pFormat: ptr drwav_data_format;
      totalPCMFrameCount: drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
##
## Helper for initializing a loader from a pre-allocated memory buffer.
##
## This does not create a copy of the data. It is up to the application to ensure the buffer remains valid for
## the lifetime of the drwav object.
##
## The buffer should contain the contents of the entire wave file, not just the sample data.
##

proc drwav_init_memory*(pWav: ptr drwav; data: pointer; dataSize: csize;
                       pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
proc drwav_init_memory_ex*(pWav: ptr drwav; data: pointer; dataSize: csize;
                          onChunk: drwav_chunk_proc; pChunkUserData: pointer;
                          flags: drwav_uint32;
                          pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
##
## Helper for initializing a writer which outputs data to a memory buffer.
##
## dr_wav will manage the memory allocations, however it is up to the caller to free the data with drwav_free().
##
## The buffer will remain allocated even after drwav_uninit() is called. Indeed, the buffer should not be
## considered valid until after drwav_uninit() has been called anyway.
##

proc drwav_init_memory_write*(pWav: ptr drwav; ppData: ptr pointer;
                             pDataSize: ptr csize; pFormat: ptr drwav_data_format;
    pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
proc drwav_init_memory_write_sequential*(pWav: ptr drwav; ppData: ptr pointer;
                                        pDataSize: ptr csize;
                                        pFormat: ptr drwav_data_format;
                                        totalSampleCount: drwav_uint64;
    pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
proc drwav_init_memory_write_sequential_pcm_frames*(pWav: ptr drwav;
    ppData: ptr pointer; pDataSize: ptr csize; pFormat: ptr drwav_data_format;
    totalPCMFrameCount: drwav_uint64;
    pAllocationCallbacks: ptr drwav_allocation_callbacks): drwav_bool32 {.cdecl, importc.}
when not defined(DR_WAV_NO_CONVERSION_API):
  ##
  ## Opens and reads an entire wav file in a single operation.
  ##
  ## The return value is a heap-allocated buffer containing the audio data. Use drwav_free() to free the buffer.
  ##
  proc drwav_open_and_read_pcm_frames_s16*(onRead: drwav_read_proc;
      onSeek: drwav_seek_proc; pUserData: pointer; channelsOut: ptr cuint;
      sampleRateOut: ptr cuint; totalFrameCountOut: ptr drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int16 {.cdecl, importc.}
  proc drwav_open_and_read_pcm_frames_f32*(onRead: drwav_read_proc;
      onSeek: drwav_seek_proc; pUserData: pointer; channelsOut: ptr cuint;
      sampleRateOut: ptr cuint; totalFrameCountOut: ptr drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr cfloat {.cdecl, importc.}
  proc drwav_open_and_read_pcm_frames_s32*(onRead: drwav_read_proc;
      onSeek: drwav_seek_proc; pUserData: pointer; channelsOut: ptr cuint;
      sampleRateOut: ptr cuint; totalFrameCountOut: ptr drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int32 {.cdecl, importc.}
  when not defined(DR_WAV_NO_STDIO):
    ##
    ## Opens and decodes an entire wav file in a single operation.
    ##
    ## The return value is a heap-allocated buffer containing the audio data. Use drwav_free() to free the buffer.
    ##
    proc drwav_open_file_and_read_pcm_frames_s16*(filename: cstring;
        channelsOut: ptr cuint; sampleRateOut: ptr cuint;
        totalFrameCountOut: ptr drwav_uint64;
        pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int16 {.cdecl, importc.}
    proc drwav_open_file_and_read_pcm_frames_f32*(filename: cstring;
        channelsOut: ptr cuint; sampleRateOut: ptr cuint;
        totalFrameCountOut: ptr drwav_uint64;
        pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr cfloat {.cdecl, importc.}
    proc drwav_open_file_and_read_pcm_frames_s32*(filename: cstring;
        channelsOut: ptr cuint; sampleRateOut: ptr cuint;
        totalFrameCountOut: ptr drwav_uint64;
        pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int32 {.cdecl, importc.}
    proc drwav_open_file_and_read_pcm_frames_s16_w*(filename: ptr wchar_t;
        channelsOut: ptr cuint; sampleRateOut: ptr cuint;
        totalFrameCountOut: ptr drwav_uint64;
        pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int16 {.cdecl, importc.}
    proc drwav_open_file_and_read_pcm_frames_f32_w*(filename: ptr wchar_t;
        channelsOut: ptr cuint; sampleRateOut: ptr cuint;
        totalFrameCountOut: ptr drwav_uint64;
        pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr cfloat {.cdecl, importc.}
    proc drwav_open_file_and_read_pcm_frames_s32_w*(filename: ptr wchar_t;
        channelsOut: ptr cuint; sampleRateOut: ptr cuint;
        totalFrameCountOut: ptr drwav_uint64;
        pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int32 {.cdecl, importc.}
  ##
  ## Opens and decodes an entire wav file from a block of memory in a single operation.
  ##
  ## The return value is a heap-allocated buffer containing the audio data. Use drwav_free() to free the buffer.
  ##
  proc drwav_open_memory_and_read_pcm_frames_s16*(data: pointer; dataSize: csize;
      channelsOut: ptr cuint; sampleRateOut: ptr cuint;
      totalFrameCountOut: ptr drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int16 {.cdecl, importc.}
  proc drwav_open_memory_and_read_pcm_frames_f32*(data: pointer; dataSize: csize;
      channelsOut: ptr cuint; sampleRateOut: ptr cuint;
      totalFrameCountOut: ptr drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr cfloat {.cdecl, importc.}
  proc drwav_open_memory_and_read_pcm_frames_s32*(data: pointer; dataSize: csize;
      channelsOut: ptr cuint; sampleRateOut: ptr cuint;
      totalFrameCountOut: ptr drwav_uint64;
      pAllocationCallbacks: ptr drwav_allocation_callbacks): ptr drwav_int32 {.cdecl, importc.}
##  Frees data that was allocated internally by dr_wav.

proc drwav_free*(p: pointer; pAllocationCallbacks: ptr drwav_allocation_callbacks) {.cdecl, importc.}
##  Converts bytes from a wav stream to a sized type of native endian.

proc drwav_bytes_to_u16*(data: ptr drwav_uint8): drwav_uint16 {.cdecl, importc.}
proc drwav_bytes_to_s16*(data: ptr drwav_uint8): drwav_int16 {.cdecl, importc.}
proc drwav_bytes_to_u32*(data: ptr drwav_uint8): drwav_uint32 {.cdecl, importc.}
proc drwav_bytes_to_s32*(data: ptr drwav_uint8): drwav_int32 {.cdecl, importc.}
proc drwav_bytes_to_u64*(data: ptr drwav_uint8): drwav_uint64 {.cdecl, importc.}
proc drwav_bytes_to_s64*(data: ptr drwav_uint8): drwav_int64 {.cdecl, importc.}
##  Compares a GUID for the purpose of checking the type of a Wave64 chunk.

proc drwav_guid_equal*(a: array[16, drwav_uint8]; b: array[16, drwav_uint8]): drwav_bool32 {.cdecl, importc.}
##  Compares a four-character-code for the purpose of checking the type of a RIFF chunk.

proc drwav_fourcc_equal*(a: ptr drwav_uint8; b: cstring): drwav_bool32 {.cdecl, importc.}
