# Critical Error Computing — Design System

> Custom gaming PCs, built the wrong way. On purpose.

This is the brand + UI design system for **Critical Error Computing LLC (CEC)** — a custom PC builder in Humble, Texas. It packages the brand's tokens, fonts, components, foundation cards, and a storefront UI kit so any agent can design on-brand CEC artifacts (mockups, slides, prototypes, production UI).

---

## 1 · Company & product context

**Critical Error Computing** builds bespoke gaming and workstation PCs, each tailored to its owner by a qualified engineer — a deliberate rejection of the faceless online configurator. The whole brand is a thesis: *the industry replaced its people with chatbots; we did the opposite.*

- **What they sell** — A fleet of ten reference PC "classes" named after warships, scaling by power and price:
  **Probe** ($1,249.99, APU starter) → **Fighter** → **Corvette** → **Frigate** → **Destroyer** (the popular 1440p sweet spot) → **Cruiser** → **Battlecruiser** → **Battleship** (RTX 5090) → **Dreadnaught** (custom dual-loop) → **Titan** ($15,000+ bespoke commission). Every "reference" build is reshaped around the actual buyer before any part is ordered.
- **The bench** — Beyond towers: CNC milling, FDM + resin 3D printing, 3D modeling, PCB design/testing, custom software, and complimentary **glass side-panel laser etching** on every build.
- **The promises** — 10-year warranty, **lifetime support** (a human answers, forever), and a perfect five-star review record (115 Google reviews, 4.98 avg; spotless on Facebook).
- **Probe** — the brand mascot and front-desk chatbot: a charming sci-fi drone named after the smallest ship in the fleet. He "knows six things," greets warmly, and hands anything hard to a human. He is the anti-configurator made literal — friction is a *feature* that routes you to a person.
- **Where** — 19807 Dawn Mist Dr, Humble, TX 77346 · (713) 309-6361 · Mon–Sat 12–8 PM CT. Builder "Nate" builds on stream.

### Sources used to build this system
- **Codebase:** `Criticalerrorcomputing.com - Rebuild 2026/` (read-only, mounted) — a complete Shopify theme rebuild. Key files mined:
  - `extracted/cec-base.css` + `cec-home.css` — the full token + component CSS (color system, type, buttons, chat, fleet, glitch).
  - `extracted/probe-chat.jsx` — Probe's voice, conversation engine, and tenets.
  - `extracted/cec-data.js` + `admin-import/products.csv` — the fleet spec data + copy.
  - `extracted/glitch.js` + `cec-motion.js` — the glitch/jitter motion system.
  - `tools/fontfaces.css` + `theme/assets/*.woff2` — self-hosted webfonts.
  - `extracted/assets/` — logo, Probe render, class photos, partner logos, gallery.
  - `Reviews/Critical-Error-Computing-Reviews.md` — real customer reviews.
- All visual assets copied into `assets/` here; fonts into `assets/fonts/`.

---

## 2 · Content fundamentals (voice & tone)

CEC writes like **a sharp, funny, slightly chaotic engineer who genuinely likes you** — the opposite of corporate support copy. Probe is the loudest expression of this, but the whole site shares the register.

- **Person:** Confident first-person-plural for the company ("we build," "we hand you a person"); Probe speaks first-person-singular and self-deprecating ("I know six things," "I don't have legs"). Addresses the reader as **you**, directly.
- **Tone:** Irreverent, anti-corporate, warm. Pokes "the other guys" (configurators, support bots) but never the customer. Self-aware about being a small shop, proud of it.
- **Casing:** Sentence case for body and headlines. **UPPERCASE mono** for eyebrows, labels, nav, badges, prices' context lines. Headlines are tight and declarative ("PCs built the wrong way. On purpose.").
- **Punctuation & rhythm:** Short punchy sentences. Em-dashes and mid-thought asides. Periods for emphasis ("Ten. Year. Warranty."). Ellipses for Probe's beats.
- **Numbers:** Prices always with cents ($3,499.99), big and in display type. Stats stated plainly (10-yr, ∞, 5.0★, 100%).
- **Naval metaphor everywhere:** products are "classes" / "vessels" / "the fleet"; pick "a vessel," not "a SKU."
- **Emoji:** Essentially none in UI copy. Reviews quote customers verbatim (which may include 👍🏻), but the brand voice itself doesn't use emoji. Don't add them.
- **Signature lines:** "Talk to a human." · "Tailored to you." · "The anti-configurator." · "Reference price, not a wall." · Probe's tenet stamps (warranty / lifetime support / free etching / five stars / the bench).

**Examples:**
> "The other guys hand you a cart. We hand you a person."
> "Friction is never a dead end. It's a handoff to a human who walks you through to checkout."
> Probe: "Respect. A self-directed buyer. I'll keep this quick: four questions, then I point at a tower."
> Probe stamp: "Ten. Year. Warranty. I've met capacitors younger than that. ...anyway."

---

## 3 · Visual foundations

**Overall vibe:** a dark, technical "ops console" — deep indigo-black, magenta + violet neon, sharp edges, mono telemetry, and a subtle digital *glitch*. Premium gaming hardware photographed moody, not flashy. Restrained, never gamer-RGB-clownish.

- **Color:** Deep indigo-black canvas (`--bg` oklch 0.135) with a faint purple cast, raised in steps to `--surface`. **Magenta** (`--accent`, oklch 0.64 0.255 350) is the one primary — CTAs, links, live states. **Violet** (`--violet`) is ambient glow/secondary. Bronze for trust seals. Greens/ambers only for status. Telemetry gauges use orange/green/blue. Imagery skews **warm** (amber interior lighting, red ambient) against the cool UI — deliberate contrast. See `tokens/colors.css`.
- **Type:** **Saira Condensed** for display (tight, military signage), **Saira** for body (humanist, warm-technical), **IBM Plex Mono** for every label, eyebrow, price context, and telemetry readout. Headlines are tight (`letter-spacing -0.01em`, `line-height ~0.98`); eyebrows are wide-tracked uppercase mono (`0.22em`). See `tokens/typography.css`.
- **Backgrounds:** A faint **64px grid** masked by a radial fade sits under most sections; blurred **violet + magenta glows** bleed from corners. Device/console screens add a slow **scanline** shimmer. No gradients-as-decoration beyond subtle surface gradients (`linear-gradient(180deg, --surface, --bg-2)` on cards). Hardware photos float on radial-glow stages with drop-shadows.
- **Corners:** Deliberately **tight** — 2px buttons/chips, 4px inputs, 6px panels, 8px cards/modals, 16px only on hardware bodies. This is gear, not a SaaS pill. See `tokens/spacing.css`.
- **Borders:** Hairline `--border` everywhere; brightens to `--border-bright` on hover, or tints to `--accent-line` when active/featured. Dashed borders mark "the other guys" and the Titan commission (something not-yet-real).
- **Shadows:** Deep **ambient** drop-shadows (`0 30–40px 70–90px -40px black`), never soft pillows. Featured/CTA elements add a colored **accent glow** (`0 14px 40px -12px magenta`) and a 1px accent ring. Insets give hardware its molded look.
- **Cards:** Gradient surface, hairline border, lift `translateY(-3 to -5px)` on hover with an accent-tinted glow. Featured cards get a magenta border + glow. Product cards sit photos on a radial color stage.
- **Motion:** Default ease `cubic-bezier(.2,.8,.2,1)`; durations .15s (press) / .25s (hover) / .4s (panels). Buttons lift 2px on hover. **The glitch system** is the signature: single words rarely RGB-split + flicker (cyan/magenta) for a few frames, sometimes swapping to an alt spelling (`ERR0R`, `n3ver`), then resolve. Rare whole-section single-frame jitter. The "Talk to a human" buttons carry a soft repeating glow pulse. Probe's drone gently bobs. **All motion respects `prefers-reduced-motion`** and is never applied to prices, mid-interaction controls, or checkout.
- **Hover/press:** Hover = lift + border brighten + (on accent elements) glow. Links/nav = dim→full text color. No shrink-on-press; emphasis comes from glow and lift.
- **Transparency & blur:** The nav and rep modal use `backdrop-filter: blur()` over translucent indigo; floating telemetry cards use blur+saturate. Used sparingly, for floating/overlaid surfaces only.

---

## 4 · Iconography

CEC's icon approach is **minimal and mono-line, never decorative**.

- **No icon font, no icon library** ships in the theme. Icons are hand-placed inline **SVGs** at ~18–24px, single-stroke, in `--accent` / `--dim`, matching the mono/technical feel (think feather/lucide weight, but custom). When you need icons here, use a **thin-stroke line set** (Lucide / Feather from CDN is the closest match) — flag any substitution. Keep them 1.5–2px stroke, no fills.
- **Unicode/glyphs as icons:** the brand leans on typographic marks instead of icons in many places — `✓` / `✕` (compare lists), `★` (reviews), `▸` (feature bullets), `※` (Probe's tenet stamp), `➤` (chat send), arrows `→`. Prefer these for lightweight UI.
- **Status dots:** small glowing circles (`--ok` green / `--warn` amber / `--accent` magenta) stand in for status icons.
- **Emoji:** not used in brand UI. Don't introduce them.
- **The real icons are the assets:** the **logo** (a warning-triangle "critical error" mark wrapping a glitched exclamation, cyan→magenta gradient), **Probe** (the drone mascot — use as the friendly/help glyph), partner **logos**, and the **class photos**. Copy these in rather than drawing new marks. All live in `assets/`.

---

## 5 · Index / manifest

**Root**
- `styles.css` — the entry point (consumers link this). `@import`s the tokens + base.
- `readme.md` — this guide.
- `SKILL.md` — Agent-Skills-compatible front matter for Claude Code use.

**Tokens** (`tokens/`)
- `fonts.css` — `@font-face` for Saira / Saira Condensed / IBM Plex Mono (self-hosted woff2).
- `colors.css` — canvas, surfaces, ink, accents, status, telemetry, glitch channels.
- `typography.css` — families, weights, fluid display scale, body/mono sizes, line-height, tracking.
- `spacing.css` — spacing scale, widths, radii, borders, shadows, glows, texture, motion.
- `base.css` — element resets + brand atoms (`.eyebrow`, `.btn`, `.chip`, `.display-*`, `.grid-bg`, `.gw` glitch).

**Components** (`components/`, namespace `window.CriticalErrorComputingDesignSystem_0eecf1`)
- `core/` — **Button**, **Chip**, **Tag**, **Eyebrow**, **GlitchText**
- `surfaces/` — **Card**
- `forms/` — **Field**, **SegControl**
- `fleet/` — **FleetCard** (signature product card), **SpecTable**
- `feedback/` — **ProbeBubble** (chat message)
- Each has `.jsx` + `.d.ts` + `.prompt.md`, and a `*.card.html` demo.

**Foundation cards** (`guidelines/cards/`) — Design System tab specimens: Colors (surfaces, accents, ink/status, telemetry), Type (display, body, mono, glitch), Spacing (scale, radii, shadows), Brand (logo, Probe, partners, texture).

**UI kit** (`ui_kits/storefront/`) — interactive homepage recreation (nav, hero + Probe chat, partners, compare, fleet + detail, reviews, footer, rep modal). See its `README.md`.

**Assets** (`assets/`) — `cec-logo.png`, `probe-ship.png`, `favicon.png`, `classes/*.webp` (the fleet), `logos/*.png` (partners), `gallery/*.jpg` (build photos), `fonts/*.woff2`.

---

## Caveats
- **Fonts are the real CEC self-hosted webfonts** (Saira / Saira Condensed / IBM Plex Mono, latin subset) — no substitution needed.
- The KVM Pro hardware product and the deeper interior pages (Compare engine, Leaderboard, Etching, Services) exist in the source but are **not** rebuilt here — the kit focuses on the homepage surface. Ask if you want those added.
