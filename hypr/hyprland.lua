-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

hl.monitor({
  output = "HDMI-A-1",
  mode = "1920x1080",
  position = "auto",
  scale = 1,
})

---------------------
---- Variables ----
---------------------

Terminal    = "alacritty"
Editor      = "emacs"
FileManager = "thunar"
WebBrowser  = "librewolf"
Office      = "libreoffice"
Menu        = "rofi -show drun"
MainMod     = "SUPER" -- Sets "Windows" key as main modifier

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("wl-clipboard-history -t")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("~/.config/hypr/scripts/gtk-theme.sh")
    hl.exec_cmd("~/.config/hypr/scripts/autostart.sh")
    hl.exec_cmd("~/.config/hypr/scripts/wallpaper.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Cursor settings
hl.env("XCURSOR_THEME", "Qogir")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Set backends to wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")

-- XDPH environment variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 0,

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",
    },

    decoration = {
        rounding       = 5,
        rounding_power = 2,

        shadow         = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur           = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})


-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
        vrr                     = 1
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout    = "hu",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "caps:swapescape",
        kb_rules     = "",

        follow_mouse = 1,

        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad     = {
            natural_scroll = true,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name       = "tshort-dactyl-manuform-(5x6)",
    kb_options = "",
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Workspace startup program configuration
hl.window_rule({ match = { class = "emacs" }, workspace = "1" })
hl.window_rule({ match = { class = "Alacritty" }, workspace = "1" })
hl.window_rule({ match = { class = "librewolf" }, workspace = "2" })
hl.window_rule({ match = { class = "Godot" }, workspace = "3" })
hl.window_rule({ match = { class = "thunar" }, workspace = "4" })

hl.window_rule({ match = { class = "galculator" }, float = true })
hl.window_rule({ match = { class = "com.oracle.javafx.scenebuilder.app.SceneBuilderApp" }, stay_focused = on })

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(true)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

---------------------
---- Imports ----
---------------------
require("lua/keybinds")
require("lua/animations")
