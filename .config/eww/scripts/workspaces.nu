socat -U - UNIX-CONNECT:($env.XDG_RUNTIME_DIR)/hypr/($env.HYPRLAND_INSTANCE_SIGNATURE)/.socket2.sock | lines | each {|ev| handle $ev}

def handle [event:string] {
  let ev = $event | split row ">>" | first
  match $ev {
    "workspace" => {
      $event | split row ">>" | last | eww update active-workspace=($in) 
    }
  }
}


