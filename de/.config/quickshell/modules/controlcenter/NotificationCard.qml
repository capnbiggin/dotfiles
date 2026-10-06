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
      opacity: Notifs.list.length > 0 ? 1 : 0
      Behavior on opacity {
        NumberAnimation {
          duration: Theme.fadeTime
        }
      }

      MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: listBox.shown = false
      }
    }
  }

  Item {
    id: listBox
    width: parent.width
    height: Math.min(Notifs.list.length, 5) * 64 - 8
    visible: Notifs.list.length > 0

    Behavior on height {
      NumberAnimation {
        duration: Theme.slideTime
        easing.type: Easing.OutQuint
      }
    }

    property bool shown: true

    opacity: shown ? 1 : 0
    Behavior on opacity {
      NumberAnimation {
        duration: Theme.fadeTime
      }
    }

    x: shown ? 0 : 16
    Behavior on x {
      NumberAnimation {
        duration: Theme.fadeTime
        easing.type: Easing.InQuad
      }
    }

    Timer {
      running: !listBox.shown
      interval: Theme.fadeTime
      onTriggered: {
        Notifs.clearAll();
        listBox.shown = true;
      }
    }

    ListView {
      id: list
      anchors.fill: parent
      clip: true
      spacing: 8
      boundsBehavior: Flickable.StopAtBounds
      model: ScriptModel {
        values: Notifs.list
      }

      displaced: Transition {
        NumberAnimation {
          property: "y"
          duration: Theme.slideTime
          easing.type: Easing.OutQuint
        }
      }

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
      radius: 2
      color: Theme.grey2
      visible: list.contentHeight > list.height
      height: list.height * list.height / list.contentHeight
      Behavior on height {
        NumberAnimation {
          duration: Theme.slideTime
          easing.type: Easing.OutQuint
        }
      }
      opacity: list.contentHeight > list.height ? 1 : 0
      Behavior on opacity {
        NumberAnimation {
          duration: Theme.fadeTime
        }
      }
    }
  }
}
