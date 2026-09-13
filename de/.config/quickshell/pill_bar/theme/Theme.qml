pragma Singleton

import QtQuick
import Quickshell
import "Palette.js" as Palette
import qs.config

Singleton {
  id: root

  readonly property color bgT: "transparent"

  readonly property color pill: Palette.background0         // Pill BG
  readonly property color pillIcon: Palette.background2    // Icon square BG
  readonly property color text: Palette.text
  readonly property color muteText: Palette.subtext0
  readonly property color accent: Palette.teal

  readonly property color butBg1: Palette.surface1
  readonly property color butBg2: Palette.surface2

  readonly property color black: "#000000"
  readonly property color white: "#ffffff"
  readonly property color red: Palette.red
  readonly property color orange: Palette.orange
  readonly property color yellow: Palette.yellow
  readonly property color green: Palette.green
  readonly property color cyan: Palette.teal
  readonly property color blue: Palette.blue
  readonly property color purple: Palette.purple
  readonly property color pink: Palette.pink
  readonly property color magenta: Palette.lightRed

  property int barHeight: Config.barHeight
  property int moduleHeight: Config.moduleHeight
  property int moduleHeightClock: moduleHeight
  property int moduleHeightExpanded: Config.moduleHeightExpanded
  property int margin: Config.spacingStep * 4
  property int radius: moduleHeight / 2

  property int notifiWidth: 600

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
}
