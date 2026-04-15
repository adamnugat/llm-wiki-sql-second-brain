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
row_estimate: 31
columns_count: 6
relations_out: 0
relations_in: 1
---

# award

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `name` | `varchar(150)` | NO |  |  |
| 3 | `description` | `varchar(255)` | YES | NULL |  |
| 4 | `type` | `enum('academic','sports','arts','behavior','attendance','community','other')` | NO | 'other' |  |
| 5 | `created_at` | `datetime` | YES | NULL |  |
| 6 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `academic`, `sports`, `arts`, `behavior`, `attendance`, `community`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `name` | UNIQUE | `name` |

## Relations

### Referenced by (inbound)

- [[student_award]].`award_id` → `id`

## See also

- [[student_award]]
