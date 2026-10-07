# Ghidra 11.0 DEV — Termux / Android ARM64

Native ARM64 build of Ghidra 11.0 DEV, compiled locally on Termux (Android aarch64).

## Usage
1. Extract:
   tar -xzf ghidra-11.0-Dev-termux-arm64.tar.gz
2. Run:
   cd ghidra_11.0_DEV
   ./ghidraRun

GUI requires termux-x11 or VNC.

## Build environment
- Termux (Android aarch64)
- Android NDK (aarch64 toolchain)
- OpenJDK 17+
- Ghidra source: ghidra_11.0_DEV

## Native components (ARM64, built from source)
- GPL/DemanglerGnu/os/linux_arm_64/demangler_gnu_v2_24
- GPL/DemanglerGnu/os/linux_arm_64/demangler_gnu_v2_41
- Ghidra/Features/Decompiler/os/linux_arm_64/sleigh
- Ghidra/Features/Decompiler/os/linux_arm_64/decompile
- jffi native libs (ARM64)

## Known issues
- lib7-Zip-JBinding.so is still x86-64, so 7z archive import will not work.
  Everything else (including the decompiler) is native ARM64.

## License
Based on NSA Ghidra (Apache 2.0). See LICENSE and NOTICE inside the archive.
