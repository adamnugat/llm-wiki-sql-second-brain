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
row_estimate: 1842
columns_count: 14
relations_out: 3
relations_in: 1
---

# event

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `school_year_id` | `int` | YES | NULL |  |
| 3 | `room_id` | `int` | YES | NULL |  |
| 4 | `organized_by_teacher_id` | `int` | YES | NULL |  |
| 5 | `title` | `varchar(255)` | NO |  |  |
| 6 | `description` | `text` | YES | NULL |  |
| 7 | `type` | `enum('sports','cultural','academic','social','ceremony','trip','other')` | NO | 'other' |  |
| 8 | `start_datetime` | `datetime` | NO |  |  |
| 9 | `end_datetime` | `datetime` | NO |  |  |
| 10 | `location` | `varchar(255)` | YES | NULL |  |
| 11 | `max_participants` | `smallint` | YES | NULL |  |
| 12 | `status` | `enum('planned','ongoing','completed','cancelled')` | NO | 'planned' |  |
| 13 | `created_at` | `datetime` | YES | NULL |  |
| 14 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `sports`, `cultural`, `academic`, `social`, `ceremony`, `trip`, `other`

**`status`:** `planned`, `ongoing`, `completed`, `cancelled`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_event_ibfk1` | INDEX | `school_year_id` |
| `fi_event_ibfk2` | INDEX | `room_id` |
| `fi_event_ibfk3` | INDEX | `organized_by_teacher_id` |
| `idx_event_datetime` | INDEX | `start_datetime` |

## Relations

### References (outbound)

- `school_year_id` → [[school_year]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `room_id` → [[room]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `organized_by_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[event_participant]].`event_id` → `id`

## See also

- [[event_participant]]
- [[room]]
- [[school_year]]
- [[teacher]]
