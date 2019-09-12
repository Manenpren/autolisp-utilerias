open "c:\ruta.dll" for input as #1
line input #1,ruta$
close #1
open "c:\xylim.xyz" for input as #2
line input #2,xmn$
line input #2,ymn$
line input #2,xmx$
line input #2,ymx$
close #2
Set Surf = CreateObject("Surfer.App")
Surf.FileNew()
SURF.DrawTextAttributes(,2,,,,"RED")
T = SURF.GRIDDATA("c:\topograf\prov2.csv",0,1,2,val(xmn$),val(xmx$),val(ymn$),val(ymx$),2,2,,,1,"C:\NIVLOT2.GRD",2,3,,,,,,,1,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)
T = SURF.GRIDDATA("c:\topograf\prov2.csv",0,1,2,val(xmn$),val(xmx$),val(ymn$),val(ymx$),15,15,,,1,"C:\NIVLOT2x.GRD",2,3,,,,,,,1,,,,,,,,,,,,,,,,,,,,,,,,,,,,,)
T = SURF.MAPCONTOUR("C:\nivlot2x.GRD",2,,,,,,4,,,,1,,3,1,1,,,,,,,)
IF T = 1 THEN T = SURF.FILEEXPORT("C:\NIVLOT2.DXF",0,,)
'IF T = 1 THEN T = SURF.GRIDSLICE("C:\nivlot2.GRD","c:\TOPOGRAF\BLN.CSV",,"C:\PERF.DAT",2)
IF T = 1 THEN T = surf.gridblank("c:\NIVLOT2.GRD","C:\LINEA.CSV","C:\BLN2.GRD",)
IF T = 1 THEN T = surf.gridvolume("c:\bln1.GRD",,"C:\BLN2.GRD",)
surf.filesave()
r% = shell(ruta$ + "SEPARA.EXE",1)
SURF.FILEEXIT(2)
end
