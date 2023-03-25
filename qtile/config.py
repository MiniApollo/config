# Thanks to luxirio
# https://github.com/luxirio/linux/tree/master/arco_dotfiles/qtile

# dependencies and wayland

# playerctl brillo khal alacritty thunar librewolf dmenu galculator picom nm-applet redshift 
# xorg-xwayland python-pywlroots python-pywayland python-xkbcommon
# StatusNotifier needs
# python-dbus-next (https://www.reddit.com/r/qtile/comments/um1i0w/comment/i8237d0/)
# python-pyxdg

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget #as extrawidgets
from qtile_extras.widget.decorations import PowerLineDecoration, RectDecoration
import subprocess
import os
import locale

# Set language (if you use English delete this 2 line)
# To know what language you need run in python(terminal)
# import locale
# locale.setlocale(locale.LC_TIME,'')
# Thanks to MellowTala (https://www.reddit.com/r/qtile/comments/wb8h97/set_locale_for_qtile_clock_widget)
locale.setlocale(locale.LC_ALL, 'hu_HU.UTF-8')

# Defining super key as window key
mod = "mod4"

# Programs
terminal = "alacritty"
file_manager = "thunar"
browser = "librewolf"

# backlight(brillo) to work user need to be in video group (gpasswd -a user video)
# /sys/class/backlight/nvidia_wmi_ec_backlight Change it
backlight_name = "nvidia_wmi_ec_backlight"

# Color theming
everforest = {
    "background":   "#2D353B",
    "bg_blue":      "#3A515D",
    "bg_dim":       "#232A2E",
    "bg_0":         "#2D353B",
    "bg_1":         "#343F44",
    "bg_2":         "#3D484D",
    "bg_3":         "#475258",
    "bg_4":         "#4F585E",
    "error":        "#514045",
    "selection":    "#425047",
    "fg1":          "#dfdcd6",
    "orange":       "#E69875",
    "red":          "#E67E80",
    "yellow":       "#DBBC7F",
    "green":        "#A7C080",
    "aqua":         "#83C092",
    "aqua1":        "#648a6d",
    "aqua2":        "#506e57",
    "blue":         "#7FBBB3",
    "purple":       "#D699B6",
    "grey":         "#7A8478",
    "greyblock":    "#565e65",
    "greyblock_dark":"#444B50",
    "greybg":       "#3a4248",
    "black":        "#1d2124"}

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "space", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack",),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Window Controls
    Key([mod], "m", lazy.layout.maximize(), desc='toggle window between minimum and maximum sizes'),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='toggle floating'),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),

    # WorkSpace Controls
    Key([mod], "Left", lazy.screen.prev_group(), desc='Move to previous workspace with left arrow key'),
    Key([mod], "Right", lazy.screen.next_group(), desc='Move to next workspace with right arrow key'),
    
    # System Controls
    Key([mod, "shift"], "p", lazy.spawn("shutdown now"), desc="Shutdown Computer"),
    Key([mod, "shift"], "u", lazy.spawn("reboot"), desc="Restart Computer"),

    # Brightness Controls
    # to use brillo user need to be in video group or edit to not require sudo
    Key([], "XF86MonBrightnessUp", lazy.spawn("brillo -q -A 5"), desc="Increase brightness"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brillo -q -U 5"), desc="Decrease brightness"),

    # Volume Controls
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q sset Master 1%+"), desc="Increase volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q sset Master 1%-"), desc="Increase volume"),
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master 1+ toggle"), desc="Mute volume"),

    # Microfon
    # Key([], "XF86AudioMicMute", lazy.spawn("amixer -D pulse sset Capture toggle"), desc="Toggle microfon"),

    # Calculator
    Key([], "XF86Calculator", lazy.spawn("galculator"), desc="FN Calculator"),

    # PrintScreen
    Key([], "Print", lazy.spawn("xfce4-screenshooter"), desc="FN Calculator"),

    # Audio Player hotkeys
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause"), desc="Play/Pause"),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop"), desc="Stop Audio,Video"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="Previus"),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="Next"),

    # UserPrograms
    # Dmenu
    Key([mod], "d", lazy.spawn("dmenu_run -i -fn 'Monospace'"), desc="Show dmenu"),
    # Browser
    Key([mod], "q", lazy.spawn(browser), desc="Launch browser"),
    # File Manager
    Key([mod], "e", lazy.spawn(file_manager), desc="Launch file manager"),
    # Terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
]
# WorkSpace(tag) names
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus = everforest["selection"],
        border_normal = everforest["background"],
        border_width=2),
    layout.MonadTall(
        border_width = 2,
        border_focus = everforest["selection"],
        border_normal = everforest["background"]
        ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Floating(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

# My decorations
# Originally from Stats decoration
decoration_group_clock = {
    "decorations": [
        RectDecoration(colour=everforest["bg_1"], radius=10, filled=True, padding_y=3, group=True)
    ],
    "padding": 10,}

# Originally from Battery decoration
decoration_group_stats = {
    "decorations": [
        RectDecoration(colour=everforest["bg_2"], radius=10, filled=True, padding_y=3, group=True)
    ],
    "padding": 5 }

class MyClock(widget.Clock):
    defaults = [
        (
            "long_format",
            "%Y - %b %d %A %R:%S",
            "Format to show when mouse is over widget."
        )
    ]

    def __init__(self, **config):
        widget.Clock.__init__(self, **config)
        self.add_defaults(MyClock.defaults)
        self.short_format = self.format

    def mouse_enter(self, *args, **kwargs):
        self.format = self.long_format
        self.bar.draw()

    def mouse_leave(self, *args, **kwargs):
        self.format = self.short_format
        self.bar.draw()


widget_defaults = dict(
    font="JetBrainsMono Nerd Font Bold",
    fontsize=13,
    padding=3,
    background = everforest["background"]
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets = [
            # Left widgets
            widget.Sep(
                linewidth = 0,
                padding = 6,
                ),
            widget.GroupBox(
                highlight_method = "line",
                font = "JetBrainsMono Nerd Font",
                fontsize = 14,
                spacing = 5,
                active = everforest["fg1"],
                highlight_color = [everforest["selection"],everforest["selection"]],
                this_current_screen_border = everforest["aqua"],
                inactive = everforest["grey"]
                ),
            widget.WindowName(),
            # Right Widgets
            widget.Systray(),
            # Wayland
            # widget.StatusNotifier(),
            widget.Sep(
                linewidth = 0,
                padding = 7,
                ),
            widget.Image(filename = "~/.config/qtile/icons/volume.png",scale = "False",**decoration_group_stats),
            widget.Volume(
                fontsize = 14,
                update_interval = 0.3,
                foreground=everforest["fg1"],
                **decoration_group_stats
                ),

            widget.Sep(
                linewidth = 0,
                padding = 7,
                ),
            widget.Image(filename = "~/.config/qtile/icons/screen.png",scale = "False",**decoration_group_stats),
            widget.Backlight(
                update_interval = 1,
                fontsize = 14,
                backlight_name = backlight_name,
                foreground=everforest["fg1"],
                change_command  = "brillo",
                **decoration_group_stats,
                ),
            widget.Sep(
                linewidth = 0,
                padding = 7,
                ),
            widget.UPowerWidget(
                background=everforest["background"],
                border_charge_colour=everforest["aqua"],
                foreground=everforest["fg1"],
                fill_normal=everforest["fg1"],
                border_colour="#ede8dc",
                margin=5,
                **decoration_group_stats,
                ),

            widget.Battery(
                fontsize = 14,
                format = "{percent:2.0%}",
                notify_below = 15,
                foreground=everforest["fg1"],
                **decoration_group_stats,
                ),

            widget.Sep(
                linewidth = 0,
                padding = 7,
                ),

            MyClock(
                    fontsize = 14,format = "%b %d %A %R",
                    foreground=everforest["fg1"], 
                    mouse_callbacks = {'Button1': lazy.spawn(terminal + ' -e khal interactive')},
                    **decoration_group_clock,
                    ),
            widget.CurrentLayout(fontsize = 12,foreground=everforest["fg1"], **decoration_group_stats),
             ]
    return widgets

screens = [
    Screen(
        bottom=bar.Bar(
            init_widgets_list(),
            30,
            background=everforest["background"],
            # change opacity to fix applet overlap each other
            # https://github.com/qtile/qtile/issues/2935
            opacity=1.0,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(title="galculator"),  # Galculator
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


# AUTOSTART #
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])
