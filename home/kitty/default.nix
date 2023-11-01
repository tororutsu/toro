{config, ...}:
{
  programs.kitty = {enable = true;
    shellIntegration.enableBashIntegration = true;
    theme = "Catppuccin-Mocha";
  };
}
