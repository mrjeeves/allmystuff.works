# allmystuff.works — GitHub Pages site

Static site, no build step.

## Deploy

1. Push the contents of this folder to a GitHub repo (the files, not the folder itself — `index.html` must be at the repo root).
2. Repo → Settings → Pages → Source: **Deploy from a branch**, branch `main`, folder `/ (root)`.
3. Done. The site works from any subpath (all asset paths are relative).

## Layout

The site is organized around the three pillars — powerful free software,
affordable hardware, excellent support staff — each with a page of its own.
The homepage is the overview/connector: hero, the three pillars, one teaser
per pillar, download, and the top three FAQs with a "More questions" link.

- `index.html` — the homepage/overview (uses `support.js`, the x-dc runtime).
- `software/` — pillar 01, the free app: the four scenes (console, shell + files, sharing, fleet) and the graph/mesh explainer. Plain HTML.
- `hardware/` — pillar 02, the Access line: OS-down recovery demo, wiring diagram, full specs. Plain HTML + vanilla JS, no framework.
- `service/` — pillar 03, two services / four products: Concierge with its three options (Pay as you go, Priority, Looked after) and the Private Line, compared against the free shared layer. Plain HTML.
- `faq/` — every question, grouped by pillar.
- `download/` — downloads for every platform, with a "for this machine" suggestion sniffed from the user agent (hidden on phones / when unsure) and a tabbed one-liner picker (macOS/Linux · Windows · from source, auto-picked, with copy buttons — the same wiring myownmesh.net uses). Static links to `releases/latest`; a small script upgrades them to direct versioned asset URLs via the GitHub API when reachable.
- `install.sh` / `install.ps1` — the one-liner URLs the site advertises (`curl -fsSL https://allmystuff.works/install.sh | sh`). They are thin stubs that fetch and run the canonical installers maintained in the app repo (`AllMyStuff/scripts/install.{sh,ps1}`), forwarding all flags — one source of truth, zero drift.

Notes:
- `support.js` loads React 18 from unpkg at runtime (pinned + SRI), so visitors need to be online — which they are, it's a website.
- The design-system files live under `ds/cec/` (no underscore-prefixed folders, so it deploys with or without Jekyll).
