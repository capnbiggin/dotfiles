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

  color: open ? Theme.alpha(Theme.bg3, 0.65) : "transparent"
  Behavior on color {
    ColorAnimation {
      duration: Theme.fadeTime
    }
  }

  exclusionMode: ExclusionMode.Ignore
  WlrLayershell.keyboardFocus: open ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None
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
    height: content.height + 25
    y: Theme.belowBar
    radius: Theme.panelRadius
    // color: Theme.bg1
    gradient: Gradient {
      GradientStop {
        position: 0.0
        color: Theme.bg1
      }
      GradientStop {
        position: 0.5
        color: Theme.bg2
      }
      GradientStop {
        position: 1.0
        color: Theme.bg3
      }
    }

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
          height: Popups.power ? 36 + 18 + 92 : 36 // 36=HeadCard height 18=spacing 92=PowerCard height
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
