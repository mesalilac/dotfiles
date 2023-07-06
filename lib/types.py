from typing import TypedDict

class Path(TypedDict):
    src: str
    dest: str
    exclusions: list[str]
