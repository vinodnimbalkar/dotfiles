import os
import re
import socket
import subprocess
from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import KeyChord, Click, Drag, Group, Key, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "kitty"

keys = [
    # Move FOCUS between windows
    Key([mod], "k", lazy.layout.down(), desc="Move focus down in stack pane"),
    Key([mod], "j", lazy.layout.up(), desc="Move focus up in stack pane"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus left in stack pane"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus left in stack pane"),

    # shufle windows
    Key([mod, "control"], "j", lazy.layout.shuffle_down()),
    Key([mod, "control"], "k", lazy.layout.shuffle_up()),
    Key([mod, "control"], "h", lazy.layout.shuffle_left()),
    Key([mod, "control"], "l", lazy.layout.shuffle_right()),

    # resize windows
    Key([mod, "shift"], "h", lazy.layout.shrink()),
    Key([mod, "shift"], "l", lazy.layout.grow()),
    Key([mod, "shift"], "m", lazy.layout.maximize()),
    Key([mod, "shift"], "n", lazy.layout.normalize()),

    # layout modifires
    Key([mod, "shift"], "t", lazy.window.toggle_floating()),
    Key([mod, "shift"], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.flip()),

    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "control"], "Return", lazy.layout.toggle_split()),

    # General Setting
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod, "shift"], "Return", lazy.spawn("rofi -modi run,drun -show run")),
    Key([mod], "s", lazy.spawn("gnome-control-center"), desc="Open Gnome Setting"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key([mod, "control"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc +5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec +5")),

    # Volume
    Key([], "XF86AudioMute", lazy.spawn("pulsemixer --toggle-mute")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pulsemixer --change-volume -5")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pulsemixer --change-volume +5")),

    # My applications launched with SUPER + ALT + KEY
    Key([mod, "mod1"], "b", lazy.spawn("google-chrome")),
    Key([mod, "mod1"], "w", lazy.spawn("wallchanger")),
]

group_names = [
    ("WWW", {"layout": "monadtall"}),
    ("DEV", {"layout": "monadtall"}),
    ("SYS", {"layout": "monadtall"}),
    ("DOC", {"layout": "monadtall"}),
    ("CHAT", {"layout": "monadtall"}),
    ("MUS", {"layout": "monadtall"}),
    ("VID", {"layout": "monadtall"}),
    ("GFX", {"layout": "monadtall"}),
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod], "Right", lazy.screen.next_group()))
    keys.append(Key([mod], "Left", lazy.screen.prev_group()))
    # Send current window to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus": "e1acff",
    "border_normal": "1D2330",
}

layouts = [
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Stack(num_stacks=2),
    layout.Floating(**layout_theme)
]

# Pywal colors
colors = []
cache = '/home/vinod/.cache/wal/colors'


def load_colors(cache):
    with open(cache, 'r') as file:
        for _ in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')
    lazy.reload()


load_colors(cache)

# Bar Colors
bar_colors = colors

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

##### DEFAULT WIDGET SETTINGS #####
widget_defaults = dict(font="JetBrains Mono", fontsize=12,
                       padding=2, background=colors[2])
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.Sep(linewidth=0, padding=6,
                   foreground=colors[2], background=colors[0]),
        widget.Image(
            filename="~/.config/qtile/icons/python.png",
            mouse_callbacks={
                "Button1": lambda qtile: qtile.cmd_spawn("rofi -show run")},
        ),
        widget.GroupBox(
            font="Ubuntu Bold",
            fontsize=9,
            margin_y=3,
            margin_x=0,
            padding_y=5,
            padding_x=3,
            borderwidth=3,
            active=colors[2],
            inactive=colors[2],
            rounded=False,
            highlight_color=colors[1],
            highlight_method="line",
            this_current_screen_border=colors[3],
            this_screen_border=colors[4],
            other_current_screen_border=colors[0],
            other_screen_border=colors[0],
            foreground=colors[2],
            background=colors[0],
        ),
        widget.Prompt(
            prompt=prompt,
            font="Ubuntu Mono",
            padding=10,
            foreground=colors[3],
            background=colors[1],
        ),
        widget.Sep(linewidth=0, padding=40,
                   foreground=colors[2], background=colors[0]),
        widget.WindowName(
            foreground=colors[6], background=colors[0], padding=0),
        widget.Image(
            filename="~/.config/qtile/icons/memory.png",
            background=bar_colors[3],
            margin=1,
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(
                terminal + " -e htop")},
        ),
        widget.Memory(
            format="Mem {MemUsed}MB ",
            foreground=bar_colors[0],
            background=bar_colors[3],
            update_interval=5,
            mouse_callbacks={"Button1": lambda qtile: qtile.cmd_spawn(
                terminal + " -e htop")},
        ),
        widget.Image(
            filename="~/.config/qtile/icons/wifi.png",
            background=bar_colors[4],
            margin=3,
        ),
        widget.Wlan(
            interface="wlp2s0",
            format="{essid}",
            disconnected_message="",
            foreground=bar_colors[0],
            background=bar_colors[4],
        ),
        widget.Net(
            format="{interface}",
            interface="enp0s20f0u1",
            foreground=bar_colors[0],
            background=bar_colors[4],
        ),
        widget.Image(
            filename="~/.config/qtile/icons/battery.png",
            background=bar_colors[2],
            margin=1,
        ),
        widget.Battery(
            charge_char="AC",
            discharge_char="",
            low_foreground=bar_colors[1],
            low_percentage=0.2,
            format="{char} {percent:2.0%} ({hour:d}:{min:02d})",
            update_interval=30,
            background=bar_colors[2],
            foreground=bar_colors[0],
        ),
        widget.Image(
            filename="~/.config/qtile/icons/brightness.png",
            background=bar_colors[3],
            margin=2,
        ),
        widget.Backlight(
            backlight_name="intel_backlight",
            format="{percent:2.0%}",
            foreground=bar_colors[0],
            background=bar_colors[3],
            step=1,
        ),
        widget.Image(
            filename="~/.config/qtile/icons/vol.png",
            background=bar_colors[3],
            margin=4,
        ),
        widget.Volume(foreground=bar_colors[0], background=bar_colors[3]),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[0],
            background=colors[4],
            padding=0,
            scale=0.7,
        ),
        widget.CurrentLayout(
            foreground=colors[2], background=colors[4], padding=5),
        widget.Image(
            filename="~/.config/qtile/icons/calendar.png",
            background=bar_colors[6],
            margin=4,
        ),
        widget.Clock(
            foreground=bar_colors[0], background=bar_colors[6], format="%a, %b %d - %H:%M"
        ),
        widget.Systray(background=colors[0], padding=5),
    ]
    return widgets_list


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    # Slicing removes unwanted widgets on Monitors 1,3
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2


def init_screens():
    return [
        Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
        Screen(top=bar.Bar(widgets=init_widgets_screen2(), opacity=1.0, size=20)),
        Screen(top=bar.Bar(widgets=init_widgets_screen1(), opacity=1.0, size=20)),
    ]


if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"


@ hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/autostart.sh"])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
