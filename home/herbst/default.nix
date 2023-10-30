{config, lib, pkgs, ...}:
let
  # A list is used because it preserves ordering
  tags = [
    { name = "tag 1"; key = "term"; }
    { name = "tag 2"; key = "browser";}
    #...
  ];
  # Attribute set of { <keybind> = "use <tag>"; }
  keybinds = let
    tagsWithKeybinds = lib.filter (lib.hasAttr "key") tags;
  in lib.listToAttrs (map (x: lib.nameValuePair x.key "use ${x.name}") tagsWithKeybinds);
in
{
  xsession = {enable = true;
    windowManager.herbstluftwm = {enable = true;
      tags = lib.catAttrs "name" tags;
      keybinds = {
        #{keybinds}:
	#Control
        Mod4-Shift-q = "quit";
        Mod4-Shift-r = "reload";
	Mod4-Shift-c = "close";
	#Spawn
        Mod4-Return = "spawn kitty"; 
	Mod4-w = "spawn qutebrowser";
	#Movement
	Mod4-c = "cycle";
	Mod4-Tab = "cycle_all +1";
	Mod4-Shift-Tab = "cycle_all -1";
	Mod4-h = "focus left";
	Mod4-l = "focus right";
	Mod4-j = "focus down";
	Mod4-k = "focus up";
	Mod4-Shift-h = "shift left";
	Mod4-Shift-l = "shift right";
	Mod4-Shift-j = "shift down";
	Mod4-Shift-k = "shift up";
	#Layout
	Mod4-r = "remove";
	Mod4-space = "cycle_layout +1";
	Mod4-u = "split vertical 0.5";
	Mod4-o = "split horizontal 0.5";
	Mod4-f = "fullscreen toggle";
	Mod4-Shift-f = "floating toggle";
      };
    };
  };
}
