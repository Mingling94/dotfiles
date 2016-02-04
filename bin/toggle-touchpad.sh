#!/bin/bash
# Toggles, via synclient, whether the touchpad is on or off. Useful for
# rotating lenovo yoga laptops such that their keyboard/touchpad face a surface
# Generally attach to Ctrl+Alt+P

GrepLine=$(synclient -l | grep --line-buffered 'Touchpad')
TouchPadStatus="${GrepLine: -1}"

if [ "${TouchPadStatus}" = "1" ] ; then
	synclient TouchpadOff=0
else 
	synclient TouchpadOff=1
fi
