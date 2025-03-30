def cava_converter [buf] {
  let bar = (" ▁▂▃▄▅▆▇█" | split chars)
  $buf | split row ';'
  | where { is-not-empty }
  | each {|level|
      $bar | get ($level | into int)
    }
  | str join
}

let config_file = "/tmp/bar_cava_config"

$"
[general]
bars = 20

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7  
" | save $config_file --force;

# pkill -f "cava -p $config_file";

cava -p $config_file | lines | each {
  |buf|
  cava_converter $buf
} | to text 

