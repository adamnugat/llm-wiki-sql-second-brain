# Index

> Last updated: 2026-04-15 | Pages: 53 | Tables: 53

## Sources
| Page | Summary | Date |
|------|---------|------|
| [[schema-dump]] | MariaDB schema dump database | 2026-04-15 |

## Tables
| Table | Columns | FK out | FK in | Engine |
|-------|---------|--------|-------|--------|
| [[school_year]] | 7 | 0 | 10 | InnoDB |
| [[semester]] | 8 | 1 | 4 | InnoDB |
| [[building]] | 6 | 0 | 1 | InnoDB |
| [[room]] | 12 | 1 | 6 | InnoDB |
| [[department]] | 7 | 0 | 3 | InnoDB |
| [[teacher]] | 15 | 1 | 27 | InnoDB |
| [[staff]] | 10 | 0 | 7 | InnoDB |
| [[student]] | 14 | 0 | 19 | InnoDB |
| [[parent]] | 11 | 0 | 6 | InnoDB |
| [[student_parent]] | 5 | 2 | 0 | InnoDB |
| [[subject]] | 10 | 1 | 10 | InnoDB |
| [[class_group]] | 10 | 3 | 5 | InnoDB |
| [[enrollment]] | 8 | 3 | 0 | InnoDB |
| [[subject_teacher]] | 6 | 3 | 0 | InnoDB |
| [[time_slot]] | 7 | 0 | 3 | InnoDB |
| [[timetable]] | 8 | 2 | 1 | InnoDB |
| [[timetable_entry]] | 9 | 5 | 1 | InnoDB |
| [[lesson]] | 13 | 6 | 6 | InnoDB |
| [[lesson_attendance]] | 9 | 3 | 0 | InnoDB |
| [[substitute_lesson]] | 7 | 3 | 0 | InnoDB |
| [[grade_category]] | 6 | 0 | 1 | InnoDB |
| [[grade]] | 13 | 6 | 0 | InnoDB |
| [[final_grade]] | 11 | 4 | 0 | InnoDB |
| [[exam]] | 17 | 6 | 1 | InnoDB |
| [[exam_result]] | 11 | 3 | 0 | InnoDB |
| [[assignment]] | 13 | 4 | 1 | InnoDB |
| [[assignment_submission]] | 11 | 2 | 0 | InnoDB |
| [[curriculum]] | 9 | 2 | 1 | InnoDB |
| [[curriculum_subject]] | 6 | 2 | 0 | InnoDB |
| [[material]] | 11 | 2 | 1 | InnoDB |
| [[lesson_material]] | 4 | 2 | 0 | InnoDB |
| [[library_book]] | 13 | 1 | 1 | InnoDB |
| [[book_loan]] | 12 | 4 | 0 | InnoDB |
| [[holiday]] | 8 | 1 | 0 | InnoDB |
| [[event]] | 14 | 3 | 1 | InnoDB |
| [[event_participant]] | 8 | 3 | 0 | InnoDB |
| [[club]] | 12 | 2 | 1 | InnoDB |
| [[club_membership]] | 10 | 3 | 0 | InnoDB |
| [[fee]] | 10 | 0 | 1 | InnoDB |
| [[payment]] | 14 | 3 | 0 | InnoDB |
| [[scholarship]] | 8 | 0 | 1 | InnoDB |
| [[student_scholarship]] | 10 | 3 | 0 | InnoDB |
| [[award]] | 6 | 0 | 1 | InnoDB |
| [[student_award]] | 8 | 4 | 0 | InnoDB |
| [[behavior_log]] | 14 | 3 | 0 | InnoDB |
| [[teacher_qualification]] | 10 | 1 | 0 | InnoDB |
| [[address]] | 15 | 3 | 0 | InnoDB |
| [[phone_number]] | 10 | 4 | 0 | InnoDB |
| [[document]] | 15 | 4 | 0 | InnoDB |
| [[announcement]] | 12 | 2 | 0 | InnoDB |
| [[message]] | 8 | 2 | 1 | InnoDB |
| [[message_recipient]] | 8 | 4 | 0 | InnoDB |
| [[notification]] | 13 | 4 | 0 | InnoDB |

## Entities
| Page | Type | Summary |
|------|------|---------|
| *No entities yet.* | | |

## Concepts
| Page | Summary |
|------|---------|
| *No concepts yet.* | |

## Analyses
| Page | Summary | Date |
|------|---------|------|
| *No analyses yet.* | | |
