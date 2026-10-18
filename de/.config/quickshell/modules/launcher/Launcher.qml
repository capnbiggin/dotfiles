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
  readonly property var wallpaperRows: Wallpapers.files.filter(file => Wallpapers.nameOf(file).includes(query))

  readonly property var rows: {
    if (mode === "themes") {
      return themeRows;
    }
    if (mode === "wallpapers") {
      return wallpaperRows;
    }
    return appRows;
  }

  property int selected: 0
  onQueryChanged: selected = 0

  readonly property int railWidth: 56
  readonly property int wideWidth: 480

  anchors {
    top: true
    left: true
    right: true
    bottom: true
  }

  exclusionMode: ExclusionMode.Ignore
  color: open ? Theme.alpha(Theme.bg0, 0.65) : "transparent"
  Behavior on color {
    ColorAnimation {
      duration: Theme.fadeTime
    }
  }

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
    } else if (mode === "themes") {
      setMode("wallpapers");
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
    } else if (mode === "wallpapers") {
      Wallpapers.apply(rows[selected]);
    } else {
      rows[selected].execute();
      Popups.closeAll();
    }
  }

  MouseArea {
    id: backdrop
    anchors.fill: parent
    onClicked: Popups.closeAll()
  }

  Rectangle {
    id: panel

    width: launcher.mode === "wallpapers" ? launcher.wideWidth : Theme.panelWidth
    height: Math.max(content.height + 28, 200)
    y: Theme.belowBar
    radius: Theme.panelRadius
    color: Theme.bg1

    border {
      width: 1
      color: Theme.alpha(Theme.cyan, 0.45)
    }

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
    Behavior on width {
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

        border {
          width: 1
          color: Theme.alpha(Theme.cyan, 0.45)
        }

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
          RailButton {
            icon: "wallpaper"
            label: "Walls"
            accent: Theme.purple
            on: launcher.mode === "wallpapers"
            onClicked: launcher.setMode("wallpapers")
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
                launcher.move(launcher.mode === "wallpapers" ? 2 : 1);
              } else if (event.key === Qt.Key_Up) {
                launcher.move(launcher.mode === "wallpapers" ? -2 : -1);
              } else if (event.key === Qt.Key_Right && launcher.mode === "wallpapers") {
                launcher.move(1);
              } else if (event.key === Qt.Key_Left && launcher.mode === "wallpapers") {
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

        Item {
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

          // App List
          ListView {
            id: appList
            anchors.fill: parent
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

          // Side Scroll Bar for Apps
          Rectangle {
            x: parent.width + 6
            y: appList.height * appList.contentY / appList.contentHeight
            width: 3
            radius: 2
            color: Theme.grey2
            visible: appList.contentHeight > appList.height && launcher.mode === "apps"
            height: appList.height * appList.height / appList.contentHeight
            Behavior on height {
              NumberAnimation {
                duration: Theme.slideTime
                easing.type: Easing.OutQuint
              }
            }
            opacity: appList.contentHeight > appList.height ? 1 : 0
            Behavior on opacity {
              NumberAnimation {
                duration: Theme.fadeTime
              }
            }
          }
        }

        Item {
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

          // Themes List
          ListView {
            id: themeList
            anchors.fill: parent
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
              detail: current ? "Current" : ""
              icon: "palette"
              accent: Theme.orange
              current: modelData === Themes.current

              onClicked: {
                launcher.selected = index;
                launcher.activate();
              }
            }
          }
          // Side Scroll Bar for Themes
          Rectangle {
            x: parent.width + 6
            y: themeList.height * themeList.contentY / themeList.contentHeight
            width: 3
            radius: 2
            color: Theme.grey2
            visible: themeList.contentHeight > themeList.height && launcher.mode === "themes"
            height: themeList.height * themeList.height / themeList.contentHeight
            Behavior on height {
              NumberAnimation {
                duration: Theme.slideTime
                easing.type: Easing.OutQuint
              }
            }
            opacity: themeList.contentHeight > themeList.height ? 1 : 0
            Behavior on opacity {
              NumberAnimation {
                duration: Theme.fadeTime
              }
            }
          }
        }

        Item {
          readonly property bool active: launcher.mode === "wallpapers"
          width: 396
          height: Math.min(Math.ceil(launcher.wallpaperRows.length / 2), 3) * 130
          visible: active && launcher.wallpaperRows.length > 0
          opacity: active ? 1 : 0
          Behavior on opacity {
            NumberAnimation {
              duration: Theme.fadeTime
            }
          }

          // Wallpaper grid
          GridView {
            id: grid
            anchors.fill: parent
            clip: true
            cellWidth: 198
            cellHeight: 130
            boundsBehavior: Flickable.StopAtBounds
            model: launcher.wallpaperRows
            currentIndex: launcher.selected
            highlightMoveDuration: Theme.hoverTime

            highlight: Item {
              z: 2
              Rectangle {
                width: 190
                height: 107
                radius: 16
                color: "transparent"
                border.width: 2
                border.color: Theme.purple
              }
            }

            delegate: WallpaperTile {
              required property string modelData
              required property int index
              file: modelData
              name: Wallpapers.nameOf(modelData)
              current: modelData === Wallpapers.current
              onClicked: {
                launcher.selected = index;
                launcher.activate();
              }
            }
          }

          // Side Scroll Bar for Wallpapers
          Rectangle {
            x: parent.width + 6
            y: grid.height * grid.contentY / grid.contentHeight
            width: 3
            radius: 2
            color: Theme.grey2
            visible: grid.contentHeight > grid.height && launcher.mode === "wallpapers"
            height: grid.height * grid.height / grid.contentHeight
            Behavior on height {
              NumberAnimation {
                duration: Theme.slideTime
                easing.type: Easing.OutQuint
              }
            }
            opacity: grid.contentHeight > grid.height ? 1 : 0
            Behavior on opacity {
              NumberAnimation {
                duration: Theme.fadeTime
              }
            }
          }
        }

        // (query) Nothing Found
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
