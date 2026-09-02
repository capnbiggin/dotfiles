pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  QtObject {
    id: palette

    readonly property string rosewater: "#f5e0dc"
    readonly property string flamingo: "#f2cdcd"
    readonly property string pink: "#f5c2e7"
    readonly property string mauve: "#cba6f7"
    readonly property string red: "#f38ba8"
    readonly property string maroon: "#eba0ac"
    readonly property string peach: "#fab387"
    readonly property string yellow: "#f9e2af"
    readonly property string green: "#a6e3a1"
    readonly property string teal: "#94e2d5"
    readonly property string sky: "#89dceb"
    readonly property string sapphire: "#74c6ec"
    readonly property string blue: "#89b4fa"
    readonly property string lavender: "#b4befe"
    readonly property string text: "#cdd6f4"
    readonly property string subtext1: "#bac2de"
    readonly property string subtext0: "#a6adc8"
    readonly property string overlay2: "#9399b2"
    readonly property string overlay1: "#7f849c"
    readonly property string overlay0: "#6c7086"
    readonly property string surface2: "#585b70"
    readonly property string surface1: "#45475a"
    readonly property string surface0: "#45475a"
    readonly property string base: "#1e1e2e"
    readonly property string mantle: "#181825"
    readonly property string crust: "#11111b"
  }

  readonly property color bgT: "transparent"

  readonly property color pill: palette.crust         // Pill BG
  readonly property color pillIcon: palette.base    // Icon square BG
  readonly property color text: palette.text
  readonly property color muteText: palette.subtext0
  readonly property color accent: palette.sky

  readonly property color butBg1: palette.surface0
  readonly property color butBg2: palette.surface2

  readonly property color black: "#000000"
  readonly property color white: "#ffffff"
  readonly property color red: palette.red
  readonly property color orange: palette.peach
  readonly property color yellow: palette.yellow
  readonly property color green: palette.green
  readonly property color cyan: palette.teal
  readonly property color blue: palette.blue
  readonly property color purple: palette.mauve
  readonly property color pink: palette.pink
  readonly property color magenta: palette.flamingo

  property int barHeight: 42
  property int moduleHeight: 30
  property int spacing: 4
  property int margin: 16
  property int radius: moduleHeight / 2

  // Fonts
  property string fontFam: "SF Pro Text"
  property real fontSize: 14
  property real letterSpacing: 0

  // Icons
  // The font for icons.
  //
  // Material Symbols works by ligature. You write the icon name, like "wifi"
  // or "battery_full". The font swaps those letters for the icon.
  //
  // Keep this a Material Symbols family. Any other font draws the word "wifi".
  // Browse names at https://fonts.google.com/icons
  property string iconFam: "Material Symbols Rounded"
  property int iconSize: 15

  // Material Symbols ships as one variable font.
  // Four axes shape every icon on the bar:
  //   FILL  0 outlined, 1 solid. Values between work.
  //   wght  stroke thickness, 100 thin to 700 bold
  //   GRAD  emphasis tweak, -25 to 200
  //   opsz  the size you draw at, so the font tunes proportions
  property var iconAxes: ({
      "FILL": 0,
      "wght": 700,
      "GRAD": 0,
      "opsz": 20
    })

  // Shadow
  property int shadowRoom: 14
  property real shadowBlur: 16
  property real shadowSpread: 1
  property real shadowOffset: 3
  property color shadowColor: Qt.rgba(0, 0, 0, 0.45)
}
