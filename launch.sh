#!/data/data/com.termux/files/usr/bin/bash
set -e

GHIDRA_DIR="$HOME/ghidra-final/ghidra_11.0_DEV"

if [ ! -x "$GHIDRA_DIR/ghidraRun" ]; then
  echo "ERROR: ghidraRun not found at $GHIDRA_DIR/ghidraRun"
  echo "Please extract the tarball into ~/ghidra-final/ first."
  exit 1
fi

echo ">>> Cleaning up old VNC session..."
vncserver -kill :1 2>/dev/null || true
pkill -f Xvnc 2>/dev/null || true
pkill -f vncserver 2>/dev/null || true
rm -f "$PREFIX/tmp/.X1-lock" "$PREFIX/tmp/.X11-unix/X1"
sleep 1

SCREEN_RES=$(wm size 2>/dev/null | awk -F': ' '/Physical size/ {print $2}')
if [ -z "$SCREEN_RES" ]; then
  SCREEN_RES="1920x1080"
fi

echo ">>> Starting VNC on :1 ($SCREEN_RES)..."
vncserver :1 -geometry "$SCREEN_RES" -depth 24

export DISPLAY=:1

echo ">>> Launching Ghidra..."
cd "$GHIDRA_DIR"
./ghidraRun &

echo ""
echo ">>> VNC and Ghidra are starting."
echo ">>> Connect your VNC client to <device-ip>:5901"
