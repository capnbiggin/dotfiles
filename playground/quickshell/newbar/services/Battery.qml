pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
  readonly property var device: UPower.displayDevice
  readonly property bool present: device !== null && device.isPresent

  readonly property real percent: present ? device.percentage : 0
  readonly property bool charging: present && device.state === UPowerDeviceState.Charging

  readonly property string label: Math.round(percent * 100) + "%"

  readonly property string icon: {
    if (charging) {
      return "battery_android_bolt";
    }
    if (percent < 0.15) {
      return "battery_android_alert";
    }
    if (percent < 0.5) {
      return "battery_android_3";
    }
    if (percent < 0.9) {
      return "battery_android_5";
    }
    return "battery_android_full";
  }
}
