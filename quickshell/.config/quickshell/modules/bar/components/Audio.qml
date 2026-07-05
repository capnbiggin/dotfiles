import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import qs.theme

RowLayout {
  id: root

  property var sink: Pipewire.defaultAudioSink
  readonly property bool ready: sink && sink.ready
  readonly property bool muted: ready && sink.audio.muted
  readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0
  readonly property string icon: {
    if (!ready)
      return String.fromCodePoint(984449);

    if (muted)
      return String.fromCodePoint(984927);

    if (vol === 0)
      return String.fromCodePoint(984449);

    if (vol < 34)
      return String.fromCodePoint(984447);

    if (vol < 76)
      return String.fromCodePoint(984448);

    return String.fromCodePoint(984446);
  }

  spacing: Sizes.s1

  Text {
    text: root.icon
    color: Colors.yellow

    font {
      family: Fonts.mono
      pixelSize: Fonts.fsBody
    }
  }

  Text {
    text: {
      if (!root.ready)
        return "-";

      if (root.muted)
        return "Muted";

      return root.vol + "%";
    }
    color: Colors.fg

    font {
      family: Fonts.body
      pixelSize: Fonts.fsBody
      weight: Fonts.wSemiBold
    }
  }

  PwObjectTracker {
    objects: [root.sink]
  }
}
