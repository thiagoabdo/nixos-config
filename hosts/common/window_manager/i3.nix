{pkgs, ...}:
{
  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    xkb = {
      layout = "br";
      variant = "nodeadkeys";
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
          i3status # gives you the default i3 status bar
          i3lock #default i3 screen locker
      ];
    };
    windowManager.i3.package = pkgs.i3-gaps;
  };
  services.displayManager.defaultSession = "none+i3";

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
    ];
  };

}
