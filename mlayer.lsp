; MLAYER.LSP
; ESTE PROGRAMA MUEVE UN LAYER CON TODOS LOS OBJETOS EXISTENTES
; EN ESA CAPA O LO ROTA SEGUN SEA EL COMANDO.

   ;  Û²±°   COMANDOS   °±²Û
;  ³ RL = ROTA LAYER  ³
;  ³ ML = MUEVE LAYER ³

(defun c:ml ()
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

(defun c:rl ()
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

