# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, options, lib, pkgs, inputs, ... }:

let


in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware.wirelessRegulatoryDatabase = true;
  boot.extraModprobeConfig = ''
    options cfg80211 ieee80211_regdom="US"
  '';

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember";
        user = "greeter";
      };
    };
  };

  networking.hostName = "braydens-laptop"; # Define your hostname.

  networking.wireless.iwd = {
    enable = true;
  };

  networking.openconnect.interfaces.openconnect0 = {
    gateway = "webvpn.purdue.edu";
    protocol = "anyconnect";
    user = "bzee";
    passwordFile = "/var/lib/secrets/openconnect-passwd";
    autoStart = false;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
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

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  services.udev.packages = [ pkgs.openocd ];
  users.groups.plugdev = {};
  
  documentation.dev.enable = false;

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.fprintd.enable = true;
  services.udisks2.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.alice = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  #   packages = with pkgs; [
  #     tree
  #   ];
  # };
  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
	gtk-theme = "Adwaita-dark";
      };
    }
  ];
  programs.dconf.enable = true;

  programs.firefox.enable = true;
  programs.bash = {
    enable = true;
    interactiveShellInit = 
      lib.mkAfter ''
        eval "$(${pkgs.zoxide}/bin/zoxide init bash)"
        ${pkgs.fortune}/bin/fortune -s -n 40
      '';
    shellAliases = {
      cd = "z";
      nix-switch = "sudo nixos-rebuild switch --flake /home/brayden/dotfiles/";
    };
  };
  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.foot.enable = true;
  programs.starship.enable = true;
  programs.fzf.keybindings = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration = false;
  };
  programs.waybar.enable = true;
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  programs.tmux = {
    enable = true;
    keyMode = "vi";
    plugins = [
      pkgs.tmuxPlugins.catppuccin
    ];
    extraConfigBeforePlugins = ''
      set -g @catppuccin_flavor 'mocha'
    '';
  };

  programs.steam.enable = true;

  services.hypridle.enable = true;
  services.dunst.enable = true;

  virtualisation.podman.enable = true;
  virtualisation.podman.dockerCompat = true;

  systemd.user.services.hypridle.path = with pkgs; [
    brightnessctl
  ];
  systemd.user.services.waybar.path = with pkgs; [
    bash
    foot
    impala
    bluetui
  ];

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
  };

  # environment.etc.inputrc.text = ''
  #   ${builtins.readFile <nixpkgs/nixos/modules/programs/bash/inputrc>}
  #   "\e[A": history-search-backward
  #   "\e[B": history-search-forward
  # '';

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    hyprpaper
    hyprcursor
    tree-sitter
    gcc
    playerctl
    brightnessctl
    grimblast
    bluetui
    impala
    papirus-icon-theme
    gnome-themes-extra
    breezex-dark-cursor
    github-cli
    clang-tools
    chromium
    distrobox
    man-pages
    yazi
    hyprpwcenter
    git-lfs
    inputs.hyprpolkitagent.packages.x86_64-linux.default
    inputs.hyprlauncher.packages.x86_64-linux.default
    wl-clipboard
    localsend
    prismlauncher
    usbutils
    gdb
    btop
  ];

  xdg.icons.enable = true;
  xdg.icons.fallbackCursorThemes = [ "Papirus-Dark" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    material-symbols
    material-symbols-rounded-filled
    noto-fonts
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
    	monospace = [ "JetBrainsMonoNL Nerd Font" ];
    	sansSerif = [ "Noto Sans" ];
    	serif = [ "Noto Serif" ];
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["brayden"];
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;


  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 53317 ];
  networking.firewall.allowedUDPPorts = [ 53317 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  security.polkit.enable = true;
  security.polkit.enablePkexecWrapper = true;

  nixpkgs.config.rocmSupport = true;
  systemd.tmpfiles.rules =
    let
      rocmEnv = pkgs.symlinkJoin {
        name = "rocm-combined";
        paths = with pkgs.rocmPackages; [
          rocblas
          hipblas
          clr
        ];
      };
    in
    [
      "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
    ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

