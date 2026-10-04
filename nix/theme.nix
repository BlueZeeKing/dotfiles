{ pkgs, ... }:
{
  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings."org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          gtk-theme = "Adwaita-dark";
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    gnome-themes-extra
    breezex-dark-cursor
  ];

  xdg.icons = {
    enable = true;
    fallbackCursorThemes = [ "Papirus-Dark" ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      material-symbols
      material-symbols-rounded-filled
      noto-fonts
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [ "JetBrainsMonoNL Nerd Font" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
      };
    };
  };
}
