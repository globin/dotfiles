#!/bin/bash

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
xrdb -merge .Xresources
xcompmgr -n &
xrandr --output LVDS-1 --auto --primary
xrandr | grep 'VGA1 connected' | ifne xrandr --output VGA1 --auto --left-of LVDS-1
xrandr | grep 'HDMI1 connected' | ifne xrandr --output HDMI1 --auto --left-of LVDS-1
nitrogen --restore &
stalonetray \
    --icon-gravity E \
    --geometry 5x1-0+0 \
    --max-geometry 5x1-0+0 \
    --background '#000000' \
    --skip-taskbar \
    --icon-size 20 \
    --kludges force_icons_size \
    --window-strut none \
    &

gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh

setxkbmap -option 'ctrl:nocaps'

exec ~/.cabal/bin/xmonad
