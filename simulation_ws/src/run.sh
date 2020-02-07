#!/bin/bash
export XAUTHORITY=/root/.Xauthority
source /opt/ros/$ROS_DISTRO/setup.bash

if [ "$1" == "build" ]; then
	pip3 install -U src/rl-agent
	rm -R build
	rm -R install
	colcon build
fi

source install/setup.sh
if which x11vnc &>/dev/null; then
	export DISPLAY=:0 # Select screen 0 by default.
	xvfb-run -f $XAUTHORITY -l -n 0 -s ":0 -screen 0 1920x1080x24" jwm &
	x11vnc -bg -forever -nopw -rfbport 5900 -display WAIT$DISPLAY &
	roslaunch mars $1 &
	rqt &
	rviz &
fi
#! pgrep -a Xvfb && Xvfb $DISPLAY -screen 0 1024x768x16 &
sleep 1
#if which fluxbox &>/dev/null; then
#  ! pgrep -a fluxbox && fluxbox &
#fi
echo "IP: $(hostname -I) ($(hostname))"
wait
