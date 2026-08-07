#!/usr/bin/env bash

<< 'COMMENT'
This script is used to display the current volume level in the status bar.
It uses the `wpctl` command to get the volume information from WirePlumber.

Required - `wireplumber` & `pipewire`
COMMENT


OUTPUT_ID="@DEFAULT_AUDIO_SINK@"

RAW_VOL="$(wpctl get-volume ${OUTPUT_ID})"
VOL_FRACTION="$(echo ${RAW_VOL} | awk '{print $2}')"
VOL_PERCENT="$(awk -v v="$VOL_FRACTION" 'BEGIN{printf "%d", (v * 100) + 0.5}')"

if [[ ${RAW_VOL} == *MUTED* ]]; then
  MUTED=1
else
  MUTED=0
fi

if [[ ${MUTED} -eq 1 ]]; then
  echo "󰸈 Muted"
else
  echo "󰕾 ${VOL_PERCENT}%"
fi
