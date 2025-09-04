#!/usr/bin/env python3
from os import environ, path
from pathlib import Path
from sys import argv
from validation import load_config

APP_NAME = "genconfig"


class GenConfig:
    niri_dir: Path
    niri_config_path: str
    util_settings_path: Path
    sources: list[str] = []

    def __init__(self) -> None:

        home = environ.get("HOME")
        xdg_config = environ.get("XDG_CONFIG_HOME")

        if home:
            if xdg_config:
                self.niri_dir = Path(xdg_config) / "niri"
            else:
                self.niri_dir = Path(home) / ".config" / "niri"
        else:
            print("No home directory found.")
            exit(1)

        self.util_settings_path = self.niri_dir / "settings.toml"
        self.niri_dir.mkdir(parents=True, exist_ok=True)
        config = load_config(self.util_settings_path)

        self.niri_config_path = path.expanduser(
            path.expandvars(config.general.output_path)
        )

        for s in config.genconfig.sources:
            self.sources.append(path.expanduser(path.expandvars(str(s))))

    def gen_config(self):
        all_files_found = True

        with open(self.niri_config_path, "w", encoding="utf-8") as outfile:
            for fname in self.sources:
                if not Path(fname).exists():
                    print(f"Source file missing: {fname}")
                    all_files_found = False
                    continue
                with open(fname, "r", encoding="utf-8") as infile:
                    _ = outfile.write(infile.read())
                    _ = outfile.write("\n")

        if all_files_found:
            print(f"Generation successful! Output written to: {self.niri_config_path}")
        else:
            print(
                f"Generation completed with missing files. Check logs above. Output written to: {self.niri_config_path}"
            )


def main():
    if len(argv) < 2:
        print(f"Usage: {APP_NAME} [generate]")
        return

    mode = argv[1]

    if mode == "generate":
        GenConfig().gen_config()
    else:
        print("Unknown mode:", mode)
        exit(1)


if __name__ == "__main__":
    main()
