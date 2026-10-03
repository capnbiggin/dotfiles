import QtQuick

import qs.theme
import qs.components
import qs.services

Pill {
  icon: Media.playing ? "music_note" : "pause"
  accent: Theme.blue
  text: Media.label
  visible: Media.available
}
