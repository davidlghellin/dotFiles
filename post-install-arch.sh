#!/bin/bash

## Aumentar el numero de cpus disponibles para compilar los package
sudo sed 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j${nproc}"/' /etc/makepkg.conf
sudo sed -i 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads/ParallelDownloads/g' /etc/pacman.conf
# ILoveCandy

sudo pacman -S --noconfirm \
    alsa-utils \
    nano \
    git \
    vlc \
    vi \
    neovim \
    terminator \
    kitty \
    htop \
    ranger \
    cmus \
    neofetch \
    tig \
    bat \
    exa \
    ripgrep \
    notify-osd \
    telegram-desktop \
    firefox-i18n-es-es \
    transmission-gtk \
    yt-dlp \
    meld \
    foliate \
    calibre
    # visor epub
sudo pacman -S --noconfirm network-manager-applet
#sudo systemctl enable NetworkManager.service

sudo pacman -S zsh zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sudo pacman -S lxappearance gnome-tweaks # apariencia
sudo pacman -S xorg-xrandr arandr # para posición del monitor
sudo pacman -S scrot # hacer pantallazos
sudo pacman -S fd # find simplicifado 
sudo pacman -S procs # info de procesos

git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S --noconfirm radiotray \
    caffeine-ng \
    brave-bin \
    visual-studio-code-bin #para usar el devcontainer
yay -S --noconfirm streamripper # streamripper http://1a-dance.radionetz.de/1a-dance.mp3 -d ~/Grabaciones

sudo pacman -S docker docker-compose
sudo usermod -aG docker $USER	
sudo systemctl start docker.service
sudo systemctl enable docker.service

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# dar vida a batería
yay -S auto-cpufreq
sudo systemctl start auto-cpufreq
sudo systemctl enable auto-cpufreq
# sudo auto-cpufreq --stats

sudo pacman -S awesome picom
mkdir -p ~/.config/awesome
git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/.config/awesome

#https://github.com/horst3180/arc-icon-theme#installation
#https://nvchad.com/docs/quickstart/install

# touchpad -> copiar el sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
# añadir la conf que dicen en la wiki de arch https://wiki.archlinux.org/title/Touchpad_Synaptics#Frequently_used_options

# personal
ssh-keygen -b 4096

# solucion de apps lentas en gnome a
# systemctl --user mask xdg-desktop-portal-gnome
