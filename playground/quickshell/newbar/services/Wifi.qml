pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Networking

Singleton {
  id: root

  readonly property bool enabled: Networking.wifiEnabled

  readonly property var device: {
    let devices = Networking.devices.values;
    for (let i = 0; i < devices.length; i++) {
      if (devices[i].type === DeviceType.Wifi) {
        return devices[i];
      }
    }
    return null;
  }

  readonly property var network: {
    if (device === null) {
      return null;
    }
    let networks = device.networks.values;
    for (let i = 0; i < networks.length; i++) {
      if (networks[i].connected) {
        return networks[i];
      }
    }
    return null;
  }

  readonly property bool connected: network !== null
  readonly property string ssid: connected ? network.name : ""
  readonly property real strength: connected ? network.signalStrength : 0

  readonly property string label: {
    if (!enabled) {
      return "OFF";
    }
    if (!connected) {
      return "No Network";
    }
    return ssid;
  }
  readonly property string icon: {
    if (!enabled || !connected) {
      return "signal_wifi_off";
    }
    if (strength > 0.75) {
      return "signal_wifi_4_bar";
    }
    if (strength > 0.5) {
      return "network_wifi_3_bar";
    }
    if (strength > 0.25) {
      return "network_wifi_2_bar";
    }
    return "network_wifi_1_bar";
  }

  function toggle() {
    Networking.wifiEnabled = !Networking.wifiEnabled;
  }
}
