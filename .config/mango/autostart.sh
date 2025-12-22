swaybg -m fit -i ~/Pictures/wallpaper/wanella.jpg &

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
# The next line of command is not necessary. It is only to avoid some situations where it cannot start automatically
/usr/lib/xdg-desktop-portal-wlr &

# clipboard
clipse -listen &

# Notifier
mako &

waybar &
