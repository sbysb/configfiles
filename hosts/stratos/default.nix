{ pkgs, ... }:
{
  services.nix-daemon.enable = true;
  #nix.package = pkgs.nixFlakes;

  programs.zsh.enable = true;

  users.users.samuel = {
    name = "samuel";
    home = "/Users/samuel";
  };

  homebrew = {
    enable = true;
    autoUpdate = true;

    casks = [
    ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.samuel = { pkgs, ... }: {
    home = {
      stateVersion = "22.05";
      username = "samuel";
      homeDirectory = "/Users/samuel";

      packages = with pkgs; [
        iosevka
      ];
    };

    fonts.fontconfig.enable = true;

    programs.bat.enable = true;

    programs.helix = {
      enable = true;
      settings = {
        theme = "gruvbox";
        editor = {
          line-number = "relative";
          mouse = false;
          indent-guides = {
            render = true;
          };
        };
      };
    };

    programs.neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
      plugins = with pkgs.vimPlugins; [
        catppuccin-nvim
        indent-blankline-nvim
        nvim-cmp
        vim-nix
        vim-sensible
      ];

      extraConfig = ''
       	colorscheme catppuccin
        set number relativenumber
      '';
    };
  };
}
