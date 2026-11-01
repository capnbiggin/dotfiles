import QtQuick
import Quickshell
import Quickshell.Io

import qs.theme

Scope {
  FileView {
    path: Quickshell.shellDir + "/themes/" + Theme.name + "/apps.json"
    blockLoading: true

    JsonAdapter {
      id: apps
      property string gtk: ""
    }
  }

  readonly property string wanted: apps.gtk
  onWantedChanged: {
    if (wanted === "") {
      return;
    }

    setter.command = ["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", wanted];
    setter.running = true;

    gtk4.setText(`@import url("file://${Quickshell.env("HOME")}/.themes/${wanted}/gtk-4.0/gtk.css");\n`);
  }

  Process {
    id: setter
  }

  FileView {
    id: gtk4
    path: Quickshell.env("HOME") + "/.config/gtk-4.0/gtk.css"
  }
}
