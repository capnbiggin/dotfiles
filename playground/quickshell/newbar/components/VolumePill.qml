import QtQuick

import qs.theme
import qs.components
import qs.services

Pill {
  icon: Audio.icon
  accent: Theme.blue
  text: Audio.muted ? "MUTED" : Audio.label

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onPressed: Audio.toggleMute()
    onWheel: (wheel.angleDelta.y > 0) ? Audio.setVolume(Audio.volume + 0.01) : Audio.setVolume(Audio.volume - 0.01)
  }
}
