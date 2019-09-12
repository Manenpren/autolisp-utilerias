open "c:\ruta.prv" for input as #1
line input #1,ruta$
line input #1,detall$
line input #1,si$
line input #1,frec$
line input #1,dit$
line input #1,dite$
line input #1,colort$
line input #1,tamt$
line input #1,sepc$
line input #1,metodo$
line input #1,bdatos$
line input #1,tog1$
line input #1,ints$
line input #1,inti$
line input #1,espr$           '
line input #1,dec$
close #1
Set Surf = CreateObject("Surfer.App")
Surf.FileNew()
VTAMT = VAL (tamt$)
VCOLORT = VAL (colort$)
if si$ = "S" then 
  opsi = 2 
else
  opsi = 0
endif
SURF.DrawTextAttributes(,VTAMT,,,,"RED")
T = SURF.GRIDDATA(ruta$,0,1,2,,,,,val(espr$),,,,val(metodo$),"C:\NIVLOT.GRD",1)
'T = SURF.GRIDDATA(ruta$,0,1,2,,,,,val(espr$),,,,val(metodo$),"C:\NIVLOT.GRD",1,val(bdatos$))
IF T = 1 THEN T = SURF.MAPCONTOUR("C:\NIVLOT.GRD",opsi,,,VAL (sepc$),,,2,,,,val(detall$),,VAL(FREC$),VAL(DIT$),VAL(DITE$))
IF T = 1 THEN T = SURF.FILEEXPORT("C:\NIVLOT.DXF",0,,)
Open "C:\TEMP.TMP" For Output As #1
Print #1, "S"
Close #1
SURF.FILEEXIT(2)
