import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import qs.theme

RowLayout {
  id: root

  property var battery: UPower.displayDevice
  property bool charging: battery.state === UPowerDeviceState.Charging
  readonly property int level: Math.round(battery.percentage * 100)
  readonly property string icon: {
    if (charging)
      return String.fromCodePoint(983172);

    if (level >= 100)
      return String.fromCodePoint(983161);

    if (level < 10)
      return String.fromCodePoint(131);

    return String.fromCodePoint(983162 + (Math.floor(level / 10) - 1));
  }

  spacing: Sizes.s1

  Text {
    text: root.icon
    color: root.charging ? Colors.blue : root.level <= 15 ? Colors.bad : root.level <= 30 ? Colors.warn : Colors.good

    font {
      family: Fonts.mono
      pixelSize: Fonts.fsBody
    }
  }

  Text {
    text: root.level + "%"
    color: Colors.fg

    font {
      family: Fonts.body
      pixelSize: Fonts.fsBody
      weight: Fonts.wSemiBold
    }
  }
}
