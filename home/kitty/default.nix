{config, ...}:
{
  programs.kitty = {enable = true;
    shellIntegration.enableBashIntegration = true;
    theme = "Catppuccin-Mocha";
    font = {
      name = "Hack Nerd";  
      size = 20;
    };
  };
}
