#!/usr/bin/env bash

ACTUAL_USER="${SUDO_USER:-$USER}"
ACTUAL_HOME=$(eval echo "~$ACTUAL_USER")

# echo "$ACTUAL_HOME"

if [[ $(eval hostname) = Zues ]]; then
  echo "Yes"
else
  echo "NO"
fi

