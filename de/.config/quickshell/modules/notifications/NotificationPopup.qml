import QtQuick
import Quickshell

import qs.theme
import qs.services

PanelWindow {
  id: popup

  readonly property bool onThisScreen: Popups.screenName === screen.name
  readonly property bool open: Notifs.popups.length > 0 && onThisScreen

  anchors {
    top: true
    bottom: true
    // right: true
  }

  implicitWidth: 380 + Theme.shadowRoom * 2

  margins {
    top: Theme.belowBar - Theme.shadowRoom
    right: Theme.margin - Theme.shadowRoom
  }

  exclusionMode: ExclusionMode.Ignore
  color: "transparent"

  Region {
    id: nothing
  }
  Region {
    id: toast
    item: stack
  }
  mask: open ? toast : nothing

  Column {
    id: stack
    x: Theme.shadowRoom
    y: Theme.shadowRoom
    spacing: 10

    Repeater {
      model: ScriptModel {
        values: popup.onThisScreen ? Notifs.popups : []
      }

      Toast {
        required property var modelData
        notification: modelData
      }
    }
  }
}
