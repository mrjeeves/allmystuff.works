# allmystuff.works

Marketing site for **allmystuff.works** — a personal-cloud / tech-concierge service.

You get your own private mesh network (a "network") that connects your devices
over WebRTC via [Trystero](https://github.com/dmotz/trystero), with our
authenticated STUN and TURN servers (`stun.allmystuff.works`,
`turn.allmystuff.works`) included on every plan. On top of that runs our
friendly fork of [myownllm.net](https://myownllm.net)'s `cloud-mesh` agent
framework, with additions for consent-gated remote view / remote control —
so you can summon a real human into your network when something gets weird.

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
