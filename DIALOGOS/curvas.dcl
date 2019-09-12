curv : dialog {
    label = "Tipo de fuente de niveles";
    : row {
      : button {
          key = "arcsv";
          label = "      Archivo CSV      ";
          width = 10;
          height = 8;
          alignment = centered;
      }
      : button {
          key = "selec";
          label = "Seleccionar objetos";
          width = 10;
          height = 8;
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

curv12 : dialog {
    label = "Tipo de seleccion de niveles";
    : row {
      : button {
          key = "todos";
          label = "Todos niveles encotrados";
          width = 10;
          height = 8;
          alignment = centered;
      }
      : button {
          key = "grupo";
          label = "Seleccionar un grupo de niveles";
          width = 10;
          height = 8;
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

curv2 : dialog {
    label = "Tipo de area envolvente";
    : row {
      : button {
          key = "polig";
          label = "Poligono ya existente";
          width = 10;
          height = 8;
          alignment = centered;
      }
      : button {
          key = "poligm";
          label = "Poligono manual";
          width = 10;
          height = 8;
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

opciones : dialog {
    label = "Principal";
    : column {
      : row {
      label = "Suavizar curvas";
        : column {
         : radio_button {
           key = "si";
           label = "Si";
           alignment = right;
         }
         : radio_button {
           key = "no";
           label = "No";
           alignment = right;
         }
        }
        : popup_list {
          label = "Detalle de suavizado";
          key = "detall";
          mnemonic = "R";
          list = "Bajo\nMedio\nAlto";
          edit_width = 25;
          fixed_width = true;
        }
        : spacer { height = 1; }
      }
      : row {
        label = "Etiquetas";
        : column {
          : edit_box {
            label = "Frecuencia de etiquetas entre curvas" ;
            key = "frec" ;
            value = "2" ;
            edit_width = 10 ;
          }
          : edit_box {
            label = "Distancia entre etiquetas" ;
            key = "dit" ;
            value = "1" ;
            edit_width = 10 ;
          }
          : edit_box {
            label = "Distancia de ejes a etiquetas" ;
            key = "dite" ;
            value = "0.2" ;
            edit_width = 10 ;
          }
          : spacer { height = 0.001; }
        }
      }
      : row {
        label = "Fuente";
        : column {
          : row {
          : edit_box {
            label = "Color" ;
            key = "colort" ;
            value = "1" ;
            edit_width = 10 ;
          }
          : edit_box {
            label = "Tamaño" ;
            key = "tamt" ;
            value = "4" ;
            edit_width = 10 ;
          }
          }
          : spacer { height = 0.001; }
        }
      }
      : row {
        : column {
          : row {
          : edit_box {
            label = "Intervalo de curvas" ;
            key = "sepc" ;
            value = "1" ;
            edit_width = 10 ;
          }
          : button {
              key = "avanzado";
              label = "Opciones avanzadas";
              fixed_width = true;
              is_cancel = true; 
              alignment = centered;
          }
          }
          : spacer { height = 0.001; }
        }
      }
    }
    : spacer { height = 0.001; }
    ok_cancel;
}

opciones2 : dialog {
    label = "Opciones Avanzadas";
    : column {
      : column {
      label = "Datos";
        : popup_list {
          label = "Metodo de interpolacion de niveles";
          key = "metodo";
          mnemonic = "R";
          list = "Inverse distance to a power\nKriging\nMinimum curvature\nNearest Neighbor\nPolynomial Regression\nRadial basis Functions\nShepard's Metod\ntriangulation /w linear interpolation";
          edit_width = 30;
          alignment = centered;
          fixed_width = true;
        }
        : popup_list {
          label = "Tipo de busqueda de datos";
          key = "bdatos";
          mnemonic = "R";
          list = "Todos los datos\nSimple\nCuadrantes\nOctantes";
          edit_width = 30;
        }
        : spacer { height = 0.01; }
      }
      : row {
        label = "Tipo de lineas";
        : column {
          : row {
            : toggle {
              key = "t1";
              label = "Realizar degradado de colores";
              alignment = left;
            }
            : button {
                key = "col1";
                label = "Colores";
                fixed_width = true;
                alignment = left;
            }
           }
          : spacer { height = 0.001; }
        }
      }
      : row {
        label = "Intervalo de niveles";
        : column {
           : row {
            : radio_button {
              key = "aut";
              label = "Automatico";
              alignment = right;
            }
            : radio_button {
              key = "man";
              label = "Manual";
              alignment = right;
            }
           }
            : column {
              : edit_box {
                label = "Intervalo superior" ;
                fixed_width = true;
                key = "ints" ;
                value = "1" ;
                alignment = right;
                edit_width = 10 ;
              }
              : edit_box {
                label = "Intervalo inferior" ;
                alignment = right;
                fixed_width = true;
                key = "inti" ;
                value = "1" ;
                edit_width = 10 ;
              }
            }
          : spacer { height = 0.001; }
        }
      }
    }
    : edit_box {
      label = "Espacio entre renglones de reticula" ;
      key = "espr" ;
      value = "1" ;
      edit_width = 10 ;
    }
    : edit_box {
      label = "Numero de decimales a usar" ;
      key = "dec" ;
      value = "1" ;
      edit_width = 10 ;
    }
    : spacer { height = 0.001; }
    ok_cancel;
}