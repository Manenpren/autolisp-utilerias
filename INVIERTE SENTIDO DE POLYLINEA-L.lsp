(defun C:INVPOL ()
    (SETQ LIN (CAR (ENTSEL "\n SELECCIONA LA LINEA A INVERTIR")))
    (setq f 0)
    (SETQ VERY "")
    (while verY
       (setq f (1+ f))
       (SETQ VERY (vertice lin f)) 
    )
    (COMMAND "PLINE")
    (setq f (1- f))
    (SETQ VERY (vertice lin f)) 
    (while verY
       (IF (and (/= VERY NIL) (/= very verx))
          (COMMAND VERY)  
       )
       (setq f (1- f))
       (setq verx very)
       (SETQ VERY (vertice lin f)) 
    )
    (COMMAND "")
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