import QtQuick

import qs.theme

Rectangle {
  id: button

  property string icon: ""
  property color accent: Theme.fg
  property int size: Theme.moduleHeight
  property bool shadow: true

  signal clicked

  readonly property bool hovered: mouse.containsMouse

  width: size
  height: size
  radius: size / 2

  color: Qt.tint(hovered ? Theme.bg3 : Theme.bg1, Theme.tint(accent))

  scale: hovered ? 1.1 : 1

  Behavior on color {
    ColorAnimation {
      duration: Theme.hoverTime
    }
  }
  Behavior on scale {
    NumberAnimation {
      duration: Theme.hoverTime
      easing.type: Easing.OutCubic
    }
  }

  Shadow {
    visible: button.shadow
  }

  Icon {
    anchors.centerIn: parent
    name: button.icon
    color: button.accent
    size: Math.round(button.size * 0.53)
  }

  MouseArea {
    id: mouse
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: button.clicked()
  }
}
