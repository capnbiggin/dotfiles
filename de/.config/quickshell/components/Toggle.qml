import QtQuick

import qs.theme

Rectangle {
  id: toggle

  property string icon: ""
  property string label: ""
  property string detail: ""
  property color accent: Theme.fg
  property bool on: false

  signal clicked

  readonly property bool hovered: mouse.containsMouse

  height: 44
  radius: height / 2
  color: {
    if (on) {
      return hovered ? Qt.alpha(accent, 0.26) : Theme.tint(accent);
    }
    return hovered ? Theme.bg4 : Theme.bg3;
  }
  Behavior on color {
    ColorAnimation {
      duration: Theme.fadeTime
    }
  }

  Row {
    x: 7
    spacing: 10
    anchors.verticalCenter: parent.verticalCenter

    Rectangle {
      width: 30
      height: 30
      radius: height / 2
      anchors.verticalCenter: parent.verticalCenter
      color: toggle.on ? Theme.tint(toggle.accent) : Theme.tint(Theme.grey2)
      Behavior on color {
        ColorAnimation {
          duration: Theme.fadeTime
        }
      }

      Icon {
        anchors.centerIn: parent
        name: toggle.icon
        color: toggle.on ? toggle.accent : Theme.grey2
      }
    }

    Column {
      anchors.verticalCenter: parent.verticalCenter

      Text {
        text: toggle.label
        color: Theme.fg
        font.family: Theme.font
        font.pixelSize: Theme.sFontSize
        font.weight: 700
      }
      Text {
        text: toggle.detail
        font.family: Theme.font
        font.pixelSize: Theme.xsFontSize
        color: toggle.on ? toggle.accent : Theme.grey2
        Behavior on color {
          ColorAnimation {
            duration: Theme.fadeTime
          }
        }
      }
    }
  }
  MouseArea {
    id: mouse
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: toggle.clicked()
  }
}
