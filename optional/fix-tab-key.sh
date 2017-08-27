#!/bin/bash

KEYBOARD_SHORTCUT_FILE="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
cp --verbose $KEYBOARD_SHORTCUT_FILE{,.bak}
sed -i '/Super.*Tab.*switch_window_key/d' $KEYBOARD_SHORTCUT_FILE
