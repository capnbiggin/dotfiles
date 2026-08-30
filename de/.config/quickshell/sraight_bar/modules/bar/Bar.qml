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
    // top: Sizes.s2
    left: Sizes.sBar
    right: Sizes.sBar
  }

  Rectangle {
    anchors.fill: parent
    color: Colors.bg0
    // radius: height / 2 //Sizes.rMd
    // bottomLeftRadius: Sizes.rMd
    // bottomRightRadius: Sizes.rMd

    RowLayout {
      id: barRow

      anchors {
        fill: parent
        leftMargin: Sizes.s4
        rightMargin: Sizes.s4
      }

      Rectangle {
        id: leftItem

        // Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignLeft

        RowLayout {
          anchors.fill: parent

          Workspaces {}
        }
      }

      Rectangle {
        id: centerItem

        // Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignHCenter

        RowLayout {
          anchors.fill: parent

          Clock {}
        }
      }

      Rectangle {
        id: rightItem

        // Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignRight

        RowLayout {
          anchors.verticalCenter: parent.verticalCenter
          anchors.right: parent.right
          spacing: Sizes.s3

          CPU {}
          Audio {}
          Battery {}
          Network {}
        }
      }
    }
  }
}
