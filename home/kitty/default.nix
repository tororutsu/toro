{config, ...}:
{
  programs.kitty = {enable = true;
    shellIntergration.enableBashIntegration = true;
    kitty.theme = "Catppuccin-Mocha";
  };
}
