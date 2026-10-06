import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

import qs.theme
import qs.components
import qs.services

Rectangle {
  id: toast

  required property var notification

  readonly property bool critical: notification.urgency === NotificationUrgency.Critical
  readonly property color accent: critical ? Theme.red : Theme.green

  readonly property string iconSource: notification.image || Quickshell.iconPath(notification.appIcon, true)

  Timer {
    interval: 5000
    running: !toast.critical
    onTriggered: Notifs.hidePopup(toast.notification)
  }

  width: 380
  height: body.height + 34
  radius: Theme.panelRadius
  color: Theme.bg1

  border {
    width: 1
    color: critical ? Theme.red : Theme.green
  }

  Shadow {}

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: Notifs.hidePopup(toast.notification)
  }

  Connections {
    target: Popups

    function onControlCenterChanged() {
      if (Popups.controlCenter) {
        Notifs.hidePopup(toast.notification);
      }
    }
  }

  Connections {
    target: toast.notification

    function onClosed() {
      Notifs.hidePopup(toast.notification);
    }
  }

  Column {
    id: body

    x: 14
    y: 14
    width: parent.width - 20
    spacing: 10

    Row {
      width: parent.width
      spacing: 10

      IconImage {
        implicitSize: 34
        source: toast.iconSource
        visible: toast.iconSource !== ""
      }

      IconDisc {
        icon: "notifications"
        accent: toast.accent
        size: 34
        visible: toast.iconSource === ""
      }

      Column {
        width: parent.width - 44
        spacing: 3

        Text {
          text: toast.notification.appName
          color: Theme.grey2
          font {
            family: Theme.font
            pixelSize: Theme.sFontSize
          }
        }

        Text {
          text: toast.notification.summary
          color: Theme.fg
          font {
            family: Theme.font
            pixelSize: Theme.fontSize
            weight: 700
          }
          elide: Text.ElideRight
        }

        Text {
          width: parent.width
          text: toast.notification.body
          color: Theme.grey2
          font {
            family: Theme.font
            pixelSize: Theme.sFontSize
          }
          wrapMode: Text.WordWrap
          maximumLineCount: 2
          elide: Text.ElideRight
          textFormat: Text.StyledText
          visible: text !== ""
        }
      }
    }
    Row {
      x: 44
      spacing: 6
      visible: toast.notification.actions.length > 0

      Repeater {
        model: toast.notification.actions

        ActionButton {
          required property var modelData
          required property int index

          label: modelData.text
          accent: toast.accent
          filled: index === 0
          onClicked: modelData.invoke()
        }
      }
    }
  }
}
