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

    Item {
      anchors.fill: parent
      clip: true

      Rectangle {
        id: rail
        width: 180
        height: parent.height
        topLeftRadius: Theme.panelRadius
        bottomLeftRadius: Theme.panelRadius
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
          color: Theme.alpha(Theme.cyan, 0.45)
          width: 1
        }

        Text {
          text: "test"
          color: Theme.fg
          // anchors.centerIn: parent
          anchors.top: parent.top
          anchors.left: parent.left
          anchors.topMargin: 20
          anchors.leftMargin: 25
        }
      }

      Text {
        text: "test"
        color: Theme.fg
        anchors.centerIn: parent
      }
    }
  }
}
