(defun C:SYMIN ( )
  (setq sym 
    (getstring 
      "\nEnter symbol name: ")   ; Prompts for a symbol name
  ) 
  (menucmd "s=symsize")          ; Switches the screen menu 
                                 ;  to the symsize submenu 
  (setq 
    siz (getreal 
      "\nSelect symbol size: ")  ; Prompts for a symbol size
    p1 (getpoint 
      "\nInsertion point: ")     ; Prompts for insertion point
  ) 
  (command "insert"              ; Issues the INSERT command
    sym                          ;  using the desired symbol
    p1 siz siz 0)                ;  insertion point, and size
  (menucmd "s=")                 ; Switches to the previous
                                 ;  screen menu
  (princ)                        ; Exits quietly 
)
