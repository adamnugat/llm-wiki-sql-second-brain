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
row_estimate: 28471
columns_count: 8
relations_out: 3
relations_in: 0
---

# event_participant

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `event_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | YES | NULL |  |
| 4 | `teacher_id` | `int` | YES | NULL |  |
| 5 | `registration_status` | `enum('registered','confirmed','attended','absent','cancelled')` | NO | 'registered' |  |
| 6 | `registered_at` | `datetime` | YES | NULL |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`registration_status`:** `registered`, `confirmed`, `attended`, `absent`, `cancelled`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_event_participant_ibfk1` | INDEX | `event_id` |
| `fi_event_participant_ibfk2` | INDEX | `student_id` |
| `fi_event_participant_ibfk3` | INDEX | `teacher_id` |

## Relations

### References (outbound)

- `event_id` → [[event]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[event]]
- [[student]]
- [[teacher]]
