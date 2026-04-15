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
row_estimate: 18
columns_count: 7
relations_out: 0
relations_in: 3
---

# department

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `name` | `varchar(150)` | NO |  |  |
| 3 | `code` | `varchar(20)` | NO |  |  |
| 4 | `description` | `text` | YES | NULL |  |
| 5 | `head_teacher_id` | `int` | YES | NULL |  |
| 6 | `created_at` | `datetime` | YES | NULL |  |
| 7 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `code` | UNIQUE | `code` |
| `fi_department_head` | INDEX | `head_teacher_id` |

## Relations

### Referenced by (inbound)

- [[teacher]].`department_id` → `id`
- [[subject]].`department_id` → `id`
- [[curriculum]].`department_id` → `id`

## See also

- [[curriculum]]
- [[subject]]
- [[teacher]]
