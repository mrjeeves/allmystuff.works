# allmystuff.works — GitHub Pages site

Static site, no build step.

## Deploy

1. Push the contents of this folder to a GitHub repo (the files, not the folder itself — `index.html` must be at the repo root).
2. Repo → Settings → Pages → Source: **Deploy from a branch**, branch `main`, folder `/ (root)`.
3. Done. The site works from any subpath (all asset paths are relative).

Notes:
- `support.js` loads React 18 from unpkg at runtime (pinned + SRI), so visitors need to be online — which they are, it's a website.
- The design-system files live under `ds/cec/` (no underscore-prefixed folders, so it deploys with or without Jekyll).
