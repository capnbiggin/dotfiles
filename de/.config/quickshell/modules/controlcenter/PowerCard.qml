import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.theme
import qs.components
import qs.services

Rectangle {
  y: 36 + 18
  width: parent.width
  height: 92
  radius: 18
  color: Theme.bg2

  Row {
    anchors.centerIn: parent
    spacing: 8

    Repeater {
      model: [
        {
          icon: "bedtime",
          label: "Suspend",
          accent: Theme.blue,
          command: ["systemctl", "suspend"]
        },
        {
          icon: "logout",
          label: "Log Out",
          accent: Theme.yellow,
          command: ["hyprctl", "dispatch", "hl.dsp.exit()"]
        },
        {
          icon: "restart_alt",
          label: "Reboot",
          accent: Theme.orange,
          command: ["systemctl", "reboot"]
        },
        {
          icon: "power_settings_new",
          label: "Shut Down",
          accent: Theme.red,
          command: ["systemctl", "poweroff"]
        },
      ]

      Column {
        required property var modelData
        width: 70
        spacing: 6

        RoundButton {
          anchors.horizontalCenter: parent.horizontalCenter
          icon: modelData.icon
          accent: modelData.accent
          size: 44
          shadow: false

          onClicked: {
            Popups.closeAll();
            Quickshell.execDetached(modelData.command);
          }
        }

        Text {
          anchors.horizontalCenter: parent.horizontalCenter
          text: modelData.label
          color: Theme.grey2
          font {
            family: Theme.font
            pixelSize: Theme.xsFontSize
            weight: 600
          }
        }
      }
    }
  }
}
