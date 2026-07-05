import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.theme

RowLayout {
  Layout.alignment: Qt.AlignHCenter

  Text {
    id: root

    text: Qt.formatDateTime(clockProc.date, 'ddd, MMM d,  h:mm ap')
    color: Colors.fg

    font {
      family: Fonts.body
      pixelSize: Fonts.fsHeader
      weight: Fonts.wSemiBold
    }

    SystemClock {
      id: clockProc

      precision: SystemClock.Minutes
    }
  }
}
