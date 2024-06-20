#!/usr/bin/python

import json
import subprocess

clients = json.loads(subprocess.run(["hyprctl -j clients"], capture_output = True, text = True, shell = True).stdout)

for client in clients:
    if client["workspace"]["id"] == -1337:
        client_address = client["address"]
        print("Using client: " + client_address)
        #cmd = "hyprctl dispatch focuswindow address:" + client_address
        #subprocess.run([cmd], shell = True)
        cmd = "hyprctl dispatch movetoworkspacesilent special:temp,address:" + client_address
        subprocess.run([cmd], shell = True)
        cmd = "hyprctl dispatch movetoworkspacesilent 1,address:" + client_address
        subprocess.run([cmd], shell = True)
