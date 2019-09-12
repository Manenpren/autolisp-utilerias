(defun c:is2 ()
  (setq inicio (getint "dame el numero de inicio "))
  (repeat 10000
    (setq PUNTO (getpoint " punto en donde insertar : "))
    (command "insert" "punto" punto "5" "" "" inicio "TN")
    (setq inicio (1+ inicio))
  )
)
