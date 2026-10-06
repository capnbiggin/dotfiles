import QtQuick

import qs.theme

Text {
  property string name: ""
  property color iconColor: Theme.fg
  property int size: Theme.iconSize
  property bool filled: false

  text: name
  color: iconColor
  font {
    family: Theme.iconFont
    pixelSize: size
    variableAxes: filled ? Theme.iconAxesFilled : Theme.iconAxes
  }

  Behavior on color {
    ColorAnimation {
      duration: Theme.fadeTime
    }
  }
}
