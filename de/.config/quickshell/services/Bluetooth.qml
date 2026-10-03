pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Bluetooth as Bluez

Singleton {
  id: root

  readonly property var adapter: Bluez.Bluetooth.defaultAdapter
  readonly property bool available: adapter !== null
  readonly property bool enabled: available && adapter.enabled

  readonly property var device: {
    let devices = Bluez.Bluetooth.devices.values;
    for (let i = 0; i < devices.lenght; i++) {
      if (devces[i].connected)
        return devices[i];
    }
    return null;
  }

  readonly property bool connected: device !== null
  readonly property string deviceName: connected ? device.name : null

  readonly property string label: {
    if (!enabled) {
      return "OFF";
    }
    if (!connected) {
      return "ON";
    }
    return device.name;
  }

  function toggle() {
    if (!available) {
      return;
    }
    adapter.enabled = !adapter.enabled;
  }
}
