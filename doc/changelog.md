# Change log


## v1.1 - 2025-02-11
### Schematic
#### Added
 - Pull-up resistors to "EN" and "BOOT" pins.
 - Capacitor to "EN" pin.

#### Fixed
 - Moved touch button "circle" from GPIO0 to GPIO14.

#### Changed
 - Moved LED from power rail to GPIO2.
 - Increased LED's resistor from 330Ω to 470Ω.
 - Increased all pull-up resistors from 10kΩ to 20kΩ.
 - Increased SN74LVC1T45DCK's output resistor from 33Ω to 430Ω.
 - Increased SN74LVC1T45DCK's capacitors to 470n.

#### Removed
 - RST and BOOT buttons (were DNP).
 - Series resistors from touch buttons.
 - All test points.

### Board
#### Changed
 - Decreased copper pour clearance to 0.2mm.
 - Decreased traces width from 0.3mm to 0.2mm.
 - Increased wire holes diameters from 0.4mm to 0.9mm.
 - Silkscreen board name to "PXLstick".
 - Increased widths of touch buttons' silkscreen shapes.

#### Removed
 - Unused rotary encoder's silkscreen icons.
 - Some unused ESP32 pads.


## v1.0 - 2023-06-11
First release.


<!-- template

## vX.Y-type - 202Y-MM-DD
Comment...

## Schematic/Board
### Added
 - ... (#<issue>)
 -

### Fixed
 -
 -

### Changed
 -
 -

### Removed
 -
 -

-->
