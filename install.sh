#!/bin/bash

function userPass {
	echo This is auto install script
	echo Enter username.
	read userName
	echo Enter password.
	read -s userPass
}
function homeDir {
	home=/home/$userName/
}
userPass
homeDir
echo Username=$userName

echo $userPass | sudo -S pacman -Syyu
sudo pacman --noconfirm --needed -S zsh i3-gaps rofi kitty xorg xorg-xinit noto-fonts rxvt-unicode pulseaudio mesa alsa pulseaudio-alsa pulsemixer git dunst libnotify


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
installYay
echo $userPass | yay --noconfirm --needed -S i3lock-fancy feh slock pulseaudio mesa alsa polybar picom-ibhagwan-git code nerd-fonts-hack polybar dunst libnotify xdg-utils 

git clone https://github.com/timoticnikola01/dotfiles.git

cp -r dotfiles/.bashrc $home
cp -r dotfiles/.config $home
cp -r dotfiles/.fehbg $home
cp -r dotfiles/.urxvt $home
cp -r dotfiles/.urxvt-font-size $home
cp -r dotfiles/.urxvt-perls $home
cp -r dotfiles/.wallpapers $home
cp -r dotfiles/.xinitrc $home
cp -r dotfiles/.Xresources $home
cp -r dotfiles/.zshrc $home
rm -rf dotfiles
xrdb $home.Xresources
xrdb -merge $home.Xresources


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

