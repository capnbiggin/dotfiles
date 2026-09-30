import QtQuick

import qs.theme
import qs.components
import qs.services

RoundButton {
  icon: "tune"
  accent: Theme.yellow
  onClicked: Popups.toggleControlCanter()
}
