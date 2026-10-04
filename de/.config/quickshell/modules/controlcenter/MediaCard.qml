import QtQuick
import Quickshell
import Quickshell.Widgets

import qs.theme
import qs.components
import qs.services

Rectangle {
  width: parent.width
  height: 68
  radius: 18
  color: Theme.bg2
  visible: Media.available

  Row {
    x: 12
    spacing: 12
    anchors.verticalCenter: parent.verticalCenter

    //Media Art
    ClippingRectangle {
      width: 44
      height: 44
      radius: 10
      color: Theme.tint(Theme.purple)

      Icon {
        anchors.centerIn: parent
        name: "music_note"
        color: Theme.purple
        filled: true
      }

      Image {
        anchors.fill: parent
        source: Media.artUrl
        fillMode: Image.PreserveAspectCrop
        visible: Media.artUrl !== ""
      }
    }

    // Media Info
    Column {
      anchors.verticalCenter: parent.verticalCenter
      spacing: 2
      width: 150

      Text {
        width: parent.width
        text: Media.title
        color: Theme.fg
        font {
          family: Theme.font
          pixelSize: Theme.sFontSize
          weight: 700
        }
        elide: Text.ElideRight
      }

      Text {
        width: parent.width
        text: Media.artist
        color: Theme.grey2
        font {
          family: Theme.font
          pixelSize: Theme.xsFontSize
        }
        elide: Text.ElideRight
      }
    }
  }

  // Media Controls
  Row {
    anchors {
      right: parent.right
      rightMargin: 12
      verticalCenter: parent.verticalCenter
    }
    spacing: 6
    RoundButton {
      icon: "skip_previous"
      accent: Theme.fg
      size: 28
      shadow: false
      onClicked: Media.previous()
    }
    RoundButton {
      icon: Media.playing ? "pause" : "play_arrow"
      accent: Theme.purple
      size: 32
      shadow: false
      onClicked: Media.togglePlaying()
    }
    RoundButton {
      icon: "skip_next"
      accent: Theme.fg
      size: 28
      shadow: false
      onClicked: Media.next()
    }
  }
}
