{ pkgs }:

pkgs.writeShellScriptBin "gpu-fan" ''
  cat /sys/class/hwmon/hwmon3/fan1_input
''

