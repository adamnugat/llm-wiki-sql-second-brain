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
row_estimate: 14201
columns_count: 11
relations_out: 0
relations_in: 6
---

# parent

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `first_name` | `varchar(100)` | NO |  |  |
| 3 | `last_name` | `varchar(100)` | NO |  |  |
| 4 | `email` | `varchar(255)` | YES | NULL |  |
| 5 | `phone` | `varchar(30)` | YES | NULL |  |
| 6 | `phone_secondary` | `varchar(30)` | YES | NULL |  |
| 7 | `occupation` | `varchar(150)` | YES | NULL |  |
| 8 | `relation_type` | `enum('mother','father','guardian','other')` | NO | 'other' |  |
| 9 | `is_primary_contact` | `tinyint(1)` | NO | '0' |  |
| 10 | `created_at` | `datetime` | YES | NULL |  |
| 11 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`relation_type`:** `mother`, `father`, `guardian`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `idx_parent_email` | INDEX | `email` |

## Relations

### Referenced by (inbound)

- [[student_parent]].`parent_id` → `id`
- [[payment]].`parent_id` → `id`
- [[address]].`parent_id` → `id`
- [[phone_number]].`parent_id` → `id`
- [[message_recipient]].`parent_id` → `id`
- [[notification]].`parent_id` → `id`

## See also

- [[address]]
- [[message_recipient]]
- [[notification]]
- [[payment]]
- [[phone_number]]
- [[student_parent]]
