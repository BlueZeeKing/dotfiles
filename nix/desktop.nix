{ pkgs, inputs, ... }:
{
  services.libinput.enable = true;
  services.fprintd.enable = true;

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;
  services.dunst.enable = true;

  services.hypridle.enable = true;
  systemd.user.services.hypridle.path = with pkgs; [
    brightnessctl
  ];

  programs.waybar.enable = true;
  systemd.user.services.waybar.path = with pkgs; [
    bash
    foot
    impala
    bluetui
  ];

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprcursor
    hyprpwcenter
    inputs.hyprpolkitagent.packages.x86_64-linux.default
    inputs.hyprlauncher.packages.x86_64-linux.default
    wl-clipboard

    playerctl
    brightnessctl
    grimblast
    bluetui
    impala
    yazi
    dragon-drop
  ];

  security.polkit.enable = true;
  security.polkit.enablePkexecWrapper = true;

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
  };
}
