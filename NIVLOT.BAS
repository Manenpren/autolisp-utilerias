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
T = SURF.GRIDDATA("c:\topograf\prov.csv",0,1,2,val(xmn$),val(xmx$),val(ymn$),val(ymx$),2,2,,,1,"C:\NIVLOT.GRD",2,3,,,,,,,1,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)
T = SURF.GRIDDATA("c:\topograf\prov.csv",0,1,2,val(xmn$),val(xmx$),val(ymn$),val(ymx$),15,15,,,1,"C:\NIVLOTx.GRD",2,3,,,,,,,1,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)
IF T = 1 THEN T = SURF.MAPCONTOUR("C:\NIVLOTx.GRD",2,,,0.1,,,4,,,,1,,3,1,1,,,,,,,)
IF T = 1 THEN T = SURF.GRIDSLICE("C:\NIVLOT.GRD","c:\TOPOGRAF\BLN.CSV",,"C:\PERF.DAT",2)
IF T = 1 THEN T = SURF.FILEEXPORT("C:\NIVLOT.DXF",0,,)
r% = shell(ruta$ + "SEPARA.EXE",1)
SURF.FILEEXIT(2)