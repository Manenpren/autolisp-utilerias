(defun C:SEL ()
 (SETQ OPB nil)
 (SETQ L nil)
 (SETQ LAYSE nil)
 (setq PROV (car (entsel "\n Selecciona un elemento del conjunto que deseas selecionar ")))
 (SETQ LAYER (cdr (assoc 8 (entget PROV))))
 (SETQ laysel (GETSTRING "\n Especificar layer o seleccionar todos (U/T) <U>:"))
 (if (= laysel "")
   (setq laysel "U")
   (setq laysel (strcase laysel))
 )
 (IF (= LAYSEL "")
   (SETQ L (GETSTRING (STRCAT "\n LAYER A SELECCIONAR <" LAYER ">:")))
 )
 (if (/= l "")
   (setq layeR L)
 )
 (IF (= "INSERT" (cdr (assoc 0 (entget PROV))))
   (progn
     (SETQ OPB (GETSTRING "El objeto es un block deseas que su escala y nombre se utilicen como filtro de seleccion (S/N) <S> :"))
     (if (= OPB "")
       (setq OPB "S")
       (setq OPB (strcase OPB))
     )
     (IF (= OPB "S")
       (IF (= LAYSEL "U")
         (PROGN
           (SETQ NOMBRE (cdr (assoc 2 (entget PROV))))
           (SETQ ESCALA (cdr (assoc 41 (entget PROV))))
           (SETQ SS (SSGET "X" '((0 . "INSERT") (2 . NOMBRE) (8 . LAYER) (41 . ESCALA))))
         )
         (PROGN
           (SETQ NOMBRE (cdr (assoc 2 (entget PROV))))
           (SETQ ESCALA (cdr (assoc 41 (entget PROV))))
           (SETQ SS (SSGET "X" '((0 . "INSERT") (2 . NOMBRE) (41 . ESCALA))))
         )
       )
     )
   )
 )
)

(DEFUN C:PROV ()
  (SETQ NOMBRE "PUN2")
  (SETQ PROV (STRCAT "'" (CHR 40) (CHR 40) "2 . " (CHR 34) "PUN2" (CHR 34) (CHR 41) (CHR 34)))
;  (SETQ SS (SSGET "X" PROV)
)
