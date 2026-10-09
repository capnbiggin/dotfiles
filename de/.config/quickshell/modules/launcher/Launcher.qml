import QtQuick
import Quickshell
import Quickshell.Wayland

import qs.theme
import qs.components
import qs.services

PanelWindow {
  id: launcher

  readonly property bool open: Popups.launcher && Popups.screenName === screen.name

  property string mode: "apps"

  readonly property string query: search.text
  readonly property var appRows: Apps.search(query)
  readonly property var themeRows: Themes.names.filter(name => name.includes(query))

  readonly property var rows: {
    if (mode === "themes") {
      return themeRows;
    }
    return appRows;
  }

  property int selected: 0
  onQueryChanged: selected = 0

  readonly property int railWidth: 56

  anchors {
    top: true
    left: true
    right: true
    bottom: true
  }

  exclusionMode: ExclusionMode.Ignore
  color: "transparent"

  WlrLayershell.keyboardFocus: open ? WlrKeyboardFocus.Exclusive : WlrKeyboardFocus.None

  Region {
    id: nothing
  }
  mask: open ? null : nothing

  onOpenChanged: {
    if (open) {
      setMode("apps");
      search.forceActiveFocus();
    }
  }

  function setMode(newMode) {
    mode = newMode;
    search.text = "";
    selected = 0;
  }

  function nextMode() {
    if (mode === "apps") {
      setMode("themes");
    } else {
      setMode("apps");
    }
  }

  function move(step) {
    let next = selected + step;
    if (next < 0) {
      next = 0;
    }
    if (next > rows.length - 1) {
      next = rows.length - 1;
    }
    selected = next;
  }

  function activate() {
    if (rows.length === 0) {
      return;
    }

    if (mode === "themes") {
      Themes.apply(rows[selected]);
    } else {
      rows[selected].execute();
    }
    Popups.closeAll();
  }

  MouseArea {
    id: backdrop
    anchors.fill: parent
    onClicked: Popups.closeAll()
  }

  Rectangle {
    id: panel

    width: Theme.panelWidth
    height: Math.max(content.height + 28, 200)
    y: Theme.belowBar
    radius: Theme.panelRadius
    color: Theme.bg1

    x: launcher.open ? Theme.margin : -width
    Behavior on x {
      NumberAnimation {
        duration: Theme.slideTime
        easing.type: Easing.OutQuint
      }
    }
    Behavior on height {
      NumberAnimation {
        duration: Theme.slideTime
        easing: Easing.OutQuint
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
        width: launcher.railWidth
        height: parent.height
        topLeftRadius: Theme.panelRadius
        bottomLeftRadius: Theme.panelRadius
        color: Theme.bg0

        Column {
          y: 10
          width: parent.width
          spacing: 2

          RailButton {
            icon: "apps"
            label: "Apps"
            accent: Theme.cyan
            on: launcher.mode === "apps"
            onClicked: launcher.setMode("apps")
          }
          RailButton {
            icon: "palette"
            label: "Themes"
            accent: Theme.orange
            on: launcher.mode === "themes"
            onClicked: launcher.setMode("themes")
          }
        }
      }

      Column {
        id: content
        x: launcher.railWidth + 14
        y: 14
        width: parent.width - launcher.railWidth - 28
        spacing: 12

        // Search Bar
        Rectangle {
          width: parent.width
          height: 44
          radius: 22
          color: Theme.bg3

          IconDisc {
            id: searchDisc
            x: 7
            anchors.verticalCenter: parent.verticalCenter
            icon: "search"
            accent: Theme.accent
          }

          TextInput {
            id: search
            anchors.left: searchDisc.right
            anchors.leftMargin: 12
            anchors.right: parent.right
            anchors.rightMargin: 14
            anchors.verticalCenter: parent.verticalCenter
            color: Theme.fg
            font {
              family: Theme.font
              pixelSize: 14
              weight: 600
            }
            clip: true
            focus: true
            Keys.onEscapePressed: Popups.closeAll()

            Keys.onPressed: event => {
              if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                launcher.activate();
              } else if (event.key === Qt.Key_Down) {
                launcher.move(1);
              } else if (event.key === Qt.Key_Up) {
                launcher.move(-1);
              } else if (event.key === Qt.Key_Tab) {
                launcher.nextMode();
              } else {
                return;
              }
              event.accepted = true;
            }

            Text {
              anchors.verticalCenter: parent.verticalCenter
              visible: search.text === ""
              text: "Search"
              color: Theme.fg
              font {
                family: Theme.font
                pixelSize: 14
                weight: 600
              }
            }
          }
        }

        // App List
        ListView {
          readonly property bool active: launcher.mode === "apps"
          width: parent.width
          height: Math.min(launcher.appRows.length, 8) * 54 - 6
          visible: active && launcher.appRows.length > 0
          opacity: active ? 1 : 0
          Behavior on opacity {
            NumberAnimation {
              duration: Theme.fadeTime
            }
          }
          clip: true
          spacing: 6
          boundsBehavior: Flickable.StopAtBounds
          model: launcher.appRows

          currentIndex: launcher.selected
          highlightMoveDuration: Theme.hoverTime
          highlight: Rectangle {
            z: 2
            radius: 16
            color: Theme.tint(Theme.accent)
          }

          delegate: ResultRow {
            required property var modelData
            required property int index

            width: content.width
            name: modelData.name
            detail: modelData.comment
            iconName: modelData.icon

            onClicked: {
              launcher.selected = index;
              launcher.activate();
            }
          }
        }

        // Themes List
        ListView {
          readonly property bool active: launcher.mode === "themes"
          width: parent.width
          height: Math.min(launcher.themeRows.length, 8) * 54 - 6
          visible: active && launcher.themeRows.length > 0
          opacity: active ? 1 : 0
          Behavior on opacity {
            NumberAnimation {
              duration: Theme.fadeTime
            }
          }
          clip: true
          spacing: 6
          boundsBehavior: Flickable.StopAtBounds
          model: launcher.themeRows

          currentIndex: launcher.selected
          highlightMoveDuration: Theme.hoverTime
          highlight: Rectangle {
            z: 2
            radius: 16
            color: Theme.tint(Theme.accent)
          }

          delegate: ResultRow {
            required property string modelData
            required property int index

            width: content.width
            name: modelData
            detail: current ? "Current0" : ""
            icon: "palette"
            accent: Theme.orange
            current: modelData === Themes.current

            onClicked: {
              launcher.selected = index;
              launcher.activate();
            }
          }
        }

        Text {
          visible: launcher.rows.length === 0
          width: parent.width
          height: 48
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
          text: "Nothing Found"
          color: Theme.grey2
          font {
            family: Theme.font
            pixelSize: Theme.sFontSize
          }
        }
      }
    }
  }
}
