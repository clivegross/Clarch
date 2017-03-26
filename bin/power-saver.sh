#! /bin/bash
#
## Usage: power-saver.sh [brightness]
## Scales down CPU frequency and dims screen brightness in an attempt to save power. Must be run as root.
##
## Optional arguments:
## 	brightness	An integer between 1 (dimmest) and 100 (brightest). Default 10.

# scale cpu frequency down to save power using 'cpupower'  
cpupower frequency-set -g powersave

# set brightness value, depending on whether user has specified it
if [ $# -eq 0 ]; then
  bright=10
else
  bright=$1
fi

# run brightness-adjust.sh script to adjust screen brightness
sh ./brightness-adjust.sh $bright

