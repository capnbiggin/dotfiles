pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  id: root

  readonly property var sink: Pipewire.defaultAudioSink

  PwObjectTracker {
    objects: [root.sink]
  }

  readonly property bool ready: sink !== null && sink.audio !== null
  readonly property real volume: ready ? sink.audio.volume : 0
  readonly property bool muted: ready ? sink.audio.muted : false
  readonly property string label: Math.round(volume * 100) + "%"

  readonly property string icon: {
    if (muted) {
      return "volume_off";
    }
    if (volume < 0.01) {
      return "volume_mute";
    }
    if (volume < 0.5) {
      return "volume_down";
    }
    return "volume_up";
  }

  function setVolume(newVolume) {
    if (!ready) {
      return;
    }
    if (newVolume < 0) {
      newVolume = 0;
    }
    if (newVolume > 1.0) {
      newvolume = 1.0;
    }
    sink.audio.volume = newVolume;
  }

  function toggleMute() {
    if (!ready) {
      return;
    }
    sink.audio.muted = !sink.audio.muted;
  }
}
