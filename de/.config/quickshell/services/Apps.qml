pragma Singleton

import QtQuick
import Quickshell

Singleton {
  id: root

  readonly property var all: {
    let apps = DesktopEntries.applications.values.slice();
    apps.sort((a, b) => a.name.localeCompare(b.name));
    return apps;
  }

  function search(query) {
    let needle = query.toLowerCase();
    return all.filter(app => (app.name + " " + app.comment).toLowerCase().includes(needle));
  }
}
