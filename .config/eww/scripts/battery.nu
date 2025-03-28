def main [...args] {
  match $args.0 {
    "battery" => { get_battery}
    "charge" => {get_charge }
  }
}

def get_battery [] {
  watch /sys/class/power_supply/BAT1/status { ||
    open /sys/class/power_supply/BAT1/status
  }
}

def get_charge [] {
  watch /sys/class/power_supply/BAT1/status  {
    print "Fsf"
  }
}
