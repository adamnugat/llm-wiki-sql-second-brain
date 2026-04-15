---
title: LLM Wiki Overview
type: overview
status: active
created: 2026-04-15
updated: 2026-04-15
source_paths:
 - raw/sources/2026-04-15-llm-wiki-idea.md
source_count: 1
---

## Summary

This wiki is a persistent, LLM-maintained markdown knowledge base that sits between the user and raw source documents. The current corpus is seeded from a single source that defines the pattern, its architecture, and the default operating loop for growing the wiki over time.

## Current Structure

- `raw/sources/` stores immutable source inputs that the human curates or explicitly pastes into chat.
- `raw/assets/` stores local images or attachments referenced by sources when they matter.
- `wiki/sources/` stores one page per ingested source.
- `wiki/entities/` stores durable pages for named things, systems, actors, or domains when they become important.
- `wiki/concepts/` stores recurring ideas, workflows, abstractions, and comparisons.
- `wiki/analyses/` stores durable answers created from substantive questions.
- `wiki/index.md` is the first navigation surface.
- `wiki/log.md` is the chronological record of setup, ingest, query, and lint work.

## Operating Model

The source defines a three-layer system: raw sources as immutable truth, the wiki as the maintained synthesis layer, and `CLAUDE.md` as the schema that governs the LLM's behavior. The canonical maintenance loop is [[concepts/wiki-operations]], and the central design principle is captured in [[concepts/llm-wiki-pattern]].

## Current Coverage

Coverage is intentionally narrow at the moment. This repository currently contains one abstract pattern document rather than a domain-specific corpus. That means the wiki is ready to operate, but most future value will come from ingesting concrete personal, research, or project sources.

## Open Questions

- Which domains should become the first real branches of this second brain: personal notes, project knowledge, research, or something else?
- How hands-on should ingest be by default: one-source-at-a-time review or more batch-oriented processing?
- Which optional outputs matter enough to support early, such as tables, presentations, or charts?

## Related

- [[sources/2026-04-15-llm-wiki-idea]]
- [[concepts/llm-wiki-pattern]]
- [[concepts/wiki-operations]]
