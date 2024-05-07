kicad-cli sch export pdf -o sch.pdf ../pxl_stick.kicad_sch

kicad-cli pcb export svg -o pcb-sheet.svg -l B.Cu,B.Mask,B.Silkscreen,F.Cu,F.Mask,F.Silkscreen,Edge.Cuts ../pxl_stick.kicad_pcb
kicad-cli pcb export svg -o f-pcb-sheet.svg -l F.Cu,F.Mask,F.Silkscreen,Edge.Cuts ../pxl_stick.kicad_pcb
kicad-cli pcb export svg -o b-pcb-sheet.svg -l B.Cu,B.Mask,B.Silkscreen,Edge.Cuts --mirror ../pxl_stick.kicad_pcb
