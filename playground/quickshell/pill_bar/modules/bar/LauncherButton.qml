import QtQuick

import qs.theme
import qs.components
import qs.services

RoundButton {
  icon: ""
  accent: Theme.accent
  onClicked: Popups.toggleLauncher()

  Text {
    anchors.centerIn: parent
    text: "󰣇"
    font {
      family: Theme.fontFam
      pixelSize: Theme.fontSize
    }
  }
}
