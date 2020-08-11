#define MINIAUDIO_IMPLEMENTATION
#define DRWAV_IMPLEMENTATION
#include "miniaudio.h"

ma_decoder* ma_decoder_new() {
  return malloc(sizeof(ma_decoder));
}

ma_device_config* ma_device_config_new() {
  return malloc(sizeof(ma_device_config));
}

ma_device* ma_device_new() {
  return malloc(sizeof(ma_device));
}


ma_device_config* ma_device_config_init_with_decoder(ma_device_type deviceType, ma_decoder* decoder, ma_device_callback_proc data_callback) {
  ma_device_config *device_config = ma_device_config_new();
  *device_config = ma_device_config_init(ma_device_type_playback);
  device_config->playback.format   = decoder->outputFormat;
  device_config->playback.channels = decoder->outputChannels;
  device_config->sampleRate        = decoder->outputSampleRate;
  device_config->dataCallback      = data_callback;
  device_config->pUserData         = decoder;
  return device_config;
}
