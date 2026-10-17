import QtQuick
import Quickshell
import Quickshell.Wayland

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

  color: open ? Theme.alpha(Theme.bg0, 0.65) : "transparent"
  Behavior on color {
    ColorAnimation {
      duration: Theme.fadeTime
    }
  }

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

    border {
      width: 1
      color: Theme.alpha(Theme.cyan, 0.45)
    }

    x: cc.open ? cc.width - width - Theme.margin : cc.width
    Behavior on x {
      NumberAnimation {
        duration: Theme.slideTime
        easing.type: Easing.OutQuint
      }
    }
    Behavior on height {
      enabled: !headerSlide.running
      NumberAnimation {
        duration: Theme.slideTime
        easing.type: Easing.OutQuint
      }
    }

    Shadow {}

    MouseArea {
      anchors.fill: parent
    }

    Item {
      anchors.fill: parent
      clip: true

      Column {
        id: content
        x: 14
        y: 14
        width: parent.width - 28
        spacing: 18

        HeadCard {
          width: parent.width
          height: Popups.power ? 36 + 18 + 92 : 36
          clip: true
          Behavior on height {
            NumberAnimation {
              id: headerSlide
              duration: Theme.slideTime
              easing.type: Easing.OutQuint
            }
          }
        }
        ToggleCard {}
        SliderCard {}
        MediaCard {}
        NotificationCard {}
      }
    }
  }
}
