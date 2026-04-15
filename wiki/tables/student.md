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
row_estimate: 8743
columns_count: 14
relations_out: 0
relations_in: 19
---

# student

## Description

Stores one row per learner in the school’s records. Each student is identified by a unique `student_number` and has core profile fields (`first_name`, `last_name`, optional `email`, `date_of_birth`, optional `gender`, optional `national_id`). The `status` field tracks the lifecycle (`active`, `graduated`, `transferred`, etc.), while `enrollment_date` and `graduation_date` anchor when they joined and left. Optional `notes` and timestamps support administrative remarks and auditability. This table is referenced across the schema wherever an activity or artifact belongs to a specific pupil (e.g. enrollments, attendance, grades, library loans, fees, messaging).

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `first_name` | `varchar(100)` | NO |  |  |
| 3 | `last_name` | `varchar(100)` | NO |  |  |
| 4 | `email` | `varchar(255)` | YES | NULL |  |
| 5 | `date_of_birth` | `date` | NO |  |  |
| 6 | `gender` | `enum('male','female','other')` | YES | NULL |  |
| 7 | `national_id` | `varchar(50)` | YES | NULL |  |
| 8 | `student_number` | `varchar(30)` | NO |  |  |
| 9 | `status` | `enum('active','graduated','transferred','expelled','suspended','deceased')` | NO | 'active' |  |
| 10 | `enrollment_date` | `date` | YES | NULL |  |
| 11 | `graduation_date` | `date` | YES | NULL |  |
| 12 | `notes` | `text` | YES | NULL |  |
| 13 | `created_at` | `datetime` | YES | NULL |  |
| 14 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`gender`:** `male`, `female`, `other`

**`status`:** `active`, `graduated`, `transferred`, `expelled`, `suspended`, `deceased`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `student_number` | UNIQUE | `student_number` |
| `idx_student_status` | INDEX | `status` |
| `fulltext_student_name` | FULLTEXT | `first_name`, `last_name` |

## Relations

### Referenced by (inbound)

- [[student_parent]].`student_id` → `id`
- [[enrollment]].`student_id` → `id`
- [[lesson_attendance]].`student_id` → `id`
- [[grade]].`student_id` → `id`
- [[final_grade]].`student_id` → `id`
- [[exam_result]].`student_id` → `id`
- [[assignment_submission]].`student_id` → `id`
- [[book_loan]].`student_id` → `id`
- [[event_participant]].`student_id` → `id`
- [[club_membership]].`student_id` → `id`
- [[payment]].`student_id` → `id`
- [[student_scholarship]].`student_id` → `id`
- [[student_award]].`student_id` → `id`
- [[behavior_log]].`student_id` → `id`
- [[address]].`student_id` → `id`
- [[phone_number]].`student_id` → `id`
- [[document]].`student_id` → `id`
- [[message_recipient]].`student_id` → `id`
- [[notification]].`student_id` → `id`

## See also

- [[address]]
- [[assignment_submission]]
- [[behavior_log]]
- [[book_loan]]
- [[club_membership]]
- [[document]]
- [[enrollment]]
- [[event_participant]]
- [[exam_result]]
- [[final_grade]]
- [[grade]]
- [[lesson_attendance]]
- [[message_recipient]]
- [[notification]]
- [[payment]]
- [[phone_number]]
- [[student_award]]
- [[student_parent]]
- [[student_scholarship]]
