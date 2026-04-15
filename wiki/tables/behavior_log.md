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
columns_count: 14
relations_out: 3
relations_in: 0
---

# behavior_log

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `reported_by_teacher_id` | `int` | YES | NULL |  |
| 4 | `lesson_id` | `int` | YES | NULL |  |
| 5 | `type` | `enum('positive','negative','neutral')` | NO | 'neutral' |  |
| 6 | `category` | `enum('discipline','academic','social','attendance','property','other')` | NO | 'other' |  |
| 7 | `description` | `text` | NO |  |  |
| 8 | `action_taken` | `varchar(255)` | YES | NULL |  |
| 9 | `parent_notified` | `tinyint(1)` | NO | '0' |  |
| 10 | `parent_notified_at` | `datetime` | YES | NULL |  |
| 11 | `severity` | `tinyint` | YES | NULL |  |
| 12 | `incident_date` | `datetime` | NO |  |  |
| 13 | `created_at` | `datetime` | YES | NULL |  |
| 14 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `positive`, `negative`, `neutral`

**`category`:** `discipline`, `academic`, `social`, `attendance`, `property`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_behavior_log_ibfk1` | INDEX | `student_id` |
| `fi_behavior_log_ibfk2` | INDEX | `reported_by_teacher_id` |
| `fi_behavior_log_ibfk3` | INDEX | `lesson_id` |
| `idx_behavior_log_type` | INDEX | `type` |
| `idx_behavior_log_incident_date` | INDEX | `incident_date` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `reported_by_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `lesson_id` → [[lesson]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[lesson]]
- [[student]]
- [[teacher]]
