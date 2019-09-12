;;;Demostraci�n del papel de Visual LISP como Cliente ActiveX
;;;(c) 2000 R. Togores, Santander
;;;----------------------------------------------------------------------
;;;Funci�n para tratamiento de errores
;;;En caso de error libera los objetos VLA:
(defun apl-err (msg)
  (TerminaExcel)
  (prompt msg)
  (setq *error* oer)
) ;_ fin de defun
;;;funci�n InciaExcel
;;;Obtiene el objeto Aplicaci�n Excel o lo crea
;;;en caso de que no estuviera ya activa y sigue
;;;la jerarqu�a de objetos hasta el objeto CELDA
(defun IniciaExcel ()
  (setq *AplExcel*        (vlax-get-or-create-object "excel.application")
        *ColeccionLibros* (vlax-get-property *AplExcel* "Workbooks")
        *NuevoLibro*      (vlax-invoke-method *ColeccionLibros* "add")
        *ColeccionHojas*  (vlax-get-property *NuevoLibro* "Sheets")
        *Hoja1*           (vlax-get-property *ColeccionHojas* "Item" 1)
        *CeldasExcel*     (vlax-get-property *Hoja1* "Cells")
  ) ;_ fin de setq
  (vla-put-visible *AplExcel* :vlax-true)
) ;_ fin de defun
;;;Funci�n TerminaExcel, libera la memoria
;;;ocupada por los objetos VLA de Excel:
(defun TerminaExcel ()
  (vlax-release-object *CeldasExcel*)
  (vlax-release-object *Hoja1*)
  (vlax-release-object *ColeccionHojas*)
  (vlax-release-object *NuevoLibro*)
  (vlax-release-object *ColeccionLibros*)
  (vlax-release-object *AplExcel*)
) ;_ fin de defun
;;;Funci�n DatoCelda:
;;;introduce el valor indicado en la celda
;;;que corresponde a la fila y columna que
;;;recibe como argumento
(defun DatoCelda (fila col valor)
  (vlax-put-property *CeldasExcel* "Item" fila col
    (vl-princ-to-string valor)
  ) ;_ fin de vlax-put-property
) ;_ fin de defun
;;;Funci�n ProcesaFila:
;;;Invoca para cada campo de la fila la funci�n
;;;que escribe los datos
(defun ProcesaFila (fila numFila / numCol)
  (setq numCol 0)
  (foreach campo fila
    (DatoCelda numFila (setq numCol (1+ numCol))(cdr campo))
  ) ;_ fin de foreach
) ;_ fin de defun
;;;Funci�n ProcesaTabla:
;;;Primero escribe la fila de t�tulos utilizando
;;;los campos clave de la primera sublista, despu�s
;;;invoca la funci�n ProcesaFila para cada sublista
(defun ProcesaTabla (lista / numFila)
  ;;llena la fila 1 con las claves de las listas de asociaci�n:
  (setq numFila 1 numCol 0)
  (foreach campo (car lista)
    (DatoCelda numFila (setq numCol (1+ numCol))(car campo))
  ) ;_ fin de foreach
  ;;llena el resto de la tabla con los valores asociados a las claves:
  (while (setq fila (car lista))
    (setq numFila (1+ numFila) lista (cdr lista))
    (ProcesaFila fila numFila)
  ) ;_ fin de while
) ;_ fin de defun
;;;Funci�n Lista->Excel
;;;Realiza los siguientes procesos:
;;;1.- (vl-load com) asegura que las funciones VLAX- est�n cargadas
;;;2.- (IniciaExcel) establece la conexi�n con la tabla de excel
;;;3.- (ProcesaTabla lista) llena la tabla con los contenidos de
;;;    la lista que recibe como argumento
;;;4.- (TerminaExcel) cierra el v�nculo con la tabla
(defun Lista->Excel (lista /
                     ;variables declaradas como locales:
                     *CeldasExcel* *Hoja1* *ColeccionHojas*  *NuevoLibro*
                     *ColeccionLibros* *AplExcel*
                    )
  ;;sustituye la rutina de error original por la nueva
  (setq oer *error* *error* apl-err)
  (vl-load-com)        ;;carga las funciones VLAX-
  (IniciaExcel)        ;;establece la comunicaci�n con Excel
  (ProcesaTabla lista) ;;escribe la tabla Excel
  (TerminaExcel)       ;;libera los objetos Excel
  (setq *error* oer)   ;;restablece la rutina de error original
) ;_ fin de defun
;;;Funci�n de Prueba:
;;;Selecciona los c�culos de un dibujo y escribe sus
;;;datos de entidad a una tabla.
;;;La funci�n comprueba que las listas contengan las
;;;mismas claves y en el mismo orden
(defun TablaCirculos ( / objetos cont ent lista claves)
  ;;selecciona todos los c�rculos del dibujo:
  (setq objetos (ssget "X" (list (cons 0 "CIRCLE"))))
  (setq cont 0) ;;inicializa el contador a cero
  ;;extrae las listas de entidad de todos
  ;;los c�rculos y los guarda como sublistas:
  (while (setq ent (ssname objetos cont))
    (setq lista (cons (entget ent) lista))(setq cont (1+ cont))
  ) ;_ fin de while
  ;;crea una lista de claves:
  (foreach term lista
    (setq claves (cons (mapcar 'car term) claves))
  ) ;_ fin de foreach
  ;;compara las claves de las listas para
  ;;determinar si todas son iguales:
  (print lista)
  (if (apply 'and (mapcar 'equal claves (cdr claves)))
    (Lista->Excel lista)
    (alert "�Las entidades seleccionadas\nNO poseen igual formato!")
  ) ;_ fin de if
  (princ)
) ;_ fin de defun
;;;Funci�n para ejecutar el programa como un comando m�s de AutoCAD:
(defun C:TABLA ()
  (TablaCirculos)
  (princ)
)
(alert "Demostraci�n de Visual LISP\ncomo cliente ActiveX\nteclee TABLA para ejecutar")

