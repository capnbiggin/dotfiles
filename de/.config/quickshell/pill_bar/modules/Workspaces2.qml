import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

import qs.theme
import qs.components

Rectangle {
  id: root

  property bool isHovered: false

  implicitWidth: row.width + Theme.margin
  implicitHeight: Theme.moduleHeight
  radius: Theme.radius
  color: Theme.pill

  // Behavior on implicitWidth {
  //   NumberAnimation {
  //     duration: Theme.aniFast
  //   }
  // }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    onEntered: root.isHovered = true
    onExited: root.isHovered = false
  }

  Shadow {}

  Row {
    id: row

    anchors {
      left: parent.left
      // centerIn: parent
    }
    width: implicitWidth
    height: parent.height
    spacing: Theme.s1

    PillIcon {
      id: power

      icon: "power_settings_new"
      iconColor: Theme.red

      MouseArea {
        anchors.fill: parent
        onClicked: {
          process.running = true;
        }
      }

      Process {
        id: process

        command: ["sh", "-c", "~/.config/rofi/scripts/capn-menu.sh power"]
        running: false
      }
    }

    Repeater {
      model: Hyprland.workspaces

      delegate: Item {
        id: ws

        required property var modelData
        readonly property bool isActive: modelData.active
        readonly property bool isFocused: modelData.focused
        readonly property bool isOccupied: (modelData.topLevels?.values?.length ?? 0) > 0

        implicitWidth: label.implicitWidth + Theme.s2
        implicitHeight: parent.height - Theme.s2
        anchors.verticalCenter: parent.verticalCenter
        visible: root.isHovered ? true : ws.isFocused

        Rectangle {
          anchors.fill: parent
          radius: Theme.radius
          color: ws.isFocused ? Theme.butBg2 : ws.isActive ? Theme.butBg1 : "transparent"
          Behavior on color {
            ColorAnimation {
              duration: Theme.aniFast
            }
          }

          opacity: ws.isActive ? 1 : 0
          Behavior on opacity {
            NumberAnimation {
              duration: Theme.aniFast
            }
          }
        }
        Text {
          id: label
          anchors.centerIn: parent
          text: {
            if (ws.modelData.id == 10) {
              return "0";
            }
            return ws.modelData.id;
          }
          font {
            family: Theme.fontFam
            pixelSize: Theme.fontSize
            weight: 700
          }
          color: ws.isFocused ? Theme.accent : (ws.isActive ? Theme.text : Theme.muteText)
          Behavior on color {
            ColorAnimation {
              duration: Theme.aniFast
            }
          }
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onPressed: ws.modelData.activate()
        }
      }
    }
  }
}
