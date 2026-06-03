# Adam K — Song Catalog

Public, timestamp-anchored mirror of Adam Kershen's ("Adam K") song catalog.

The canonical file lives in Adam's private Obsidian vault. This repository mirrors `song-catalog.md` for two purposes:

1. **Public visible timestamp** — every commit to this repo records, on GitHub's infrastructure, the state of the catalog at a given moment in time.
2. **Cryptographic anchor** — `song-catalog.md.ots` is an [OpenTimestamps](https://opentimestamps.org) proof binding the SHA-256 of `song-catalog.md` to the Bitcoin blockchain. The proof is verifiable independently of GitHub, this repo, or any third party.

This is **not** a substitute for formal copyright registration. It is an unforgeable record of what existed when.

## What's here

- `song-catalog.md` — the catalog. Tracks, BPM, key, status, first-logged date.
- `song-catalog.md.ots` — OpenTimestamps proof of the file's hash.
- `README.md` — this file.

Nothing else from Adam's vault is or will be published here.

## Reading the proof

Anyone, anywhere, with the file and the `.ots` proof, can independently verify:

```bash
brew install opentimestamps-client
ots verify song-catalog.md.ots
```

The first run after a fresh stamp may report "pending" — Bitcoin confirmations take a few hours. Run `ots upgrade song-catalog.md.ots` later to fetch the confirmed proof.

## What absence means

Absence of a track from this file is **not** absence from Adam K's catalog. The catalog reflects what Adam (or his agents working from his vault) have chosen to surface here at any given commit. Older or unreleased material may exist that has not yet been mirrored.

## Updates

Each new commit is a new timestamp. Adam will re-stamp and re-commit as the catalog grows. A follow-up mirror script (run from a vault `wiki-update`, a cron, or a git hook) will be added so updates stay in sync without manual work.

## Contact

Adam Kershen — see [theaccessvirus](https://github.com/theaccessvirus) on GitHub.
