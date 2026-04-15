---
type: entity
subtype: database-table
created: 2026-04-15
updated: 2026-04-15
sources: ["[[schema-dump]]"]
tags: [database]
engine: InnoDB
charset: utf8mb4
collation: utf8mb4_0900_ai_ci
row_estimate: 4831
columns_count: 13
relations_out: 1
relations_in: 1
---

# library_book

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `subject_id` | `int` | YES | NULL |  |
| 3 | `title` | `varchar(255)` | NO |  |  |
| 4 | `author` | `varchar(255)` | YES | NULL |  |
| 5 | `isbn` | `varchar(20)` | YES | NULL |  |
| 6 | `publisher` | `varchar(150)` | YES | NULL |  |
| 7 | `publish_year` | `year` | YES | NULL |  |
| 8 | `edition` | `varchar(50)` | YES | NULL |  |
| 9 | `total_copies` | `smallint` | NO | '1' |  |
| 10 | `available_copies` | `smallint` | NO | '1' |  |
| 11 | `location_code` | `varchar(50)` | YES | NULL |  |
| 12 | `created_at` | `datetime` | YES | NULL |  |
| 13 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `isbn` | UNIQUE | `isbn` |
| `fi_library_book_ibfk1` | INDEX | `subject_id` |
| `fulltext_book_search` | FULLTEXT | `title`, `author` |

## Relations

### References (outbound)

- `subject_id` → [[subject]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[book_loan]].`library_book_id` → `id`

## See also

- [[book_loan]]
- [[subject]]
