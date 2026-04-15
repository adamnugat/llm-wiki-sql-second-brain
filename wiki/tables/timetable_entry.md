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
row_estimate: 38472
columns_count: 9
relations_out: 5
relations_in: 1
---

# timetable_entry

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `timetable_id` | `int` | NO |  |  |
| 3 | `subject_id` | `int` | NO |  |  |
| 4 | `teacher_id` | `int` | NO |  |  |
| 5 | `room_id` | `int` | YES | NULL |  |
| 6 | `time_slot_id` | `int` | NO |  |  |
| 7 | `day_of_week` | `tinyint` | NO |  |  |
| 8 | `created_at` | `datetime` | YES | NULL |  |
| 9 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `timetable_id_day_of_week_time_slot_id` | UNIQUE | `timetable_id`, `day_of_week`, `time_slot_id` |
| `fi_timetable_entry_ibfk1` | INDEX | `timetable_id` |
| `fi_timetable_entry_ibfk2` | INDEX | `subject_id` |
| `fi_timetable_entry_ibfk3` | INDEX | `teacher_id` |
| `fi_timetable_entry_ibfk4` | INDEX | `room_id` |
| `fi_timetable_entry_ibfk5` | INDEX | `time_slot_id` |

## Relations

### References (outbound)

- `timetable_id` → [[timetable]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `room_id` → [[room]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `time_slot_id` → [[time_slot]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[lesson]].`timetable_entry_id` → `id`

## See also

- [[lesson]]
- [[room]]
- [[subject]]
- [[teacher]]
- [[time_slot]]
- [[timetable]]
