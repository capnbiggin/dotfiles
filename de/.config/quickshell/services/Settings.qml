pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property alias theme: saved.theme
  property alias wallpaper: saved.wallpaper

  FileView {
    id: file
    path: Quickshell.shellDir + "/config.json"
    blockLoading: true

    JsonAdapter {
      id: saved
      property string theme: "catppuccin"
      property string wallpaper: ""
    }
  }

  function save() {
    file.writeAdapter();
  }
}
