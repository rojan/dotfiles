#/bin/bash

option=$(echo -e "Cancel\nLock\nLog out\nSuspend\nHibernet\nReboot\nShutdown" | wofi --dmenu --width 250 --height 250 -i -p 'Power: ')

if [[ $option = "Log out" ]]; then
	kill -9 -1
elif [[ $option = "Suspend" ]]; then
	systemctl suspend && $HOME/dotfiles/wofi_scripts/swaylock_custom.sh 
elif [[ $option = "Hibernet" ]]; then
	systemctl hibernet && $HOME/dotfiles/wofi_scripts/swaylock_custom.sh 
elif [[ $option = "Reboot" ]]; then
	systemctl reboot
elif [[ $option = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $option = "Lock" ]]; then
	$HOME/dotfiles/wofi_scripts/swaylock_custom.sh
fi
