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

(defun C:DELLAYER (/ olderr ocmd L S)

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

; MLAYER.LSP
; ESTE PROGRAMA MUEVE UN LAYER CON TODOS LOS OBJETOS EXISTENTES
; EN ESA CAPA O LO ROTA SEGUN SEA EL COMANDO.

   ;  Û²±°   COMANDOS   °±²Û
;  ³ RL = ROTA LAYER  ³
;  ³ ML = MUEVE LAYER ³

(defun c:ml1 ()
   (setq e (car (entsel "Selecciona el layer a mover: ")))
   (setq LAYER (cdr (assoc 8 (entget e))))
   (setq S (ssget "X" (list (cons 8 LAYER))))  ; Get all entities on layer
   (COMMAND "MOVE" )
   (if S
      (command  S )
      (princ "Layer no existe o el nombre no es valido")
   )
    (command "")
)

(defun c:rl1 ()
   (setq e (car (entsel "Selecciona el layer a rotar: ")))
   (setq pun (getpoint "Base en donde rotar : "))
   (setq pun2 (getpoint " Referencia :"))
   (setq pun3 (getpoint " Nuevo angulo :"))
   (setq LAYER (cdr (assoc 8 (entget e))))
   (setq S (ssget "X" (list (cons 8 LAYER))))  ; Get all entities on layer
   (COMMAND "ROTATE" )
   (if S
      (command S )          
      (princ "Layer no existe o el nombre no es valido")
   )
   (command "")          
   (command PUN "R" PUN PUN2 PUN3 )          
)


