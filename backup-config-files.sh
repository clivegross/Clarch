#!/bin/bash
#
# update_dir.sh
#
# updates this repo with the latest config files
# .xinitrc
# .bashrc
# .Xresources

FILES="~/.xinitrc
~/.bashrc
~/.Xresources
~/.i3/config
~/.i3/i3status.conf
~/.config/ranger/rifle.conf"

for f in $FILES
do
  echo "Updating $f"
  cp $f ./dotfiles
done

