#!/usr/bin/env python3
from pydantic import BaseModel, ValidationError
from pathlib import Path
import tomllib


class GeneralConfig(BaseModel):
    output_path: Path


class GenConfigSection(BaseModel):
    sources: list[Path]


class WorkspaceItem(BaseModel):
    workspace: int
    run: str


class AppConfig(BaseModel):
    general: GeneralConfig
    genconfig: GenConfigSection


def load_config(path: Path) -> AppConfig:
    try:
        with open(path, "rb") as f:
            raw = tomllib.load(f)
        return AppConfig(**raw)
    except FileNotFoundError:
        raise FileNotFoundError(f"Config file not found: {path}")
    except tomllib.TOMLDecodeError as e:
        raise ValueError(f"Failed to parse TOML: {e}")
    except ValidationError as e:
        raise ValueError(f"Config validation error: {e}")
