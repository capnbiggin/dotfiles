import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets

import qs.theme
import qs.components
import qs.services

PanelWindow {
  id: cc

  readonly property bool open: Popups.controlCenter && Popups.screenName === screen.name

  anchors {
    top: true
    left: true
    right: true
    bottom: true
  }

  exclusionMode: ExclusionMode.Ignore
  WlrLayershell.keyboardFocus: open ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None

  color: "transparent"

  Region {
    id: nothing
  }
  mask: open ? null : nothing

  MouseArea {
    anchors.fill: parent
    focus: true
    onClicked: Popups.closeAll()
    Keys.onEscapePressed: Popups.closeAll()
  }

  Rectangle {
    id: panel

    width: Theme.panelWidth
    height: content.height + 20
    y: Theme.belowBar
    radius: Theme.panelRadius
    color: Theme.bg1

    x: cc.open ? cc.width - width - Theme.margin : cc.width
    Behavior on x {
      NumberAnimation {
        duration: Theme.slideTime
        easing.type: Easing.OutQuint
      }
    }

    Shadow {}

    MouseArea {
      anchors.fill: parent
    }

    Column {
      id: content
      x: 14
      y: 14
      width: parent.width - 28
      spacing: 18

      // HEADER
      Item {
        width: parent.width
        height: 36

        // User Info
        Row {
          spacing: 10
          anchors.verticalCenter: parent.verticalCenter
          IconDisc {
            icon: "person"
            accent: Theme.cyan
            size: 36
            filled: true
          }
          Column {
            anchors.verticalCenter: parent.verticalCenter
            Text {
              text: Quickshell.env("USER")
              color: Theme.fg
              font.family: Theme.font
              font.pixelSize: Theme.fontSize
              font.weight: 700
            }
            Text {
              text: Uptime.text
              color: Theme.grey2
              font.family: Theme.font
              font.pixelSize: Theme.xsFontSize
            }
          }
        }

        // Lock & Power Buttons
        Row {
          spacing: 8
          anchors.right: parent.right
          anchors.verticalCenter: parent.verticalCenter
          // Lock Button
          RoundButton {
            icon: "lock"
            accent: Theme.yellow
            shadow: false
            onClicked: Popups.lockScreen()
          }
          //Power Button
          RoundButton {
            icon: "power_settings_new"
            accent: Theme.red
            shadow: false
            onClicked: Popups.togglePower()
          }
        }
      }

      // Toggle grid
      Grid {
        width: parent.width
        columns: 2
        spacing: 8
        // Wi-Fi Toggle
        Toggle {
          width: (parent.width - 8) / 2
          icon: Wifi.icon
          accent: Theme.cyan
          label: "Wi-Fi"
          detail: Wifi.label
          on: Wifi.enabled
          onClicked: Wifi.toggle()
        }
        // Bluetooth Toggle
        Toggle {
          width: (parent.width - 8) / 2
          icon: "bluetooth"
          accent: Theme.blue
          label: "Bluetooth"
          detail: Bluetooth.label
          on: Bluetooth.enabled
          onClicked: Bluetooth.toggle()
        }
      }

      // Sliders
      Column {
        width: parent.width
        spacing: 10

        // Volume Slider
        Slider {
          width: parent.width
          icon: Audio.icon
          accent: Theme.blue
          value: Audio.volume
          label: Audio.label
          onMoved: newValue => Audio.setVolume(newValue)
        }

        // Brightness Slider
        Slider {
          width: parent.width
          icon: "brightness_6"
          accent: Theme.yellow
          value: Brightness.value
          label: Brightness.label
          onMoved: newValue => Brightness.setBrightness(newValue)
        }
      }

      // Media Info & Controls
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
            radius: 12
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
    }
  }
}
