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
row_estimate: 4821
columns_count: 12
relations_out: 2
relations_in: 0
---

# announcement

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `created_by_staff_id` | `int` | YES | NULL |  |
| 3 | `created_by_teacher_id` | `int` | YES | NULL |  |
| 4 | `title` | `varchar(255)` | NO |  |  |
| 5 | `content` | `text` | NO |  |  |
| 6 | `audience` | `enum('all','students','teachers','parents','staff')` | NO | 'all' |  |
| 7 | `priority` | `enum('low','normal','high','urgent')` | NO | 'normal' |  |
| 8 | `published_at` | `datetime` | YES | NULL |  |
| 9 | `expires_at` | `datetime` | YES | NULL |  |
| 10 | `is_published` | `tinyint(1)` | NO | '0' |  |
| 11 | `created_at` | `datetime` | YES | NULL |  |
| 12 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`audience`:** `all`, `students`, `teachers`, `parents`, `staff`

**`priority`:** `low`, `normal`, `high`, `urgent`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_announcement_ibfk1` | INDEX | `created_by_staff_id` |
| `fi_announcement_ibfk2` | INDEX | `created_by_teacher_id` |
| `idx_announcement_published_at` | INDEX | `published_at` |
| `idx_announcement_audience` | INDEX | `audience` |

## Relations

### References (outbound)

- `created_by_staff_id` → [[staff]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `created_by_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[staff]]
- [[teacher]]
