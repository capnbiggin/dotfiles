import QtQuick
import Quickshell
import Quickshell.Networking
import qs.theme
import qs.components

Pill {
  id: root

  property var wifiDevice: Networking.devices.values.find(d => {
    return d.type === DeviceType.Wifi;
  })
  property var active: wifiDevice ? wifiDevice.networks.values.find(n => {
    return n.connected;
  }) : null
  property bool enabled: Networking.wifiEnabled
  readonly property real signal: active ? active.signalStrength : 0
  iconColor: Theme.pink
  icon: {
    if (!Networking.wifiEnabled)
      return "android_wifi_4_bar_off";
    if (!active)
      return "android_wifi_3_bar_question";
    if (signal <= 0.30)
      return "network_wifi_1_bar";
    if (signal <= 0.6)
      return "network_wifi_2_bar";
    if (signal <= 0.85)
      return "network_wifi_3_bar";
    return "signal_wifi_4_bar";
  }
  text: {
    if (!Networking.wifiEnabled)
      return "off";

    if (!active)
      return "Disconnected";

    return active.name;
  }
}
