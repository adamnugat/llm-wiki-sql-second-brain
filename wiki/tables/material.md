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
row_estimate: 34721
columns_count: 11
relations_out: 2
relations_in: 1
---

# material

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `subject_id` | `int` | YES | NULL |  |
| 3 | `teacher_id` | `int` | YES | NULL |  |
| 4 | `title` | `varchar(255)` | NO |  |  |
| 5 | `description` | `text` | YES | NULL |  |
| 6 | `type` | `enum('document','video','audio','image','link','presentation','worksheet','other')` | NO | 'document' |  |
| 7 | `file_path` | `varchar(512)` | YES | NULL |  |
| 8 | `url` | `varchar(1024)` | YES | NULL |  |
| 9 | `is_public` | `tinyint(1)` | NO | '0' |  |
| 10 | `created_at` | `datetime` | YES | NULL |  |
| 11 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `document`, `video`, `audio`, `image`, `link`, `presentation`, `worksheet`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_material_ibfk1` | INDEX | `subject_id` |
| `fi_material_ibfk2` | INDEX | `teacher_id` |
| `idx_material_type` | INDEX | `type` |

## Relations

### References (outbound)

- `subject_id` → [[subject]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[lesson_material]].`material_id` → `id`

## See also

- [[lesson_material]]
- [[subject]]
- [[teacher]]
