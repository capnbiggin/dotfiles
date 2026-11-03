import QtQuick
import Quickshell
import Quickshell.Io

import qs.services
import qs.modules.bar
import qs.modules.controlcenter
import qs.modules.settingspanel
import qs.modules.notifications
import qs.modules.launcher
import qs.modules.theming
import qs.modules.osd

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

      SettingsPanel {
        screen: perScreen.modelData
      }

      NotificationPopup {
        screen: perScreen.modelData
      }

      Osd {
        screen: perScreen.modelData
      }
    }
  }

  KittyColors {}
  GhosttyColors {}
  HyprlandColors {}
  GtkTheme {}

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
  IpcHandler {
    target: "power"

    function toggle(): void {
      Popups.togglePower();
    }
  }
  IpcHandler {
    target: "wallpapers"

    function toggle(): void {
      Popups.toggleWallpapers();
    }
  }

  IpcHandler {
    target: "brightness"

    function step(amount: string): void {
      Brightness.step(amount);
    }
  }
}
