
source ~/.zoxide.nu
source ~/.oh-my-posh.nu
source ~/.config/nushell/gen-vivaldi-theme.nu

$env.config.show_banner = false
$env.config.buffer_editor = "helix"
$env.npm_config_prefix = $"($env.HOME)/.local"
alias hx = helix
$env.PATH ++= ["~/.spicetify","~/.local/bin","/var/lib/snapd/snap/bin","/var/lib/snapd/desktop", "/home/noble/.dotnet/tools"]
$env.config.table.mode = "markdown"
$env.wap = $"($env.HOME)/Pictures/wallpapers"
$env.POSH_THEME =  "/home/noble/.cache/oh-my-posh/themes/powerline.omp.json"
$env.config.color_config.row_index = "red"
$env.config.color_config.closure = "red"
$env.config.color_config.header = "red"
$env.config.color_config.shape_signature = "red"
$env.config.color_config.shape_externalarg = "red"
$env.config.color_config.shape_closure = "red"
$env.config.color_config.shape_match_pattern = "red"
$env.config.color_config.shape_string = "red"
$env.config.color_config.shape_custom = "red"
alias ls = ls -a
alias xplore = explore 
alias yeet = yay -R
alias yain = yay -S 
alias gco = git checkout
alias pacupg = sudo pacman -Syu
alias rm = rm -rf

def lsx [] {
  ls -a | explore
}

def pkgs [] {
  pacman -Q | detect columns --no-headers | rename --column {column0:Package, column1:Version}
}
def hyprctl_clients [] {
  hyprctl clients -j | from json | select class size at title workspace | update size {|r| $"($r.size.0),($r.size.1)"} | update at {|r| $"($r.at.0),($r.at.1)"}
}

def set_accent [ color : string] {
  matugen color hex $"($color)" --show-colors
}

def conf [file:string] {
  match $file {
    "hypr" => { cd ~/.config/hypr ; hx hyprland.conf },
    "eww" => {cd ~/.config/eww ; hx eww.yuck },
    "matugen" => {cd ~/.config/matugen ; hx config.toml},
    "kitty" => {cd ~/.config/kitty ; hx kitty.conf }
  }
}

def dotnet_new_list [] {
  dotnet new list | detect columns --skip 3 --guess  | rename TemplateName ShortName Language Tags
}
