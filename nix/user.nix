{ pkgs, ... }:
{
  time.timeZone = "America/New_York";

  environment.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "foot";
    MANPAGER = "nvim +Man!";
  };

  users.users.brayden = {
    isNormalUser = true;
    description = "Brayden";
    extraGroups = [ "wheel" "plugdev" "dialout" ];
    shell = pkgs.bash;
    home = "/home/brayden";
  };
}
