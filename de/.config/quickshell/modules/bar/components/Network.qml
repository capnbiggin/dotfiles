import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Networking
import qs.theme

RowLayout {
  id: root

  property var wifiDevice: Networking.devices.values.find(d => {
    return d.type === DeviceType.Wifi;
  })
  property var active: wifiDevice ? wifiDevice.networks.values.find(n => {
    return n.connected;
  }) : null
  property bool enabled: Networking.wifiEnabled
  readonly property real signal: active ? active.signalStrength : 0
  readonly property string icon: {
    if (!Networking.wifiEnabled)
      return String.fromCodePoint(984490);

    if (!active)
      return String.fromCodePoint(985389);

    let tier = signal >= 0.75 ? 4 : signal >= 0.5 ? 3 : signal >= 0.25 ? 2 : 1;
    return String.fromCodePoint(985375 + (tier - 1) * 3);
  }

  spacing: Sizes.s1

  Text {
    text: root.icon
    color: Networking.wifiEnabled ? Colors.purple : Colors.grey1

    font {
      family: Fonts.famMono
      pixelSize: Fonts.fsBody
    }
  }

  Text {
    text: {
      if (!Networking.wifiEnabled)
        return "off";

      if (!root.active)
        return "Disconnected";

      return root.active.name;
    }
    color: Colors.fg

    font {
      family: Fonts.famBody
      pixelSize: Fonts.fsBody
      weight: Fonts.wSemiBold
    }
  }
}
