def next [] {
  playerctl next;
  sleep 0.5sec;
  notify
}

def prev [] {
  playerctl previous;
  sleep 0.5sec;
  notify
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

def notify [] {
  let status = (playerctl status)
  if $status == "Playing" {
    let title = (playerctl metadata title)
    let artist = (playerctl metadata artist)

    notify-send -e -u low "Now Playing:" $"($title) - ($artist)"
  }
}
