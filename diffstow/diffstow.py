from sys import argv
from os import environ
from socket import gethostname
from pathlib import Path
from jinja2 import Environment, FileSystemLoader
import json

# Check and load config.json
config_path = Path("config.json")
if not config_path.exists():
    print("Unable to find 'config.json' in current directory.")
    exit()
else:
    with open("config.json", "r") as f:
        config = json.load(f)

template_path = Path(config["template_path"])
implementation_path = Path(config["implementation_path"])

# Check for Template directory
if not template_path.exists():
    print("Template directory '" + str(template_path) + "' doesn't exist.")
    exit()

# Check for Implementation directory
if not implementation_path.exists():
    print("Implementation directory '" + str(implementation_path) + "' doesn't exist.")
    exit()

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

template_env = Environment(loader = FileSystemLoader(template_path))
for template_file, impl_file in list(config["implementations"][host].items()):
    template_file_path = template_path.joinpath(template_file)
    impl_file_path = implementation_path.joinpath(impl_file)
    if not template_file_path.exists():
        print("Template file '" + template_file + "' doesn't exist.")
        exit()
    if not impl_file_path.exists():
        print("Implementation file '" + impl_file + "' doesn't exist.")
        exit()
