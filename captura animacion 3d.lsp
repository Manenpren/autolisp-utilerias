(defun c:cap ()
    (SETQ CONT 1)
 (repeat 36
   (command "Rotate" "all" "" "-19.5105,3.0595" 10 "hide")
   (COMMAND "MSLIDE" (STRCAT "e:\\dwg\\s" (ITOA CONT)))
   (SETQ CONT (1+ CONT))
 )
)