import QtQuick
import qs.theme

Rectangle {
  id: root

  property string icon: ""
  property color iconColor: Theme.text
  property int iconSize: Theme.iconSize

  property real nudge: 1.5

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
      pixelSize: iconSize
      variableAxes: Theme.iconAxes
    }
  }
}
