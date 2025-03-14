{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    cargo
    go
    gcc
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/nvim/.config/nvim";
      force = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
