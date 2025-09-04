#!/usr/bin/env python3
from pathlib import Path
from os import environ, path
from sys import argv
from genconfig import GenConfig
from validation import load_config

APP_NAME = "ipcext"


class IpcExt:
    niri_path: Path
    niri_config_path: str
    util_settings_path: Path

    def __init__(self) -> None:

        home = environ.get("HOME")
        xdg_config = environ.get("XDG_CONFIG_HOME")

        if home:
            if xdg_config:
                self.niri_path = Path(xdg_config) / "niri"
            else:
                self.niri_path = Path(home) / ".config" / "niri"
        else:
            print("No home directory found.")
            exit(1)

        self.util_settings_path = self.niri_path / "settings.toml"
        self.niri_path.mkdir(parents=True, exist_ok=True)

        config = load_config(self.util_settings_path)

        self.niri_config_path = path.expanduser(
            path.expandvars(config.general.output_path)
        )

    def restore(self):
        GenConfig().gen_config()

    def replace_line(self, old: str, new: str):

        with open(self.niri_config_path, "r") as f:
            lines = f.readlines()

        matching_lines = [i for i, line in enumerate(lines) if old in line]

        if len(matching_lines) == 0:
            print("No matching line found.")
            return False
        elif len(matching_lines) > 1:
            print("Error: More than one matching line found.")
            return False

        index = matching_lines[0]
        lines[index] = new + "\n"

        with open(self.niri_config_path, "w") as f:
            f.writelines(lines)

        return True


def main():
    if len(argv) < 2:
        print(f"Usage: {APP_NAME} [replace|restore] <grep_text> <new_text>")
        return

    mode = argv[1]

    if mode == "replace":
        old, new = argv[2], argv[3]
        res = IpcExt().replace_line(old, new)
        if res:
            print("ok")
            exit(0)
    elif mode == "restore":
        res = IpcExt().restore()
        print("ok")
        exit(0)
    else:
        print("Unknown mode:", mode)
        exit(1)


if __name__ == "__main__":
    main()
