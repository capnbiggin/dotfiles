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
    color: Theme.accent
    font {
      family: Theme.nerdFont
      pixelSize: Theme.iconSize
    }
  }
}
