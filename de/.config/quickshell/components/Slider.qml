import QtQuick

import qs.theme

Item {
  id: slider

  property string icon: ""
  property color accent: Theme.fg
  property real value: 0.5
  property string label: ""

  signal moved(real newValue)

  height: Theme.moduleHeight

  IconDisc {
    id: disc
    icon: slider.icon
    accent: slider.accent
  }

  Text {
    id: valueText
    anchors.right: parent.right
    anchors.verticalCenter: parent.verticalCenter
    text: slider.label
    color: Theme.fg
    font {
      family: Theme.font
      pixelSize: Theme.sFontSize
      weight: 600
    }
  }

  Rectangle {
    id: track
    anchors {
      left: disc.right
      leftMargin: 10
      right: valueText.left
      rightMargin: 10
      verticalCenter: parent.verticalCenter
    }
    height: 8
    radius: 4
    color: Theme.bg3

    Rectangle {
      width: parent.width * slider.value
      height: parent.height
      radius: 4
      color: slider.accent

      Behavior on width {
        NumberAnimation {
          duration: 120
        }
      }
    }
  }

  MouseArea {
    anchors {
      left: track.left
      right: track.right
      verticalCenter: track.verticalCenter
    }
    height: slider.height

    onPressed: mouse => sendValue(mouse.x)
    onPositionChanged: mouse => sendValue(mouse.x)

    function sendValue(x) {
      slider.moved(x / width);
    }
  }
}
