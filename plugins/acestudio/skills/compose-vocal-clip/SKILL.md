---
name: compose-vocal-clip
description: End-to-end recipe for writing a sung melody in ACE Studio — create/pick a track, load a singer, place a Sing clip, add notes with lyrics, wait for synthesis, and play it back. Use when the user asks to write, compose, or sing a melody or lyric.
---

# Compose a vocal clip

Read `working-with-ace-studio` first if you haven't. This is the happy-path
workflow; consult `get_docs` for any command whose arguments you don't
remember.

## 1. Survey the project

```
status project          # is a project open? tempo, length
track list              # existing tracks, types, singers
```

If no project is open, ask the user to open one — you cannot.

## 2. Pick or prepare a Sing track

If a suitable Sing track with a loaded singer already exists, use it.
Otherwise load a singer onto a track:

```
sound-source list --sound-source-type voice     # locally installed singers
sound-source load --track-index <n> --sound-source-type singer \
                  --id <id> --group ""          # "" = official, "#" = custom
```

Community singers can be browsed with `sound-source community-list` and
must be collected (`sound-source community-collect`) before loading.

## 3. Place a Sing clip

```
clip list                                        # check the target range first!
clip add --track-index <n> --pos <ticks> --dur <ticks> --type sing
```

Placing a clip auto-deletes fully-covered clips and trims/splits partial
overlaps — always check `clip list` first and warn the user if the target
range is occupied.

## 4. Open the clip and add notes

Move the marker-line into the clip — that IS the "open" action — then
bulk-add all notes in ONE call:

```
marker set --scope global --tick <clip start> --track-index <n>
editor status                                    # confirm the editor targets your clip
editor add-notes \
  --notes '[{"pos":0,"dur":480,"pitch":60},{"pos":480,"dur":480,"pitch":62}, ...]' \
  --lyric-sentence "your lyric here" --language ENG
```

Rules that matter:

- Submit **all notes in one call** — Sing clips apply the monophonic
  constraint atomically per batch.
- `pos` is in **local ticks** relative to the editor's `tickBegin`.
- Prefer **sentence mode** (`--lyric-sentence`): the G2P backend distributes
  syllables across notes. Syntax: `happy#1 happy#2` for syllable indices,
  `-` for tenuto (hold previous syllable). Languages: CHN/JPN/ENG/SPA/KOR.
- Per-note `lyric` fields and `--lyric-sentence` are mutually exclusive.
- Sing tracks are monophonic — overlapping notes will be resolved, so
  write a non-overlapping melody line.

## 5. Synthesize, then play

Synthesis runs in the background after edits. Poll before playing:

```
status synthesis        # repeat until "No content synthesis in progress"
marker set --scope global --tick <clip start>    # play from the top of the clip
playback start
```

If the user wants to hear a specific section on repeat, set a loop with
`loop set` instead of restarting playback manually.

## 6. Iterate

To revise: `editor get-content` to read what's there, `editor select-notes`
+ `editor delete-selection` to remove, then `editor add-notes` again.
Remember each command is one undo step — tell the user they can Ctrl+Z.
