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
row_estimate: 38
columns_count: 10
relations_out: 0
relations_in: 1
---

# fee

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `name` | `varchar(150)` | NO |  |  |
| 3 | `amount` | `decimal(10,2)` | NO |  |  |
| 4 | `currency` | `char(3)` | NO | 'PLN' |  |
| 5 | `type` | `enum('tuition','lunch','trip','insurance','book','uniform','activity','other')` | NO | 'other' |  |
| 6 | `is_recurring` | `tinyint(1)` | NO | '0' |  |
| 7 | `recurrence` | `enum('monthly','semester','annual')` | YES | NULL |  |
| 8 | `description` | `varchar(255)` | YES | NULL |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `tuition`, `lunch`, `trip`, `insurance`, `book`, `uniform`, `activity`, `other`

**`recurrence`:** `monthly`, `semester`, `annual`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `idx_fee_type` | INDEX | `type` |

## Relations

### Referenced by (inbound)

- [[payment]].`fee_id` → `id`

## See also

- [[payment]]
