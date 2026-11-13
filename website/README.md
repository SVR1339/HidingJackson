# HidingJackson Official Self-Hosted Web Portal

High-performance, modern, self-contained landing page and documentation portal for **HidingJackson**, engineered by **Sai Vardhan Reddy** (`SVR1339`) at **BSVR Technologies** (`https://www.bsvr.work/`).

---

## 🚀 Quick Deployment Options

### Option 1: Instant Docker Compose (Recommended for VPS / Cloud)
Run this portal in an ultra-light, security-hardened Alpine Nginx container (<15 MB):

```bash
# Navigate to the website directory
cd website

# Start in detached mode
docker compose up -d

# Verify container health
docker ps
```
The site will immediately be live on `http://localhost` or your server's public IP address.

---

### Option 2: Deploy to GitHub Pages (100% Free Self-Hosting)
1. Fork or push this repository to `https://github.com/SVR1339/HidingJackson`.
2. Go to **Settings** → **Pages**.
3. Under **Build and deployment**, select **Source**: `Deploy from a branch`.
4. Branch: `main` / Folder: `/docs` (or copy `website/index.html` to `docs/index.html`).
5. Your portal is automatically hosted at `https://svr1339.github.io/HidingJackson` or your custom domain `https://www.bsvr.work/`.

---

### Option 3: Deploy to Cloudflare Pages / Vercel
1. Connect repository `SVR1339/HidingJackson` to Cloudflare Pages or Vercel.
2. Root directory: `website`.
3. Build command: None (pure static).
4. Output directory: `.`.
5. Point your custom domain `www.bsvr.work` in DNS settings.

---

## 🛡️ Security & Integrity Highlights
- **10-Year Authenticode Digital Signature**: Valid from `13/11/2026` to `13/11/2036` under `CN=Sai Vardhan Reddy (HidingJackson Developer), O=BSVR Technologies`.
- **Zero-Error Node Health Probing**: Interactive fleet monitor showcasing responsive, sub-50ms nodes.
- **Content Security Policy (CSP)** & hardened HTTP headers enabled by default.
