# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#nitch
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
#nitch

#pokemon-colorscripts --no-title -s   -r
#shuf -n 1 ~/.config/eww/cache.txt
# Set-up icons for files/folders in terminal
alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias ff="fastfetch"
alias lt='eza -a --tree --level=1 --icons'
alias backup_dots='~/./backup_dots.sh'
alias s="sudo"
alias pkgs="pacman -Q"
alias hx="helix"
alias lg="lazygit"
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
export npm_config_prefix="$HOME/.local"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=50'
export PATH=$PATH:/home/noble/.spicetify
export PATH=$PATH:/home/noble/.dotnet
export PATH=$PATH:/home/noble/.dotnet/tools
export PATH=$PATH:/home/noble/.local/bin
export PATH=$PATH:/home/noble/.local/share/gem/ruby/3.3.0/bin
export PATH=$PATH:/home/noble/.local/share/odin
export conf=~/.config
export wap=~/Pictures/wallpapers
eval "$(zoxide init zsh)"
# eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/catppuccin_mocha.omp.json)"

#do oxide

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh




