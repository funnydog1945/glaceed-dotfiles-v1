#!/usr/bin/env bash

dir="$HOME/Pictures/Wallpapers/"

cwd="$(pwd)"
cd "$dir" || exit 1

IFS=$'\n'

selected=$(for a in *.jpg *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "" -theme "~/.config/rofi/wallpaper/wallpaper.rasi")

if [ -n "$selected" ]; then
    echo "$selected"
    awww img "$selected" -t wave
    cp "$selected" ~/.config/hypr/wallpaper.jpg
fi

cd "$cwd"