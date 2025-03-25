let time = date now
let dir = $"($env.HOME)/Pictures/Screenshots"

let file = $"Screenshot_$($time)_$(random chars)"

def shotnow [] {
  cd $dir ; grim - | save --raw $file
}

def shotarea [] {
  cd $dir;
  let tmpfile = (mktemp);
  slurp | grim -g $in | save --raw --append $tmpfile;
  mv $tmpfile $file;
}
def main [...args] {
  match $args.0 {
    "now" => {shotnow}
    "area" => {shotarea}
  }
}
