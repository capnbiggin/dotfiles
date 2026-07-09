import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.theme
import qs.services

RowLayout {
  Layout.alignment: Qt.AlignHCenter

  Text {
    id: root

    text: TimeDate.time
    color: Colors.fg

    font {
      family: Fonts.body
      pixelSize: Fonts.fsHeader
      weight: Fonts.wSemiBold
    }
  }
}
