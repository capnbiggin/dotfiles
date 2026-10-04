import QtQuick
import Quickshell

import qs.theme
import qs.components
import qs.services

Column {
  width: parent.width
  spacing: 8

  Item {
    width: parent.width
    height: 20

    Text {
      anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
      }
      text: Notifs.list.length === 0 ? "No Notifications" : "Notifications"
      color: Theme.fg
      font {
        family: Theme.font
        pixelSize: Theme.sFontSize
        weight: 700
      }
    }
    Text {
      anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
      }
      text: "Clear All"
      color: Theme.accent
      font {
        family: Theme.font
        pixelSize: Theme.sFontSize
        weight: 600
      }
      visible: Notifs.list.length > 0

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: Notifs.clearAll()
      }
    }
  }

  Item {
    width: parent.width
    height: Math.min(Notifs.list.length, 5) * 64 - 8
    visible: Notifs.list.length > 0

    ListView {
      id: list
      anchors.fill: parent
      clip: true
      spacing: 8
      boundsBehavior: Flickable.StopAtBounds
      model: Notifs.list

      delegate: NotificationRow {
        required property var modelData
        width: content.width
        notification: modelData
      }
    }

    // Side Scroll Bar for Notifications
    Rectangle {
      x: parent.width + 6
      y: list.height * list.contentY / list.contentHeight
      width: 3
      height: list.height * list.height / list.contentHeight
      radius: 2
      color: Theme.gert2
      visible: list.contentHeight > list.height
    }
  }
}
