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

  height: 44
  radius: height / 2
  color: on ? Theme.tint(accent) : Theme.bg3

  Row {
    x: 7
    spacing: 10
    anchors.verticalCenter: parent.verticalCenter

    Rectangle {
      width: 30
      height: 30
      radius: height / 2
      anchors.verticalCenter: parent.verticalCenter
      color: toggle.on ? Theme.tint(toggle.accent) : Theme.tint(Theme.gret2)

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
        color: toggle.on ? toggle.accent : Theme.grey2
        font.family: Theme.font
        font.pixelSize: Theme.xsFontSize
      }
    }
  }
  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: toggle.clicked()
  }
}
