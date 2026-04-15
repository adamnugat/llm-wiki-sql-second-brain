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
columns_count: 15
relations_out: 3
relations_in: 0
---

# address

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | YES | NULL |  |
| 3 | `teacher_id` | `int` | YES | NULL |  |
| 4 | `parent_id` | `int` | YES | NULL |  |
| 5 | `street` | `varchar(255)` | YES | NULL |  |
| 6 | `house_number` | `varchar(20)` | YES | NULL |  |
| 7 | `apartment_number` | `varchar(20)` | YES | NULL |  |
| 8 | `city` | `varchar(100)` | YES | NULL |  |
| 9 | `district` | `varchar(100)` | YES | NULL |  |
| 10 | `postcode` | `varchar(20)` | YES | NULL |  |
| 11 | `country` | `varchar(100)` | NO | 'Poland' |  |
| 12 | `type` | `enum('home','correspondence','other')` | NO | 'home' |  |
| 13 | `is_primary` | `tinyint(1)` | NO | '1' |  |
| 14 | `created_at` | `datetime` | YES | NULL |  |
| 15 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `home`, `correspondence`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_address_ibfk1` | INDEX | `student_id` |
| `fi_address_ibfk2` | INDEX | `teacher_id` |
| `fi_address_ibfk3` | INDEX | `parent_id` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `parent_id` → [[parent]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[parent]]
- [[student]]
- [[teacher]]
