# Visual Tcl is executed in a 'slave' interpreter.

visual.tcl <- function() {
  tkeval("set vtcl [interp create]")
  on.exit(tkeval("interp delete $vtcl;unset vtcl"))
  tkeval("$vtcl eval {load {} Tk}")
  tkeval("$vtcl eval {set argc 1;set argv R}")
  tkeval("$vtcl alias R R")
  tkeval("$vtcl alias exit exit")
  vtcl <- system.file("visual.tcl/vt.tcl",pkg="vtcl")
  vtclL <- nchar(vtcl);
  vtclH <- substr(vtcl,1,vtclL-7);
  tkeval(paste("$vtcl eval {set env(VTCL_HOME) ",vtclH,"}"))
  tkeval(paste("$vtcl eval {source ",vtcl,"}"))
  tkloop()
}

.First.lib <- function(p,l) require("tcltk")
  
  
