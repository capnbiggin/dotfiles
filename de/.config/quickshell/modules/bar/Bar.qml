import QtQuick
import Quickshell

import qs.theme
import qs.components

PanelWindow {
  id: bar

  anchors {
    top: true
    left: true
    right: true
  }
  margins {
    top: Theme.margin
    left: Theme.margin
    right: Theme.margin
  }

  implicitHeight: Theme.moduleHeight + Theme.shadowRoom / 2
  exclusiveZone: implicitHeight

  color: "transparent"

  Row {
    anchors {
      left: parent.left
      leftMargin: Theme.spacing
      verticalCenter: parent.verticalCenter
    }
    spacing: Theme.spacing

    LauncherButton {}
    Workspaces {
      screen: bar.screen
    }
    // MediaPill {}
  }
  Row {
    anchors {
      horizontalCenter: parent.horizontalCenter
      verticalCenter: parent.verticalCenter
    }
    spacing: Theme.spacing

    ClockPill {}
  }
  Row {
    anchors {
      right: parent.right
      rightMargin: Theme.spacing
      verticalCenter: parent.verticalCenter
    }
    spacing: Theme.spacing

    BluetoothPill {}
    VolumePill {}
    WifiPill {}
    BatteryPill {}
    ControlCenterButton {}
  }
}
