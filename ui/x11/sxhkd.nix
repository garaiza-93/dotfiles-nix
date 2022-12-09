{ self, pkgs, lib, ... }:

let
  appmenu = "rofi -show run";
  terminal = "kitty";
in
{
  services.sxhkd = {
    enable = true;

    keybindings = {
      "Super" = "${appmenu}";
      "Alt + Enter" = "${terminal}";
    };
  };
}
