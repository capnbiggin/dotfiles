import QtQuick
import Quickshell

import qs.theme
import qs.components
import qs.services

Item {
  width: parent.width
  height: 36

  // User Info
  Row {
    spacing: 10
    anchors.verticalCenter: parent.verticalCenter
    IconDisc {
      icon: "person"
      accent: Theme.cyan
      size: 36
      filled: true
    }
    Column {
      anchors.verticalCenter: parent.verticalCenter
      Text {
        text: Quickshell.env("USER")
        color: Theme.fg
        font.family: Theme.font
        font.pixelSize: Theme.fontSize
        font.weight: 700
      }
      Text {
        text: Uptime.text
        color: Theme.grey2
        font.family: Theme.font
        font.pixelSize: Theme.xsFontSize
      }
    }
  }

  // Lock & Power Buttons
  Row {
    spacing: 8
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    // Lock Button
    RoundButton {
      icon: "lock"
      accent: Theme.yellow
      shadow: false
      onClicked: Popups.lockScreen()
    }
    //Power Button
    RoundButton {
      icon: "power_settings_new"
      accent: Theme.red
      shadow: false
      onClicked: Popups.togglePower()
    }
  }
}
