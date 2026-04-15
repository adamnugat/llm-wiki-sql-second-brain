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
row_estimate: 47
columns_count: 12
relations_out: 2
relations_in: 1
---

# club

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `supervisor_teacher_id` | `int` | YES | NULL |  |
| 3 | `room_id` | `int` | YES | NULL |  |
| 4 | `name` | `varchar(150)` | NO |  |  |
| 5 | `description` | `text` | YES | NULL |  |
| 6 | `type` | `enum('sports','arts','academic','technology','language','volunteer','other')` | NO | 'other' |  |
| 7 | `meets_on` | `varchar(50)` | YES | NULL |  |
| 8 | `meets_at` | `time` | YES | NULL |  |
| 9 | `max_members` | `smallint` | YES | NULL |  |
| 10 | `is_active` | `tinyint(1)` | NO | '1' |  |
| 11 | `created_at` | `datetime` | YES | NULL |  |
| 12 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `sports`, `arts`, `academic`, `technology`, `language`, `volunteer`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_club_ibfk1` | INDEX | `supervisor_teacher_id` |
| `fi_club_ibfk2` | INDEX | `room_id` |

## Relations

### References (outbound)

- `supervisor_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `room_id` → [[room]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[club_membership]].`club_id` → `id`

## See also

- [[club_membership]]
- [[room]]
- [[teacher]]
