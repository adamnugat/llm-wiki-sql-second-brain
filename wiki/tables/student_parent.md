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
row_estimate: 16854
columns_count: 5
relations_out: 2
relations_in: 0
---

# student_parent

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `parent_id` | `int` | NO |  |  |
| 4 | `relation_type` | `enum('mother','father','guardian','other')` | NO | 'other' |  |
| 5 | `created_at` | `datetime` | YES | NULL |  |

## Enum Values

**`relation_type`:** `mother`, `father`, `guardian`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `student_id_parent_id` | UNIQUE | `student_id`, `parent_id` |
| `fi_student_parent_ibfk1` | INDEX | `student_id` |
| `fi_student_parent_ibfk2` | INDEX | `parent_id` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `parent_id` → [[parent]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[parent]]
- [[student]]
