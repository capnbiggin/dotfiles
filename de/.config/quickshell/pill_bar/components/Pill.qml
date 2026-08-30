import QtQuick
import qs.theme

Rectangle {
  id: root

  property string icon: ""
  property color iconColor: Theme.text
  property string text: ""

  implicitWidth: row.width
  implicitHeight: Theme.moduleHeight
  radius: Theme.radius
  color: Theme.pill

  Shadow {}

  Row {
    id: row

    height: parent.height

    PillIcon {
      icon: root.icon
      iconColor: root.iconColor
    }

    Text {
      width: implicitWidth + Theme.margin * 1.5
      height: parent.height
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      text: root.text
      color: Theme.text
      font {
        family: Theme.fontFam
        pixelSize: Theme.fontSize
        letterSpacing: Theme.letterSpacing
        weight: 600
      }
    }
  }
}
