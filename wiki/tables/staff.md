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
row_estimate: 98
columns_count: 10
relations_out: 0
relations_in: 7
---

# staff

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `first_name` | `varchar(100)` | NO |  |  |
| 3 | `last_name` | `varchar(100)` | NO |  |  |
| 4 | `email` | `varchar(255)` | NO |  |  |
| 5 | `phone` | `varchar(30)` | YES | NULL |  |
| 6 | `role` | `enum('admin','secretary','librarian','counselor','janitor','security','it','other')` | NO | 'other' |  |
| 7 | `hire_date` | `date` | YES | NULL |  |
| 8 | `status` | `enum('active','on_leave','terminated')` | NO | 'active' |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`role`:** `admin`, `secretary`, `librarian`, `counselor`, `janitor`, `security`, `it`, `other`

**`status`:** `active`, `on_leave`, `terminated`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `email` | UNIQUE | `email` |
| `idx_staff_role` | INDEX | `role` |
| `idx_staff_status` | INDEX | `status` |

## Relations

### Referenced by (inbound)

- [[book_loan]].`issued_by_staff_id` → `id`
- [[phone_number]].`staff_id` → `id`
- [[document]].`staff_id` → `id`
- [[document]].`uploaded_by_staff_id` → `id`
- [[announcement]].`created_by_staff_id` → `id`
- [[message]].`sender_staff_id` → `id`
- [[notification]].`staff_id` → `id`

## See also

- [[announcement]]
- [[book_loan]]
- [[document]]
- [[message]]
- [[notification]]
- [[phone_number]]
