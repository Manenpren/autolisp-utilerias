puntos : dialog {
    label = "Inserta puntos y une lineas";
    : column {
      label = "Archivo fuente";
    : row {
      : text { label = "Archivo fuente :"; key = "Arcf";}
      : button {
          key = "examinaf";
          label = "Examinar";
          fixed_width = true;
          alignment = centered;
      }
    }
     : spacer { height = 0.001; }
    }
    : spacer { height = 0.001; }
    : row {
    : edit_box {
      label = "Escala del Block a insertar" ;
      key = "Sblock" ;
      value = "1.000" ;
      edit_width = 10 ;
      fixed_width = true;
      alignment = centered;
    }
    }
    : spacer { height = 0.001; }
    : column {
    label = "Lineas leidas del archivo";
     : row {
        : radio_button {
          key = "Old";
          label = "Todo el archivo";
          alignment = left;
        }
        : radio_button {
          key = "Old2";
          label = "Una Parte";
          alignment = left;
        }
     }
     : row {
     : spacer { width = 35; }
        : edit_box {
          label = "Inicio" ;
          key = "Iniciol" ;
          value = "1" ;
          edit_width = 10 ;
        }
        : edit_box {
          label = "Fin" ;
          key = "finl" ;
          value = "100" ;
          edit_width = 10 ;
        }
     }
     : spacer { height = 0.001; }
    }
    : spacer { height = 0.001; }
    : column {
        label = "Insertar los Bloques por dos o tres dimensiones" ;
        : radio_button {
          key = "dos";
          label = "Bidimensional";
          alignment = left;
          fixed_width = true;
        }
        : radio_button {
          key = "tres";
          label = "Tridimensional";
          alignment = left;
          fixed_width = true;
        }
    }
     ok_cancel;
}