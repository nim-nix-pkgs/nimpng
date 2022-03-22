{
  description = ''PNG encoder and decoder'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-nimPNG-master.flake = false;
  inputs.src-nimPNG-master.owner = "jangko";
  inputs.src-nimPNG-master.ref   = "master";
  inputs.src-nimPNG-master.repo  = "nimPNG";
  inputs.src-nimPNG-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-nimPNG-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-nimPNG-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}