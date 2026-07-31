import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.services
import qs.theme

RowLayout {
  id: root

  readonly property int temp: CPUTemp.cpuTemp
  readonly property string icon: {
    if (temp < 50)
      return String.fromCodePoint(62154);

    if (temp < 65)
      return String.fromCodePoint(62153);

    if (temp < 85)
      return String.fromCodePoint(62151);

    return String.fromCodePoint(61226);
  }

  spacing: Sizes.s1

  Text {
    text: icon
    color: root.temp > 79 ? Colors.bad : root.temp > 65 ? Colors.warn : Colors.good

    font {
      family: Fonts.famMono
      pixelSize: Fonts.fsBody
      weight: Fonts.wSemiBold
    }
  }

  Text {
    text: root.temp + "°C"
    color: Colors.fg

    font {
      family: Fonts.famBody
      pixelSize: Fonts.fsBody
      weight: Fonts.wSemiBold
    }
  }
}
