<img src="Ghidra/Features/Base/src/main/resources/images/GHIDRA_3.png" width="400">

*   Android phone with **Termux** installed (get it from [F-Droid](https://f-droid.org/packages/com.termux/) or [GitHub Releases](https://github.com/termux/termux-app/releases))
*   A VNC client — [RealVNC Viewer](https://www.realvnc.com/en/connect/download/viewer/) recommended
*   About 1–2 GB of free storage for Ghidra and its dependencies
Ghidra on Termux ARM64

Native ARM64 build of Ghidra 11.0 DEV, compiled locally on Termux (Android aarch64).

This repository provides a native ARM64 build of Ghidra that runs directly on Android phones via Termux, with one-command setup scripts and a VNC usage guide.

---

1. Download Ghidra

Option A: Download the prebuilt tarball (recommended)

Go to the Releases page and download the packaged archive:

👉 https://github.com/dsgou66/ghidra-termux-arm64/releases

Find ghidra-11.0-Dev-termux-arm64.tar.gz and download it.

Option B: Build from source

Clone the repository and build it yourself:

```bash
git clone https://github.com/dsgou66/ghidra-termux-arm64.git
cd ghidra-termux-arm64
```

---

2. Get the Setup Scripts and Install Dependencies (Termux)

Open Termux. First, get the setup scripts by cloning the repository:

```bash
git clone https://github.com/dsgou66/ghidra-termux-arm64.git
cd ghidra-termux-arm64
```

If you don't want to clone the whole repo (it contains the full Ghidra source), you can download just the two scripts:

```bash
curl -O https://raw.githubusercontent.com/dsgou66/ghidra-termux-arm64/main/install.sh
curl -O https://raw.githubusercontent.com/dsgou66/ghidra-termux-arm64/main/launch.sh
```

Then run the setup script:

```bash
bash install.sh
```

The script will:

1. Update package lists
2. Add the X11 repository
3. Install tigervnc, icewm, xterm, autocutsel, openjdk-17, and X11 fonts
4. Write the VNC startup config to ~/.vnc/xstartup
5. Prompt you to set a VNC password

Set the VNC password

When the script reaches vncpasswd, it will pause and ask for a password:

```
Password:
Verify:
```

Enter the same password twice (6–8 characters recommended, input is hidden).

Remember this password — you'll need it when connecting from a VNC client.

Verify Java

The script runs java -version at the end. Output should look like:

```
openjdk version "17.0.20"
```

Any 17.x version is fine.

---

3. Extract Ghidra

```bash
mkdir -p ~/ghidra-final && cd ~/ghidra-final
tar -xzf /path/to/ghidra-11.0-Dev-termux-arm64.tar.gz
```

Replace /path/to/ with the actual location of your downloaded file (e.g. /sdcard/Download/).

Confirm the launcher exists:

```bash
ls ~/ghidra-final/ghidra_11.0_DEV/ghidraRun
```

If you see ghidraRun, you're good.

---

4. Launch VNC + Ghidra

Make sure you are back in the repository directory (where launch.sh is located):

```bash
bash launch.sh
```

This will:

1. Clean up any leftover VNC session
2. Detect your screen resolution automatically and start the VNC server on display :1
3. Export DISPLAY=:1
4. Launch Ghidra

The first Ghidra launch is slow — it may take 1–2 minutes before the window appears. This is normal.

---

5. Connect with a VNC Client

Download RealVNC Viewer

· Official download page: https://www.realvnc.com/en/connect/download/viewer/
· Or search for RealVNC Viewer in your phone's app store.

The official Viewer is free for personal use. This repository does not bundle any VNC client APK.

Create a new connection

Open RealVNC Viewer, tap + to create a new connection:

Field Value
Address 127.0.0.1:5901
Name Anything, e.g. Ghidra
Password The VNC password you set in step 2

Note: 127.0.0.1 is for connecting from the same phone where Termux is running (recommended).
If you're connecting from another device (PC, tablet), replace 127.0.0.1 with your phone's LAN IP — run ifconfig 2>/dev/null | grep "inet " in Termux to find it.

Tap Connect — you should see the IceWM desktop and the Ghidra window.

---

6. Daily Usage

· To start: run bash launch.sh, then connect from your VNC client.
· To stop: run vncserver -kill :1 in Termux. This also closes Ghidra.

---

7. Troubleshooting

Connection refused

· Confirm VNC is running: ps aux | grep Xvnc
· Make sure you're using 127.0.0.1:5901 (same phone) or your phone's LAN IP (another device)

Connected but black screen

Wait 30–60 seconds — Ghidra takes a while on first launch. If it stays black, check:

```bash
cat ~/.vnc/xstartup
```

It should match what install.sh wrote.

Authentication failed

· Re-run vncpasswd to set the password again
· Make sure it's no longer than 8 characters
· Check the VNC client for accidental whitespace

Scrolling is awkward in VNC

RealVNC Viewer has a virtual mouse widget — tap the mouse icon in the toolbar to reveal a floating control with left/right buttons and a scroll area. Drag the scroll area to scroll quickly.

---

Build Environment

· Termux (Android aarch64)
· Android NDK (aarch64 toolchain)
· OpenJDK 17+
· Ghidra source: ghidra_11.0_DEV

Native Components (ARM64, built from source)

· GPL/DemanglerGnu/os/linux_arm_64/demangler_gnu_v2_24
· GPL/DemanglerGnu/os/linux_arm_64/demangler_gnu_v2_41
· Ghidra/Features/Decompiler/os/linux_arm_64/sleigh
· Ghidra/Features/Decompiler/os/linux_arm_64/decompile
· jffi native libs (ARM64)

Known Issues

· lib7-Zip-JBinding.so is still x86-64, so 7z archive import will not work. Everything else (including the decompiler) is native ARM64.

License

Based on NSA Ghidra (Apache 2.0). See LICENSE and NOTICE inside the archive.

---

Notes for Maintainers

· Setup scripts (install.sh, launch.sh) are on the main branch.
· The prebuilt tarball is distributed via Releases, not committed to the repository.
· No third-party APKs are bundled. Users install VNC clients from official sources.
