#!/bin/bash
export XAUTHORITY=/root/.Xauthority

if which x11vnc &>/dev/null; then
	export DISPLAY=:0 # Select screen 0 by default.
	xvfb-run -f $XAUTHORITY -l -n 0 -s ":0 -screen 0 1920x1080x24" jwm &
	x11vnc -bg -forever -nopw -rfbport 5900 -display WAIT$DISPLAY &
fi

