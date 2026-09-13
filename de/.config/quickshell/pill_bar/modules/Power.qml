import QtQuick
import Quickshell
import Quickshell.Io
import qs.theme
import qs.components

PillIcon {
  id: root

  icon: "power_settings_new"
  iconColor: Theme.red

  MouseArea {
    anchors.fill: parent
    onClicked: {
      process.running = true;
    }
  }

  Process {
    id: process

    command: ["sh", "-c", "~/.config/rofi/scripts/capn-menu.sh power"]
    running: false
  }
}
