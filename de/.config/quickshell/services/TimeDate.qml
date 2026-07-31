pragma Singleton
import QtQuick
import Quickshell

Singleton {
  id: root

  SystemClock {
    id: td

    precision: SystemClock.Minutes
  }

  readonly property string time: Qt.formatDateTime(td.date, "h:mm ap")
  readonly property string date: Qt.formatDateTime(td.date, "ddd, d MMM")
}
