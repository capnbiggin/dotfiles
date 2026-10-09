pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Singleton {
  id: root
  readonly property string folder: Quickshell.shellDir + "/themes"

  property var all: []

  readonly property string current: Theme.name

  Process {
    id: lister
    command: ["find", "-L", root.folder, "-path", "*wallpapers/*", ""]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        let result = [];
        for (let line of text.trim().split("\n")) {
          if (line !== "")
            result.push(line.split("/").pop());
        }

        result.sort();
        root.all = result;
      }
    }
  }

  function apply(name) {
    Settings.wallpapers = name;
    Settings.save();
  }
}
