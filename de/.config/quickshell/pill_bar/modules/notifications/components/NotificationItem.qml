// modules/Notifications/NotificationItem.qml

import QtQuick
import qs.theme

Rectangle {
  id: root

  property string summary: ""
  property string body: ""
  property string appName: ""
  property int urgency: 1

  signal dismissed

  width: 300
  height: column.implicitHeight + 24
  radius: 15
  color: Theme.pill
  border.color: urgency === 2 ? Theme.red : Theme.cyan
  Component.onCompleted: slideAnim.start()

  // ─── Glow for critical notifications ────────────────────
  PulseGlow {
    anchors.fill: parent
    anchors.margins: -6
    active: urgency === 2
    glowColor: Theme.red
    intensity: 0.5
    pulseSpeed: 1
    z: -1
  }

  NumberAnimation {
    id: slideAnim

    target: slideIn
    property: "x"
    from: 320
    to: 0
    duration: 250
    easing.type: Easing.OutCubic
  }

  // ─── Content ────────────────────────────────────────────
  Column {
    id: column

    spacing: 4

    anchors {
      left: parent.left
      right: parent.right
      top: parent.top
      margins: 12
    }

    // App name
    Text {
      text: root.appName
      color: Theme.text
      font.family: Theme.fontFam
      font.pixelSize: Theme.fontSize
      font.bold: true
    }

    // Summary
    Text {
      text: root.summary
      color: Theme.text
      font.family: Theme.fontFam
      font.pixelSize: Theme.fontSize
      font.bold: true
      wrapMode: Text.WordWrap
      width: parent.width
    }

    // Body (optional)
    Text {
      visible: root.body !== ""
      text: root.body
      color: Theme.text
      font.family: Theme.fontFam
      font.pixelSize: Theme.fontSize
      wrapMode: Text.WordWrap
      width: parent.width
      maximumLineCount: 3
      elide: Text.ElideRight
    }
  }

  // ─── Dismiss on click ───────────────────────────────────
  MouseArea {
    anchors.fill: parent
    onClicked: root.dismissed()
  }

  // ─── Slide-in animation ─────────────────────────────────
  transform: Translate {
    id: slideIn

    x: 320
  }
}
