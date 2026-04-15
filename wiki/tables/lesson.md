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
row_estimate: 284716
columns_count: 13
relations_out: 6
relations_in: 6
---

# lesson

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `timetable_entry_id` | `int` | YES | NULL |  |
| 3 | `subject_id` | `int` | NO |  |  |
| 4 | `teacher_id` | `int` | NO |  |  |
| 5 | `class_group_id` | `int` | NO |  |  |
| 6 | `room_id` | `int` | YES | NULL |  |
| 7 | `time_slot_id` | `int` | NO |  |  |
| 8 | `lesson_date` | `date` | NO |  |  |
| 9 | `topic` | `varchar(255)` | YES | NULL |  |
| 10 | `notes` | `text` | YES | NULL |  |
| 11 | `status` | `enum('scheduled','completed','cancelled','substitute')` | NO | 'scheduled' |  |
| 12 | `created_at` | `datetime` | YES | NULL |  |
| 13 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `scheduled`, `completed`, `cancelled`, `substitute`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_lesson_ibfk1` | INDEX | `timetable_entry_id` |
| `fi_lesson_ibfk2` | INDEX | `subject_id` |
| `fi_lesson_ibfk3` | INDEX | `teacher_id` |
| `fi_lesson_ibfk4` | INDEX | `class_group_id` |
| `fi_lesson_ibfk5` | INDEX | `room_id` |
| `fi_lesson_ibfk6` | INDEX | `time_slot_id` |
| `idx_lesson_date` | INDEX | `lesson_date` |
| `idx_lesson_status` | INDEX | `status` |

## Relations

### References (outbound)

- `timetable_entry_id` → [[timetable_entry]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `class_group_id` → [[class_group]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `room_id` → [[room]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `time_slot_id` → [[time_slot]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[lesson_attendance]].`lesson_id` → `id`
- [[substitute_lesson]].`lesson_id` → `id`
- [[grade]].`lesson_id` → `id`
- [[assignment]].`lesson_id` → `id`
- [[lesson_material]].`lesson_id` → `id`
- [[behavior_log]].`lesson_id` → `id`

## See also

- [[assignment]]
- [[behavior_log]]
- [[class_group]]
- [[grade]]
- [[lesson_attendance]]
- [[lesson_material]]
- [[room]]
- [[subject]]
- [[substitute_lesson]]
- [[teacher]]
- [[time_slot]]
- [[timetable_entry]]
