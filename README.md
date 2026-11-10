# 🏴‍☠️ HidingJackson

<div align="center">

<img src="assets/logo.jpg" alt="HidingJackson Cyber Logo" width="180" style="border-radius: 28px; box-shadow: 0 12px 35px rgba(0, 245, 255, 0.35); margin-right: 15px;" />
<img src="assets/logo_corporate.svg" alt="HidingJackson Corporate Shield" width="180" style="box-shadow: 0 12px 35px rgba(139, 92, 246, 0.35); margin-left: 15px;" />

### **The Sovereign Stealth Mihomo Client & Next-Gen Streaming Bypass Engine**

[![GitHub Release](https://img.shields.io/github/v/release/SVR1339/HidingJackson?style=for-the-badge&color=blue)](https://github.com/SVR1339/HidingJackson/releases)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL--3.0-green.svg?style=for-the-badge)](https://www.gnu.org/licenses/gpl-3.0)
[![Platform: Windows | macOS | Linux](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-orange?style=for-the-badge)](https://github.com/SVR1339/HidingJackson)
[![Core: Mihomo Meta](https://img.shields.io/badge/Core-Mihomo%20Meta%20v1.19+-purple?style=for-the-badge)](https://github.com/MetaCubeX/mihomo)
[![Tauri v2](https://img.shields.io/badge/Framework-Tauri%20v2%20%2B%20React%2019-cyan?style=for-the-badge)](https://tauri.app/)

</div>

---

## ⚡ Zero-Knowledge 30-Second Quickstart (For Everyone)

> **No setup. No subscription fees. No complex terminal commands.**  
> HidingJackson ships fully tuned out-of-the-box with **624 verified global high-speed nodes** and zero-dependency 1-click launchers.

### Option A: 1-Click Desktop Automation (Recommended)
1. Double-click **`Start-HidingJackson.bat`** on your Desktop or repository root.
2. The core Mihomo daemon boots detached, enables Windows System Proxy (`127.0.0.1:7897`), and automatically opens the **HidingJackson Interactive Dashboard** in your browser.
3. To stop and cleanly restore native direct internet, double-click **`Stop-HidingJackson.bat`**.

### Option B: Graphical Desktop Application
1. Launch **`HidingJackson`** (`clash-verge.exe`).
2. The **`HidingJackson Ultimate Global Suite`** profile is automatically active.
3. Ensure **`System Proxy`** is toggled **`ON`**.
4. Choose **`⚡ Auto - Lowest Latency`** or **`🇺🇸 US Streaming`** to unlock Amazon Prime Video US, Netflix, Hulu, and HBO Max.

---

## 🧭 Overview

**HidingJackson** is an elite, fully independent, and ultra-high-performance cross-platform network orchestration client powered by the **Mihomo (Clash.Meta)** core and **Tauri v2**. 

Engineered for users who demand zero DNS leaks, undetectable packet obfuscation, and intelligent multi-region geo-routing, **HidingJackson** seamlessly unlocks geo-locked media streaming (Amazon Prime US, Netflix Global, BBC iPlayer, ITVX, Hulu, Japanese Anime) while preserving native speeds for domestic internet traffic.

---

## 🛠️ Root-Cause Engineering: Resolution of "Internally Not Responsive"

During comprehensive end-to-end system diagnostics, multiple silent architectural failures were intercepted and surgically cured:

| Issue | Root Cause | Impact | HidingJackson Sovereign Fix |
|---|---|---|---|
| **Mihomo Syntax Parser Crash** | Commas `,` inside proxy group names like `🇺🇸 US Streaming (Prime, Netflix, Hulu)` | Mihomo uses `,` as delimiter in rule definitions (`TYPE,TARGET,GROUP`), causing it to parse `(Prime` as target group and crash on startup with Exit Code 1. | Fully sanitized all group names and rule maps (`🇺🇸 US Streaming`, `🇬🇧 UK Streaming`, `🇯🇵 Japan Anime`). Passed validation with 0 errors. |
| **DNS Blackhole & Timeout Latency** | Missing `default-nameserver` bootstrap and legacy mainland Chinese DoH providers (`doh.pub`, `alidns.com`) | Requests hung or were throttled by Indian ISPs (Reliance Jio / Airtel). Unable to resolve DoH hostnames without bootstrap DNS. | Injected explicit IP bootstrap resolvers (`1.1.1.1`, `8.8.8.8`, `9.9.9.9`) and configured Cloudflare & Google ultra-low-latency DoH. |
| **Zombie System Proxy State** | `ProxyEnable: 1` persisted in Windows Registry when engine daemon crashed or was closed | All browsers and Windows applications failed with `ERR_CONNECTION_REFUSED` because nothing listened on `7897`. | Authored two-phase automated lifecycle scripts (`Start-HidingJackson.bat`, `Stop-HidingJackson.bat`) that dynamically enforce proxy health and guarantee clean direct fallback. |
| **Windows Tray Crash (`0x80004005`)** | `sysproxy_tray_icon: true` called dynamic icon mutation every 30 seconds on Windows Shell | Windows `Shell_NotifyIconW` returned `E_FAIL` (`-2147467259`), freezing the Tauri main event loop. | Decoupled tray icon mutation in `verge.yaml`, preserving stable single common tray icon. |
| **Secret Auth Mismatch** | Default `secret: set-your-secret` in `config.yaml` vs empty secret in profile | Web dashboards and REST controller rejected client connections with `401 Unauthorized`. | Aligned controller authorization to zero-friction empty secret for instant localhost controller access. |
| **IPv6 Leak Suppression** | Active IPv6 interface causing dual-stack leak | Certain streaming providers detect ISP location via secondary IPv6 route. | Enforced `ipv6: false` across all profile matrices, guaranteeing 100% IPv4 stealth tunneling. |

---

## ✨ Flagship Capabilities

### ⚡ 1. Auto - Lowest Latency Steering
- Dynamically tests latency across **600+ verified global nodes** (VLESS, Trojan, Hysteria 2, Shadowsocks).
- Real-time `url-test` health checking with 50ms tolerance: if any server degrades, traffic is steered instantaneously to the next fastest node without dropping active sockets.

### 🛡️ 2. Leak-Proof System Proxy & Fake-IP Matrix
- Upstream domains are assigned private virtual IPs (`198.18.0.0/16`), rendering ISP DNS poisoning and eavesdropping impossible.
- Quad-redundant DoH (DNS over HTTPS) resolution via Cloudflare (`1.1.1.1`), Google (`8.8.8.8`), and Quad9 (`9.9.9.9`).
- Complete WebRTC leak immunity and IPv6 leak suppression.

### 🎬 3. Multi-Region Media & Streaming Steering
- **🇺🇸 US Streaming**: Dedicated routing policies for Amazon Prime Video, Netflix US, Hulu, Max, Peacock, Tubi, and Pluto TV.
- **🇬🇧 UK Streaming**: BBC iPlayer, ITVX, Channel 4, and UK transit channels.
- **🇯🇵 Japan Anime & Media**: Abema TV, TVer, and Tokyo edge nodes.
- **🎮 Gaming & Low Ping**: Dedicated routing for Discord, Steam, Epic Games, and online gaming.
- **🤖 AI Acceleration**: ChatGPT, Claude, Gemini, Copilot, and Perplexity routed through optimal high-bandwidth routes.

### 🇮🇳 4. Domestic Speed Preservation (Zero Ping Penalty)
- All Indian domestic banking (SBI, HDFC, ICICI, Axis), IRCTC, Jio, Airtel, and `.in` domains bypass the proxy entirely.
- Enjoy 100% native fiber speed, zero authentication blocks, and flawless UPI transactions.

### 🛑 5. Ad-Block & Telemetry Shield
- Built-in domain and keyword rejection matrix.
- Drops Google DoubleClick, Amazon telemetry, tracking beacons, and invasive advertising without crashing protected DRM video players.

---

## 🏛️ System Architecture

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                         HIDINGJACKSON ARCHITECTURE                          │
├─────────────────────────────────────────────────────────────────────────────┤
│  [ FRONTEND ]   Interactive HTML5 Dashboard · WebSockets · React 19 UI      │
│         ▲                                                                   │
│         │ (RESTful Controller :9097 / WebSocket Real-Time Traffic)          │
│         ▼                                                                   │
│  [ BACKEND ]    Tauri v2 (Rust) / Standalone Headless Daemon Controller     │
│         ▲                                                                   │
│         │ (Mixed Proxy :7897 & Windows System Proxy Engine)                 │
│         ▼                                                                   │
│  [ CORE ]       Mihomo Meta Engine · Fake-IP DNS · DoH Bootstrap Matrix     │
│         ▲                                                                   │
│         │ (Encrypted Multiplexed Outbounds)                                 │
│         ▼                                                                   │
│  [ NODES ]      600+ Global Nodes (VLESS · Trojan · Hysteria 2)             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## 🖥️ Interactive HTML5 Web Dashboard

Access the bundled, zero-dependency dashboard in any browser:
- **Location:** `web/index.html` (or via `Start-HidingJackson.bat`)
- **Features:**
  - Real-time connection badge (ONLINE / OFFLINE).
  - Live upload and download bandwidth meters.
  - 1-click group switching (`🛡️ HidingJackson Core`, `🇺🇸 US Streaming`, `⚡ Auto - Lowest Latency`, `🇬🇧 UK Streaming`, `🇯🇵 Japan Anime`).
  - Single-click latency benchmark across hundreds of live nodes.
  - Instant outbound node selection.

---

## 📜 License & Acknowledgments

- **Author & Maintainer:** BANDA SAI VARDHAN REDDY ([@SVR1339](https://github.com/SVR1339))
- **Core Engine:** [Mihomo (Clash.Meta)](https://github.com/MetaCubeX/mihomo)
- **License:** GNU General Public License v3.0 (GPL-3.0)
