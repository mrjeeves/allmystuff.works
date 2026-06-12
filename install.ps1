# allmystuff.works/install.ps1 — short URL for the canonical AllMyStuff
# installer, which lives in the app repository and is maintained there:
#
#   https://github.com/mrjeeves/AllMyStuff/blob/main/scripts/install.ps1
#
# This stub only fetches that script and runs it, forwarding parameters
# (-NoGui, -NoMesh, -DryRun, ...), so the site can never drift from what
# the app actually ships.
#
#   irm https://allmystuff.works/install.ps1 | iex
#   & ([scriptblock]::Create((irm https://allmystuff.works/install.ps1))) -NoGui

$ErrorActionPreference = "Stop"
$canonical = "https://raw.githubusercontent.com/mrjeeves/AllMyStuff/main/scripts/install.ps1"
$script = Invoke-RestMethod -Uri $canonical -Headers @{ "User-Agent" = "allmystuff-install" }
& ([scriptblock]::Create($script)) @args
