mens : dialog {
    label = "Tipo de fuente";
    : row {
      : image_button {
        key          = "arcsv";
        label = "Archivo CSV";
        width        = 40;
        height = 16 ;
        aspect_ratio = 1.0;
        color        = 256;
        allow_accept = true;
        alignment = centered;
      }
    }
    : row {
      : button {
          key = "cancel";
          label = "Aceptar";
          width = 2;
          height = 2;
          alignment = centered;
          is_cancel = true; 
      }
    }
    : spacer { height = 0.001; }
}