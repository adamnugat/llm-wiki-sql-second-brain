# LLM Wiki Schema

This repository is a persistent LLM-maintained wiki. Treat it as a compounding knowledge base, not a chat transcript and not a raw-document RAG bucket.

## Mission

Maintain a structured, interlinked markdown wiki that sits between the user and raw sources.

- The human curates sources, asks questions, and steers priorities.
- The LLM reads sources, synthesizes them, updates the wiki, maintains cross-links, and records work in the log.
- Knowledge should accumulate. If the same conclusion must be rediscovered repeatedly, the wiki is under-maintained.

## Repository Layout

```text
raw/
  sources/   Immutable source documents added by the human or explicitly captured from chat
  assets/    Downloaded images or other local attachments referenced by sources

wiki/
  index.md   Content-oriented catalog of wiki pages; read this first
  log.md     Append-only chronological record of setup, ingests, queries, and lint passes
  overview.md
  sources/   One page per ingested source
  entities/  Stable pages for named things, systems, actors, or data domains
  concepts/  Themes, workflows, abstractions, tensions, comparisons
  analyses/  Durable answers created from user questions
```

## Ownership Rules

- Never modify existing files under `raw/`. They are immutable source-of-truth inputs.
- New raw files may be created only when the human adds a source or explicitly provides source text in chat that should become part of the corpus.
- The LLM fully maintains files under `wiki/`, but must preserve clearly human-authored notes if the user adds them.
- Prefer updating existing wiki pages over creating near-duplicates.
- Keep filenames stable once they become established, unless a rename materially improves organization.
- `wiki/log.md` is append-only except for correcting obvious formatting or factual mistakes in the newest entry during the same session.
- Every material wiki change must update `wiki/index.md` and append an entry to `wiki/log.md`.

## Global Operating Loop

For every interaction that touches the knowledge base:

1. Read `wiki/index.md` first.
2. Read the most recent relevant entries in `wiki/log.md`.
3. Read the relevant wiki pages before answering or editing.
4. Read raw sources directly when the wiki is insufficient or when ingesting new material.
5. Separate source facts, synthesis, inferences, and open questions.
6. If the interaction produces durable knowledge, file it back into `wiki/`.
7. Update `wiki/index.md` and append an entry to `wiki/log.md`.

If the user asks a purely operational question with no lasting value, answer directly and skip persistence.

## Setup Workflow

Use this when initializing a new wiki repository.

1. Create the `raw/` and `wiki/` directory structure.
2. Create `CLAUDE.md` with the active schema.
3. Create `wiki/index.md`, `wiki/log.md`, and `wiki/overview.md`.
4. If a seed source exists, ingest it immediately so the wiki starts with at least one concrete example.
5. Record a `setup` entry in `wiki/log.md`.

## Source Intake Rules

- Treat sources as curated inputs, not an arbitrary dump.
- When the user pastes source material directly into chat and clearly intends it to become part of the corpus, save it under `raw/sources/` before integrating it.
- Keep raw source filenames descriptive and stable using `YYYY-MM-DD-short-title.ext` when a date is known.
- Save downloaded or referenced local media under `raw/assets/` when it materially supports the source.
- If source coverage is incomplete, say so rather than overfilling gaps.

## File Naming

- Use lowercase kebab-case filenames.
- Source pages live at `wiki/sources/YYYY-MM-DD-short-title.md`.
- Entity pages live at `wiki/entities/<entity-or-cluster>.md`.
- Concept pages live at `wiki/concepts/<concept-name>.md`.
- Analysis pages live at `wiki/analyses/YYYY-MM-DD-short-title.md` when tied to a specific dated question, otherwise `wiki/analyses/<topic>.md`.

## Page Frontmatter

All pages in `wiki/` except `index.md` and `log.md` should begin with YAML frontmatter using this shape:

```yaml
---
title: Human readable title
type: overview | source | entity | concept | analysis
status: seed | active | superseded
created: YYYY-MM-DD
updated: YYYY-MM-DD
source_paths:
 - relative/path/to/source.ext
source_count: 0
---
```

Rules:

- `source_paths` may be empty only for purely procedural pages.
- `source_count` is the number of distinct raw sources that materially support the page.
- Keep dates current whenever the page meaningfully changes.

## Link Style

- Use Obsidian-style wikilinks for internal references, e.g. `[[overview]]` or `[[concepts/deal-lifecycle]]`.
- Prefer links embedded in prose over isolated link dumps.
- Every non-source page should link to at least one other wiki page unless it is brand new and waiting to be integrated.

## Evidence Discipline

- State only what is supported by the available sources.
- When making an inference, label it as an inference.
- When source coverage is incomplete, say so explicitly.
- When a new source contradicts an existing claim:
  - update the affected page
  - preserve the disagreement rather than flattening it away
  - mention the contradiction on the source page and the affected concept or entity page
  - note the change in `wiki/log.md`

## Answering Queries

When the user asks a substantive question:

1. Start from `wiki/index.md`.
2. Read the relevant pages and recent log entries.
3. Read supporting raw sources if needed.
4. Answer in chat with explicit references to the wiki pages and raw sources used.
5. If the answer creates durable synthesis, store it in `wiki/analyses/` or fold it into an existing page.
6. Update `wiki/index.md` and append a `query` log entry if anything durable was added.

## Page Templates

### Source Page Template

Use these sections unless a source requires something specialized:

- `## Summary`
- `## Key Facts`
- `## What This Source Changes`
- `## Open Questions`
- `## Related`

### Entity Page Template

- `## Summary`
- `## What We Know`
- `## Relationships`
- `## Open Questions`
- `## Related`

### Concept Page Template

- `## Summary`
- `## Evidence`
- `## Tensions Or Gaps`
- `## Related`

### Analysis Page Template

- `## Prompt`
- `## Conclusion`
- `## Evidence`
- `## Follow-ups`
- `## Related`

## Core Workflows

### Ingest Workflow

Use this when a new raw source is added.

1. Confirm the source path and ingest date.
2. Read the source directly.
3. Ask the user about emphasis only if priorities are unclear.
4. Create or update the source page in `wiki/sources/`.
5. Update all relevant entity, concept, and overview pages.
6. Add or revise cross-links.
7. Update `wiki/index.md`.
8. Append an `ingest` entry to `wiki/log.md`.

Minimum ingest output:

- one source page
- at least one updated non-source page
- index update
- log entry

### Query Workflow

Use this when answering substantive knowledge questions.

1. Start from `wiki/index.md`.
2. Read the relevant pages and any supporting raw source if needed.
3. Answer in chat with explicit references to wiki pages and raw sources.
4. If the answer creates durable synthesis, store it in `wiki/analyses/` or fold it into an existing page.
5. Update `wiki/index.md` and append a `query` log entry if anything durable was added.

### Lint Workflow

Use this for periodic maintenance.

Check for:

- contradictions between pages
- claims superseded by newer sources
- orphan pages with no meaningful inbound links
- important concepts without their own page
- duplicate pages that should be merged
- stale source pages that never propagated into the broader wiki
- missing cross-references
- missing follow-up questions or obvious source gaps

Record a `lint` entry in `wiki/log.md` with findings and follow-ups.

## Index Rules

`wiki/index.md` is the first page to read when navigating the wiki.

- Organize entries by category.
- Each entry is one line: link plus one-line summary.
- Keep the catalog current. Remove or relabel entries when pages are renamed or superseded.
- The index is a navigation tool, not a prose essay.

## Log Rules

Every entry in `wiki/log.md` must use this heading format:

```md
## [YYYY-MM-DD] operation | Title
```

Allowed `operation` values:

- `setup`
- `ingest`
- `query`
- `lint`

Each entry should include:

- paths or pages touched
- a short summary of what changed
- follow-up questions when relevant

## Scope Management

- Prefer compact pages with strong links over giant catch-all notes.
- Split a page when it begins mixing multiple concepts that deserve separate navigation targets.
- Do not create empty placeholder pages unless they solve an immediate navigation problem.

## What To Do Next By Default

When the user gives a new source:

- ingest it
- integrate it into the existing wiki
- show the user the important updates

When the user asks a substantive question:

- answer from the wiki first
- deepen with raw sources as needed
- file durable insights back into the wiki

When the user asks for a health check:

- run the lint workflow
- recommend high-value next ingests or questions
