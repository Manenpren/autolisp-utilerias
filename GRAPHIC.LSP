(DEFUN C:GRAPHIC ()
(GRCLEAR)
(grvecs '(1 (1 2)(100 300)
          2 (2 2)(200 300)       
          3 (3 2)(300 300)       
          4 (4 2)(400 300)       
          5 (5 2)(450 300)       

) )
;      (GRDRAW (10 10) (0 0) 1 1)
      (SETQ R (CAR (NENTSELP "")))
      (PRINT (ENTGET R))
      (SETQ G (FINDFILE "PROV.DWG"))
(setq pt2 (osnap pt1 "cen"))

(setq pt3 (osnap pt1 "end,int"))
)

;496 x
;298 y