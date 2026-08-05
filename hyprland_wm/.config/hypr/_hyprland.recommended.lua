-- Hyprland Lua config — RECOMMENDED variant.
-- https://wiki.hypr.land/Configuring/Start/
--
-- This is hyprland.lua (the straight translation of the old hyprland.conf) plus
-- upstream's current recommendations. Every deviation from the plain translation
-- is marked with a [REC] comment explaining what changed and why.
--
-- To use this file instead of hyprland.lua, either rename it to hyprland.lua or
-- make hyprland.lua a one-liner: require("hyprland.recommended")


------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- [REC] Scale 0.833 does not divide cleanly into common resolutions, so Hyprland
-- will emit an "invalid scale" warning and snap to the nearest valid value. A
-- valid scale must divide the resolution into whole logical pixels. If you want
-- slightly-smaller-than-native, 1.25 or 1.6 are clean on 1920x1200 / 2560x1600.
-- Left as-is here since it is your deliberate choice; run `hyprctl monitors` to
-- see what scale actually got applied.
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 0.833,
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal            = "kitty"
local fileManager         = "thunar"
local webBrowser          = "zen-browser"
local logout              = "wlogout --buttons-per-row 6 --margin-left 1280 --margin-top 1024 --margin-bottom 1024 --show-binds"
local lock                = "hyprlock"
local notification        = "swaync-client --toggle-panel"
local screenshot          = "hyprshot --mode region"
local screenshotClipboard = "hyprshot --mode region --clipboard-only"
local menu                = "vicinae toggle"
local windowSwitch        = "vicinae vicinae://extensions/vicinae/wm/switch-windows"
local showKeyBindings     = "vicinae vicinae://extensions/sovereign/hypr-keybinds/hyprland-keybinds"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("ibus start")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("blueberry-tray")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("ashell")
    hl.exec_cmd("swaync")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("QT_SCALE_FACTOR=1.5 vicinae server")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- [REC] You set xwayland.force_zero_scaling below, which unscales XWayland apps
-- so they stop looking blurry — but that alone makes them render *tiny*, since
-- nothing tells the toolkit to scale up. The wiki's HiDPI XWayland section pairs
-- force_zero_scaling with a toolkit-side scale factor. Uncomment if XWayland
-- (GTK-on-X11) apps look too small:
-- hl.env("GDK_SCALE", "2")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Permission changes require a Hyprland restart and are not applied on-the-fly.
--
-- [REC] Requires hyprland-guiutils. Enabling this means screen-capture attempts
-- prompt you instead of being silently allowed. The allow-rules below pre-approve
-- the tools you actually use (hyprshot shells out to grim) so you are not spammed.
-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })
-- hl.permission({ binary = "/usr/(bin|local/bin)/grim", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", type = "screencopy", mode = "allow" })
-- hl.permission({ binary = "/usr/(bin|local/bin)/hyprpm", type = "plugin", mode = "allow" })


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,
        allow_tearing    = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        blur = {
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

-- Default curves, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/#curves
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },       { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 },   { 0.75, 1 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 },    { 0.1, 1 } } })

-- [REC] Spring curves are new in the Lua era and upstream's example config now
-- uses one for window open/close. Springs are defined by mass/stiffness/dampening
-- instead of control points: more stiffness = faster, more dampening = less bounce.
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
-- [REC] windows/windowsIn now use the `easy` spring, matching upstream's example.
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true,
        force_split    = 2, -- Always split to the right
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})


----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,

        -- [REC] You run hyprlock (bound to SUPER+Escape) and hypridle. If hyprlock
        -- ever crashes, without this you are stuck on the "lockdead" screen with no
        -- way to restore a lock. Upstream recommends this for anyone using a
        -- lockscreen app.
        allow_session_lock_restore = true,

        -- [REC] Font used for Hyprland's own UI (error popups, ANR dialogs, splash).
        -- Default "Sans" is whatever fontconfig picks; set it explicitly so config
        -- error messages are legible. Change to a font you actually have installed.
        -- font_family = "JetBrainsMono Nerd Font",

        -- [REC] VRR / adaptive sync. 0 = off (default). 3 = fullscreen with
        -- video/game content — safe on laptops, and avoids the flicker that
        -- full-time VRR (1) can cause on the desktop.
        vrr = 3,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- Note: workspace_swipe / workspace_swipe_fingers were REMOVED in favor of this
-- gestures system, so hl.gesture is the only supported way to do this now.
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- [REC] The gesture system does far more than workspace swiping. Some useful ones:
-- hl.gesture({ fingers = 4, direction = "up",    action = "fullscreen" })
-- hl.gesture({ fingers = 3, direction = "down",  mods = "ALT", action = "close" })
-- hl.gesture({ fingers = 2, direction = "pinch", action = "cursor_zoom", zoom_level = 1, mode = "live" })

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
-- [REC] This is upstream's placeholder example for a device you almost certainly
-- do not own ("epic-mouse-v1"). It is inert, but it is also noise. Run
-- `hyprctl devices` to get your real device names if you want per-device tuning.
-- hl.device({
--     name        = "epic-mouse-v1",
--     sensitivity = -0.5,
-- })


---------------------
---- KEYBINDINGS ----
---------------------

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER"

-- [REC] You bind SUPER+Escape to a hypr-keybinds viewer, which reads `hyprctl
-- binds`. The Lua API supports a `description` flag that shows up there, which is
-- what makes that viewer actually useful. Descriptions added throughout below.
hl.bind(mainMod .. " + RETURN",    hl.dsp.exec_cmd(terminal),                  { description = "Open terminal" })
hl.bind(mainMod .. " + Q",         hl.dsp.window.close(),                      { description = "Close window" })
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(fileManager),               { description = "Open file manager" })
hl.bind(mainMod .. " + F",         hl.dsp.window.fullscreen(),                 { description = "Toggle fullscreen" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mainMod .. " + Space",     hl.dsp.exec_cmd(menu),                      { description = "App launcher" })

-- [REC] The old `exit` dispatcher is discouraged upstream: it tears Hyprland out
-- from under its clients. Use hyprshutdown (or `uwsm stop` on uwsm) for an
-- ordered shutdown. This replaces the commented-out `exit` bind.
hl.bind(mainMod .. " + SHIFT + Q",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"),
    { description = "Exit Hyprland" })

hl.bind(mainMod .. " + Z",      hl.dsp.exec_cmd(webBrowser),          { description = "Open web browser" })
hl.bind(mainMod .. " + Insert", hl.dsp.exec_cmd(notification),        { description = "Toggle notification panel" })
hl.bind("Print",                hl.dsp.exec_cmd(screenshot),          { description = "Screenshot region to file" })
hl.bind("CTRL + Print",         hl.dsp.exec_cmd(screenshotClipboard), { description = "Screenshot region to clipboard" })
hl.bind(mainMod .. " + Tab",    hl.dsp.exec_cmd(windowSwitch),        { description = "Switch windows" })

-- [REC] `locked = true` so the lock bind still works when a lockscreen/input
-- inhibitor is already active — otherwise pressing it twice does nothing.
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(lock), { locked = true, description = "Lock screen" })
-- hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(showKeyBindings), { description = "Show keybinds" })
-- hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(logout),          { description = "Logout menu" })

-- Move focus with mainMod + hjkl
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }),  { description = "Focus left" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }),  { description = "Focus down" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }),    { description = "Focus up" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Focus right" })

-- Move windows with mainMod + SHIFT + hjkl
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }),  { description = "Move window left" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }),  { description = "Move window down" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }),    { description = "Move window up" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }), { description = "Move window right" })

-- [REC] Lua lets you generate the 20 workspace binds in a loop instead of writing
-- them out by hand. Same result, and adding a workspace means changing one number.
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }),       { description = "Switch to workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move window to workspace " .. i })
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"),                { description = "Toggle scratchpad" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }),     { description = "Move window to scratchpad" })

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true, description = "Drag window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- [REC] Touchpad-friendly alternatives to the mouse-button drag/resize above.
-- Clicking and dragging on a touchpad is awkward; these use modifier keys instead.
-- hl.bind(mainMod .. " + CTRL_L", hl.dsp.window.drag(),   { mouse = true, description = "Drag window (touchpad)" })
-- hl.bind(mainMod .. " + ALT_L",  hl.dsp.window.resize(), { mouse = true, description = "Resize window (touchpad)" })

-- Laptop multimedia keys for volume and LCD brightness
-- [REC] Added `locked = true` so volume and brightness keep working on the
-- lockscreen — this is the behavior upstream's example config now ships.
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true, description = "Volume up" })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, description = "Mute output" })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, description = "Mute microphone" })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true, description = "Brightness down" })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true, description = "Next track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause" })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true, description = "Previous track" })

-- [REC] Submaps are a Lua-era ergonomics win: a "resize mode" gives you
-- repeating arrow-key resizing without burning a modifier combo per direction.
-- SUPER+R was free in your config. Press escape to leave the mode.
hl.bind(mainMod .. " + R", hl.dsp.submap("resize"), { description = "Enter resize mode" })
hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true })
    hl.bind("left",  hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true })
    hl.bind("up",    hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true })
    hl.bind("down",  hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true })
    hl.bind("escape", hl.dsp.submap("reset")) -- do NOT forget an exit bind
end)


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Fix font alias
hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})
