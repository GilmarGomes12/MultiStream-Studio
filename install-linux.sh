#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DESKTOP_FILE="$HOME/.local/share/applications/multistream-hub.desktop"

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
StartupWMClass=MultiStreamHub
EOF

update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
echo "✅ Atalho 'MultiStream Hub' instalado com sucesso no menu do sistema!"
