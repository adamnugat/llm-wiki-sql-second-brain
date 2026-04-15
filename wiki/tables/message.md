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
row_estimate: 187432
columns_count: 8
relations_out: 2
relations_in: 1
---

# message

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `sender_teacher_id` | `int` | YES | NULL |  |
| 3 | `sender_staff_id` | `int` | YES | NULL |  |
| 4 | `subject` | `varchar(255)` | NO |  |  |
| 5 | `body` | `text` | NO |  |  |
| 6 | `sent_at` | `datetime` | YES | NULL |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_message_ibfk1` | INDEX | `sender_teacher_id` |
| `fi_message_ibfk2` | INDEX | `sender_staff_id` |
| `idx_message_sent_at` | INDEX | `sent_at` |

## Relations

### References (outbound)

- `sender_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `sender_staff_id` → [[staff]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[message_recipient]].`message_id` → `id`

## See also

- [[message_recipient]]
- [[staff]]
- [[teacher]]
