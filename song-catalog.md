---
title: Adam K — Song Catalog (BPM · Key · Status)
category: adam-k/working
tags: [artist/adam-k, type/catalog, domain/music, auto-maintained]
summary: Master catalog of every Adam K song. Auto-appended whenever a key, BPM, or new song name surfaces in any agent conversation. Doubles as a public-facing timestamp/copyright record (see system/vault-rules.md → Auto-capture rules).
created: 2026-06-02
updated: 2026-06-02
lifecycle: stable
provenance: extracted
artist: Adam K
maintenance: auto-append by any agent under the auto-capture rule
publishing_intent: yes — see "Publishing & timestamp" section below
---

# Adam K — Song Catalog

> **Standing rule.** Any agent working in this vault must append to this file whenever:
> - a **song key** for an Adam K track is mentioned or detected
> - a **BPM** for an Adam K track is mentioned or detected
> - a **new song name** by Adam K (or featuring Adam K) appears
>
> Add new rows below the table. If a row already exists, fill the empty columns; do not overwrite Adam's manual entries. Stamp the `first_logged` column with today's date in ISO.
>
> Full rule lives in [[system/vault-rules]] under **Auto-capture rules**.

## Catalog

| Track | BPM | Key | Status | First logged | Source / notes |
|---|---|---|---|---|---|
| Hits Are For Kids (Original Mix) | ~126 | — | released | 2026-06-02 | estimated via numpy autocorrelation |
| 1981 (Adam K Remix) | 130 | — | released | 2026-06-02 | tag = 130, estimate ≈129 |
| Need To Feel Loved — Adam K & Soha (Vocal) | ~128 | — | released | 2026-06-02 | estimated |
| In A Mirror — Adam K & Frederik Mooij | ~128 | — | released | 2026-06-02 | estimated |
| I Won't Let You Down (TD 3.3 RB VOX v5) | ~124 | — | wip | 2026-06-02 | working version |
| Blush — Adam K & Soha v1 | ~129 | — | wip | 2026-06-02 | mix variant |
| Blush — Adam K & Soha v2 | ~129 | — | wip | 2026-06-02 | mix variant |
| Twilight — Adam K & Soha | ~128 | — | released | 2026-06-02 | estimated |

## Range

Vocal house catalog currently sits **124–130 BPM**.

## Publishing & timestamp

This catalog is intended to be **public** — it functions as a self-published, timestamped record of Adam K's catalog. Each commit / publish acts as informal prior-art evidence (Adam's intent, not a substitute for actual copyright registration).

**Publishing channels under consideration** — see Adam's question logged in the session of 2026-06-02:

- Git-tracked + pushed to a public GitHub repo (one commit = one timestamp)
- OpenTimestamps proof on the file hash (cryptographic, Bitcoin-anchored)
- Static page on a kershen.com subpath
- Notarized snapshot on a service like stamper.io

Decision still open — agents should not auto-publish; Adam confirms the channel.

## Notes

- Tagged values (e.g. 1981 at 130 BPM) take precedence over estimates.
- For live performance / set planning, treat tempos as starting points — Adam's ear in Ableton overrides.
- Key column blank for everything pre-2026-06-02 (not yet captured); fill as keys surface.

## See also

- [[entities/adam-kershen]]
- [[adam-k/releases/release-strategy-2026-factor]]
- [[system/vault-rules]] — full auto-capture rule
