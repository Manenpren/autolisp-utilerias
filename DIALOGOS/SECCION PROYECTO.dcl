SECP : dialog {
    label = "Configuracion de la seccion de proyecto";
     : spacer { height = 0.001; }
     : image_button {
       key          = "imagen";
       width        = 100;
       height = 20 ;
       aspect_ratio = 1.0;
       color        = 256;
       allow_accept = true;
     }
      : spacer { width = 0.001; }
      : button {
         key = "actualiza";
         label = "Actualizar";
          fixed_width = true;
          alignment = right;
     }
    : spacer { height = 0.001; }
    : column {
      : column {
       label = "Datos de seccion de proyecto";
       : spacer { height = 0.001; }
      : row {
       : column {
       : edit_box {
         label = "Ancho de la corona" ;
         key = "anchocr" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Ancho de calzada" ;
         key = "anchoc" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Derecho de via" ;
         key = "derecho" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Profundidad de cuneta" ;
         key = "profun" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
        fixed_width = true;
       : spacer { height = 0.001; }
       }
       : column {
       : edit_box {
         label = "Talud de corte X:1" ;
         key = "taludc" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Talud de terraplen X:1" ;
         key = "taludt" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Talud de la cuneta X:1" ;
         key = "taludcu" ;
         value = "20" ;
         fixed_width = false;
         edit_width = 5 ;
       }
        fixed_width = true;
        fixed_height = true;
       }
      }
     }
    }
    : row {
      : text { label = "Color de la linea"; key = "Prevcad"; alignment = left; }
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
      fixed_width = true;
    }
    : spacer { height = 0.001; }
    ok_cancel;
}
