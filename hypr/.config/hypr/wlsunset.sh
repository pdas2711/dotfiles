#!/run/current-system/sw/bin/bash

if [[ $(ps -aux | grep "[0-9] wlsunset") == "" ]]; then
	wlsunset -t 1400 -T 1500
else
	killall wlsunset
fi
