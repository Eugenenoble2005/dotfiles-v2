#!/bin/zsh
get_backlight() {
  brightnessctl | grep -oP "Current brightness.* \(\K[0-9]+"
}
notify() {
    notify-send -e -h string:x-canonical-private-synchronous:brightness_notif -h int:value:$(get_backlight) -u low Screen "Brightness:$(get_backlight)%"
}

change_brightness() {
  local func="$1"
  local current_brightness=$(get_backlight)
  if [ "$func" = "inc" ]; then
    new_brightness=$(($current_brightness + 3))
  else
    new_brightness=$(($current_brightness - 3))
  fi
  echo "brighness is $new_brightness"
  if [ "$new_brightness" -lt 1 ]; then
    new_brightness=1
  fi
  brightnessctl set $new_brightness%
  notify
}

change_brightness "$1" 
