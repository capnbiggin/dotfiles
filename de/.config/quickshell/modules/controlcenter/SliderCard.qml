import QtQuick
import Quickshell

import qs.theme
import qs.components
import qs.services

Column {
  width: parent.width
  spacing: 10

  // Volume Slider
  Slider {
    width: parent.width
    icon: Audio.icon
    accent: Theme.blue
    value: Audio.volume
    label: Audio.label
    onMoved: newValue => Audio.setVolume(newValue)
  }

  // Brightness Slider
  Slider {
    width: parent.width
    icon: "brightness_6"
    accent: Theme.yellow
    value: Brightness.value
    label: Brightness.label
    onMoved: newValue => Brightness.setBrightness(newValue)
  }
}
