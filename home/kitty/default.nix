{config, ...}:
{
  programs.kitty = {enable = true;
    shellIntegration.enableBashIntegration = true;
    theme = "Catppuccin-Mocha";
    font = {
      name = "Hack Nerd";  
      size = 10;
    };
    settings = {
      #Windows
      draw_minimal_borders = true;
      tab_title_template =  "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title}{index}";

    };
  };
}
