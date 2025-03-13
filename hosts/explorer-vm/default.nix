{ inputs, outputs, config, pkgs, ...} : 
{
  imports = [ 
    ../common 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    ../common/standard.nix
    ../common/window_manager/i3.nix
    ../common/users/tjota.nix
  ];

  users.users.tjota = {
    isNormalUser = true;
    description = "Thiago";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.tjota =
      import ../../home/tjota/${config.networking.hostName}.nix;
  };
}
