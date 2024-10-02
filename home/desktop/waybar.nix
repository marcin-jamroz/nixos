{ pkgs, config, lib, host, ... }:

let
  palette = config.colorScheme.palette;
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in with lib; {
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [{
      layer = "top";
      position = "top";

      modules-center = [ 
        "clock"
      ];
      modules-left = [ 
        # "custom/startmenu" 
        "hyprland/workspaces"
        "hyprland/window" 
      ];
      modules-right = [ 
        "tray"
        "cpu"
        "temperature#cpu"
        "custom/cpu_fan"
        "custom/gpu_usage"
        "temperature#gpu"
        "custom/gpu_fan"
        "memory"
       # "network" 
        "pulseaudio"
        "custom/hyprbindings"
        "hyprland/language" 
       # "custom/themeselector"
       # "battery"
        "idle_inhibitor"
        "custom/notification"
        "custom/exit"
       ];

      "hyprland/workspaces" = {
      	format = "{name}";
      	format-icons = {
          default = " ";
          active = " ";
          urgent = " ";
      	};
      	on-scroll-up = "hyprctl dispatch workspace m+1";
      	on-scroll-down = "hyprctl dispatch workspace m-1";
      };
      clock = {
        format = "{:%H:%M %d.%m.%Y}";
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          on-scroll = 1;
          format = {
            months = "<span color='#${palette.base0C}'><b>{}</b></span>";
            days = "<span color='#${palette.base0B}'><b>{}</b></span>";
            weekdays = "<span color='#${palette.base0D}'><b>{}</b></span>";
            today = "<span color='#${palette.base08}'><b><u>{}</u></b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-click-middle = "shift_reset";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };
      "cpu" = {
      	interval = 10;
      	format = " {usage}%";
        tooltip = true;
      };
      "temperature#cpu" = {
        hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
      };
      "custom/cpu_fan" = {
        interval = 10;
        format = "{}r";
        exec = "cpu-fan";
      };
      "custom/gpu_usage" = {
        interval = 10;
        format = "󰖺 {}%";
        exec = "cat /sys/class/hwmon/hwmon6/device/gpu_busy_percent";
      };      
      "temperature#gpu" = {
        hwmon-path = "/sys/class/hwmon/hwmon6/temp2_input";
      };
      "custom/gpu_fan" = {
        interval = 10;
        format = "{}r";
        exec = "cat /sys/class/hwmon/hwmon6/fan1_input";
      };     
      "hyprland/window" = {
      	max-length = 25;
        separate-outputs = false;
        rewrite = { "" = " 🙈 No Windows? "; };
      };
      "hyprland/language" = {
        format-en = "us";
        format-pl = "pl";
      };
      "memory" = {
      	interval = 10;
      	format = " {}%";
        tooltip = true;
      };
      "disk" = {
        format = " {free}";
        tooltip = true;
      };
      "network" = {
        format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        format-ethernet = " {bandwidthDownOctets}";
        format-wifi = "{icon} {signalStrength}%";
        format-disconnected = "󰤮";
        tooltip = false;
      };
      "tray" = {
        reverse-direction = true;
        spacing = 10;
        show-passive-items = true;
      };
      "pulseaudio" = {
        format = "{icon} {volume}% {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = " {volume}%";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          portable = "";
          car = "";
          default = ["" "" ""];
        };
        on-click = "sleep 0.1 && pavucontrol";
      };
     # "custom/themeselector" = {
     #   tooltip = false;
     #   format = "";
     #   on-click = "sleep 0.1 && theme-selector";
     # };
      "custom/exit" = {
        tooltip = false;
        format = "";
        on-click = "sleep 0.1 && wlogout";
      };
      "custom/startmenu" = {
        tooltip = false;
        format = "";
        # exec = "rofi -show drun";
        on-click = "sleep 0.1 && rofi-launcher";
      };
      "custom/hyprbindings" = {
        tooltip = false;
        format = "";
        on-click = "sleep 0.1 && list-hypr-bindings";
      };
      "idle_inhibitor" = {
        format = "{icon}";
        format-icons = {
            activated = "";
            deactivated = "";
        };
        tooltip = "true";
      };
      "custom/notification" = {
        tooltip = false;
        format = "{icon} {}";
        format-icons = {
          notification = "<span foreground='red'><sup></sup></span>";
          none = "";
          dnd-notification = "<span foreground='red'><sup></sup></span>";
          dnd-none = "";
          inhibited-notification = "<span foreground='red'><sup></sup></span>";
          inhibited-none = "";
          dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
          dnd-inhibited-none = "";
       	};
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "sleep 0.1 && task-waybar";
        escape = true;
      };
      #"battery" = {
      #  states = {
      #    warning = 30;
      #    critical = 15;
      #  };
      #  format = "{icon} {capacity}%";
      #  format-charging = "󰂄 {capacity}%";
      #  format-plugged = "󱘖 {capacity}%";
      #  format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      #  on-click = "";
      #  tooltip = false;
      #};
    }];
    style = concatStrings [''
      * {
	font-size: 16px;
	font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
    	font-weight: bold;
      }
      window#waybar {
	background-color: #${palette.base00};
	border-bottom: 1px solid rgba(26,27,38,0);
	border-radius: 0px;
	color: #${palette.base0F};
      }
      #workspaces {
	background: #${palette.base01};
	margin: 2px;
	padding: 0px 1px;
	border-radius: 15px;
	border: 0px;
	font-style: normal;
	color: #${palette.base00};
      }
      #workspaces button {
	  padding: 0px 5px;
	  margin: 4px 3px;
	  border-radius: 10px;
	  border: 0px;
	  color: #${palette.base00};
          background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
          background-size: 300% 300%;
          animation: gradient_horizontal 15s ease infinite;
	  opacity: 0.5;
          transition: ${betterTransition};
      }
      #workspaces button.active {
	  padding: 0px 5px;
	  margin: 4px 3px;
	  border-radius: 10px;
	  border: 0px;
	  color: #${palette.base00};
          background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
          background-size: 300% 300%;
          animation: gradient_horizontal 15s ease infinite;
          transition: ${betterTransition};
	  opacity: 1.0;
	  min-width: 40px;
      }
      #workspaces button:hover {
	  border-radius: 10px;
	  color: #${palette.base00};
          background: linear-gradient(45deg, #${palette.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
          background-size: 300% 300%;
          animation: gradient_horizontal 15s ease infinite;
	  opacity: 0.8;
          transition: ${betterTransition};
      }
      @keyframes gradient_horizontal {
	0% {
	  background-position: 0% 50%;
	}
	50% {
	  background-position: 100% 50%;
	}
	100% {
	  background-position: 0% 50%;
	}
      }
      @keyframes swiping {
        0% {
	  background-position: 0% 200%;
	}
	100% {
	  background-position: 200% 200%;
	}
      }
      tooltip {
	background: #${palette.base00};
	border: 1px solid #${palette.base0E};
	border-radius: 10px;
      }
      tooltip label {
	color: #${palette.base07};
      }
      #window {
	  margin: 4px;
	  padding: 2px 10px;
	  color: #${palette.base05};
	  background: #${palette.base01};
	  border-radius: 10px;
      }
      #memory {
   	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #clock {
    	color: #${palette.base01};
        background: linear-gradient(45deg, #${palette.base0C}, #${palette.base0F}, #${palette.base0B}, #${palette.base08});
        background-size: 300% 300%;
        animation: gradient_horizontal 15s ease infinite;
	margin: 4px;
	padding: 4px 10px 2px 10px;
	border-radius: 10px;
      }
      #cpu {
    	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px 0px 4px 4px;
	padding: 2px 0px 2px 10px;
	border-radius: 10px 0px 0px 10px;
      }
      #temperature.cpu {
    	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px 0px;
	padding: 2px 4px;
	border-radius: 0px;
      }
      #custom-cpu_fan {
    	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px 4px 4px 0px;
	padding: 2px 10px 2px 0px;
	border-radius: 0px 10px 10px 0px;
      }    
      #custom-gpu_usage {
    	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px 0px 4px 4px;
	padding: 2px 0px 2px 10px;
	border-radius: 10px 0px 0px 10px;
      }
      #temperature.gpu {
    	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px 0px;
	padding: 2px 4px;
	border-radius: 0px;
      }
      #custom-gpu_fan {
    	color: #${palette.base0A};
	background: #${palette.base01};
	margin: 4px 4px 4px 0px;
	padding: 2px 10px 2px 0px;
	border-radius: 0px 10px 10px 0px;
      }
      #disk {
    	color: #${palette.base03};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #battery {
    	color: #${palette.base08};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #network {
    	color: #${palette.base09};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #tray {
    	color: #${palette.base05};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #pulseaudio {
    	color: #${palette.base0C};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #custom-notification {
    	color: #${palette.base0D};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #custom-themeselector {
    	color: #${palette.base0D};
	background: #${palette.base01};
	margin: 4px 0px;
	padding: 2px 10px 2px 5px;
	border-radius: 0px 10px 10px 0px;
      }
      #custom-startmenu {
    	color: #${palette.base00};
        background: linear-gradient(45deg, #${palette.base09}, #${palette.base03}, #${palette.base0C}, #${palette.base07});
        background-size: 300% 300%;
        animation: gradient_horizontal 15s ease infinite;
	margin: 4px;
	padding: 2px 10px;
	border-radius: 10px;
      }
      #custom-hyprbindings {
    	color: #${palette.base0E};
	background: #${palette.base01};
	margin: 4px 0px 4px 4px;
	padding: 2px 8px 2px 8px;
	border-radius: 10px 0px 0px 10px;
      }
      #language {
      	color: #${palette.base0E};
	background: #${palette.base01};
	margin: 4px 4px 4px 0px;
  	padding: 2px 6px 2px 8px;
	border-radius: 0px 10px 10px 0px;
      }
      #idle_inhibitor {
    	color: #${palette.base0B};
	background: #${palette.base01};
	margin: 4px;
	padding: 2px 15px 2px 8px;
	border-radius: 10px;
      }
      #custom-exit {
    	color: #${palette.base08};
	background: #${palette.base01};
	border-radius: 0px;
	margin-left: 4px;
	padding: 2px 12px 2px 10px;
      } ''
    ];
  };
}

