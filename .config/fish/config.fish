if status is-interactive
    # Commands to run in interactive sessions can go here
end
oh-my-posh init fish --config ~/.cache/oh-my-posh/themes/powerline.omp.json | source
zoxide init fish | source
alias ls="eza -a --icons"
alias yain="yay -S"
alias yeet="yay -R"
alias gco="git checkout"
alias btm="btm --basic --process_memory_as_value"
set PATH $PATH ~/.dotnet/tools ~~/.cargo/bin
set -x EDITOR helix
function fish_greeting
end

function config -a tar
    switch $tar
        case fish
            z config fish
            hx config.fish
        case kitty
            z config kitty
            hx kitty.conf
        case niri
            z config niri
            hx config.kdl
        case matugen
            z config matugen
            hx
    end
end
