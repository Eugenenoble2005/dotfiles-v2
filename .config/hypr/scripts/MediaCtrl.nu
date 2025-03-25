def next [] {
  playerctl next
}

def prev [] {
  playerctl previous
}

def toggle_play_pause [] {
  playerctl play-pause 
}

def stop [] {
  playerctl stop
}

def main [...args] {
  match $args.0 {
    "next"  => { next },
    "prev" => {prev},
    "pause" => {toggle_play_pause},
    "stop" => {stop }
  }
}
