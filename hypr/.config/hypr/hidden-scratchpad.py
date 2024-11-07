#!/usr/bin/env python

from sys import argv
import json
import subprocess
import re

if len(argv) == 1:
    print("Available arguments are: minimize, show, collect")
    exit()
if argv[1] == "minimize":
    window_json = json.loads(subprocess.run(["hyprctl -j activewindow"], capture_output = True, text = True, shell = True).stdout)
    client_address = window_json["address"]
    workspace_json = json.loads(subprocess.run(["hyprctl -j activeworkspace"], capture_output = True, text = True, shell = True).stdout)
    curr_workspace = workspace_json["name"]
    print(curr_workspace)
    if "special" in window_json["workspace"]["name"]:
        cmd = "hyprctl dispatch movetoworkspacesilent " + curr_workspace + ",address:" + client_address
        subprocess.run([cmd], shell = True)
    else:
        cmd = "hyprctl dispatch movetoworkspacesilent special,address:" + client_address
        subprocess.run([cmd], shell = True)
elif argv[1] == "collect":
    minimized_clients = json.loads(subprocess.run(["hyprctl -j clients"], capture_output = True, text = True, shell = True).stdout)
    workspace_json = json.loads(subprocess.run(["hyprctl -j activeworkspace"], capture_output = True, text = True, shell = True).stdout)
    curr_workspace = workspace_json["name"]
    for client in minimized_clients:
        client_name = client["workspace"]["name"]
        if re.search("special:special", client_name):
            client_address = client["address"]
            cmd = "hyprctl dispatch movetoworkspace " + curr_workspace + ",address:" + client_address
            subprocess.run([cmd], shell = True)
else:
    exit()
