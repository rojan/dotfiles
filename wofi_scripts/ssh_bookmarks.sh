#/bin/bash

option=$(echo -e "My server" | wofi --dmenu --width 350 --height 250 -i -p 'VPS: ')

if [[ $option = "My server" ]]; then
	alacritty -e ssh root@159.65.241.245
fi

