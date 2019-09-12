pping : dialog {
    label = "Tipo pie de plano";
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

pping2 : dialog {
   label = "Escala a utilizar";
        : popup_list {
          label = "Escala a utilizar";
          key = "Nblock";
          mnemonic = "R";
          list = "100\n200\n250\n500\n1000\n2000\n2500\n5000\n10,000\n20,000\n40,000\n50,000";
          edit_width = 10;
          fixed_width = true;
        }
   : spacer { height = 0.001; }
    ok_cancel;
}

pping3 : dialog {
   label = "Escala a utilizar";
        : popup_list {
          label = "Escala a utilizar";
          key = "Nblock";
          mnemonic = "R";
          list = "50\n100\n150\n200\n250\n300\n350\n400\n450\n500\n550\n600\n650\n700";
          edit_width = 10;
          fixed_width = true;
        }
   : spacer { height = 0.001; }
    ok_cancel;
}