import QtQuick

import qs.theme

Rectangle {
  id: button

  property string label: ""
  property color accent: Theme.accent
  property bool filled: false

  signal clicked

  readonly property bool hovered: mouse.containsMouse

  height: 30
  width: labelText.width + 26
  radius: 15
  color: filled ? Theme.tint(accent) : (hovered ? theme.bg4 : Theme.bg3)

  Behavior on color {
    ColorAnimation {
      duration: Theme.hoverTime
    }
  }

  Text {
    id: labelText
    anchors.fill: parent
    text: button.label
    color: button.filled ? button.accent : Theme.grey2
    font {
      family: Theme.font
      pixelSize: Theme.sFontSize
      weight: 600
    }
  }

  MouseArea {
    id: mouse
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: button.clicked()
  }
}
