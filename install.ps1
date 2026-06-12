# install.ps1 — AllMyStuff installer for Windows.
#
#   irm https://allmystuff.works/install.ps1 | iex
#   & ([scriptblock]::Create((irm https://allmystuff.works/install.ps1))) -CliOnly
#
# What it does:
#   Default — downloads the latest AllMyStuff setup.exe from the GitHub
#   release (the only place builds are hosted) and runs the installer.
#   -CliOnly — downloads the portable CLI zip instead, verifies its
#   SHA-256 sidecar, and unpacks it to %LOCALAPPDATA%\AllMyStuff\bin.
#
# No telemetry, no account. Everything comes from
# https://github.com/mrjeeves/AllMyStuff/releases — verify there anytime.

param([switch]$CliOnly)

$ErrorActionPreference = "Stop"
$Repo = "mrjeeves/AllMyStuff"
$Api  = "https://api.github.com/repos/$Repo/releases/latest"

function Say([string]$msg) { Write-Host "  allmystuff " -ForegroundColor Magenta -NoNewline; Write-Host $msg }

if ($env:PROCESSOR_ARCHITECTURE -eq "ARM64") {
  Say "heads-up: no native ARM64 build yet - the x64 build runs under emulation."
}

Say "looking up the latest release..."
$rel = Invoke-RestMethod -Uri $Api -Headers @{ "User-Agent" = "allmystuff-install" }
$tag = $rel.tag_name
Say "latest is $tag"

$tmp = Join-Path $env:TEMP "allmystuff-install"
New-Item -ItemType Directory -Force -Path $tmp | Out-Null

if ($CliOnly) {
  $name = "allmystuff-windows-x86_64.zip"
  $asset = $rel.assets | Where-Object { $_.name -eq $name }
  $sha   = $rel.assets | Where-Object { $_.name -eq "$name.sha256" }
  if (-not $asset) { throw "asset $name not found in release $tag" }

  $zip = Join-Path $tmp $name
  Say "downloading $name..."
  Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zip

  if ($sha) {
    $want = ((Invoke-WebRequest -Uri $sha.browser_download_url).Content -split "\s+")[0].Trim().ToLower()
    $got  = (Get-FileHash -Algorithm SHA256 -Path $zip).Hash.ToLower()
    if ($want -ne $got) { throw "checksum mismatch for $name - refusing to install" }
    Say "checksum ok"
  }

  $dest = Join-Path $env:LOCALAPPDATA "AllMyStuff\bin"
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  Expand-Archive -Path $zip -DestinationPath $dest -Force
  Say "installed - $dest\allmystuff.exe"

  $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
  if ($userPath -notlike "*$dest*") {
    Say "note: $dest is not on your PATH. Add it with:"
    Say "      [Environment]::SetEnvironmentVariable('Path', `"$userPath;$dest`", 'User')"
  }
  Say "done. Try: allmystuff scan"
}
else {
  $asset = $rel.assets | Where-Object { $_.name -like "*-setup.exe" } | Select-Object -First 1
  if (-not $asset) { throw "no setup.exe found in release $tag" }

  $exe = Join-Path $tmp $asset.name
  Say "downloading $($asset.name)..."
  Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $exe
  Say "starting the installer (it shows exactly what it changes)..."
  Start-Process -FilePath $exe -Wait
  Say "done. AllMyStuff is in your Start menu."
}
