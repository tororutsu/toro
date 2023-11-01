{
  services.keyd = {enable = true;
    config = ''
      [ids]

      *
      
      [main]
      
      # Maps capslock to escape when pressed and control when held.
      capslock = overload(control, esc)
      
      # Remaps the escape key to capslock
      esc = capslock
    '';
  };
}
