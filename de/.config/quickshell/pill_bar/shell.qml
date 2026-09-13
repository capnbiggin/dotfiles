import QtQuick
import Quickshell
import "modules/bar"
import "modules/notifications"

ShellRoot {
  Variants {
    model: Quickshell.screens

    Bar {}
  }

  NotificationCenter {}
}
