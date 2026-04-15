---
title: LLM Wiki Pattern
type: concept
status: active
created: 2026-04-15
updated: 2026-04-15
source_paths:
 - raw/sources/2026-04-15-llm-wiki-idea.md
source_count: 1
---

## Summary

The core pattern is to treat the wiki as a compiled knowledge layer that sits between the human and the raw source corpus. Instead of rediscovering relationships at query time from isolated chunks, the LLM incrementally writes and maintains the synthesis ahead of time.

## Evidence

- The seed source explicitly contrasts this model with typical RAG workflows that retrieve raw chunks and re-synthesize answers from scratch on every question.
- The source frames the wiki as a persistent, compounding artifact whose summaries, links, and contradictions should already reflect prior reading.
- The source assigns the human to curation and direction while assigning the LLM to maintenance-heavy work such as summarization, cross-referencing, and integration.
- The source positions Obsidian as a browsing surface for the maintained artifact, not as the place where the human manually does the bookkeeping.

## Tensions Or Gaps

- Current support comes from one abstract source rather than a set of real-world examples or failure cases.
- The source argues that the pattern scales better than repeated rediscovery, but it does not define concrete thresholds for when search tooling becomes necessary.
- Inference: the long-term quality of the wiki will depend heavily on disciplined source curation and periodic linting, even if the maintenance burden is low.

## Related

- [[overview]]
- [[sources/2026-04-15-llm-wiki-idea]]
- [[concepts/wiki-operations]]
