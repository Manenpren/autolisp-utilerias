(DEFUN C:NX ()
  (C:LIBRERIA "BUSCA VALOR DE ATRIBUTO")
  (setq e (car (entsel "Selecciona el bloque")))
  (setq elev (BUSATR E "ELEV"))
  (SETQ ELEV (- ELEV 0.100))
  (setq bl (entnext E))
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" ELEV "")
)