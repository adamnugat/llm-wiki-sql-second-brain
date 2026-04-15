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
row_estimate: 64
columns_count: 10
relations_out: 1
relations_in: 10
---

# subject

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `department_id` | `int` | YES | NULL |  |
| 3 | `name` | `varchar(150)` | NO |  |  |
| 4 | `code` | `varchar(20)` | NO |  |  |
| 5 | `description` | `text` | YES | NULL |  |
| 6 | `hours_per_week` | `tinyint` | YES | NULL |  |
| 7 | `is_mandatory` | `tinyint(1)` | NO | '1' |  |
| 8 | `education_level` | `enum('primary','middle','high','all')` | NO | 'all' |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`education_level`:** `primary`, `middle`, `high`, `all`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `code` | UNIQUE | `code` |
| `fi_subject_ibfk1` | INDEX | `department_id` |

## Relations

### References (outbound)

- `department_id` → [[department]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[subject_teacher]].`subject_id` → `id`
- [[timetable_entry]].`subject_id` → `id`
- [[lesson]].`subject_id` → `id`
- [[grade]].`subject_id` → `id`
- [[final_grade]].`subject_id` → `id`
- [[exam]].`subject_id` → `id`
- [[assignment]].`subject_id` → `id`
- [[curriculum_subject]].`subject_id` → `id`
- [[material]].`subject_id` → `id`
- [[library_book]].`subject_id` → `id`

## See also

- [[assignment]]
- [[curriculum_subject]]
- [[department]]
- [[exam]]
- [[final_grade]]
- [[grade]]
- [[lesson]]
- [[library_book]]
- [[material]]
- [[subject_teacher]]
- [[timetable_entry]]
