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
row_estimate: 563
columns_count: 8
relations_out: 2
relations_in: 1
---

# timetable

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `class_group_id` | `int` | NO |  |  |
| 3 | `semester_id` | `int` | NO |  |  |
| 4 | `valid_from` | `date` | NO |  |  |
| 5 | `valid_to` | `date` | YES | NULL |  |
| 6 | `status` | `enum('draft','active','archived')` | NO | 'draft' |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `draft`, `active`, `archived`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_timetable_ibfk1` | INDEX | `class_group_id` |
| `fi_timetable_ibfk2` | INDEX | `semester_id` |

## Relations

### References (outbound)

- `class_group_id` → [[class_group]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `semester_id` → [[semester]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[timetable_entry]].`timetable_id` → `id`

## See also

- [[class_group]]
- [[semester]]
- [[timetable_entry]]
