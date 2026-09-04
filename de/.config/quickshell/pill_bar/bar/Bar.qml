import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.theme
import qs.bar.modules
import qs.services

PanelWindow {
  id: bar

  required property var modelData
  screen: modelData

  property double barExclusionZone: IpcManager.gameMode ? Theme.barHeight : Theme.barHeight + Theme.shadowRoom / 2
  property double barMaxHeight: IpcManager.gameMode ? Theme.barHeight : Theme.barHeight + Theme.shadowRoom * 1.5
  property double barTopMargin: IpcManager.gameMode ? 0 : Theme.margin //+ 5 - Theme.shadowRoom

  color: Theme.bgT
  exclusionMode: ExclusionMode.Normal
  exclusiveZone: barExclusionZone
  implicitHeight: barMaxHeight

  WlrLayershell.namespace: "quickshell-bar" // Bar Namespace
  WlrLayershell.layer: WlrLayer.Top         // Bar Layer

  anchors {
    top: true
    left: true
    right: true
  }
  margins {
    top: 0
  }

  Rectangle {
    anchors.fill: parent
    color: IpcManager.gameMode ? Theme.pill : Theme.bgT
  }

  Row {
    id: modulesLeft
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      leftMargin: Theme.margin * 2
    }
    spacing: Theme.spacing
    Workspaces2 {}
  }

  Row {
    id: modulesCenter
    anchors {
      horizontalCenter: parent.horizontalCenter
      verticalCenter: parent.verticalCenter
    }
    Clock {}
  }

  Row {
    id: modulesRight
    anchors {
      right: parent.right
      verticalCenter: parent.verticalCenter
      rightMargin: Theme.margin * 2
    }
    spacing: Theme.spacing
    CPUTemp {}
    Volume {}
    Battery {}
    Network {}
  }
}
