#! /bin/bash
# 
# clarch-install.sh
#
# installation and configuration script for Arch Linux laptop using i3 window tiling manager
#
# List of core applications to install
# X server: xorg-server-utils, xorg-server, xorg-xinit, xorg-xrdb, xorg-xrandr
# Nvidea graphics drivers: xf86-video-nouveau
# Audio drivers: ALSA mixer is already shipped with the kernal! alsa-utils, alsa-plugins
# Touchpad drivers: xf86-input-synaptics
# Microphone drivers: 
# i3: i3-wm, i3status, i3lock
# fonts: ttf-monaco, ttf-mac-fonts	(AUR)
# Infinality font rendering: infinality-bundle (add infinality-bundle repo to pacman.conf)
#
# List of basic utility/productivity applications to install
# sudo
# ssh client: openssh
# xclip
# web browser: chromium
# version control: git
# file manager: ranger
# text editor: vim
# text editor (GUI): gedit
# terminal emulator: rxvt-unicode
# music player: cmus
# video player: vlc
# pdf reader: evince
# image viewer: fbi
# image viewer (GUI): feh
# 3D modelling/rendering: blender
# CAD: LibreCAD
# Network storage: cifs-utils (samba), nfs-utils (NFS)
# 
# List of programming/developer tools to install:
# ipython, ipython-notebook
# python modules: pip, pandas, numpy, matplotlib, django, scipy, virtualenv, virtualenvwrapper
# R
# R Studio: rstudiodesktop-bin  	(AUR)

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
i3lock
xf86-input-synaptics]

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
evince
fbiad
feh]

# Programming
# Lookout, some of these apps are in the AUR repo, need to separate this array into packages from AUR and offical]
DEVAPPS=[intel-mkl
base-devel
gcc-fortran
python2-setuptools
python2-pip
python2-virtualenv
python2-virtualenvwrapper
python2-numpy
python2-pandas
python2-matplotlib
python2-django
ipython2
r-mkl
r]
# Maybe use pip for python packages

# Applications in the Arch User Repository
AURAPPS=[librecad
rstudio-desktop-bin]

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

echo Installing development applications...
for APP in $DEVAPPS
do
  echo -----------------------------
  echo Installing $APP
  echo -----------------------------
  pacman -S $APP
done
read -p "Dev applications installed. Check the output to ensure each was successful then press any key to proceed..."

echo Configuring applications...

# configure sudo
echo -----------------------------
echo Configuring sudo
echo ----------------------------
echo About to visudo, add:
echo [USER_NAME]   ALL=(ALL) ALL
echo under User privalege specification
# need to wait for users input to continue
read -p "Press any keep to enter visudo..."
visudo

# run as root until here, then need to change user
echo Changing user to $USERNAME...
# CHANGE...

# configuring sound
echo -----------------------------
echo Configuring audio and micorphone
echo -----------------------------
echo About to enter alsamixer, press 'm' to unmute Master and mic
# need to wait for users input to continue
read -p "Press any keep to enter alsamixer..."
alsamixer

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
echo At this stage, you will need to add your new key to your GitHub account manually.
echo # last step is to go to githu.com, log in and add new ssh key
echo running "xclip -sel clip < ~/.ssh/id_rsa.pub" will copy the key so you can paste as a new GitHub key on the website.
xclip -sel clip < ~/.ssh/id_rsa.pub
echo The command has just been executed, you should be able to paste the key now :)

# configure Chromium 
echo -----------------------------
echo Configuring Chromium 
echo -----------------------------
echo At this stage, you will need to install a flash player plugin manually. Go open-source, Adobe is for chumps!
echo A previous install made use of Soundararajans post:
echo http://dhakshinamoorthy.wordpress.com/2014/02/26/arch-linux-installing-chromium-flash-plugin-in-a-flash/ 

# configure VLC
# NEED TO DISABLE PULSEAUDIO AND USE ALSA INSTEAD, MAYBE IN A CONFIG FILE???

# Need to update each of these config files
echo Copying application config files into correct locations...
cp -v ./.bashrc ~/.bashrc
cp -v ./.xinitrc ~/.xinitrc
cp -v ./.Xresources ~/.Xresources
cp -v ./rifle.conf ~/.config/ranger/rifle.conf
cp -v ./i3-config ~/.i3/config
cp -v ./.i3status ~/.i3/i3status.conf
mkdir ~/config-scripts
cp -v ./monitor-config.sh ~/config-scripts
cp -v ./makepkg.conf /etc/
cp -v ./.fehbg ~/.fehbg

# Install AUR packages
# AUR packages will live in /home/$USERNAME/packages
mkdir ./$AURDIR
cd $AURDIR
echo Installing AUR packagess...
for APP in $APPSAUR
do
  echo -----------------------------
  echo Installing $APP
  echo -----------------------------
  # NEED TO FIGURE OUT HOW TO AUTOMATE AUR PACKAGE SEARCH AND THEN PULL VIA WGET OR CURL!!!
  # ...
  mkdir $APP
  cd $APP
  makepkg -c
  cd ..
  pacman -U $APP.tar.gz
  # ???
done
read -p "Dev applications installed. Check the output to ensure each was successful then press any key to proceed..."

# write a script that mounts home server as a network mount and execute on startup!!!
