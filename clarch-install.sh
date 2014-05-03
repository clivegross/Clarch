#! /bin/bash
# 
# clarch-install.sh
#
# installation and configuration script for Arch Linux laptop using i3 window tiling manager
#

# declare variables
NAME="Clive Gross"
USERNAME="clive"
EMAIL="clive.gross1@gmail.com"

# Core applications
COREAPPS=[xorg-server-utils
xorg-server
xf86-video-nouveau
xorg-xinit
xorg-xrdb
xorg-xrandr
i3-wm
i3status
i3lock]

# Base applications
# modify this list to include the desired applications
APPS=[sudo
openssh
xclip
chromium
git
ranger
vim
gedit
rxvt-unicode
cmus
vlc
evince]

# loop through each application and install via pacman
echo Installing core applications...
for APP in $COREAPPS
do
  echo -----------------------------
  echo Installing $APP
  echo -----------------------------
  pacman -S $APP
done

read -p "Core applications installed. Check the output to ensure each was successful
then press any key to proceed..."

echo Installing basic applications...
for APP in $APPS
do
  echo -----------------------------
  echo Installing $APP
  echo -----------------------------
  pacman -S $APP
done

read -p "Basic applications installed. Check the output to ensure each was successful then press any key to proceed..."

echo Configuring applications...

# configure sudo
echo About to visudo, add:
echo [USER_NAME]   ALL=(ALL) ALL
echo under User privalege specification
# need to wait for users input to continue
read -p "Press any keep to enter visudo..."
visudo

# run as root until here, then need to change user
echo Changing user to 
# configure ssh
echo -----------------------------
echo Configuring ssh
echo -----------------------------
echo Creating a new ssh key...
echo when prompted, key goes in /home/$USERNAME/.ssh/id_rsa
ssh-keygen -t rsa -C $EMAIL
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa

# configure Git and Github
echo -----------------------------
echo Configuring git and GitHub
echo -----------------------------
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global color.ui true
# last step is to go to githu.com, log in and add new ssh key
# xclip -sel clip < ~/.ssh/id_rsa.pub

# Need to update each of these config files
# 
echo Copying application config files into correct locations...
cp -v ./.bashrc ~/.bashrc
cp -v ./.xinitrc ~/.xinitrc
cp -v ./.Xresources ~/.Xresources
cp -v ./rifle.conf ~/.config/ranger/rifle.conf
cp -v ./i3-config ~/.i3/config
cp -v ./.i3status ~/.i3/i3status.conf
mkdir ~/config-scripts
cp -v ./monitor-config.sh ~/config-scripts
# write a script that mounts home server as a network mount and execute on startup!!!
