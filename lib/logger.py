import re
from . import colors

class Logger:
    def __init__(self, file=None) -> None:
        self.file = file

    def set_file(self, file) -> None:
        """set log file"""
        self.file = file

    def info(self, message: str) -> None:
        text = f"{self.__create_header('INFO')} {message}"

        self.__log_in_file(text)

        print(text)

    def copy(self, src: str, dest: str) -> None:
        message = f"Copying {colors.light_yellow(src)} -> {colors.light_yellow(dest)}"
        text = f"{self.__create_header('INFO')} {message}"

        self.__log_in_file(text)

        print(text)

    def debug(self, message: str) -> None:
        text = f"{self.__create_header('DEBUG')} {message}"

        self.__log_in_file(text)

        print(text)

    def warning(self, message: str) -> None:
        text = f"{self.__create_header('WARNING')} {message}"

        self.__log_in_file(text)

        print(text)

    def error(self, message: str) -> None:
        text = f"{self.__create_header('ERROR')} {message}"

        self.__log_in_file(text)

        print(text)

    def __log_in_file(self, text: str) -> None:
        # Write to file only if a file is specified
        if self.file:
            ansi_escape = re.compile(r"\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])")

            result = ansi_escape.sub("", text)

            with open(self.file, 'a', encoding="UTF-8") as file:
                file.write(result + "\n")

    def __create_header(self, level) -> str:
        level_color = colors.white

        if level == "INFO":
            level_color = colors.bg_light_green
        elif level == "DEBUG":
            level_color = colors.bg_light_blue
        elif level == "WARNING":
            level_color = colors.bg_light_yellow
        elif level == "ERROR":
            level_color = colors.bg_light_red

        level = f" {level} "

        colored_level = colors.black(colors.bold(level_color(level)))

        return str(f"{colored_level}")


log = Logger()
