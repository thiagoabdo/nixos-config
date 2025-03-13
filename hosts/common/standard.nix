{pkgs, ...}:{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  programs.zsh.enable = true;
  environment.variables.TERMINAL = "alacritty";
  environment.systemPackages = with pkgs; [
    fzf
    ripgrep
    allacratty
    wget
    git
    curl
  ];

  services.openssh.enable = true;
}
