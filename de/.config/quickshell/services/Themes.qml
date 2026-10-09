pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Singleton {
  id: root
  readonly property string folder: Quickshell.shellDir + "/themes"

  property var names: []

  readonly property string current: Theme.name

  Process {
    id: lister
    command: ["find", root.folder, "-mindepth", "1", "-maxdepth", "1", "-type", "d", "-not", "-name", ".*"]
    // command: ["find", root.folder, "-maxdepth", "1", "-type", "d"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        let result = [];
        for (let line of text.trim().split("\n")) {
          if (line !== "")
            result.push(line.split("/").pop());
        }

        result.sort();
        root.names = result;
      }
    }
  }

  function apply(name) {
    Settings.theme = name;
    Settings.save();
  }
}
