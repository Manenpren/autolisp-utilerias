open "c:\ruta.dll" for input as #1
line input #1,ruta$
close #1
prov$ = "0.1"
open "c:\vsuma.tmp" for output as #1
print #1, prov$
close #1
Set Surf = CreateObject("Surfer.App")
open "c:\xylim.xyz" for input as #2
line input #2,xmn$
line input #2,ymn$
line input #2,xmx$
line input #2,ymx$
close #2
vsuma = 1
Surf.FileNew()
SURF.DrawTextAttributes(,2,,,,"RED")
T = SURF.GRIDDATA("c:\topograf\prov2.csv",0,1,2,val(xmn$),val(xmx$),val(ymn$),val(ymx$),2,2,,,1,"C:\NIVLOT2.GRD",2,3,,,,,,,1,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)
IF T = 1 THEN T = surf.gridblank("c:\NIVLOT.GRD","C:\LINEA.CSV","C:\BLN1.GRD",)
IF T = 1 THEN T = surf.gridblank("c:\NIVLOT2.GRD","C:\LINEA.CSV","C:\BLN2.GRD",)
if t = 1 then t = surf.grIdconvert("C:\BLN2.GRD","C:\OUT.GRD",2)
if t = 1 then t = surf.grIdconvert("C:\OUT.GRD","C:\BLN2.GRD",2)
if t = 1 then t = surf.grIdconvert("C:\BLN1.GRD","C:\OUT.GRD",2)
if t = 1 then t = surf.grIdconvert("C:\OUT.GRD","C:\BLN1.GRD",2)
SURF.FILEEXIT(2)
h = shell(ruta$ + "checa",1)
eND