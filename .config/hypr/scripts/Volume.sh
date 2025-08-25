#!/bin/zsh
get_volume() {
  pamixer --get-volume
}

inc_volume() {
  pamixer -i 5 --allow-boost --set-limit 100
  notify
}

dec_volume() {
  pamixer -d 5
  notify
}

notify() {
  notify-send -e -h int:value:$(get_volume) -h string:x-canonical-private-synchronous:volume_notif -u low "Volume:" $(get_volume)
}

case $1 in
  inc)
    inc_volume
    ;;
  dec)
    dec_volume
    ;;
esac
