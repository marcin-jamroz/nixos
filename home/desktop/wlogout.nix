{ config, ... }:

let
  palette = config.lib.stylix.colors;
in
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        "label" = "reboot";
        "action" = "sleep 1; systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "logout";
        "action" = "sleep 1; uwsm stop";
        "text" = "Logout";
        "keybind" = "e";
      }
      {
        "label" = "suspend";
        "action" = "sleep 1; systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "lock";
        "action" = "sleep 1; loginctl lock-session";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "hibernate";
        "action" = "sleep 1; systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];
    style = ''
            * {
              font-family: FontAwesome, sans-serif;
      	background-image: none;
      	transition: 20ms;
            }
            window {
      	background-color: rgba(12, 12, 12, 0.1);
            }
            button {
      	color: #${palette.base06};
              font-size:20px;
              background-repeat: no-repeat;
      	background-position: center;
      	background-size: 25%;
      	border-style: solid;
      	background-color: rgba(${palette.base00-rgb-r}, ${palette.base00-rgb-g}, ${palette.base00-rgb-b}, 0.6); 
      	border: 3px solid #${palette.base05};
              box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            button:focus, button:hover {
                color: #${palette.base0E};
      	  background-color: rgba(${palette.base00-rgb-r},${palette.base00-rgb-g},${palette.base00-rgb-b}, 0.8);
      	  border: 3px solid #${palette.base0E};
            }
            #logout {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/logout.png"));
            }
            #suspend {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/suspend.png"));
            }
            #shutdown {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/shutdown.png"));
            }
            #reboot {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/reboot.png"));
            }
            #lock {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/lock.png"));
            }
            #hibernate {
      	margin: 10px;
      	border-radius: 20px;
      	background-image: image(url("icons/hibernate.png"));
            }
    '';
  };
}
