(defun c:INSERTA5 ()
  (COMMAND "VIEW" "S" "C")
    (setq texto (car (entsel "Selecciona la cota: ")))
    (setq texto2 (car (entsel "Selecciona EL TEXTO DE ELEVACION: ")))
    (setq texto3 (car (entsel "Selecciona EL TEXTO CON EL TIPO DE SECCION: ")))
    (setq COTA (cdr (assoc 1 (entget TEXTO))))
    (setq ELEV (cdr (assoc 1 (entget TEXTO2))))
    (setq SEC (cdr (assoc 1 (entget TEXTO3))))
    (setq xy (strcat "0, " ELEV))
    (COMMAND "ZOOM" "C" XY "20")
    (COMMAND "INSERT" SEC XY "" "" "")
  (COMMAND "EXPLODE" (ENTLAST) "")
  (SETQ GPOa (SSGET "P"))
    (COMMAND "CHANGE" "P" "" "P" "LA" "PROYECTO" "CO" "BYLAYER" "")
    (COMMAND "LAYER" "S" "0" "")
    (COMMAND "INSERT" (STRCAT "*" COTA) "0,0" "" "" "")    
  (SETQ X (ENTLAST))
  (COMMAND "EXPLODE" X "")
    (COMMAND "CHANGE" TEXTO TEXTO2 TEXTO3 "" "P" "C" "YELLOW" "")
    (C:MB)
    (COMMAND "VIEW" "R" "C" )
)

(defun brlayer (layer)
  (SETQ P 0)
  (SETQ GPOP (SSADD))
  (SETQ PROV (SSNAME GPOA P))
  (WHILE (/= PROV NIL)
    (SETQ P (1+ P))
    (SETQ PROV (SSNAME GPOA P))
    (IF (/= PROV NIL)
      (IF (= (cdr (assoc 8 (entget PROV))) LAYER)
        (PROGN
         (SETQ GPOP (SSADD PROV))
         (SSDEL PROV GPOA)
         (SETQ P (1- P))
        )
      )
    )
  )
  (COMMAND "ERASE" GPOP "")
)