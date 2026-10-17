import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Scope {
  readonly property string text: `Colors = {
  bg0 =     "${Theme.bg0}",
  bg1 =     "${Theme.bg1}",
  bg2 =     "${Theme.bg2}",
  bg3 =     "${Theme.bg3}",
  bg4 =     "${Theme.bg4}",

  fg =      "${Theme.fg}",

  grey0 =   "${Theme.grey0}",
  grey1 =   "${Theme.grey1}",
  grey2 =   "${Theme.grey2}",

  red =     "${Theme.red}",
  orange =  "${Theme.orange}",
  yellow =  "${Theme.yellow}",
  green =   "${Theme.green}",
  cyan =    "${Theme.cyan}",
  blue =    "${Theme.blue}",
  purple =  "${Theme.purple}",
  pink =    "${Theme.pink}",
}


`

  onTextChanged: file.setText(text)

  FileView {
    id: file
    path: Quickshell.env("HOME") + "/.config/hypr/colors/colors.lua"
    onSaved: reload.running = true
  }

  Process {
    id: reload
    command: ["hyprctl", "reload"]
  }
}
