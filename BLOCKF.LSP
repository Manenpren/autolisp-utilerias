(defun c:sblock ()
        (command "undo" "m")
        (setq e (car (entsel "Selecciona el bloque a escalar: ")))
        (while (/= "INSERT" (cdr (assoc 0 (entget E))))
          (if (/= "INSERT" (cdr (assoc 0 (entget E))))
            (progn   
              (ALERT "\nEl objeto debe ser un block ")
              (setq E (car (entsel "\n Selecciona el bloque: ")))
            )
          )
        )
        (setq NOMBRE (cdr (assoc 2 (entget e))))
        (setq fs (cdr (assoc 41 (entget e))))
        (setq FSN (getreal "Dame el porcentaje de escalamiento nuevo: "))
        (setq E (entnext))
        (while E
        (setq XYZ (cdr (assoc 10 (entget E))))
          (if (= "INSERT" (cdr (assoc 0 (entget E))))
              (if (= (strcase NOMBRE) (cdr (assoc 2 (entget E))))
                     (if (= FS (cdr (assoc 41 (entget E))))
                         (command "SCALE" (cdr (assoc -1 (entget E))) "" XYZ FSN)
                     )
              )
          )
         (setq E (entnext E))
        )
)

(defun c:bblock ()
        (command "undo" "m")
        (setq e (car (entsel "Selecciona el bloque a BORRAR: ")))
        (while (/= "INSERT" (cdr (assoc 0 (entget E))))
          (if (/= "INSERT" (cdr (assoc 0 (entget E))))
            (progn   
              (ALERT "\nEl objeto debe ser un block ")
              (setq E (car (entsel "\n Selecciona el bloque: ")))
            )
          )
        )
        (setq NOMBRE (cdr (assoc 2 (entget e))))
        (setq fs (cdr (assoc 41 (entget e))))
        (setq E (entnext))
        (command "ERASE")
        (while E
        (setq XYZ (cdr (assoc 10 (entget E))))
          (if (= "INSERT" (cdr (assoc 0 (entget E))))
              (if (= (strcase NOMBRE) (cdr (assoc 2 (entget E))))
                     (if (= FS (cdr (assoc 41 (entget E))))
                         (command E)
                     )
              )
          )
         (setq E (entnext E))
        )
         (command "")
)

(defun c:MB ()
    (command "undo" "m")
    (setq texto (car (entsel "Selecciona el texto: ")))
    (setq NOMBRE (cdr (assoc 1 (entget TEXTO))))
    (SETQ LNG (STRLEN NOMBRE))
    (SETQ NOMBLO "")
    (SETQ CONT 0)
    (REPEAT LNG
        (SETQ CONT (1+ CONT))
        (setq CARACTER (substr NOMBRE CONT 1))
        (IF (= CARACTER "+") (SETQ CARACTER "-"))
;        (IF (= CARACTER ".") (SETQ CARACTER "_"))
        (setq nomblo (STRCAT NOMBLO CARACTER))
    )
    (print "\n Seleciona los elementos a procesar ")
    (setq gpo (ssget))
    (command "BLOCK" nomblo "Y" "0,0" gpo "")
)

(defun c:MB2 ()
    (setq texto (car (entsel "Selecciona el texto: ")))
    (setq NOMBRE (cdr (assoc 1 (entget TEXTO))))
    (SETQ LNG (STRLEN NOMBRE))
    (SETQ NOMBLO "")
    (SETQ CONT 0)
    (REPEAT LNG
        (SETQ CONT (1+ CONT))
        (setq CARACTER (substr NOMBRE CONT 1))
        (IF (= CARACTER "+") (SETQ CARACTER "-"))
        (IF (= CARACTER ".") (SETQ CARACTER "_"))
        (setq nomblo (STRCAT NOMBLO CARACTER))
    )
    (print "\n Seleciona los elementos a procesar ")
    (setq gpo (ssget))
    (SETQ NOMBLO (STRCAT NOMBLO "P"))
    (command "BLOCK" nomblo "0,0" gpo "")
)

(defun c:Mblock ()
        (setq e (car (entsel "Selecciona el bloque a MOVER: ")))
        (while (/= "INSERT" (cdr (assoc 0 (entget E))))
          (if (/= "INSERT" (cdr (assoc 0 (entget E))))
            (progn   
              (ALERT "\nEl objeto debe ser un block ")
              (setq E (car (entsel "\n Selecciona el bloque: ")))
            )
          )
        )
        (setq NOMBRE (cdr (assoc 2 (entget e))))
        (setq fs (cdr (assoc 41 (entget e))))
        (setq E (entnext))
        (COMMAND "MOVE")
        (while E
        (setq XYZ (cdr (assoc 10 (entget E))))
          (if (= "INSERT" (cdr (assoc 0 (entget E))))
              (if (= (strcase NOMBRE) (cdr (assoc 2 (entget E))))
                     (if (= FS (cdr (assoc 41 (entget E))))
                         (command E)
                     )
              )
          )
         (setq E (entnext E))
        )
        (COMMAND "")
)

(defun c:rblock ()
        (command "undo" "m")
        (setq e (car (entsel "Selecciona el bloque a ROTAR : ")))
        (while (/= "INSERT" (cdr (assoc 0 (entget E))))
          (if (/= "INSERT" (cdr (assoc 0 (entget E))))
            (progn   
              (ALERT "\nEl objeto debe ser un block ")
              (setq E (car (entsel "\n Selecciona el bloque: ")))
            )
          )
        )
        (setq NOMBRE (cdr (assoc 2 (entget e))))
        (setq AN (getreal "Dame el angulo al que deseas rotar: "))
        (setq E (entnext))
        (while E
          (if (= "INSERT" (cdr (assoc 0 (entget E))))
              (if (= (strcase NOMBRE) (cdr (assoc 2 (entget E))))
                   (command "CHANGE" E "" "" "" AN)
              )
          )
         (setq E (entnext E))
        )
)

; INSATR.LSP
; ESTE PROGRAMA ESTA DISE�ADO PARA QUE MEDIANTE UNA BASE DE DATOS CON
; VALORES SEPARADOS POR "COMAS"; INSERTE CUALQUIER BLOCK ESPECIFICADO EN EL
; PROGRAMA Y TOME DE LA BASE DE DATOS EL VALOR DE "X" Y "Y" PARA LA
; POSICION DEL BLOCK Y LOS DEMAS VALORES YA SEA DE "Z", "CODIGO" O "NUMERO DE
; PUNTO" SE ESPECIFICA SU ORDEN EN EL PROGRAMA

;  **********EJEMPLO DEL ORDEN DE LA BASE DE DATOS**********

; �  X    �   Y   �    Z    �   NUM. PUNTO  �   CODIGO    �
; � 100.00� 100.00� 100.00  �           1   �    BANQ     �

;                 <<<<<<<<  MUY INPORTANTE  >>>>>>>>>>>
; EL ORDEN DE LA BASE DE DATOS PUEDE SER DISTINTA SIEMPRE Y CUANDO SE
; ESPECIFIQUE CORRECTAMENTE EN EL PROGRAMA

   ;  ۲��   COMANDO   ����
;  � INSATR = INSERTA ATRIBUTOS �

(DEFUN SUMA (P VX VY)
  (SETQ X (CAR P))
  (SETQ Y (CAR (CDR P)))
  (LIST (+ X VX) (+ Y VY) (LAST P))
)

(defun equis ()
  (if (< xmayor (atof dat))
    (setq xmayor (atof dat))
  )
  (if (> xmenor (atof dat))
    (setq xmenor (atof dat))
  )
)

(defun ye ()
  (if (< ymayor (atof dat))
    (setq ymayor (atof dat))
  )
  (if (> ymenor (atof dat))
    (setq ymenor (atof dat))
  )
)


(DEFUN COLUMNAS ()
  (SETQ CA (SUBSTR LIN 1 1))
  (SETQ C 0) (SETQ X 1)
  (setq xmayor 0) (setq xmenor 0) (setq ymayor 0) (setq ymenor 0)
  (WHILE (/= C 3)
    (SETQ C (+ C 1))
    (SETQ DAT "")
    (WHILE (/= CA ",")
      (SETQ X (+ X 1))
      (SETQ DAT (STRCAT DAT CA))
      (SETQ CA (SUBSTR LIN X 1))
    )
    (SETQ CA "")
    (if (= c 1)
      (equis)
    )
    (if (= c 2)
      (ye)
    )
  )
)


(DEFUN LEE ()
  (SETQ LIN (READ-LINE arch))
  (SETQ L 1)
  (LEEINI)
  (WHILE (AND LIN (<= L FIN))
    (COLUMNAS)
    (SETQ L (+ L 1))
    (SETQ LIN (READ-LINE arch))
  )
  (SETQ L (- L 1))
)

(defun camatr ()
  (setq atrib (cdr (assoc 2 (entget ent))))
  (setq nocol (cdr (assoc atrib datos)))
  (setq valor (cdr (assoc nocol atributos)))
  (entmod (subst (cons 1 valor)
                 (assoc 1 (entget ent))
                 (entget ent)
          )
  )
)

(defun cambiaatr ()
  (setq ent (entlast))
  (while ent
    (if (= "ATTRIB" (cdr (assoc 0 (entget ent))))
      (camatr)
    )
    (setq ent (entnext ent))
  )
)

(DEFUN COLUMNAS2 ()
  (SETQ CA (SUBSTR LIN 1 1))
  (SETQ C 0) (SETQ X 1)
  (SETQ ATRIBUTOS NIL)
  (WHILE (/= C (+ noatri 3))
    (SETQ C (+ C 1))
    (SETQ DAT "")
    (SETQ SALIR "N")
    (WHILE SALIR
      (SETQ X (+ X 1))
      (SETQ DAT (STRCAT DAT CA))
      (SETQ CA (SUBSTR LIN X 1))
      (IF (= CA ",")
        (SETQ SALIR nil)
      )
      (IF (= CA "")
        (SETQ SALIR nil)
      )
    )
    (SETQ CA "")
    (setq atributo (cons c dat))
    (setq atributos (append atributos (list atributo)))
  )
  (IF (= "3" TRI)
    (COMMAND "COPY" UL "" (LIST ex ey) (LIST (ATOF (CDR (ASSOC 1 ATRIBUTOS)))
                                             (ATOF (CDR (ASSOC 2 ATRIBUTOS)))
                                             (ATOF (CDR (ASSOC 3 ATRIBUTOS)))))
    (COMMAND "COPY" UL "" (LIST ex ey) (LIST (ATOF (CDR (ASSOC 1 ATRIBUTOS)))
                                             (ATOF (CDR (ASSOC 2 ATRIBUTOS)))))
  )
  (cambiaatr)
)

(DEFUN LEEINI ()
  (WHILE (/= L INI)
    (SETQ L (+ L 1))
    (SETQ LIN (READ-LINE arch))
  )
)

(DEFUN LEE2 ()
  (SETQ LIN (READ-LINE arch))
  (SETQ L 1) (setq atributos nil)
  (LEEINI)
  (WHILE (AND LIN (<= L FIN))
    (COLUMNAS2)
    (SETQ L (+ L 1))
    (SETQ LIN (READ-LINE arch))
  )
  (SETQ L (- L 1))
)

(defun proatrib ()
  (setq noatri (+ noatri 1))
  (setq nomatr (cdr (assoc 2 (entget e))))
  (print nomatr)
  (IF (= 1 NOATRI)
    (SETQ K 5)
  )
  (IF (= 2 NOATRI)
    (SETQ K 3)
  )
  (IF (= 3 NOATRI)
    (SETQ K 4)
  )
  (setq columna (getint (STRCAT " No. de columna para este atributo <" (ITOA K) "> : ")))
  (IF (= COLUMNA NIL) 
    (SETQ COLUMNA K)
  )
  (setq dato (cons nomatr columna))
  (setq datos (append datos (list dato)))
)

(defun abloque ()
  (setq e (cdr (assoc -2 lisblo)))
  (setq noatri 0) (setq datos nil)
  (while e
    (if (= "ATTDEF" (cdr (assoc 0 (entget e))))
      (PROATRIB)
    )
    (setq e (entnext e))
  )
  (print noatri)
)

(defun contINS ()
  (setq ARCINSAT (open "c:\\Archivos de Programa\\AutoCAD R14\\INSATR.CFG" "r"))
  (IF (= ARCINSAT NIL)
   (PROGN
    (SETQ NBLOCK "PUN2")
    (SETQ ESCB 1.00)
    (SETQ ARCHIVOP "c:\\TOPOGRAF\\PROV.CSV")
    (SETQ RI 1)
    (SETQ RF 100)
    (SETQ DIMEN "2")
   )
   (PROGN
    (setq NBLOCK (read-line arCINSAT))
    (setq ESCB (read-line arcINSAT))
      (SETQ ESCB (ATOF ESCB))
    (setq ARCHIVOP (read-line arCINSAT))
    (setq RI (read-line arcINSAT))
      (SETQ RI (ATOI RI))
    (setq RF (read-line arcINSAT))
      (SETQ RF (ATOI RF))
    (setq DIMEN (read-line arCINSAT))
    (IF (= ESCB NIL) (SETQ ESCB 1))
    (IF (= RI NIL) (SETQ RI 1))
    (IF (= RF NIL) (SETQ RF 100))
    (CLOSE ARCINSAT)
   )
  )
  (setq nomblo (getstring (STRCAT "\n Nombre del bloque <" NBLOCK "> :")))
  (IF (= NOMBLO "")
    (setq NOMBLO NBLOCK)
  )
  (setq ex 1.13)
  (setq ey 1.13) 
  (SETQ PROVS (RTOS ESCB))
  (setq tt (getreal (STRCAT "\n Tama�o minimo de texto a manejar <" PROVS "> :")))
  (IF (= tt NIL)
    (setq tt ESCB)
  )
  (command "INSERT" nomblo (list ex ey) tt "" ""
   "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
   "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
  (SETQ UL (ENTLAST))
  (setq PROV (getstring (STRCAT "\n Nombre del archivo de datos <" archivop "> (s/n):")))
  (IF (= (STRCASE PROV) "S")
    (setq NOMARCH ARCHIVOP)
    (setq NOMARCH (getfiled "ARCHIVO DE DATOS" "C:/TOPOGRAF/" "CSV" 18))
  )
  (setq ini (getint (STRCAT "\n Renglon donde se inica la lectura <" (ITOA RI) "> :")))
  (IF (= INI NIL)
    (setq INI RI)
  )
  (setq fin (getint (STRCAT "\n Renglon donde termina la lectura <" (ITOA RF) "> :")))
  (IF (= FIN NIL)
    (setq FIN RF)
  )
  (setq tri (getstring (STRCAT "\n Teclear 3 para tridimensional y 2 para bidimencional <" DIMEN "> :" )))
  (IF (= TRI "")
    (setq TRI DIMEN)
  )
  (setq ARCINSAT (open "c:\\Archivos de Programa\\AutoCAD R14\\INSATR.CFG" "w"))
  (WRITE-LINE NOMBLO ARCINSAT)
  (WRITE-LINE (RTOS tt 2 3) ARCINSAT)
  (WRITE-LINE NOMARCH ARCINSAT)
  (WRITE-LINE (RTOS INI 2 3) ARCINSAT)
  (WRITE-LINE (RTOS FIN 2 3) ARCINSAT)
  (WRITE-LINE DIMEN ARCINSAT)
  (CLOSE ARCINSAT)
  (setq lisblo (tblsearch "block" nomblo))
  (ABLOQUE)
;  (IF (/= (SUBSTR ARCHIVOP 1 1) (CHR 34)))
;    (SETQ ARCHIVOP (STRCAT (CHR 34) ARCHIVOP (CHR 34)))
;  )
  (setq arch (OPEN NOMARCH "r"))
  (if arch
    (LEE)
    (print "\n Archivo no encontrado ")
  )
  (close arch)
;  (command "ZOOM" "w" (list xmayor ymayor) (list xmenor ymenor))
  (setq arch (OPEN NOMARCH "r"))
  (if arch
    (LEE2)
  )
  (close arch)
  (entdel ul)
  (command "ZOOM" "E")
)

(defun c:insatrv ()
  (contINS)
)

(defun c:IB ()
    (setq texto (car (entsel "Selecciona el texto: ")))
    (setq NOMBRE (cdr (assoc 1 (entget TEXTO))))
    (SETQ LNG (STRLEN NOMBRE))
    (SETQ NOMBLO "")
    (SETQ CONT 0)
    (REPEAT LNG
        (SETQ CONT (1+ CONT))
        (setq CARACTER (substr NOMBRE CONT 1))
        (IF (= CARACTER "+") (SETQ CARACTER "-"))
        (IF (= CARACTER ".") (SETQ CARACTER "_"))
        (setq nomblo (STRCAT NOMBLO CARACTER))
    )
    (command "insert" nomblo)
)
