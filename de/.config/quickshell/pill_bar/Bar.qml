import QtQuick
import Quickshell
import qs.theme
import qs.modules
import qs.services

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: bar

      required property var modelData
      screen: modelData

      property double barExclusionZone: IpcManager.gameMode ? Theme.moduleHeight : Theme.moduleHeight + Theme.shadowRoom / 2
      property double barMaxHeight: IpcManager.gameMode ? Theme.barHeight : Theme.moduleHeight + Theme.shadowRoom * 1.5
      property double barTopMargin: IpcManager.gameMode ? 0 : Theme.margin + 5 - Theme.shadowRoom

      color: Theme.bgT
      exclusionMode: ExclusionMode.Normal
      exclusiveZone: barExclusionZone
      implicitHeight: barMaxHeight

      anchors {
        top: true
        left: true
        right: true
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
        Workspaces {}
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
  }
}
