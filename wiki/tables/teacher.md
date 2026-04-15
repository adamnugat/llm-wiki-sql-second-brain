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
row_estimate: 412
columns_count: 15
relations_out: 1
relations_in: 27
---

# teacher

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `department_id` | `int` | YES | NULL |  |
| 3 | `first_name` | `varchar(100)` | NO |  |  |
| 4 | `last_name` | `varchar(100)` | NO |  |  |
| 5 | `email` | `varchar(255)` | NO |  |  |
| 6 | `phone` | `varchar(30)` | YES | NULL |  |
| 7 | `date_of_birth` | `date` | YES | NULL |  |
| 8 | `hire_date` | `date` | YES | NULL |  |
| 9 | `employment_type` | `enum('full_time','part_time','substitute','contract')` | NO | 'full_time' |  |
| 10 | `status` | `enum('active','on_leave','terminated')` | NO | 'active' |  |
| 11 | `title` | `varchar(50)` | YES | NULL |  |
| 12 | `gender` | `enum('male','female','other')` | YES | NULL |  |
| 13 | `national_id` | `varchar(50)` | YES | NULL |  |
| 14 | `created_at` | `datetime` | YES | NULL |  |
| 15 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`employment_type`:** `full_time`, `part_time`, `substitute`, `contract`

**`status`:** `active`, `on_leave`, `terminated`

**`gender`:** `male`, `female`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `email` | UNIQUE | `email` |
| `fi_teacher_ibfk1` | INDEX | `department_id` |
| `idx_teacher_status` | INDEX | `status` |
| `fulltext_teacher_name` | FULLTEXT | `first_name`, `last_name` |

## Relations

### References (outbound)

- `department_id` → [[department]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[class_group]].`homeroom_teacher_id` → `id`
- [[subject_teacher]].`teacher_id` → `id`
- [[timetable_entry]].`teacher_id` → `id`
- [[lesson]].`teacher_id` → `id`
- [[lesson_attendance]].`noted_by_teacher_id` → `id`
- [[substitute_lesson]].`original_teacher_id` → `id`
- [[substitute_lesson]].`substitute_teacher_id` → `id`
- [[grade]].`teacher_id` → `id`
- [[final_grade]].`teacher_id` → `id`
- [[exam]].`teacher_id` → `id`
- [[exam_result]].`graded_by_teacher_id` → `id`
- [[assignment]].`teacher_id` → `id`
- [[material]].`teacher_id` → `id`
- [[book_loan]].`teacher_id` → `id`
- [[event]].`organized_by_teacher_id` → `id`
- [[event_participant]].`teacher_id` → `id`
- [[club]].`supervisor_teacher_id` → `id`
- [[student_award]].`awarded_by_teacher_id` → `id`
- [[behavior_log]].`reported_by_teacher_id` → `id`
- [[teacher_qualification]].`teacher_id` → `id`
- [[address]].`teacher_id` → `id`
- [[phone_number]].`teacher_id` → `id`
- [[document]].`teacher_id` → `id`
- [[announcement]].`created_by_teacher_id` → `id`
- [[message]].`sender_teacher_id` → `id`
- [[message_recipient]].`teacher_id` → `id`
- [[notification]].`teacher_id` → `id`

## See also

- [[address]]
- [[announcement]]
- [[assignment]]
- [[behavior_log]]
- [[book_loan]]
- [[class_group]]
- [[club]]
- [[department]]
- [[document]]
- [[event]]
- [[event_participant]]
- [[exam]]
- [[exam_result]]
- [[final_grade]]
- [[grade]]
- [[lesson]]
- [[lesson_attendance]]
- [[material]]
- [[message]]
- [[message_recipient]]
- [[notification]]
- [[phone_number]]
- [[student_award]]
- [[subject_teacher]]
- [[substitute_lesson]]
- [[teacher_qualification]]
- [[timetable_entry]]
