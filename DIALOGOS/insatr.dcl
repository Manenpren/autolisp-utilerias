insatr : dialog {
    label = "Inserta Atributos";
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
    : column {
     label = "block";
    : row {
     : popup_list {
       label = "Nombre del block a insertar";
       key = "Nblock";
       mnemonic = "R";
       list = "Pun2\nPunto\nNomar";
       edit_width = 25;
       fixed_width = true;
     }
     : button {
         key = "examina";
         label = "Examinar";
          fixed_width = true;
          alignment = left;
     }
    }
    : row {
     : edit_box {
       label = "Escala del Block" ;
       key = "Sblock" ;
       value = "1.000" ;
       edit_width = 10 ;
     }
     : spacer { width = 45; }
    }
     : spacer { height = 0.001; }
    }
    : spacer { height = 0.001; }
    : column {
    label = "Lineas a leer en el archivo";
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
        label = "Insertar los Bloques por metodo Bidimensional o Tridimensional" ;
        : radio_button {
          key = "dos";
          label = "Bidimensional";
          alignment = left;
        }
        : radio_button {
          key = "tres";
          label = "Tridimensional";
          alignment = left;
        }
    }
    : spacer { height = 0.001; }
    : column {
      label = "Crear un layer o utilizar uno ya creado" ;
      : row {
         : radio_button {
           key = "layer1";
           label = "Crear un nuevo layer";
           alignment = left;
         }
         : spacer { width = 4; }
         : radio_button {
           key = "layer2";
           label = "Utilizar uno ya creado";
           alignment = left;
         }
      }
      : row {
          : column {
           label = "Nombre del layer a crear";
           : row {
             : toggle {
               key = "tag1";
               label = "Fecha";
               alignment = left;
             }
             : text { label = "08-09-03:"; key = "fecha"; alignment = left; }
           }
           : row {
            : toggle {
               key = "tag2";
               label = "Cadena";
               alignment = left;
             }
             : edit_box {
               alignment = left;
               key = "Cadena" ;
               value = "elevaciones" ;
               edit_width = 20 ;
               fixed_width = true;
               alignment = left;
             }
            }
           : row {
            : text { label = "elevaciones"; key = "Prevcad"; alignment = left; }
            : image_button {
              key = "color";
              label = "Color";
              width = 4;
              height = 2 ;
              aspect_ratio = 1.0;
              color        = 1;
              alignment = left;
              fixed_width = true;
            }
           }
           : spacer { height = 0.002; }
          }
          : popup_list {
            label = "Nombre del layer";
            key = "Nlayer";
            mnemonic = "R";
            list = "0";
            edit_width = 20;
            fixed_width = true;
          }
      }
    }
    : spacer { height = 0.001; }
    : row {
      : toggle {
        key = "une";
        label = "Unir los codigos iguales y consecutivos";
        alignment = left;
      }
      : button {
          key = "attrib";
          label = "Attributos";
          fixed_width = true;
          alignment = centered;
      }
    }
    ok_cancel;
}

insatr2 : dialog {
    label = "Organizacion de datos";
     : popup_list {
       label = "Tipo de archivo a insertar";
       key = "Tpar";
       mnemonic = "R";
       list = "XyzNpCo\nLeica TC500\nLeica Tc407\nTopcon Gts 220";
       edit_width = 25;
       fixed_width = false;
     }
     : spacer { width = 45; }
     : row {
       : popup_list {
         label = "Atributo a modificar";
         key = "atr";
         mnemonic = "R";
         list = "";
         edit_width = 25;
         fixed_width = false;
       }
       : edit_box {
         label = "# de columna" ;
         key = "posa" ;
         value = "1" ;
         edit_width = 10 ;
       }
     }
     : spacer { width = 45; }
   : paragraph {
     label = " ";
     : text_part {
        label = "datos de attributos";
        key = "tx";
        color = 1;
     }
   }
   : paragraph {
     label = " ";
     : text_part {
        label = "linea de datos1";
        key = "t1";
     }
     : text_part {
        label = "linea de datos3";
        key = "t2";
     }
     : text_part {
        label = "linea de datos3";
        key = "t3";
     }
     : text_part {
        label = "linea de datos4";
        key = "t4";
     }
     : text_part {
        label = "linea de datos5";
        key = "t5";
     }
     : text_part {
        key = "t6";
        label = "linea de datos6";
     }
     : text_part {
        key = "t7";
        label = "linea de datos7";
     }
     : text_part {
        key = "t8";
        label = "linea de datos8";
     }
     : text_part {
        key = "t9";
        label = "linea de datos9";
     }
     : text_part {
        key = "t10";
        label = "linea de datos10";
     }
  }
    ok_cancel;
}
