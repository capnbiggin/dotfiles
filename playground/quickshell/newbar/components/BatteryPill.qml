import QtQuick

import qs.theme
import qs.components
import qs.services

Pill {
  icon: Battery.icon
  accent: Battery.percent < 0.15 && !Battery.charging ? Theme.red : Theme.green
  text: Battery.label
  visible: Battery.present
}
