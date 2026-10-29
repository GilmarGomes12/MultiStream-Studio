# 📡 MultiStream Studio (MultiStream Hub)

Painel leve e moderno para **monitoramento simultâneo de transmissões ao vivo (Lives do YouTube)**, com controle de áudio **Solo** instantâneo, ajuste de sincronia de tempo (`-5s`, `-1s`, `SYNC LIVE`, `+1s`, `+5s`), gaveta de chat ao vivo, presets salvos e suporte completo a **PWA (Progressive Web App)** e **Modo App Nativo** no Linux e Windows.

---

## ✨ Principais Recursos

- **Grades Responsivas**: Alterne entre **2 Telas (2x1)**, **4 Telas (2x2)**, **6 Telas (3x2)** e **Modo Foco** (1 tela principal em destaque + telas auxiliares com proporção de colunas ajustável de `55/45` a `85/15`).
- **Login / Conta do YouTube Integrada**: Autentique sua conta em janela pop-up oficial do Google para participar do **Chat ao Vivo**, assistir lives exclusivas para membros e aproveitar o **YouTube Premium (sem anúncios)** diretamente no perfil isolado do app.
- **Áudio Solo Inteligente (1 Clique ou Teclas `1` a `6`)**: Ouça apenas a transmissão selecionada enquanto todas as outras são silenciadas automaticamente, sem recarregar o player.
- **Sincronização de Delay (`Sync Live`)**: Ajuste o atraso individual ou global das transmissões (`-5s`, `-1s`, `+1s`, `+5s`) ou sincronize todas na borda **AO VIVO**.
- **Gaveta de Chat Integrada**: Abra o chat da live escolhida na lateral ou em janela *pop-out*.
- **Gerenciador de Presets & Carregamento em Lote**: Salve seus conjuntos de canais favoritos no navegador (`localStorage`) ou cole várias URLs de uma só vez.
- **Modo Zen (TV Wall)**: Oculte a barra de ferramentas (`Z` ou `ESC`) para aproveitar 100% do monitor.
- **Instalável como PWA (1 Clique)**: Possui `manifest.json` e Service Worker (`sw.js`) integrados.

---

## ⌨️ Atalhos Rápidos de Estúdio

| Tecla | Ação |
| :--- | :--- |
| `1` a `6` | Ativa o **Áudio Solo** na tela correspondente (1 a 6) |
| `Shift + 1..6` | Promove a tela escolhida para a **Tela Principal (#1)** |
| `M` | Silencia (Muta) todas as transmissões |
| `Espaço` ou `P` | Pausa / Reproduz todas as telas simultaneamente |
| `F` | Alterna para o **Modo Foco** |
| `Z` ou `ESC` | Alterna o **Modo Zen** (oculta/mostra barra superior) |

---

## 🚀 Como Executar

> **Nota sobre o YouTube (Erro 153 / Bloqueio de Embed)**: O player do YouTube bloqueia transmissões abertas diretamente via `file:///`. Por isso, sirva o projeto via HTTP local (já automatizado nos scripts abaixo) ou hospede gratuitamente no **GitHub Pages**.

### 1. No Linux (Ubuntu / Zorin OS / Debian / Fedora)

Clone o repositório e instale o atalho no menu de aplicativos:

```bash
git clone https://github.com/GilmarGomes12/MultiStream-Studio.git
cd MultiStream-Studio
chmod +x start.sh install-linux.sh
./install-linux.sh
```

Para abrir imediatamente:
```bash
./start.sh
```
O script `start.sh` inicia automaticamente um servidor HTTP Python leve na porta `8765` e abre seu navegador baseado em Chromium (`Google Chrome`, `Brave`, `Edge` ou `Chromium`) em janela dedicada (`--app`) com perfil de áudio isolado.

### 2. No Windows

1. Certifique-se de ter o [Python](https://www.python.org/) instalado.
2. Dê dois cliques no arquivo **`MultiStream.vbs`** (ele inicia o servidor local em segundo plano, sem janela preta do CMD, e abre o aplicativo em modo janela dedicada).
3. *(Opcional)* Clique com o botão direito em `MultiStream.vbs` > **Enviar para > Área de trabalho (criar atalho)**.

### 3. Pelo GitHub Pages + Instalação PWA (1 Clique)

1. No seu repositório do GitHub, acesse **Settings > Pages** e selecione a branch `main` (pasta `/root`).
2. Acesse `https://gilmargomes12.github.io/MultiStream-Studio/`.
3. Clique no botão **`Instalar App`** na barra superior do painel (ou no ícone de instalação na barra de endereços do navegador).

---

## 🎧 Dica no Linux: Roteamento Individual de Áudio (PipeWire / PulseAudio)

Como o `start.sh` utiliza um perfil isolado (`--user-data-dir`), o **MultiStream Hub** aparece como um fluxo independente no `pavucontrol` (Controle de Volume do PulseAudio/PipeWire). Assim, você pode enviar o som das lives para um monitor HDMI ou caixa de som enquanto mantém seu fone Bluetooth exclusivo para chamadas ou música no sistema.

---

## 📄 Licença

Distribuído sob a licença **MIT**. Veja o arquivo [LICENSE](./LICENSE) para mais detalhes.
