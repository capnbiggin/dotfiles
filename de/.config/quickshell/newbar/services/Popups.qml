pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  property bool launcher: false
  property bool controlCenter: false

  function closeAll() {
    launcher = false;
    controlCenter = false;
  }

  function toggleLauncher() {
    let wasOpen = launcher;
    closeAll();
    launcher = !wasOpen;
  }

  function toggleControlCenter() {
    let wasOpen = controlCenter;
    closeAll();
    controlCenter = !wasOpen;
  }
}
