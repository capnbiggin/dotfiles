import QtQuick
import Quickshell
import Quickshell.Services.UPower
import qs.theme
import qs.components

Pill {
  id: root

  property var battery: UPower.displayDevice
  property bool available: battery ? battery.isLaptopBattery : false
  property bool charging: battery.state === UPowerDeviceState.Charging
  readonly property int level: Math.round(battery.percentage * 100)

  visible: available
  text: level + "%"
  icon: {
    if (charging)
      return "battery_android_frame_bolt";

    if (level >= 100)
      return "battery_android_frame_full";
    if (level >= 90)
      return "battery_android_frame_6";
    if (level >= 75)
      return "battery_android_frame_5";
    if (level >= 60)
      return "battery_android_frame_4";
    if (level >= 45)
      return "battery_android_frame_3";
    if (level >= 30)
      return "battery_android_frame_2";
    if (level >= 15)
      return "battery_android_frame_1";

    return "battery_android_frame_0";
  }
  iconColor: root.charging ? Theme.blue : root.level <= 15 ? Theme.red : root.level <= 30 ? Theme.yellow : root.level === 100 ? Theme.blue : Theme.green
}
