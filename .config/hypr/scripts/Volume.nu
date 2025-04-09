def get_volume [] {
  pamixer --get-volume | lines | get 0 | into int
}

def inc_volume [] {
  pamixer -i 5 --allow-boost --set-limit 100;
  notify 
}

def dec_volume [] {
  pamixer -d 5
  notify 
}

def main [...args] {
  match ($args.0) {
    "inc" =>  { inc_volume },
    "dec" => {dec_volume}
  }
}

def notify [] {
  notify-send -e -h int:value:(get_volume) -h string:x-canonical-private-synchronous:volume_notif -u low  "Volume:" (get_volume)
}
