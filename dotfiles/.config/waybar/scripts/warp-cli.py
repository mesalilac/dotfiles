#!/usr/bin/env python3

import json
import subprocess
import argparse


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--toggle", action="store_true")
    args = parser.parse_args()

    result = subprocess.run(["warp-cli", "status"], capture_output=True)
    text = result.stdout.splitlines()[0].decode()

    if not text.startswith("Status update: "):
        if args.toggle:
            subprocess.run(["notify-send", "warp-cli", "Couldn't get warp-cli status"])
        print(json.dumps({"text": "Couldn't get warp-cli status", "class": []}))
        return

    status = text.split("Status update: ")[1].lower()
    module_text = "unknown status"
    module_class = []

    match status:
        case "connected":
            module_text = "Connected"
            module_class.append("connected")
        case "disconnected":
            module_text = "Offline"
            module_class.append("disconnected")
        case "connecting":
            module_text = "Connecting"
            module_class.append("connecting")
        case _:
            module_text = "Uncatched status"

    if args.toggle:
        if status == "connected":
            subprocess.run(["warp-cli", "disconnect"])
        elif status == "disconnected":
            subprocess.run(["warp-cli", "connect"])
        else:
            subprocess.run(["notify-send", "warp-cli", status])
        return

    print(json.dumps({"text": module_text, "class": module_class}))


if __name__ == "__main__":
    main()
