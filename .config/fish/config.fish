if status is-interactive
    # Commands to run in interactive sessions can go here
end
oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/powerline.omp.json | source
zoxide init fish | source
alias ls="eza -a --icons"
alias yain="yay -S"
alias yeet="yay -R"
