{ pkgs, ... }:
{
  home.packages = with pkgs; [
    tenv
    glab
    gh
    kubernetes-helm
    kubectl
    k9s
    cloudlens
    slack
  ];
}
