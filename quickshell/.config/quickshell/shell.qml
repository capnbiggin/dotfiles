// ─── Root Shell ───────────────────────

import QtQuick
import QtQuick.Layouts
import Quickshell
import "modules/bar"
import "modules/notifications"

ShellRoot {
  id: shellRoot

  // ─── Bar ───────────────────────
  Variants {
    model: Quickshell.screens

    Bar {}
  }
  NotificationCenter {}
}
