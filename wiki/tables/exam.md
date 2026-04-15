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
row_estimate: 12847
columns_count: 17
relations_out: 6
relations_in: 1
---

# exam

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `subject_id` | `int` | NO |  |  |
| 3 | `teacher_id` | `int` | NO |  |  |
| 4 | `class_group_id` | `int` | NO |  |  |
| 5 | `semester_id` | `int` | NO |  |  |
| 6 | `room_id` | `int` | YES | NULL |  |
| 7 | `time_slot_id` | `int` | YES | NULL |  |
| 8 | `exam_date` | `date` | NO |  |  |
| 9 | `title` | `varchar(255)` | NO |  |  |
| 10 | `description` | `text` | YES | NULL |  |
| 11 | `max_score` | `decimal(6,2)` | NO | '100.00' |  |
| 12 | `passing_score` | `decimal(6,2)` | YES | NULL |  |
| 13 | `duration_minutes` | `smallint` | YES | NULL |  |
| 14 | `type` | `enum('written','oral','practical','online','standardized')` | NO | 'written' |  |
| 15 | `status` | `enum('scheduled','ongoing','completed','cancelled')` | NO | 'scheduled' |  |
| 16 | `created_at` | `datetime` | YES | NULL |  |
| 17 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `written`, `oral`, `practical`, `online`, `standardized`

**`status`:** `scheduled`, `ongoing`, `completed`, `cancelled`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_exam_ibfk1` | INDEX | `subject_id` |
| `fi_exam_ibfk2` | INDEX | `teacher_id` |
| `fi_exam_ibfk3` | INDEX | `class_group_id` |
| `fi_exam_ibfk4` | INDEX | `semester_id` |
| `fi_exam_ibfk5` | INDEX | `room_id` |
| `fi_exam_ibfk6` | INDEX | `time_slot_id` |
| `idx_exam_date` | INDEX | `exam_date` |

## Relations

### References (outbound)

- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `class_group_id` → [[class_group]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `semester_id` → [[semester]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `room_id` → [[room]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `time_slot_id` → [[time_slot]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[exam_result]].`exam_id` → `id`

## See also

- [[class_group]]
- [[exam_result]]
- [[room]]
- [[semester]]
- [[subject]]
- [[teacher]]
- [[time_slot]]
