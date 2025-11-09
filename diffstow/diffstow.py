from sys import argv
from os import environ
from socket import gethostname
from pathlib import Path
import jinja2
import json

# Check and load config.json
config_path = Path("config.json")
if not config_path.exists():
    print("Unable to find 'config.json' in current directory.")
    exit()
else:
    with open("config.json", "r") as f:
        config = json.load(f)

# Get name of host from HOST environment variable or from argument
if len(argv) > 1:
    host = argv[1]
elif "HOST" in environ:
    host = environ["HOST"]
elif gethostname():
    host = gethostname()
else:
    print("Unable to determine hostname. Try passing the name of the host as an argument.")
    exit()

# Check if hostname is valid in config.json
if not host in config["implementations"]:
    print("Host '" + host + "' is not available in config.json.")
    exit()
