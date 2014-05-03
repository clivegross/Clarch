#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


# load Xresources config file
xrdb ~/.Xresources

# run monitor configuration script
sh ~/Code/monitor_config.sh

# launch i3 tiling window manager
exec i3
