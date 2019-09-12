SEC : dialog {
    label = "Configuracion del programa seccion";
     : spacer { height = 0.001; }
    : column {
     : column {
       : edit_box {
         label = "Ancho total de la seccion" ;
         key = "ancho" ;
         value = "20" ;
         fixed_width = true;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Escala textos cadenamiento y elevacion" ;
         key = "scad" ;
         value = "5" ;
         fixed_width = true;
         edit_width = 3 ;
       }
       : column {
        label = "Extensiones configuracion";
        : row {
           : button {
                key = "capas";
               label = "Configurar capas"; 
               fixed_width = true;
               alignment = center;
               is_cancel = true;
            }
            : button {
               key = "reticula";
               label = "Configurar reticula";
               fixed_width = true;
               alignment = center;
               is_cancel = true;
            }
            : button {
               key = "colores";
               label = "Configurar colores";
               fixed_width = true;
               alignment = center;
               is_cancel = true;
            }
        }
        : spacer { height = 0.001; }
       }
       : column {
        label = "Archivo";
        : row {
          : button {
             key = "save";
             label = "Guardar configuracion";
             fixed_width = true;
             alignment = center;
          }
          : button {
             key = "cfgf";
             label = "Cargar desde un archivo";
             fixed_width = true;
             alignment = center;
          }
        }
        : spacer { width = 0.001; }
       }
     }
     : image_button {
       key          = "imagen";
       width        = 100;
       height = 20 ;
       aspect_ratio = 1.0;
       color        = 256;
       allow_accept = true;
     }
    }
      : button {
         key = "actualiza";
         label = "Actualizar";
          fixed_width = true;
          alignment = right;
     }
    : spacer { height = 0.001; }
      : toggle {
        key = "escan";
        label = "Escanear el ancho de la seccion y ajustar reticula";
        alignment = left;
      }
    ok_cancel;
}

SEC2 : dialog {
    label = "Configuracion de la reticula";
    : column {
     : spacer { height = 0.001; }
       : column {
         label = "Lineas de la reticula";
       : row {
         : edit_box {
           label = "Separacion hor. lineas de reticula" ;
           key = "sh" ;
           value = "1" ;
           fixed_width = true;
           edit_width = 3 ;
         }
         : edit_box {
           label = "Separacion vert. lineas de reticula" ;
           key = "sv" ;
           value = "5" ;
           fixed_width = true;
           edit_width = 3 ;
         }
       }
         : spacer { width = 0.001; }
       }
       : column {
         label = "textos de la reticula";
       : row {
         : edit_box {
           label = "Etiquetar a cada numero de lineas hor." ;
           key = "et1" ;
           value = "1" ;
           fixed_width = true;
           edit_width = 3 ;
         }
         : edit_box {
           label = "Etiquetar a cada numero de lineas vert." ;
           key = "et2" ;
           value = "1" ;
           fixed_width = true;
           edit_width = 3 ;
         }
         : spacer { width = 0.001; }
       }
       : edit_box {
         label = "Escala de textos reticula" ;
         key = "str" ;
         value = "5" ;
         fixed_width = true;
         edit_width = 3 ;
       }
       : spacer { width = 0.001; }
       }
    }
    ok_cancel;
}

SEC3 : dialog {
    label = "Configuracion de las capas";
       : edit_box {
         label = "layer de la linea tn";
         key = "ctn";
         mnemonic = "R";
         value = "TN";
         edit_width = 20;
       }
       : edit_box {
         label = "layer de lineas reticula";
         key = "clr";
         mnemonic = "R";
         value = "RETICULA";
         edit_width = 20;
       }
       : edit_box {
         label = "layer de textos reticula";
         key = "ctr";
         mnemonic = "R";
         value = "RETICULA";
         edit_width = 20;
       }
       : edit_box {
         label = "layer de cadenamiento";
         key = "ccad";
         mnemonic = "R";
         value = "TN";
         edit_width = 20;
       }
       : edit_box {
         label = "layer de cota nivel";
         key = "cniv";
         mnemonic = "R";
         value = "TN";
         edit_width = 20;
       }
    ok_cancel;
}

SEC4 : dialog {
    label = "Configuracion de colores";
    : row {
     : column {
      : edit_box { label = "Color de la linea de TN"; key = "color1"; edit_width = 3;}
      : edit_box { label = "Color de las lineas RETICULA"; key = "color2"; edit_width = 3;}
      : edit_box { label = "Color de los textos RETICULA"; key = "color3"; edit_width = 3;}
      : edit_box { label = "Color de CADENAMIENTO";  key = "color4"; edit_width = 3;}
      : edit_box { label = "Color de Cota de nivel";  key = "color5"; edit_width = 3;}
     }
     : column {
      : image_button {
        key          = "fcolor1";
        width        = 8;
        height = 1 ;
        aspect_ratio = 1.0;
        color        = 3;
        allow_accept = true;
      }
      : image_button {
        key          = "fcolor2";
        width        = 8;
        height = 1 ;
        aspect_ratio = 1.0;
        color        = 2;
        allow_accept = true;
      }
      : image_button {
        key          = "fcolor3";
        width        = 8;
        height = 1 ;
        aspect_ratio = 1.0;
        color        = 6;
        allow_accept = true;
      }
      : image_button {
        key          = "fcolor4";
        width        = 8;
        height = 1 ;
        aspect_ratio = 1.0;
        color        = 7;
        allow_accept = true;
      }
      : image_button {
        key          = "fcolor5";
        width        = 8;
        height = 1 ;
        aspect_ratio = 1.0;
        color        = 7;
        allow_accept = true;
      }
     }
    }
    ok_cancel;
}

COLORES : dialog {
    label = "Configuracion de colores";
    ok_cancel;
}

