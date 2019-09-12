;;; --------------------------------------------------------------------------;
;;;   ASCTEXT.LSP
;;;   Copyright (C) 1986-1992 by Autodesk, Inc.
;;;      
;;;   Permission to use, copy, modify, and distribute this software 
;;;   for any purpose and without fee is hereby granted, provided 
;;;   that the above copyright notice appears in all copies and that 
;;;   both that copyright notice and this permission notice appear in 
;;;   all supporting documentation.
;;;
;;;   THIS SOFTWARE IS PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED
;;;   WARRANTY.  ALL IMPLIED WARRANTIES OF FITNESS FOR ANY PARTICULAR
;;;   PURPOSE AND OF MERCHANTABILITY ARE HEREBY DISCLAIMED.
;;;
;;; --------------------------------------------------------------------------;
;;; DESCRIPTION
;;;
;;;   Use ASCTEXT.LSP to insert ASCII text files into AutoCAD drawings.
;;;   The blocks of text can be either Left, Center, Middle or Right
;;;   Justified.
;;;
;;;   The file name must include an extension and may include a
;;;   directory prefix, as in /acad/sample.txt or \\acad\\sample.txt.
;;;   Apart from height (unless fixed) & rotational angle,
;;;   "Text options" include:
;;;       Define distance between lines.
;;;       Define opening line for reading.
;;;       Define number of lines to read.
;;;       Global under/overscoring of lines.
;;;       Global upper/lower case change.
;;;       Column definitions.
;;;
;;; --------------------------------------------------------------------------;
;;;  GLOBAL variables
;;;  at_ang    : Last angle (for default value)
;;;  at_fnm    : Last file  (for default value)
;;;---------------------------------------------------------------------------;

;;;
;;; Save modes
;;;
(defun MODES (a) 
  (setq MLST '
        ())
  (repeat (length a) 
    (setq MLST (append MLST (list (list (car a) (getvar (car a))))))
    (setq a (cdr a))
  )
) 
;;;
;;; Restore modes
;;;
(defun MODER () 
  (repeat (length MLST) 
    (setvar (caar MLST) (cadar MLST))
    (setq MLST (cdr MLST))
  )
) 
;;;
;;; Ascii Text error handler
;;;
(defun at_err (st)                    ; If an error (such as CTRL-C) occurs
                                      ; while this command is active...
  (if (and (/= st "Function cancelled") 
           (/= st "quit / exit abort")
      )
    (princ (strcat "\nError: " st))
  ) 
  (moder)                             ; Restore modified modes
  (if (= (type rtfile) 'FILE) 
    (close rtfile)
  ) 
  (setq rtfile nil)
  (setq *error* olderr)               ; Restore old *error* handler
  (princ)
) 
;;;
;;; Function for inserting text a recalculation of insertion point.
;;;
(defun 1LTXT () 
  (if (member '1 opt) 
    (setq s (strcat "%%u" s "%%u"))
  ) 
  (if (member '2 opt) 
    (setq s (strcat "%%o" s "%%o"))
  ) 
  (if (member '4 opt) 
    (setq s (strcase s))
  ) 
  (if (member '8 opt) 
    (setq s (strcase s T))
  ) 
  (if (and (= lc (1+ nl)) (/= nl 0)) 
    (progn
      (setq lc 1)
      (setq pt (polar pt1 ang cd))
      (setq pt1 pt)
    )
  ) 
  (cond 
    ((and (= j "Aligned") h)        (command "_.TEXT" j  pt pt2 s))
    ((and (= j "Aligned") (null h)) (command "_.TEXT" j  pt pt2 s))
    ((and (= j "Fit")     h)        (command "_.TEXT" j  pt pt2 h s))
    ((and (= j "Fit")     (null h)) (command "_.TEXT" j  pt pt2 s))
    ((and (= (substr j 1 1) "L")        h) (command "_.TEXT" pt h (rtd ang) s))
    ((and (= (substr j 1 1) "L") (null h)) (command "_.TEXT" pt (rtd ang) s))
    ((and (/= (substr j 1 1) "L")       h) (command "_.TEXT" j  pt h (rtd ang) s))
    ((and (/= (substr j 1 1) "L")(null h)) (command "_.TEXT" j  pt (rtd ang) s))
  ) 
  (if (/= d "Auto") 
    (if (= (cdr (assoc 70 ts)) 4) 
      (setq pt (polar pt (+ (dtr 90) ang) d))
      (setq pt (polar pt (+ (dtr 270) ang) d))
    )
  ) 
  (setq c (1+ c))
  (if (= c n) 
    (setq eof T)
  )
) 
;;;
;;; Degrees to radians conversion
;;;
(defun DTR (y) 
  (* pi (/ y 180.0))
) 
;;;
;;; Radians to degrees conversion
;;;
(defun RTD (Y) 
  (* 180.0 (/ y pi))
) 
;;;
;;; List the options.
;;;
(defun justpn ()
  (if (getvar "DIMCLRD") (textpage))
  (princ "\nAlignment options: ")
  (princ "\n\t TLeft   TCenter   TRight ")
  (princ "\n\t MLeft   MCenter   MRight ")
  (princ "\n\t BLeft   BCenter   BRight ")
  (princ "\n\t  Left    Center    Right")
  (princ "\n\tAligned   Middle    Fit")
  (if (not (getvar "DIMCLRD")) (textscr))
  (princ "\n\nPress any key to return to your drawing. ")
  (grread)
  (princ "\r                                           ")
  (graphscr)
)
;;;
;;; -------------------------- MAIN PROGRAM ----------------------------------
;;;
(defun asctxt (/ olderr ang c cd d eof rtfile rf rfa h j l1 opt pt pt1 ts n nl 
                    lc s ul)          ; at_ang holds default ANGLE
                                      ; at_fnm holds default FILE
  (setq olderr *error* 
        *error* at_err)
  (modes '("BLIPMODE" "CMDECHO" "HIGHLIGHT"))
  (while (null rtfile)                ; Prompt for file to be inserted
    (if (null at_fnm)
      (if (= 1 (getvar "FILEDIA"))
        (setq rf (getfiled "File to Read" "" "" 12))
        (progn
          (initget 1) 
          (princ "\nFile to read (including extension): ")
          (setq rf (getstring))
        ) 
      )
      (if (= 1 (getvar "FILEDIA"))
        (setq rf (getfiled "File to Read" at_fnm "" 12))
        (progn
          (princ "\nFile to read (including extension)/<") 
          (princ (strcat at_fnm ">: "))
          (setq rf (getstring))
        )
      )
    ) 
    (if (= rf nil) (exit))
    (if (= rf 1)
      (if (null at_fnm)
        (progn
          (initget 1) 
          (princ "\nFile to read (including extension): ")
          (setq rf (getstring))
        ) 
        (progn
          (princ "\nFile to read (including extension)/<") 
          (princ (strcat at_fnm ">: "))
          (setq rf (getstring))
        )
      )
    )
    (if (and (= rf "") (/= nil at_fnm)) 
      (setq rf at_fnm)
    ) 
    (setq rfa (findfile rf))
    (if (= "~" rf) 
      (progn 
        (setq rfa nil)
        (setq rtfile nil)
      ) 
    )
    (if rfa 
      (progn
        (setq at_fnm rfa)
        (if (null (setq rtfile (open rfa "r")))
          (princ (strcat 
            "\n\tFile found, but couldn't open " at_fnm " for reading. "))
        )
      )
      (if (/= "~" rf)
        (if (and (< 4 (strlen rf))
                 (/= (substr rf (- (strlen rf) 3) 1) ".")
            )
          (princ "\nFile not found.  Extension may be missing.")
          (princ "\nFile not found. ")
        )
      )
    )
  ) 
  (setq cont T)
  ;; Prompt for start point or justification
  (while cont                         
    (if (getvar "DIMCLRD")
      (initget 1 (strcat "TLeft TCenter TRight "
                         "MLeft MCenter Mright "
                         "BLeft BCenter Bright "
                         "Aligned Center Fit Left Middle Right ?"))
      (initget 1 "Aligned Center Fit Left Middle Right ?")
    )
    (setq pt (getpoint 
             "\nStart point or Center/Middle/Right/?: "))
    (if (/= (type pt) 'LIST) 
      (if (= pt "?")
        (progn
          (justpn)
          (setq cont T)
        )
        (progn
          (setq cont nil)
          ;;(setq j (substr pt 1 2))
          (setq j pt)
          (if (= j "Center") (setq j "MCenter"))
          (initget 1) 
          (setq pt (getpoint (strcat "\n" pt " point: ")))
          (if (or (= j "Aligned") (= j "Fit"))
            (progn
              (initget 1)
              (setq pt2 (getpoint pt (strcat "\nOther point: ")))
              (setq at_ang (* (/ 180 pi) (angle pt pt2)))
            )
          )
        )
      )
      (setq j    "L"
            cont nil
      )
    )
  )                                   ; Prompt for an insertion point
  (setq pt1 pt)                       ; First insertion point

  ;; Prompt for a text height

  (setq ts (tblsearch "STYLE" (getvar "TEXTSTYLE")) 
        h  nil)
  (if (and (/= j "Aligned") (= (cdr (assoc 40 ts)) 0.0)) 
    (progn
      (initget 6) 
      (setq h (getdist pt (strcat "\nHeight <" 
                                  (rtos (getvar "TEXTSIZE")) ">: ")))
      (if (null h) 
        (setq h (getvar "TEXTSIZE"))
      )
    )
  )                                   ;Prompt for rotation angle of text
  (if (null at_ang) 
    (progn
      (if (= (cdr (assoc 70 ts)) 4)   ; Vertical style text
        (progn
          (setq at_ang 270)
          (princ "\nRotation angle <270>: ")
        ) 
        (progn
          (setq at_ang 0)
          (princ "\nRotation angle <0>: ")
        )
      )
    ) 
    (if (and (/= j "Aligned") (/= j "Fit"))
      (progn
        (princ "\nRotation angle <") 
        (princ (strcat (angtos at_ang) ">: "))
        (setq ang (getangle pt))
      )
    )
  ) 
  (if (null ang) 
    (setq ang at_ang)
  ) 
  (setq at_ang ang)
  (setq d "Auto" 
        l1 1 
        n "All" 
        opt nil 
        lc 0 
        nl 0 
        c 0)
  (initget "Yes No") 
  (if (= "Yes" (getkword "\nChange text options? <N>: ")) 
    (progn                            ; Prompt for distance between lines.
      (initget "Auto") 
      (setq d (getdist pt "\nDistance between lines/<Auto>: "))
      (if (= d nil) 
        (setq d "Auto")
      )                               ; Prompt for first line to read.
      (initget (+ 2 4)) 
      (setq l1 (getint "\nFirst line to read/<1>: "))
      (if (null l1) 
        (setq l1 1)
      )                               ; Prompt for number of following lines.
      (initget (+ 2 4) "All")         
      (setq n (getint "\nNumber of lines to read/<All>: "))
      (if (= n "All") 
        (setq n nil)
      ) 
      (initget "Yes No") 
      (if (= "Yes" (getkword "\nUnderscore each line? <N>: ")) 
        (setq opt (append opt '(1)))
      ) 
      (initget "Yes No") 
      (if (= "Yes" (getkword "\nOverscore each line? <N>: ")) 
        (setq opt (append opt '(2)))
      )                               ; Option for global redefinition of text-
                                      ; case.
      (initget "Upper Lower No") 
      (princ "\nChange text case? ") 
      (setq ul (getkword "  Upper/Lower/<N>: "))
      (cond ((= ul "Upper") (setq opt (append opt '(4)))) 
        ((= ul "Lower") (setq opt (append opt '(8))))
      )                               ; Option for setting up columns.
      (initget "Yes No") 
      (if (= "Yes" (getkword "\nSet up columns? <N>: ")) 
        (progn
          (setq opt (append opt '(16)))
          (initget (+ 1 2)) 
          (setq cd (getdist pt "\nDistance between columns: "))
          (initget (+ 1 2 4)) 
          (setq nl (getint "\nNumber of lines per column: "))
        )
      )
    )
  ) 
  (setvar "BLIPMODE" 0)
  (setvar "HIGHLIGHT" 0)
  (setvar "CMDECHO" 0)
  (setq eof nil)
  (setq s (repeat l1 
            (read-line rtfile)
          ))
  (setq lc (1+ lc))
  (1ltxt) 
  (while (null eof) 
    (if (= d "Auto") 
      (progn
        (setq s (read-line rtfile))
        (setq lc (1+ lc))
        (if s 
          (progn
            (if (= lc (1+ nl)) 
              (1ltxt) 
              (progn
                (if (member '1 opt) 
                  (setq s (strcat "%%u" s "%%u"))
                ) 
                (if (member '2 opt) 
                  (setq s (strcat "%%o" s "%%o"))
                ) 
                (if (member '4  opt) 
                  (setq s (strcase s))
                ) 
                (if (member '8 opt) 
                  (setq s (strcase s T))
                ) 
                (command "_.TEXT" "" s) 
                (setq c (1+ c))
                (if (= c n) 
                  (setq eof T)
                )
              )
            )
          ) 
          (setq eof T)
        )
      ) 
      (progn
        (setq s (read-line rtfile))
        (setq lc (1+ lc))
        (if s 
          (1ltxt) 
          (setq eof T)
        )
      )
    )
  ) 
  (close rtfile) 
  (setq rtfile nil)
  (moder)                             ; Restore modified modes
  (setq *error* olderr)               ; Restore old *error* handler
  (princ)
) 

;(defun c:at () (asctxt))
(defun c:asctext () (asctxt))
(princ "\n  ASCTEXT loaded.")
(princ)
