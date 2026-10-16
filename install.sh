#!/data/data/com.termux/files/usr/bin/bash
set -e

echo ">>> Updating package lists..."
pkg update -y && pkg upgrade -y

echo ">>> Adding X11 repository..."
pkg install -y x11-repo

echo ">>> Installing VNC + IceWM + terminal + clipboard + JDK17 + fonts..."
pkg install -y tigervnc icewm xterm openjdk-17 \
  xorg-fonts-100dpi xorg-fonts-75dpi xorg-fonts-misc ttf-dejavu

echo ">>> Writing VNC startup script..."
mkdir -p ~/.vnc
cat > ~/.vnc/xstartup << 'INNER_EOF'
#!/data/data/com.termux/files/usr/bin/sh
export DISPLAY=:1
unset DBUS_SESSION_BUS_ADDRESS
unset SESSION_MANAGER
autocutsel -fork &
autocutsel -selection PRIMARY -fork &
sleep 2
icewm &
xterm &
wait
INNER_EOF
chmod +x ~/.vnc/xstartup

echo ">>> Setting VNC password..."
vncpasswd

echo ">>> Checking Java..."
java -version

echo ""
echo ">>> Installation complete! Next steps:"
echo "1. Unzip Ghidra into ~/ghidra-final/ and make sure ~/ghidra-final/ghidra_11.0_DEV/ghidraRun exists"
echo "2. Start VNC and Ghidra with the launch command"
