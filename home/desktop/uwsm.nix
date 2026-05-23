{ ... }:
{
  home.file.".config/uwsm/env".text = ''
    # Toolkit backends
    export GDK_BACKEND=wayland
    export CLUTTER_BACKEND=wayland
    export SDL_VIDEODRIVER=x11
    export MOZ_ENABLE_WAYLAND=1

    # Qt configuration
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
  '';
}
