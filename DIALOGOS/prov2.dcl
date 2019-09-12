hello : dialog {
  label        = "Point Style";
  : column {
    : row {
      : image_button {
        key          = "pdmode0";
        width        = 40;
        aspect_ratio = 1.0;
        color        = 256;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode1";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode2";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode3";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode4";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
    }
    : row {
      : image_button {
        key          = "pdmode32";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode33";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode34";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode35";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode36";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
    }
    : row {
      : image_button {
        key          = "pdmode64";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode65";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode66";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode67";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode68";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
    }
    : row {
      : image_button {
        key          = "pdmode96";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode97";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode98";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode99";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
      : image_button {
        key          = "pdmode100";
        width        = 5;
        aspect_ratio = 1.0;
        color        = 0;
        allow_accept = true;
      }
    }
  }
  : column {
    fixed_height = true;
    spacer_1;
    : row {
      : edit_box {
        mnemonic             = "S";
        label                = "Point Size:";
        key                  = "pdsize_value";
        edit_width           = 10;
        horizontal_alignment = left;
        allow_accept         = true;
      }
      : text {
        label = "";
        key   = "pdsize_label";
        width = 12;
      }
    }
: paragraph 
{
  : concatenation 
  {
    : text_part 
    {
      label = "One";
    }
    : text_part
    {
      label = "good turn";
    }
  }
  : text_part {
    label = "Deserves another";
  }
}
    : radio_column {
      fixed_height = true;
      : radio_button {
        label       = "Set Size Relative to Screen";
        mnemonic    = "R";
        key         = "pdsize_r";
        is_tab_stop = false;
      }
      : radio_button {
        label       = "Set Size in Absolute Units";
        mnemonic    = "A";
        key         = "pdsize_a";
        is_tab_stop = false;
      }
    }
  }
  spacer_1;
  ok_cancel_help_errtile;
}