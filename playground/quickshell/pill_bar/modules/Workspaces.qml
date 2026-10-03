import Quickshell
import Quickshell.Hyprland
import QtQuick
import qs.theme
import qs.components

Rectangle {
  id: root

  implicitHeight: Theme.moduleHeight
  implicitWidth: row.width + Theme.margin * 2
  radius: Theme.radius
  color: Theme.pill

  Shadow {}

  Row {
    id: row
    spacing: 2
    width: implicitWidth
    height: parent.height
    anchors.centerIn: parent

    Repeater {
      model: 10 //Hyprland.workspaces

      Rectangle {
        id: wsButton
        required property int index
        required property var modelData
        property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
        property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
        implicitWidth: label.implicitWidth + 6
        implicitHeight: 22
        radius: Theme.radius
        color: isActive ? Theme.butBg1 : (ws ? Theme.butBg2 : Theme.pillIcon)
        anchors.verticalCenter: parent.verticalCenter

        Behavior on color {
          ColorAnimation {
            duration: 280
          }
        }

        Text {
          id: label
          anchors.centerIn: parent
          text: {
            if ((wsButton.index + 1) == 10)
              return "0";
            return wsButton.index + 1;
          }
          color: wsButton.isActive ? Theme.accent : (ws ? Theme.text : Theme.muteText)
          font {
            family: Theme.fontFam
            pixelSize: Theme.fontSize
            weight: 700
          }
        }

        MouseArea {
          anchors.fill: parent
          cursorShape: Qt.PointingHandCursor
          onPressed: Hyprland.dispatch(`hl.dsp.focus({ workspace = ${index + 1} })`)
        }
      }
    }
  }
}
