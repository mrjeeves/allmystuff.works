# allmystuff.works

Marketing site for **allmystuff.works** — an integrated stack for the
technology in your life.

The pitch is end-to-end: our app on every device you already own,
hardware from us when you need more (Anchor ~$99 → Hub ~$999 →
Station ~$10K), a private network tying it all together via
authenticated STUN/TURN at `stun.allmystuff.works` /
`turn.allmystuff.works`, and a real human one click away when
something stops behaving. Not "just another Tailscale."

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
