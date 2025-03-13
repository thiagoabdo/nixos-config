{
  config,
  ...
}:{
    home.file = {
      ".config/i3" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/i3/.i3";
        force = true;
      };
      ".i3status.conf" = {
        source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/i3/.i3status.conf";
        force = true;
      };
    };
}
