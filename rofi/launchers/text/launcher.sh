#!/usr/bin/env bash
theme="main"
dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
rofi -no-lazy-grab -show combi --combi-modes "window,drun" -theme $dir/"$theme"

