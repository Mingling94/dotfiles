#!/bin/bash
# Restarts the network-manager service to reconnect to wifi signal
# Generally attach to Ctrl+Alt+W

if [ $(rfkill list wifi | grep "Soft blocked: yes" | wc -l) -gt 0 ] ; then
    rfkill unblock wifi
    zenity --info --text "Enabled wireless" --timeout="1"
else
    rfkill block wifi
    zenity --info --text "Disabled wireless" --timeout="1"
fi
