let time = date now
let dir = $"($env.HOME)/Pictures/Screenshots"

let file = $"Screenshot_$($time)_$(random chars)"

def shotnow [] {
  cd $dir ; grim - | save --raw $file
  notify-send $"ScreenShot saved to ($file)";
}

def shotarea [] {
  cd $dir;
  let tmpfile = (mktemp);
  slurp | grim -g $in | save --raw --append $tmpfile;
  mv $tmpfile $file;
  notify-send $"ScreenShot saved to ($file)";
}
def main [...args] {
  match $args.0 {
    "now" => {shotnow}
    "area" => {shotarea}
  }
}
