lintopf : dialog {
    label = "Opciones de Trabajo lintopf";
    : column {
        label = "Acotaciones";
        : toggle {
          key = "t";
          label = "Acotar la polylinea";
          alignment = left;
        }
    : edit_box {
      label = "Escala de las acotaciones" ;
      key = "Sblock" ;
      value = "1.000" ;
      edit_width = 10 ;
      fixed_width = true;
      alignment = centered;
    }
    }
    : column {
        label = "Opciones de Busqueda de Puntos" ;
        : toggle {
          key = "t1";
          label = "Busqueda Avanzada de puntos";
          alignment = left;
        }
        : toggle {
          key = "t2";
          label = "Mover puntos desfasados";
          alignment = left;
        }
        : toggle {
          key = "t3";
          label = "Insertar puntos automaticamente";
          alignment = left;
        }
    }
    : column {
        : toggle {
          key = "t4";
          label = "Crear cuadro de construccion";
          alignment = left;
        }
    }
    : column {
        label = "Notificaciones del programa";
        : toggle {
          key = "t5";
          label = "Preguntar por el tamaño de cotas";
          alignment = left;
        }
        : toggle {
          key = "t6";
          label = "Notificar al encontrar algun error";
          alignment = left;
        }
        : toggle {
          key = "t7";
          label = "Ajustar cuadro de contruccion al final del programa";
          alignment = left;
        }
    }
     ok_cancel;
}