import QtQuick
import Quickshell
import Quickshell.Io

import qs.modules.bar

ShellRoot {
  id: root

  Variants {
    model: Quickshell.screens

    Scope {
      id: perScreen
      required property var modelData

      Bar {
        screen: perScreen.modelData
      }
    }
  }

  IpcHandler {
    target: "launcher"

    function toggle(): void {
      Popups.toggleLauncher();
    }
  }
  IpcHandler {
    target: "cc"

    function toggle(): void {
      Popups.toggleControlCenter();
    }
  }
}
