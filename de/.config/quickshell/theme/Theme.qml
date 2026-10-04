pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  FileView {
    id: file
    path: Quickshell.shellDir + "/colors.json"
    watchChanges: true
    onFileChanged: reload()

    JsonAdapter {
      id: pal
      property string name: "ariadne"

      property string bg0: "#040e0d"
      property string bg1: "#0a1816"
      property string bg2: "#0f311f"
      property string bg3: "#152a26"
      property string bg4: "#1d3631"

      property string fg: "#f5e2c5"

      property string red: "#ff6048"
      property string orange: "#ffa478"
      property string yellow: "#f5cd5b"
      property string green: "#7ad9a8"
      property string cyan: "#3dd1b0"
      property string blue: "#5fc8d4"
      property string purple: "#e89aa8"

      property string grey0: "#3a1a35"
      property string grey1: "#5a4d3e"
      property string grey2: "#c4b09a"
    }
  }

  // colors
  readonly property string name: pal.name

  readonly property color bg0: pal.bg0
  readonly property color bg1: pal.bg1
  readonly property color bg2: pal.bg2
  readonly property color bg3: pal.bg3
  readonly property color bg4: pal.bg4

  readonly property color fg: pal.fg

  readonly property color red: pal.red
  readonly property color orange: pal.orange
  readonly property color yellow: pal.yellow
  readonly property color green: pal.green
  readonly property color cyan: pal.cyan
  readonly property color blue: pal.blue
  readonly property color purple: pal.purple

  readonly property color grey0: pal.grey0
  readonly property color grey1: pal.grey1
  readonly property color grey2: pal.grey2

  readonly property color accent: cyan

  //
  function tint(c) {
    return Qt.alpha(c, 0.18);
  }

  // sizing
  readonly property int moduleHeight: 30
  readonly property int spacing: 8
  readonly property int margin: 13
  readonly property int radius: 15
  readonly property int belowBar: margin + moduleHeight + margin
  readonly property int panelWidth: 360
  readonly property int panelRadius: 20
  readonly property int shadowRoom: 24

  // font
  readonly property string font: "SF Pro Display" //"SF Pro Text"
  readonly property string nerdFont: "JetBrainsMono Nerd Font Propo"
  readonly property int fontSize: 15
  readonly property int sFontSize: 13
  readonly property int xsFontSize: 11

  //icon
  readonly property string iconFont: "Material Symbols Rounded"
  readonly property int iconSize: 16
  readonly property var iconAxes: ({
      "FILL": 0,
      "wght": 700,
      "GRAD": 0,
      "opsz": 20
    })
  readonly property var iconAxesFilled: ({
      "FILL": 1,
      "wght": 600,
      "GRAD": 0,
      "opsz": 20
    })

  // animation
  readonly property int slideTime: 360
  readonly property int fadeTime: 220
  readonly property int hoverTime: 140
}
