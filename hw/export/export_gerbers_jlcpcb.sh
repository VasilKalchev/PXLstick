mkdir ./gerbers_jlcpcb/
kicad-cli pcb export gerbers -o ./gerbers_jlcpcb/ -l B.Cu,B.Mask,B.Silkscreen,B.Paste,F.Cu,F.Mask,F.Silkscreen,F.Paste,Edge.Cuts --no-x2 --subtract-soldermask --precision 6 ../pxl_stick.kicad_pcb

kicad-cli pcb export drill -o ./gerbers_jlcpcb/ --format excellon --drill-origin absolute --excellon-zeros-format decimal --excellon-oval-format alternate --excellon-units mm --excellon-separate-th --generate-map --map-format gerberx2 ../pxl_stick.kicad_pcb
