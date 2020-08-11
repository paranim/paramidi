#define MINIAUDIO_IMPLEMENTATION
#define DRWAV_IMPLEMENTATION
#include "miniaudio.h"

size_t ma_decoder_size() {
  return sizeof(ma_decoder);
}

size_t ma_device_config_size() {
  return sizeof(ma_device_config);
}

size_t ma_device_size() {
  return sizeof(ma_device);
}


void ma_device_config_init_with_decoder(ma_device_config *device_config, ma_device_type deviceType, ma_decoder* decoder, ma_device_callback_proc data_callback) {
  *device_config = ma_device_config_init(ma_device_type_playback);
  device_config->playback.format   = decoder->outputFormat;
  device_config->playback.channels = decoder->outputChannels;
  device_config->sampleRate        = decoder->outputSampleRate;
  device_config->dataCallback      = data_callback;
  device_config->pUserData         = decoder;
}
