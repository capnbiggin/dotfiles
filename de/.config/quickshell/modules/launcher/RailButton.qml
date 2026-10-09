import QtQuick

import qs.theme
import qs.components

Item {
  id: button

  property string icon: ""
  property string label: ""
  property color accent: Theme.cyan
  property bool on: false

  signal clicked

  width: parent.width
  height: 58

  Column {
    anchors.fill: parent
    spacing: 3

    IconDisc {
      anchors.horizontalCenter: parent.horizontalCenter
      icon: button.icon
      accent: button.on ? button.accent : Theme.grey2
      color: button.on ? Theme.tint(button.accent) : "transparent"
      filled: button.on
      size: 34
    }

    Text {
      anchors.horizontalCenter: parent.horizontalCenter
      text: button.label
      color: button.on ? button.accent : Theme.grey1
      font {
        family: Theme.font
        pixelSize: Theme.xsFontSize
        weight: 700
      }

      Behavior on color {
        ColorAnimation {
          duration: Theme.fadeTime
        }
      }
    }
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: button.clicked()
  }
}
