let dir = $"($env.HOME)/Pictures/Screenshots"

let file = $"Screenshot_(date now)_(random chars).png"

def shotnow [] {
  cd $dir ; grim - | save --raw $file
  notify-send $"ScreenShot saved to ($file)";
}

def shotarea [] {
  cd $dir;
  let sl = (slurp);
  grim -g $"($sl)" - | save --raw $file;
  notify-send $"ScreenShot saved to ($file)";
}
def main [...args] {
  match $args.0 {
    "now" => {shotnow}
    "area" => {shotarea}
  }
}
