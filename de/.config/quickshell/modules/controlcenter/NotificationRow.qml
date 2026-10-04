import QtQuick
import Quickshell
import Quickshell.Services.Notifications

import qs.theme
import qs.components

Rectangle {
  id: row

  required property var notification

  readonly property color accent: notification.urgency === NotificationUrgency.Critical ? Theme.red : Theme.cyan

  height: 56
  radius: 16
  color: Theme.bg2

  IconDisc {
    id: disc
    x: 12
    anchors.verticalCenter: parent.verticalCenter
    icon: "notifications"
    accent: row.accent
  }
  Column {
    anchors {
      left: disc.right
      leftMargin: 10
      right: parent.right
      rightMargin: 12
      verticalCenter: parent.verticalCenter
    }
    spacing: 2

    Item {
      width: parent.width
      height: 16

      Text {
        anchors.left: parent.left
        width: parent.width - 60
        text: row.notification.summary
        color: Theme.fg
        font {
          family: Theme.font
          pixelSize: Theme.sFontSize
          weight: 700
        }
        elide: Text.ElideRight
      }
      Text {
        anchors.right: parent.right
        text: row.notification.appName
        color: Theme.grey2
        font {
          family: Theme.font
          pixelSize: Theme.sFontSize
        }
      }
    }
    Text {
      width: parent.width
      text: row.notification.body
      color: Theme.grey2
      font {
        family: Theme.font
        pixelSize: Theme.xsFontSize
      }
      elide: Text.ElideRight
      textFormat: Text.StyledText
    }
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onClicked: row.notification.dismiss()
  }
}
