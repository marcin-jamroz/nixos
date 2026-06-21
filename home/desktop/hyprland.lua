local nix = require("nix_vars")

local palette = nix.palette

local function runOnceStart(program)
  return hl.exec_cmd("pgrep " .. program .. " || uwsm app -- " .. program)
end

hl.monitor(
  {
    output = "DP-1",
    mode = "preferred",
    position = "1920x0",
    scale = "1",
  })
hl.monitor({
  output = "HDMI-A-2",
  mode = "preffered",
  position = "0x0",
  scale = "1",
})

hl.on("hyprland.start", function()
  runOnceStart("uwsm finalize")
  runOnceStart("$POLKIT_BIN")
  runOnceStart("waybar")
  runOnceStart("swaync")
  runOnceStart("nm-applet")
  runOnceStart("blueman-applet")
end)

hl.config({
  general = {
    gaps_in = 6,
    gaps_out = 8,
    border_size = 2,
    layout = "dwindle",
    resize_on_border = true,
    col = {
      active_border = { colors = { palette.base0C, palette.base0D, palette.base0B, palette.base0E }, angle = 45 },
      inactive_border = { colors = { palette.base00, palette.base01 }, angle = 45 }
    }
  },
  input = {
    kb_layout = "pl, us",
    kb_options = "grp:alt_shift_toggle",
    follow_mouse = 1,
    touchpad = {
      natural_scroll = false,
    },
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
    accel_profile = "flat",
  },
  misc = {
    disable_hyprland_logo = true,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = false,
  },
  animations = {
    enabled = true,
  },
  decoration = {
    blur = {
      enabled = true,
      size = 5,
      passes = 3,
      new_optimizations = true,
      ignore_opacity = true,
    },
  },
  dwindle = {
    preserve_split = true,
  },
  master = {
    new_status = "master",
  },
})

-- ANIMATIONS --
hl.curve("easeInElastic", { type = "bezier", points = { { 0.7, -0.6 }, { 0.3, 1.6 } } })
hl.curve("easeInElastic", { type = "spring", mass = 1.0, stiffness = 120, dampening = 8 })

-- hl.animation({ leaf = "windows", enabled = true, speed = 10, bezier = "easeInElastic" })
hl.animation({ leaf = "windows", enabled = true, speed = 10, spring = "easeInElastic" })

-- GENERAL --
local mod = "SUPER"
local terminal = "kitty"
local launcher = "rofi-launcher"


-- HELPERS --
local function runDsp(program)
  return hl.dsp.exec_cmd("uwsm app -- " .. program)
end

local function runOnceDsp(program)
  return hl.dsp.exec_cmd("pgrep " .. program .. " || uwsm app -- " .. program)
end


-- LAUNCHER --
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(launcher))


-- GENERAL SHORTCUTS --
hl.bind(mod .. " + T", runDsp(terminal))
hl.bind(mod .. " + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(mod .. " + S", runOnceDsp("screenshot"))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + Q", hl.dsp.window.kill())
hl.bind(mod .. " + W", hl.dsp.window.close())
hl.bind(mod .. " + P", hl.dsp.window.pseudo())


-- MONITORS --
hl.bind(mod .. " + SHIFT + O", function()
  hl.monitor({ output = "DP-1", mode = "preferred", position = "2000x0", scale = "1", })
end)

hl.bind(mod .. " + O", function()
  hl.monitor({ output = "DP-1", mode = "preferred", position = "1920x0", scale = "1", })
end)


-- AUDIO --
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { repeating = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { repeating = true })


-- WORKSPACE --
hl.bind(mod .. " + M", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:magic" }))

for i = 1, 10 do
  hl.workspace_rule({ workspace = tostring(i), monitor = "DP-1" })

  local w = (i == 10) and "0" or tostring(i)
  hl.bind(mod .. " + " .. w, hl.dsp.focus({ workspace = tostring(i) }))
  hl.bind(mod .. " + SHIFT + " .. w, hl.dsp.window.move({ workspace = tostring(i) }))
end

for i = 11, 21 do
  hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-2" })
end

hl.bind(mod .. " + CONTROL + right", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mod .. " + CONTROL + left", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mod .. " + CONTROL + SHIFT + right", hl.dsp.window.move({ workspace = "r+1" }))
hl.bind(mod .. " + CONTROL + SHIFT + left", hl.dsp.window.move({ workspace = "r-1" }))


-- WINDOW --
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mod .. " + SHIFT + I", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))

hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mod .. " + y", hl.dsp.exec_cmd('yad --list --column=Key: ' .. palette.base0C .. " kek " .. palette.base0E))
