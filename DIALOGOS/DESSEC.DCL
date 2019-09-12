DESSEC : dialog {
    label = "Configuracion del programa seccion";
     : column {
       : edit_box {
         label = "Altura disponible en area de descarga (unidades de dibujo)" ;
         key = "altura" ;
         value = "90" ;
         fixed_width = true;
         edit_width = 5 ;
       }
       : edit_box {
         label = "Separacion vertical de las secciones" ;
         key = "sver" ;
         value = "5" ;
         fixed_width = true;
         edit_width = 3 ;
       }
       : edit_box {
         label = "Separacion horizontal de las secciones" ;
         key = "shor" ;
         value = "5" ;
         fixed_width = true;
         edit_width = 3 ;
       }
     : spacer { height = 0.001; }
     : image_button {
       key          = "imagen";
       width        = 60;
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
    ok_cancel;
}

