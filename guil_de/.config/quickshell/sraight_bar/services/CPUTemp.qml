pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property int cpuTemp

  Process {
    id: cpuTempProc

    command: ["sh", "-c", "~/.config/quickshell/scripts/cpuTemp.sh"]
    Component.onCompleted: running = true

    stdout: StdioCollector {
      onStreamFinished: root.cpuTemp = this.text
    }
  }

  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: cpuTempProc.running = true
  }
}
