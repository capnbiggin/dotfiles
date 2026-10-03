pragma Singleton

import QtQuick
import Quickshell
// import "Palette.js" as Palette
import qs.config

Singleton {
  id: root

  QtObject {
    id: pal

    readonly property color normfgcolor: "#CDD6F4"
    readonly property color normbgcolor: "#1E1E2E"
    readonly property color normbordercolor: "#313244"
    readonly property color selfgcolor: "#CDD6F4"
    readonly property color selbgcolor: "#313244"
    readonly property color selbordercolor: "#CBA6F7"

    readonly property color bg: "#1e1e2e"
    readonly property color bg2: "#181825"
    readonly property color fg: "#cdd6f4"
    readonly property color cursor: "#cba6f7"
    readonly property color color0: "#45475a"
    readonly property color color1: "#f38ba8"
    readonly property color color2: "#a6e3a1"
    readonly property color color3: "#f9e2af"
    readonly property color color4: "#89b4fa"
    readonly property color color5: "#f5c2e7"
    readonly property color color6: "#94e2d5"
    readonly property color color7: "#bac2de"
    readonly property color color8: "#585b70"
    readonly property color color9: "#f38ba8"
    readonly property color color10: "#a6e3a1"
    readonly property color color11: "#f9e2af"
    readonly property color color12: "#89b4fa"
    readonly property color color13: "#f5c2e7"
    readonly property color color14: "#94e2d5"
    readonly property color color15: "#bac2de"
  }

  function alpha(c, a) {
    return Qt.rgba(c.r, c.g, c.b, a);
  }

  readonly property color bgT: "transparent"

  readonly property color pill: pal.bg         // Pill BG
  readonly property color pillIcon: pal.bg2  // Icon square BG
  readonly property color text: pal.fg
  readonly property color muteText: alpha(pal.fg, 0.80)
  readonly property color accent: pal.color6

  readonly property color butBg1: alpha(pal.bg2, 0.95)
  readonly property color butBg2: alpha(pal.bg2, 0.90)
  readonly property color butBg3: alpha(pal.bg2, 0.85)

  readonly property color black: "#000000"
  readonly property color white: "#ffffff"
  readonly property color red: pal.color1
  readonly property color orange: pal.color3
  readonly property color yellow: pal.color3
  readonly property color green: pal.color2
  readonly property color cyan: pal.color6
  readonly property color blue: pal.color4
  readonly property color purple: pal.color5
  readonly property color pink: pal.color1
  readonly property color magenta: pal.color1

  property int barHeight: Config.barHeight
  property int moduleHeight: Config.moduleHeight
  property int moduleHeightClock: moduleHeight
  property int moduleHeightExpanded: Config.moduleHeightExpanded
  property int margin: Config.spacingStep * 4
  property int radius: moduleHeight / 2

  property int notifiWidth: 320

  // Spacing
  property int s1: Config.spacingStep
  property int s2: Config.spacingStep * 2
  property int s3: Config.spacingStep * 3
  property int s4: Config.spacingStep * 4
  property int s5: Config.spacingStep * 6
  property int s6: Config.spacingStep * 8

  // Fonts
  property string fontFam: "SF Pro Text"
  property real fontSize: Config.fontSize
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
  property int iconSize: Config.iconSize

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
  property int shadowRoom: (Config.shadowStep * 3.5)
  property real shadowBlur: (Config.shadowStep * 4)
  property real shadowSpread: (Config.shadowStep * 0.25)
  property real shadowOffset: (Config.shadowStep * 0.75)
  property color shadowColor: Qt.rgba(0, 0, 0, Config.shadowOpacity / 100)

  // Animations
  property int aniFast: 150
  property int aniMid: 225
  property int aniSlo: 300
}
