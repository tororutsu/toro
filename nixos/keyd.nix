{
  services.keyd = {enable = true;
    ids = ["*"];
    settings = {
      main = {
	capslock = "overload(control, esc)";
      };
    };
  };
}
