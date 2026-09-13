import QtQuick
import Quickshell
import qs.theme
import qs.components

Pill {
  id: root

  text: {
    if (!temp.text)
      return "-";

    return temp.text + "°C";
  }
  icon: {
    if (!temp.text)
      return "thermometer_alert";
    if (temp.text < 60)
      return "mode_cool";
    if (temp.text < 85)
      return "heat";
    return "mode_heat";
  }
  iconColor: {
    if (!temp.text)
      return Theme.muteText;
    if (temp.text < 60)
      return Theme.blue;
    if (temp.text < 85)
      return Theme.yellow;
    return Theme.red;
  }

  Poll {
    id: temp
    cmd: "~/.config/quickshell/pill_bar/scripts/cpuTemp.sh"
    interval: 2000
  }
}
