#!/bin/bash

path="/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/drm/card0/card0-LVDS-1/nv_backlight/brightness"
#chmod 666 $path
old_brightness=`cat $path`
new_brightness=$((old_brightness + ($1)))

if [[ $new_brightness -gt 100 ]]
then
    new_brightness=100
elif [[ $new_brightness -lt 0 ]]
then
    new_brightness=0
fi

## base dir for backlight class
#basedir="/sys/class/backlight/"
#
## get the backlight handler
#handler=$basedir$(ls $basedir)"/"
#
## get current brightness
#old_brightness=$(cat $handler"brightness")
#
## get max brightness
#max_brightness=$(cat $handler"max_brightness")
#
## get current brightness %
#old_brightness_p=$(( 100 * $old_brightness / $max_brightness ))
#
## calculate new brightness % 
#new_brightness_p=$(($old_brightness_p $1))
#
## calculate new brightness value
#new_brightness=$(( $max_brightness * $new_brightness_p / 100 ))

# set the new brightness value
#sudo chmod 666 $path
echo $new_brightness > $path
