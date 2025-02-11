# Release log
Fabrication results.


## v1.1 - 2025-02-11
![fix, not fabricated](https://img.shields.io/badge/fix%20(not%20fabricated)-indigo?style=for-the-badge&label=fabrication%20result)
> [Release v1.1](/doc/releaselog.md#v1.1) is a fix for v1.0, but was not fabricated at the time of release.
>
> :memo: Check the latest [release note of this version](https://github.com/VasilKalchev/PXLstick/releases/tag/v1.1) for a possible update on the fabrication status.


## v1.0-obsolete - 2023-06-11
![poor fabrication](https://img.shields.io/badge/poor-orangered?style=for-the-badge&label=fabrication%20result)
> Works, but has significant problems.

### Properties:
 - Fabricator: JLCPCB
 - Material: FR4 (Tg 135)
 - Layers: 2
 - PCB thickness: 1.2mm
 - Solder mask color: black
 - Silkscreen: white
 - Surface finish: HASL (with lead)
 - Copper weight: 1 oz
 - Via covering: tented
 - Board outline tolerance: +-0.2mm
 - Appearance quality: IPC Class 2 Standard
 - Silkscreen technology: Ink-jet/screen printing

### Problems:
#### Major
 - touch button on GPIO0/BOOT doesn't work properly, leaving the circle shape unused
 - no pull-up resistor on ESP32 pin EN
 - rotary encoder function icons don't match the actual modes

#### Minor
 - wire holes diameter is too narrow
 - touch buttons work better without resistors
 - WS281x signal overshoots and rings on long wire with the specified resistor value range
 - the power LED is too bright with the specified 330 ohm resistor
 - circle shape appears a bit larger than the others
 - release version is not visually accessible on the bottom layer once mounted
