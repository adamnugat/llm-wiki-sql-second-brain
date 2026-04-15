---
title: LLM Wiki Idea
type: source
status: active
created: 2026-04-15
updated: 2026-04-15
source_paths:
 - raw/sources/2026-04-15-llm-wiki-idea.md
source_count: 1
---

## Summary

This source proposes a persistent markdown wiki, maintained by an LLM, as an alternative to query-time rediscovery over raw documents. Its central claim is that the knowledge base should be compiled and continuously revised as new sources arrive, rather than reconstructed from scratch on each question.

## Key Facts

- The architecture has three layers: immutable raw sources, an LLM-maintained wiki, and a schema file that constrains how the LLM operates.
- The wiki is meant to be persistent and compounding: new sources should update summaries, concept pages, entity pages, and contradiction tracking.
- The human's role is to curate sources, steer priorities, and ask good questions; the LLM's role is summarizing, cross-referencing, integrating, and bookkeeping.
- The source defines three recurring operations: ingest, query, and lint.
- `index.md` is the primary navigation catalog, while `log.md` is the chronological record of what has changed.
- The source recommends keeping raw documents immutable and treating the wiki as the editable synthesis layer.
- Optional tooling such as local search, Obsidian, Marp, and Dataview can support the workflow, but the pattern does not depend on them.

## What This Source Changes

- Establishes the repository's initial architecture and folder conventions.
- Defines the operating schema now captured in `CLAUDE.md`.
- Seeds the first concept pages for the core pattern and its maintenance loop.
- Sets the default expectation that durable answers should be filed back into the wiki instead of disappearing into chat history.

## Open Questions

- What domains will this wiki prioritize first?
- When should entity pages appear instead of remaining folded into concept pages?
- At what scale will local search tooling become necessary rather than optional?

## Related

- [[overview]]
- [[concepts/llm-wiki-pattern]]
- [[concepts/wiki-operations]]
