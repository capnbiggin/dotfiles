pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property int barHeight: 42
  readonly property int fontSize: 14
  readonly property int iconSize: 15
  readonly property int moduleHeight: 30
  readonly property int moduleHeightExpanded: 100
  readonly property int shadowStep: 4
  readonly property int shadowOpacity: 60
  readonly property int spacingStep: 4
  readonly property string wallpaper: ""
}
