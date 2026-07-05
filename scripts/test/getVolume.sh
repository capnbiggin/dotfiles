#!/usr/bin/env bash

GETVOL="$(wpctl get-volume 59 | awk '{print $2 * 100}')"

echo "${GETVOL}%"
