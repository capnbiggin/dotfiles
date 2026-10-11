pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property alias theme: saved.theme
  property alias wallpaperDir: saved.wallpaperDir
  property alias wallpapers: saved.wallpapers

  FileView {
    id: file
    path: Quickshell.shellDir + "/config.json"
    blockLoading: true

    JsonAdapter {
      id: saved
      property string theme: "catppuccin"
      property string wallpaperDir: "wallpapers"
      property var wallpapers: ({})
    }
  }

  function save() {
    file.writeAdapter();
  }
}
