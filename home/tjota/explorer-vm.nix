{ ... }:
{
  imports = [
    ./home.nix
    ../common
    ../features/cli/zsh.nix
    ../features/cli/nvim.nix
    ../features/cli/tmux.nix
    ../features/desktop
    ../features/desktop/browser/firefox.nix
    ../features/desktop/browser/chromium.nix
    ../features/desktop/eyes.nix
    ../features/work
  ];
}
