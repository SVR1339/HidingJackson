# 🏴‍☠️ HidingJackson

<div align="center">

![HidingJackson Banner](https://raw.githubusercontent.com/SVR1339/HidingJackson/main/src-tauri/icons/128x128%402x.png)

### **The Sovereign Stealth Mihomo Client & Next-Gen Streaming Bypass Engine**

[![GitHub Release](https://img.shields.io/github/v/release/SVR1339/HidingJackson?style=for-the-badge&color=blue)](https://github.com/SVR1339/HidingJackson/releases)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL--3.0-green.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0)
[![Platform: Windows | macOS | Linux](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-orange?style=for-the-badge)](https://github.com/SVR1339/HidingJackson)
[![Core: Mihomo Meta](https://img.shields.io/badge/Core-Mihomo%20Meta%20v1.19+-purple?style=for-the-badge)](https://github.com/MetaCubeX/mihomo)
[![Tauri v2](https://img.shields.io/badge/Framework-Tauri%20v2%20%2B%20React%2019-cyan?style=for-the-badge)](https://tauri.app/)

</div>

---

## 🧭 Overview

**HidingJackson** is an elite, fully independent, and ultra-high-performance cross-platform network orchestration client powered by the **Mihomo (Clash.Meta)** core and **Tauri v2**. 

Engineered for users who demand zero DNS leaks, undetectable packet obfuscation, and intelligent multi-region geo-routing, **HidingJackson** seamlessly unlocks geo-locked media streaming (Amazon Prime US, Netflix Global, BBC iPlayer, ITVX, Hulu, Japanese Anime) while preserving native speeds for domestic internet traffic.

---

## ✨ Flagship Capabilities

### ⚡ 1. Auto - Fastest on Earth Routing
- Dynamically tests latency across **600+ verified global nodes** (VLESS, Trojan, Hysteria 2, Shadowsocks).
- Real-time `url-test` health checking with 50ms tolerance: if any server degrades, traffic is steered instantaneously to the next fastest node without dropping active sockets.

### 🛡️ 2. Leak-Proof Kernel WinTUN Mode
- Routes 100% of operating system traffic through a virtual network adapter.
- Employs strict route isolation, auto-redirect, and endpoint-independent NAT.
- Bypasses traditional HTTP proxy limitations and intercepts UDP games, Discord, and terminal traffic.

### 🔒 3. Fake-IP DNS & Encrypted DoH Matrix
- Upstream domains are assigned private virtual IPs (`198.18.0.0/16`), rendering ISP DNS poisoning and eavesdropping impossible.
- Quad-redundant DoH (DNS over HTTPS) resolution via Cloudflare (`1.1.1.1`), Google (`8.8.8.8`), and Quad9 (`9.9.9.9`).
- Complete WebRTC leak immunity and IPv6 leak suppression.

### 🎬 4. Multi-Region Media & Streaming Steering
- **🇺🇸 US Streaming**: Dedicated routing policies for Amazon Prime Video, Netflix US, Hulu, Max, Peacock, Tubi, and Pluto TV.
- **🇬🇧 UK Streaming**: BBC iPlayer, ITVX, Channel 4, and UK transit channels.
- **🇯🇵 Japan Anime & Media**: Abema TV, TVer, and Tokyo edge nodes.
- **🎮 Gaming & Low Ping**: Dedicated routing for Discord, Steam, Epic Games, and online gaming.
- **🤖 AI Acceleration**: ChatGPT, Claude, Gemini, Copilot, and Perplexity routed through optimal high-bandwidth routes.

### 🇮🇳 5. Domestic Speed Preservation (Zero Ping Penalty)
- All Indian domestic banking (SBI, HDFC, ICICI, Axis), IRCTC, Jio, Airtel, and `.in` domains bypass the proxy entirely.
- Enjoy 100% native fiber speed, zero authentication blocks, and flawless UPI transactions.

### 🛑 6. Ad-Block & Telemetry Shield
- Built-in domain and keyword rejection matrix.
- Drops Google DoubleClick, Amazon telemetry, tracking beacons, and invasive advertising without crashing protected DRM video players.

---

## 🏛️ System Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         HIDINGJACKSON ARCHITECTURE                          │
├─────────────────────────────────────────────────────────────────────────────┤
│  [ FRONTEND ]   React 19 · Vite · TypeScript · Tailwind · Lucide UI         │
│         ▲                                                                   │
│         │ (Tauri IPC Bridge / WebSocket RPC)                                │
│         ▼                                                                   │
│  [ BACKEND ]    Tauri v2 (Rust) · System Tray · Service Daemon IPC          │
│         ▲                                                                   │
│         │ (Process Orchestration & Virtual TUN Device)                      │
│         ▼                                                                   │
│  [ CORE ]       Mihomo Meta Engine · WinTUN / gVisor Stack · Fake-IP DNS    │
│         ▲                                                                   │
│         │ (Encrypted Multiplexed Outbounds)                                 │
│         ▼                                                                   │
│  [ NODES ]      600+ Global Nodes (VLESS · Trojan · Hysteria 2)             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🚀 Getting Started

### Method 1: Ready-to-Run (Pre-Configured)
1. Launch **HidingJackson** from your desktop or start menu shortcut:
   ```powershell
   Start-Process "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\HidingJackson.lnk"
   ```
2. The application opens with the **HidingJackson Ultimate Global Suite** profile already loaded and selected.
3. Toggle **TUN Mode** and **System Proxy** to `ON` in the sidebar.
4. Enjoy unrestricted, encrypted, ultra-fast streaming!

---

### Method 2: Building From Source

#### Prerequisites
- **Node.js** (v20+ recommended)
- **pnpm** (v9+)
- **Rust Toolchain** (`rustc` and `cargo` latest stable)
- **Windows C++ Build Tools** (Visual Studio 2022)

#### Compilation Steps
```bash
# 1. Clone the repository
git clone https://github.com/SVR1339/HidingJackson.git
cd HidingJackson

# 2. Install dependencies
pnpm install

# 3. Run development server
pnpm dev

# 4. Build production desktop installer
pnpm build
```

Compiled packages (`.exe`, `.msi`, portable `.zip`) will be generated inside:
```
src-tauri/target/release/bundle/
```

---

## ⚙️ Advanced Configuration Specification

The core routing rules and proxy parameters are managed through `hidingjackson-global.yaml`.

```yaml
mixed-port: 7897
allow-lan: false
mode: rule
log-level: info
ipv6: false
unified-delay: true
tcp-concurrent: true

tun:
  enable: true
  stack: mixed
  dns-hijack:
    - 'tcp://any:53'
    - 'udp://any:53'
  auto-route: true
  auto-redirect: true
  strict-route: true

dns:
  enable: true
  ipv6: false
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  nameserver:
    - 'https://1.1.1.1/dns-query'
    - 'https://dns.google/dns-query'
  fallback:
    - 'https://9.9.9.9/dns-query'
```

---

## 🛠️ Automated CI/CD Workflows

HidingJackson includes automated **GitHub Actions** workflows located in `.github/workflows/`:
- **autobuild.yml**: Compiles and tests cross-platform release artifacts on every push to `main`.
- **release.yml**: Automatically produces multi-platform signed installers (`.exe`, `.msi`, `.dmg`, `.AppImage`) upon creating a GitHub tag/release.

To trigger an automated release build on your GitHub repository:
```bash
git tag v1.0.0
git push origin v1.0.0
```

---

## 📜 License

Licensed under the **GNU General Public License v3.0 (GPL-3.0)**.  
See the [LICENSE](LICENSE) file for complete terms.

---

<div align="center">
<b>Created and Maintained with Sovereign Agency by <a href="https://github.com/SVR1339">SVR1339</a></b>
</div>
