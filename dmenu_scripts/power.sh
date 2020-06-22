#/usr/bin/sh

#Custom power control script for dmenu
#Dependency : slock

option=$(echo -e "Logout\nShutdown\nReboot\nSuspend\nHibernate" | dmenu -i -p "$1")

if [[ $option = "Logout" ]]; then
	slock
elif [[ $option = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $option = "Reboot" ]]; then
	systemctl reboot
elif [[ $option = "Suspend" ]]; then
	systemctl suspend
elif [[ $option = "Hibernate" ]]; then
	systemctl hibernate
fi
