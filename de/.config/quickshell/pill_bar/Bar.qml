import QtQuick
import Quickshell
import qs.theme
import qs.modules

Variants {
  model: Quickshell.screens

  PanelWindow {
    id: bar

    required property var modelData
    screen: modelData

    anchors {
      top: true
      left: true
      right: true
    }
    implicitHeight: Theme.moduleHeight + Theme.shadowRoom * 2
    margins {
      top: Theme.margin + 5 - Theme.shadowRoom
      left: Theme.margin
      right: Theme.margin
    }
    exclusiveZone: Theme.moduleHeight + Theme.shadowRoom
    color: Theme.bgT

    Rectangle {
      anchors.fill: parent
      color: Theme.bgT
      radius: Theme.radius
    }

    Row {
      id: modulesLeft
      anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
        leftMargin: Theme.margin
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
      spacing: Theme.spacing
      Clock {}
    }

    Row {
      id: modulesRight
      anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
        rightMargin: Theme.margin
      }
      spacing: Theme.spacing
      CPUTemp {}
      Volume {}
      Battery {}
      Network {}
    }
  }
}
