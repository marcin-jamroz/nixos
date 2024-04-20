{ pkgs, ... }:

pkgs.writeShellScriptBin "list-hypr-bindings" ''
  yad --width=800 --height=650 \
  --center \
  --fixed \
  --title="Hyprland Keybindings" \
  --no-buttons \
  --list \
  --column=Key: \
  --column=Description: \
  --column=Command: \
  --timeout=90 \
  --timeout-indicator=right \
  "" "super key" "" \
  "" "applications" "rofi-launcher" \
  " + left mouse" "move window" "movewindow" \
  " + right mouse" "resize window" "resizewindow" \
  " + F" "toggle fullscreen" "fullscreen" \
  " + T" "launch termianal" "kitty" \
  " + L" "lock screen" "swaylock" \
  " + S" "take a screenshot" "screenshot" \
  " + SHIFT + SPACE" "minimize" "movetoworkspace, special" \
  " + SPACE" "open minimized" "togglespecialworkspace" \
  " + Q" "Close active" "killactive" \
  " + P" "pseudo" "pseudo" \
  " + SHIFT + I" "split window" "togglesplit" \
  " + SHIFT + F" "floating window" "togglefloating" \
  " + SHIFT + left (h)" "move window left" "movewindow, l" \
  " + SHIFT + right (l)" "move window right" "movewindow, r" \
  " + SHIFT + up (k)" "move window up" "movewindow, u" \
  " + SHIFT + down (j)" "move window down" "movewindow, d" \
  " + left (h)" "fouce left window" "movefocus, l" \
  " + right (l)" "focuse right window" "movefocus, r" \
  " + up (k)" "focus up window" "movefocus, u" \
  " + down (j)" "focus down window" "movefocus, d" \
  " + {num}" "focus workspace {num}" "workspace, {num}" \
  " + SHIFT + {num}" "move to workspace" "movetoworkspace, {num}" \
  " + CONTROL + right" "focus next workspace" "workspace, e+1" \
  " + CONTROL + left" "focus previous workspace" "workspace, e-1" \
  " + mouse_down" "focus next workspace" "workspace, e+1" \
  " + mouse_up" "focuse previous workspace" "workspace, e-1" \
  ""
''

