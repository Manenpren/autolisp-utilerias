; SBLOCK.LSP
; SBLOCK.LSP
; ESTE PROGRAMA ESCALA TODOS LOS BLOCKS EXISTENTES CON EL NOMBRE Y TAMA¥O
; DEL BLOCK SELECCIONADO

   ;  Û²±°   COMANDO   °±²Û
;  ³ SBLOCK = ESCALA BLOCK ³

(defun c:sbl ()
        (command "undo" "m")
        (setq e (car (entsel "Selecciona el bloque a escalar: ")))
        (while (/= "INSERT" (cdr (assoc 0 (entget E))))
          (if (/= "INSERT" (cdr (assoc 0 (entget E))))
            (progn   
              (ALERT "\nEl objeto debe ser un block ")
              (setq E (car (entsel "\n Selecciona el bloque: ")))
            )
          )
        )
        (setq NOMBRE (cdr (assoc 2 (entget e))))
        (setq fs (cdr (assoc 41 (entget e))))
        (setq FSN (getreal "Dame el porcentaje de escalamiento nuevo: "))
        (setq gpo (ssget "X" (list (cons 0 "INSERT") (cons 2 nombre) (cons 41 fs))))  ; Get all entities on layer
        (setq ele2 0)
        (setq E (ssname gpo ele2))
        (while E
          (setq XYZ (cdr (assoc 10 (entget E))))
;          (command "ROTATE" (cdr (assoc -1 (entget E))) "" XYZ "90")
          (command "SCALE" (cdr (assoc -1 (entget E))) "" XYZ FSN)
          (setq ele2 (1+ ele2))
          (setq E (ssname gpo ele2))
        )
)
