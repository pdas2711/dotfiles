# Add the current directory of this script to sys.path
from sys import path as sys_path
from pathlib import Path

current_dir = Path(__file__).resolve().parent
if str(current_dir) not in sys_path:
    sys_path.insert(0, str(current_dir))

# Main configuration starts here. We can also add other modules from this file's directory

from xonsh.built_ins import XSH
import aliases

env = XSH.env
