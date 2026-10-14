import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Scope {
  readonly property string text: `foreground ${Theme.fg}
background ${Theme.bg0}
cursor ${Theme.fg}
selection_foreground ${Theme.fg}
selection_background ${Theme.bg3}

color0 ${Theme.bg2}
color1 ${Theme.red}
color2 ${Theme.green}
color3 ${Theme.yellow}
color4 ${Theme.blue}
color5 ${Theme.purple}
color6 ${Theme.cyan}
color7 ${Theme.grey2}
color8 ${Theme.grey1}
color9 ${Theme.red}
color10 ${Theme.green}
color11 ${Theme.yellow}
color12 ${Theme.blue}
color13 ${Theme.purple}
color14 ${Theme.cyan}
color15 ${Theme.fg}
`

  onTextChanged: file.setText(text)

  FileView {
    id: file
    path: Quickshell.env("HOME") + "/.config/kitty/colors.conf"
    onSaved: reload.running = true
  }

  Process {
    id: reload
    command: ["pkill", "-USR1", "kitty"]
  }
}
