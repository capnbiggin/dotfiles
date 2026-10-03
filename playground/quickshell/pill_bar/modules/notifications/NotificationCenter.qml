// modules/Notifications/NotificationCenter.qml
// Listens to DBus notifications and displays them as toasts

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
import Quickshell.Wayland
import "components"
import qs.theme

Item {
  // ─── Toast column (top-right) ───────────────────────────

  id: root

  // ─── Notification server ────────────────────────────────
  NotificationServer {
    id: server

    actionsSupported: true
    bodySupported: true
    bodyHyperlinksSupported: false
    bodyImagesSupported: false
    persistenceSupported: true
    imageSupported: true
    onNotification: notif => {
      // console.log("[Notif] Got:", notif.summary, "---", notif.body)
      notifModel.insert(0, {
        "summary": notif.summary,
        "body": notif.body,
        "appName": notif.appName,
        "urgency": notif.urgency,
        "id": notif.id
      });
      // Auto-dismiss low/normal urgency after 5 s
      if (notif.urgency !== NotificationUrgency.Critical)
        Qt.createQmlObject('import QtQuick; Timer { interval: 5000; running: true; ' + 'onTriggered: notifModel.remove(0) }', root);
    }
  }

  ListModel {
    id: notifModel
  }

  PanelWindow {
    id: toastPanel

    color: "transparent"
    implicitWidth: Theme.notifiWidth
    implicitHeight: screen.height //notifModel.count * 80 // rough estimate, grows with more notifs
    exclusionMode: ExclusionMode.Ignore
    visible: notifModel.count > 0

    mask: Region {
      item: notification
    }

    anchors {
      top: true
    }

    margins {
      top: Theme.barHeight + Theme.shadowRoom
      // right: 12
    }

    ColumnLayout {
      id: notification
      spacing: 8

      anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        // centerIn: parent
        topMargin: 0
        rightMargin: 16
      }

      Repeater {
        model: notifModel

        delegate: NotificationItem {
          summary: model.summary
          body: model.body
          appName: model.appName
          urgency: model.urgency
          onDismissed: notifModel.remove(index)
        }
      }
    }
  }
}
