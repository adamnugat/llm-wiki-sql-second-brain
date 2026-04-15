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
row_estimate: 128473
columns_count: 4
relations_out: 2
relations_in: 0
---

# lesson_material

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `lesson_id` | `int` | NO |  |  |
| 3 | `material_id` | `int` | NO |  |  |
| 4 | `created_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `lesson_id_material_id` | UNIQUE | `lesson_id`, `material_id` |
| `fi_lesson_material_ibfk1` | INDEX | `lesson_id` |
| `fi_lesson_material_ibfk2` | INDEX | `material_id` |

## Relations

### References (outbound)

- `lesson_id` → [[lesson]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `material_id` → [[material]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[lesson]]
- [[material]]
