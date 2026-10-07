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

Unofficial Termux/Android ARM64 build of Ghidra 11.0 DEV.

Compiled locally on Termux from the original Ghidra source. No source modifications were made — only the binary build is redistributed here.

Ghidra is © NSA and licensed under Apache 2.0. Original LICENSE and NOTICE files are included in the archive.

This build is provided as-is, without warranty. Use at your own risk.

I assume no responsibility for any dependency issues or functional problems that may arise from using this build.
