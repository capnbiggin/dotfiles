pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Singleton {
  id: root

  readonly property string folder: Quickshell.shellDir + "/themes"

  property var all: []

  readonly property var files: all.filter(file => file.includes("/" + Theme.wallpaperDir + "/"))

  readonly property string current: Settings.wallpapers[Theme.wallpaperDir] ?? files[0] ?? ""
  onCurrentChanged: show(current)

  Process {
    id: finder
    command: ["find", "-L", root.folder, "-path", "*/wallpapers/*", "-type", "f", "(", "-iname", "*.jpg", "-o", "-iname", "*.jpeg", "-o", "-iname", "*.png", "-o", "-iname", "*.webp", ")"]
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
    let remembered = {};
    for (let name in Settings.wallpapers) {
      remembered[name] = Settings.wallpapers[name];
    }
    remembered[Theme.wallpaperDir] = image;
    Settings.wallpapers = remembered;
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
