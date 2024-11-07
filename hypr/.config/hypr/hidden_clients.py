#!/usr/bin/python

import json
import subprocess
from sys import argv
import re

clients = json.loads(subprocess.run(["hyprctl -j clients"], capture_output = True, text = True, shell = True).stdout)

if len(argv) == 1:
    print("Available arguments are: minimize, show, collect")
    exit()
if argv[1] == "minimize":
    # Get current workspace name
    window_json = json.loads(subprocess.run(["hyprctl -j activewindow"], capture_output = True, text = True, shell = True).stdout)
    client_address = window_json["address"]
    workspace_json = json.loads(subprocess.run(["hyprctl -j activeworkspace"], capture_output = True, text = True, shell = True).stdout)
    curr_workspace = workspace_json["name"]
    print(curr_workspace)
    if "special" in window_json["workspace"]["name"]:
        client_address = window_json["address"]
        cmd = "hyprctl dispatch movetoworkspacesilent " + curr_workspace + ",address:" + client_address
        subprocess.run([cmd], shell = True)
    else:
        client_address = window_json["address"]
        cmd = "hyprctl dispatch movetoworkspacesilent special:" + curr_workspace + ",address:" + client_address
        subprocess.run([cmd], shell = True)
elif argv[1] == "show":
    workspace_json = json.loads(subprocess.run(["hyprctl -j activeworkspace"], capture_output = True, text = True, shell = True).stdout)
    curr_workspace = workspace_json["name"]
    if "special" in curr_workspace:
        curr_workspace = re.sub("special:", "", curr_workspace)
    cmd = "hyprctl dispatch togglespecialworkspace " + curr_workspace
    subprocess.run([cmd], shell = True)
elif argv[1] == "collect":
    minimized_clients = json.loads(subprocess.run(["hyprctl -j clients"], capture_output = True, text = True, shell = True).stdout)
    for client in minimized_clients:
        client_name = client["workspace"]["name"]
        if re.search("special:" + "[0-9]+", client_name):
            client_address = client["address"]
            cmd = "hyprctl dispatch movetoworkspace special,address:" + client_address
            subprocess.run([cmd], shell = True)
else:
    exit()
