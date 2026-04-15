-- MariaDB dump 10.19  Distrib 10.6.9-MariaDB, for Linux (aarch64)
--
-- Host: localhost    Database: school_db
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `school_year`
--

DROP TABLE IF EXISTS `school_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_year` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_current` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_year_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `number` tinyint NOT NULL COMMENT '1 or 2',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_year_id_number` (`school_year_id`,`number`),
  KEY `fi_semester_ibfk1` (`school_year_id`),
  CONSTRAINT `semester_ibfk1` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `floors` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('classroom','lab','gym','library','auditorium','office','other') NOT NULL DEFAULT 'classroom',
  `capacity` smallint DEFAULT NULL,
  `floor` tinyint DEFAULT NULL,
  `has_projector` tinyint(1) NOT NULL DEFAULT '0',
  `has_whiteboard` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `building_id_room_number` (`building_id`,`room_number`),
  KEY `fi_room_ibfk1` (`building_id`),
  CONSTRAINT `room_ibfk1` FOREIGN KEY (`building_id`) REFERENCES `building` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `head_teacher_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `fi_department_head` (`head_teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `employment_type` enum('full_time','part_time','substitute','contract') NOT NULL DEFAULT 'full_time',
  `status` enum('active','on_leave','terminated') NOT NULL DEFAULT 'active',
  `title` varchar(50) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `fi_teacher_ibfk1` (`department_id`),
  KEY `idx_teacher_status` (`status`),
  FULLTEXT KEY `fulltext_teacher_name` (`first_name`,`last_name`),
  CONSTRAINT `teacher_ibfk1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Back-fill department.head_teacher_id FK now that teacher exists
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk1` FOREIGN KEY (`head_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `role` enum('admin','secretary','librarian','counselor','janitor','security','it','other') NOT NULL DEFAULT 'other',
  `hire_date` date DEFAULT NULL,
  `status` enum('active','on_leave','terminated') NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_staff_role` (`role`),
  KEY `idx_staff_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `national_id` varchar(50) DEFAULT NULL,
  `student_number` varchar(30) NOT NULL,
  `status` enum('active','graduated','transferred','expelled','suspended','deceased') NOT NULL DEFAULT 'active',
  `enrollment_date` date DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_number` (`student_number`),
  KEY `idx_student_status` (`status`),
  FULLTEXT KEY `fulltext_student_name` (`first_name`,`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8743 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_secondary` varchar(30) DEFAULT NULL,
  `occupation` varchar(150) DEFAULT NULL,
  `relation_type` enum('mother','father','guardian','other') NOT NULL DEFAULT 'other',
  `is_primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_parent_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=14201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_parent`
--

DROP TABLE IF EXISTS `student_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_parent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `parent_id` int NOT NULL,
  `relation_type` enum('mother','father','guardian','other') NOT NULL DEFAULT 'other',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id_parent_id` (`student_id`,`parent_id`),
  KEY `fi_student_parent_ibfk1` (`student_id`),
  KEY `fi_student_parent_ibfk2` (`parent_id`),
  CONSTRAINT `student_parent_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_parent_ibfk2` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16854 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_id` int DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `hours_per_week` tinyint DEFAULT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '1',
  `education_level` enum('primary','middle','high','all') NOT NULL DEFAULT 'all',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `fi_subject_ibfk1` (`department_id`),
  CONSTRAINT `subject_ibfk1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `class_group`
--

DROP TABLE IF EXISTS `class_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_year_id` int NOT NULL,
  `homeroom_teacher_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `grade_level` tinyint NOT NULL COMMENT 'e.g. 1–8 for primary, 1–4 for high school',
  `capacity` smallint DEFAULT NULL,
  `education_level` enum('primary','middle','high') NOT NULL DEFAULT 'primary',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `school_year_id_name` (`school_year_id`,`name`),
  KEY `fi_class_group_ibfk1` (`school_year_id`),
  KEY `fi_class_group_ibfk2` (`homeroom_teacher_id`),
  KEY `fi_class_group_ibfk3` (`room_id`),
  CONSTRAINT `class_group_ibfk1` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_group_ibfk2` FOREIGN KEY (`homeroom_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `class_group_ibfk3` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enrollment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `class_group_id` int NOT NULL,
  `school_year_id` int NOT NULL,
  `enrollment_date` date NOT NULL,
  `status` enum('active','transferred','withdrawn','completed') NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id_class_group_id_school_year_id` (`student_id`,`class_group_id`,`school_year_id`),
  KEY `fi_enrollment_ibfk1` (`student_id`),
  KEY `fi_enrollment_ibfk2` (`class_group_id`),
  KEY `fi_enrollment_ibfk3` (`school_year_id`),
  CONSTRAINT `enrollment_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrollment_ibfk2` FOREIGN KEY (`class_group_id`) REFERENCES `class_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `enrollment_ibfk3` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52918 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `school_year_id` int NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_id_subject_id_school_year_id` (`teacher_id`,`subject_id`,`school_year_id`),
  KEY `fi_subject_teacher_ibfk1` (`teacher_id`),
  KEY `fi_subject_teacher_ibfk2` (`subject_id`),
  KEY `fi_subject_teacher_ibfk3` (`school_year_id`),
  CONSTRAINT `subject_teacher_ibfk1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_teacher_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subject_teacher_ibfk3` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_slot`
--

DROP TABLE IF EXISTS `time_slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slot_number` tinyint NOT NULL COMMENT 'Lesson number within the day (1–10)',
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `break_after_minutes` tinyint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slot_number` (`slot_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_group_id` int NOT NULL,
  `semester_id` int NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date DEFAULT NULL,
  `status` enum('draft','active','archived') NOT NULL DEFAULT 'draft',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_timetable_ibfk1` (`class_group_id`),
  KEY `fi_timetable_ibfk2` (`semester_id`),
  CONSTRAINT `timetable_ibfk1` FOREIGN KEY (`class_group_id`) REFERENCES `class_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timetable_ibfk2` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=563 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `timetable_entry`
--

DROP TABLE IF EXISTS `timetable_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_entry` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timetable_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `time_slot_id` int NOT NULL,
  `day_of_week` tinyint NOT NULL COMMENT '1=Monday … 5=Friday',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timetable_id_day_of_week_time_slot_id` (`timetable_id`,`day_of_week`,`time_slot_id`),
  KEY `fi_timetable_entry_ibfk1` (`timetable_id`),
  KEY `fi_timetable_entry_ibfk2` (`subject_id`),
  KEY `fi_timetable_entry_ibfk3` (`teacher_id`),
  KEY `fi_timetable_entry_ibfk4` (`room_id`),
  KEY `fi_timetable_entry_ibfk5` (`time_slot_id`),
  CONSTRAINT `timetable_entry_ibfk1` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timetable_entry_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timetable_entry_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `timetable_entry_ibfk4` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `timetable_entry_ibfk5` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38472 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson` (
  `id` int NOT NULL AUTO_INCREMENT,
  `timetable_entry_id` int DEFAULT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `class_group_id` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `time_slot_id` int NOT NULL,
  `lesson_date` date NOT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('scheduled','completed','cancelled','substitute') NOT NULL DEFAULT 'scheduled',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_lesson_ibfk1` (`timetable_entry_id`),
  KEY `fi_lesson_ibfk2` (`subject_id`),
  KEY `fi_lesson_ibfk3` (`teacher_id`),
  KEY `fi_lesson_ibfk4` (`class_group_id`),
  KEY `fi_lesson_ibfk5` (`room_id`),
  KEY `fi_lesson_ibfk6` (`time_slot_id`),
  KEY `idx_lesson_date` (`lesson_date`),
  KEY `idx_lesson_status` (`status`),
  CONSTRAINT `lesson_ibfk1` FOREIGN KEY (`timetable_entry_id`) REFERENCES `timetable_entry` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lesson_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_ibfk4` FOREIGN KEY (`class_group_id`) REFERENCES `class_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_ibfk5` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lesson_ibfk6` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284716 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lesson_attendance`
--

DROP TABLE IF EXISTS `lesson_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `student_id` int NOT NULL,
  `status` enum('present','absent','late','excused','remote') NOT NULL DEFAULT 'present',
  `late_minutes` tinyint DEFAULT NULL,
  `excuse_reason` varchar(255) DEFAULT NULL,
  `noted_by_teacher_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_id_student_id` (`lesson_id`,`student_id`),
  KEY `fi_lesson_attendance_ibfk1` (`lesson_id`),
  KEY `fi_lesson_attendance_ibfk2` (`student_id`),
  KEY `fi_lesson_attendance_ibfk3` (`noted_by_teacher_id`),
  KEY `idx_attendance_status` (`status`),
  CONSTRAINT `lesson_attendance_ibfk1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_attendance_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_attendance_ibfk3` FOREIGN KEY (`noted_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4817293 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `substitute_lesson`
--

DROP TABLE IF EXISTS `substitute_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `substitute_lesson` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `original_teacher_id` int NOT NULL,
  `substitute_teacher_id` int NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_id` (`lesson_id`),
  KEY `fi_substitute_lesson_ibfk1` (`lesson_id`),
  KEY `fi_substitute_lesson_ibfk2` (`original_teacher_id`),
  KEY `fi_substitute_lesson_ibfk3` (`substitute_teacher_id`),
  CONSTRAINT `substitute_lesson_ibfk1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `substitute_lesson_ibfk2` FOREIGN KEY (`original_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `substitute_lesson_ibfk3` FOREIGN KEY (`substitute_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3841 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade_category`
--

DROP TABLE IF EXISTS `grade_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `weight` decimal(4,2) NOT NULL DEFAULT '1.00',
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `semester_id` int NOT NULL,
  `grade_category_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  `value` decimal(4,2) NOT NULL,
  `max_value` decimal(4,2) NOT NULL DEFAULT '6.00',
  `description` varchar(255) DEFAULT NULL,
  `graded_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_grade_ibfk1` (`student_id`),
  KEY `fi_grade_ibfk2` (`subject_id`),
  KEY `fi_grade_ibfk3` (`teacher_id`),
  KEY `fi_grade_ibfk4` (`semester_id`),
  KEY `fi_grade_ibfk5` (`grade_category_id`),
  KEY `fi_grade_ibfk6` (`lesson_id`),
  KEY `idx_grade_value` (`value`),
  CONSTRAINT `grade_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk4` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk5` FOREIGN KEY (`grade_category_id`) REFERENCES `grade_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `grade_ibfk6` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1847362 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `final_grade`
--

DROP TABLE IF EXISTS `final_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `final_grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `semester_id` int NOT NULL,
  `value` decimal(4,2) NOT NULL,
  `grade_type` enum('semester','annual','predicted','certificate') NOT NULL DEFAULT 'semester',
  `is_approved` tinyint(1) NOT NULL DEFAULT '0',
  `approved_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id_subject_id_semester_id_grade_type` (`student_id`,`subject_id`,`semester_id`,`grade_type`),
  KEY `fi_final_grade_ibfk1` (`student_id`),
  KEY `fi_final_grade_ibfk2` (`subject_id`),
  KEY `fi_final_grade_ibfk3` (`teacher_id`),
  KEY `fi_final_grade_ibfk4` (`semester_id`),
  CONSTRAINT `final_grade_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `final_grade_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `final_grade_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `final_grade_ibfk4` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `class_group_id` int NOT NULL,
  `semester_id` int NOT NULL,
  `room_id` int DEFAULT NULL,
  `time_slot_id` int DEFAULT NULL,
  `exam_date` date NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `max_score` decimal(6,2) NOT NULL DEFAULT '100.00',
  `passing_score` decimal(6,2) DEFAULT NULL,
  `duration_minutes` smallint DEFAULT NULL,
  `type` enum('written','oral','practical','online','standardized') NOT NULL DEFAULT 'written',
  `status` enum('scheduled','ongoing','completed','cancelled') NOT NULL DEFAULT 'scheduled',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_exam_ibfk1` (`subject_id`),
  KEY `fi_exam_ibfk2` (`teacher_id`),
  KEY `fi_exam_ibfk3` (`class_group_id`),
  KEY `fi_exam_ibfk4` (`semester_id`),
  KEY `fi_exam_ibfk5` (`room_id`),
  KEY `fi_exam_ibfk6` (`time_slot_id`),
  KEY `idx_exam_date` (`exam_date`),
  CONSTRAINT `exam_ibfk1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk3` FOREIGN KEY (`class_group_id`) REFERENCES `class_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk4` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk5` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `exam_ibfk6` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12847 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_id` int NOT NULL,
  `student_id` int NOT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `grade` decimal(4,2) DEFAULT NULL,
  `attendance_status` enum('present','absent','excused') NOT NULL DEFAULT 'present',
  `feedback` text DEFAULT NULL,
  `graded_by_teacher_id` int DEFAULT NULL,
  `graded_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_id_student_id` (`exam_id`,`student_id`),
  KEY `fi_exam_result_ibfk1` (`exam_id`),
  KEY `fi_exam_result_ibfk2` (`student_id`),
  KEY `fi_exam_result_ibfk3` (`graded_by_teacher_id`),
  CONSTRAINT `exam_result_ibfk1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_result_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_result_ibfk3` FOREIGN KEY (`graded_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=287431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int DEFAULT NULL,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `class_group_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `due_date` datetime NOT NULL,
  `max_score` decimal(6,2) NOT NULL DEFAULT '100.00',
  `type` enum('homework','project','essay','presentation','lab_report','other') NOT NULL DEFAULT 'homework',
  `is_graded` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_assignment_ibfk1` (`lesson_id`),
  KEY `fi_assignment_ibfk2` (`subject_id`),
  KEY `fi_assignment_ibfk3` (`teacher_id`),
  KEY `fi_assignment_ibfk4` (`class_group_id`),
  KEY `idx_assignment_due_date` (`due_date`),
  CONSTRAINT `assignment_ibfk1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `assignment_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assignment_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assignment_ibfk4` FOREIGN KEY (`class_group_id`) REFERENCES `class_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=87432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_submission`
--

DROP TABLE IF EXISTS `assignment_submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assignment_submission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assignment_id` int NOT NULL,
  `student_id` int NOT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `status` enum('pending','submitted','late','graded','returned','missing') NOT NULL DEFAULT 'pending',
  `file_path` varchar(512) DEFAULT NULL,
  `graded_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assignment_id_student_id` (`assignment_id`,`student_id`),
  KEY `fi_assignment_submission_ibfk1` (`assignment_id`),
  KEY `fi_assignment_submission_ibfk2` (`student_id`),
  KEY `idx_submission_status` (`status`),
  CONSTRAINT `assignment_submission_ibfk1` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `assignment_submission_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1238947 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_year_id` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `grade_level` tinyint NOT NULL,
  `education_level` enum('primary','middle','high') NOT NULL DEFAULT 'primary',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_curriculum_ibfk1` (`school_year_id`),
  KEY `fi_curriculum_ibfk2` (`department_id`),
  CONSTRAINT `curriculum_ibfk1` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curriculum_ibfk2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `curriculum_subject`
--

DROP TABLE IF EXISTS `curriculum_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum_subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curriculum_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `hours_per_week` tinyint NOT NULL DEFAULT '1',
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curriculum_id_subject_id` (`curriculum_id`,`subject_id`),
  KEY `fi_curriculum_subject_ibfk1` (`curriculum_id`),
  KEY `fi_curriculum_subject_ibfk2` (`subject_id`),
  CONSTRAINT `curriculum_subject_ibfk1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `curriculum_subject_ibfk2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2847 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('document','video','audio','image','link','presentation','worksheet','other') NOT NULL DEFAULT 'document',
  `file_path` varchar(512) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_material_ibfk1` (`subject_id`),
  KEY `fi_material_ibfk2` (`teacher_id`),
  KEY `idx_material_type` (`type`),
  CONSTRAINT `material_ibfk1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `material_ibfk2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34721 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lesson_material`
--

DROP TABLE IF EXISTS `lesson_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lesson_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lesson_id` int NOT NULL,
  `material_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lesson_id_material_id` (`lesson_id`,`material_id`),
  KEY `fi_lesson_material_ibfk1` (`lesson_id`),
  KEY `fi_lesson_material_ibfk2` (`material_id`),
  CONSTRAINT `lesson_material_ibfk1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lesson_material_ibfk2` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `library_book`
--

DROP TABLE IF EXISTS `library_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publisher` varchar(150) DEFAULT NULL,
  `publish_year` year DEFAULT NULL,
  `edition` varchar(50) DEFAULT NULL,
  `total_copies` smallint NOT NULL DEFAULT '1',
  `available_copies` smallint NOT NULL DEFAULT '1',
  `location_code` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `fi_library_book_ibfk1` (`subject_id`),
  FULLTEXT KEY `fulltext_book_search` (`title`,`author`),
  CONSTRAINT `library_book_ibfk1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4831 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `book_loan`
--

DROP TABLE IF EXISTS `book_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_loan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `library_book_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `issued_by_staff_id` int DEFAULT NULL,
  `loan_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('active','returned','overdue','lost') NOT NULL DEFAULT 'active',
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_book_loan_ibfk1` (`library_book_id`),
  KEY `fi_book_loan_ibfk2` (`student_id`),
  KEY `fi_book_loan_ibfk3` (`teacher_id`),
  KEY `fi_book_loan_ibfk4` (`issued_by_staff_id`),
  KEY `idx_book_loan_status` (`status`),
  KEY `idx_book_loan_due_date` (`due_date`),
  CONSTRAINT `book_loan_ibfk1` FOREIGN KEY (`library_book_id`) REFERENCES `library_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `book_loan_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `book_loan_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `book_loan_ibfk4` FOREIGN KEY (`issued_by_staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_year_id` int NOT NULL,
  `name` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `type` enum('public','school','exam_break','other') NOT NULL DEFAULT 'public',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_holiday_ibfk1` (`school_year_id`),
  KEY `idx_holiday_dates` (`start_date`,`end_date`),
  CONSTRAINT `holiday_ibfk1` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_year_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `organized_by_teacher_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('sports','cultural','academic','social','ceremony','trip','other') NOT NULL DEFAULT 'other',
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `max_participants` smallint DEFAULT NULL,
  `status` enum('planned','ongoing','completed','cancelled') NOT NULL DEFAULT 'planned',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_event_ibfk1` (`school_year_id`),
  KEY `fi_event_ibfk2` (`room_id`),
  KEY `fi_event_ibfk3` (`organized_by_teacher_id`),
  KEY `idx_event_datetime` (`start_datetime`),
  CONSTRAINT `event_ibfk1` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `event_ibfk2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `event_ibfk3` FOREIGN KEY (`organized_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1842 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_participant`
--

DROP TABLE IF EXISTS `event_participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `registration_status` enum('registered','confirmed','attended','absent','cancelled') NOT NULL DEFAULT 'registered',
  `registered_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_event_participant_ibfk1` (`event_id`),
  KEY `fi_event_participant_ibfk2` (`student_id`),
  KEY `fi_event_participant_ibfk3` (`teacher_id`),
  CONSTRAINT `event_participant_ibfk1` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_participant_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `event_participant_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supervisor_teacher_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('sports','arts','academic','technology','language','volunteer','other') NOT NULL DEFAULT 'other',
  `meets_on` varchar(50) DEFAULT NULL COMMENT 'e.g. Monday,Wednesday',
  `meets_at` time DEFAULT NULL,
  `max_members` smallint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_club_ibfk1` (`supervisor_teacher_id`),
  KEY `fi_club_ibfk2` (`room_id`),
  CONSTRAINT `club_ibfk1` FOREIGN KEY (`supervisor_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `club_ibfk2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `club_membership`
--

DROP TABLE IF EXISTS `club_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club_membership` (
  `id` int NOT NULL AUTO_INCREMENT,
  `club_id` int NOT NULL,
  `student_id` int NOT NULL,
  `school_year_id` int NOT NULL,
  `joined_at` date DEFAULT NULL,
  `left_at` date DEFAULT NULL,
  `role` enum('member','officer','president','secretary','treasurer') NOT NULL DEFAULT 'member',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `club_id_student_id_school_year_id` (`club_id`,`student_id`,`school_year_id`),
  KEY `fi_club_membership_ibfk1` (`club_id`),
  KEY `fi_club_membership_ibfk2` (`student_id`),
  KEY `fi_club_membership_ibfk3` (`school_year_id`),
  CONSTRAINT `club_membership_ibfk1` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `club_membership_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `club_membership_ibfk3` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3847 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fee`
--

DROP TABLE IF EXISTS `fee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'PLN',
  `type` enum('tuition','lunch','trip','insurance','book','uniform','activity','other') NOT NULL DEFAULT 'other',
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recurrence` enum('monthly','semester','annual') DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fee_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `fee_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'PLN',
  `payment_date` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `method` enum('cash','bank_transfer','card','online','other') DEFAULT NULL,
  `status` enum('pending','paid','overdue','cancelled','refunded') NOT NULL DEFAULT 'pending',
  `reference_number` varchar(100) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_payment_ibfk1` (`student_id`),
  KEY `fi_payment_ibfk2` (`fee_id`),
  KEY `fi_payment_ibfk3` (`parent_id`),
  KEY `idx_payment_status` (`status`),
  KEY `idx_payment_due_date` (`due_date`),
  CONSTRAINT `payment_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk2` FOREIGN KEY (`fee_id`) REFERENCES `fee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payment_ibfk3` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=284731 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scholarship`
--

DROP TABLE IF EXISTS `scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scholarship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `type` enum('merit','financial','athletic','artistic','need_based','other') NOT NULL DEFAULT 'other',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_scholarship`
--

DROP TABLE IF EXISTS `student_scholarship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_scholarship` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `scholarship_id` int NOT NULL,
  `school_year_id` int NOT NULL,
  `amount_awarded` decimal(10,2) DEFAULT NULL,
  `awarded_date` date DEFAULT NULL,
  `status` enum('active','expired','revoked') NOT NULL DEFAULT 'active',
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_student_scholarship_ibfk1` (`student_id`),
  KEY `fi_student_scholarship_ibfk2` (`scholarship_id`),
  KEY `fi_student_scholarship_ibfk3` (`school_year_id`),
  CONSTRAINT `student_scholarship_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_scholarship_ibfk2` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_scholarship_ibfk3` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1847 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `award`
--

DROP TABLE IF EXISTS `award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `award` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('academic','sports','arts','behavior','attendance','community','other') NOT NULL DEFAULT 'other',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_award`
--

DROP TABLE IF EXISTS `student_award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_award` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `award_id` int NOT NULL,
  `awarded_by_teacher_id` int DEFAULT NULL,
  `school_year_id` int DEFAULT NULL,
  `awarded_date` date NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_student_award_ibfk1` (`student_id`),
  KEY `fi_student_award_ibfk2` (`award_id`),
  KEY `fi_student_award_ibfk3` (`awarded_by_teacher_id`),
  KEY `fi_student_award_ibfk4` (`school_year_id`),
  CONSTRAINT `student_award_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_award_ibfk2` FOREIGN KEY (`award_id`) REFERENCES `award` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_award_ibfk3` FOREIGN KEY (`awarded_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `student_award_ibfk4` FOREIGN KEY (`school_year_id`) REFERENCES `school_year` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `behavior_log`
--

DROP TABLE IF EXISTS `behavior_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `behavior_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `reported_by_teacher_id` int DEFAULT NULL,
  `lesson_id` int DEFAULT NULL,
  `type` enum('positive','negative','neutral') NOT NULL DEFAULT 'neutral',
  `category` enum('discipline','academic','social','attendance','property','other') NOT NULL DEFAULT 'other',
  `description` text NOT NULL,
  `action_taken` varchar(255) DEFAULT NULL,
  `parent_notified` tinyint(1) NOT NULL DEFAULT '0',
  `parent_notified_at` datetime DEFAULT NULL,
  `severity` tinyint DEFAULT NULL COMMENT '1 (minor) to 5 (severe)',
  `incident_date` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_behavior_log_ibfk1` (`student_id`),
  KEY `fi_behavior_log_ibfk2` (`reported_by_teacher_id`),
  KEY `fi_behavior_log_ibfk3` (`lesson_id`),
  KEY `idx_behavior_log_type` (`type`),
  KEY `idx_behavior_log_incident_date` (`incident_date`),
  CONSTRAINT `behavior_log_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `behavior_log_ibfk2` FOREIGN KEY (`reported_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `behavior_log_ibfk3` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `teacher_qualification`
--

DROP TABLE IF EXISTS `teacher_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher_qualification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `qualification_name` varchar(200) NOT NULL,
  `institution` varchar(200) DEFAULT NULL,
  `type` enum('degree','certificate','license','training','other') NOT NULL DEFAULT 'other',
  `obtained_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `document_path` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_teacher_qualification_ibfk1` (`teacher_id`),
  KEY `idx_qualification_expiry` (`expiry_date`),
  CONSTRAINT `teacher_qualification_ibfk1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2847 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house_number` varchar(20) DEFAULT NULL,
  `apartment_number` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Poland',
  `type` enum('home','correspondence','other') NOT NULL DEFAULT 'home',
  `is_primary` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_address_ibfk1` (`student_id`),
  KEY `fi_address_ibfk2` (`teacher_id`),
  KEY `fi_address_ibfk3` (`parent_id`),
  CONSTRAINT `address_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `address_ibfk2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `address_ibfk3` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phone_number`
--

DROP TABLE IF EXISTS `phone_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_number` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `number` varchar(30) NOT NULL,
  `type` enum('mobile','home','work','emergency','fax','other') NOT NULL DEFAULT 'mobile',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_phone_number_ibfk1` (`student_id`),
  KEY `fi_phone_number_ibfk2` (`teacher_id`),
  KEY `fi_phone_number_ibfk3` (`parent_id`),
  KEY `fi_phone_number_ibfk4` (`staff_id`),
  KEY `idx_phone_number` (`number`),
  CONSTRAINT `phone_number_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_number_ibfk2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_number_ibfk3` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `phone_number_ibfk4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `uploaded_by_staff_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `file_path` varchar(512) NOT NULL,
  `file_type` varchar(50) DEFAULT NULL,
  `file_size_kb` int DEFAULT NULL,
  `type` enum('medical','consent','certificate','id','other') NOT NULL DEFAULT 'other',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `verified_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_document_ibfk1` (`student_id`),
  KEY `fi_document_ibfk2` (`teacher_id`),
  KEY `fi_document_ibfk3` (`staff_id`),
  KEY `fi_document_ibfk4` (`uploaded_by_staff_id`),
  KEY `idx_document_type` (`type`),
  CONSTRAINT `document_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk3` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `document_ibfk4` FOREIGN KEY (`uploaded_by_staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_by_staff_id` int DEFAULT NULL,
  `created_by_teacher_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `audience` enum('all','students','teachers','parents','staff') NOT NULL DEFAULT 'all',
  `priority` enum('low','normal','high','urgent') NOT NULL DEFAULT 'normal',
  `published_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_announcement_ibfk1` (`created_by_staff_id`),
  KEY `fi_announcement_ibfk2` (`created_by_teacher_id`),
  KEY `idx_announcement_published_at` (`published_at`),
  KEY `idx_announcement_audience` (`audience`),
  CONSTRAINT `announcement_ibfk1` FOREIGN KEY (`created_by_staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `announcement_ibfk2` FOREIGN KEY (`created_by_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4821 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_teacher_id` int DEFAULT NULL,
  `sender_staff_id` int DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_message_ibfk1` (`sender_teacher_id`),
  KEY `fi_message_ibfk2` (`sender_staff_id`),
  KEY `idx_message_sent_at` (`sent_at`),
  CONSTRAINT `message_ibfk1` FOREIGN KEY (`sender_teacher_id`) REFERENCES `teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `message_ibfk2` FOREIGN KEY (`sender_staff_id`) REFERENCES `staff` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message_recipient`
--

DROP TABLE IF EXISTS `message_recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_recipient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_message_recipient_ibfk1` (`message_id`),
  KEY `fi_message_recipient_ibfk2` (`student_id`),
  KEY `fi_message_recipient_ibfk3` (`parent_id`),
  KEY `fi_message_recipient_ibfk4` (`teacher_id`),
  KEY `idx_message_recipient_is_read` (`is_read`),
  CONSTRAINT `message_recipient_ibfk1` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_recipient_ibfk2` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_recipient_ibfk3` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `message_recipient_ibfk4` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=847321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `teacher_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `type` enum('grade','attendance','payment','message','event','behavior','system','other') NOT NULL DEFAULT 'system',
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `read_at` datetime DEFAULT NULL,
  `sent_via` enum('app','email','sms','push') NOT NULL DEFAULT 'app',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fi_notification_ibfk1` (`student_id`),
  KEY `fi_notification_ibfk2` (`parent_id`),
  KEY `fi_notification_ibfk3` (`teacher_id`),
  KEY `fi_notification_ibfk4` (`staff_id`),
  KEY `idx_notification_is_read` (`is_read`),
  KEY `idx_notification_type` (`type`),
  CONSTRAINT `notification_ibfk1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk2` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notification_ibfk4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2847312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
