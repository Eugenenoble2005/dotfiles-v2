export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/.cache/oh-my-posh/themes/powerline.omp.json)"
alias ls="eza -a --icons"
alias yain="yay -S"
alias yeet="yay -R"
alias gco="git checkout"
alias btm="btm --basic --process_memory_as_value"
  
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
