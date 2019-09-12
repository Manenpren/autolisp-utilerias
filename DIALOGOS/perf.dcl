perf : dialog {
    label = "Tipo de fuente";
    : row {
      : image_button {
        key          = "arcsv";
        label = "Archivo CSV";
        width        = 20;
        height = 8 ;
        aspect_ratio = 1.0;
        color        = 256;
        allow_accept = true;
        alignment = centered;
      }
      : image_button {
        key          = "poli";
        label = "Polylinea";
        width        = 20;
        height = 8 ;
        aspect_ratio = 1.0;
        color        = 256;
        allow_accept = true;
        alignment = centered;
      }
      : image_button {
        key          = "grd";
        label = "Archivo grd";
        width        = 20;
        height = 8 ;
        aspect_ratio = 1.0;
        color        = 256;
        allow_accept = true;
        alignment = centered;
      }
      : image_button {
        key = "opciones";
        label = "opciones";
        width        = 20;
        height = 8 ;
        aspect_ratio = 1.0;
        color        = 256;
        allow_accept = true;
        alignment = centered;
      }
    }
    : row {
      : button {
          key = "cancel";
          label = "Cancelar";
          width = 2;
          height = 2;
          alignment = centered;
          is_cancel = true; 
      }
    }
    : spacer { height = 0.001; }
}

perf2 : dialog {
    label = "Opciones del perfil";
    : column {
     label = "Configuraciones del texto";
     : row {
      : button {
          key = "cade";
          label = "Cadenamientos";
          width = 15;
          alignment = centered;
      }
      : button {
          key = "elev";
          label = "Elevaciones reticula";
          width = 7;
          alignment = centered;
      }
      : button {
          key = "elev2";
          label = "Elevaciones estaciones";
          width = 6;
          alignment = centered;
      }
     }
     : spacer { height = 0.001; }
    }
    : column {
     label = "Configuraciones de las lineas";
     : row {
      : button {
          key = "ret";
          label = "Reticula";
          width = 20;
          alignment = centered;
      }
      : button {
          key = "tn";
          label = "Tn";
          width = 26;
          alignment = centered;
      }
      : button {
          key = "env";
          label = "Poligonal envolvente perfil";
          width = 1;
          alignment = centered;
      }
     }
     : spacer { height = 0.001; }
    }
    : row {
    : column {
    : edit_box {
      label = "Deformacion del perfil eje X :" ;
      key = "defx" ;
      value = "1.000" ;
      edit_width = 10 ;
    }
    : edit_box {
      label = "Deformacion del perfil eje y :" ;
      key = "defy" ;
      value = "10.000" ;
      edit_width = 10 ;
    }
    : edit_box {
      label = "Separacion en elevaciones de reticula :" ;
      key = "sepy" ;
      value = "1" ;
      edit_width = 10 ;
    }
    : edit_box {
      label = "Separacion en cadenamientos de reticula :" ;
      key = "sepx" ;
      value = "20" ;
      edit_width = 10 ;
    }
    }
    : spacer { width = 0.001; }
    : button {
        key = "prev";
        label = "Previo";
        width = 1;
        alignment = centered;
    }
    }
    : row {
      : toggle {
        key = "op1";
        label = "Preguntar por separacion de lineas";
        alignment = left;
      }
    }
    ok_cancel;
}

perf3 : dialog {
    label = "Configuracion de textos";
    : edit_box {
      label = "Tamano del texto :" ;
      key = "stext" ;
      value = "3" ;
      edit_width = 10 ;
    }
    : popup_list {
      label = "Fuente";
      key = "fuente";
      mnemonic = "R";
      list = "";
      edit_width = 10;
   }
   : row {
   : image_button {
     key = "color";
     label = "Color";
     width = 4;
     height = 2 ;
     aspect_ratio = 1.0;
     color        = 1;
     allow_accept = true;
     alignment = left;
     fixed_width = true;
   }
    : edit_box {
      label = "Color del texto :" ;
      key = "color2" ;
      value = "3" ;
      edit_width = 10 ;
    }
   }
   ok_cancel;
}

perf4 : dialog {
    label = "Configuracion de lineas";
    : column {
     label = "Configuraciones del tipo de linea";
     : row {
        : radio_button {
          key = "cont";
          label = "Continua";
          alignment = left;
        }
        : radio_button {
          key = "disc";
          label = "Discontinua";
          alignment = left;
        }
     }
     : spacer { height = 0.001; }
    }
    : edit_box {
      label = "Ancho de linea :" ;
      key = "anchl" ;
      value = "0.1" ;
      edit_width = 10 ;
    }
   : row {
   : image_button {
     key = "color";
     label = "Color";
     width = 4;
     height = 2 ;
     aspect_ratio = 1.0;
     color        = 1;
     allow_accept = true;
     alignment = left;
     fixed_width = true;
   }
    : edit_box {
      label = "Color de linea :" ;
      key = "color2" ;
      value = "3" ;
      edit_width = 10 ;
    }
   }
   ok_cancel;
}
