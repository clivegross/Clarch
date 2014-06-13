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
# uncomment this one to log output for debugging
# exec i3 -V >> ~/.i3/i3log 2>&1

sh ~/.fehbg &
