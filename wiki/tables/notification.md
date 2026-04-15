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
row_estimate: 2847312
columns_count: 13
relations_out: 4
relations_in: 0
---

# notification

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | YES | NULL |  |
| 3 | `parent_id` | `int` | YES | NULL |  |
| 4 | `teacher_id` | `int` | YES | NULL |  |
| 5 | `staff_id` | `int` | YES | NULL |  |
| 6 | `type` | `enum('grade','attendance','payment','message','event','behavior','system','other')` | NO | 'system' |  |
| 7 | `title` | `varchar(255)` | NO |  |  |
| 8 | `content` | `text` | YES | NULL |  |
| 9 | `is_read` | `tinyint(1)` | NO | '0' |  |
| 10 | `read_at` | `datetime` | YES | NULL |  |
| 11 | `sent_via` | `enum('app','email','sms','push')` | NO | 'app' |  |
| 12 | `created_at` | `datetime` | YES | NULL |  |
| 13 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `grade`, `attendance`, `payment`, `message`, `event`, `behavior`, `system`, `other`

**`sent_via`:** `app`, `email`, `sms`, `push`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_notification_ibfk1` | INDEX | `student_id` |
| `fi_notification_ibfk2` | INDEX | `parent_id` |
| `fi_notification_ibfk3` | INDEX | `teacher_id` |
| `fi_notification_ibfk4` | INDEX | `staff_id` |
| `idx_notification_is_read` | INDEX | `is_read` |
| `idx_notification_type` | INDEX | `type` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `parent_id` → [[parent]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `staff_id` → [[staff]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[parent]]
- [[staff]]
- [[student]]
- [[teacher]]
