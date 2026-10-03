import QtQuick
import Quickshell
import Quickshell.Wayland
import "../../theme"
import "../../modules"
import "../../services"

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

  WlrLayershell.namespace: "quickshell:bar" // Bar Namespace
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
      // verticalCenter: parent.verticalCenter
      leftMargin: IpcManager.gameMode ? Theme.s4 : Theme.s6
    }
    topPadding: IpcManager.gameMode ? Theme.s1 : Theme.s4
    spacing: Theme.s1
    // Power {}
    Workspaces2 {}
  }

  Row {
    id: modulesCenter
    anchors {
      horizontalCenter: parent.horizontalCenter
      // verticalCenter: parent.verticalCenter
    }
    topPadding: IpcManager.gameMode ? Theme.s1 : Theme.s4
    spacing: Theme.s1
    Clock {}
  }

  Row {
    id: modulesRight
    anchors {
      right: parent.right
      // verticalCenter: parent.verticalCenter
      rightMargin: IpcManager.gameMode ? Theme.s4 : Theme.s6
    }
    topPadding: IpcManager.gameMode ? Theme.s1 : Theme.s4
    spacing: Theme.s1
    CPUTemp {}
    Volume {}
    Battery {}
    Network {}
  }
}
