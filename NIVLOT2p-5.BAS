open "c:\ruta.dll" for input as #1
line input #1,ruta$
close #1
open "c:\RESULTADO.tmp" for input as #1
line input #1,ELEV$
line input #1,ELEV$
close #1
Set Surf = CreateObject("Surfer.App")
Surf.FileNew()
t = 1
ELEV2# = VAL(ELEV$)
IF T = 1 THEN T = surf.gridvolume("c:\bln1.GRD",,,ELEV2#)
IF T = 1 THEN T = surf.filesave()
Open "C:\TEMP.TMP" For Output As #1
Print #1, "S"
Close #1
SURF.FILEEXIT(2)
