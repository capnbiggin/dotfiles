pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  // FileView {
  //     path: `${Quickshell.env("HOME")}/.config/quickshell/colors.json`
  //     watchChanges: true
  //     onFileChanged: reload()

  // JsonAdapter {
  QtObject {
    id: pal
    property string background: "#061115"
    property string foreground: "#d9d7d6"
    property string cursor: "#d9d7d6"
    property string color0: "#061115"
    property string color1: "#df5b61"
    property string color2: "#78b892"
    property string color3: "#ecd28b"
    property string color4: "#6791c9"
    property string color5: "#c488ec"
    property string color6: "#67afc1"
    property string color7: "#d9d7d6"
    property string color8: "#313c40"
    property string color9: "#f16269"
    property string color10: "#8cd7aa"
    property string color11: "#f6dc95"
    property string color12: "#79aaeb"
    property string color13: "#bc83e3"
    property string color14: "#7acfe4"
    property string color15: "#edebea"
  }
  // }

  // color helpers
  // Blend two colors (t=0 → a, t=1 → b). We derive the surface shades from the
  // palette this way so they adapt to any scheme, curated or dynamic.
  function mix(a, b, t) {
    return Qt.rgba(a.r * (1 - t) + b.r * t, a.g * (1 - t) + b.g * t, a.b * (1 - t) + b.b * t, 1);
  }
  // Same color at a given alpha (ink/glass derived from fg, so it adapts to light themes).
  function alpha(c, a) {
    return Qt.rgba(c.r, c.g, c.b, a);
  }
  // Perceived luminance 0..1, used to pick readable ink on the accent.
  function lum(c) {
    return 0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b;
  }

  // ─── Background ───────────────────────
  readonly property color bg0: pal.background
  readonly property color bg1: "#11111b"
  readonly property color bg2: "#181825"
  readonly property color bg3: "#313244"
  readonly property color bg4: "#45475a"

  readonly property color bgBlack: "#000000"

  // ─── Foreground ───────────────────────
  readonly property color fg: pal.foreground
  readonly property color fgMuted: alpha(fg, 0.60)
  readonly property color accent: pal.color14

  // ─── Colors ───────────────────────────
  readonly property color red: pal.color1
  readonly property color green: pal.color2
  readonly property color orange: pal.color3
  readonly property color yellow: pal.color3
  readonly property color blue: pal.color4
  readonly property color purple: pal.color5
  readonly property color teal: pal.color6

  // ─── Greys ───────────────────────────
  readonly property color grey0: pal.color8
  readonly property color grey1: pal.color0
  readonly property color grey2: pal.color7

  // ─── Warn ───────────────────────────
  readonly property color good: pal.color2
  readonly property color warn: pal.color3
  readonly property color bad: pal.color1
}
