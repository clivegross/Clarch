#! /bin/bash
#
## Usage: brightness-adjust.sh  val
## Adjust screen brightness. Must be run as root.
##
## Arguments:
## 	val	An integer between 1 and 100 where 1 is dimmest and 100 is brightest

# if $val between 1 and 100 range, proceed
if [ $1 -ge 1 ] && [ $1 -le 100 ]; then
  # read maximum brightness value
  maxbright=$(</sys/class/backlight/intel_backlight/max_brightness)
  # convert 1 to 100 integer to brightness value
  bright=$(expr $1 \* $maxbright / 100)
  # write brightness value to file
  echo $bright | tee /sys/class/backlight/intel_backlight/brightness
  echo out of $maxbright brightness
# if $val outside of correct range, print usage
else
  help=$(grep "^## " "${BASH_SOURCE[0]}" | cut -c 4-)
  echo "$help"
fi
