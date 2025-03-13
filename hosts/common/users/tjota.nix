{...}:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "tjota";

  nix.settings.trusted-users = ["root" "tjota"];

}
