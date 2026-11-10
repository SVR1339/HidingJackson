# 🏴‍☠️ HidingJackson v1.0.0 — Sovereign Stealth Release

<div align="center">
  <img src="assets/logo.jpg" alt="HidingJackson Cyber Logo" width="180" style="border-radius: 24px; box-shadow: 0 10px 30px rgba(0, 229, 255, 0.4);" />
  <h3><b>Next-Gen Mihomo Engine & Autonomous Streaming Bypass Suite</b></h3>
  <p><i>Zero-leakage, Fake-IP routing, 600+ verified global nodes, and 1-click standalone desktop automation.</i></p>
</div>

---

## 🌟 Highlights & Major Features

HidingJackson v1.0.0 is the official public release of our fully re-architected, independent network cloaking and geo-unblock suite powered by **Mihomo (Clash.Meta) v1.19+** and **Tauri v2**.

### ⚡ Out-of-the-Box 600+ Verified High-Speed Nodes
* Bundled with **624 verified global proxy nodes** across VLESS, Trojan, Hysteria 2, and Shadowsocks protocols.
* **Auto - Lowest Latency**: Dynamic health checking and automatic failover benchmarks nodes in real time with 50ms tolerance.
* **Media & Streaming Bypass**: Dedicated routing rules unlocking Amazon Prime Video (US/UK), Netflix Global, BBC iPlayer, ITVX, Hulu, HBO Max, and Japanese Anime (Abema TV).
* **Domestic Speed Preservation**: Indian banking, IRCTC, Jio, Airtel, and domestic `.in` domains bypass the proxy entirely for native fiber throughput and zero UPI friction.

### 🛡️ Leak-Proof System Proxy & Fake-IP Matrix
* Zero DNS leaks via private virtual IP pools (`198.18.0.0/16`).
* Encrypted multi-provider DNS-over-HTTPS (Cloudflare `1.1.1.1` & Google `8.8.8.8`) with resilient IPv4 bootstrap fallbacks.
* IPv6 leak suppression for total carrier-grade anonymity.

### 🖥️ Standalone Interactive HTML5 Web Dashboard
* Built-in, zero-dependency browser control center located at `web/index.html`.
* Real-time WebSocket bandwidth telemetry (download/upload speed meters).
* 1-click proxy group selector and instant batch latency testing.

### ⚙️ 1-Click Desktop Automation Run-Scripts
* **`Start-HidingJackson.bat`**: One-click core daemon boot, Windows system proxy toggle (`127.0.0.1:7897`), and automatic dashboard launch.
* **`Stop-HidingJackson.bat`**: Clean process termination, registry reset to direct native internet, and singleton lock cleanup.

---

## 🛠️ Complete Root-Cause Audit: Resolution of "Internally Not Responsive"

All previous configuration and responsiveness issues have been systematically resolved:
1. **Mihomo Rule Syntax Parser Crash**: Removed commas `,` in group names that previously split rule arguments and crashed Mihomo on boot. Validated with **Exit Code: 0**.
2. **Regional DNS Blackhole**: Eliminated unresponsive mainland Chinese DoH endpoints (`doh.pub`, `alidns.com`) and added explicit IP bootstrap resolvers (`1.1.1.1`, `8.8.8.8`, `9.9.9.9`).
3. **Zombie Proxy Recovery**: Added automated cleanup scripts to ensure Windows Registry never remains trapped in `ProxyEnable: 1` when the engine is stopped.
4. **Windows Tray Crash (`0x80004005`)**: Decoupled dynamic tray icon badges in `verge.yaml`, preventing Explorer shell locks.
5. **Secret Authorization**: Aligned controller credentials for immediate, zero-auth localhost access.

---

## 📦 What's Included in this Release

* `HidingJackson-v1.0.0-Windows-x64.zip`: Standalone portable distribution for Windows 10 / 11 (x64).
  * `HidingJackson.exe` & `verge-mihomo.exe` binaries
  * `resources/` (MMDB GeoIP databases and geosite rules)
  * `profiles/hidingjackson-global.yaml` (624 tuned nodes)
  * `web/index.html` (interactive control dashboard)
  * `Start-HidingJackson.bat` & `Stop-HidingJackson.bat` (automated desktop scripts)
  * High-resolution brand assets & documentation

---

## 🚀 Quickstart Guide

1. Download and extract **`HidingJackson-v1.0.0-Windows-x64.zip`**.
2. Double-click **`Start-HidingJackson.bat`**.
3. Open your browser and stream freely on **Prime Video**, **Netflix**, or browse with stealth privacy!
4. Double-click **`Stop-HidingJackson.bat`** whenever you wish to disconnect.

---

*Authored and Maintained by [BANDA SAI VARDHAN REDDY (@SVR1339)](https://github.com/SVR1339)*
