import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.theme
import qs.services

Row {

  Text {
    id: root

    text: TimeDate.time
    color: Colors.fg

    font {
      family: Fonts.famBody
      pixelSize: Fonts.fsHeader
      weight: Fonts.wSemiBold
    }
  }
}
