(defun C:convierte ()
;   (setq LW (ssget "x"))
;   (COMMAND "EXPLODE" LW "")
   (setq gpoxl (ssadd))
   (setq nl 0)
   (setq llave "1")
   (setq prov 0)
   (setq lineas (ssget "x" '((0 . "LINE"))))
   (WHILE LINEAS
     (setq ARCOS (ssget "x" '((0 . "ARC"))))
     (if (= ARCOS NIL)
       (COMMAND "PEDIT" (SSNAME LINEAS 0) "Y" "J" LINEAS "" "")
       (COMMAND "PEDIT" (SSNAME LINEAS 0) "Y" "J" LINEAS ARCOS "" "")
     )
     (setq entp (entlast))
     (setq vert (vertice entp 3))
     (if (= vert nil)
       (ssadd entp gpoxl)
     )
;     (IF (> (SSLENGTH LINEAS) 1000)
;       (COMMAND "DELAY" (rtos (* (SSLENGTH LINEAS) 0.025) 2 0))
;       (setq prov 1)
;     )
;     (if (and (= llave "1") (= prov 1))
;       (Progn
;         (setq llave "2")
;         (command "qsave")
;         (COMMAND "DELAY" "300")
;       )
;     )
;     (if (> nl 50)
;       (Progn
;         (setq nl 0)
;         (command "qsave")
;         (COMMAND "DELAY" "300")
;       )
;     )
     (setq lineas (ssget "x" '((0 . "LINE"))))
     (setq nl (1+ nl))
   )
;   (setq prov 0)
;   (setq lin (ssname gpoxl prov))
;   (while lin 
;     (command "explode" lin)
;     (setq prov (1+ prov))
;     (setq lin (ssname gpoxl prov))
;   )
   (command "purge" "all" "" "n")
   (command "qsave")
;   (command "quit")
)

(defun vertice (poli nov)
  (setq listap (entget poli))
  (setq nver 0)
  (setq salir "N")
  (while (= salir "N")
    (setq sublisp (car listap))
    (if (= 10 (car sublisp))
      (progn
        (setq punto (cdr sublisp))   
        (setq nver (+ nver 1))
      )
    )
    (setq listap (cdr listap))
    (if listap
      (setq salir "N")
      (setq salir "S")
    )
    (if (= nov nver)
      (setq salir "S")
    )
  )
  (if (not listap)
    (setq punto nil)
  )
  (setq punto punto)
)

