import QtQuick
import Quickshell

import qs.theme
import qs.components
import qs.services

Grid {
  width: parent.width
  columns: 2
  spacing: 8
  // Wi-Fi Toggle
  Toggle {
    width: (parent.width - 8) / 2
    icon: Wifi.icon
    accent: Theme.cyan
    label: "Wi-Fi"
    detail: Wifi.label
    on: Wifi.enabled
    onClicked: Wifi.toggle()
  }

  // Bluetooth Toggle
  Toggle {
    width: (parent.width - 8) / 2
    icon: "bluetooth"
    accent: Theme.blue
    label: "Bluetooth"
    detail: Bluetooth.label
    on: Bluetooth.enabled
    onClicked: Bluetooth.toggle()
  }

  // Notifications do not disturb Toggle
  Toggle {
    width: (parent.width - 8) / 2
    icon: "notifications_off"
    accent: Theme.orange
    label: "DND"
    detail: Notifs.doNotDisturb ? "On" : "Off"
    on: Notifs.doNotDisturb
    onClicked: Notifs.doNotDisturb = !Notifs.doNotDisturb
  }
}
