import QtQuick

import qs.theme
import qs.components
import qs.services

Pill {
  icon: Bluetooth.icon
  accent: Theme.yellow
  text: Bluetooth.deviceName
  visible: Bluetooth.connected
}
