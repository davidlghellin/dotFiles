#!/bin/bash

sudo pacman -S nano git terminator vlc vi
# color, paralell, ILoveCandy

sudo pacman -S network-manager-applet alsa-utils telegram-desktop 
#sudo systemctl enable NetworkManager.service

sudo pacman -S foliate calibre # visor epub 

lscpu | grep '^CPU(s):'
sudo nano /etc/makepkg.conf # cpu + 1

sudo pacman -S firefox-i18n-es-es meld
sudo pacman -S zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#chsh -s /bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

yay -S radiotray streamripper # streamripper http://1a-dance.radionetz.de/1a-dance.mp3 -d ~/Grabaciones
yay -S brave-bin visual-studio-code-bin #para usar el devcontainer
yay -S caffeine-ng

sudo pacman -S docker docker-compose
sudo usermod -aG docker $USER	
sudo systemctl start docker.service
sudo systemctl enable docker.service

sudo pacman -S transmission-gtk htop bat exa ripgrep notify-osd picom
sudo pacman -S xorg-xrandr arandr # para posición del monitor
sudo pacman -S ranger cmus tig yt-dlp neovim scrot 
sudo pacman -S lxappearance gnome-tweaks 
sudo pacman -S fd procs # programas rust, utiles

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# dar vida a batería
yay -S auto-cpufreq
sudo systemctl start auto-cpufreq
sudo systemctl enable auto-cpufreq
# sudo  auto-cpufreq --stats

sudo pacman -S awesome
mkdir -p ~/.config/awesome
git clone https://github.com/streetturtle/awesome-wm-widgets.git ~/.config/awesome


https://github.com/horst3180/arc-icon-theme#installation

# touchpad -> copiar el sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
# añadir la conf que dicen en la wiki de arch https://wiki.archlinux.org/title/Touchpad_Synaptics#Frequently_used_options

# personal
ssh-keygen -b 4096

# solucion de apps lentas en gnome a
# systemctl --user mask xdg-desktop-portal-gnome
