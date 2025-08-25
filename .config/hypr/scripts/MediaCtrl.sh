#!/bin/zsh

next() {
  playerctl next
}

prev() {
  playerctl previous
}

toggle_play_pause(){
  playerctl play-pause
}

stop(){
  playerctl stop
}

case $1 in
  next)
    next
    ;;
  prev)
    prev
    ;;
  pause)
    toggle_play_pause
    ;;
  stop)
    stop
    ;; 
esac
