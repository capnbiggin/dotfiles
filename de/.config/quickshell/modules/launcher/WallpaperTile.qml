import QtQuick
import Quickshell.Widgets

import qs.theme
import qs.components

Column {
  id: tile

  property string file: ""
  property string name: ""
  property bool current: false

  signal clicked

  spacing: 6

  Rectangle {
    width: 190
    height: 107
    radius: 16
    color: Theme.bg3

    ClippingRectangle {
      anchors.fill: parent
      anchors.margins: 3
      radius: 13
      color: "transparent"

      Image {
        anchors.fill: parent
        source: "file://" + tile.file
        fillMode: Image.PreserveAspectCrop
        sourceSize.width: 380
        asynchronous: true
      }
    }

    Rectangle {
      visible: tile.current
      anchors.right: parent.right
      anchors.top: parent.top
      anchors.margins: 8
      width: 22
      height: 22
      radius: height / 2
      color: Theme.accent

      Icon {
        anchors.centerIn: parent
        name: "check"
        color: Theme.bg1
        size: 14
      }
    }

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: tile.clicked()
    }
  }

  Text {
    anchors.horizontalCenter: parent.horizontalCenter
    width: 190
    horizontalAlignment: Text.AlignHCenter
    text: tile.name
    color: tile.current ? Theme.fg : Theme.grey2
    font {
      family: Theme.font
      pixelSize: Theme.xsFontSize
      weight: 600
    }
    elide: Text.ElideMiddle
  }
}
