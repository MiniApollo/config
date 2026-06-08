---------------------
---- KEYBINDINGS ----
---------------------

hl.bind(MainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + A", hl.dsp.exec_cmd(Editor))
hl.bind(MainMod .. " + SHIFT + A", hl.dsp.exec_cmd('emacsclient -c -a ""'))

hl.bind(MainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(MainMod .. " + Q", hl.dsp.exec_cmd(WebBrowser))
hl.bind(MainMod .. " + C", hl.dsp.exec_cmd(Office))

hl.bind("XF86Calculator", hl.dsp.exec_cmd("galculator"))
hl.bind(MainMod .. " + SHIFT + G", hl.dsp.exec_cmd("galculator"))

-- Rofi
hl.bind(MainMod .. " + D", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + SHIFT + D", hl.dsp.exec_cmd("~/.config/hypr/scripts/gpu_hybrid.sh"))
hl.bind(MainMod .. " + CTRL + D", hl.dsp.exec_cmd("~/.config/rofi/powermenu/powermenu.sh"))

hl.bind(MainMod .. " + SHIFT + C", hl.dsp.window.close())
hl.bind(MainMod .. " + SHIFT + T", hl.dsp.exit())
hl.bind(MainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(MainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(MainMod .. " + SHIFT + R", hl.dsp.exec_cmd("killall waybar ; waybar"))
hl.bind(MainMod .. " + CTRL + I", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-hypridle.sh"))
hl.bind(MainMod .. " + CTRL + W", hl.dsp.exec_cmd("~/.config/hypr/scripts/wallpaper.sh"))
hl.bind(MainMod .. " + CTRL + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(MainMod .. " + R", hl.dsp.exec_cmd("hyprpicker -a"))

-- System Controls
hl.bind(MainMod .. " + SHIFT + P", hl.dsp.exec_cmd("poweroff"))
hl.bind(MainMod .. " + SHIFT + U", hl.dsp.exec_cmd("reboot"))

-- Printscreen
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))                                                     -- Select screen
hl.bind(MainMod .. " + CTRL + Print",
    hl.dsp.exec_cmd('grim -g "$(slurp)" $(xdg-user-dir PICTURES)/ps_$(date +"%Y%m%d%H%M%S").png'))                      -- Save Select screen

hl.bind(MainMod .. " + Print", hl.dsp.exec_cmd("grim - | wl-copy"))                                                     -- Entire screen
hl.bind(MainMod .. " + SHIFT + Print", hl.dsp.exec_cmd('grim $(xdg-user-dir PICTURES)/ps_$(date +"%Y%m%d%H%M%S").png')) -- Save Entire screen

-- Example special workspace (scratchpad)
hl.bind(MainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.define_submap("passthru", function()
    hl.bind(MainMod .. " + Escape", hl.dsp.submap("reset"))
end)
hl.bind(MainMod .. " + SHIFT + B", hl.dsp.submap("passthru"))

-- Laptop multimedia keys for volume and LCD brightness
-- Change volume by: amixer set Capture 5%- or 5%+
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"),
    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 3%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 3%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Scroll through existing workspaces with MainMod + scroll
hl.bind(MainMod .. " + right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MainMod .. " + left", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with MainMod + LMB/RMB and dragging
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Switch workspaces with MainMod + [0-9]
-- Move active window to a workspace with MainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move focus with MainMod + arrow keys
hl.bind(MainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Window Resizing
hl.bind(MainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { repeating = true })
hl.bind(MainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 25, y = 0, relative = true }), { repeating = true })
hl.bind(MainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { repeating = true })
hl.bind(MainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0, y = 25, relative = true }), { repeating = true })

-- Window Move
hl.bind(MainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(MainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(MainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(MainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "down" }))
