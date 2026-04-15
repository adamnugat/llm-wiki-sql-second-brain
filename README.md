# llm-wiki-sql-second-brain

This repository contains a complete example of a configured LLM knowledge base built from a database schema. The idea is to turn your SQL schema into a Markdown-based "second brain" where each table gets its own note and relationships between tables are represented as links between Markdown files.

It is designed to help you reach a point where future SQL generation via prompts can be grounded in the real structure of your database with high accuracy.

## What This Repository Includes

- A working example of a schema-driven knowledge base.
- A sample parser script: `parse-schema.js`.
- A generated `wiki/` structure with one Markdown page per table.
- A `raw/` folder for immutable source inputs such as SQL schema dumps.

## How To Build Your Own Setup

### 1. Create A Knowledge Base Root Folder

Create a new root folder for your knowledge base project.

Then set that folder as the active agent context in Cursor so the agent works inside the new knowledge base directory from the start.

### 2. Seed The Agent With The LLM Wiki Idea

Copy the full idea file from Andrej Karpathy's repository page:

- [LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)

Paste the entire content into the agent chat while your newly created folder is the active context.

Immediately after that, append this follow-up prompt (Thanks to Nate Herk for helping popularize this workflow:
https://www.youtube.com/@nateherk):

```text
You are now my LLM Wiki agent. Implement this exact idea file as my complete second brain. Guide me step-by-step: create the CLAUDE.md schema file with full rules, set up index.md and log.md, define folder conventions, and show me the first ingest example. From now on, every interaction follows the schema.
```

### 3. Ask The Agent To Create A Schema Parser

Once the base wiki structure is ready, send the following prompt:

```text
I want to transform my knowledge base into a "second brain" built on top of my database, so that each table has its own representation as a separate Markdown file, with relationships (represented as links) to other tables, i.e. to other MD files. The goal is to enable writing SQL in the future using prompts with perfect accuracy, based on the database schema.

With the above in mind, I want you to write a Node.js script that can parse my entire database schema. There are around 500 tables, and each should be converted into a separate MD file. I want the parser to generate Markdown files whose structure is as closely aligned as possible with what works best for my knowledge base. Each table should be handled as an individual Markdown file with an appropriate structure.

Create the script and explain how to use it.

Below I'm attaching a fragment of the database schema to make it easier to design the parser:

--> ADD 200 LINES OF YOUR DATABASE SCHEMA HERE <--
```

This prompt is recommended even if you already have a parser, because it gives the agent schema-specific context and helps it adapt the output format to your own database.

### 4. Use The Example Parser In This Repository

This repository already includes a sample parser in the root:

```text
parse-schema.js
```

Original file reference:

- [parse-schema.js](https://github.com/adamnugat/llm-wiki-sql-second-brain/blob/main/parse-schema.js)

Even so, for best parsing quality, it is still recommended to use the prompt from the previous step so the agent can validate or improve the parser against your real schema.

### 5. Ask For Parser Usage Instructions

If the agent creates a custom parser for you, ask it to explain the usage clearly.

Example prompt:

```text
Explain how to use the parser step by step, including where to place the schema file, what command to run, what files will be generated, and whether index.md and log.md are updated automatically.
```

If you use the parser from this repository, follow the instructions below.

### 6. Run The Parser

Move your database schema dump into `raw/`.

Example:

```text
raw/schema.sql
```

Then, from the repository root, run:

```bash
node parse-schema.js raw/schema.sql --index --log
```

This command will:

- parse your schema dump,
- create one Markdown file per table,
- generate links between notes based on detected relationships,
- regenerate `wiki/index.md`,
- append a new entry to `wiki/log.md`.

### 7. What You Get After Parsing

After this step you should have Markdown files that correspond to your database tables, with cross-links based on foreign keys and related columns.

At that point, you have reached the stage where the schema is represented as a navigable knowledge base and can be used as a reliable foundation for future SQL generation via prompts.

## Optional But Strongly Recommended Next Steps

To make the SQL knowledge base work as well as possible, enrich it further:

- Fill in the `## Description` section in each table note with real business meaning.
- Ask the agent to document exceptions and rules for using the knowledge base.
- Add technical nuances such as data extraction rules, join caveats, naming inconsistencies, nullable edge cases, legacy behaviors, and any special querying constraints.

Example follow-up prompt:

```text
Based on this SQL knowledge base, create the exception rules and usage rules I need in order to query this database correctly. Document technical nuances, data extraction rules, special cases, edge conditions, and any patterns that would help future SQL generation stay accurate.

If I provide additional rules or exceptions below, treat them as authoritative domain guidance and integrate them into the knowledge base structure in the most useful way.

You can gather these rules from either of the following:

1. Manual notes that I paste directly into this chat.
2. Analysis of files that I attach or point you to, such as SQL queries, ETL scripts, ORM models, API code, reporting logic, stored procedures, internal docs, or other technical notes.

When analyzing files, extract only durable database-querying knowledge: business rules, join constraints, filtering rules, naming inconsistencies, soft-delete behavior, status semantics, date logic, tenant or environment scoping, and known exceptions.

Then convert those findings into reusable exception rules and usage rules for future SQL generation.

Optional manual rules:
--> PASTE EXCEPTIONS, EDGE CASES, AND QUERYING RULES HERE <--

Optional files to analyze:
--> LIST FILE PATHS OR ATTACH FILES HERE <--
```

## Suggested Workflow Summary

```md
1. Create a new knowledge base root folder.
2. Set that folder as the active agent context.
3. Paste the full Karpathy LLM Wiki idea file into the chat.
4. Append the "You are now my LLM Wiki agent..." setup prompt.
5. Ask the agent to build a Node.js schema parser using a 200-line sample of your schema.
6. Place your full schema dump in `raw/`.
7. Run `node parse-schema.js raw/schema.sql --index --log`.
8. Enrich generated notes with descriptions, exceptions, and querying rules.
```
