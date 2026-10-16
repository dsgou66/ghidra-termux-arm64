<img src="Ghidra/Features/Base/src/main/resources/images/GHIDRA_3.png" width="400">
# ghidra-termux-arm64

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

## Development

When Eclipse finishes building the projects, Ghidra can be launched and debugged with the provided
**Ghidra** Eclipse *run configuration*.

For more detailed information on developing Ghidra, please read the [Developer Guide][devguide].

## Contribute

If you would like to contribute bug fixes, improvements, and new features back to Ghidra, please
take a look at our [Contributor Guide][contrib] to see how you can participate in this open
source project.

## License

Based on NSA Ghidra (Apache 2.0). See LICENSE and NOTICE inside the archive.


[nsa]: https://www.nsa.gov
[contrib]: CONTRIBUTING.md
[devguide]: DevGuide.md
[known-issues]: DevGuide.md#known-issues
[career]: https://www.intelligencecareers.gov/nsa
[releases]: https://github.com/NationalSecurityAgency/ghidra/releases
[jdk17]: https://adoptium.net/temurin/releases
[gradle]: https://gradle.org/releases/
[vs]: https://visualstudio.microsoft.com/vs/community/
[vcbuildtools]: https://visualstudio.microsoft.com/vs/community/
[eclipse]: https://www.eclipse.org/downloads/packages/
[master]: https://github.com/NationalSecurityAgency/ghidra/archive/refs/heads/master.zip
[security]: https://github.com/NationalSecurityAgency/ghidra/security/advisories
[ghidradev]: https://htmlpreview.github.io/?https://github.com/NationalSecurityAgency/ghidra/blob/master/GhidraBuild/EclipsePlugins/GhidraDev/GhidraDevPlugin/GhidraDev_README.html
