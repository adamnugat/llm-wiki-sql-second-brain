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
row_estimate: 3847
columns_count: 10
relations_out: 3
relations_in: 0
---

# club_membership

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `club_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | NO |  |  |
| 4 | `school_year_id` | `int` | NO |  |  |
| 5 | `joined_at` | `date` | YES | NULL |  |
| 6 | `left_at` | `date` | YES | NULL |  |
| 7 | `role` | `enum('member','officer','president','secretary','treasurer')` | NO | 'member' |  |
| 8 | `status` | `enum('active','inactive')` | NO | 'active' |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`role`:** `member`, `officer`, `president`, `secretary`, `treasurer`

**`status`:** `active`, `inactive`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `club_id_student_id_school_year_id` | UNIQUE | `club_id`, `student_id`, `school_year_id` |
| `fi_club_membership_ibfk1` | INDEX | `club_id` |
| `fi_club_membership_ibfk2` | INDEX | `student_id` |
| `fi_club_membership_ibfk3` | INDEX | `school_year_id` |

## Relations

### References (outbound)

- `club_id` → [[club]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[club]]
- [[school_year]]
- [[student]]
