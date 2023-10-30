{ config, pkgs, ... }:

{
  imports = [
    ./herbst
    ./qutebrowser
    #./autorandr
  ];

  home.username = "rj";
  home.homeDirectory = "/home/rj";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.kitty
    pkgs.keepassxc
    pkgs.dmenu-rs
    pkgs.clipboard-jh

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "Monoid" "FiraCode" "Hack" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # Bash
  programs.bash = {enable = true;
    sessionVariables = {
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
    };
    shellAliases = {
      ".." = "cd ../";
      "vim" = "nvim";
      "hmup" = "home-manager switch --flake .#rj@toro";
      "nixup" = "sudo nixos-rebuild switch --flake .#toro";
    };
  };
  # Bash prompt
  programs.starship.enable = true;
  # Git
  programs.git = {enable = true;
    userName = "tororutsu";
    userEmail = "rjahrj@gmail.com";
  };
}