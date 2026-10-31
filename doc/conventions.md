# Conventions

## Versioning
### Hardware (board)
Board releases are made with a major and a minor version (e.g. "PXL stick v1.2").

The major version is incremented when making incompatible changes to the board (including simple pin rearrangements). The minor version is incremented for simple fixes or small additions.


### Firmware (WLED)
The binary version is the combination of WLED's version and the board's version (e.g. `WLED_0.14.3_PXLstick_5.8.bin`).

Different board major versions require different firmware builds (e.g. "PXL stick v1.9" and "PXL stick v2.1" require different builds). A binary version with higher board minor version is backwards compatible with older boards of the same major version (e.g. `WLED_0.14.3_PXLstick_1.9.bin` is compatible with boards "PXL stick v1.9", "PXL stick v1.8" and so on).

After WLED release, the binaries should be rebuild with the new WLED version (e.g. `WLED_0.14.3_PXLstick_5.8.bin` becomes `WLED_0.15.0_PXLstick_5.8.bin`)


## Development and release
### Before starting development
New board versions are developed in a separate branch.

### During development
Every change to the board is documented in [changelog.md](changelog.md).

### Before release
A `release_checklist.md` is created in this directory and completed. It is deleted as its last step, so it only exists during a release (the last one can be found in the [repository's history](https://github.com/VasilKalchev/PXLstick/blob/22ab82ed39adb520c1ec7f8372f873361650d37e/doc/release_checklist.md)).
