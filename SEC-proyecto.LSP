(defun C:creaproy ()
  (SETQ ANCHOCORONA "7")
  (SETQ ANCHOcalzada "6.5")
  (SETQ derechovia "20")
  (SETQ PROFCUN "0.5")
  (SETQ TALUDC "0.5")
  (SETQ TALUDT "1.5")
  (SETQ TALUDCU "1.5")
  (setq dcl_id (load_dialog (strcat ruta "dialogos\\seccion proyecto.dcl"))) ; Load the DCL file.
  (if (not (new_dialog "SECP" dcl_id))   ; Initialize the dialog.
    (exit)                                ; Exit if this doesn't 
                                          ; work.
  )
  (set_TILE "anchocr" anchoCORONA)
  (set_TILE "anchoc" anchoCALZADA)
  (set_TILE "derecho" DERECHOVIA)
  (set_TILE "profun" profcun)
  (set_TILE "profun" profcun)
  (action_tile "actualiza" "(dibujo)")
  (action_tile "ancho" "(var)")
  (action_tile "scad" "(var2)")
  (action_tile "reticula" "(exa)")
  (action_tile "capas" "(exa2)")
  (action_tile "cfgf" "(exa3)")
  (action_tile "save" "(exa4)")
  (action_tile "colores" "(exa5)")
  (action_tile "accept" "(aceptas)")
  (start_dialog)                          ; Display the dialog 
                                          ; box.
  (unload_dialog dcl_id)                  ; Unload the DCL file.
  (princ)
)