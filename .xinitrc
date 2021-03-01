#/home/rojan/.screenlayout/hdmi2_laptop.sh

# set keyboard layout to us
setxkbmap us &

# Start your wm!
killall dwm

feh --randomize --bg-fill ~/Pictures/wallpapers/*

#switch caps and escpe
setxkbmap -option caps:swapescape

#screnshot server
flameshot &

#mail client
exec mailspring &

#bluetooth applet
blueman-applet &

/home/rojan/dotfiles/status-scripts/package_update.py &

killall dwmblocks
dwmblocks &

# start picom
picom &

#start dunst
dunst &

#keybinding
xbindkeys -f ~/dotfiles/xbindkeysrc

#start gnome-keyring
dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

#system try
#exec trayer --edge top --align right --margin 5 --widthtype percent --width 6 --heighttype percent --height 17 --expand false --padding 5 --iconspacing 5 --transparent true &

exec dwm 
