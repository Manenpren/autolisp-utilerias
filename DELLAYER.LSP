; ********************************************************************
;                           DELLAYER.LSP
                            
;  This program deletes all entities on a specified layer.

; ******************************************************************** 

(defun dellerr (s)                    ; If an error (such as CTRL-C) occurs
                                      ; while this command is active...
   (if (/= s "Function cancelled")
       (princ (strcat "\nError: " s))
   )
   (setq S nil)                       ; Free selection-set if any
   (setvar "CMDECHO" ocmd)            ; Restore saved mode
   (setq *error* olderr)              ; Restore old *error* handler
   (princ)
)

(defun C:DELLAYER1 (/ olderr ocmd L S)

   (setq olderr  *error*
         *error* dellerr)
   (setq ocmd (getvar "CMDECHO"))
   (setvar "CMDECHO" 0)
   (setq e (car (entsel "Selecciona el layer a borrar: ")))
   (setq LAYER (cdr (assoc 8 (entget e))))
   (setq S (ssget "X" (list (cons 8 LAYER))))  ; Get all entities on layer
   (if S
      (command "ERASE" S "")          ; Delete 'em!
      (princ "Layer no existe o el nombre no es valido")
   )
   (setq S nil)                       ; Free selection-set
   (setvar "CMDECHO" ocmd)            ; Restore saved mode
   (setq *error* olderr)              ; Restore old *error* handler
   (princ)
)

