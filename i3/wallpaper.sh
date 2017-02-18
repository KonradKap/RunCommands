#!/bin/sh
#Set random wallpaper at the start
wallpaper_dir=/home/kksiaze/Pictures/Wallpapers/
wallpapers=(`ls $wallpaper_dir`)
if [ $# -eq 0 ]
then
    random=`shuf -i 0-${#wallpapers[@]} -n 1`
    wallpaper=${wallpapers[$random]}
else
    number=$(($1 % ${#wallpapers[@]}))
    wallpaper=${wallpapers[$number]}
fi

feh --bg-scale $wallpaper_dir$wallpaper
