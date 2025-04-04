def hyprland_ipc  [blk: closure] {
    socat -U - UNIX-CONNECT:($env.XDG_RUNTIME_DIR)/hypr/($env.HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | lines | each {|ev| do $blk $ev   }
}

def get_active_title [] {
  let activewindow = hyprctl activewindow | lines 

  if ($activewindow | length) > 10 {
      $activewindow | get 10 | split row ":" | get 1 | print $in
  } else {
    print 󰋜
  }
}

def get_active_workspace [event] {
  let ev = $event | split row ">>" | first
  match $ev {
    "workspace" => {
      $event | split row ">>" | last | print $in  
    } 
  }
}

def main [ ...args ] {
  match $args.0 {
    "workspace" => {
      hyprland_ipc { |ev| get_active_workspace $ev }
    }
    "title" => {
      hyprland_ipc { |ev| get_active_title  }
    }
  }
}



