{ pkgs, lib, ... }:
{
  documentation.dev.enable = true;

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
  programs.neovim.enable = true;
  programs.git.enable = true;
  programs.foot.enable = true;
  programs.starship.enable = true;
  programs.fzf.keybindings = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration = false;
  };

  environment.systemPackages = with pkgs; [
    fd
    ripgrep
    tree-sitter
    gcc
    github-cli
    clang-tools
    man-pages
    git-lfs
    gdb
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
