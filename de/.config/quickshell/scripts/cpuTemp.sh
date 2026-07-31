#!/usr/bin/env bash

<< 'COMMENT'
This script is used to display the current CPU temperature in the status bar. 
It uses the `sensors` command from the lm-sensors package to get the CPU temperature information.

Required - `lm-sensors`
COMMENT

# Gets the raw CPU Temp
RAW_TEMP="$(sensors | grep "Package id 0:" | awk '{print $4}' | sed 's/+//;s/°C//')"

# Round the Raw CPU Temp to the nearest whole number
TEMP="$(printf "%.0f" ${RAW_TEMP})"

# Print Temp
echo ${TEMP}
