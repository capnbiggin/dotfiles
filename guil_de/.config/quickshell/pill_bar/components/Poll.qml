import QtQuick
import Quickshell
import Quickshell.Io

Scope {
  id: root

  property string cmd: ""
  property int interval: 5000
  property string text: ""
  property bool repeat: true

  Process {
    id: process

    command: ["sh", "-c", root.cmd]
    running: true

    stdout: StdioCollector {
      id: output
      onStreamFinished: root.text = output.text.trim()
    }
  }

  Timer {
    interval: root.interval
    running: true
    repeat: root.repeat
    onTriggered: process.running = true
  }
}
