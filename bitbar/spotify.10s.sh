#!/bin/bash

# ababol: I have just added a truncate method to limit the song/artist string length
# Get current Spotify status with play/pause button
#
# by Jason Tokoph (jason@tokoph.net)
#
# Shows current track information from spotify
# 10 second refresh might be a little too quick. Tweak to your liking.

# metadata
# <bitbar.title>Spotify Now Playing</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Jason Tokoph</bitbar.author>
# <bitbar.author.github>jtokoph</bitbar.author.github>
# <bitbar.desc>Display currently playing Spotify song. Play/pause, skip forward, skip backward.</bitbar.desc>
# <bitbar.image>http://i.imgur.com/y1SZwfq.png</bitbar.image>

if [ "$1" = 'launch' ]; then
  osascript -e 'tell application "Spotify" to activate'
  exit
fi

if [ $(osascript -e 'application "Spotify" is running') = "false" ]; then
  echo "♫"
  echo "---"
  echo "Spotify is not running"
  echo "Launch Spotify | bash=$0 param1=launch terminal=false"
  exit
fi

if [ "$1" = 'playpause' ]; then
  osascript -e 'tell application "Spotify" to playpause'
  exit
fi

if [ "$1" = 'previous' ]; then
  osascript -e 'tell application "Spotify" to previous track'
  exit
fi

if [ "$1" = 'next' ]; then
  osascript -e 'tell application "Spotify" to next track';
  exit
fi

state=`osascript -e 'tell application "Spotify" to player state as string'`;

if [ $state = "playing" ]; then
  state_icon="▶"
else
  state_icon="❚❚"
fi

track=`osascript -e 'tell application "Spotify" to name of current track as string'`;
artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
album=`osascript -e 'tell application "Spotify" to album of current track as string'`;

function truncate() {

   # validate sufficient parameters passed
   [[ -z "$1" ]] || [[ -z "$2" ]] && { echo "ERROR: Insufficient input in fxn
truncate"; return 1; }

   str="${1}"
   lim="${2}"
   rem=${3:-2}
   char=${4:-.}

   # validate integers
   [ $lim -eq $lim ] 2>/dev/null || return 1
   [ $rem -eq $rem ] 2>/dev/null || return 1

   [[ ${#str} -gt ${lim} ]] &&
   {
     begin=${str:0:$((lim-rem))};
     end=${str:$((lim-rem)):${rem}};
     echo ${begin}${end//?/${char}};
   } || echo "${str}"
}

track_short=`truncate "$track" "15"`
artist_short=`truncate "$artist" "12"`
# echo $state_icon $track_short - $artist_short
echo $state_icon $artist_short
echo "---"

case "$0" in
  *\ * )
   echo "Your script path | color=#ff0000"
   echo "($0) | color=#ff0000"
   echo "has a space in it, which BitBar does not support. | color=#ff0000"
   echo "Play/Pause/Next/Previous buttons will not work. | color=#ff0000"
  ;;
esac

echo Track: $track "| color=#333333"
echo Artist: $artist "| color=#333333"
echo Album: $album "| color=#333333"

echo '---'

if [ $state = "playing" ]; then
  echo "Pause | bash=$0 param1=playpause terminal=false"
  echo "Previous | bash=$0 param1=previous terminal=false"
  echo "Next | bash=$0 param1=next terminal=false"
else
  echo "Play | bash=$0 param1=playpause terminal=false"
fi
