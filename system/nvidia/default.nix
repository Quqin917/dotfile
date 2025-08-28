{ pkgs, config, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Loads Nvidia dedicated driver and Inter integrated driver
  services.xserver = {
    videoDrivers = [ "modesetting" "nvidia" ];
  };

  hardware.nvidia = { 
    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidiaSettings = true;

    modesetting.enable = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };

    powerManagement = {
      enable = true;
      finegrained = true;
    };
  };
}
