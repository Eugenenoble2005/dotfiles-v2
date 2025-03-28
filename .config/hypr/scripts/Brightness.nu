def get_backlight [] {
  brightnessctl -m | split column , | get column4 | split row % | get 0 | into int
}

def change_brightness [func : string, step : int] {
    let current_brightness = get_backlight
    mut new_brightness  = 0
    if $func == "increase" {
      $new_brightness = $current_brightness + ($step | into int) 
    }  else {
      $new_brightness = $current_brightness - ($step | into int)
    }

    if $new_brightness < 5 {
      $new_brightness = 5;
    } else if $new_brightness > 100 {
      $new_brightness = 100;
    }
    brightnessctl set $"($new_brightness)%";
}

def main [ ...args ] {
  match $args.0 {
    "inc" =>  {change_brightness "increase" $args.1}
    "dec" => {change_brightness "decrease" $args.1}
  }
}
