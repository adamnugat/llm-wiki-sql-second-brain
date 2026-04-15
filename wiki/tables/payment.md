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
row_estimate: 284731
columns_count: 14
relations_out: 3
relations_in: 0
---

# payment

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `fee_id` | `int` | NO |  |  |
| 4 | `parent_id` | `int` | YES | NULL |  |
| 5 | `amount` | `decimal(10,2)` | NO |  |  |
| 6 | `currency` | `char(3)` | NO | 'PLN' |  |
| 7 | `payment_date` | `datetime` | YES | NULL |  |
| 8 | `due_date` | `date` | YES | NULL |  |
| 9 | `method` | `enum('cash','bank_transfer','card','online','other')` | YES | NULL |  |
| 10 | `status` | `enum('pending','paid','overdue','cancelled','refunded')` | NO | 'pending' |  |
| 11 | `reference_number` | `varchar(100)` | YES | NULL |  |
| 12 | `notes` | `varchar(255)` | YES | NULL |  |
| 13 | `created_at` | `datetime` | YES | NULL |  |
| 14 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`method`:** `cash`, `bank_transfer`, `card`, `online`, `other`

**`status`:** `pending`, `paid`, `overdue`, `cancelled`, `refunded`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_payment_ibfk1` | INDEX | `student_id` |
| `fi_payment_ibfk2` | INDEX | `fee_id` |
| `fi_payment_ibfk3` | INDEX | `parent_id` |
| `idx_payment_status` | INDEX | `status` |
| `idx_payment_due_date` | INDEX | `due_date` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `fee_id` → [[fee]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `parent_id` → [[parent]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[fee]]
- [[parent]]
- [[student]]
