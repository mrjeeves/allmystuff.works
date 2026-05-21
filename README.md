# allmystuff.works

Marketing site for **allmystuff.works** — a tech concierge service.

The pitch is *outcomes, not connectivity*: the device in your hand
reaches the interface of every other device you own — print, see
the cameras, drive the home server, restore from backup — without
making you a sysadmin. The app does it. Our hardware line (Anchor
~$99 → Hub ~$999 → Station ~$10K) fills gaps where you don't already
own the right device. Summon a real human when you'd rather not
figure it out yourself. Authenticated STUN / TURN relay at
`stun.allmystuff.works` / `turn.allmystuff.works` handles the
plumbing — it's not the story.

## Stack

Static HTML / CSS / vanilla JS. No build step. Host anywhere that can serve
files (GitHub Pages, Cloudflare Pages, S3+CloudFront, etc.).

## Local preview

```sh
python3 -m http.server 8000
# then open http://localhost:8000
```

## Files

- `index.html` — landing page (single-page, anchor-linked sections)
- `styles.css` — light/friendly concierge theme
- `script.js` — sticky-header elevation, mobile nav, signup form stub
