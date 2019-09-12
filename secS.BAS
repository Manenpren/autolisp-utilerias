open "c:\ruta.dll" for input as #1
line input #1,ruta$
close #1
Set Surf = CreateObject("Surfer.App")
Surf.FileNew()
OPEN "C:\LISPMSA\GRD.GRI" FOR INPUT AS #1
LINE INPUT #1, LIN$
CLOSE #1
SURF.GRIDSLICE(LIN$,"C:\PERF.BLN",,"C:\PERF.DAT",)
r% = shell(ruta$ + "SEPARA.EXE",1)
SURF.FILEEXIT(2)
