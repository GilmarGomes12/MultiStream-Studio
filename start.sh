#!/usr/bin/env bash
PORT=8765
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Salva o perfil isolado em ~/.config/multistream-hub/profile (fora da pasta do repositório Git)
PROFILE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/multistream-hub/profile"
mkdir -p "$PROFILE_DIR"

# 1. Garante que o servidor HTTP na porta 8765 esteja servindo ESTA pasta ($DIR)
EXISTING_PID=$(pgrep -f "python3 -m http.server $PORT" || true)
if [[ -n "$EXISTING_PID" ]]; then
    if ! ps -p "$EXISTING_PID" -o args= 2>/dev/null | grep -Fq -- "--directory $DIR"; then
        kill $EXISTING_PID 2>/dev/null || true
        sleep 0.2
    fi
fi

if ! lsof -i :$PORT > /dev/null 2>&1 && ! ss -tuln | grep -q ":$PORT "; then
    python3 -m http.server "$PORT" --bind 127.0.0.1 --directory "$DIR" > /dev/null 2>&1 &
    SERVER_PID=$!
    sleep 0.3
fi

# 2. Detecta navegador baseado em Chromium (Chrome, Brave, Edge, Chromium)
if command -v google-chrome > /dev/null 2>&1; then
    BROWSER="google-chrome"
    WM_CLASS="chrome-localhost__index.html-Default"
elif command -v brave-browser > /dev/null 2>&1; then
    BROWSER="brave-browser"
    WM_CLASS="brave-localhost__index.html-Default"
elif command -v microsoft-edge > /dev/null 2>&1; then
    BROWSER="microsoft-edge"
    WM_CLASS="msedge-localhost__index.html-Default"
elif command -v chromium-browser > /dev/null 2>&1; then
    BROWSER="chromium-browser"
    WM_CLASS="chromium-localhost__index.html-Default"
elif command -v chromium > /dev/null 2>&1; then
    BROWSER="chromium"
    WM_CLASS="chromium-localhost__index.html-Default"
else
    notify-send "MultiStream Hub" "Nenhum navegador compatível (Chrome, Brave, Edge ou Chromium) encontrado." 2>/dev/null
    echo "Erro: Nenhum navegador baseado em Chromium encontrado." >&2
    [[ -n "$SERVER_PID" ]] && kill "$SERVER_PID" 2>/dev/null
    exit 1
fi

# 3. Abre em modo App com perfil isolado (permite roteamento individual de áudio e sessão persistente do YouTube)
"$BROWSER" \
  --app="http://localhost:$PORT/index.html" \
  --user-data-dir="$PROFILE_DIR" \
  --class="$WM_CLASS" \
  --window-size=1600,900 \
  --disable-features=ThirdPartyStoragePartitioning,TrackingProtection3pcd \
  --autoplay-policy=no-user-gesture-required > /dev/null 2>&1

# 4. Encerra o servidor local ao fechar a janela
[[ -n "$SERVER_PID" ]] && kill "$SERVER_PID" 2>/dev/null
