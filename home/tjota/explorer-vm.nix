{ ... }:
{
  imports = [
    ./home.nix
    ../common
    ../features/cli/zsh.nix
    ../features/cli/nvim.nix
    ../features/cli/tmux.nix
    ../features/desktop
    ../features/desktop/eyes.nix
    ../features/work
  ];
}
