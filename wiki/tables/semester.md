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
row_estimate: 24
columns_count: 8
relations_out: 1
relations_in: 4
---

# semester

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `school_year_id` | `int` | NO |  |  |
| 3 | `name` | `varchar(100)` | NO |  |  |
| 4 | `number` | `tinyint` | NO |  |  |
| 5 | `start_date` | `date` | NO |  |  |
| 6 | `end_date` | `date` | NO |  |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `school_year_id_number` | UNIQUE | `school_year_id`, `number` |
| `fi_semester_ibfk1` | INDEX | `school_year_id` |

## Relations

### References (outbound)

- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[timetable]].`semester_id` → `id`
- [[grade]].`semester_id` → `id`
- [[final_grade]].`semester_id` → `id`
- [[exam]].`semester_id` → `id`

## See also

- [[exam]]
- [[final_grade]]
- [[grade]]
- [[school_year]]
- [[timetable]]
