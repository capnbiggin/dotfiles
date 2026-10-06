import QtQuick
import Quickshell
import Quickshell.Widgets

import qs.theme
import qs.components
import qs.services

Rectangle {
  id: row

  property string name: ""
  property string detail: ""
  property string icon: "apps"
  property string iconName: ""
  property color accent: Theme.cyan

  signal clicked

  readonly property string iconPath: Quickshell.iconPath(iconName, true)

  height: 48
  radius: 16

  color: mouse.containsMouse ? Theme.bg3 : Theme.bg2
  Behavior on color {
    ColorAnimation {
      duration: Theme.hoverTime
    }
  }

  Item {
    id: leading
    x: 9
    anchors.verticalCenter: parent.verticalCenter
    width: 30
    height: 30

    IconDisc {
      icon: row.icon
      accent: row.accent
      visible: row.iconPath === ""
    }

    IconImage {
      anchors.fill: parent
      source: row.iconPath
      visible: row.iconPath !== ""
    }
  }

  Column {
    anchors {
      left: leading.right
      leftMargin: 10
      right: parent.right
      rightMargin: 14
      verticalCenter: parent.verticalCenter
    }

    Text {
      width: parent.width
      text: row.name
      color: Theme.fg
      font {
        family: Theme.font
        pixelSize: Theme.sFontSize
        weight: 700
      }
      elide: Text.ElideRight
    }
    Text {
      width: parent.width
      text: row.detail
      color: Theme.grey2
      font {
        family: Theme.font
        pixelSize: Theme.xsFontSize
      }
      elide: Text.ElideRight
      visible: row.detail !== ""
    }
  }

  MouseArea {
    id: mouse
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: row.clicked()
  }
}
