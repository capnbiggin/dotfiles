import QtQuick
import Quickshell
import Quickshell.Io

import qs.services
import qs.modules.bar
import qs.modules.controlcenter
import qs.modules.notifications
import qs.modules.launcher

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

      Launcher {
        screen: perScreen.modelData
      }

      ControlCenter {
        screen: perScreen.modelData
      }

      NotificationPopup {
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
