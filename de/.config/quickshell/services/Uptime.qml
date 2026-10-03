pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property string text: ""

  Process {
    id: reader
    command: ["cat", "/proc/uptime"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        let seconds = parseFloat(text.split(" ")[0]);
        let hours = Math.floor(seconds / 3600);
        let minutes = Math.floor((seconds % 3600) / 60);

        root.text = "up " + hours + "h " + minutes + "min";
      }
    }
  }

  Timer {
    interval: 60000
    running: true
    repeat: true
    onTriggered: reader.running = true
  }
}
