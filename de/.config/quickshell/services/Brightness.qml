pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property real value: 0

  readonly property string label: Math.round(value * 100) + "%"

  Process {
    id: reader
    command: ["brightnessctl", "-m"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        let fields = text.trim().split(",");
        let percent = parseInt(fields[3]);
        root.value = percent / 100;
      }
    }
  }
  Timer {
    interval: 2000
    running: true
    repeat: true
    onTriggered: reader.running = true
  }
  Process {
    id: writer
  }

  function setBrightness(newValue) {
    if (newValue < 0.01) {
      newValue = 0.01;
    }
    if (newValue > 1) {
      newValue = 1;
    }

    root.value = newValue;
    writer.command = ["brightnessctl", "set", Math.round(newValue * 100) + "%"];
    writer.running = true;
  }
}
