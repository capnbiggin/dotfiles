import QtQuick
import qs.theme
import qs.config

Rectangle {
  id: root

  property int textSize: Theme.fontSize

  property string icon: ""
  property color iconColor: Theme.text
  property string text: ""
  property int pillHeight: Theme.moduleHeight

  implicitWidth: row.width
  implicitHeight: pillHeight
  radius: height / 2
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
        pixelSize: textSize
        letterSpacing: Theme.letterSpacing
        weight: 600
      }
    }
  }
}
