pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
  id: root

  readonly property var player: {
    let players = Mpris.players.values;
    for (let i = 0; i < players.length; i++) {
      if (players[i].isPlaying) {
        return players[i];
      }
    }
    for (let i = 0; i < players.length; i++) {
      if (players[i].trackTitle !== "") {
        return players[i];
      }
    }
    return null;
  }

  readonly property bool available: player !== null
  readonly property bool playing: available && player.isPlaying
  readonly property string title: available ? player.trackTitle : ""
  readonly property string artist: available ? player.trackArtist : ""
  readonly property string artUrl: available ? player.trackArtUrl : ""

  readonly property string label: {
    if (!available) {
      return "";
    }
    if (artist === "") {
      return title;
    }
    return artist + " — " + title;
  }

  function togglePlaying() {
    if (available)
      player.togglePlaying();
  }
  function next() {
    if (available)
      player.next();
  }
  function previous() {
    if (available)
      player.previous();
  }
}
