;PROGRAMA PARA CALCULAR AREAS DE PREDIOS E INSERTAR NOMBRE DE PROPIETARIO
;SE REQUIERE CREAR UN BLOCK "NOMAR" CON ATRIBUTOS "NOMBRE" Y "AREA" CON
;ALTURA DE 1 Y CENTRADOS EN 0,0 NOMBRE SOBRE AREA
:CREAR PREVIO AL PROGRAMA EL LAYER "AREAS"
(DEFUN C:CA2 ()
     (SETQ N (GETSTRING "DAME EL NOMBRE DEL PROPIETARIO: "))
     (SETQ XYZ (GETPOINT "DAME UN PUNTO AL CENTRO DEL AREA: "))
     (COMMAND "-BOUNDARY" XYZ "")
     (COMMAND "CHANGE" "L" "" "P" "LA" "AREAS" "")
     (COMMAND "AREA" "E" "L")
     (SETQ AP (RTOS (+ (GETVAR "AREA") 4.0728) 2 3))
     (COMMAND "INSERT" "NOMAR" XYZ "" "" "" N AP)
)
