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
row_estimate: 184
columns_count: 9
relations_out: 2
relations_in: 1
---

# curriculum

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `school_year_id` | `int` | NO |  |  |
| 3 | `department_id` | `int` | YES | NULL |  |
| 4 | `name` | `varchar(150)` | NO |  |  |
| 5 | `description` | `text` | YES | NULL |  |
| 6 | `grade_level` | `tinyint` | NO |  |  |
| 7 | `education_level` | `enum('primary','middle','high')` | NO | 'primary' |  |
| 8 | `created_at` | `datetime` | YES | NULL |  |
| 9 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`education_level`:** `primary`, `middle`, `high`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_curriculum_ibfk1` | INDEX | `school_year_id` |
| `fi_curriculum_ibfk2` | INDEX | `department_id` |

## Relations

### References (outbound)

- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `department_id` → [[department]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[curriculum_subject]].`curriculum_id` → `id`

## See also

- [[curriculum_subject]]
- [[department]]
- [[school_year]]
