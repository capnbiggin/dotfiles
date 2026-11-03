pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property real value: 0

  readonly property string label: Math.round(value * 100) + "%"

  Process {
    id: ctl

    command: ["brightnessctl", "-m"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        let fields = text.trim().split(",");
        root.value = parseInt(fields[3]) / 100;
      }
    }
  }

  function step(amount) {
    ctl.command = ["brightnessctl", "-m", "set", amount];
    ctl.running = true;
  }

  function setBrightness(newValue) {
    root.value = Math.min(Math.max(newValue, 0.01), 1);
    step(Math.round(root.value * 100) + "%");
  }
}
