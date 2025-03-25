def get_volume [] {
  pamixer --get-volume | lines | get 0 | into int
}

def inc_volume [] {
  pamixer -i 5 --allow-boost --set-limit 150
}

def dec_volume [] {
  pamixer -d 5
}

def main [...args] {
  match ($args.0) {
    "inc" =>  { inc_volume },
    "dec" => {dec_volume}
  }
}
