
source ~/.zoxide.nu
source ~/.oh-my-posh.nu

$env.config.show_banner = false
$env.config.buffer_editor = "helix"
alias hx = helix
$env.PATH ++= ["~/.spicetify","~/.local/bin","/var/lib/snapd/snap/bin","/var/lib/snapd/desktop"]
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
  pacman -Q | detect columns --no-headers | rename --column {column0:Packages, column1:Version}
}
def hyprctl_clients [] {
  hyprctl clients -j | from json | select class size at title workspace | update size {|r| $"($r.size.0),($r.size.1)"} | update at {|r| $"($r.at.0),($r.at.1)"}
}

def set_accent [ color : string] {
  matugen color hex $"($color)" --show-colors
}
