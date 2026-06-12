# allmystuff.works — GitHub Pages site

Static site, no build step.

## Deploy

1. Push the contents of this folder to a GitHub repo (the files, not the folder itself — `index.html` must be at the repo root).
2. Repo → Settings → Pages → Source: **Deploy from a branch**, branch `main`, folder `/ (root)`.
3. Done. The site works from any subpath (all asset paths are relative).

## Layout

- `index.html` — the homepage (uses `support.js`, the x-dc runtime).
- `hardware/` — the Access line page: OS-down recovery demo, wiring diagram, full specs. Plain HTML + vanilla JS, no framework.
- `download/` — downloads for every platform. Static links to `releases/latest`; a small script upgrades them to direct versioned asset URLs via the GitHub API when reachable.
- `install.sh` / `install.ps1` — the one-liner installers the site advertises (`curl -fsSL https://allmystuff.works/install.sh | sh`). They pull from the latest GitHub release of `mrjeeves/AllMyStuff` and verify the published SHA-256 sidecars.

Notes:
- `support.js` loads React 18 from unpkg at runtime (pinned + SRI), so visitors need to be online — which they are, it's a website.
- The design-system files live under `ds/cec/` (no underscore-prefixed folders, so it deploys with or without Jekyll).
