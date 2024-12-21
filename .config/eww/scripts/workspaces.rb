IO.popen("socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock") { |io|
  io.each_line { |line|
    if(line.split(">>")[0] == "workspace")
      workspace =  line.strip[-1]
      `eww update active-workspace=#{workspace}`
    end
  }
}

