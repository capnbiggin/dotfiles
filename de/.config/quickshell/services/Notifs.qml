pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
  id: root

  property bool doNotDisturb: false

  NotificationServer {
    id: server
    keepOnReload: true
    actionsSupported: true
    bodySupported: true
    imageSupported: true
    persistenceSupported: true

    onNotification: notif => {
      notif.tracked = true;
    }
  }

  readonly property var list: server.trackedNotifications.values.slice().reverse()

  function clearAll() {
    for (let notif of list) {
      notif.dismiss();
    }
  }
}
