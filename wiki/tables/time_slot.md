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
row_estimate: 11
columns_count: 7
relations_out: 0
relations_in: 3
---

# time_slot

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `slot_number` | `tinyint` | NO |  |  |
| 3 | `start_time` | `time` | NO |  |  |
| 4 | `end_time` | `time` | NO |  |  |
| 5 | `break_after_minutes` | `tinyint` | YES | NULL |  |
| 6 | `created_at` | `datetime` | YES | NULL |  |
| 7 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `slot_number` | UNIQUE | `slot_number` |

## Relations

### Referenced by (inbound)

- [[timetable_entry]].`time_slot_id` → `id`
- [[lesson]].`time_slot_id` → `id`
- [[exam]].`time_slot_id` → `id`

## See also

- [[exam]]
- [[lesson]]
- [[timetable_entry]]
