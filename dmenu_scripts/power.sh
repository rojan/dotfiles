#/usr/bin/sh

#Custom power control script for dmenu
#Dependency : slock

option=$(echo -e "Lock\nShutdown\nReboot\nSuspend\nHibernate" | dmenu -i -p "$1" -fn "Fira Code:size=10" -nb "#3B4252" -sb "#B48EAD" -sf "#E5E9F0" -nf "#E5E9F0")

if [[ $option = "Lock" ]]; then
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
