open "c:\ruta.dll" for input as #1
line input #1,ruta$
close #1
Set Surf = CreateObject("Surfer.App")
open "c:\xylim.xyz" for input as #2
line input #2,xmn$
line input #2,ymn$
line input #2,xmx$
line input #2,ymx$
close #2
Surf.FileNew()
SURF.DrawTextAttributes(,2,,,,"RED")
T = surf.gridblank("c:\NIVLOT.GRD","C:\LINEA.CSV","C:\BLN1.GRD",)
if t = 1 then t = surf.grIdconvert("C:\BLN1.GRD","C:\OUT.GRD",2)
if t = 1 then t = surf.grIdconvert("C:\OUT.GRD","C:\BLN1.GRD",2)
Open "C:\TEMP.TMP" For Output As #1
Print #1, "S"
Close #1
SURF.FILEEXIT(2)
eND