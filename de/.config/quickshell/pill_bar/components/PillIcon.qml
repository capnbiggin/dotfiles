import QtQuick
import qs.theme

Rectangle {
  id: root

  property string icon: ""
  property color iconColor: Theme.text

  property real nudge: 3

  width: height
  height: parent.height
  color: Theme.pillIcon
  topLeftRadius: Theme.radius
  bottomLeftRadius: Theme.radius

  Text {
    anchors {
      centerIn: parent
      horizontalCenterOffset: root.nudge
    }

    text: root.icon
    color: root.iconColor
    font {
      family: Theme.iconFam
      pixelSize: Theme.iconSize
      variableAxes: Theme.iconAxes
    }
  }
}
