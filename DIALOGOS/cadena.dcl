CADENA : dialog {
   label = "Inserta Atributos";
   : column {
     label = "Crear block o utilizar uno ya creado";
     : row {
        : radio_button {
          key = "cr1";
          label = "Crear Block";
          alignment = left;
        }
        : radio_button {
          key = "cr2";
          label = "Utilizar uno";
          alignment = left;
        }
        : spacer { height = 0.001; }
     }
     : row {
        : edit_box {
          label = "Ancho total de la seccion" ;
          key = "ancho" ;
          value = "20" ;
          edit_width = 5 ;
        } 
        : popup_list {
          label = "block a utilizar";
          key = "Nblock";
          mnemonic = "R";
          list = "Pun2\nPunto\nNomar";
          edit_width = 10;
          fixed_width = true;
        }
        : spacer { height = 0.001; }
     }
   : spacer { height = 0.001; }
   }
   : spacer { height = 0.001; }
   : column {
        : edit_box {
          label = "Inicio con cadenamiento (numero real)" ;
          key = "inicioc" ;
          value = "20" ;
          edit_width = 10 ;
        } 
        : edit_box {
          label = "Incremento" ;
          key = "inc" ;
          value = "20" ;
          edit_width = 10 ;
        } 
   }
   : spacer { height = 0.001; }
    ok_cancel;
}