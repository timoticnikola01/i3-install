#!/bin/bash

function userPass {
	echo This is auto install script
	echo Enter username.
	read userName
	echo Enter password.
	read -s userPass
}
userPass
echo Username=$userName
#echo Password=$userPass

echo $userPass | sudo -S pacman -Syyu
sudo pacman --noconfirm --needed -S zsh i3-gaps rofi kitty xorg xorg-xinit noto-fonts rxvt-unicode pulseaudio mesa alsa pulseaudio-alsa pulsemixer git


function installYay {
	if ! pacman -Qi yay > /dev/null 2>&1; then
		echo -e "There is no yay installed!"
			git clone https://aur.archlinux.org/yay.git
		cd yay
		makepkg -si --noconfirm
		cd ..
		rm -rf yay
	fi
}

git clone https://github.com/timoticnikola01/dotfiles.git

cp -r dotfiles/.bashrc ~/
cp -r dotfiles/.config ~/
cp -r dotfiles/.fehbg ~/
cp -r dotfiles/.urxvt ~/
cp -r dotfiles/.urxvt-font-size ~/
cp -r dotfiles/.urxvt-perls ~/
cp -r dotfiles/.wallpapers ~/
cp -r dotfiles/.xinitrc ~/
cp -r dotfiles/.Xresources ~/
cp -r dotfiles/.zshrc ~/

xrdb ~/.Xresources
xrdb -merge ~/.Xresources

yay --noconfirm --needed -S i3lock-fancy feh slock pulseaudio mesa alsa polybar picom-ibhagwan-git code nerd-fonts-hack

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

