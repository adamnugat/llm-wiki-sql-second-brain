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
row_estimate: 287
columns_count: 10
relations_out: 3
relations_in: 5
---

# class_group

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `school_year_id` | `int` | NO |  |  |
| 3 | `homeroom_teacher_id` | `int` | YES | NULL |  |
| 4 | `room_id` | `int` | YES | NULL |  |
| 5 | `name` | `varchar(50)` | NO |  |  |
| 6 | `grade_level` | `tinyint` | NO |  |  |
| 7 | `capacity` | `smallint` | YES | NULL |  |
| 8 | `education_level` | `enum('primary','middle','high')` | NO | 'primary' |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`education_level`:** `primary`, `middle`, `high`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `school_year_id_name` | UNIQUE | `school_year_id`, `name` |
| `fi_class_group_ibfk1` | INDEX | `school_year_id` |
| `fi_class_group_ibfk2` | INDEX | `homeroom_teacher_id` |
| `fi_class_group_ibfk3` | INDEX | `room_id` |

## Relations

### References (outbound)

- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `homeroom_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `room_id` → [[room]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[enrollment]].`class_group_id` → `id`
- [[timetable]].`class_group_id` → `id`
- [[lesson]].`class_group_id` → `id`
- [[exam]].`class_group_id` → `id`
- [[assignment]].`class_group_id` → `id`

## See also

- [[assignment]]
- [[enrollment]]
- [[exam]]
- [[lesson]]
- [[room]]
- [[school_year]]
- [[teacher]]
- [[timetable]]
