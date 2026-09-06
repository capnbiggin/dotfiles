import QtQuick
import Quickshell
import qs.theme
import qs.components

// Clock.qml
//
// The time, to the minute.
Pill {
  icon: "schedule"
  iconColor: Theme.magenta
  text: Qt.formatDateTime(clock.date, "h:mm ap")

  // pillHeight: 100

  // Ticks once a minute, matching what the bar draws.
  // Add seconds to the format above and switch this to SystemClock.Seconds.
  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}
