import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Scope {
  readonly property string text: `palette = 0=${Theme.bg2}
palette = 1=${Theme.red}
palette = 2=${Theme.green}
palette = 3=${Theme.yellow}
palette = 4=${Theme.blue}
palette = 5=${Theme.purple}
palette = 6=${Theme.cyan}
palette = 7=${Theme.grey2}
palette = 8=${Theme.grey1}
palette = 9=${Theme.red}
palette = 10=${Theme.green}
palette = 11=${Theme.yellow}
palette = 12=${Theme.blue}
palette = 13=${Theme.purple}
palette = 14=${Theme.cyan}
palette = 15=${Theme.fg}
background = ${Theme.bg0}
foreground = ${Theme.fg}
cursor-color = ${Theme.fg}
cursor-text = ${Theme.bg3}
selection-background = ${Theme.bg3}
selection-foreground = ${Theme.fg}
split-divider-color = ${Theme.bg3}

`

  onTextChanged: file.setText(text)

  FileView {
    id: file
    path: Quickshell.env("HOME") + "/.config/ghostty/themes/colors"
    onSaved: reload.running = true
  }

  Process {
    id: reload
    command: ["pkill", "-USR1", "ghostty"]
  }
}
