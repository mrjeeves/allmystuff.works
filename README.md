# allmystuff.works — GitHub Pages site

Static site, no build step.

## Deploy

1. Push the contents of this folder to a GitHub repo (the files, not the folder itself — `index.html` must be at the repo root).
2. Repo → Settings → Pages → Source: **Deploy from a branch**, branch `main`, folder `/ (root)`.
3. Done. The site works from any subpath (all asset paths are relative).

Notes:
- `support.js` loads React 18 from unpkg at runtime (pinned + SRI), so visitors need to be online — which they are, it's a website.
- An empty `.nojekyll` file is included so GitHub Pages serves the `_ds/` folder (Jekyll normally ignores `_`-prefixed paths).
