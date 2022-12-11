{ self, pkgs, lib, ... }:

let
  wallpapers = ../../wallpapers;
in
{
  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;

    extraConfigEarly = ''
      bspc monitor -d 1 2 3 4 5

      bspc config window_gap 25

      bspc config normal_border_color "#282643"
      bspc config active_border_color "#312a59"
      bspc config focused_border_color "#df588e"

      bspc config automatic_scheme spiral
    '';

    #settings = { };

    #rules = { };

    startupPrograms = [
      "systemctl --user restart polybar.service"
      "feh --bg-scale ${wallpapers}/eva01.png"
    ];

    #extraConfig = '''';

  };
}
