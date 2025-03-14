{ config, ... }:
{
  home.file = {
    ".config/tmux" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/tmux/.config/tmux";
      force = true;
    };
    ".local/scripts/tmux-sessionizer" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/private_scripts/.local/scripts/tmux-sessionizer";
      force = true;
    };
  };
}
