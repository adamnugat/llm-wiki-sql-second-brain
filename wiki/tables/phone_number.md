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
row_estimate: 47821
columns_count: 10
relations_out: 4
relations_in: 0
---

# phone_number

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | YES | NULL |  |
| 3 | `teacher_id` | `int` | YES | NULL |  |
| 4 | `parent_id` | `int` | YES | NULL |  |
| 5 | `staff_id` | `int` | YES | NULL |  |
| 6 | `number` | `varchar(30)` | NO |  |  |
| 7 | `type` | `enum('mobile','home','work','emergency','fax','other')` | NO | 'mobile' |  |
| 8 | `is_primary` | `tinyint(1)` | NO | '0' |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `mobile`, `home`, `work`, `emergency`, `fax`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_phone_number_ibfk1` | INDEX | `student_id` |
| `fi_phone_number_ibfk2` | INDEX | `teacher_id` |
| `fi_phone_number_ibfk3` | INDEX | `parent_id` |
| `fi_phone_number_ibfk4` | INDEX | `staff_id` |
| `idx_phone_number` | INDEX | `number` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `parent_id` → [[parent]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `staff_id` → [[staff]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[parent]]
- [[staff]]
- [[student]]
- [[teacher]]
