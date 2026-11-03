import QtQuick
import Quickshell

import qs.theme
import qs.components
import qs.services

PanelWindow {
  id: osd

  property bool shown: false
  readonly property bool onThisScreen: Popups.screenName === screen.name

  property string kind: "volume"

  property bool ready: false

  Timer {
    interval: 2000
    running: true
    onTriggered: osd.ready = true
  }

  readonly property string icon: kind === "volume" ? Audio.icon : "brightness_4"
  readonly property color accent: kind === "volume" ? Theme.blue : Theme.yellow

  readonly property real value: kind === "volume" ? (Audio.muted ? 0 : Audio.volume) : Brightness.value
  readonly property string label: kind === "volume" ? (Audio.muted ? "Muted" : Audio.label) : Brightness.label

  Connections {
    target: Audio

    function onVolumeChanged() {
      osd.show("volume");
    }
    function onMutedChanged() {
      osd.show("volume");
    }
  }

  Connections {
    target: Brightness

    function onValueChanged() {
      osd.show("brightness");
    }
  }

  function show(which) {
    if (!ready) {
      return;
    }
    if (Popups.controlCenter) {
      return;
    }
    if (!shown) {
      Popups.pickScreen();
    }
    kind = which;
    shown = true;
    hideTimer.restart();
  }

  Timer {
    id: hideTimer
    interval: 1500
    onTriggered: osd.shown = false
  }

  anchors.bottom: true

  implicitWidth: 260 + Theme.shadowRoom * 2
  implicitHeight: 48 + Theme.shadowRoom * 2
  margins.bottom: 90 - Theme.shadowRoom

  exclusionMode: ExclusionMode.Ignore
  color: "transparent"

  mask: Region {}

  Rectangle {
    id: pill

    x: Theme.shadowRoom
    width: 260
    height: 48
    radius: 24
    color: Theme.bg1

    y: osd.shown && osd.onThisScreen ? Theme.shadowRoom : Theme.shadowRoom + 24
    opacity: osd.shown && osd.onThisScreen ? 1 : 0

    Behavior on y {
      NumberAnimation {
        duration: Theme.slideTime
        easing.type: Easing.OutQuint
      }
    }

    Behavior on opacity {
      NumberAnimation {
        duration: Theme.fadeTime
      }
    }

    Shadow {}

    IconDisc {
      id: disc

      x: 9
      anchors.verticalCenter: parent.verticalCenter
      icon: osd.icon
      accent: osd.accent
    }

    Text {
      id: valueText

      anchors {
        right: parent.right
        rightMargin: 16
        verticalCenter: parent.verticalCenter
      }

      text: osd.label
      color: Theme.fg

      font {
        family: Theme.font
        pixelSize: Theme.fontSize
        weight: 600
      }
    }

    Rectangle {
      anchors {
        left: disc.right
        leftMargin: 12
        right: valueText.left
        rightMargin: 12
        verticalCenter: parent.verticalCenter
      }

      height: 8
      radius: 4
      color: Theme.bg3

      Rectangle {
        width: parent.width * osd.value
        height: parent.height
        radius: 4
        color: osd.accent
        Behavior on width {
          NumberAnimation {
            duration: Theme.hoverTime
          }
        }
      }
    }
  }
}
