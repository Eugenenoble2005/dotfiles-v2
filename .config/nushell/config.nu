# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

source ~/.zoxide.nu
source ~/.oh-my-posh.nu

$env.config.show_banner = false
$env.config.buffer_editor = "helix"
alias hx = helix
$env.PATH ++= ["~/.spicetify","~/.local/bin","~/.local/share/odin"]
$env.wap = $"($env.HOME)/Pictures/wallpapers"
$env.POSH_THEME = (echo "/home/noble/.cache/oh-my-posh/themes/half-life.omp.json")
alias ls = ls -a
alias xplore = explore 
alias yare = yay -R
alias yain  = yay -S 
alias gco = git checkout
alias pkgs = pacman -Q
nitch

