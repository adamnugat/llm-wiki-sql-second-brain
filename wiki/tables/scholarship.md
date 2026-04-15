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
row_estimate: 24
columns_count: 8
relations_out: 0
relations_in: 1
---

# scholarship

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `name` | `varchar(150)` | NO |  |  |
| 3 | `description` | `text` | YES | NULL |  |
| 4 | `amount` | `decimal(10,2)` | YES | NULL |  |
| 5 | `type` | `enum('merit','financial','athletic','artistic','need_based','other')` | NO | 'other' |  |
| 6 | `is_active` | `tinyint(1)` | NO | '1' |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `merit`, `financial`, `athletic`, `artistic`, `need_based`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |

## Relations

### Referenced by (inbound)

- [[student_scholarship]].`scholarship_id` → `id`

## See also

- [[student_scholarship]]
