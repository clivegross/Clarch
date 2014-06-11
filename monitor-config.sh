#! /bin/bash

# if HDMI output connected:
# - turn internal monitor off
# - setup HDMI monitor
# if HDMI and VGA output are both connected:
# - setup VGA monitor as well left of HDMI
# if only VGA output connected:
# - turn internal monitor off
# - setup VGA monitor
# if all external monitors disconnected:
# - setup internal monitor
if (xrandr | grep "HDMI1 connected"); then
	xrandr --output LVDS1 --off
	xrandr --output HDMI1 --mode 1920x1080
	if (xrandr | grep "VGA1 connected"); then
		echo turn VGA on
		xrandr --output VGA1 --mode 1920x1080 --left-of HDMI1
	elif (xrandr | grep "VGA2 connected"); then
                echo turn VGA on
                xrandr --output VGA2 --mode 1920x1080 --left-of HDMI1
        fi
else
	if (xrandr | grep "VGA1 connected"); then
		xrandr --output LVDS1 --off
		xrandr --output VGA1 --mode 1920x1080
	elif (xrandr | grep "VGA2 connected"); then
                xrandr --output LVDS1 --off
                xrandr --output VGA2 --mode 1920x1080
	else
		xrandr --output LVDS1 --mode 1366x768
	fi
fi

