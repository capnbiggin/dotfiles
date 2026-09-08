import QtQuick
import qs.theme
import qs.services

Rectangle {
  id: root

  property string icon: ""
  property color iconColor: Theme.text
  property int iconSize: Theme.iconSize

  property real nudge: 1.5

  width: height
  height: parent.height
  color: Theme.pillIcon
  topLeftRadius: height / 2
  bottomLeftRadius: height / 2

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
