{config, lib, pkgs, ...}:
let
  # A list is used because it preserves ordering
  tags = [
    { name = "term"; key = "1"; }
    { name = "browser"; key = "2";}
    { name = "code"; key = "3";}
    { name = "prod"; key = "4";}
    { name = "discord"; key = "5";}
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
      extraConfig = ''
        herbstclient detect_monitors
      '';
      keybinds = {
        #{keybinds}:
	#Control
        Mod4-Shift-q = "quit";
        Mod4-Shift-r = "reload";
	Mod4-Shift-c = "close";
	Mod4-BackSpace = "cycle_monitor";
	#Spawn
        Mod4-Return = "spawn kitty"; 
	Mod4-w = "spawn qutebrowser";
	Mod4-d = "spawn dmenu_run";
	# Tags
	Mod4-1 = "use term";
	Mod4-2 = "use browser";
	Mod4-3 = "use code";
	Mod4-4 = "use prod";
	Mod4-5 = "use discord";
	Mod4-Shift-1 = "move term";
	Mod4-Shift-2 = "move browser";
	Mod4-Shift-3 = "move code";
	Mod4-Shift-4 = "move prod";
	Mod4-Shift-5 = "move discord";
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
