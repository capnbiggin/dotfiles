import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.theme
import qs.components
import qs.services

PanelWindow {
  id: settingsPanel

  readonly property bool open: Popups.settingsPanel && Popups.screenName === screen.name

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

    anchors.centerIn: parent
    width: 800
    height: 600
    radius: Theme.panelRadius
    color: Theme.bg1

    border {
      width: 1
      color: Theme.alpha(Theme.cyan, 0.45)
    }

    opacity: settingsPanel.open ? 1 : 0
    Behavior on opacity {
      NumberAnimation {
        duration: Theme.fadeTime
      }
    }

    Shadow {}

    MouseArea {
      anchors.fill: parent
    }

    Text {
      text: "Testing"
      anchors.centerIn: parent
      color: Theme.fg
    }
  }
}
