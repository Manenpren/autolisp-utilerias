(DEFUN C:CAMBIA ()
    (SETQ GPO (SSGET))
    (COMMAND "CHANGE" GPO "" "P" "LA" "3" "")
)
