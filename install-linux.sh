#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DESKTOP_FILE="$HOME/.local/share/applications/multistream-hub.desktop"

# Detecta o WM_CLASS exato que o Chromium/Brave gera no Wayland/X11 para --app=http://localhost:8765/index.html
if command -v google-chrome > /dev/null 2>&1; then
    WM_CLASS="chrome-localhost__index.html-Default"
elif command -v brave-browser > /dev/null 2>&1; then
    WM_CLASS="brave-localhost__index.html-Default"
elif command -v microsoft-edge > /dev/null 2>&1; then
    WM_CLASS="msedge-localhost__index.html-Default"
else
    WM_CLASS="chrome-localhost__index.html-Default"
fi

chmod +x "$DIR/start.sh"
mkdir -p "$HOME/.local/share/applications"

cat << EOF > "$DESKTOP_FILE"
[Desktop Entry]
Version=1.0
Name=MultiStream Hub
Comment=Painel de Monitoramento Simultâneo de Lives do YouTube
Exec=$DIR/start.sh
Icon=$DIR/icon.svg
Terminal=false
Type=Application
Categories=AudioVideo;Video;Player;Network;
StartupWMClass=$WM_CLASS
EOF

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
echo "✅ Atalho 'MultiStream Hub' instalado com sucesso no menu do sistema (StartupWMClass=$WM_CLASS)!"
