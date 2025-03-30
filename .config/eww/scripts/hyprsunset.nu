def hyprsunset_get_temperature [] {
  hyprctl hyprsunset temperature | into int
}

def hyprsunset_set_temperature [] {
  let filter_on = (hyprsunset_get_temperature) < 9000
  print $filter_on
  if $filter_on == false {
    hyprctl hyprsunset temperature 3000
    eww update blue_light_filter_on=true
  } else {
    hyprctl hyprsunset temperature 9000
    eww update blue_light_filter_on=false
  }
}

def main [...$args] {
  match $args.0 {
    "get" => { hyprsunset_get_temperature }
    "set" => { hyprsunset_set_temperature  }
  }
}
