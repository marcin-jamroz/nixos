{ pkgs }:

pkgs.writeShellScriptBin "cpu-fan" ''
  cat /sys/class/hwmon/hwmon1/fan1_input
''
