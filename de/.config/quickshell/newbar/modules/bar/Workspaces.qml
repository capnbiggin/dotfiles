import QtQuick
import Quickshell
import Quickshell.Hyprland

import qs.theme
import qs.components

Rectangle {
  id: root

  required property var screen

  property int cellWidth: 28
  property int padding: 5
  property int thumbSize: 18

  readonly property var monitor: Hyprland.monitorFor(root.screen)

  readonly property var list: {
    let all = Hyprland.workspaces.values;
    let mine = [];
    for (let i = 0; i < all.length; i++) {
      let workspace = all[i];
      if (workspace.id < 1)
        continue;
      if (workspace.monitor !== root.monitor)
        continue;
      mine.push(workspace);
    }
    mine.sort((a, b) => a.id - b.id);
    return all;
  }
  readonly property int activeIndex: {
    for (let i = 0; i < list.length; i++) {
      if (list[i].active)
        return i;
    }
    return -1;
  }

  implicitWidth: list.length * cellWidth + padding * 2
  implicitHeight: Theme.moduleHeight
  radius: Theme.radius
  color: Theme.bg1
  visible: list.length > 0

  Shadow {}

  Rectangle {
    x: root.padding + root.activeIndex * root.cellWidth + (root.cellWidth - root.thumbSize) / 2
    width: root.thumbSize
    height: root.thumbSize
    radius: root.thumbSize / 2
    anchors.verticalCenter: parent.verticalCenter
    visible: root.activeIndex >= 0
    color: Theme.tint(Theme.accent)

    Behavior on x {
      NumberAnimation {
        duration: 260
        easing.type: Easing.OutCubic
      }
    }
  }

  Row {
    x: root.padding
    height: parent.height

    Repeater {
      model: root.list

      Item {
        required property var modelData

        readonly property bool busy: modelData.toplevels.values.length > 0

        width: root.cellWidth
        height: parent.height

        Rectangle {
          anchors.centerIn: parent

          width: {
            if (dotMouse.containsMouse)
              return 11;
            if (parent.busy || parent.modelData.active)
              return 8;
            return 6;
          }
          height: width
          radius: width / 2

          Behavior on width {
            NumberAnimation {
              duration: Theme.hoverTime
              easing.type: Easing.OutCubic
            }
          }
          color: {
            if (parent.modelData.urgent)
              return Theme.red;
            if (parent.modelData.active)
              return Theme.accent;
            if (parent.busy)
              return Theme.fg;
            return Theme.bg3;
          }
          Behavior on color {
            ColorAnimation {
              duration: 200
            }
          }
        }
        MouseArea {
          id: dotMouse
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: parent.modelData.activate()
        }
      }
    }
  }
}
