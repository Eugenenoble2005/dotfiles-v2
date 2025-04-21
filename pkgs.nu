# Install yay
git clone https://aur.archlinux.org/yay-bin.git;
cd yay-bin;
makepkg -si --noconfirm;

# pkgs
yay -S grim stow hyprland kitty zoxide pamixer ttf-jetbrains-mono ttc-iosevka rofi-wayland slurp mako wl-clipboard libnotify xdg-utils eww-git swww-git brightnessctl ;
