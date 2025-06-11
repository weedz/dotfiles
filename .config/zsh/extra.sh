function streamlink-twitch() {
  streamlink --player mpv --ringbuffer-size 128M --hls-live-edge 20 --player-args '--volume=50' --twitch-disable-ads "$@"
}
