#!/run/current-system/sw/bin/python

from sys import argv
import subprocess
import json

curr_zoom = json.loads(subprocess.run(["hyprctl -j getoption cursor:zoom_factor"], capture_output = True, text = True, shell = True).stdout)["float"]
if len(argv) != 2:
    exit()
if argv[1] == "increment":
    new_zoom = curr_zoom + 0.2
elif argv[1] == "decrement":
    new_zoom = curr_zoom - 0.2
    if new_zoom < 1.0:
        new_zoom = 1.0
elif argv[1] == "standard":
    new_zoom = 1.0
else:
    exit()
subprocess.run(["hyprctl keyword cursor:zoom_factor " + str(new_zoom)], shell = True)
exit()
