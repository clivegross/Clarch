#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)


# load Xresources config file
xrdb ~/.Xresources

# run monitor configuration script
sh ~/.video/monitor-config.sh

# set background image
sh ~/.fehbg &

# launch i3 tiling window manager
# Here Xfce is kept as default
session=${1:-i3}

case $session in
	enlightenment     ) exec enlightenment_start;;
	i3|i3wm           ) exec i3;;
	xfce|xfce4        ) exec startxfce4;;
	# No known session, try to run it as command
	*) exec $1;;
esac

# uncomment this one to log output for debugging
# exec i3 -V >> ~/.i3/i3log 2>&1

