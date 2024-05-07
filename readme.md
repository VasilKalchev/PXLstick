# <p align="center">PXL stick v1.0</p>

<p align="center">
  Board for driving WS281x lights with ESP32 running <a href="https://github.com/Aircoookie/WLED">Aircoookie's WLED</a> firmware
</p>

![images of the 3D render of the board from different angles and of the PCB project][head_img]


![poor fabrication](https://img.shields.io/badge/poor-orangered?style=for-the-badge&label=fabrication%20result)
> The fabricated board from release v1.0 worked, but has [significant problems][releaselog_v1_0].
>
> :exclamation: Browse [repository releases][repo_releases] for a better version.


### WLED firmware
> [!NOTE]
> If you haven't heard of [WLED][wled_repo], it's best to check it out first.

---


## Characteristics
*The board is intended for mounting on some kind of vertical stick, that has a **WS281x LED strip** on it.*

 - Runs a **custom build** of WLED on a [ESP32-WROOM-32E][esp32_wroom_32e] module.
 - Physically controllable through **2 user configurable touch buttons** and a **rotary encoder** for brightness and color.
 - It also has an **infrared receiver** for further flexibility.
 - Equipped with an I<sup>2</sup>S mic to enable WLED's **audio reactive** effects.
 - **Level shifted** WS281x data signal.
 - **Narrow** form factor: 25x100mm


## How to use it?
> [!WARNING]
> This version of the board has problems discovered after the release. It's not recommended for use!


1. [PCB fabrication](#1-pcb-fabrication)
2. [Assembly](#2-assembly)
3. [Wiring and mounting](#3-wiring-and-mounting)
4. [Firmware binary](#4-firmware-binary)
5. [Flashing](#5-flashing)
6. [Configuration](#6-configuration)


### 1. PCB fabrication
The [release][repo_release_v1_0] includes [Gerber and drill files][dw_gerbers], generated according to [JLCPCB's instructions][jlcpcb_gerbers_spec]. Other fabricators may have different Gerber and drill files requirements, in which case you'll have to generate the files manually, according to their specification.

If you have made modifications to the PCB and want to regenerate the exports - you can use the scripts provided in [/hw/export/](/hw/export/).


### 2. Assembly
#### INMP441 mic
![INMP441 variants][inmp441_variants_img]

There are two footprints for the INMP441 mic. *U3* is for its 9-terminal LGA_CAV package (located on the back of the PCB) and *A1* is for its breakout board (can be soldered on either side). When using the breakout board - don't solder *C7*, *R9* and *R10*.

#### Optional peripherals
 - IR receiver (*U2, R8, C6*)
 - rotary encoder (*RE1, R2, R3, R4, C3, C4, C5*)
 - microphone (*U2/A1, R9, R10, C7*)
 - power status LED (*D1, R1*)

### 3. Wiring and mounting
The board is powered with 5V by soldering wires to the through-hole pads marked with "5V" and the symbol for ground (located below ESP32-WROOM-32E).

WS281x's data wire is soldered to the through-hole pad marked with the LED graphic.

Holes *H1* and *H2* are used for mounting the board with 2mm screws.


### 4. Firmware binary
The [release][repo_release_v1_0] includes a [customized WLED binary][dw_binary]. This is required, because the WLED firmware supports rotary encoders when compiled with a "usermod".

If you want to customize your build further - you can use my [fork of WLED][wled_fork] which includes the [configuration][wled_fork_cfg] for the custom build.


### 5. Flashing
Flashing the firmware for the first time requires connecting to the board through a USB to serial adapter.

The programming pins are exposed on the left side of the board. You can avoid soldering a pin header and just put a header or jumper wires through the plated holes.

> [!TIP]
> If you get an error while flashing firmware - try putting ESP32 in bootloader mode manually.
>
> This is done by momentarily pulling pin "EN" low (restart) while pin "BOOT" is pulled low. Pins "EN" and "BOOT" are exposed as pads, "EN" is located to the left of the ESP32 module and "BOOT" is to the right. Shorting these pads - pulls the pins low.


#### Method A: Flashing directly with Espressif's `esptool`
1. Follow the [instructions to install esptool][esptool_install].
2. Flash [WLED's bootloader][dw_bootloader]:
```
esptool.py write_flash 0x0 ./esp32_bootloader_v4.bin
```
3. Flash the firmware binary:
```
esptool.py write_flash 0x10000 ./WLED_XXX.bin
```

If you experience issues - try erasing the flash first:
```
esptool.py erase_flash
```

> [!NOTE]
> This method is taken from [WLED's documentation][wled_flash_method2] web site.


#### Method B: Flashing with WLED's web installer and performing an OTA update
You can avoid installing `esptool` by using [WLED's web installer][wled_web_installer] to flash WLED's official firmware and then performing an OTA update with the provided custom binary.


### 6. Configuration
You can now continue with [WLED's getting started guide][wled_getting_started_guide] to configure your board.

> [!TIP]
> After connecting the board to your Wi-Fi network you can apply the provided base configuration by going to "Config" > "Security & Updates" > "Restore configuration" and uploading the provided [base configuration file][dw_base_cfg]. Then you'll have to configure the Wi-Fi again.

#### Board connections:
| ESP32 pin | peripheral              |
|-----------|-------------------------|
| GPIO 4    | WS281x                  |
| GPIO 32   | touch button "square"   |
| GPIO 33   | touch button "triangle" |
| GPIO 23   | IR receiver             |
| GPIO 27   | rotary encoder 1        |
| GPIO 16   | rotary encoder 2        |
| GPIO 17   | rotary encoder button   |
| GPIO 15   | INMP441 SD              |
| GPIO 13   | INMP441 WS              |
| GPIO 25   | INMP441 SCK             |


<!-- links -->
[head_img]: /doc/assets/head.png
[inmp441_variants_img]: /doc/assets/inmp441_variants.png

[releaselog_v1_0]: /doc/releaselog.md#v10---2023-06-11 "/doc/releaselog.md"
[repo_release_v1_0]: https://github.com/VasilKalchev/PXLstick/releases/tag/v1.0 "PXL stick release v1.0"
[repo_releases]: https://github.com/VasilKalchev/PXLstick/releases "All PXL stick releases"

[wled_repo]: https://github.com/Aircoookie/WLED "WLED's repository"
[esp32_wroom_32e]: https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32e_esp32-wroom-32ue_datasheet_en.pdf "ESP32-WROOM-32E datasheet"
[inmp441]: https://invensense.tdk.com/wp-content/uploads/2015/02/INMP441.pdf "INMP441 datasheet"
[jlcpcb_gerbers_spec]: https://jlcpcb.com/help/article/362-how-to-generate-gerber-and-drill-files-in-kicad-7 "JLCPCB: How to generate Gerber and drill files in KiCad 7"

[dw_gerbers]: https://github.com/VasilKalchev/PXLstick/releases/download/v1.0/gerbers_jlcpcb.zip "Download gerbers_jlcpcb.zip"
[dw_binary]: https://github.com/VasilKalchev/PXLstick/releases/download/v1.0/WLED_0.14.3_PXLstick_v1.0.bin "Download WLED_0.14.3_PXLstick_v1.0.bin"
[dw_bootloader]: https://github.com/Aircoookie/WLED/releases/download/v0.13.1/esp32_bootloader_v4.bin "Download esp32_bootloader_v4.bin"
[dw_base_cfg]: https://github.com/VasilKalchev/PXLstick/releases/download/v1.0/WLED_0.14.3_PXLstick_v1.0_basecfg.json "Download WLED_0.14.3_PXLstick_v1.0_basecfg.json"

[wled_fork]: https://github.com/VasilKalchev/WLED "Fork of WLED repository for custom builds"
[wled_fork_cfg]: https://github.com/VasilKalchev/WLED/blob/4febf0a671bf4d266bcb785312891e56a2469468/platformio.ini#L836-L875 "Custom build configuration for PXL stick v1"

[esptool_install]: https://docs.espressif.com/projects/esptool/en/latest/esp32/ "Espressif's esptool.py documentation"
[wled_web_installer]: https://install.wled.me/

[wled_flash_method2]: https://kno.wled.ge/basics/install-binary/#:~:text=properly%20by%20WLED.-,Flashing%20method%202%3A%20esptool,-First%20of%20all "WLED's flashing guide: method 2"
[wled_getting_started_guide]: https://kno.wled.ge/basics/getting-started/#:~:text=3.%20Use%20a%20WiFi%20device%20to%20connect%20to%20the%20access%20point%20WLED%2DAP "WLED's getting started guide: Wi-Fi configuration"



<!--
<details>
<summary>/readme.md checklist</summary>

 - [x] set current version (after project name)
 - [x] set fabrication status
 - [x] update sections: [Characteristics](#characteristics) and [How to use it?](#how-to-use-it)
 - [x] comment out this "checklist" and "templates" sections

</details>
-->

<!--
<details>
<summary>/readme.md templates</summary>

## "Fabrication result" section:

![bad fabrication](https://img.shields.io/badge/bad-firebrick?style=for-the-badge&label=fabrication%20result)
> The fabricated board from release vX.Y [didn't work](/doc/releaselog.md#vXY---202Y-MM-DD).
>
> :exclamation: Browse [repository releases][repo_releases] for a better version.

---

![poor fabrication](https://img.shields.io/badge/poor-orangered?style=for-the-badge&label=fabrication%20result)
> The fabricated board from release vX.Y worked, but has [significant problems](/doc/releaselog.md#vXY---202Y-MM-DD).
>
> :exclamation: Browse [repository releases][repo_releases] for a better version.

---

![average fabrication](https://img.shields.io/badge/average-yellow?style=for-the-badge&label=fabrication%20result)
> The fabricated board from release vX.Y worked, but has [some problems](/doc/releaselog.md#vXY---202Y-MM-DD).
>
> :grey_exclamation: Browse [repository releases][repo_releases] for a better version.

---

![ok fabrication](https://img.shields.io/badge/ok-greenyellow?style=for-the-badge&label=fabrication%20result)
> The fabricated board from release vX.Y worked, but has [minor problems](/doc/releaselog.md#vXY---202Y-MM-DD).
>
> :memo: Browse [repository releases][repo_releases] for a better version.

---

![good fabrication](https://img.shields.io/badge/good-limegreen?style=for-the-badge&label=fabrication%20result)
> The fabricated board from release vX.Y worked without problems!
>
> :tada: Recommended for fabrication.

---

![in development](https://img.shields.io/badge/in_development-dimgrey?style=for-the-badge&label=fabrication%20result)
> This version is currently in development...
>
> :hourglass_flowing_sand: Wait for the release or browse [repository releases][repo_releases] for an older, completed version.

---

![will not fabricate](https://img.shields.io/badge/won\'t_be_fabricated-firebrick?style=for-the-badge&label=fabrication%20result)
> Release vX.Y won't be fabricated, because ... .
>
> :exclamation: Browse [repository releases][repo_releases] for a better version.

---

![fix, not fabricated](https://img.shields.io/badge/fix%20(not%20fabricated)-indigo?style=for-the-badge&label=fabrication%20result)
> [Release vX.Y](/doc/releaselog.md#vX.Y) is a fix for vX.Y, but was not fabricated at the time of release.
>
> :memo: Check the latest [release note of this version](https://github.com/VasilKalchev/PXLstick/releases/tag/vX.Y) for a possible update on the fabrication status.

</details>
-->
