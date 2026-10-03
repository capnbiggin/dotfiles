import QtQuick
import Quickshell
import Quickshell.Io

import qs.modules.bar
import qs.modules.controlcenter

import qs.services

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

      ControlCenter {
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
