{ pkgs, ... }:

{
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  musnix.enable = true;

  security.rtkit.enable = true;
}
