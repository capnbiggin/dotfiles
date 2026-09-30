pragma Singleton

import QtQuick
import Quickshell

Singleton {
  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }

  readonly property string time: Qt.formatDateTime(clock.date, "h:mm ap")
  readonly property string date: Qt.formatDateTime(clock.date, "ddd, d MMMM")
}
