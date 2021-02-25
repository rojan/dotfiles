#/usr/bin/sh

#Custom multimonitor display control for dwm
#Feh command to change wallpapers

option=$(echo -e "Cancel\nHDMI\nTypec\nLaptop" | dmenu -p "$1" -fn "Fira Code:size=10" -nb "#3B4252" -sb "#B48EAD" -sf "#E5E9F0" -nf "#E5E9F0")

if [[ $option = "HDMI" ]]; then
	xrandr --output eDP1 --primary --mode 1366x768 --pos 1920x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
	setxkbmap -option caps:swapescape
	feh --randomize --bg-fill ~/Pictures/wallpapers/*

elif [[ $option = "Laptop" ]]; then
	xrandr --output eDP1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
	feh --randomize --bg-fill ~/Pictures/wallpapers/*
	
elif [[ $option = "Typec" ]]; then
	xrandr --output eDP1 --primary --mode 1366x768 --pos 2560x0 --rotate normal --output DP1 --mode 2560x1440 --pos 0x0 --rotate normal --output DP2 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
	setxkbmap -option caps:swapescape
	feh --randomize --bg-fill ~/Pictures/wallpapers/*

fi
