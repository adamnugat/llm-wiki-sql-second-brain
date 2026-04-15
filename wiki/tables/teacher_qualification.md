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
row_estimate: 2847
columns_count: 10
relations_out: 1
relations_in: 0
---

# teacher_qualification

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `teacher_id` | `int` | NO |  |  |
| 3 | `qualification_name` | `varchar(200)` | NO |  |  |
| 4 | `institution` | `varchar(200)` | YES | NULL |  |
| 5 | `type` | `enum('degree','certificate','license','training','other')` | NO | 'other' |  |
| 6 | `obtained_date` | `date` | YES | NULL |  |
| 7 | `expiry_date` | `date` | YES | NULL |  |
| 8 | `document_path` | `varchar(512)` | YES | NULL |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `degree`, `certificate`, `license`, `training`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_teacher_qualification_ibfk1` | INDEX | `teacher_id` |
| `idx_qualification_expiry` | INDEX | `expiry_date` |

## Relations

### References (outbound)

- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[teacher]]
