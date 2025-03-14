{ pkgs, config, ... }:
{
  imports = [ ];

  home.packages = with pkgs; [
    coreutils
    fd
    htop
    httpie
    jq
    procs
    ripgrep
    tldr
    zip
    zsh
    zoxide
  ];
  home.file = {
    ".zshrc" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/zsh/.zshrc";
      force = true;
    };
    ".p10k.zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tjota/nixos-config/dotfiles/zsh/.p10k.zsh";
      force = true;
    };
  };
}
