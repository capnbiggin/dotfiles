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
    }
  }
}
