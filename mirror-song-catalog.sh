#!/usr/bin/env bash
# mirror-song-catalog.sh
#
# Syncs the canonical song catalog from Adam's Obsidian vault into this
# public repo, re-stamps with OpenTimestamps if the file changed, commits,
# and pushes. Safe to run repeatedly — exits cleanly if nothing changed.
#
# Suggested wiring:
#   - Run manually after major catalog edits, OR
#   - Add as a tail step of the wiki-update skill, OR
#   - Schedule via launchd / cron (e.g. nightly at 03:00)
#
# Usage:
#   ./mirror-song-catalog.sh          # sync, stamp if changed, commit, push
#   ./mirror-song-catalog.sh --dry    # show what would happen, no writes
#
# Requires: opentimestamps-client (brew install opentimestamps-client), gh, git

set -euo pipefail

VAULT_CATALOG="/Users/adamkershen/Library/Mobile Documents/iCloud~md~obsidian/Documents/vault/adam-k/working/song-catalog.md"
REPO_DIR="$HOME/theaccessvirus-local/adam-k-catalog"
MIRROR="$REPO_DIR/song-catalog.md"
DRY=0
[[ "${1:-}" == "--dry" ]] && DRY=1

if [[ ! -f "$VAULT_CATALOG" ]]; then
  echo "Vault catalog not found at: $VAULT_CATALOG" >&2
  exit 1
fi

cd "$REPO_DIR"

src_hash=$(shasum -a 256 "$VAULT_CATALOG" | awk '{print $1}')
mirror_hash=$(shasum -a 256 "$MIRROR" 2>/dev/null | awk '{print $1}' || echo "")

if [[ "$src_hash" == "$mirror_hash" ]]; then
  echo "No change — vault and mirror hashes match ($src_hash)."
  echo "Attempting to upgrade existing OTS proof in case Bitcoin confirmed it..."
  [[ $DRY -eq 0 ]] && ots upgrade song-catalog.md.ots 2>&1 || true
  # If upgrade modified the .ots file, commit it
  if [[ -n "$(git status --porcelain song-catalog.md.ots 2>/dev/null)" ]]; then
    if [[ $DRY -eq 1 ]]; then
      echo "[dry-run] Would commit upgraded OTS proof"
    else
      git add song-catalog.md.ots
      git commit -m "Upgrade OpenTimestamps proof (Bitcoin-confirmed)"
      git push
    fi
  fi
  exit 0
fi

echo "Change detected:"
echo "  vault:  $src_hash"
echo "  mirror: ${mirror_hash:-<missing>}"

if [[ $DRY -eq 1 ]]; then
  echo "[dry-run] Would copy catalog, ots stamp, commit, push"
  exit 0
fi

cp "$VAULT_CATALOG" "$MIRROR"
ots stamp song-catalog.md
git add song-catalog.md song-catalog.md.ots
git commit -m "Update song catalog and OpenTimestamps proof

SHA-256 (song-catalog.md): $src_hash"
git push
echo "Synced and pushed. New SHA-256: $src_hash"
