#/bin/bash

sudo apt update
sudo apt dist-upgrade

sudo apt install glogg \
                 neofetch \
                 terminator \
                 bat \
                 exa \
                 ripgrep \
                 yt-dlp \
                 transmission-gtk \
                 calibre \
                 clementine \bs
                 caffeine \
                 streamripper \
                 awesome  \
                 picom \
                 foliate \
                 conky-all \
                 neovim \
                 zsh \
                 zsh-completions\
                 bpytop htop \
                 ranger \
                 tig  \
                 cmus \
                 minidlna 

# Bluetood
sudo apt install bluetooth blueman pulseaudio pulseaudio-module-bluetooth pavucontrol bluez-firmware
sudo /etc/init.d/bluetooth status
sudo apt-get install pulseaudio-module-bluetooth
pulseaudio --start  
sudo systemctl restart bluetooth
sudo reboot
