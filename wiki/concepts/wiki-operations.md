---
title: Wiki Operations
type: concept
status: active
created: 2026-04-15
updated: 2026-04-15
source_paths:
 - raw/sources/2026-04-15-llm-wiki-idea.md
source_count: 1
---

## Summary

The source defines three recurring operations for maintaining the knowledge base: ingest, query, and lint. Together they make the wiki cumulative by ensuring new sources are integrated, useful answers are preserved, and the structure stays healthy over time.

## Evidence

- Ingest means reading a new raw source, creating or updating a source page, revising relevant concept and entity pages, updating the index, and appending a log entry.
- Query means answering from the wiki first, then filing durable outputs such as analyses or comparisons back into the wiki when they add lasting value.
- Lint means checking for contradictions, stale claims, orphan pages, missing concept pages, weak cross-references, and obvious source gaps.
- The source treats `index.md` as the first navigation step for content discovery and `log.md` as the chronological memory of recent work.

## Tensions Or Gaps

- The source leaves the degree of human involvement flexible, from hands-on one-at-a-time ingest to batch processing.
- It does not prescribe strict thresholds for when a concept deserves its own page or when an answer deserves to become an analysis page.
- Inference: the most stable default is to stay conservative early, create pages only when they improve navigation, and let the structure deepen as the corpus grows.

## Related

- [[overview]]
- [[sources/2026-04-15-llm-wiki-idea]]
- [[concepts/llm-wiki-pattern]]
