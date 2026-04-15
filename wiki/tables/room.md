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
row_estimate: 87
columns_count: 12
relations_out: 1
relations_in: 6
---

# room

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `building_id` | `int` | NO |  |  |
| 3 | `room_number` | `varchar(20)` | NO |  |  |
| 4 | `name` | `varchar(100)` | YES | NULL |  |
| 5 | `type` | `enum('classroom','lab','gym','library','auditorium','office','other')` | NO | 'classroom' |  |
| 6 | `capacity` | `smallint` | YES | NULL |  |
| 7 | `floor` | `tinyint` | YES | NULL |  |
| 8 | `has_projector` | `tinyint(1)` | NO | '0' |  |
| 9 | `has_whiteboard` | `tinyint(1)` | NO | '1' |  |
| 10 | `is_active` | `tinyint(1)` | NO | '1' |  |
| 11 | `created_at` | `datetime` | YES | NULL |  |
| 12 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `classroom`, `lab`, `gym`, `library`, `auditorium`, `office`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `building_id_room_number` | UNIQUE | `building_id`, `room_number` |
| `fi_room_ibfk1` | INDEX | `building_id` |

## Relations

### References (outbound)

- `building_id` → [[building]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[class_group]].`room_id` → `id`
- [[timetable_entry]].`room_id` → `id`
- [[lesson]].`room_id` → `id`
- [[exam]].`room_id` → `id`
- [[event]].`room_id` → `id`
- [[club]].`room_id` → `id`

## See also

- [[building]]
- [[class_group]]
- [[club]]
- [[event]]
- [[exam]]
- [[lesson]]
- [[timetable_entry]]
