(defun C:rotsca ()
    (setq LINEA (car (entsel "Selecciona la linea : ")))
    (setq x1 (cdr (assoc 10 (entget linea))))
    (setq x2 (cdr (assoc 11 (entget linea))))
    (SETQ GPOR (SSADD))
    (PRINT "Selecciona LOS objetoS a rotar :")
    (SETQ GPOR (SSGET))
    (setq PUNTO (getpoint " punto final : "))
    (COMMAND "rotate" GPOR LINEA "" x1 "r" x1 x2 punto)
    (COMMAND "scale" GPOR LINEA "" x1 "r" x1 x2 punto)
)

