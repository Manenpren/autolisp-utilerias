***MENUGROUP=MYMENU

***POP1
[/MMenu1]
[->/MMM conversions]
  [/CCircle]^c^ccim
  [/DDiameter]^c^cdimm
  [<-/iDistance]^c^cdismm
 [->/FFasteners]
  [/CCap Screws...]^c^ccascr
  [/BButon Screws...]^c^cbuscr
  [<-/FFlat Screws...]^c^cflscr

***POP2
[/eMenu2]
  [/MMatch layer]^c^camchla
  [/pMatch Properties]^c^camchpro
  [/SSet layer]^c^camstla
  [/OOffset To current layer]^c^camoffla
  [/CCopy layer]^c^camcpl

;(defun c::startup ()
;  (c:mload)
;)

(defun c:mload ()
  (setq fid (getvar "filedia"))
  (setvar "filedia" 0)
  (command "menuunload" "MYMENU")
  (command "menuload" "menu13")
  (menucmd "p5=+mymenu.pop1")
  (menucmd "p6=+mymenu.pop2")
  (setvar "filedia" fid)
  (princ)
)


