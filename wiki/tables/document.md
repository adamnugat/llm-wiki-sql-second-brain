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
row_estimate: 18473
columns_count: 15
relations_out: 4
relations_in: 0
---

# document

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | YES | NULL |  |
| 3 | `teacher_id` | `int` | YES | NULL |  |
| 4 | `staff_id` | `int` | YES | NULL |  |
| 5 | `uploaded_by_staff_id` | `int` | YES | NULL |  |
| 6 | `title` | `varchar(255)` | NO |  |  |
| 7 | `description` | `varchar(255)` | YES | NULL |  |
| 8 | `file_path` | `varchar(512)` | NO |  |  |
| 9 | `file_type` | `varchar(50)` | YES | NULL |  |
| 10 | `file_size_kb` | `int` | YES | NULL |  |
| 11 | `type` | `enum('medical','consent','certificate','id','other')` | NO | 'other' |  |
| 12 | `is_verified` | `tinyint(1)` | NO | '0' |  |
| 13 | `verified_at` | `datetime` | YES | NULL |  |
| 14 | `created_at` | `datetime` | YES | NULL |  |
| 15 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `medical`, `consent`, `certificate`, `id`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_document_ibfk1` | INDEX | `student_id` |
| `fi_document_ibfk2` | INDEX | `teacher_id` |
| `fi_document_ibfk3` | INDEX | `staff_id` |
| `fi_document_ibfk4` | INDEX | `uploaded_by_staff_id` |
| `idx_document_type` | INDEX | `type` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `staff_id` → [[staff]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `uploaded_by_staff_id` → [[staff]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[staff]]
- [[student]]
- [[teacher]]
