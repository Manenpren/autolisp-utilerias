(DEFUN INTPOL (POL VERT1)
  (C:LIBRERIA "VERTICES DE UNA LWPOLYLINE")
  (SETQ VX1 (CAR VERT1))
  (SETQ VY1 (CADR VERT1))
      (SETQ CONTINT 0)
      (SETQ VERTINT (VERTICE POL 0))
      (setq vertinig vertint)
      (SETQ CONTVERT 1)
      (WHILE VERTINT
        (SETQ VERTINT2 VERTINT)
        (SETQ VERTINT (VERTICE POL CONTVERT))
        (IF (/= VERTINT NIL)
          (PROGN
            (SETQ IX1 (CAR VERTINT2))
            (SETQ IY1 (CADR VERTINT2))
            (SETQ IX2 (CAR VERTINT))
            (SETQ IY2 (CADR VERTINT))
            (IF (OR (AND (> VX1 IX2) (< VX1 IX1)) (AND (< VX1 IX2) (> VX1 IX1)))
              (PROGN   
                (SETQ YECUACION (+ (* (/ (- IY1 IY2) (- IX1 IX2)) (- VX1 IX1)) IY1))
                (IF (> YECUACION VY1) 
                  (progn
                    (SETQ CONTINT (1+ CONTINT))
;                    (SETQ XYZX (list 10 vx1 yecuacion 0))
;                    (ENTMAKE (LIST '(0 . "POINT") '(8 . "0") XYZX))
                  )
                )
              )
            );IF
            (SETQ CONTVERT (1+ CONTVERT))
          );PROGN
        );IF
      );WHILE
      (SETQ VERTINT VERTINT2)
      (SETQ IX2 (CAR VERTinig))
      (SETQ IY2 (CADR VERTinig))
      (SETQ IX1 (CAR VERTINT))
      (SETQ IY1 (CADR VERTINT))
      (IF (OR (AND (> VX1 IX2) (< VX1 IX1)) (AND (< VX1 IX2) (> VX1 IX1)))
        (PROGN   
          (SETQ YECUACION (+ (* (/ (- IY1 IY2) (- IX1 IX2)) (- VX1 IX1)) IY1))
                (IF (> YECUACION VY1) 
                  (progn
                    (SETQ CONTINT (1+ CONTINT))
;                    (SETQ XYZX (list 10 vx1 yecuacion 0))
;                    (ENTMAKE (LIST '(0 . "POINT") '(8 . "0") XYZX))
                  )
                )
        )
      );IF
  (SETQ VARX (/ CONTINT 2.000))
  (SETQ VARX2 (FIX (/ CONTINT 2.000)))
  (IF (OR (= VARX VARX2) (= CONTINT 0))
    (SETQ TIPON "PAR")
    (SETQ TIPON "IMPAR")
  )
)
