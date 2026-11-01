pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Singleton {
  id: root

  readonly property string folder: `${Quickshell.env("HOME")}/dotfiles/wallpapers/`

  property var all: []

  readonly property string current: Settings.wallpaper ?? files[0] ?? ""
  onCurrentChanged: show(current)

  Process {
    id: finder
    command: ["find", "-L", root.folder, "-type", "f", "(", "-iname", "*.jpg", "-o", "-iname", "*.jpeg", "-o", "-iname", "*.png", "-o", "-iname", "*.webp", ")"]
    running: true

    stdout: StdioCollector {
      onStreamFinished: {
        let result = [];
        for (let line of text.trim().split("\n")) {
          if (line !== "") {
            result.push(line);
          }
        }
        result.sort();
        root.all = result;
      }
    }
  }

  Process {
    id: setter
  }

  function show(image) {
    if (image === "") {
      return;
    }
    setter.command = ["awww", "img", image, "--transition-type", "center", "--transition-duration", "0.8", "--transition-fps", "60"];
    setter.running = true;
  }

  function apply(image) {
    Settings.wallpaper = image;
    Settings.save();
  }

  function nameOf(path) {
    let file = path.split("/").pop();
    let dot = file.lastIndexOf(".");
    if (dot > 0) {
      return file.slice(0, dot);
    }
    return file;
  }
}
