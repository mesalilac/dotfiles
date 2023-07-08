RESET = "\33[0m"


def bold(msg):
    return "\33[1m" + msg + RESET


def italic(msg):
    return "\33[3m" + msg + RESET


def url(msg):
    return "\33[4m" + msg + RESET


def blink(msg):
    return "\33[5m" + msg + RESET


def blink2(msg):
    return "\33[6m" + msg + RESET


def selected(msg):
    return "\33[7m" + msg + RESET


def white(msg):
    return "\33[97m" + msg + RESET


def black(msg):
    return "\33[30m" + msg + RESET


def dark_red(msg):
    return "\33[31m" + msg + RESET


def dark_green(msg):
    return "\33[32m" + msg + RESET


def dark_yellow(msg):
    return "\33[33m" + msg + RESET


def dark_blue(msg):
    return "\33[34m" + msg + RESET


def dark_violet(msg):
    return "\33[35m" + msg + RESET


def dark_beige(msg):
    return "\33[36m" + msg + RESET


def dark_white(msg):
    return "\33[37m" + msg + RESET


def light_grey(msg):
    return "\33[90m" + msg + RESET


def light_red(msg):
    return "\33[91m" + msg + RESET


def light_green(msg):
    return "\33[92m" + msg + RESET


def light_yellow(msg):
    return "\33[93m" + msg + RESET


def light_blue(msg):
    return "\33[94m" + msg + RESET


def light_violet(msg):
    return "\33[95m" + msg + RESET


def light_beige(msg):
    return "\33[96m" + msg + RESET


def bg_black(msg):
    return "\33[40m" + msg + RESET


def bg_red(msg):
    return "\33[41m" + msg + RESET


def bg_green(msg):
    return "\33[42m" + msg + RESET


def bg_yellow(msg):
    return "\33[43m" + msg + RESET


def bg_blue(msg):
    return "\33[44m" + msg + RESET


def bg_violet(msg):
    return "\33[45m" + msg + RESET


def bg_beige(msg):
    return "\33[46m" + msg + RESET


def bg_white(msg):
    return "\33[47m" + msg + RESET


def bg_light_grey(msg):
    return "\33[100m" + msg + RESET


def bg_light_red(msg):
    return "\33[101m" + msg + RESET


def bg_light_green(msg):
    return "\33[102m" + msg + RESET


def bg_light_yellow(msg):
    return "\33[103m" + msg + RESET


def bg_light_blue(msg):
    return "\33[104m" + msg + RESET


def bg_light_violet(msg):
    return "\33[105m" + msg + RESET


def bg_light_beige(msg):
    return "\33[106m" + msg + RESET


def bg_light_white(msg):
    return "\33[107m" + msg + RESET
