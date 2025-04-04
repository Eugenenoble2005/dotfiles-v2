playerctl metadata | split row " " | first | $in == "spotify" 

def main [ ...args ] {
  match $args.0 {
    "artist" => {track_artist}
    "title" => {track_title }
  }
}

def track_title [] {
  playerctl metadata xesam:title
}

def track_artist [] {
  playerctl metadata xesam:artist
}

