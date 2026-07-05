import QtQuick
import QtQuick.Layouts
import Quickshell
import "components"
import qs.theme

PanelWindow {
  id: topBar

  required property var modelData

  screen: modelData
  implicitHeight: Sizes.barHeight
  color: "transparent"

  anchors {
    top: true
    right: true
    left: true
  }

  margins {
    top: Sizes.s2
    left: Sizes.s4
    right: Sizes.s4
  }

  Rectangle {
    anchors.fill: parent
    color: Colors.bg0
    radius: height / 2 //Sizes.rMd

    GridLayout {
      id: grid

      columns: 3
      rows: 1
      columnSpacing: 0

      anchors {
        fill: parent
        leftMargin: Sizes.s5
        rightMargin: Sizes.s5
      }

      Item {
        id: leftItem

        Layout.fillWidth: true
        Layout.fillHeight: true

        RowLayout {
          anchors.fill: parent

          Workspaces {}
        }
      }

      Item {
        id: centerItem

        Layout.fillWidth: true
        Layout.fillHeight: true

        RowLayout {
          anchors.fill: parent

          Clock {}
        }
      }

      Item {
        id: rightItem

        Layout.fillWidth: true
        Layout.fillHeight: true

        RowLayout {
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: parent.right
          spacing: Sizes.s3

          CPU {}

          Network {}

          Audio {}

          Battery {}
        }
      }
    }
  }
}
