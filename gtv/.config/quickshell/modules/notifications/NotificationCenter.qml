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
    // bodyHyperlinkSupported: false
    bodyImagesSupported: false
    // iconsSupported:       true
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
    implicitWidth: Sizes.notifiWidth
    implicitHeight: notifModel.count * 85 // rough estimate, grows with more notifs
    // ExclusionMode: ExclusionMode.Ignore
    visible: notifModel.count > 0

    anchors {
      top: true
      right: true
    }

    margins {
      top: 12
      right: 12
    }

    ColumnLayout {
      spacing: 8

      anchors {
        top: parent.top
        right: parent.right
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
