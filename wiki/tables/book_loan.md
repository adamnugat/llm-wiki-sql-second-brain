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
row_estimate: 38471
columns_count: 12
relations_out: 4
relations_in: 0
---

# book_loan

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `library_book_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | YES | NULL |  |
| 4 | `teacher_id` | `int` | YES | NULL |  |
| 5 | `issued_by_staff_id` | `int` | YES | NULL |  |
| 6 | `loan_date` | `date` | NO |  |  |
| 7 | `due_date` | `date` | NO |  |  |
| 8 | `return_date` | `date` | YES | NULL |  |
| 9 | `status` | `enum('active','returned','overdue','lost')` | NO | 'active' |  |
| 10 | `notes` | `varchar(255)` | YES | NULL |  |
| 11 | `created_at` | `datetime` | YES | NULL |  |
| 12 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `active`, `returned`, `overdue`, `lost`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_book_loan_ibfk1` | INDEX | `library_book_id` |
| `fi_book_loan_ibfk2` | INDEX | `student_id` |
| `fi_book_loan_ibfk3` | INDEX | `teacher_id` |
| `fi_book_loan_ibfk4` | INDEX | `issued_by_staff_id` |
| `idx_book_loan_status` | INDEX | `status` |
| `idx_book_loan_due_date` | INDEX | `due_date` |

## Relations

### References (outbound)

- `library_book_id` → [[library_book]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `issued_by_staff_id` → [[staff]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[library_book]]
- [[staff]]
- [[student]]
- [[teacher]]
