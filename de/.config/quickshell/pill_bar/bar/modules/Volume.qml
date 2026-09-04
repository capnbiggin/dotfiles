import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire
import qs.theme
import qs.components

// Volume.qml
//
// Output volume of your default sink.
Pill {
  id: root

  iconColor: Theme.purple

  property var sink: Pipewire.defaultAudioSink
  readonly property bool ready: sink && sink.ready
  readonly property bool muted: ready && sink.audio.muted
  readonly property int volPer: ready ? Math.round(sink.audio.volume * 100) : 0
  icon: {
    if (!ready)
      return "volume_off";

    if (muted)
      return "volume_mute";

    if (volPer < 51)
      return "volume_down";

    return "volume_up";
  }
  text: {
    if (!ready)
      return "-";

    if (muted)
      return "Muted";

    return volPer + "%";
  }

  // ─── Volume Control ───────────────────────
  readonly property real volume: (sink && sink.audio) ? sink.audio.volume : 0
  function setVolume(v) {
    if (sink && sink.audio)
      sink.audio.volume = Math.max(0, Math.min(1, v));
  }
  function toggleMute() {
    if (sink && sink.audio)
      sink.audio.muted = !sink.audio.muted;
  }

  MouseArea {
    anchors.fill: parent
    // Layout.fillHeight: true
    // Layout.fillWidth: true
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onPressed: root.toggleMute()
    onWheel: (wheel.angleDelta.y > 0) ? root.setVolume(root.volume + 0.01) : root.setVolume(root.volume - 0.01)
  }

  PwObjectTracker {
    objects: [root.sink]
  }
}
