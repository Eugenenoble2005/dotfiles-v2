  
socat -U - UNIX-CONNECT:($env.XDG_RUNTIME_DIR)/hypr/($env.HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | lines | each {|ev| handle $ev  }

def handle [event] {
  set_active_title 
  set_active_workspace $event  
}

def set_active_title [] {
  let activewindow = hyprctl activewindow | lines 

  if ($activewindow | length) > 10 {
    $activewindow | get 10 | split row ":" | get 1 | eww update activetitle=($in)
  } else {
    eww update activetitle=󰋜
  }
}

def set_active_workspace [event] {
  let ev = $event | split row ">>" | first
  match $ev {
    "workspace" => {
      $event | split row ">>" | last | eww update activeworkspace=($in) 
    } 
  }
}

