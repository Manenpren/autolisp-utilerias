(defun SUMA (punto xx yy)
  (setq x (car punto))
  (setq y (car (cdr punto)))
  (setq xxx (+ x xx))
  (setq yyy (+ y yy))
  (list xxx yyy)
)

(defun DatC (linea nudato)
  (setq cuen 0)
  (setq cuecom 0)
  (setq salir "N")
  (setq cadena "")
  (while (/= salir "S")
    (setq cuen (+ cuen 1))
    (setq caracter (substr linea cuen 1))
    (if (= caracter ",")
      (setq cuecom (+ cuecom 1))
    )
    (if (= cuecom (- nudato 1))
      (if (/= caracter ",")
        (setq cadena (strcat cadena caracter))
      )
    )
    (if (or (= cuecom nudato) (>= cuen (strlen linea)))
      (setq salir "S")
    )
  )
  (setq cadena cadena)
)


(defun c:clr ()
  (setq ent (car (entsel "Selecciona la linea de frontera: ")))
  (setq pun (getpoint " Punto de control para desplazamiento de Offset: "))
  (setq ppun (getpoint " Punto en area para medición de superficies: "))
  (if (= sep3 nil) (setq sep3 1))
  (setq sep2 (getreal (strcat " Separación de inicio: <" (rtos sep3) ">")))
  (if (/= sep2 nil) (progn (setq sep sep2) (setq sep3 sep2)) (setq sep sep3))
  (if (= are nil) (setq are 1))
  (setq are2 (getreal (strcat " Area a obtener: <" (rtos are) ">")))
  (if (/= are2 nil) (setq are are2))
  (setq por (getreal " Factor de presicion: <0.1> "))
  (if (not por)
    (setq por 0.1)
  )
  (setq incre sep)
  (setq arepol 0)
  (while (/= (rtos are 2 4) (rtos arepol 2 4))
    (command "BPOLY" ppun "" "")
    (setq entpol (entlast))
    (command "AREA" "OB" entpol "")
    (setq arepol (getvar "AREA"))
    (if (< arepol are)
      (progn
;        (setq sep (+ sep incre))
        (setq fma 0)
      )
      (progn
        (setq sep (- sep incre))
        (setq fma 1)
      )
    )
    (if (= (rtos are 2 4) (rtos arepol 2 4))
      (write-line "Area localizada !!! ")
      (entdel entpol)
    )
    (if (/= fmaa fma)
      (setq incre (- incre (* incre 0.1)))
    )
    (if (= incre 0)
      (setq incre 0.3)
    )
    (setq fmaa fma)
    (if (= sep 0)
      (setq sep 0.01)
    )
    (if (< sep 0)
      (setq sep (* sep -1))
    )
    (if (= fma 0)
      (command "OFFSET" sep ent pun "")
      (command "OFFSET" sep ent ppun "")
    )
    (entdel ent)
    (setq ent (entlast))
    (write-line (rtos incre 2 4))
  )
)
