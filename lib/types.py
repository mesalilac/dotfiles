from dataclasses import dataclass, field
from typing import List, Union

@dataclass
class Dir:
    src: str
    dest: str
    exclude: List[str] = field(default_factory=list)

    def as_string(self):
        return "dir"

@dataclass
class File:
    src: str
    dest: str

    def as_string(self):
        return "file"

Entry = Union[Dir, File]
