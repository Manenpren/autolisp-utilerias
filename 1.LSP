(defun C:1 ()
  (COMMAND "LAYER" "OFF" "RETICULA" "")
)

(defun C:2 ()
  (COMMAND "LAYER" "ON" "RETICULA" "")
)

(defun C:3 ()
  (COMMAND "LAYER" "OFF" "gslayer" "")
)

(defun C:4 ()
  (COMMAND "LAYER" "ON" "gslayer" "")
)

(defun C:Q ()
  (COMMAND "LAYER" "ON" "*" "")
)