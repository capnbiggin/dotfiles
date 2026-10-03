pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland

Singleton {
  id: root

  property bool launcher: false
  property bool controlCenter: false

  property bool power: false
  property bool lock: false

  property string screenName: Quickshell.screens[0].name

  // Pick screen for Popup window
  function pickScreen(args) {
    let focused = Hyprland.focusedMonitor;
    if (focused !== null) {
      screenName = focused.name;
    }
  }
  Component.onCompleted: pickScreen()

  // Close  all Popups function
  function closeAll() {
    launcher = false;
    controlCenter = false;
    power = false;
  }

  // Launcher Toggle
  function toggleLauncher() {
    if (launcher) {
      launcher = false;
    } else {
      closeAll();
      pickScreen();
      launcher = true;
    }
  }

  // Control Center Toggle
  function toggleControlCenter() {
    if (controlCenter) {
      controlCenter = false;
    } else {
      closeAll();
      pickScreen();
      controlCenter = true;
    }
  }

  // Power Menu toggle
  function togglePower() {
    if (power) {
      power = false;
    } else {
      closeAll();
      pickScreen();
      power = true;
    }
  }

  // Lock Screen Function
  function lockScreen() {
    closeAll();
    lock = true;
  }
}
