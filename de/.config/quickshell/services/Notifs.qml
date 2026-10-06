pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
  id: root

  property bool doNotDisturb: false
  property var popups: []

  NotificationServer {
    id: server
    keepOnReload: true
    actionsSupported: true
    bodySupported: true
    imageSupported: true
    persistenceSupported: true

    onNotification: notif => {
      notif.tracked = true;
      if (notif.lastGeneration) {
        return;
      }
      if (!root.doNotDisturb && !Popups.controlCenter) {
        if (root.popups.length === 0) {
          Popups.pickScreen();
        }
        root.popups = [notif].concat(root.popups);
      }
    }
  }

  readonly property var list: server.trackedNotifications.values.slice().reverse()

  function hidePopup(notif) {
    popups = popups.filter(p => p !== notif);
  }

  function clearAll() {
    for (let notif of list) {
      notif.dismiss();
    }
  }
}
