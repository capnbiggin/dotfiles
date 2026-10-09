pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property alias theme: saved.theme

  FileView {
    id: file
    path: Quickshell.shellDir + "/config.json"
    blockLoading: true

    JsonAdapter {
      id: saved

      property string theme: "catppuccin"
    }
  }

  function save() {
    file.writeAdapter();
  }
}
