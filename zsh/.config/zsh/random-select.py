#!/usr/bin/env python

# Inspired and using the OPun database
# https://github.com/dabbers/OPun

from sys import argv
from random import randrange
from pathlib import Path
import json

def main():
    if len(argv) == 1:
        filename = Path(__file__).parent.joinpath("data.json")
    else:
        filename = argv[1]

    with open(filename, "r") as f:
        data = json.load(f)
    posts = data["data"]["posts"]
    selected_index = randrange(0, len(posts))
    post = posts[selected_index]["plaintext"]
    print(post)

if __name__ == "__main__":
    main()
