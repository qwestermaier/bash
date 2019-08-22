#!/bin/bash

#
# Author: Quirin Westermaier
# email: westermaier.quirin@gmail.com
# github.com: qwestermaier
#
# KDE5 gkrellm: set current Wallpaper in "feh" to enable invisible/tansparent gkrellm-themes
# tested eith kde-neon 5.16 on KDE 5.16.4 - works with multi-monitor-setups if wallpaper is the same on all monitors
#
CURRENT_WALLPAPER_PLUGIN="`grep -m 1 'wallpaperplugin' ~/.config/plasma-org.kde.plasma.desktop-appletsrc | tail --bytes=+17`"
echo "Currently set Wallpaper-Plugin: $CURRENT_WALLPAPER_PLUGIN"

NEW_SEARCH_STRING="'\[$CURRENT_WALLPAPER_PLUGIN\]'"
#echo "Now searching for $NEW_SEARCH_STRING"

NEW_SEARCH_COMMAND_BLOCK="grep -m 1 -A 4 $NEW_SEARCH_STRING ~/.config/plasma-org.kde.plasma.desktop-appletsrc"
#echo "Found: $NEW_SEARCH_COMMAND_BLOCK"

CURRENT_WALLPAPER_IMAGE_BLOCK="`eval $NEW_SEARCH_COMMAND_BLOCK`"
#echo "Configuration of currently set Wallpaper-Plugin: $CURRENT_WALLPAPER_IMAGE_BLOCK"

CURRENT_WALLPAPER_IMAGE="`echo $CURRENT_WALLPAPER_IMAGE_BLOCK | tr ' ' '\n' | grep 'Image=' | tail --bytes=+14`"
echo "Found Wallpaper Image: $CURRENT_WALLPAPER_IMAGE"

echo "Executing feh: feh --bg-fill $CURRENT_WALLPAPER_IMAGE"
feh --bg-fill "$CURRENT_WALLPAPER_IMAGE"
