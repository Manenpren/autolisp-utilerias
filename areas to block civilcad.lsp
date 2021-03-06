(defun c:areasc ()
  (PROMPT "SELECCIONA los textos")
  (setq gpotext (ssget '((0 . "TEXT"))))
  (SETQ EX (SSNAME GPOtext 0))
  (SETQ CONT1 1)
  (WHILE EX
    (setq texto (CDR (ASSOC 1 (ENTGET EX))))
    (SETQ LONGTXT (STRLEN TEXTO))
    (IF (= (WCMATCH (strcase texto) (strcat "R=" "*")) T) (setq nRS (substr texto 3 (- LONGTXT 2))))
    (IF (= (WCMATCH (strcase texto) (strcat "T.N.=" "*")) T) (setq ntn (substr texto 6 (- LONGTXT 5))))
    (IF (= (WCMATCH (strcase texto) (strcat "AREA DE BASE =" "*")) T) (setq ABASE (substr texto 15 (- LONGTXT 16))))
    (IF (= (WCMATCH (strcase texto) (strcat "AREA DE SUB-BASE =" "*")) T) (setq ASUB (substr texto 20 (- LONGTXT 21))))
    (IF (= (WCMATCH (strcase texto) (strcat "AREA DE TERRAPLEN =" "*")) T) (setq ATERRAP (substr texto 21 (- LONGTXT 22))))
    (IF (= (WCMATCH (strcase texto) (strcat "AREA DE CORTE =" "*")) T) (setq ACORTE (substr texto 16 (- LONGTXT 17))))
    (IF (= (WCMATCH (strcase texto) (strcat "ESTACION " "*")) T) (setq CADENAM (substr texto 10 (- LONGTXT 13))))
    (SETQ EX (SSNAME GPOtext CONT1))
    (SETQ CONT1 (1+ CONT1))
  )
  (SETQ XYZ (GETPOINT "DAME UN PUNTO AL CENTRO DEL AREA: "))
  (COMMAND "INSERT" (strcat ruta "blocks\\AREASCHON") XYZ "0.5" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
  (SETQ EAREAS (ENTLAST))
  (setq bl (entnext EAREAS))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" CADENAM "")
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" NRS "")
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" NTN "")
  (setq bl (entnext BL))
  (setq bl (entnext BL))
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" ACORTE "")
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" ATERRAP "")
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" ABASE "")
  (setq bl (entnext BL))
  (COMMAND "attedit" "" "" "" "" bl "V" "R" ASUB "")
)
