import QtQuick

import qs.theme

Rectangle {
  id: disc

  property string icon: ""
  property color accent: Theme.fg
  property int size: Theme.moduleHeight
  property bool filled: false

  width: size
  height: size
  radius: size / 2
  color: Theme.tint(accent)

  Icon {
    anchors.centerIn: parent
    name: disc.icon
    color: disc.accent
    size: Math.round(disc.size * 0.53)
    filled: disc.filled
  }
}
