-- MySQL dump 10.13  Distrib 5.6.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ariel
-- ------------------------------------------------------
-- Server version	5.6.33-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `active_list`
--

DROP TABLE IF EXISTS `active_list`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `active_list_type_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `start_obs_id` int(11) DEFAULT NULL,
  `stop_obs_id` int(11) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`active_list_id`),
  KEY `user_who_voided_active_list` (`voided_by`),
  KEY `user_who_created_active_list` (`creator`),
  KEY `active_list_type_of_active_list` (`active_list_type_id`),
  KEY `person_of_active_list` (`person_id`),
  KEY `concept_active_list` (`concept_id`),
  KEY `start_obs_active_list` (`start_obs_id`),
  KEY `stop_obs_active_list` (`stop_obs_id`),
  CONSTRAINT `active_list_type_of_active_list` FOREIGN KEY (`active_list_type_id`) REFERENCES `active_list_type` (`active_list_type_id`),
  CONSTRAINT `concept_active_list` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `person_of_active_list` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `start_obs_active_list` FOREIGN KEY (`start_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `stop_obs_active_list` FOREIGN KEY (`stop_obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_created_active_list` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_active_list` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `active_list_allergy`
--

DROP TABLE IF EXISTS `active_list_allergy`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_allergy` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `allergy_type` varchar(50) DEFAULT NULL,
  `reaction_concept_id` int(11) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`active_list_id`),
  KEY `reaction_allergy` (`reaction_concept_id`),
  CONSTRAINT `reaction_allergy` FOREIGN KEY (`reaction_concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `active_list_problem`
--

DROP TABLE IF EXISTS `active_list_problem`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_problem` (
  `active_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) DEFAULT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`active_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `active_list_type`
--

DROP TABLE IF EXISTS `active_list_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_list_type` (
  `active_list_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`active_list_type_id`),
  KEY `user_who_retired_active_list_type` (`retired_by`),
  KEY `user_who_created_active_list_type` (`creator`),
  CONSTRAINT `user_who_created_active_list_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_active_list_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `calculation_registration`
--

DROP TABLE IF EXISTS `calculation_registration`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calculation_registration` (
  `calculation_registration_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `provider_class_name` varchar(512) NOT NULL,
  `calculation_name` varchar(512) NOT NULL,
  `configuration` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`calculation_registration_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `care_setting`
--

DROP TABLE IF EXISTS `care_setting`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `care_setting` (
  `care_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `care_setting_type` varchar(50) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`care_setting_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `care_setting_creator` (`creator`),
  KEY `care_setting_retired_by` (`retired_by`),
  KEY `care_setting_changed_by` (`changed_by`),
  CONSTRAINT `care_setting_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `care_setting_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `clob_datatype_storage`
--

DROP TABLE IF EXISTS `clob_datatype_storage`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clob_datatype_storage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `clob_datatype_storage_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort` (
  `cohort_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`cohort_id`),
  UNIQUE KEY `cohort_uuid_index` (`uuid`),
  KEY `cohort_creator` (`creator`),
  KEY `user_who_voided_cohort` (`voided_by`),
  KEY `user_who_changed_cohort` (`changed_by`),
  CONSTRAINT `cohort_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_cohort` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_cohort` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `cohort_member`
--

DROP TABLE IF EXISTS `cohort_member`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cohort_member` (
  `cohort_id` int(11) NOT NULL DEFAULT '0',
  `patient_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cohort_id`,`patient_id`),
  KEY `cohort` (`cohort_id`),
  KEY `patient` (`patient_id`),
  CONSTRAINT `member_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `parent_cohort` FOREIGN KEY (`cohort_id`) REFERENCES `cohort` (`cohort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept`
--

DROP TABLE IF EXISTS `concept`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept` (
  `concept_id` int(11) NOT NULL AUTO_INCREMENT,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `short_name` varchar(255) DEFAULT NULL,
  `description` text,
  `form_text` text,
  `datatype_id` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` varchar(50) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_id`),
  UNIQUE KEY `concept_uuid_index` (`uuid`),
  KEY `concept_classes` (`class_id`),
  KEY `concept_creator` (`creator`),
  KEY `concept_datatypes` (`datatype_id`),
  KEY `user_who_changed_concept` (`changed_by`),
  KEY `user_who_retired_concept` (`retired_by`),
  CONSTRAINT `concept_classes` FOREIGN KEY (`class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `concept_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `concept_datatypes` FOREIGN KEY (`datatype_id`) REFERENCES `concept_datatype` (`concept_datatype_id`),
  CONSTRAINT `user_who_changed_concept` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6487 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_answer`
--

DROP TABLE IF EXISTS `concept_answer`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_answer` (
  `concept_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `answer_concept` int(11) DEFAULT NULL,
  `answer_drug` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`concept_answer_id`),
  UNIQUE KEY `concept_answer_uuid_index` (`uuid`),
  KEY `answer_creator` (`creator`),
  KEY `answer` (`answer_concept`),
  KEY `answers_for_concept` (`concept_id`),
  KEY `answer_answer_drug_fk` (`answer_drug`),
  CONSTRAINT `answer` FOREIGN KEY (`answer_concept`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_answer_drug_fk` FOREIGN KEY (`answer_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `answer_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `answers_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3021 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_class`
--

DROP TABLE IF EXISTS `concept_class`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_class` (
  `concept_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_class_id`),
  UNIQUE KEY `concept_class_uuid_index` (`uuid`),
  KEY `concept_class_creator` (`creator`),
  KEY `user_who_retired_concept_class` (`retired_by`),
  KEY `concept_class_retired_status` (`retired`),
  KEY `concept_class_name_index` (`name`),
  CONSTRAINT `concept_class_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_class` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_complex`
--

DROP TABLE IF EXISTS `concept_complex`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_complex` (
  `concept_id` int(11) NOT NULL,
  `handler` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `concept_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_datatype`
--

DROP TABLE IF EXISTS `concept_datatype`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_datatype` (
  `concept_datatype_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `hl7_abbreviation` varchar(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_datatype_id`),
  UNIQUE KEY `concept_datatype_uuid_index` (`uuid`),
  KEY `concept_datatype_creator` (`creator`),
  KEY `user_who_retired_concept_datatype` (`retired_by`),
  KEY `concept_datatype_retired_status` (`retired`),
  KEY `concept_datatype_name_index` (`name`),
  CONSTRAINT `concept_datatype_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_datatype` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_description`
--

DROP TABLE IF EXISTS `concept_description`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_description` (
  `concept_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_description_id`),
  UNIQUE KEY `concept_description_uuid_index` (`uuid`),
  KEY `concept_being_described` (`concept_id`),
  KEY `user_who_created_description` (`creator`),
  KEY `user_who_changed_description` (`changed_by`),
  CONSTRAINT `description_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_description` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_description` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3686 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_map_type`
--

DROP TABLE IF EXISTS `concept_map_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_map_type` (
  `concept_map_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_map_type_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator_concept_map_type` (`creator`),
  KEY `mapped_user_changed_concept_map_type` (`changed_by`),
  KEY `mapped_user_retired_concept_map_type` (`retired_by`),
  CONSTRAINT `mapped_user_changed_concept_map_type` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_concept_map_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired_concept_map_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_name`
--

DROP TABLE IF EXISTS `concept_name`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name` (
  `concept_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `locale` varchar(50) NOT NULL DEFAULT '',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `concept_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `concept_name_type` varchar(50) DEFAULT NULL,
  `locale_preferred` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`concept_name_id`),
  UNIQUE KEY `concept_name_id` (`concept_name_id`),
  UNIQUE KEY `concept_name_uuid_index` (`uuid`),
  KEY `user_who_created_name` (`creator`),
  KEY `name_of_concept` (`name`),
  KEY `unique_concept_name_id` (`concept_id`),
  KEY `user_who_voided_name` (`voided_by`),
  CONSTRAINT `name_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_this_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7754 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_name_tag`
--

DROP TABLE IF EXISTS `concept_name_tag`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag` (
  `concept_name_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(50) NOT NULL,
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_id` (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_id_2` (`concept_name_tag_id`),
  UNIQUE KEY `concept_name_tag_unique_tags` (`tag`),
  UNIQUE KEY `concept_name_tag_uuid_index` (`uuid`),
  KEY `user_who_created_name_tag` (`creator`),
  KEY `user_who_voided_name_tag` (`voided_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_name_tag_map`
--

DROP TABLE IF EXISTS `concept_name_tag_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_name_tag_map` (
  `concept_name_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `map_name` (`concept_name_id`),
  KEY `map_name_tag` (`concept_name_tag_id`),
  CONSTRAINT `mapped_concept_name` FOREIGN KEY (`concept_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `mapped_concept_name_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_numeric`
--

DROP TABLE IF EXISTS `concept_numeric`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_numeric` (
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `hi_absolute` double DEFAULT NULL,
  `hi_critical` double DEFAULT NULL,
  `hi_normal` double DEFAULT NULL,
  `low_absolute` double DEFAULT NULL,
  `low_critical` double DEFAULT NULL,
  `low_normal` double DEFAULT NULL,
  `units` varchar(50) DEFAULT NULL,
  `precise` tinyint(1) NOT NULL DEFAULT '0',
  `display_precision` int(11) DEFAULT NULL,
  PRIMARY KEY (`concept_id`),
  CONSTRAINT `numeric_attributes` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_proposal`
--

DROP TABLE IF EXISTS `concept_proposal`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal` (
  `concept_proposal_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `original_text` varchar(255) NOT NULL DEFAULT '',
  `final_text` varchar(255) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `obs_concept_id` int(11) DEFAULT NULL,
  `state` varchar(32) NOT NULL DEFAULT 'UNMAPPED' COMMENT 'Valid values are: UNMAPPED, SYNONYM, CONCEPT, REJECT',
  `comments` varchar(255) DEFAULT NULL COMMENT 'Comment from concept admin/mapper',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `locale` varchar(50) NOT NULL DEFAULT '',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_proposal_id`),
  UNIQUE KEY `concept_proposal_uuid_index` (`uuid`),
  KEY `encounter_for_proposal` (`encounter_id`),
  KEY `concept_for_proposal` (`concept_id`),
  KEY `user_who_created_proposal` (`creator`),
  KEY `user_who_changed_proposal` (`changed_by`),
  KEY `proposal_obs_id` (`obs_id`),
  KEY `proposal_obs_concept_id` (`obs_concept_id`),
  CONSTRAINT `concept_for_proposal` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `encounter_for_proposal` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `proposal_obs_concept_id` FOREIGN KEY (`obs_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `proposal_obs_id` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_changed_proposal` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_proposal` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_proposal_tag_map`
--

DROP TABLE IF EXISTS `concept_proposal_tag_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_proposal_tag_map` (
  `concept_proposal_id` int(11) NOT NULL,
  `concept_name_tag_id` int(11) NOT NULL,
  KEY `map_proposal` (`concept_proposal_id`),
  KEY `map_name_tag` (`concept_name_tag_id`),
  CONSTRAINT `mapped_concept_proposal` FOREIGN KEY (`concept_proposal_id`) REFERENCES `concept_proposal` (`concept_proposal_id`),
  CONSTRAINT `mapped_concept_proposal_tag` FOREIGN KEY (`concept_name_tag_id`) REFERENCES `concept_name_tag` (`concept_name_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_reference_map`
--

DROP TABLE IF EXISTS `concept_reference_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_map` (
  `concept_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `uuid` char(38) NOT NULL,
  `concept_reference_term_id` int(11) NOT NULL,
  `concept_map_type_id` int(11) NOT NULL DEFAULT '1',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`concept_map_id`),
  UNIQUE KEY `concept_map_uuid_index` (`uuid`),
  KEY `map_creator` (`creator`),
  KEY `map_for_concept` (`concept_id`),
  KEY `mapped_concept_map_type` (`concept_map_type_id`),
  KEY `mapped_user_changed_ref_term` (`changed_by`),
  KEY `mapped_concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `map_for_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `mapped_concept_map_type` FOREIGN KEY (`concept_map_type_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_concept_reference_term` FOREIGN KEY (`concept_reference_term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_reference_source`
--

DROP TABLE IF EXISTS `concept_reference_source`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_source` (
  `concept_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hl7_code` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_source_id`),
  UNIQUE KEY `concept_source_uuid_index` (`uuid`),
  UNIQUE KEY `concept_source_unique_hl7_codes` (`hl7_code`),
  KEY `concept_source_creator` (`creator`),
  KEY `user_who_voided_concept_source` (`retired_by`),
  KEY `unique_hl7_code` (`hl7_code`,`retired`),
  CONSTRAINT `concept_source_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_concept_source` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_reference_term`
--

DROP TABLE IF EXISTS `concept_reference_term`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term` (
  `concept_reference_term_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_source_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_user_creator` (`creator`),
  KEY `mapped_user_changed` (`changed_by`),
  KEY `mapped_user_retired` (`retired_by`),
  KEY `mapped_concept_source` (`concept_source_id`),
  KEY `idx_code_concept_reference_term` (`code`),
  CONSTRAINT `mapped_concept_source` FOREIGN KEY (`concept_source_id`) REFERENCES `concept_reference_source` (`concept_source_id`),
  CONSTRAINT `mapped_user_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_retired` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=959 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_reference_term_map`
--

DROP TABLE IF EXISTS `concept_reference_term_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_reference_term_map` (
  `concept_reference_term_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `term_a_id` int(11) NOT NULL,
  `term_b_id` int(11) NOT NULL,
  `a_is_to_b_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_reference_term_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `mapped_term_a` (`term_a_id`),
  KEY `mapped_term_b` (`term_b_id`),
  KEY `mapped_concept_map_type_ref_term_map` (`a_is_to_b_id`),
  KEY `mapped_user_creator_ref_term_map` (`creator`),
  KEY `mapped_user_changed_ref_term_map` (`changed_by`),
  CONSTRAINT `mapped_concept_map_type_ref_term_map` FOREIGN KEY (`a_is_to_b_id`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `mapped_term_a` FOREIGN KEY (`term_a_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_term_b` FOREIGN KEY (`term_b_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `mapped_user_changed_ref_term_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `mapped_user_creator_ref_term_map` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_set`
--

DROP TABLE IF EXISTS `concept_set`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_set` (
  `concept_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `concept_set` int(11) NOT NULL DEFAULT '0',
  `sort_weight` double DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_set_id`),
  UNIQUE KEY `concept_set_uuid_index` (`uuid`),
  KEY `has_a` (`concept_set`),
  KEY `user_who_created` (`creator`),
  KEY `idx_concept_set_concept` (`concept_id`),
  CONSTRAINT `has_a` FOREIGN KEY (`concept_set`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `is_a` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=672 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_state_conversion`
--

DROP TABLE IF EXISTS `concept_state_conversion`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_state_conversion` (
  `concept_state_conversion_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) DEFAULT '0',
  `program_workflow_id` int(11) DEFAULT '0',
  `program_workflow_state_id` int(11) DEFAULT '0',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_state_conversion_id`),
  UNIQUE KEY `concept_state_conversion_uuid_index` (`uuid`),
  UNIQUE KEY `unique_workflow_concept_in_conversion` (`program_workflow_id`,`concept_id`),
  KEY `triggering_concept` (`concept_id`),
  KEY `affected_workflow` (`program_workflow_id`),
  KEY `resulting_state` (`program_workflow_state_id`),
  CONSTRAINT `concept_triggers_conversion` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conversion_involves_workflow` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`),
  CONSTRAINT `conversion_to_state` FOREIGN KEY (`program_workflow_state_id`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_stop_word`
--

DROP TABLE IF EXISTS `concept_stop_word`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_stop_word` (
  `concept_stop_word_id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(50) NOT NULL,
  `locale` varchar(50) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`concept_stop_word_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `Unique_StopWord_Key` (`word`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `concept_word`
--

DROP TABLE IF EXISTS `concept_word`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concept_word` (
  `concept_word_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `word` varchar(50) NOT NULL DEFAULT '',
  `locale` varchar(20) NOT NULL DEFAULT '',
  `concept_name_id` int(11) NOT NULL,
  `weight` double DEFAULT '1',
  PRIMARY KEY (`concept_word_id`),
  KEY `word_in_concept_name` (`word`),
  KEY `concept_word_concept_idx` (`concept_id`),
  KEY `word_for_name` (`concept_name_id`),
  KEY `concept_word_weight_index` (`weight`),
  CONSTRAINT `word_for` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `word_for_name` FOREIGN KEY (`concept_name_id`) REFERENCES `concept_name` (`concept_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61556 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `conditions`
--

DROP TABLE IF EXISTS `conditions`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conditions` (
  `condition_id` int(11) NOT NULL AUTO_INCREMENT,
  `previous_condition_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `concept_id` int(11) NOT NULL,
  `condition_non_coded` varchar(1024) DEFAULT NULL,
  `onset_date` datetime DEFAULT NULL,
  `additional_detail` varchar(1024) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `end_reason` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `voided` tinyint(1) NOT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`condition_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `condition_uuid_index` (`uuid`),
  KEY `conditions_previous_condition_id_fk` (`previous_condition_id`),
  KEY `conditions_patient_fk` (`patient_id`),
  KEY `conditions_concept_fk` (`concept_id`),
  KEY `conditions_end_reason_fk` (`end_reason`),
  KEY `conditions_created_by_fk` (`creator`),
  KEY `conditions_voided_by_fk` (`voided_by`),
  CONSTRAINT `conditions_concept_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conditions_created_by_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `conditions_end_reason_fk` FOREIGN KEY (`end_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `conditions_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `conditions_previous_condition_id_fk` FOREIGN KEY (`previous_condition_id`) REFERENCES `conditions` (`condition_id`),
  CONSTRAINT `conditions_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug` (
  `drug_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `combination` tinyint(1) NOT NULL DEFAULT '0',
  `dosage_form` int(11) DEFAULT NULL,
  `maximum_daily_dose` double DEFAULT NULL,
  `minimum_daily_dose` double DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `strength` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`drug_id`),
  UNIQUE KEY `drug_uuid_index` (`uuid`),
  KEY `drug_creator` (`creator`),
  KEY `primary_drug_concept` (`concept_id`),
  KEY `dosage_form_concept` (`dosage_form`),
  KEY `route_concept` (`route`),
  KEY `user_who_voided_drug` (`retired_by`),
  KEY `drug_changed_by` (`changed_by`),
  CONSTRAINT `dosage_form_concept` FOREIGN KEY (`dosage_form`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `drug_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `primary_drug_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `route_concept` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `drug_ingredient`
--

DROP TABLE IF EXISTS `drug_ingredient`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_ingredient` (
  `drug_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  `uuid` char(38) NOT NULL,
  `strength` double DEFAULT NULL,
  `units` int(11) DEFAULT NULL,
  PRIMARY KEY (`drug_id`,`ingredient_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_ingredient_units_fk` (`units`),
  KEY `drug_ingredient_ingredient_id_fk` (`ingredient_id`),
  CONSTRAINT `drug_ingredient_drug_id_fk` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_ingredient_ingredient_id_fk` FOREIGN KEY (`ingredient_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_ingredient_units_fk` FOREIGN KEY (`units`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `drug_order`
--

DROP TABLE IF EXISTS `drug_order`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `drug_inventory_id` int(11) DEFAULT NULL,
  `dose` double DEFAULT NULL,
  `as_needed` tinyint(1) DEFAULT NULL,
  `dosing_type` varchar(255) DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `as_needed_condition` varchar(255) DEFAULT NULL,
  `num_refills` int(11) DEFAULT NULL,
  `dosing_instructions` text,
  `duration` int(11) DEFAULT NULL,
  `duration_units` int(11) DEFAULT NULL,
  `quantity_units` int(11) DEFAULT NULL,
  `route` int(11) DEFAULT NULL,
  `dose_units` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `dispense_as_written` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  KEY `inventory_item` (`drug_inventory_id`),
  KEY `drug_order_duration_units_fk` (`duration_units`),
  KEY `drug_order_quantity_units` (`quantity_units`),
  KEY `drug_order_route_fk` (`route`),
  KEY `drug_order_dose_units` (`dose_units`),
  KEY `drug_order_frequency_fk` (`frequency`),
  CONSTRAINT `drug_order_dose_units` FOREIGN KEY (`dose_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_duration_units_fk` FOREIGN KEY (`duration_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `drug_order_quantity_units` FOREIGN KEY (`quantity_units`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `drug_order_route_fk` FOREIGN KEY (`route`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `extends_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `inventory_item` FOREIGN KEY (`drug_inventory_id`) REFERENCES `drug` (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `drug_reference_map`
--

DROP TABLE IF EXISTS `drug_reference_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drug_reference_map` (
  `drug_reference_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `drug_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `concept_map_type` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`drug_reference_map_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `drug_for_drug_reference_map` (`drug_id`),
  KEY `concept_reference_term_for_drug_reference_map` (`term_id`),
  KEY `concept_map_type_for_drug_reference_map` (`concept_map_type`),
  KEY `user_who_changed_drug_reference_map` (`changed_by`),
  KEY `drug_reference_map_creator` (`creator`),
  KEY `user_who_retired_drug_reference_map` (`retired_by`),
  CONSTRAINT `concept_map_type_for_drug_reference_map` FOREIGN KEY (`concept_map_type`) REFERENCES `concept_map_type` (`concept_map_type_id`),
  CONSTRAINT `concept_reference_term_for_drug_reference_map` FOREIGN KEY (`term_id`) REFERENCES `concept_reference_term` (`concept_reference_term_id`),
  CONSTRAINT `drug_for_drug_reference_map` FOREIGN KEY (`drug_id`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `drug_reference_map_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_drug_reference_map` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_drug_reference_map` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `encounter`
--

DROP TABLE IF EXISTS `encounter`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter` (
  `encounter_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_type` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `encounter_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `visit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`encounter_id`),
  UNIQUE KEY `encounter_uuid_index` (`uuid`),
  KEY `encounter_location` (`location_id`),
  KEY `encounter_patient` (`patient_id`),
  KEY `encounter_type_id` (`encounter_type`),
  KEY `encounter_creator` (`creator`),
  KEY `encounter_form` (`form_id`),
  KEY `user_who_voided_encounter` (`voided_by`),
  KEY `encounter_changed_by` (`changed_by`),
  KEY `encounter_datetime_idx` (`encounter_datetime`),
  KEY `encounter_visit_id_fk` (`visit_id`),
  CONSTRAINT `encounter_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_form` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `encounter_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `encounter_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `encounter_type_id` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `encounter_visit_id_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `user_who_voided_encounter` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=896947 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `encounter_provider`
--

DROP TABLE IF EXISTS `encounter_provider`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_provider` (
  `encounter_provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `encounter_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  `encounter_role_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `encounter_id_fk` (`encounter_id`),
  KEY `provider_id_fk` (`provider_id`),
  KEY `encounter_role_id_fk` (`encounter_role_id`),
  KEY `encounter_provider_creator` (`creator`),
  KEY `encounter_provider_changed_by` (`changed_by`),
  KEY `encounter_provider_voided_by` (`voided_by`),
  CONSTRAINT `encounter_id_fk` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `encounter_provider_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_provider_voided_by` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_id_fk` FOREIGN KEY (`encounter_role_id`) REFERENCES `encounter_role` (`encounter_role_id`),
  CONSTRAINT `provider_id_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=732734 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `encounter_role`
--

DROP TABLE IF EXISTS `encounter_role`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_role` (
  `encounter_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`encounter_role_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `encounter_role_unique_name` (`name`),
  KEY `encounter_role_creator_fk` (`creator`),
  KEY `encounter_role_changed_by_fk` (`changed_by`),
  KEY `encounter_role_retired_by_fk` (`retired_by`),
  CONSTRAINT `encounter_role_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `encounter_role_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `encounter_type`
--

DROP TABLE IF EXISTS `encounter_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encounter_type` (
  `encounter_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `view_privilege` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`encounter_type_id`),
  UNIQUE KEY `encounter_type_uuid_index` (`uuid`),
  UNIQUE KEY `encounter_type_unique_name` (`name`),
  KEY `user_who_created_type` (`creator`),
  KEY `user_who_retired_encounter_type` (`retired_by`),
  KEY `retired_status` (`retired`),
  KEY `privilege_which_can_view_encounter_type` (`view_privilege`),
  KEY `privilege_which_can_edit_encounter_type` (`edit_privilege`),
  CONSTRAINT `privilege_which_can_edit_encounter_type` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `privilege_which_can_view_encounter_type` FOREIGN KEY (`view_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_created_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_encounter_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `field_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `field_type` int(11) DEFAULT NULL,
  `concept_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `attribute_name` varchar(50) DEFAULT NULL,
  `default_value` text,
  `select_multiple` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`field_id`),
  UNIQUE KEY `field_uuid_index` (`uuid`),
  KEY `concept_for_field` (`concept_id`),
  KEY `user_who_changed_field` (`changed_by`),
  KEY `user_who_created_field` (`creator`),
  KEY `type_of_field` (`field_type`),
  KEY `user_who_retired_field` (`retired_by`),
  KEY `field_retired_status` (`retired`),
  CONSTRAINT `concept_for_field` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `type_of_field` FOREIGN KEY (`field_type`) REFERENCES `field_type` (`field_type_id`),
  CONSTRAINT `user_who_changed_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_field` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=786 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `field_answer`
--

DROP TABLE IF EXISTS `field_answer`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_answer` (
  `field_id` int(11) NOT NULL DEFAULT '0',
  `answer_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`field_id`,`answer_id`),
  UNIQUE KEY `field_answer_uuid_index` (`uuid`),
  KEY `answers_for_field` (`field_id`),
  KEY `field_answer_concept` (`answer_id`),
  KEY `user_who_created_field_answer` (`creator`),
  CONSTRAINT `answers_for_field` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `field_answer_concept` FOREIGN KEY (`answer_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_created_field_answer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `field_type`
--

DROP TABLE IF EXISTS `field_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type` (
  `field_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` longtext,
  `is_set` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`field_type_id`),
  UNIQUE KEY `field_type_uuid_index` (`uuid`),
  KEY `user_who_created_field_type` (`creator`),
  CONSTRAINT `user_who_created_field_type` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(50) NOT NULL DEFAULT '',
  `build` int(11) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `encounter_type` int(11) DEFAULT NULL,
  `template` mediumtext,
  `xslt` mediumtext,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retired_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_uuid_index` (`uuid`),
  KEY `user_who_created_form` (`creator`),
  KEY `user_who_last_changed_form` (`changed_by`),
  KEY `user_who_retired_form` (`retired_by`),
  KEY `encounter_type` (`encounter_type`),
  KEY `form_published_index` (`published`),
  KEY `form_retired_index` (`retired`),
  KEY `form_published_and_retired_index` (`published`,`retired`),
  CONSTRAINT `form_encounter_type` FOREIGN KEY (`encounter_type`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `user_who_created_form` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `form_field`
--

DROP TABLE IF EXISTS `form_field`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_field` (
  `form_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL DEFAULT '0',
  `field_id` int(11) NOT NULL DEFAULT '0',
  `field_number` int(11) DEFAULT NULL,
  `field_part` varchar(5) DEFAULT NULL,
  `page_number` int(11) DEFAULT NULL,
  `parent_form_field` int(11) DEFAULT NULL,
  `min_occurs` int(11) DEFAULT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sort_weight` float(11,5) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_field_id`),
  UNIQUE KEY `form_field_uuid_index` (`uuid`),
  KEY `user_who_last_changed_form_field` (`changed_by`),
  KEY `field_within_form` (`field_id`),
  KEY `form_containing_field` (`form_id`),
  KEY `form_field_hierarchy` (`parent_form_field`),
  KEY `user_who_created_form_field` (`creator`),
  CONSTRAINT `field_within_form` FOREIGN KEY (`field_id`) REFERENCES `field` (`field_id`),
  CONSTRAINT `form_containing_field` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `form_field_hierarchy` FOREIGN KEY (`parent_form_field`) REFERENCES `form_field` (`form_field_id`),
  CONSTRAINT `user_who_created_form_field` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_last_changed_form_field` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6282 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `form_resource`
--

DROP TABLE IF EXISTS `form_resource`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_resource` (
  `form_resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value_reference` text NOT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`form_resource_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `unique_form_and_name` (`form_id`,`name`),
  CONSTRAINT `form_resource_form_fk` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `global_property`
--

DROP TABLE IF EXISTS `global_property`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_property` (
  `property` varchar(255) NOT NULL DEFAULT '',
  `property_value` mediumtext,
  `description` text,
  `uuid` char(38) NOT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  PRIMARY KEY (`property`),
  UNIQUE KEY `global_property_uuid_index` (`uuid`),
  KEY `global_property_property_index` (`property`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `hl7_in_archive`
--

DROP TABLE IF EXISTS `hl7_in_archive`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_archive` (
  `hl7_in_archive_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` varchar(255) DEFAULT NULL,
  `hl7_data` mediumtext NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message_state` int(1) DEFAULT '2',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_in_archive_id`),
  UNIQUE KEY `hl7_in_archive_uuid_index` (`uuid`),
  KEY `hl7_in_archive_message_state_idx` (`message_state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `hl7_in_error`
--

DROP TABLE IF EXISTS `hl7_in_error`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_error` (
  `hl7_in_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` mediumtext NOT NULL,
  `error` varchar(255) NOT NULL DEFAULT '',
  `error_details` mediumtext,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_in_error_id`),
  UNIQUE KEY `hl7_in_error_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `hl7_in_queue`
--

DROP TABLE IF EXISTS `hl7_in_queue`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_in_queue` (
  `hl7_in_queue_id` int(11) NOT NULL AUTO_INCREMENT,
  `hl7_source` int(11) NOT NULL DEFAULT '0',
  `hl7_source_key` text,
  `hl7_data` mediumtext NOT NULL,
  `message_state` int(1) NOT NULL DEFAULT '0',
  `date_processed` datetime DEFAULT NULL,
  `error_msg` text,
  `date_created` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_in_queue_id`),
  UNIQUE KEY `hl7_in_queue_uuid_index` (`uuid`),
  KEY `hl7_source` (`hl7_source`),
  CONSTRAINT `hl7_source` FOREIGN KEY (`hl7_source`) REFERENCES `hl7_source` (`hl7_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `hl7_source`
--

DROP TABLE IF EXISTS `hl7_source`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hl7_source` (
  `hl7_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` tinytext,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`hl7_source_id`),
  UNIQUE KEY `hl7_source_uuid_index` (`uuid`),
  KEY `creator` (`creator`),
  CONSTRAINT `creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `htmlformentry_html_form`
--

DROP TABLE IF EXISTS `htmlformentry_html_form`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `htmlformentry_html_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `xml_data` mediumtext NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `uuid` char(38) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `htmlformentry_html_form_uuid_index` (`uuid`),
  KEY `User who created htmlformentry_htmlform` (`creator`),
  KEY `Form with which this htmlform is related` (`form_id`),
  KEY `User who changed htmlformentry_htmlform` (`changed_by`),
  KEY `user_who_retired_html_form` (`retired_by`),
  CONSTRAINT `Form with which this htmlform is related` FOREIGN KEY (`form_id`) REFERENCES `form` (`form_id`),
  CONSTRAINT `User who changed htmlformentry_htmlform` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `User who created htmlformentry_htmlform` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_html_form` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `liquibasechangelog`
--

DROP TABLE IF EXISTS `liquibasechangelog`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangelog` (
  `ID` varchar(63) NOT NULL,
  `AUTHOR` varchar(63) NOT NULL,
  `FILENAME` varchar(200) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`,`AUTHOR`,`FILENAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

LOCK TABLES `liquibasechangelog` WRITE;
/*!40000 ALTER TABLE `liquibasechangelog` DISABLE KEYS */;
INSERT INTO `liquibasechangelog` VALUES ('0','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:19','3:ccc4741ff492cb385f44e714053920af','Custom Change','Run the old sqldiff file to get database up to the 1.4.0.20 version if needed. (Requires \'mysql\' to be on the PATH)',NULL,'1.9.4',-1,'EXECUTED'),('02232009-1141','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:b5921fb42deb90fe52e042838d0638a0','Modify Column','Modify the password column to fit the output of SHA-512 function',NULL,'1.9.4',-1,'EXECUTED'),('1','upul','liquibase-update-to-latest.xml','2011-01-11 10:50:19','3:7fbc03c45bb69cd497b096629d32c3f5','Add Column','Add the column to person_attribute type to connect each type to a privilege',NULL,'1.9.4',-1,'EXECUTED'),('1-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:24','3:37a6dc66c67e8c518f9d50971387b438','Modify data type','(Fixed)Modified edit_privilege to correct column size',NULL,'2.0.5',0,'EXECUTED'),('1-grant-new-dashboard-overview-tab-app-privileges','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:6af3c30685c99d96ad1cd577719b1600','Custom SQL','Granting the new patient overview tab application privileges',NULL,'2.0.5',173,'EXECUTED'),('1-increase-privilege-col-size-privilege','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:6ecff8787eca17532e310087cfd65a06','Drop Foreign Key Constraint (x2), Modify Column, Add Foreign Key Constraint (x2)','Increasing the size of the privilege column in the privilege table',NULL,'2.0.5',175,'EXECUTED'),('10-insert-new-app-privileges','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:6ca60c3d5202a79f2e43367215cb447b','Custom SQL','Inserting the new application privileges',NULL,'2.0.5',171,'EXECUTED'),('11-insert-new-api-privileges','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:fe15eb2a97dd397b15fb5c4174fabe05','Custom SQL','Inserting the new API privileges',NULL,'2.0.5',172,'EXECUTED'),('2','upul','liquibase-update-to-latest.xml','2011-01-11 10:50:23','3:b1811e5e43321192b275d6e2fe2fa564','Add Foreign Key Constraint','Create the foreign key from the privilege required for to edit\n			a person attribute type and the privilege.privilege column',NULL,'1.9.4',-1,'EXECUTED'),('2-increase-privilege-col-size-rol-privilege','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:6fc0247ae054fedeb32a4af3775046f4','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Increasing the size of the privilege column in the role_privilege table',NULL,'2.0.5',176,'EXECUTED'),('2-role-assign-new-api-privileges-to-renamed-ones','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:4eadbd161bf0f7e15eafb4a52b01b625','Custom SQL','Assigning the new API-level privileges to roles that used to have the renamed privileges',NULL,'2.0.5',174,'EXECUTED'),('200805281223','bmckown','liquibase-update-to-latest.xml','2011-01-11 10:50:26','3:b1fc37f9ec96eac9203f0808c2f4ac26','Create Table, Add Foreign Key Constraint','Create the concept_complex table',NULL,'1.9.4',-1,'EXECUTED'),('200805281224','bmckown','liquibase-update-to-latest.xml','2011-01-11 10:50:27','3:ea32453830c2215bdb209770396002e7','Add Column','Adding the value_complex column to obs.  This may take a long time if you have a large number of observations.',NULL,'1.9.4',-1,'EXECUTED'),('200805281225','bmckown','liquibase-update-to-latest.xml','2011-01-11 10:50:27','3:5281031bcc075df3b959e94da4adcaa9','Insert Row','Adding a \'complex\' Concept Datatype',NULL,'1.9.4',-1,'EXECUTED'),('200805281226','bmckown','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:9a49a3d002485f3a77134d98fb7c8cd8','Drop Table (x2)','Dropping the mimetype and complex_obs tables as they aren\'t needed in the new complex obs setup',NULL,'1.9.4',-1,'EXECUTED'),('200809191226','smbugua','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:eed0aa27b44ecf668c81e457d99fa7de','Add Column','Adding the hl7 archive message_state column so that archives can be tracked\n			\n			(preCondition database_version check in place because this change was in the old format in trunk for a while)',NULL,'1.9.4',-1,'EXECUTED'),('200809191927','smbugua','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:f0e4fab64749e42770e62e9330c2d288','Rename Column, Modify Column','Adding the hl7 archive message_state column so that archives can be tracked',NULL,'1.9.4',-1,'EXECUTED'),('200811261102','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:23','3:158dd028359ebfd4f1c9bf2e76a5e143','Update Data','Fix field property for new Tribe person attribute',NULL,'1.9.4',-1,'EXECUTED'),('200901101524','Knoll_Frank','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:feb4a087d13657164e5c3bc787b7f83f','Modify Column','Changing datatype of drug.retire_reason from DATETIME to varchar(255)',NULL,'1.9.4',-1,'EXECUTED'),('200901130950','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:f1e5e7124bdb4f7378866fdb691e2780','Delete Data (x2)','Remove Manage Tribes and View Tribes privileges from all roles',NULL,'1.9.4',-1,'EXECUTED'),('200901130951','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:54ac8683819837cc04f1a16b6311d668','Delete Data (x2)','Remove Manage Mime Types, View Mime Types, and Purge Mime Types privilege',NULL,'1.9.4',-1,'EXECUTED'),('200901161126','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:871b9364dd87b6bfcc0005f40b6eb399','Delete Data','Removed the database_version global property',NULL,'1.9.4',-1,'EXECUTED'),('20090121-0949','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:8639e35e0238019af2f9e326dd5cbc22','Custom SQL','Switched the default xslt to use PV1-19 instead of PV1-1',NULL,'1.9.4',-1,'EXECUTED'),('20090122-0853','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:4903c6f81f0309313013851f09a26b85','Custom SQL, Add Lookup Table, Drop Foreign Key Constraint, Delete Data (x2), Drop Table','Remove duplicate concept name tags',NULL,'1.9.4',-1,'EXECUTED'),('20090123-0305','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:30','3:48cdf2b28fcad687072ac8133e46cba6','Add Unique Constraint','Add unique constraint to the tags table',NULL,'1.9.4',-1,'EXECUTED'),('20090214-2246','isherman','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:d16c607266238df425db61908e7c8745','Custom SQL','Add weight and cd4 to patientGraphConcepts user property (mysql specific)',NULL,'1.9.4',-1,'EXECUTED'),('20090214-2247','isherman','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:e4eeb4a09c2ab695bbde832cd7b6047d','Custom SQL','Add weight and cd4 to patientGraphConcepts user property (using standard sql)',NULL,'1.9.4',-1,'EXECUTED'),('20090214-2248','isherman','liquibase-update-to-latest.xml','2011-01-11 10:50:38',NULL,'Custom SQL','Add weight and cd4 to patientGraphConcepts user property (mssql specific)',NULL,'1.9.4',-1,'EXECUTED'),('200902142212','ewolodzko','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:df93fa2841295b29a0fcd4225c46d1a3','Add Column','Add a sortWeight field to PersonAttributeType',NULL,'1.9.4',-1,'EXECUTED'),('200902142213','ewolodzko','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:ace82a1ecb3a0c3246e39f0bebe38423','Update Data','Add default sortWeights to all current PersonAttributeTypes',NULL,'1.9.4',-1,'EXECUTED'),('20090224-1002-create-visit_type','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:ea3c0b323da2d51cf43e982177eace96','Create Table, Add Foreign Key Constraint (x3)','Create visit type table',NULL,'2.0.5',56,'EXECUTED'),('20090224-1229','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:34','3:f8433194bcb29073c17c7765ce61aab2','Create Table, Add Foreign Key Constraint (x2)','Add location tags table',NULL,'1.9.4',-1,'EXECUTED'),('20090224-1250','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:8935a56fac2ad91275248d4675c2c090','Create Table, Add Foreign Key Constraint (x2), Add Primary Key','Add location tag map table',NULL,'1.9.4',-1,'EXECUTED'),('20090224-1256','Keelhaul+bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:9c0e7238dd1daad9edff381ba22a3ada','Add Column, Add Foreign Key Constraint','Add parent_location column to location table',NULL,'1.9.4',-1,'EXECUTED'),('20090225-1551','dthomas','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:a3aed1685bd1051a8c4fae0eab925954','Rename Column (x2)','Change location_tag.name to location_tag.tag and location_tag.retired_reason to location_tag.retire_reason',NULL,'1.9.4',-1,'EXECUTED'),('20090301-1259','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:38','3:21f2ac06dee26613b73003cd1f247ea8','Update Data (x2)','Fixes the description for name layout global property',NULL,'1.9.4',-1,'EXECUTED'),('20090316-1008','vanand','liquibase-update-to-latest.xml','2011-01-11 10:50:40','3:baa49982f1106c65ba33c845bba149b3','Modify Column (x7), Update Data, Modify Column (x18), Update Data, Modify Column (x11)','Change column types of all boolean columns to smallint. The columns used to be either tinyint(4) or MySQL\'s BIT.\n			(This may take a while on large patient or obs tables)',NULL,'1.9.4',-1,'EXECUTED'),('20090316-1008-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:aeeb6c14cd22ffa121a2582e04025f5a','Modify Column (x36)','(Fixed)Changing from smallint to BOOLEAN type on BOOLEAN properties',NULL,'2.0.5',106,'EXECUTED'),('200903210905','mseaton','liquibase-update-to-latest.xml','2011-01-11 10:50:43','3:720bb7a3f71f0c0a911d3364e55dd72f','Create Table, Add Foreign Key Constraint (x3)','Add a table to enable generic storage of serialized objects',NULL,'1.9.4',-1,'EXECUTED'),('200903210905-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:25','3:a11519f50deeece1f9760d3fc1ac3f05','Modify Column','(Fixed)Add a table to enable generic storage of serialized objects',NULL,'2.0.5',1,'EXECUTED'),('20090402-1515-38-cohort','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:5c65821ef168d9e8296466be5990ae08','Add Column','Adding \"uuid\" column to cohort table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:8004d09d6e2a34623b8d0a13d6c38dc4','Add Column','Adding \"uuid\" column to concept table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_answer','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:adf3f4ebf7e0eb55eb6927dea7ce2a49','Add Column','Adding \"uuid\" column to concept_answer table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_class','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:f39e190a2e12c7a6163a0d8a82544228','Add Column','Adding \"uuid\" column to concept_class table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:d68b3f2323626fee7b433f873a019412','Add Column','Adding \"uuid\" column to concept_datatype table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_description','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:7d043672ede851c5dcd717171f953c75','Add Column','Adding \"uuid\" column to concept_description table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:c1884f56bd70a205b86e7c4038e6c6f9','Add Column','Adding \"uuid\" column to concept_map table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_name','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:822888c5ba1132f6783fbd032c21f238','Add Column','Adding \"uuid\" column to concept_name table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:dcb584d414ffd8133c97e42585bd34cd','Add Column','Adding \"uuid\" column to concept_name_tag table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:fe19ecccb704331741c227aa72597789','Add Column','Adding \"uuid\" column to concept_proposal table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_set','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:cdc72e16eaec2244c09e9e2fedf5806b','Add Column','Adding \"uuid\" column to concept_set table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:ad101415b93eaf653871eddd4fe4fc17','Add Column','Adding \"uuid\" column to concept_source table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:5ce8a6cdbfa8742b033b0b1c12e4cd42','Add Column','Adding \"uuid\" column to concept_state_conversion table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-drug','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:6869bd44f51cb7f63f758fbd8a7fe156','Add Column','Adding \"uuid\" column to drug table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-encounter','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:0808491f7ec59827a0415f2949b9d90e','Add Column','Adding \"uuid\" column to encounter table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-encounter_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:9aaac835f4d9579386990d4990ffb9d6','Add Column','Adding \"uuid\" column to encounter_type table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-field','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:dfee5fe509457ef12b14254bab9e6df5','Add Column','Adding \"uuid\" column to field table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-field_answer','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:c378494d6e9ae45b278c726256619cd7','Add Column','Adding \"uuid\" column to field_answer table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-field_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:dfb47f0b85d5bdad77f3a15cc4d180ec','Add Column','Adding \"uuid\" column to field_type table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-form','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:eb707ff99ed8ca2945a43175b904dea4','Add Column','Adding \"uuid\" column to form table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-form_field','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:45','3:635701ccda0484966f45f0e617119100','Add Column','Adding \"uuid\" column to form_field table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-global_property','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:1c62ba666b60eaa88ee3a90853f3bf59','Add Column','Adding \"uuid\" column to global_property table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:9c5015280eff821924416112922fd94d','Add Column','Adding \"uuid\" column to hl7_in_archive table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:35b94fc079e6de9ada4329a7bbc55645','Add Column','Adding \"uuid\" column to hl7_in_error table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:494d9eaaed055d0c5af4b4d85db2095d','Add Column','Adding \"uuid\" column to hl7_in_queue table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-hl7_source','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:8bc9839788ef5ab415ccf020eb04a1f7','Add Column','Adding \"uuid\" column to hl7_source table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-location','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:7e6b762f813310c72026677d540dee57','Add Column','Adding \"uuid\" column to location table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-location_tag','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:6a94a67e776662268d42f09cf7c66ac0','Add Column','Adding \"uuid\" column to location_tag table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-note','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:f0fd7b6750d07c973aad667b170cdfa8','Add Column','Adding \"uuid\" column to note table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-notification_alert','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:f2865558fb76c7584f6e86786b0ffdea','Add Column','Adding \"uuid\" column to notification_alert table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-notification_template','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:c05536d99eb2479211cb10010d48a2e9','Add Column','Adding \"uuid\" column to notification_template table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-obs','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:ba99d7eccba2185e9d5ebab98007e577','Add Column','Adding \"uuid\" column to obs table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-orders','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:732a2d4fd91690d544f0c63bdb65819f','Add Column','Adding \"uuid\" column to orders table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-order_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:137552884c5eb5af4c3f77c90df514cb','Add Column','Adding \"uuid\" column to order_type table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:1a9ddcd8997bcf1a9668051d397e41c1','Add Column','Adding \"uuid\" column to patient_identifier table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:6170d6caa73320fd2433fba0a16e8029','Add Column','Adding \"uuid\" column to patient_identifier_type table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-patient_program','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:8fb284b435669717f4b5aaa66e61fc10','Add Column','Adding \"uuid\" column to patient_program table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-patient_state','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:b67eb1bbd3e2912a646f56425c38631f','Add Column','Adding \"uuid\" column to patient_state table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-person','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:2b89eb77976b9159717e9d7b83c34cf1','Add Column','Adding \"uuid\" column to person table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-person_address','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:cfdb17b16b6d15477bc72d4d19ac3f29','Add Column','Adding \"uuid\" column to person_address table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-person_attribute','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:2f6b7fa688987b32d99cda348c6f6c46','Add Column','Adding \"uuid\" column to person_attribute table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:38d4dce320f2fc35db9dfcc2eafc093e','Add Column','Adding \"uuid\" column to person_attribute_type table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-person_name','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:339f02d6797870f9e7dd704f093b088c','Add Column','Adding \"uuid\" column to person_name table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-privilege','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:41f52c4340fdc9f0825ea9660edea8ec','Add Column','Adding \"uuid\" column to privilege table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-program','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:a72f80159cdbd576906cd3b9069d425b','Add Column','Adding \"uuid\" column to program table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-program_workflow','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:c69183f7e1614d5a338c0d0944f1e754','Add Column','Adding \"uuid\" column to program_workflow table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:e25b0fa351bb667af3ff562855f66bb6','Add Column','Adding \"uuid\" column to program_workflow_state table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-relationship','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:95407167e9f4984de1d710a83371ebd1','Add Column','Adding \"uuid\" column to relationship table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-relationship_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:f8755b127c004d11a43bfd6558be01b7','Add Column','Adding \"uuid\" column to relationship_type table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-report_object','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:b7ce0784e817be464370a3154fd4aa9c','Add Column','Adding \"uuid\" column to report_object table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:ce7ae79a3e3ce429a56fa658c48889b5','Add Column','Adding \"uuid\" column to report_schema_xml table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-role','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:f33887a0b51ab366d414e16202cf55db','Add Column','Adding \"uuid\" column to role table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1515-38-serialized_object','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:341cfbdff8ebf188d526bf3348619dcc','Add Column','Adding \"uuid\" column to serialized_object table',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-cohort','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:46','3:110084035197514c8d640b915230cf72','Update Data','Generating UUIDs for all rows in cohort table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:a44bc743cb837d88f7371282f3a5871e','Update Data','Generating UUIDs for all rows in concept table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_answer','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:f01d7278b153fa10a7d741607501ae1e','Update Data','Generating UUIDs for all rows in concept_answer table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_class','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:786f0ec8beec453ea9487f2e77f9fb4d','Update Data','Generating UUIDs for all rows in concept_class table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:b828e9851365ec70531dabd250374989','Update Data','Generating UUIDs for all rows in concept_datatype table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_description','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:37dbfc43c73553c9c9ecf11206714cc4','Update Data','Generating UUIDs for all rows in concept_description table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:e843f99c0371aabee21ca94fcef01f39','Update Data','Generating UUIDs for all rows in concept_map table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_name','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:dd414ae9367287c9c03342a79abd1d62','Update Data','Generating UUIDs for all rows in concept_name table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:cd7b5d0ceeb90b2254708b44c10d03e8','Update Data','Generating UUIDs for all rows in concept_name_tag table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:fb1cfa9c5decbafc3293f3dd1d87ff2b','Update Data','Generating UUIDs for all rows in concept_proposal table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_set','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:3b7f3851624014e740f89bc9a431feaa','Update Data','Generating UUIDs for all rows in concept_set table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:53da91ae3e39d7fb7ebca91df3bfd9a6','Update Data','Generating UUIDs for all rows in concept_source table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:23197d24e498ad86d4e001b183cc0c6b','Update Data','Generating UUIDs for all rows in concept_state_conversion table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-drug','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:40b47df80bd425337b7bdd8b41497967','Update Data','Generating UUIDs for all rows in drug table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-encounter','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:40146708b71d86d4c8c5340767a98f5e','Update Data','Generating UUIDs for all rows in encounter table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-encounter_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:47','3:738c6b6244a84fc8e6d582bcd472ffe6','Update Data','Generating UUIDs for all rows in encounter_type table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-field','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:98d2a1550e867e4ef303a4cc47ed904d','Update Data','Generating UUIDs for all rows in field table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-field_answer','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:82bdfe361286d261724eef97dd89e358','Update Data','Generating UUIDs for all rows in field_answer table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-field_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:19a8d007f6147651240ebb9539d3303a','Update Data','Generating UUIDs for all rows in field_type table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-form','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:026ddf1c9050c7367d4eb57dd4105322','Update Data','Generating UUIDs for all rows in form table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-form_field','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:a8b0bcdb35830c2badfdcb9b1cfdd3b5','Update Data','Generating UUIDs for all rows in form_field table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-global_property','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:75a5b4a9473bc9c6bfbabf8e77b0cda7','Update Data','Generating UUIDs for all rows in global_property table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:09891436d8ea0ad14f7b52fd05daa237','Update Data','Generating UUIDs for all rows in hl7_in_archive table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:8d276bbd8bf9d9d1c64756f37ef91ed3','Update Data','Generating UUIDs for all rows in hl7_in_error table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:25e8f998171accd46860717f93690ccc','Update Data','Generating UUIDs for all rows in hl7_in_queue table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-hl7_source','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:45c06e034d7158a0d09afae60c4c83d6','Update Data','Generating UUIDs for all rows in hl7_source table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-location','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:fce0f7eaab989f2ff9664fc66d6b8419','Update Data','Generating UUIDs for all rows in location table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-location_tag','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:50f26d1376ea108bbb65fd4d0633e741','Update Data','Generating UUIDs for all rows in location_tag table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-note','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:f5a0eea2a7c59fffafa674de4356e621','Update Data','Generating UUIDs for all rows in note table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-notification_alert','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:481fbab9bd53449903ac193894adbc28','Update Data','Generating UUIDs for all rows in notification_alert table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-notification_template','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:a4a2990465c4c99747f83ea880cac46a','Update Data','Generating UUIDs for all rows in notification_template table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-obs','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:26d80fdd889922821244f84e3f8039e7','Update Data','Generating UUIDs for all rows in obs table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-orders','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:ec3bc80540d78f416e1d4eef62e8e15a','Update Data','Generating UUIDs for all rows in orders table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-order_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:cae66b98b889c7ee1c8d6ab270a8d0d5','Update Data','Generating UUIDs for all rows in order_type table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:647906cc7cf1fde9b7644b8f2541664f','Update Data','Generating UUIDs for all rows in patient_identifier table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:85f8db0310c15a74b17e968c7730ae12','Update Data','Generating UUIDs for all rows in patient_identifier_type table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-patient_program','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:576b7db39f0212f8e92b6f4e1844ea30','Update Data','Generating UUIDs for all rows in patient_program table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-patient_state','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:250eab0f97fc4eeb4f1a930fbccfcf08','Update Data','Generating UUIDs for all rows in patient_state table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-person','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:cedc8bcd77ade51558fb2d12916e31a4','Update Data','Generating UUIDs for all rows in person table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-person_address','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:0f817424ca41e5c5b459591d6e18b3c6','Update Data','Generating UUIDs for all rows in person_address table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-person_attribute','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:7f9e09b1267c4a787a9d3e37acfd5746','Update Data','Generating UUIDs for all rows in person_attribute table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:1e5f84054b7b7fdf59673e2260f48d9d','Update Data','Generating UUIDs for all rows in person_attribute_type table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-person_name','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:f827da2c097b01ca9073c258b19e9540','Update Data','Generating UUIDs for all rows in person_name table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-privilege','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:2ab150a53c91ded0c5b53fa99fde4ba2','Update Data','Generating UUIDs for all rows in privilege table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-program','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:132b63f2efcf781187602e043122e7ff','Update Data','Generating UUIDs for all rows in program table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-program_workflow','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:d945359ed4bb6cc6a21f4554a0c50a33','Update Data','Generating UUIDs for all rows in program_workflow table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:4bc093882ac096562d63562ac76a1ffa','Update Data','Generating UUIDs for all rows in program_workflow_state table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-relationship','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:25e22c04ada4808cc31fd48f23703333','Update Data','Generating UUIDs for all rows in relationship table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-relationship_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:562ad77e9453595c9cd22a2cdde3cc41','Update Data','Generating UUIDs for all rows in relationship_type table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-report_object','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:8531f740c64a0d1605225536c1be0860','Update Data','Generating UUIDs for all rows in report_object table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:cd9efe4d62f2754b057d2d409d6e826a','Update Data','Generating UUIDs for all rows in report_schema_xml table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-role','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:f75bfc36ad13cb9324b9520804a60141','Update Data','Generating UUIDs for all rows in role table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1516-serialized_object','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:c809b71d2444a8a8e2c5e5574d344c82','Update Data','Generating UUIDs for all rows in serialized_object table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1517','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:48','3:4edd135921eb263d4811cf1c22ef4846','Custom Change','Adding UUIDs to all rows in all columns via a java class. (This will take a long time on large databases)',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1518','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:51','3:a9564fc8de85d37f4748a3fa1e69281c','Add Not-Null Constraint (x52)','Now that UUID generation is done, set the uuid columns to not \"NOT NULL\"',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-cohort','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:51','3:260c435f1cf3e3f01d953d630c7a578b','Create Index','Creating unique index on cohort.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:51','3:9e363ee4b39e7fdfb547e3a51ad187c7','Create Index','Creating unique index on concept.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_answer','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:52','3:34b049a3fd545928760968beb1e98e00','Create Index','Creating unique index on concept_answer.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_class','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:52','3:0fc95dccef2343850adb1fe49d60f3c3','Create Index','Creating unique index on concept_class.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_datatype','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:52','3:0cf065b0f780dc2eeca994628af49a34','Create Index','Creating unique index on concept_datatype.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_description','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:52','3:16ce0ad6c3e37071bbfcaad744693d0f','Create Index','Creating unique index on concept_description.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_map','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:53','3:b8a320c1d44ab94e785c9ae6c41378f3','Create Index','Creating unique index on concept_map.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_name','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:53','3:0d5866c0d3eadc8df09b1a7c160508ca','Create Index','Creating unique index on concept_name.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_name_tag','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:53','3:7ba597ec0fb5fbfba615ac97df642072','Create Index','Creating unique index on concept_name_tag.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_proposal','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:54','3:79f9f4af9669c2b03511832a23db55e0','Create Index','Creating unique index on concept_proposal.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_set','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:54','3:f5ba4e2d5ddd4ec66f43501b9749cf70','Create Index','Creating unique index on concept_set.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_source','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:54','3:c7c47d9c2876bfa53542885e304b21e7','Create Index','Creating unique index on concept_source.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-concept_state_conversion','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:54','3:cc9d9bb0d5eb9f6583cd538919b42b9a','Create Index','Creating unique index on concept_state_conversion.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-drug','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:54','3:8cac800e9f857e29698e1c80ab7e6a52','Create Index','Creating unique index on drug.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-encounter','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:55','3:8fd623411a44ffb0d4e3a4139e916585','Create Index','Creating unique index on encounter.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-encounter_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:55','3:71e0e1df8c290d8b6e81e281154661e0','Create Index','Creating unique index on encounter_type.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-field','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:55','3:36d9eba3e0a90061c6bf1c8aa483110e','Create Index','Creating unique index on field.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-field_answer','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:55','3:81572b572f758cac173b5d14516f600e','Create Index','Creating unique index on field_answer.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-field_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:55','3:a0c3927dfde900959131aeb1490a5f51','Create Index','Creating unique index on field_type.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-form','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:56','3:61147c780ce563776a1caed795661aca','Create Index','Creating unique index on form.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-form_field','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:56','3:bd9def4522865d181e42809f9dd5c116','Create Index','Creating unique index on form_field.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-global_property','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:56','3:0e6b84ad5fffa3fd49242b5475e8eb66','Create Index','Creating unique index on global_property.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-hl7_in_archive','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:57','3:d2f8921c170e416560c234aa74964346','Create Index','Creating unique index on hl7_in_archive.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-hl7_in_error','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:57','3:9ccec0729ea1b4eaa5068726f9045c25','Create Index','Creating unique index on hl7_in_error.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-hl7_in_queue','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:57','3:af537cb4134c3f2ed0357f3280ceb6fe','Create Index','Creating unique index on hl7_in_queue.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-hl7_source','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:57','3:a6d1847b6a590319206f65be9d1d3c9e','Create Index','Creating unique index on hl7_source.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-location','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:57','3:c435bd4b405d4f11d919777718aa055c','Create Index','Creating unique index on location.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-location_tag','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:57','3:33a8a54cde59b23a9cdb7740a9995e1a','Create Index','Creating unique index on location_tag.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-note','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:58','3:97279b2ce285e56613a10a77c5af32b2','Create Index','Creating unique index on note.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-notification_alert','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:58','3:a763255eddf8607f7d86afbb3099d4b5','Create Index','Creating unique index on notification_alert.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-notification_template','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:58','3:9a69bbb343077bc62acdf6a66498029a','Create Index','Creating unique index on notification_template.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-obs','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:58','3:de9a7a24e527542e6b4a73e2cd31a7f9','Create Index','Creating unique index on obs.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-orders','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:59','3:848c0a00a32c5eb25041ad058fd38263','Create Index','Creating unique index on orders.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-order_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:58','3:d938d263e0acf974d43ad81d2fbe05b0','Create Index','Creating unique index on order_type.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-patient_identifier','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:59','3:43389efa06408c8312d130654309d140','Create Index','Creating unique index on patient_identifier.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-patient_identifier_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:59','3:3ffe4f31a1c48d2545e8eed4127cc490','Create Index','Creating unique index on patient_identifier_type.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-patient_program','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:59','3:ce69defda5ba254914f2319f3a7aac02','Create Index','Creating unique index on patient_program.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-patient_state','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:59','3:a4ca15f62b3c8c43f7f47ef8b9e39cd3','Create Index','Creating unique index on patient_state.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-person','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:59','3:345a5d4e8dea4d56c1a0784e7b35a801','Create Index','Creating unique index on person.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-person_address','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:00','3:105ece744a45b624ea8990f152bb8300','Create Index','Creating unique index on person_address.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-person_attribute','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:00','3:67a8cdda8605c28f76314873d2606457','Create Index','Creating unique index on person_attribute.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-person_attribute_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:00','3:a234ad0ea13f32fc4529cf556151d611','Create Index','Creating unique index on person_attribute_type.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-person_name','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:01','3:d18e326ce221b4b1232ce2e355731338','Create Index','Creating unique index on person_name.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-privilege','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:01','3:47e7f70f34a213d870e2aeed795d5e3d','Create Index','Creating unique index on privilege.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-program','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:01','3:62f9d9ecd2325d5908237a769e9a8bc7','Create Index','Creating unique index on program.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-program_workflow','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:01','3:fabb3152f6055dc0071a2e5d6f573d2f','Create Index','Creating unique index on program_workflow.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-program_workflow_state','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:01','3:4fdf0c20aedcdc87b2c6058a1cc8fce7','Create Index','Creating unique index on program_workflow_state.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-relationship','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:02','3:c90617ca900b1aef3f29e71f693e8a25','Create Index','Creating unique index on relationship.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-relationship_type','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:02','3:c9f05aca70b6dad54af121b593587a29','Create Index','Creating unique index on relationship_type.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-report_object','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:02','3:6069b78580fd0d276f5dae9f3bdf21be','Create Index','Creating unique index on report_object.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-report_schema_xml','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:02','3:91499d332dda0577fd02b6a6b7b35e99','Create Index','Creating unique index on report_schema_xml.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-role','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:02','3:c535a800ceb006311bbb7a27e8bab6ea','Create Index','Creating unique index on role.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090402-1519-serialized_object','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:02','3:e8f2b1c3a7a67aadc8499ebcb522c91a','Create Index','Creating unique index on serialized_object.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090408-1298','Cory McCarthy','liquibase-update-to-latest.xml','2011-01-11 10:50:43','3:defbd13a058ba3563e232c2093cd2b37','Modify Column','Changed the datatype for encounter_type to \'text\' instead of just 50 chars',NULL,'1.9.4',-1,'EXECUTED'),('200904091023','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:43','3:48adc23e9c5d820a87f6c8d61dfb6b55','Delete Data (x4)','Remove Manage Tribes and View Tribes privileges from the privilege table and role_privilege table.\n			The privileges will be recreated by the Tribe module if it is installed.',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0804','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:05','3:479b4df8e3c746b5b96eeea422799774','Drop Foreign Key Constraint','Dropping foreign key on concept_set.concept_id table',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0805','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:05','3:5017417439ff841eb036ceb94f3c5800','Drop Primary Key','Dropping primary key on concept set table',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0806','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:05','3:6b9cec59fd607569228bf87d4dffa1a5','Add Column','Adding new integer primary key to concept set table',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0807','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:06','3:57834f6c953f34035237e06a2dbed9c7','Create Index, Add Foreign Key Constraint','Adding index and foreign key to concept_set.concept_id column',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0808a','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:08','3:6c9d9e6b85c1bf04fdbf9fdec316f2ea','Drop Foreign Key Constraint','Dropping foreign key on patient_identifier.patient_id column',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0808b','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:08','3:12e01363841135ed0dae46d71e7694cf','Drop Primary Key','Dropping non-integer primary key on patient identifier table before adding a new integer primary key',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0809','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:08','3:864765efa4cae1c8ffb1138d63f77017','Add Column','Adding new integer primary key to patient identifier table',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0810','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:08','3:4ca46ee358567e35c897a73c065e3367','Create Index, Add Foreign Key Constraint','Adding index and foreign key on patient_identifier.patient_id column',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0811a','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:12','3:f027a0ad38c0f6302def391da78aaaee','Drop Foreign Key Constraint','Dropping foreign key on concept_word.concept_id column',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0811b','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:13','3:982d502e56854922542286cead4c09ce','Drop Primary Key','Dropping non-integer primary key on concept word table before adding new integer one',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0812','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:14','3:948e635fe3f63122856ca9b8a174352b','Add Column','Adding integer primary key to concept word table',NULL,'1.9.4',-1,'EXECUTED'),('20090414-0812b','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:15','3:bd7731e58f3db9b944905597a08eb6cb','Add Foreign Key Constraint','Re-adding foreign key for concept_word.concept_name_id',NULL,'1.9.4',-1,'EXECUTED'),('200904271042','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:db63ce704aff4741c52181d1c825ab62','Drop Column','Remove the now unused synonym column',NULL,'1.9.4',-1,'EXECUTED'),('20090428-0811aa','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:13','3:58d8f3df1fe704714a7b4957a6c0e7f7','Drop Foreign Key Constraint','Removing concept_word.concept_name_id foreign key so that primary key can be changed to concept_word_id',NULL,'1.9.4',-1,'EXECUTED'),('20090428-0854','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:18','3:11086a37155507c0238c9532f66b172b','Add Foreign Key Constraint','Adding foreign key for concept_word.concept_id column',NULL,'1.9.4',-1,'EXECUTED'),('200905071626','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:44','3:d29884c3ef8fd867c3c2ffbd557c14c2','Create Index','Add an index to the concept_word.concept_id column (This update may fail if it already exists)',NULL,'1.9.4',-1,'EXECUTED'),('200905150814','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:50:43','3:44c729b393232d702553e0768cf94994','Delete Data','Deleting invalid concept words',NULL,'1.9.4',-1,'EXECUTED'),('200905150821','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:41','3:c0b7abc7eb00f243325b4a3fb2afc614','Custom SQL','Deleting duplicate concept word keys',NULL,'1.9.4',-1,'EXECUTED'),('200906301606','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:de40c56c128997509d1d943ed047c5d2','Modify Column','Change person_attribute_type.sort_weight from an integer to a float',NULL,'1.9.4',-1,'EXECUTED'),('200907161638-1','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:dfd352bdc4c5e6c88cd040d03c782e31','Modify Column','Change obs.value_numeric from a double(22,0) to a double',NULL,'1.9.4',-1,'EXECUTED'),('200907161638-2','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:a8dc0bd1593e6c99a02db443bc4cb001','Modify Column','Change concept_numeric columns from a double(22,0) type to a double',NULL,'1.9.4',-1,'EXECUTED'),('200907161638-3','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:47b8adbcd480660765dd117020a1e085','Modify Column','Change concept_set.sort_weight from a double(22,0) to a double',NULL,'1.9.4',-1,'EXECUTED'),('200907161638-4','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:3ffccaa291298fea317eb7025c058492','Modify Column','Change concept_set_derived.sort_weight from a double(22,0) to a double',NULL,'1.9.4',-1,'EXECUTED'),('200907161638-5','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:3b31cf625830c7e37fa638dbf9625000','Modify Column','Change drug table columns from a double(22,0) to a double',NULL,'1.9.4',-1,'EXECUTED'),('200907161638-6','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:dc733faec1539038854c0b559b45da0e','Modify Column','Change drug_order.dose from a double(22,0) to a double',NULL,'1.9.4',-1,'EXECUTED'),('200908291938-1','dthomas','liquibase-update-to-latest.xml','2011-01-11 10:51:45','3:b99a6d7349d367c30e8b404979e07b89','Modify Column','set hl7_code in ConceptSource to nullable column',NULL,'1.9.4',-1,'EXECUTED'),('200908291938-2a','dthomas','liquibase-update-to-latest.xml','2011-01-11 10:51:45','3:7e9e8d9bffcb6e602b155827f72a3856','Modify Column','set retired in ConceptSource to tinyint(1) not null',NULL,'1.9.4',-1,'EXECUTED'),('20090831-1039-38-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:54e254379235d5c8b569a00ac7dc9c3f','Add Column','Adding \"uuid\" column to scheduler_task_config table',NULL,'1.9.4',-1,'EXECUTED'),('20090831-1040-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:a9b26bdab35405050c052a9a3f763db0','Update Data','Generating UUIDs for all rows in scheduler_task_config table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20090831-1041-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:25127273b2d501664ce325922b0c7db2','Custom Change','Adding UUIDs to all rows in scheduler_task_config table via a java class for non mysql/oracle/mssql databases.',NULL,'1.9.4',-1,'EXECUTED'),('20090831-1042-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:76d8a8b5d342fc4111034861537315cf','Add Not-Null Constraint','Now that UUID generation is done for scheduler_task_config, set the uuid column to not \"NOT NULL\"',NULL,'1.9.4',-1,'EXECUTED'),('20090831-1043-scheduler_task_config','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:5408ed04284c4f5d57f5160ca5393733','Create Index','Creating unique index on scheduler_task_config.uuid column',NULL,'1.9.4',-1,'EXECUTED'),('20090907-1','Knoll_Frank','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:d6f3ed289cdbce6229b1414ec626a33c','Rename Column','Rename the concept_source.date_voided column to date_retired',NULL,'1.9.4',-1,'EXECUTED'),('20090907-2a','Knoll_Frank','liquibase-update-to-latest.xml','2011-01-11 10:51:45','3:b71e307e4e782cc5a851f764aa7fc0d0','Drop Foreign Key Constraint','Remove the concept_source.voided_by foreign key constraint',NULL,'1.9.4',-1,'EXECUTED'),('20090907-2b','Knoll_Frank','liquibase-update-to-latest.xml','2011-01-11 10:51:45','3:14e07ebc0a1138ee973bbb26b568d16e','Rename Column, Add Foreign Key Constraint','Rename the concept_source.voided_by column to retired_by',NULL,'1.9.4',-1,'EXECUTED'),('20090907-3','Knoll_Frank','liquibase-update-to-latest.xml','2011-01-11 10:51:45','3:adee9ced82158f9a9f3d64245ad591c6','Rename Column','Rename the concept_source.voided column to retired',NULL,'1.9.4',-1,'EXECUTED'),('20090907-4','Knoll_Frank','liquibase-update-to-latest.xml','2011-01-11 10:51:45','3:ad9b6ed4ef3ae43556d3e8c9e2ec0f5c','Rename Column','Rename the concept_source.void_reason column to retire_reason',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-1','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:51:48',NULL,'Create Table','Create logic token table to store all registered token',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-2','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:51:51',NULL,'Create Table','Create logic token tag table to store all tag associated with a token',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-3','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:51:54',NULL,'Add Foreign Key Constraint','Adding foreign key for primary key of logic_rule_token_tag',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-4a','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:51:57',NULL,'Drop Foreign Key Constraint','Removing bad foreign key for logic_rule_token.creator',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-4aa','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:52:01',NULL,'Drop Foreign Key Constraint','Removing bad foreign key for logic_rule_token.creator',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-4b','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:52:04',NULL,'Add Foreign Key Constraint','Adding correct foreign key for logic_rule_token.creator',NULL,'1.9.4',-1,'EXECUTED'),('200909281005-5a','nribeka','liquibase-update-to-latest.xml','2011-01-11 10:52:09',NULL,'Add Foreign Key Constraint','Adding foreign key for logic_rule_token.changed_by',NULL,'1.9.4',-1,'EXECUTED'),('20091001-1023','rcrichton','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:2bf99392005da4e95178bd1e2c28a87b','Add Column','add retired column to relationship_type table',NULL,'1.9.4',-1,'EXECUTED'),('20091001-1024','rcrichton','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:31b7b10f75047606406cea156bcc255f','Add Column','add retired_by column to relationship_type table',NULL,'1.9.4',-1,'EXECUTED'),('20091001-1025','rcrichton','liquibase-update-to-latest.xml','2011-01-11 10:52:16','3:c6dd75893e5573baa0c7426ecccaa92d','Add Foreign Key Constraint','Create the foreign key from the relationship.retired_by to users.user_id.',NULL,'1.9.4',-1,'EXECUTED'),('20091001-1026','rcrichton','liquibase-update-to-latest.xml','2011-01-11 10:52:16','3:47cfbab54a8049948784a165ffe830af','Add Column','add date_retired column to relationship_type table',NULL,'1.9.4',-1,'EXECUTED'),('20091001-1027','rcrichton','liquibase-update-to-latest.xml','2011-01-11 10:52:16','3:2db32da70ac1e319909d692110b8654b','Add Column','add retire_reason column to relationship_type table',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-1','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:2e54d97b9f1b9f35b77cee691c23b7a9','Update Data (x5)','Setting core field types to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-10','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:827070940f217296c11ce332dc8858ff','Update Data (x4)','Setting core roles to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-2','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:3132d4cbfaab0c0b612c3fe1c55bd0f1','Update Data (x7)','Setting core person attribute types to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-3','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:f4d1a9004f91b6885a86419bc02f9d0b','Update Data (x4)','Setting core encounter types to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-4','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:0d4f7503bf8f00cb73338bb34305333a','Update Data (x12)','Setting core concept datatypes to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-5','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:98d8ac75977e1b099a4e45d96c6b1d1a','Update Data (x4)','Setting core relationship types to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-6','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:19355a03794869edad3889ac0adbdedf','Update Data (x15)','Setting core concept classes to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-7','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:fe4c89654d02d74de6d8e4b265a33288','Update Data (x2)','Setting core patient identifier types to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-8','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:dc4462b5b4b13c2bc306506848127556','Update Data','Setting core location to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200910271049-9','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:de2a0ed2adafb53f025039e9e8c6719e','Update Data','Setting core hl7 source to have standard UUIDs',NULL,'1.9.4',-1,'EXECUTED'),('200912031842','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:b966745213bedaeeabab8a874084bb95','Drop Foreign Key Constraint, Add Foreign Key Constraint','Changing encounter.provider_id to reference person instead of users',NULL,'1.9.4',-1,'EXECUTED'),('200912031846-1','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:23e728a7f214127cb91efd40ebbcc2d1','Drop Foreign Key Constraint, Add Column, Update Data','Adding person_id column to users table',NULL,'1.9.4',-1,'EXECUTED'),('200912031846-2','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:8d57907defa7e92e018038d57cfa78b4','Update Data, Add Not-Null Constraint','Populating users.person_id',NULL,'1.9.4',-1,'EXECUTED'),('200912031846-3','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:48a50742f2904682caa1bc469f5b87e3','Add Foreign Key Constraint, Set Column as Auto-Increment','Restoring foreign key constraint on users.person_id',NULL,'1.9.4',-1,'EXECUTED'),('200912071501-1','arthurs','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:d1158b8a42127d7b8a4d5ad64cc7c225','Update Data','Change name for patient.searchMaxResults global property to person.searchMaxResults',NULL,'1.9.4',-1,'EXECUTED'),('200912091819','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:8c0b2b02a94b9c6c9529e1b29207464b','Add Column, Add Foreign Key Constraint','Adding retired metadata columns to users table',NULL,'1.9.4',-1,'EXECUTED'),('200912091819-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:32','3:fd5fd1d2e6884662824bb78c8348fadf','Modify Column','(Fixed)users.retired to BOOLEAN',NULL,'2.0.5',4,'EXECUTED'),('200912091820','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:cba73499d1c4d09b0e4ae3b55ecc7d84','Update Data','Migrating voided metadata to retired metadata for users table',NULL,'1.9.4',-1,'EXECUTED'),('200912091821','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:9b38d31ebfe427d1f8d6e8530687f29c','Drop Foreign Key Constraint, Drop Column (x4)','Dropping voided metadata columns from users table',NULL,'1.9.4',-1,'EXECUTED'),('200912140038','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:be3aaa8da16b8a8841509faaeff070b4','Add Column','Adding \"uuid\" column to users table',NULL,'1.9.4',-1,'EXECUTED'),('200912140039','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:5b2a81ac1efba5495962bfb86e51546d','Update Data','Generating UUIDs for all rows in users table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('200912140040','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:c422b96e5b88eeae4f343d4f988cc4b2','Custom Change','Adding UUIDs to users table via a java class. (This will take a long time on large databases)',NULL,'1.9.4',-1,'EXECUTED'),('200912141000-drug-add-date-changed','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:46:03','3:9c9a75e3a78104e72de078ac217b0972','Add Column','Add date_changed column to drug table',NULL,'2.0.5',143,'EXECUTED'),('200912141001-drug-add-changed-by','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:46:04','3:196629c722f52df68b5040e5266ac20f','Add Column, Add Foreign Key Constraint','Add changed_by column to drug table',NULL,'2.0.5',144,'EXECUTED'),('200912141552','madanmohan','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:835b6b98a7a437d959255ac666c12759','Add Column, Add Foreign Key Constraint','Add changed_by column to encounter table',NULL,'1.9.4',-1,'EXECUTED'),('200912141553','madanmohan','liquibase-update-to-latest.xml','2011-01-11 10:52:09','3:7f768aa879beac091501ac9bb47ece4d','Add Column','Add date_changed column to encounter table',NULL,'1.9.4',-1,'EXECUTED'),('20091215-0208','sunbiz','liquibase-update-to-latest.xml','2011-01-11 10:52:16','3:1c818a60d8ebc36f4b7911051c1f6764','Custom SQL','Prune concepts rows orphaned in concept_numeric tables',NULL,'1.9.4',-1,'EXECUTED'),('20091215-0209','jmiranda','liquibase-update-to-latest.xml','2011-01-11 10:52:16','3:adeadc55e4dd484b1d63cf123e299371','Custom SQL','Prune concepts rows orphaned in concept_complex tables',NULL,'1.9.4',-1,'EXECUTED'),('20091215-0210','jmiranda','liquibase-update-to-latest.xml','2011-01-11 10:52:16','3:08e8550629e4d5938494500f61d10961','Custom SQL','Prune concepts rows orphaned in concept_derived tables',NULL,'1.9.4',-1,'EXECUTED'),('200912151032','n.nehete','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:d7d8fededde8a27384ca1eb3f87f7914','Add Not-Null Constraint','Encounter Type should not be null when saving an Encounter',NULL,'1.9.4',-1,'EXECUTED'),('200912211118','nribeka','liquibase-update-to-latest.xml','2013-01-17 14:45:28','3:1f976b4eedf537d887451246d49db043','Add Column','Adding language column to concept_derived table',NULL,'2.0.5',2,'EXECUTED'),('201001072007','upul','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:d5d60060fae8e9c30843b16b23bed9db','Add Column','Add last execution time column to scheduler_task_config table',NULL,'1.9.4',-1,'EXECUTED'),('20100111-0111-associating-daemon-user-with-person','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:bebb5c508bb53e7d5be6fb3aa259bd2f','Custom SQL','Associating daemon user with a person',NULL,'2.0.5',136,'EXECUTED'),('20100128-1','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:eaa1b8e62aa32654480e7a476dc14a4a','Insert Row','Adding \'System Developer\' role again (see ticket #1499)',NULL,'1.9.4',-1,'EXECUTED'),('20100128-2','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:3c486c2ea731dfad7905518cac8d6e70','Update Data','Switching users back from \'Administrator\' to \'System Developer\' (see ticket #1499)',NULL,'1.9.4',-1,'EXECUTED'),('20100128-3','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:51:42','3:9acf8cae5d210f88006191e79b76532c','Delete Data','Deleting \'Administrator\' role (see ticket #1499)',NULL,'1.9.4',-1,'EXECUTED'),('20100306-095513a','thilini.hg','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:b7a60c3c33a05a71dde5a26f35d85851','Drop Foreign Key Constraint','Dropping unused foreign key from notification alert table',NULL,'1.9.4',-1,'EXECUTED'),('20100306-095513b','thilini.hg','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:8a6ebb6aefe04b470d5b3878485f9cc3','Drop Column','Dropping unused user_id column from notification alert table',NULL,'1.9.4',-1,'EXECUTED'),('20100322-0908','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:94a8aae1d463754d7125cd546b4c590c','Add Column, Update Data','Adding sort_weight column to concept_answers table and initially sets the sort_weight to the concept_answer_id',NULL,'1.9.4',-1,'EXECUTED'),('20100323-192043','ricardosbarbosa','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:c294c84ac7ff884d1e618f4eb74b0c52','Update Data, Delete Data (x2)','Removing the duplicate privilege \'Add Concept Proposal\' in favor of \'Add Concept Proposals\'',NULL,'1.9.4',-1,'EXECUTED'),('20100330-190413','ricardosbarbosa','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:d706294defdfb73af9b44db7d37069d0','Update Data, Delete Data (x2)','Removing the duplicate privilege \'Edit Concept Proposal\' in favor of \'Edit Concept Proposals\'',NULL,'1.9.4',-1,'EXECUTED'),('20100412-2217','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:0c3a3ea15adefa620ab62145f412d0b6','Add Column','Adding \"uuid\" column to notification_alert_recipient table',NULL,'1.9.4',-1,'EXECUTED'),('20100412-2218','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:6fae383b5548c214d2ad2c76346e32e3','Update Data','Generating UUIDs for all rows in notification_alert_recipient table via built in uuid function.',NULL,'1.9.4',-1,'EXECUTED'),('20100412-2219','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:1401fe5f2d0c6bc23afa70b162e15346','Custom Change','Adding UUIDs to notification_alert_recipient table via a java class (if needed).',NULL,'1.9.4',-1,'EXECUTED'),('20100412-2220','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:bf4474dd5700b570e158ddc8250c470b','Add Not-Null Constraint','Now that UUID generation is done, set the notification_alert_recipient.uuid column to not \"NOT NULL\"',NULL,'1.9.4',-1,'EXECUTED'),('20100413-1509','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:19','3:7a3ee61077e4dee1ceb4fe127afc835f','Rename Column','Change location_tag.tag to location_tag.name',NULL,'1.9.4',-1,'EXECUTED'),('20100415-forgotten-from-before','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:13','3:d17699fbec80bd035ecb348ae5382754','Add Not-Null Constraint','Adding not null constraint to users.uuid',NULL,'1.9.4',-1,'EXECUTED'),('20100419-1209','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:f87b773f9a8e05892fdbe8740042abb5','Create Table, Add Foreign Key Constraint (x7), Create Index','Create the visit table and add the foreign key for visit_type',NULL,'2.0.5',57,'EXECUTED'),('20100419-1209-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:cb5970216f918522df3a059e29506c27','Modify Column','(Fixed)Changed visit.voided to BOOLEAN',NULL,'2.0.5',58,'EXECUTED'),('20100423-1402','slorenz','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:3534020f1c68f70b0e9851d47a4874d6','Create Index','Add an index to the encounter.encounter_datetime column to speed up statistical\n			analysis.',NULL,'1.9.4',-1,'EXECUTED'),('20100423-1406','slorenz','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:f058162398862f0bdebc12d7eb54551b','Create Index','Add an index to the obs.obs_datetime column to speed up statistical analysis.',NULL,'1.9.4',-1,'EXECUTED'),('20100426-1111-add-not-null-personid-contraint','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:a0b90b98be85aabbdebd957744ab805a','Add Not-Null Constraint','Add the not null person id contraint',NULL,'2.0.5',137,'EXECUTED'),('20100426-1111-remove-not-null-personid-contraint','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:45:32','3:5bc2abe108ab2765e36294ff465c63a0','Drop Not-Null Constraint','Drop the not null person id contraint',NULL,'2.0.5',6,'EXECUTED'),('20100426-1947','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:09adbdc9cb72dee82e67080b01d6578e','Insert Row','Adding daemon user to users table',NULL,'1.9.4',-1,'EXECUTED'),('20100427-1334','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:19',NULL,'Modify Column','Changing the datatype of global_property.property for mysql databases',NULL,'1.9.4',-1,'EXECUTED'),('20100512-1400','djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:0fbfb53e2e194543d7b3eaa59834e1e6','Insert Row','Create core order_type for drug orders',NULL,'1.9.4',-1,'EXECUTED'),('20100513-1947','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:068c2bd55d9c731941fe9ef66f0011fb','Delete Data (x2)','Removing scheduler.username and scheduler.password global properties',NULL,'1.9.4',-1,'EXECUTED'),('20100517-1545','wyclif and djazayeri','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:39a68e6b1954a0954d0f8d0c660a7aff','Custom Change','Switch boolean concepts/observations to be stored as coded',NULL,'1.9.4',-1,'EXECUTED'),('20100525-818-1','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:23','3:ed9dcb5bd0d7312db3123825f9bb4347','Create Table, Add Foreign Key Constraint (x2)','Create active list type table.',NULL,'1.9.4',-1,'EXECUTED'),('20100525-818-1-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:32','3:4a648a54797fef2222764a7ee0b5e05a','Modify Column','(Fixed)Change active_list_type.retired to BOOLEAN',NULL,'2.0.5',7,'EXECUTED'),('20100525-818-2','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:26','3:bc5a86f0245f6f822a0d343b2fcf8dc6','Create Table, Add Foreign Key Constraint (x7)','Create active list table',NULL,'1.9.4',-1,'EXECUTED'),('20100525-818-2-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:32','3:0a2879b368319f6d1e16d0d4417f4492','Modify Column','(Fixed)Change active_list_type.retired to BOOLEAN',NULL,'2.0.5',8,'EXECUTED'),('20100525-818-3','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:29','3:d382e7b9e23cdcc33ccde2d3f0473c41','Create Table, Add Foreign Key Constraint','Create allergen table',NULL,'1.9.4',-1,'EXECUTED'),('20100525-818-4','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:32','3:1d6f1abd297c8da5a49d4885d0d34dfb','Create Table','Create problem table',NULL,'1.9.4',-1,'EXECUTED'),('20100525-818-5','syhaas','liquibase-update-to-latest.xml','2011-01-11 10:52:32','3:2ac51b2e8813d61428367bad9fadaa33','Insert Row (x2)','Inserting default active list types',NULL,'1.9.4',-1,'EXECUTED'),('20100526-1025','Harsha.cse','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:66ec6553564d30fd63df7c2de41c674f','Drop Not-Null Constraint (x2)','Drop Not-Null constraint from location column in Encounter and Obs table',NULL,'1.9.4',-1,'EXECUTED'),('20100603-1625-1-person_address','sapna','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:6048aa2c393c1349de55a5003199fb81','Add Column','Adding \"date_changed\" column to person_address table',NULL,'2.0.5',36,'EXECUTED'),('20100603-1625-2-person_address','sapna','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:5194e3b45b70b003e33d7ab0495f3015','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to person_address table',NULL,'2.0.5',37,'EXECUTED'),('20100604-0933a','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:9b51b236846a8940de581e199cd76cb2','Add Default Value','Changing the default value to 2 for \'message_state\' column in \'hl7_in_archive\' table',NULL,'1.9.4',-1,'EXECUTED'),('20100604-0933b','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:20','3:67fc4c12418b500aaf3723e8845429e3','Update Data','Converting 0 and 1 to 2 for \'message_state\' column in \'hl7_in_archive\' table',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550a','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:33','3:bfb6250277efd8c81326fe8c3dbdfe35','Add Column','Adding \'concept_name_type\' column to concept_name table',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550b','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:33','3:3d43124d8265fbf05f1ef4839f14bece','Add Column','Adding \'locale_preferred\' column to concept_name table',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550b-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:35','3:d0dc8dfe3ac629aecee81ccc11dec9c2','Modify Column','(Fixed)Change concept_name.locale_preferred to BOOLEAN',NULL,'2.0.5',9,'EXECUTED'),('20100607-1550c','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:38','3:b6573617d37609ae7195fd7a495e2776','Drop Foreign Key Constraint','Dropping foreign key constraint on concept_name_tag_map.concept_name_tag_id',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550d','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:39','3:f30fd17874ac8294389ee2a44ca7d6ab','Update Data, Delete Data (x2)','Setting the concept name type for short names',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550e','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:39','3:0788cd1c32391234a8f0c655897fca24','Update Data, Delete Data (x2)','Converting preferred names to FULLY_SPECIFIED names',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550f','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:39','3:b57c0f651ed477457fd16e503eaf51a4','Update Data, Delete Data (x2)','Converting concept names with country specific concept name tags to preferred names',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550g','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:39','3:c3c0a17e0a21d36f38bb2af8f0939da7','Delete Data (x2)','Deleting \'default\' and \'synonym\' concept name tags',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550h','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:42','3:be7b967ed0e7006373bb616b63726144','Custom Change','Validating and attempting to fix invalid concepts and ConceptNames',NULL,'1.9.4',-1,'EXECUTED'),('20100607-1550i','wyclif','liquibase-update-to-latest.xml','2011-01-11 10:52:46','3:b6260c13bf055f7917c155596502a24b','Add Foreign Key Constraint','Restoring foreign key constraint on concept_name_tag_map.concept_name_tag_id',NULL,'1.9.4',-1,'EXECUTED'),('20100621-1443','jkeiper','liquibase-update-to-latest.xml','2013-01-17 14:45:35','3:16b4bc3512029cf8d3b3c6bee86ed712','Modify Column','Modify the error_details column of hl7_in_error to hold\n			stacktraces',NULL,'2.0.5',10,'EXECUTED'),('201008021047','bwolfe','liquibase-update-to-latest.xml','2011-01-11 10:52:46','3:8612ede2553aab53950fa43d2f8def32','Create Index','Add an index to the person_name.family_name2 to speed up patient and person searches',NULL,'1.9.4',-1,'EXECUTED'),('201008201345','mseaton','liquibase-update-to-latest.xml','2013-01-17 14:45:36','3:5fbbb6215e66847c86483ee7177c3682','Custom Change','Validates Program Workflow States for possible configuration problems and reports warnings',NULL,'2.0.5',11,'EXECUTED'),('201008242121','misha680','liquibase-update-to-latest.xml','2013-01-17 14:45:36','3:2319aed08c4f6dcd43d4ace5cdf94650','Modify Column','Make person_name.person_id not NULLable',NULL,'2.0.5',12,'EXECUTED'),('20100924-1110','mseaton','liquibase-update-to-latest.xml','2013-01-17 14:45:36','3:05ea5f3b806ba47f4a749d3a348c59f7','Add Column, Add Foreign Key Constraint','Add location_id column to patient_program table',NULL,'2.0.5',13,'EXECUTED'),('201009281047','misha680','liquibase-update-to-latest.xml','2013-01-17 14:45:37','3:02b5b9a183729968cd4189798ca034bd','Drop Column','Remove the now unused default_charge column',NULL,'2.0.5',14,'EXECUTED'),('201010051745','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:37','3:04ba6f526a71fc0a2b016fd77eaf9ff5','Update Data','Setting the global property \'patient.identifierRegex\' to an empty string',NULL,'2.0.5',15,'EXECUTED'),('201010051746','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:37','3:cb12dfc563d82529de170ffedf948f90','Update Data','Setting the global property \'patient.identifierSuffix\' to an empty string',NULL,'2.0.5',16,'EXECUTED'),('201010151054','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:45:41','3:26c8ae0c53225f82d4c2a85c09ad9785','Create Index','Adding index to form.published column',NULL,'2.0.5',17,'EXECUTED'),('201010151055','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:45:43','3:1efabdfd082ff2b0a34f570831f74ce5','Create Index','Adding index to form.retired column',NULL,'2.0.5',18,'EXECUTED'),('201010151056','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:45:44','3:00273104184bb4d2bb7155befc77efc3','Create Index','Adding multi column index on form.published and form.retired columns',NULL,'2.0.5',19,'EXECUTED'),('201010261143','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:44','3:c02de7e2726893f80ecd1f3ae778cba5','Rename Column','Rename neighborhood_cell column to address3 and increase the size to 255 characters',NULL,'2.0.5',20,'EXECUTED'),('201010261145','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:2d053c2e9b604403df8a408a6bb4f3f8','Rename Column','Rename township_division column to address4 and increase the size to 255 characters',NULL,'2.0.5',21,'EXECUTED'),('201010261147','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:592eee2241fdb1039ba08be07b54a422','Rename Column','Rename subregion column to address5 and increase the size to 255 characters',NULL,'2.0.5',22,'EXECUTED'),('201010261149','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:059e5bf4092d930304f9f0fc305939d9','Rename Column','Rename region column to address6 and increase the size to 255 characters',NULL,'2.0.5',23,'EXECUTED'),('201010261151','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:8756b20f505f8981a43ece7233ce3e2f','Rename Column','Rename neighborhood_cell column to address3 and increase the size to 255 characters',NULL,'2.0.5',24,'EXECUTED'),('201010261153','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:9805b9a214fca5a3509a82864274678e','Rename Column','Rename township_division column to address4 and increase the size to 255 characters',NULL,'2.0.5',25,'EXECUTED'),('201010261156','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:894f4e47fbdc74be94e6ebc9d6fce91e','Rename Column','Rename subregion column to address5 and increase the size to 255 characters',NULL,'2.0.5',26,'EXECUTED'),('201010261159','crecabarren','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:b1827790c63813e6a73d83e2b2d36504','Rename Column','Rename region column to address6 and increase the size to 255 characters',NULL,'2.0.5',27,'EXECUTED'),('20101029-1016','gobi/prasann','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:714ad65f5d84bdcd4d944a4d5583e4d3','Create Table, Add Unique Constraint','Create table to store concept stop words to avoid in search key indexing',NULL,'2.0.5',40,'EXECUTED'),('20101029-1026','gobi/prasann','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:83534d43a9a9cc1ea3a80f1d5f5570af','Insert Row (x10)','Inserting the initial concept stop words',NULL,'2.0.5',41,'EXECUTED'),('201011011600','jkeiper','liquibase-update-to-latest.xml','2011-01-11 10:52:43','3:29b35d66dc4168e03e1844296e309327','Create Index','Adding index to message_state column in HL7 archive table',NULL,'1.9.4',-1,'EXECUTED'),('201011011605','jkeiper','liquibase-update-to-latest.xml','2011-01-11 10:52:43','3:c604bc0967765f50145f76e80a4bbc99','Custom Change','Moving \"deleted\" HL7s from HL7 archive table to queue table',NULL,'1.9.4',-1,'EXECUTED'),('201011051300','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:fea4ad8ce44911eeaab8ac8c1cc9122d','Create Index','Adding index on notification_alert.date_to_expire column',NULL,'2.0.5',35,'EXECUTED'),('201012081716','nribeka','liquibase-update-to-latest.xml','2013-01-17 14:45:48','3:4a97a93f2632fc0c3b088b24535ee481','Delete Data','Removing concept that are concept derived and the datatype',NULL,'2.0.5',33,'EXECUTED'),('201012081717','nribeka','liquibase-update-to-latest.xml','2013-01-17 14:45:48','3:ad3d0a18bda7e4869d264c70b8cd8d1d','Drop Table','Removing concept derived tables',NULL,'2.0.5',34,'EXECUTED'),('20101209-10000-encounter-add-visit-id-column','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:7045a94731ef25e04724c77fc97494b4','Add Column, Add Foreign Key Constraint','Adding visit_id column to encounter table',NULL,'2.0.5',59,'EXECUTED'),('20101209-1353','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:9d30d1435a6c10a4b135609dc8e925ca','Add Not-Null Constraint','Adding not-null constraint to orders.as_needed',NULL,'2.0.5',180,'MARK_RAN'),('20101209-1721','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:46','3:351460e0f822555b77acff1a89bec267','Add Column','Add \'weight\' column to concept_word table',NULL,'2.0.5',29,'EXECUTED'),('20101209-1722','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:48','3:d63107017bdcef0e28d7ad5e4df21ae5','Create Index','Adding index to concept_word.weight column',NULL,'2.0.5',30,'EXECUTED'),('20101209-1723','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:48','3:25d45d7d5bbff4b24bcc8ff8d34d70d2','Insert Row','Insert a row into the schedule_task_config table for the ConceptIndexUpdateTask',NULL,'2.0.5',31,'EXECUTED'),('20101209-1731','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:48','3:6de3e859f77856fe939d3ae6a73b4752','Update Data','Setting the value of \'start_on_startup\' to trigger off conceptIndexUpdateTask on startup',NULL,'2.0.5',32,'MARK_RAN'),('201012092009','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:45','3:15a029c4ffe65710a56d402e608d319a','Modify Column (x10)','Increasing length of address fields in person_address and location to 255',NULL,'2.0.5',28,'EXECUTED'),('2011-07-12-1947-add-outcomesConcept-to-program','grwarren','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:ea2bb0a2ddeade662f956ef113d020ab','Add Column, Add Foreign Key Constraint','Adding the outcomesConcept property to Program',NULL,'2.0.5',70,'EXECUTED'),('2011-07-12-2005-add-outcome-to-patientprogram','grwarren','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:57baf47f9b09b3df649742d69be32015','Add Column, Add Foreign Key Constraint','Adding the outcome property to PatientProgram',NULL,'2.0.5',71,'EXECUTED'),('201101121434','gbalaji,gobi','liquibase-update-to-latest.xml','2013-01-17 14:45:50','3:96320c51e6e296e9dc65866a61268e45','Drop Column','Dropping unused date_started column from obs table',NULL,'2.0.5',50,'EXECUTED'),('201101221453','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:50','3:4088d4906026cc1430fa98e04d294b13','Modify Column','Increasing the serialized_data column of serialized_object to hold mediumtext',NULL,'2.0.5',49,'EXECUTED'),('20110124-1030','surangak','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:e17eee5b8c4bb236a0ea6e6ade5abed7','Add Foreign Key Constraint','Adding correct foreign key for concept_answer.answer_drug',NULL,'2.0.5',52,'EXECUTED'),('20110125-1435','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:dadd9da1dad5f2863f8f6bb24b29d598','Add Column','Adding \'start_date\' column to person_address table',NULL,'2.0.5',43,'EXECUTED'),('20110125-1436','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:68cec89409d2419fe9439f4753a23036','Add Column','Adding \'end_date\' column to person_address table',NULL,'2.0.5',44,'EXECUTED'),('201101271456-add-enddate-to-relationship','misha680','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:b593b864d4a870e3b7ba6b61fda57c8d','Add Column','Adding the end_date column to relationship.',NULL,'2.0.5',61,'EXECUTED'),('201101271456-add-startdate-to-relationship','misha680','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:82020a9f33747f58274196619439781e','Add Column','Adding the start_date column to relationship.',NULL,'2.0.5',60,'EXECUTED'),('20110201-1625-1','arahulkmit','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:4f1b23efba67de1917e312942fe7e744','Add Column','Adding \"date_changed\" column to patient_identifier table',NULL,'2.0.5',45,'EXECUTED'),('20110201-1625-2','arahulkmit','liquibase-update-to-latest.xml','2013-01-17 14:45:50','3:01467a1db56ef3db87dc537d40ab22eb','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to patient_identifier table',NULL,'2.0.5',46,'EXECUTED'),('20110201-1626-1','arahulkmit','liquibase-update-to-latest.xml','2013-01-17 14:45:50','3:63397ce933d1c78309648425fba66a17','Add Column','Adding \"date_changed\" column to relationship table',NULL,'2.0.5',47,'EXECUTED'),('20110201-1626-2','arahulkmit','liquibase-update-to-latest.xml','2013-01-17 14:45:50','3:21dae026e42d05b2ebc8fe51408c147f','Add Column, Add Foreign Key Constraint','Adding \"changed_by\" column to relationship table',NULL,'2.0.5',48,'EXECUTED'),('201102081800','gbalaji,gobi','liquibase-update-to-latest.xml','2013-01-17 14:45:50','3:779ca58f39b4e3a14a313f8fc416c242','Drop Column','Dropping unused date_stopped column from obs table',NULL,'2.0.5',51,'EXECUTED'),('20110218-1206','rubailly','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:8be61726cd3fed87215557efd284434f','Add Column','Add \'location_behavior\' column to patient_identifier_type table',NULL,'2.0.5',38,'EXECUTED'),('20110218-1210','rubailly','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:4f8818ba08f3a9ce2e2ededfdf5b6fcd','Drop Not-Null Constraint','Drop Not-Null constraint from location_id column in patient_identifier table',NULL,'2.0.5',39,'EXECUTED'),('201102280948','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:45:31','3:98e1075808582c97377651d02faf8f46','Drop Foreign Key Constraint','Removing the foreign key from users.user_id to person.person_id if it still exists',NULL,'2.0.5',3,'MARK_RAN'),('20110301-1030a','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:5256e8010fb4c375e2a1ef502176cc2f','Rename Table','Renaming the concept_source table to concept_reference_source',NULL,'2.0.5',85,'EXECUTED'),('20110301-1030b','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:6fc5f514cd9c2ee14481a7f0b10a0c7c','Create Table, Add Foreign Key Constraint (x4)','Adding concept_reference_term table',NULL,'2.0.5',86,'EXECUTED'),('20110301-1030b-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:3cf3ba141e6571b900e695b49b6c48a9','Modify Column','(Fixed)Change concept_reference_term.retired to BOOLEAN',NULL,'2.0.5',87,'EXECUTED'),('20110301-1030c','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:d8407baf728a1db5ad5db7c138cb59cb','Create Table, Add Foreign Key Constraint (x3)','Adding concept_map_type table',NULL,'2.0.5',88,'EXECUTED'),('20110301-1030c-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:c02f2825633f1a43fc9303ac21ba2c02','Modify Column (x2)','(Fixed)Change concept_map_type.retired to BOOLEAN',NULL,'2.0.5',89,'EXECUTED'),('20110301-1030d','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:222ef47c65625a17c268a8f68edaa16e','Rename Table','Renaming the concept_map table to concept_reference_map',NULL,'2.0.5',90,'EXECUTED'),('20110301-1030e','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:50be921cf53ce4a357afc0bac8928495','Add Column','Adding concept_reference_term_id column to concept_reference_map table',NULL,'2.0.5',91,'EXECUTED'),('20110301-1030f','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:5faead5506cbcde69490fef985711d66','Custom Change','Inserting core concept map types',NULL,'2.0.5',93,'EXECUTED'),('20110301-1030g','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:54','3:affc4d2a4e3143046cfb75b583c7399a','Add Column, Add Foreign Key Constraint','Adding concept_map_type_id column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5',94,'EXECUTED'),('20110301-1030h','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:54','3:4bf584dc7b25a180cc82edb56e1b0e5b','Add Column, Add Foreign Key Constraint','Adding changed_by column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5',95,'EXECUTED'),('20110301-1030i','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:54','3:f4d0468db79007d0355f6f461603b2f7','Add Column','Adding date_changed column and a foreign key constraint to concept_reference_map table',NULL,'2.0.5',96,'EXECUTED'),('20110301-1030j','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:54','3:a7dc8b89e37fe36263072b43670d7f11','Create Table, Add Foreign Key Constraint (x5)','Adding concept_reference_term_map table',NULL,'2.0.5',97,'EXECUTED'),('20110301-1030m','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:54','3:b286407bfcdf3853512cb15009c816f1','Custom Change','Creating concept reference terms from existing rows in the concept_reference_map table',NULL,'2.0.5',98,'EXECUTED'),('20110301-1030n','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:55','3:01868c1383e5c9c409282b50e67e878c','Add Foreign Key Constraint','Adding foreign key constraint to concept_reference_map.concept_reference_term_id column',NULL,'2.0.5',99,'EXECUTED'),('20110301-1030o','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:56','3:eea9343959864edea569d5a2a2358469','Drop Foreign Key Constraint','Dropping foreign key constraint on concept_reference_map.source column',NULL,'2.0.5',100,'EXECUTED'),('20110301-1030p','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:56','3:01bf8c07a05f22df2286a4ee27a7acb4','Drop Column','Dropping concept_reference_map.source column',NULL,'2.0.5',101,'EXECUTED'),('20110301-1030q','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:56','3:f45caaf1c7daa7f2cb036f46a20aa4b1','Drop Column','Dropping concept_reference_map.source_code column',NULL,'2.0.5',102,'EXECUTED'),('20110301-1030r','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:56','3:23fd6bc96ee0a497cf330ed24ec0075b','Drop Column','Dropping concept_reference_map.comment column',NULL,'2.0.5',103,'EXECUTED'),('201103011751','abbas','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:4857dcbefa75784da912bca5caba21b5','Create Table, Add Foreign Key Constraint (x3)','Create the person_merge_log table',NULL,'2.0.5',53,'EXECUTED'),('20110326-1','Knoll_Frank','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:3376a34edf88bf2868fd75ba2fb0f6c3','Add Column, Add Foreign Key Constraint','Add obs.previous_version column (TRUNK-420)',NULL,'2.0.5',130,'EXECUTED'),('20110326-2','Knoll_Frank','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:7c068bfe918b9d87fefa9f8508e92f58','Custom SQL','Fix all the old void_reason content and add in the new previous_version to the matching obs row (POTENTIALLY VERY SLOW FOR LARGE OBS TABLES)',NULL,'2.0.5',133,'EXECUTED'),('20110329-2317','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:371be45e2a3616ce17b6f50862ca196d','Delete Data','Removing \'View Encounters\' privilege from Anonymous user',NULL,'2.0.5',54,'EXECUTED'),('20110329-2318','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:eb2ece117d8508e843d11eeed7676b21','Delete Data','Removing \'View Observations\' privilege from Anonymous user',NULL,'2.0.5',55,'EXECUTED'),('20110425-1600-create-visit-attribute-type-table','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:3cf419ea9657f9a072881cafb2543d77','Create Table, Add Foreign Key Constraint (x3)','Creating visit_attribute_type table',NULL,'2.0.5',62,'EXECUTED'),('20110425-1600-create-visit-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:e4b62b99750c9ee4c213a7bc3101f8a6','Modify Column','(Fixed)Change visit_attribute_type.retired to BOOLEAN',NULL,'2.0.5',63,'EXECUTED'),('20110425-1700-create-visit-attribute-table','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:52','3:24e1e30a41f9f5d92f337444fb45402a','Create Table, Add Foreign Key Constraint (x5)','Creating visit_attribute table',NULL,'2.0.5',65,'EXECUTED'),('20110425-1700-create-visit-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:52','3:8ab9102da66058c326c0a5089de053e8','Modify Column','(Fixed)Change visit_attribute.voided to BOOLEAN',NULL,'2.0.5',66,'EXECUTED'),('20110426-11701','zabil','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:56caae006a3af14242e2ea57627004c7','Create Table, Add Foreign Key Constraint (x4)','Create provider table',NULL,'2.0.5',109,'EXECUTED'),('20110426-11701-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:f222ec7d41ce0255c667fd79b70bffd2','Modify Column','(Fixed)Change provider.retired to BOOLEAN',NULL,'2.0.5',110,'EXECUTED'),('20110510-11702-create-provider-attribute-type-table','zabil','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:7478ac84804d46a4f2b3daa63efe99be','Create Table, Add Foreign Key Constraint (x3)','Creating provider_attribute_type table',NULL,'2.0.5',111,'EXECUTED'),('20110510-11702-create-provider-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:479636c7572a649889527f670eaff533','Modify Column','(Fixed)Change provider_attribute_type.retired to BOOLEAN',NULL,'2.0.5',112,'EXECUTED'),('20110628-1400-create-provider-attribute-table','kishoreyekkanti','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:298aaacafd48547be294f4c9b7c40d35','Create Table, Add Foreign Key Constraint (x5)','Creating provider_attribute table',NULL,'2.0.5',114,'EXECUTED'),('20110628-1400-create-provider-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:14d85967e968d0bcd7a49ddeb6f3e540','Modify Column','(Fixed)Change provider_attribute.voided to BOOLEAN',NULL,'2.0.5',115,'EXECUTED'),('20110705-2300-create-encounter-role-table','kishoreyekkanti','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:a381ef81f10e4f7443b4d4c8d6231de8','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_role table',NULL,'2.0.5',116,'EXECUTED'),('20110705-2300-create-encounter-role-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:bed2af9d6c3d49eacbdaf2174e682671','Modify Column','(Fixed)Change encounter_role.retired to BOOLEAN',NULL,'2.0.5',117,'EXECUTED'),('20110708-2105','cta','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:a20e9bb27a1aca73a646ad81ef2b9deb','Add Unique Constraint','Add unique constraint to the concept_source table',NULL,'2.0.5',69,'EXECUTED'),('201107192313-change-length-of-regex-column','jtellez','liquibase-update-to-latest.xml','2013-01-17 14:45:52','3:db001544cc0f5a1ff42524a9292b028b','Modify Column','Increasing maximum length of patient identifier type regex format',NULL,'2.0.5',67,'EXECUTED'),('20110811-1205-create-encounter-provider-table','sree/vishnu','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:e20ca5412e37df98c58a39552aafb5ad','Create Table, Add Foreign Key Constraint (x3)','Creating encounter_provider table',NULL,'2.0.5',118,'EXECUTED'),('20110811-1205-create-encounter-provider-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:8decefa15168e68297f5f2782991c552','Modify Column','(Fixed)Change encounter_provider.voided to BOOLEAN',NULL,'2.0.5',119,'EXECUTED'),('20110817-1544-create-location-attribute-type-table','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:41fa30c01ec2d1107beccb8126146464','Create Table, Add Foreign Key Constraint (x3)','Creating location_attribute_type table',NULL,'2.0.5',72,'EXECUTED'),('20110817-1544-create-location-attribute-type-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:53aff6217c6a9a8f1ca414703b1a8720','Modify Column','(Fixed)Change visit_attribute.retired to BOOLEAN',NULL,'2.0.5',73,'EXECUTED'),('20110817-1601-create-location-attribute-table','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:c7cb1b35d68451d10badeb445df599b9','Create Table, Add Foreign Key Constraint (x5)','Creating location_attribute table',NULL,'2.0.5',75,'EXECUTED'),('20110817-1601-create-location-attribute-table-fix','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:2450e230f3eda291203485bca6904377','Modify Column','(Fixed)Change visit_attribute.retired to BOOLEAN',NULL,'2.0.5',76,'EXECUTED'),('20110819-1455-insert-unknown-encounter-role','raff','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:bfe0b994a3c0a62d0d4c8f7d941991c7','Insert Row','Inserting the unknown encounter role into the encounter_role table',NULL,'2.0.5',120,'EXECUTED'),('20110825-1000-creating-providers-for-persons-from-encounter','raff','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:216ab5057dca5471de69124e93953d96','Custom SQL','Creating providers for persons from the encounter table',NULL,'2.0.5',121,'EXECUTED'),('20110825-1000-drop-provider-id-column-from-encounter-table','raff','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:2137e4b5198aa5f12059ee0e8837fb04','Drop Foreign Key Constraint, Drop Column','Dropping the provider_id column from the encounter table',NULL,'2.0.5',123,'EXECUTED'),('20110825-1000-migrating-providers-to-encounter-provider','raff','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:e7c39080453e862d5a4013c48c9225fc','Custom SQL','Migrating providers from the encounter table to the encounter_provider table',NULL,'2.0.5',122,'EXECUTED'),('20110913-0300','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:57','3:7ad8f362e4cc6df6e37135cc37546d0d','Drop Foreign Key Constraint, Add Foreign Key Constraint','Remove ON DELETE CASCADE from relationship table for person_a',NULL,'2.0.5',104,'EXECUTED'),('20110913-0300b','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:58','3:2486028ce670bdea2a5ced509a335170','Drop Foreign Key Constraint, Add Foreign Key Constraint','Remove ON DELETE CASCADE from relationship table for person_b',NULL,'2.0.5',105,'EXECUTED'),('201109152336','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:a84f855a1db7201e08900f8c7a3d7c5f','Update Data','Updating logging level global property',NULL,'2.0.5',107,'EXECUTED'),('20110919-0638','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:5e540b763c3a16e9d37aa6423b7f798f','Rename Column','Renaming concept_map_type.isHidden to is_hidden',NULL,'2.0.5',92,'EXECUTED'),('20110919-0639-void_empty_attributes','dkayiwa','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:ccdbab987b09073fc146f3a4a5a9aee4','Custom SQL','Void all attributes that have empty string values.',NULL,'2.0.5',108,'EXECUTED'),('20110922-0551','sunbiz','liquibase-update-to-latest.xml','2013-01-17 14:45:32','3:ab9b55e5104645690a4e1c5e35124258','Modify Column','Changing global_property.property from varbinary to varchar',NULL,'2.0.5',5,'EXECUTED'),('20110926-1200','raff','liquibase-update-to-latest.xml','2013-01-17 14:45:52','3:bf884233110a210b6ffcef826093cf9d','Custom SQL','Change all empty concept_source.hl7_code to NULL',NULL,'2.0.5',68,'MARK_RAN'),('201109301703','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:11456d3e6867f3b521fb35e6f51ebe5a','Update Data','Converting general address format (if applicable)',NULL,'2.0.5',77,'EXECUTED'),('201109301704','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:d64afe121c9355f6bbe46258876ce759','Update Data','Converting Spain address format (if applicable)',NULL,'2.0.5',78,'MARK_RAN'),('201109301705','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:d3b0c8265ee27456dc0491ff5fe8ca01','Update Data','Converting Rwanda address format (if applicable)',NULL,'2.0.5',79,'MARK_RAN'),('201109301706','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:17d3a0900ca751d8ce775a12444c75bf','Update Data','Converting USA address format (if applicable)',NULL,'2.0.5',80,'MARK_RAN'),('201109301707','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:afbd6428d0007325426f3c4446de2e38','Update Data','Converting Kenya address format (if applicable)',NULL,'2.0.5',81,'MARK_RAN'),('201109301708','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:570c9234597b477e4feffbaac0469495','Update Data','Converting Lesotho address format (if applicable)',NULL,'2.0.5',82,'MARK_RAN'),('201109301709','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:20c95ae336f437b4e0c91be5919b7a2b','Update Data','Converting Malawi address format (if applicable)',NULL,'2.0.5',83,'MARK_RAN'),('201109301710','suho','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:b06d71b4c220c7feed9c5a6459bea98a','Update Data','Converting Tanzania address format (if applicable)',NULL,'2.0.5',84,'MARK_RAN'),('201110051353-fix-visit-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:51','3:d779b41ab27dca879d593aa606016bf6','Add Column (x2)','Refactoring visit_attribute_type table (devs only)',NULL,'2.0.5',64,'MARK_RAN'),('201110072042-fix-location-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:45:53','3:2e32ce0f25391341c8855604f4f40654','Add Column (x2)','Refactoring location_attribute_type table (devs only)',NULL,'2.0.5',74,'MARK_RAN'),('201110072043-fix-provider-attribute-type-columns','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:01','3:31aa196adfe1689c1098c5f36d490902','Add Column (x2)','Refactoring provider_attribute_type table (devs only)',NULL,'2.0.5',113,'MARK_RAN'),('20111008-0938-1','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:fe6d462ba1a7bd81f4865e472cc223ce','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',124,'EXECUTED'),('20111008-0938-2','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:f831d92c11eb6cd6b334d86160db0b95','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',125,'EXECUTED'),('20111008-0938-3','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:f7bd79dfed90d56053dc376b6b8ee7e3','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',126,'EXECUTED'),('20111008-0938-4','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:65003bd1bf99ff0aa8e2947978c58053','Add Column','Allow Global Properties to be typed',NULL,'2.0.5',127,'EXECUTED'),('201110091820-a','jkeiper','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:364a0c70d2adbff31babab6f60ed72e7','Add Column','Add xslt column back to the form table',NULL,'2.0.5',128,'MARK_RAN'),('201110091820-b','jkeiper','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:0b792bf39452f2e81e502a7a98f9f3df','Add Column','Add template column back to the form table',NULL,'2.0.5',129,'MARK_RAN'),('201110091820-c','jkeiper','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:f71680d95ecf870619671fb7f416e457','Rename Table','Rename form_resource table to preserve data; 20111010-1515 reference is for bleeding-edge developers and can be generally ignored',NULL,'2.0.5',131,'MARK_RAN'),('20111010-1515','jkeiper','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:3ccdc9a3ecf811382a0c12825c0aeeb3','Create Table, Add Foreign Key Constraint, Add Unique Constraint','Creating form_resource table',NULL,'2.0.5',132,'EXECUTED'),('20111128-1601','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:12fa4687d149a2f17251e546d47369d6','Insert Row','Inserting Auto Close Visits Task into \'schedule_task_config\' table',NULL,'2.0.5',134,'EXECUTED'),('20111209-1400-deleting-non-existing-roles-from-role-role-table','raff','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:3d74c1dd987a12d916218d68032d726d','Custom SQL','Deleting non-existing roles from the role_role table',NULL,'2.0.5',135,'EXECUTED'),('20111214-1500-setting-super-user-gender','raff','liquibase-update-to-latest.xml','2013-01-17 14:46:02','3:2c281abfe7beb51983db13c187c072f3','Custom SQL','Setting super user gender',NULL,'2.0.5',138,'EXECUTED'),('20111218-1830','abbas','liquibase-update-to-latest.xml','2013-01-17 14:46:03','3:5f096b88988f19d9d3e596c03fba2b90','Add Unique Constraint, Add Column (x6), Add Foreign Key Constraint (x2)','Add unique uuid constraint and attributes inherited from BaseOpenmrsData to the person_merge_log table',NULL,'2.0.5',139,'EXECUTED'),('20111218-1830-fix','sunbiz','liquibase-update-to-latest.xml','2015-06-08 12:18:26','3:a95b16d8762fef1076564611fb2115ac','Modify Column','(Fixed)Change person_merge_log.voided to BOOLEAN',NULL,'2.0.5',162,'EXECUTED'),('20111218-2274','gsluthra','liquibase-update-to-latest.xml','2015-06-08 12:18:26','3:6339df469a35f517ac6e86452aad0155','Update Data','Fix the description for RBC concept',NULL,'2.0.5',163,'EXECUTED'),('20111219-1404','bwolfe','liquibase-update-to-latest.xml','2013-01-17 14:46:03','3:3f8cfa9c088a103788bcf70de3ffaa8b','Update Data','Fix empty descriptions on relationship types',NULL,'2.0.5',140,'EXECUTED'),('20111222-1659','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:03','3:990b494647720b680efeefbab2c502de','Create Table, Create Index','Create clob_datatype_storage table',NULL,'2.0.5',142,'EXECUTED'),('201118012301','lkellett','liquibase-update-to-latest.xml','2013-01-17 14:45:49','3:0d96c10c52335339b1003e6dd933ccc2','Add Column','Adding the discontinued_reason_non_coded column to orders.',NULL,'2.0.5',42,'EXECUTED'),('201202020847','abbas','liquibase-update-to-latest.xml','2013-01-17 14:46:03','3:35bf2f2481ee34975e57f08d933583be','Modify data type, Add Not-Null Constraint','Change merged_data column type to CLOB in person_merge_log table',NULL,'2.0.5',141,'EXECUTED'),('20120316-1300','mseaton','liquibase.xml','2013-09-13 12:26:50','3:0cbaf0a89ef629563c90deccbd82429f','Create Table','Adding calculation_registration table',NULL,'2.0.5',159,'EXECUTED'),('20120322-1510','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:26','3:7c5913c7091c2b20babb9e825774993c','Add Column','Adding uniqueness_behavior column to patient_identifier_type table',NULL,'2.0.5',164,'EXECUTED'),('20120330-0954','jkeiper','liquibase-update-to-latest.xml','2013-01-17 14:46:04','3:9c6084b4407395205fa39b34630d3522','Modify data type','Increase size of drug name column to 255 characters',NULL,'2.0.5',145,'EXECUTED'),('20120503-djmod','dkayiwa and djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:04','3:d31ac18d3a40e45c0ebb399c5d116951','Create Table, Add Foreign Key Constraint (x2)','Create test_order table',NULL,'2.0.5',148,'EXECUTED'),('20120504-1000','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:26','3:eb6f5e2a2ef5ea111ff238ca1df013f4','Drop Table','Dropping the drug_ingredient table',NULL,'2.0.5',165,'EXECUTED'),('20120504-1010','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:26','3:4d9ece759a248fa385c3eae6b83995a1','Create Table','Creating the drug_ingredient table',NULL,'2.0.5',166,'EXECUTED'),('20120504-1020','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:27','3:fcbc8182e908b595ae338ba8402a589c','Add Primary Key','Adding a primary key to the drug_ingredient table',NULL,'2.0.5',167,'EXECUTED'),('20120504-1030','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:27','3:d802926fcf3eaf3649aca49a26a5f67d','Add Foreign Key Constraint','Adding a new foreign key from drug_ingredient.units to concept.concept_id',NULL,'2.0.5',168,'EXECUTED'),('20120504-1040','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:27','3:9786bfbb8133493b54ce9026424d5b99','Add Foreign Key Constraint','Adding a new foreign key from drug_ingredient.drug_id to drug.drug_id',NULL,'2.0.5',169,'EXECUTED'),('20120504-1050','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:7d43f25c9a3bde54112ddd65627b2c05','Add Foreign Key Constraint','Adding a new foreign key from drug_ingredient.ingredient_id to concept.concept_id',NULL,'2.0.5',170,'EXECUTED'),('201205241728-1','mvorobey','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:70160c0af8222542fa668ac5f5cb99ed','Add Column, Add Foreign Key Constraint','Add optional property view_privilege to encounter_type table',NULL,'2.0.5',177,'EXECUTED'),('201205241728-2','mvorobey','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:dd8de770c99e046ba05bc8348748c33c','Add Column, Add Foreign Key Constraint','Add optional property edit_privilege to encounter_type table',NULL,'2.0.5',178,'EXECUTED'),('20120613-0930','wyclif','liquibase-update-to-latest.xml','2013-01-17 14:46:04','3:fe6387773a70b574b106b37686a8e8d3','Drop Not-Null Constraint','Dropping not null constraint from provider.identifier column',NULL,'2.0.5',146,'EXECUTED'),('20121007-orders_urgency','djazayeri','liquibase-update-to-latest.xml','2013-01-17 14:46:04','3:f8eb2228ea34f43ae21bedf4abc8736b','Add Column','Adding urgency column to orders table',NULL,'2.0.5',147,'EXECUTED'),('20121007-test_order_laterality','djazayeri','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:1121924c349201e400e03feda110acc3','Modify data type','Changing test_order.laterality to be a varchar',NULL,'2.0.5',181,'EXECUTED'),('20121008-order_specimen_source_fk','djazayeri','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:99464e51d64e056a1e23b30c7aaaf47e','Add Foreign Key Constraint','Adding FK constraint for test_order.specimen_source if necessary',NULL,'2.0.5',182,'MARK_RAN'),('20121016-1504','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:88db1819c0e9da738ed9332b5de73609','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Removing auto increment from test_order.order_id column',NULL,'2.0.5',183,'EXECUTED'),('20121020-TRUNK-3610','lluismf','liquibase-update-to-latest.xml','2013-01-17 14:46:04','3:a3159e65647f0ff1b667104012b5f4f0','Update Data (x2)','Rename global property autoCloseVisits.visitType to visits.autoCloseVisitType',NULL,'2.0.5',149,'EXECUTED'),('20121021-TRUNK-333','lluismf','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:f885cb0eed2a8e2a5786675eeb0ccbc5','Drop Table','Removing concept set derived table',NULL,'2.0.5',185,'EXECUTED'),('20121025-TRUNK-213','lluismf','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:65536ae335b0a6cb23619d6ef7ea3274','Modify Column (x2)','Normalize varchar length of locale columns',NULL,'2.0.5',184,'EXECUTED'),('20121109-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:02af0e39e210aeda861f92698ae974f6','Drop Not-Null Constraint','Dropping not null constraint from concept_class.description column',NULL,'2.0.5',186,'EXECUTED'),('20121112-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:30e023e5e3e98190470d951fbbbd9e87','Drop Not-Null Constraint','Dropping not null constraint from concept_datatype.description column',NULL,'2.0.5',187,'EXECUTED'),('20121113-TRUNK-3474','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:76211ab053e8685a4d0b1345f166e965','Drop Not-Null Constraint','Dropping not null constraint from patient_identifier_type.description column',NULL,'2.0.5',188,'EXECUTED'),('20121113-TRUNK-3474-person-attribute-type','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:7ad821b6167ff22a812a6c550d6deb53','Drop Not-Null Constraint','Dropping not null constraint from person_attribute_type.description column',NULL,'2.0.5',189,'EXECUTED'),('20121113-TRUNK-3474-privilege','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:ecf38bb6fb29d96b0e2c75330a637245','Drop Not-Null Constraint','Dropping not null constraint from privilege.description column',NULL,'2.0.5',190,'EXECUTED'),('20121114-TRUNK-3474-encounter_type','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:1cad8ad2c06b02915138dfb36c013770','Drop Not-Null Constraint','Dropping not null constraint from encounter_type.description column',NULL,'2.0.5',193,'EXECUTED'),('20121114-TRUNK-3474-relationship_type','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:232499aa77be5583f87d6528c0c44768','Drop Not-Null Constraint','Dropping not null constraint from relationship_type.description column',NULL,'2.0.5',192,'EXECUTED'),('20121114-TRUNK-3474-role','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:69a164a13e3520d5cdccbf977d07ce89','Drop Not-Null Constraint','Dropping not null constraint from role.description column',NULL,'2.0.5',191,'EXECUTED'),('20121212-TRUNK-2768','patandre','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:351f7dba6eea4f007fa5d006219ede9e','Add Column','Adding deathdate_estimated column to person.',NULL,'2.0.5',194,'EXECUTED'),('201301031440-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:47e5686e3cb80484b2830afca679ec70','Custom Change','Creating coded order frequencies for drug order frequencies',NULL,'2.0.5',259,'EXECUTED'),('201301031448-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:00adfb72966810dd0c048f93b8edd523','Custom Change','Migrating drug order frequencies to coded order frequencies',NULL,'2.0.5',260,'EXECUTED'),('201301031455-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:04b95a27ccba87e597395670db081498','Drop Column','Dropping temporary column drug_order.frequency_text',NULL,'2.0.5',261,'EXECUTED'),('201306141103-TRUNK-3884','susantan','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:9581f8d869e69d911f04e48591a297d0','Add Foreign Key Constraint (x3)','Adding 3 foreign key relationships (creator,created_by,voided_by) to encounter_provider table',NULL,'2.0.5',196,'EXECUTED'),('20130626-TRUNK-439','jthoenes','liquibase-update-to-latest.xml','2015-06-08 12:18:29','3:6c0799599f35b4546dafa73968e3a229','Update Data','Adding configurability to Patient Header on Dashboard. Therefore the cd4_count property is dropped and\n            replaced with a header.showConcept property.',NULL,'2.0.5',195,'EXECUTED'),('20130809-TRUNK-4044-duplicateEncounterRoleChangeSet','surangak','liquibase-update-to-latest.xml','2015-06-08 12:18:30','3:35b07ae88667be5a78002beacd3aa0ed','Custom Change','Custom changesets to identify and resolve duplicate EncounterRole names',NULL,'2.0.5',199,'EXECUTED'),('20130809-TRUNK-4044-duplicateEncounterTypeChangeSet','surangak','liquibase-update-to-latest.xml','2015-06-08 12:18:30','3:01a7d7ae88b0280139178f1840d417bd','Custom Change','Custom changesets to identify and resolve duplicate EncounterType names',NULL,'2.0.5',200,'EXECUTED'),('20130809-TRUNK-4044-encounter_role_unique_name_constraint','surangak','liquibase-update-to-latest.xml','2015-06-08 12:18:30','3:1a5a8ad5971977e0645a6fbc3744f8e2','Add Unique Constraint','Adding the unique constraint to the encounter_role.name column',NULL,'2.0.5',202,'EXECUTED'),('20130809-TRUNK-4044-encounter_type_unique_name_constraint','surangak','liquibase-update-to-latest.xml','2015-06-08 12:18:30','3:823098007f6e299c0c6555dde6f12255','Add Unique Constraint','Adding the unique constraint to the encounter_type.name column',NULL,'2.0.5',201,'EXECUTED'),('20130925-TRUNK-4105','hannes','liquibase-update-to-latest.xml','2015-06-08 12:18:30','3:e81f96e97c307c2d265bce32a046d0ca','Create Index','Adding index on concept_reference_term.code column',NULL,'2.0.5',197,'EXECUTED'),('20131023-TRUNK-3903','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:30','3:88f8ec2c297875a03fd88ddd2b9f14b9','Add Column','Adding \"display_precision\" column to concept_numeric table',NULL,'2.0.5',198,'EXECUTED'),('201310281153-TRUNK-4123','mujir,sushmitharaos','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:b2bffad4e841b61c6397465633cd1064','Add Column, Add Foreign Key Constraint','Adding previous_order_id to orders',NULL,'2.0.5',229,'EXECUTED'),('201310281153-TRUNK-4124','mujir,sushmitharaos','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:eb9dec50fead4430dc07b8309e5840ac','Add Column, Update Data, Add Not-Null Constraint','Adding order_action to orders and setting order_actions as NEW for existing orders',NULL,'2.0.5',230,'EXECUTED'),('201311041510','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:dfdc279ddc60b9751dc5d655b4c7fc9c','Rename Column','Renaming drug_order.prn column to drug_order.as_needed',NULL,'2.0.5',224,'EXECUTED'),('201311041511','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:4a2ee902d6090959a49539d5bc907354','Add Column','Adding as_needed_condition column to drug_order table',NULL,'2.0.5',225,'EXECUTED'),('201311041512','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:76a5c7a0b95e971bd540865917efed9c','Add Column','Adding order_number column to orders table',NULL,'2.0.5',226,'EXECUTED'),('201311041513','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:b41217397a18dbe18e07266a9be4a523','Update Data','Setting order numbers for existing orders',NULL,'2.0.5',227,'MARK_RAN'),('201311041515-TRUNK-4122','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:948975149e69b6862aab0012304d9a80','Add Not-Null Constraint','Making orders.order_number not nullable',NULL,'2.0.5',228,'EXECUTED'),('20131210-TRUNK-4130','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:5a2bde236731862f2c6e3e4066705cdf','Add Column','Adding num_refills column to drug_order table',NULL,'2.0.5',234,'EXECUTED'),('201312141400-TRUNK-4126','arathy','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:45d8c6ce32076c0fe11f75d1fea1c215','Modify data type, Rename Column','Renaming drug_order.complex to dosing_type',NULL,'2.0.5',231,'EXECUTED'),('201312141400-TRUNK-4127','arathy','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:26f381a2b8f112d98f36c1d0b6cceebd','Update Data (x2)','Converting values in drug_order.dosing_type column',NULL,'2.0.5',233,'MARK_RAN'),('201312141401-TRUNK-4126','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:cc77a94d57b78ac02e99ed4ca25f6272','Drop Not-Null Constraint','Making drug_order.dosing_type nullable',NULL,'2.0.5',232,'EXECUTED'),('20131216-1637','gitahi','liquibase-update-to-latest.xml','2015-06-08 12:18:34','3:4b2a0abaf146a7d938b94009d9600eaf','Create Table, Add Foreign Key Constraint (x6)','Add drug_reference_map table',NULL,'2.0.5',269,'EXECUTED'),('201312161618-TRUNK-4129','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:a7c821bc60c7410b387aa276540291a9','Add Column, Add Foreign Key Constraint','Adding quantity_units column to drug_order table',NULL,'2.0.5',240,'EXECUTED'),('201312161713-TRUNK-4129','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:2e13513e97a1c372818bd9ad1f31c219','Modify data type','Changing quantity column of drug_order to double',NULL,'2.0.5',241,'EXECUTED'),('201312162044-TRUNK-4126','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:31378c39bfdf55ec4ec6faff20c9dcf8','Add Column','Adding duration column to drug_order table',NULL,'2.0.5',238,'EXECUTED'),('201312162059-TRUNK-4126','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:f6f21104c2e85bacbbe9af09fee348fd','Add Column, Add Foreign Key Constraint','Adding duration_units column to drug_order table',NULL,'2.0.5',239,'EXECUTED'),('20131217-TRUNK-4142','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:5c29916ae374ae0cb36ecbf4a9c80e8c','Add Column','Adding comment_to_fulfiller column to orders table',NULL,'2.0.5',237,'EXECUTED'),('20131217-TRUNK-4157','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:8553abd1173bf56dad911a11ec0924ce','Add Column','Adding dosing_instructions column to drug_order table',NULL,'2.0.5',236,'EXECUTED'),('201312171559-TRUNK-4159','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:0735c719adcee97fbe967460d05bb474','Create Table, Add Foreign Key Constraint (x4)','Create the order_frequency table',NULL,'2.0.5',235,'EXECUTED'),('201312181649-TRUNK-4137','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:278cff9c9abc7864dd71bf4cba04c885','Add Column, Add Foreign Key Constraint','Adding frequency column to test_order table',NULL,'2.0.5',248,'EXECUTED'),('201312181650-TRUNK-4137','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:c28fa1a77bec305b4d8d23fda254f320','Add Column','Adding number_of_repeats column to test_order table',NULL,'2.0.5',249,'EXECUTED'),('201312182214-TRUNK-4136','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:5091764b71670065672afcb69d18efae','Add Column, Add Foreign Key Constraint','Adding route column to drug_order table',NULL,'2.0.5',242,'EXECUTED'),('201312182223-TRUNK-4136','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:aea033991dfc56954d1661fdf15c35f7','Drop Column','Dropping equivalent_daily_dose column from drug_order table',NULL,'2.0.5',243,'EXECUTED'),('201312191200-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:b6a84072096cf71ca37dc160d0422a2d','Add Column','Adding dose_units column to drug_order table',NULL,'2.0.5',244,'EXECUTED'),('201312191300-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:c1bb6f3394f9c391288f2d51384edd3e','Add Foreign Key Constraint','Adding foreignKey constraint on dose_units',NULL,'2.0.5',245,'EXECUTED'),('201312201200-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:c72cd1725e670ea735fc45e6f0f31001','Custom Change','Migrating old text units to coded dose_units in drug_order',NULL,'2.0.5',246,'MARK_RAN'),('201312201425-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:e6e37b7b995e2da28448f815211648fd','Update Data','Setting order.discontinued_reason to null for stopped orders',NULL,'2.0.5',252,'MARK_RAN'),('201312201523-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:8d48725ba6d40d8a19acec61c948a52f','Custom Change','Creating Discontinue Order for discontinued orders',NULL,'2.0.5',251,'EXECUTED'),('201312201525-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:c751cbf452be8b2c05af6d6502ff5dc9','Update Data','Setting orders.discontinued_reason_non_coded to null for stopped orders',NULL,'2.0.5',253,'MARK_RAN'),('201312201601-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:43505eb22756ea5ec6bee4f8ad750034','Drop Foreign Key Constraint','Dropping fk constraint on orders.discontinued_by column to users.user_id column',NULL,'2.0.5',255,'EXECUTED'),('201312201640-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:174ed15d1066200fe48c3ed2b7a262ae','Rename Column','Rename orders.discontinued_date to date_stopped',NULL,'2.0.5',250,'EXECUTED'),('201312201651-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:2ccbe6dad392099d9b6dc49e40736879','Drop Column','Removing discontinued from orders',NULL,'2.0.5',254,'EXECUTED'),('201312201700-TRUNK-4138','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:1c570e49534bf886108654c28a99bede','Drop Column','Removing discontinued_by from orders',NULL,'2.0.5',256,'EXECUTED'),('201312201800-TRUNK-4167','banka','liquibase-update-to-latest.xml','2015-06-08 12:18:32','3:8ff2338c8a1df329476e9e60c8ddc7f6','Drop Column','Deleting units column',NULL,'2.0.5',247,'EXECUTED'),('201312271822-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:9e6ef6a4a036e5ff027a6c49557b2939','Create Table, Add Foreign Key Constraint (x3)','Adding care_setting table',NULL,'2.0.5',262,'EXECUTED'),('201312271823-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:036031e437f2baae976f103900455644','Insert Row','Adding OUTPATIENT care setting',NULL,'2.0.5',263,'EXECUTED'),('201312271824-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:b78e4eb1e63a9ca78a51c42f1e2edb00','Insert Row','Adding INPATIENT care setting',NULL,'2.0.5',264,'EXECUTED'),('201312271826-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:142266f644d20a834b2c687abf45f019','Add Column','Add care_setting column to orders table',NULL,'2.0.5',265,'EXECUTED'),('201312271827-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:ba1d0716249a5f1bde5eec83c190400f','Custom SQL','Set default value for orders.care_setting column for existing rows',NULL,'2.0.5',266,'MARK_RAN'),('201312271828-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:7c6fcd23f2fdbcc69ad06bcdd34cb56f','Add Not-Null Constraint','Make care_setting column non-nullable',NULL,'2.0.5',267,'EXECUTED'),('201312271829-TRUNK-4156','vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:34','3:dc55b130e1d56c8df00b06a5dedd2689','Add Foreign Key Constraint','Add foreign key constraint',NULL,'2.0.5',268,'EXECUTED'),('201401031433-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:1e90a9f5f6ffab47ac360dec7497d2f9','Rename Column','Temporarily renaming drug_order.frequency column to frequency_text',NULL,'2.0.5',257,'EXECUTED'),('201401031434-TRUNK-4135','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:33','3:59eef75e78e64cdc999a6d25863c921d','Add Column, Add Foreign Key Constraint','Adding the frequency column to the drug_order table',NULL,'2.0.5',258,'EXECUTED'),('201401040436-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:2fde2a2c0d2a917cd7ec0dfc990b96ac','Add Column, Add Foreign Key Constraint','Add changed_by column to location_tag table',NULL,'2.0.5',203,'EXECUTED'),('201401040438-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:134b00185f7b61d7d6cccb66717dc4ae','Add Column','Add date_changed column to location_tag table',NULL,'2.0.5',204,'EXECUTED'),('201401040440-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:2f3b927e3554c31abebb064835da2efc','Add Column, Add Foreign Key Constraint','Add changed_by column to location table',NULL,'2.0.5',205,'EXECUTED'),('201401040442-TRUNK-3919','dkithmal','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:6cf087a28acd99c02c00fd719a26e73b','Add Column','Add date_changed column to location table',NULL,'2.0.5',206,'EXECUTED'),('201401101647-TRUNK-4187','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checks that all existing free text drug order dose units and frequencies have been mapped to\n            concepts, this will fail the upgrade process if any unmapped text is found',NULL,'2.0.5',207,'EXECUTED'),('201402041600-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:34','3:a09f49aa170ede88187564ce4834956e','Drop Foreign Key Constraint','Temporary dropping foreign key on orders.discontinued_reason column',NULL,'2.0.5',270,'EXECUTED'),('201402041601-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:34','3:09293693ccab9bd63f0bacbf1229e6b5','Rename Column','Renaming orders.discontinued_reason column to order_reason',NULL,'2.0.5',271,'EXECUTED'),('201402041602-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:34','3:b93897a56c7e2407d694bd47b9f3ff56','Add Foreign Key Constraint','Adding back foreign key on orders.discontinued_reason column',NULL,'2.0.5',272,'EXECUTED'),('201402041604-TRUNK-4138','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:34','3:bf80640132c97067d42dabbebd10b7df','Rename Column','Renaming orders.discontinued_reason_non_coded column to order_reason_non_coded',NULL,'2.0.5',273,'EXECUTED'),('201402042238-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:e74c6d63ac01908cc6fb6f3e9b15e2e0','Custom Change','Converting orders.orderer to reference provider.provider_id',NULL,'2.0.5',275,'MARK_RAN'),('201402051638-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:ddff1dba0827858324336de9baeb93aa','Drop Foreign Key Constraint','Temporarily removing foreign key constraint from orders.orderer column',NULL,'2.0.5',274,'EXECUTED'),('201402051639-TRUNK-4202','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:32f643ae7a3cafe84fc11208e116cbf0','Add Foreign Key Constraint','Adding foreign key constraint to orders.orderer column',NULL,'2.0.5',276,'EXECUTED'),('201402120720-TRUNK-3902','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:7ce90e7459b6b840b7d3f246b6ca697b','Rename Column','Rename concept_numeric.precise to concept_numeric.allow_decimal',NULL,'2.0.5',286,'MARK_RAN'),('201402241055','Akshika','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:10f872c80393f2cb4d1126ec59b54676','Modify Column','Making orders.start_date not nullable',NULL,'2.0.5',222,'EXECUTED'),('201402281648-TRUNK-4274','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:1efc6af34de0b0e83ce217febe1c9fa7','Modify Column','Making order.encounter required',NULL,'2.0.5',223,'EXECUTED'),('201403011348','alexisduque','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:117c4ea0b0cd79e21a59b5769d020c93','Modify Column','Make orders.orderer not NULLable',NULL,'2.0.5',277,'EXECUTED'),('20140304-TRUNK-4170-duplicateLocationAttributeTypeNameChangeSet','harsz89','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:b74878260cae25b9c209d1b6ea5ddb98','Custom Change','Custom changeset to identify and resolve duplicate Location Attribute Type names',NULL,'2.0.5',287,'MARK_RAN'),('20140304-TRUNK-4170-location_attribute_type_unique_name','harsz89','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:e11205616b3ee4ad727a2c5031dee884','Add Unique Constraint','Adding the unique constraint to the location_attribute_type.name column',NULL,'2.0.5',288,'EXECUTED'),('20140304816-TRUNK-4139','Akshika','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:0d0ffd19df0598f644c863d931abccd2','Add Column','Adding scheduled_date column to orders table',NULL,'2.0.5',279,'EXECUTED'),('201403061758-TRUNK-4284','Banka, Vinay','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:008c6f185b3c571b57031314beda2b8f','Insert Row','Inserting Frequency concept class',NULL,'2.0.5',278,'EXECUTED'),('201403070132-TRUNK-4286','andras-szell','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:292b7549e0ae96619a6e4fcc30383592','Insert Row','Insert order type for test orders',NULL,'2.0.5',221,'EXECUTED'),('20140313-TRUNK-4288','dszafranek','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:3f2f0f3c1bcfe74253de58d32f811e11','Create Table, Add Foreign Key Constraint (x2), Add Primary Key','Add order_type_class_map table',NULL,'2.0.5',280,'EXECUTED'),('20140314-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all orders have start_date column set',NULL,'2.0.5',208,'EXECUTED'),('20140316-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all orders have encounter_id column set',NULL,'2.0.5',210,'EXECUTED'),('20140318-TRUNK-4265','jkondrat','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:01f3e7e45562865ed7855cea0b7ccd30','Merge Column, Update Data','Concatenate dose_strength and units to form the value for the new strength field',NULL,'2.0.5',281,'EXECUTED'),('201403262140-TRUNK-4265','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking if there are any drugs with the dose_strength specified but no units',NULL,'2.0.5',211,'EXECUTED'),('201404091110','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking if order_type table is already up to date or can be updated automatically',NULL,'2.0.5',212,'EXECUTED'),('201404091112','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:2bf52dfa949ba06b05016ce4eb08034b','Add Unique Constraint','Adding unique key constraint to order_type.name column',NULL,'2.0.5',216,'EXECUTED'),('201404091128','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:f96fd12ecf53fb18143450f7a0b9c1d9','Add Column','Adding java_class_name column to order_type table',NULL,'2.0.5',217,'EXECUTED'),('201404091129','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d018fdec6bcd0775032bd8df67f57a77','Add Column','Adding parent column to order_type table',NULL,'2.0.5',218,'EXECUTED'),('201404091131','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:accf143fbe21963d2ea7fb211424ed4f','Add Not-Null Constraint','Add not-null constraint on order_type.java_class_name column',NULL,'2.0.5',220,'EXECUTED'),('201404091516','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:8c5d2f8c49bf08514911c24f60c065e0','Add Column, Add Foreign Key Constraint','Add changed_by column to order_type table',NULL,'2.0.5',282,'EXECUTED'),('201404091517','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:24b9f5757f0dec2a910daab2dd138ce1','Add Column','Add date_changed column to order_type table',NULL,'2.0.5',283,'EXECUTED'),('201404101130','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:0b986790bfacfc61e7ec851a4e4fbded','Update Data','Setting java_class_name column for drug order type row',NULL,'2.0.5',219,'EXECUTED'),('201406201443','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:c1cf2edbf71074e2740d975d89ca202d','Add Column','Add brand_name column to drug_order table',NULL,'2.0.5',284,'EXECUTED'),('201406201444','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:35','3:da7c9042e009a4cbe61746bd8bf13d12','Add Column','Add dispense_as_written column to drug_order table',NULL,'2.0.5',285,'EXECUTED'),('201406211643-TRUNK-4401','harsz89','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all discontinued orders have the discontinued_date column set',NULL,'2.0.5',214,'EXECUTED'),('201406211703-TRUNK-4401','harsz89','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all discontinued orders have the discontinued_by column set',NULL,'2.0.5',215,'EXECUTED'),('201406262016','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all users that created orders have provider accounts',NULL,'2.0.5',213,'EXECUTED'),('20140635-TRUNK-4283','dszafranek, wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:31','3:d41d8cd98f00b204e9800998ecf8427e','Empty','Checking that all orders have orderer column set',NULL,'2.0.5',209,'EXECUTED'),('20140715-TRUNK-2999-remove_concept_word','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:4ff8bd1176165ac45c42809673d7d12d','Drop Table','Removing the concept_word table (replaced by Lucene)',NULL,'2.0.5',289,'EXECUTED'),('20140718-TRUNK-2999-remove_update_concept_index_task','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:a0ca6ff43de07e00f6a494c5b2964de5','Delete Data','Deleting the update concept index task',NULL,'2.0.5',290,'EXECUTED'),('20140719-TRUNK-4445-update_dosing_type_to_varchar_255','mihir','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:2948bf1441141d7f36e34cea1cdfb72a','Modify data type','Increase size of dosing type column to 255 characters',NULL,'2.0.5',293,'EXECUTED'),('20140724-1528','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:ad5fee02995c649c4b87d5991f5f3723','Drop Default Value','Dropping default value for drug_order.drug_inventory_id',NULL,'2.0.5',291,'EXECUTED'),('20140801-TRUNK-4443-rename_order_start_date_to_date_activated','bharti','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:fde9246d6d3b98ac8e64361818ece22c','Rename Column','Renaming the start_date in order table to date_activated',NULL,'2.0.5',292,'EXECUTED'),('201408200733-TRUNK-4446','Deepak','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:95a533365792e76a4cd95f8f32c887db','Modify data type','Changing duration column of drug_order to int',NULL,'2.0.5',294,'EXECUTED'),('201409230113-TRUNK-3484','k-joseph','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:7a9c7aad5b657556b1103510f8bfc1d9','Update Data','Updating description for visits.encounterTypeToVisitTypeMapping GP to the value set in OpenmrsContants',NULL,'2.0.5',297,'EXECUTED'),('20141010-trunk-4492','alec','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:fbe1f44dafa30068cd7c99a6713f8ee4','Drop Column','Dropping the tribe field from patient table because it has been moved to person_attribute.',NULL,'2.0.5',299,'EXECUTED'),('201410291606-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:03757abe17abedb9ac1cf0b933a35139','Drop Not-Null Constraint','Dropping not null constraint from program.description column',NULL,'2.0.5',300,'EXECUTED'),('201410291613-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:32fa9bee757a0ca295e1545662051b96','Drop Not-Null Constraint','Dropping not null constraint from order_type.description column',NULL,'2.0.5',301,'EXECUTED'),('201410291614-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:8623cbc44ba289fa096e0b5ee4eeaf11','Drop Not-Null Constraint','Dropping not null constraint from concept_name_tag.description column',NULL,'2.0.5',302,'EXECUTED'),('201410291616-TRUNK-3474','jbuczynski','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:4393a565e9dad85e69c1cfcd9836d957','Drop Not-Null Constraint','Dropping not null constraint from active_list_type.description column',NULL,'2.0.5',303,'EXECUTED'),('20141103-1030','wyclif','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:2b1a52ce2e496ec391e63ce4d9758226','Add Column','Adding form_namespace_and_path column to obs table',NULL,'2.0.5',304,'EXECUTED'),('20141121-TRUNK-2193','raff','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:5c3daa4f68e3e650f53b63496a831295','Rename Column','Renaming drug_ingredient.quantity to strength',NULL,'2.0.5',305,'EXECUTED'),('20150109-0505','Shruthi, Sravanthi','liquibase.xml','2015-06-12 09:42:17','3:dac719171dae4edcff51cef778e34756','Create Table','',NULL,'2.0.5',330,'EXECUTED'),('20150109-0521','Shruthi, Sravanthi','liquibase.xml','2015-06-12 09:42:19','3:7c55ee9f0149c0c645c0d8f566c42011','Create Index','Creating unique index on condition.uuid column',NULL,'2.0.5',332,'EXECUTED'),('20150109-0627','Shruthi, Sravanthi','liquibase.xml','2015-06-12 09:42:17','3:643c49c1108fd96b387efa2b8b832252','Add Foreign Key Constraint (x6)','',NULL,'2.0.5',331,'EXECUTED'),('20150122-1414','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:25','3:b662cac19085b837d902916f20a27da9','Update Data','Reverting concept name type to NULL for concepts having names tagged as default',NULL,'2.0.5',160,'MARK_RAN'),('20150122-1420','rkorytkowski','liquibase-update-to-latest.xml','2015-06-08 12:18:26','3:c75793ade72db0648a912f22f79cf461','Update Data, Delete Data (x2)','Setting concept name type to fully specified for names tagged as default',NULL,'2.0.5',161,'MARK_RAN'),('20150428-TRUNK-4693-1','mseaton','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:599624d822c5f7a0d9bc796c4e90a526','Drop Foreign Key Constraint','Removing invalid foreign key constraint from order_type.parent column to order.order_id column',NULL,'2.0.5',295,'MARK_RAN'),('20150428-TRUNK-4693-2','mseaton','liquibase-update-to-latest.xml','2015-06-08 12:18:36','3:706418216753f16ce1b5eb0c45c21e24','Add Foreign Key Constraint','Adding foreign key constraint from order_type.parent column to order_type.order_type_id column',NULL,'2.0.5',296,'EXECUTED'),('201506051103-TRUNK-4727','Chethan, Preethi','liquibase-update-to-latest.xml','2015-10-29 08:33:49','3:91fd51bed950b30f1b0532b5bdc041cc','Add Column','Adding birthtime column to person',NULL,'2.0.5',551,'EXECUTED'),('201508111304','sns.recommind','liquibase-update-to-latest.xml','2015-10-29 08:33:50','3:75a849aa0d9c54bb2e052e6a8875d443','Create Index','Add an index to the global_property.property column',NULL,'2.0.5',552,'EXECUTED'),('201508111412','sns.recommind','liquibase-update-to-latest.xml','2015-10-29 08:33:51','3:226edcaabe81261347e3da63e5321b3f','Create Index','Add an index to the concept_class.name column',NULL,'2.0.5',553,'EXECUTED'),('201508111415','sns.recommind','liquibase-update-to-latest.xml','2015-10-29 08:33:51','3:ee7859e5c5d801c0125fe02449c1c53b','Create Index','Add an index to the concept_datatype.name column',NULL,'2.0.5',554,'EXECUTED'),('3-increase-privilege-col-size-person_attribute_type','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:28','3:c2465b2417463d93f1101c6683f41250','Drop Foreign Key Constraint, Modify Column, Add Foreign Key Constraint','Increasing the size of the edit_privilege column in the person_attribute_type table',NULL,'2.0.5',179,'EXECUTED'),('add-column_fila_id_in_table_phm_prescription_dispensation','Guimino','liquibase.xml','2018-10-08 11:51:25','3:c0868547272cd298c8815c24cc188af4','Add Column, Add Foreign Key Constraint','add column fila_id in table phm_prescription_dispensation table',NULL,'2.0.5',797,'EXECUTED'),('appframework-1','djazayeri','liquibase.xml','2015-06-12 09:42:08','3:1fff60c3e3407f96174f63eb875e3dd3','Create Table, Add Foreign Key Constraint (x2)','Create table for AppEnabled',NULL,'2.0.5',327,'EXECUTED'),('appframework-2','djazayeri','liquibase.xml','2015-06-12 09:42:08','3:964d11f2c8a482d315341c315b705101','Drop Table','Drop table for AppEnabled, since we\'ll be using privileges instead',NULL,'2.0.5',328,'EXECUTED'),('appframework-3','nutsiepully','liquibase.xml','2015-06-12 09:42:08','3:fdc791492c3f51ed1d97890bc099d284','Create Table','Create table to track which AppFramework components are enabled',NULL,'2.0.5',329,'EXECUTED'),('bahmni-1','tw','liquibase.xml','2015-06-12 09:42:22','3:1fa8ea475c7e35cd9bcb5040bd294622','SQL From File','rel2',NULL,'2.0.5',333,'EXECUTED'),('bahmni-10','tw','liquibase.xml','2015-06-12 09:42:22','3:73863097e856ba046dab35b909890730','SQL From File','rel2',NULL,'2.0.5',340,'EXECUTED'),('bahmni-11','tw','liquibase.xml','2015-06-12 09:42:22','3:4eb9fcc5ce17fbf0a38995357e206adf','SQL From File','rel2',NULL,'2.0.5',341,'EXECUTED'),('bahmni-12','tw','liquibase.xml','2015-06-12 09:42:22','3:ccbf2af31c91354755b145585f1adf43','SQL From File','rel2',NULL,'2.0.5',342,'EXECUTED'),('bahmni-16','tw','liquibase.xml','2015-06-12 09:42:22','3:1e70c5fa76cd1a8a9d0459ce437d009e','SQL From File','rel3',NULL,'2.0.5',344,'EXECUTED'),('bahmni-17','tw','liquibase.xml','2015-06-12 09:42:22','3:2dced694dd0f4778a33490ab099ef756','SQL From File','rel3',NULL,'2.0.5',345,'EXECUTED'),('bahmni-19','tw','liquibase.xml','2015-06-12 09:42:22','3:52d9923b31a58b0e2c1fb9c3d1d5aa25','SQL From File','rel3',NULL,'2.0.5',347,'EXECUTED'),('bahmni-2','tw','liquibase.xml','2015-06-12 09:42:22','3:5b9223967ffc4864988813db4dc88be6','SQL From File','rel2',NULL,'2.0.5',334,'EXECUTED'),('bahmni-20','tw','liquibase.xml','2015-06-12 09:42:22','3:51dff674d6df91159ea92847a3a9e970','SQL From File','rel3',NULL,'2.0.5',348,'EXECUTED'),('bahmni-25','tw','liquibase.xml','2015-06-12 09:51:35','3:71856a1d7fe4bf6eb1bf99a81b853a82','SQL From File','rel3',NULL,'2.0.5',352,'EXECUTED'),('bahmni-26','tw','liquibase.xml','2015-06-12 09:51:35','3:a2862e0129adc45ea27bcf46ba4a1698','SQL From File','rel3',NULL,'2.0.5',353,'EXECUTED'),('bahmni-27','tw','liquibase.xml','2015-06-12 09:51:35','3:c7184166e3ec80668677966efa251b63','SQL From File','rel3',NULL,'2.0.5',354,'EXECUTED'),('bahmni-28','tw','liquibase.xml','2015-06-12 09:51:35','3:23f221251e83aecc4dd7a7111e7bb726','SQL From File','rel3',NULL,'2.0.5',355,'EXECUTED'),('bahmni-29','tw','liquibase.xml','2015-06-12 09:51:35','3:0998fdf1cb16d20ac72d500b4a4abcf0','SQL From File','rel3',NULL,'2.0.5',356,'EXECUTED'),('bahmni-3','tw','liquibase.xml','2015-06-12 09:42:22','3:3d717ca9342fb21a14ec999b6773e78f','SQL From File','rel2',NULL,'2.0.5',335,'EXECUTED'),('bahmni-30','tw','liquibase.xml','2015-06-12 09:51:35','3:6404f5bea3bc91a0168a723ce0a945f7','Update Data','rel3',NULL,'2.0.5',357,'EXECUTED'),('bahmni-31','tw','liquibase.xml','2015-06-12 09:42:22','3:845a3fea37de2528ca3a25dd9e181490','SQL From File','rel2',NULL,'2.0.5',343,'EXECUTED'),('bahmni-32','tw','liquibase.xml','2015-06-12 09:51:35','3:57fb9812295f1692f9b83a0bcdaf4c06','SQL From File','rel3',NULL,'2.0.5',358,'EXECUTED'),('bahmni-33','tw','liquibase.xml','2015-06-12 09:51:35','3:104cdb183cea698b8be017762c81efaf','SQL From File','rel3',NULL,'2.0.5',359,'EXECUTED'),('bahmni-35','tw','liquibase.xml','2015-06-12 09:51:35','3:33d81235022388bf9b5a3e4d251c49ec','SQL From File','rel3',NULL,'2.0.5',360,'EXECUTED'),('bahmni-36','tw','liquibase.xml','2015-06-12 09:51:35','3:cdcea0ce4c1259fc2387a8014b817006','Custom SQL','Add investigations meta data',NULL,'2.0.5',361,'EXECUTED'),('bahmni-37','tw','liquibase.xml','2015-06-12 09:51:35','3:f12d0201c6ad6833de572087e2d02b03','Custom SQL','Add job for processing reference data',NULL,'2.0.5',373,'EXECUTED'),('bahmni-38','tw','liquibase.xml','2015-06-12 09:51:35','3:84c16b09199f9bf019ebac8755f6b778','Custom SQL','Add job for processing failed reference data',NULL,'2.0.5',374,'EXECUTED'),('bahmni-39','tw','liquibase.xml','2015-06-12 09:51:35','3:390298a50c1fe5e8281e3763cde39f8a','Custom SQL','Update class name of reference data feed task and failed event task.',NULL,'2.0.5',375,'EXECUTED'),('bahmni-4','tw','liquibase.xml','2015-06-12 09:42:22','3:86dabf0c08030df866a7bceaf0a5758e','SQL From File','rel2',NULL,'2.0.5',336,'EXECUTED'),('bahmni-5','tw','liquibase.xml','2015-06-12 09:42:22','3:906a8aec030d1961ee3391a354cb6b68','SQL From File','rel2',NULL,'2.0.5',337,'EXECUTED'),('bahmni-6','tw','liquibase.xml','2015-10-30 10:46:51','3:e62b63150ce704651dd128abb60690ae','SQL From File','rel2',NULL,'2.0.5',555,'EXECUTED'),('bahmni-7','tw','liquibase.xml','2015-06-12 09:42:22','3:971ebef189662030a66c0763c0515aef','SQL From File','rel2',NULL,'2.0.5',338,'EXECUTED'),('bahmni-9','tw','liquibase.xml','2015-10-30 10:54:58','3:44169eaebabb84c89214370224d47062','SQL From File','rel2',NULL,'2.0.5',556,'EXECUTED'),('bahmni-add-previliges-toinpatient-move-201514101850','Banka,Padma','liquibase.xml','2015-10-30 13:28:29','3:954576ea2d823bfd7935c61c11a531f3','Custom SQL','Adding privileges to Inpatient-patient-movement',NULL,'2.0.5',615,'EXECUTED'),('bahmni-add-privilege-reports-role-201528101218','Jaswanth, Padma','liquibase.xml','2015-10-30 13:28:29','3:a619b2df26ce50815febfcf59b6563d5','Custom SQL','Adding privileges to emr-reports role',NULL,'2.0.5',619,'EXECUTED'),('bahmni-add-privileges-to-inpatient-read-201514101540','Banka,Padma','liquibase.xml','2015-10-30 13:28:29','3:59ef1582c31a7e52c7ea2a40755c7f3a','Custom SQL','Relating roles and adding privileges',NULL,'2.0.5',614,'EXECUTED'),('bahmni-add-privileges-to-orders-role-201515101441','Banka,Padma','liquibase.xml','2015-10-30 13:28:29','3:aa39d1f55dbeb81fcf4cf720119c6c8f','Custom SQL','Adding privileges to orders role',NULL,'2.0.5',617,'EXECUTED'),('bahmni-add-privileges-to-patient-document-upload-201515101234','Banka,Padma','liquibase.xml','2015-10-30 13:28:29','3:0bf1f73955956e033314456e06c2cc79','Custom SQL','Adding privileges to patient document upload role',NULL,'2.0.5',616,'EXECUTED'),('bahmni-addprevileges-admin-role-201516101234','Jaswanth,Padma','liquibase.xml','2015-10-30 13:28:29','3:1474552ca7e78cb1bdc776c95b7cbca8','Custom SQL','Adding privileges to admin role',NULL,'2.0.5',618,'EXECUTED'),('bahmni-admin-role-201513101528','Banka,Padma','liquibase.xml','2015-10-30 13:26:20','3:ff3786bb6c0b44ba12aa57eb3a7f9211','Custom SQL','',NULL,'2.0.5',611,'MARK_RAN'),('bahmni-atomfeed-add-event-records-category-index','Achinta, Sudhakar','liquibase.xml','2015-10-30 11:56:25','3:9e2b5cdf52eb8caa784986d0772e6cc8','Create Index','Add index to the category column in event_records table for performance (if it is not already present)',NULL,'2.0.5',597,'EXECUTED'),('bahmni-clinical-1','tw','liquibase.xml','2015-06-12 09:42:22','3:34e384e76217b318152ac490e737311d','SQL From File','rel2',NULL,'2.0.5',339,'EXECUTED'),('bahmni-clinical-10','Vivek','liquibase.xml','2015-10-30 10:54:58','3:df7f3657adbe5e363ef3cd223ea55b42','Custom SQL','Add concept words for adt notes',NULL,'2.0.5',557,'EXECUTED'),('bahmni-clinical-11','Arathy','liquibase.xml','2015-06-12 09:51:35','3:96097718e2a28e38b1e9dec1493d16d6','Custom SQL','Add concept Document',NULL,'2.0.5',366,'EXECUTED'),('bahmni-clinical-12','Arathy','liquibase.xml','2015-06-12 09:51:35','3:b295a4ca56c415a6768aa5f696b51a86','Custom SQL','Add concept-name Document',NULL,'2.0.5',367,'EXECUTED'),('bahmni-clinical-13','Arathy','liquibase.xml','2015-06-12 09:51:35','3:8a417d9214f1ff5607ebcb99447bed6e','Custom SQL','Add Encounter Type Radiology',NULL,'2.0.5',368,'EXECUTED'),('bahmni-clinical-14','Praveen','liquibase.xml','2015-06-12 09:51:35','3:38e8445cf5bc784f372cf5c8a8ce471d','Custom SQL','Add new encounter type for investigation',NULL,'2.0.5',372,'EXECUTED'),('bahmni-clinical-2','tw','liquibase.xml','2015-06-12 09:42:22','3:b922d30c4067bcebeca2089b4ddaf899','SQL From File','rel3',NULL,'2.0.5',346,'EXECUTED'),('bahmni-clinical-201401171353','banka-tw','liquibase.xml','2015-06-12 09:51:35','3:aff3053304cfb5176c57269c71739c7f','Insert Row','',NULL,'2.0.5',369,'EXECUTED'),('bahmni-clinical-201401171415','banka-tw','liquibase.xml','2015-06-12 09:51:35','3:12b0753a2a241925fcc9ac763ad69f19','Insert Row','',NULL,'2.0.5',370,'EXECUTED'),('bahmni-clinical-201401171420','banka-tw','liquibase.xml','2015-06-12 09:51:35','3:b2794090dfbbf4946f77e036915f64d2','Insert Row','',NULL,'2.0.5',371,'EXECUTED'),('bahmni-clinical-201401281730','Banka,RT','liquibase.xml','2015-06-12 09:51:35','3:d97e8d388d129a0fa418f1c172f8fc7a','Custom SQL','Add new encounter type for Lab Result',NULL,'2.0.5',376,'EXECUTED'),('bahmni-clinical-201401311600','TW','liquibase.xml','2015-06-12 09:51:35','3:b2f57e10b5c48c07ba67f00e3cbeafd4','Custom SQL','Add concept set for Lab results',NULL,'2.0.5',377,'EXECUTED'),('bahmni-clinical-201402061215','Angshu,RT','liquibase.xml','2015-06-12 09:51:35','3:8f210ada3640cea55eba55a4e9eef202','Custom SQL','Add new visit type LAB_RESULTS_IN_ABSENTEE',NULL,'2.0.5',378,'EXECUTED'),('bahmni-clinical-201402101443','sush','liquibase.xml','2015-06-12 09:51:35','3:4bf141e0bfa4a5876a3c372d6b18b47d','Insert Row','',NULL,'2.0.5',379,'EXECUTED'),('bahmni-clinical-201402111716','indraneel,neha','liquibase.xml','2015-06-12 09:51:35','3:69ec0c78de56b715740f0df83f58bb07','Insert Row','',NULL,'2.0.5',380,'EXECUTED'),('bahmni-clinical-201402161951','Mujir,Vinay','liquibase.xml','2015-06-12 09:51:35','3:ff1175a61a50b57bb0ec08bde9868699','Custom SQL','Creating new visit type DRUG_ORDER',NULL,'2.0.5',381,'EXECUTED'),('bahmni-clinical-201402201226','Neha,Indraneel','liquibase.xml','2015-06-12 09:51:35','3:3f33243a98921ae1eb6ab592975fcb83','Custom SQL','deleting visit types DRUG_ORDER and LAB_RESULTS_IN_ABSENTEE',NULL,'2.0.5',382,'EXECUTED'),('bahmni-clinical-201402201520','Angshu','liquibase.xml','2015-06-12 09:51:35','3:3d3b3a36eb78c97c58b86a081891a3a6','Custom SQL','Add global property for emr primary identifier type',NULL,'2.0.5',383,'MARK_RAN'),('bahmni-clinical-201402201530','Angshu','liquibase.xml','2015-06-12 09:51:35','3:7732759315b8a6f9a80b2d9511e65df3','Custom SQL','set global property value for emr primary identifier type',NULL,'2.0.5',384,'EXECUTED'),('bahmni-clinical-201402201700','D3','liquibase.xml','2015-06-12 09:51:35','3:f40a6708845094ce8ce63ae5f380d06a','Custom SQL','Remove unused app:documents privilege',NULL,'2.0.5',385,'EXECUTED'),('bahmni-clinical-201402251700','Mihir,Vinay','liquibase.xml','2015-06-12 09:51:35','3:a5681ca224c60d3e061c25b44963810f','Custom SQL','Add new concept to mark referred out tests',NULL,'2.0.5',386,'EXECUTED'),('bahmni-clinical-201402281633','Indraneel,Neha','liquibase.xml','2015-06-12 09:51:35','3:dcaba2c3fdfec0163dc655ad0afb1082','Custom SQL','Add concept Lab Order Notes',NULL,'2.0.5',387,'EXECUTED'),('bahmni-clinical-201402281635','Indraneel,Neha','liquibase.xml','2015-06-12 09:51:35','3:2e73b0f164e55c909b6e691876865e84','Custom SQL','Add concept-name Lab Order Notes',NULL,'2.0.5',388,'EXECUTED'),('bahmni-clinical-201403051245','Neha','liquibase.xml','2015-06-12 09:51:36','3:3939c112bbe0258754c497ab69af6e12','Custom SQL','Delete concept Lab Order Notes',NULL,'2.0.5',389,'EXECUTED'),('bahmni-clinical-201403051246','Neha','liquibase.xml','2015-06-12 09:51:36','3:329689d0b840f0e9a3986929ec73b5ac','Custom SQL','Add new concept to lab order notes',NULL,'2.0.5',390,'EXECUTED'),('bahmni-clinical-201408251220','D3','liquibase.xml','2015-06-12 09:51:36','3:2a9c6f8331661177cb6790e285489b8c','Insert Row','',NULL,'2.0.5',444,'EXECUTED'),('bahmni-clinical-201502091501','Charles, Banka','liquibase.xml','2015-06-12 11:21:06','3:6dd4a68e60bb3739959d4de690495665','Custom SQL','Adding Undo Discharge disposition',NULL,'2.0.5',526,'EXECUTED'),('bahmni-clinical-201521091403','Banka,Sravanthi','liquibase.xml','2015-10-30 11:03:07','3:f14611cff91cb2ec630ef19c35b44f7d','Custom SQL','Add Patient-Listing role',NULL,'2.0.5',580,'MARK_RAN'),('bahmni-clinical-201521091410','Banka,Sravanthi','liquibase.xml','2015-10-30 11:05:21','3:e120a391b33ebb51d07890188a82b68a','Custom SQL','Add clinical read only role',NULL,'2.0.5',582,'MARK_RAN'),('bahmni-clinical-201522091112','Banka,Sravanthi','liquibase.xml','2015-10-30 11:06:49','3:95e65ab8523e33c46449a27529761564','Custom SQL','Add consultation save',NULL,'2.0.5',584,'MARK_RAN'),('bahmni-clinical-201522091116','Banka,Sravanthi','liquibase.xml','2015-10-30 11:08:21','3:ef2005859396b956f5cfff0faf01e86f','Custom SQL','Add consultation observation role',NULL,'2.0.5',586,'MARK_RAN'),('bahmni-clinical-201522091120','Banka,Sravanthi','liquibase.xml','2015-10-30 11:13:11','3:7b515e042e6a396312c570a483c16fb3','Custom SQL','Add consultation diagnosis role',NULL,'2.0.5',588,'MARK_RAN'),('bahmni-clinical-201522091124','Banka,Sravanthi','liquibase.xml','2015-10-30 11:14:13','3:3fde96338a056cd7a799030fc65c46b3','Custom SQL','Add consultation disposition role',NULL,'2.0.5',590,'MARK_RAN'),('bahmni-clinical-201522091128','Banka,Sravanthi','liquibase.xml','2015-10-30 11:15:09','3:401edbbbb5d76e58c10775c85e932678','Custom SQL','Add consultation treatment role',NULL,'2.0.5',592,'MARK_RAN'),('bahmni-clinical-201522091132','Banka,Sravanthi','liquibase.xml','2015-10-30 11:15:59','3:02ff4f8d72d613a2b1e4df41c1f2f774','Custom SQL','Add consultation orders role',NULL,'2.0.5',594,'MARK_RAN'),('bahmni-clinical-3','tw','liquibase.xml','2015-06-12 09:51:35','3:ff0ea55df8dd84badce2237d4eb70a7a','SQL From File','rel3',NULL,'2.0.5',349,'EXECUTED'),('bahmni-clinical-4','tw','liquibase.xml','2015-06-12 09:51:35','3:b22c6c767be128f3128c7ea800e8b47e','SQL From File','rel3',NULL,'2.0.5',350,'EXECUTED'),('bahmni-clinical-5','tw','liquibase.xml','2015-06-12 09:51:35','3:227ebbe447bd5b3e764f4e0bcfdbe021','SQL From File','rel3',NULL,'2.0.5',351,'EXECUTED'),('bahmni-clinical-6','Hemanth','liquibase.xml','2015-06-12 09:51:35','3:c75b673e4419804e8aca3be5790f4053','Custom SQL','Add concept Adt Notes',NULL,'2.0.5',362,'EXECUTED'),('bahmni-clinical-7','Hemanth','liquibase.xml','2015-06-12 09:51:35','3:28f7f98a4a673080c65343436365b87b','Custom SQL','Add concept-name Adt Notes',NULL,'2.0.5',363,'EXECUTED'),('bahmni-clinical-8','Praveen','liquibase.xml','2015-06-12 09:51:35','3:3c50596a2f2c5bebd3c31fd35d1d5d0c','Custom SQL','Add encounter session duration',NULL,'2.0.5',364,'EXECUTED'),('bahmni-clinical-9','Praveen','liquibase.xml','2015-06-12 09:51:35','3:6eac241cb62addb4c395842f456321ee','Custom SQL','Add custom encounter session matcher',NULL,'2.0.5',365,'EXECUTED'),('bahmni-clinical-retrospective-201501221417','Vikash, Sravanthi','liquibase.xml','2015-06-12 11:21:06','3:0fd170a3d78b9b44204644a55cb58954','Insert Row','',NULL,'2.0.5',525,'EXECUTED'),('bahmni-core-201403110603','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:a7cf75e89024bba1b6d31d494ca8ece3','Custom SQL','Add new concept for test and panel',NULL,'2.0.5',391,'EXECUTED'),('bahmni-core-201403181515','Hemanth,Vinay','liquibase.xml','2015-06-12 09:51:36','3:8f918521411f7968ab79f5baed8c18ce','Custom SQL','Add new concept for observation group (XCompoundObservation)',NULL,'2.0.5',392,'EXECUTED'),('bahmni-core-201403191725','Hemanth,Vinay','liquibase.xml','2015-06-12 09:51:36','3:b354caabf0905f5a23a2b0cebfacb267','Custom SQL','Add new concept for observation group (XCompoundObservation)',NULL,'2.0.5',393,'EXECUTED'),('bahmni-core-201403251424','Mujir','liquibase.xml','2015-06-12 09:51:36','3:92ba70a6b6e3fd8fde0f6b3b32318118','Custom SQL','Add new concept for Ruled Out Diagnosis',NULL,'2.0.5',394,'EXECUTED'),('bahmni-core-201404021353','Hemanth, Mihir','liquibase.xml','2015-06-12 09:51:36','3:db0b6d363a7afd98272a64f7ebfc31d5','Custom SQL','adding givenNameLocal person attribute type',NULL,'2.0.5',395,'EXECUTED'),('bahmni-core-201404021359','Hemanth, Mihir','liquibase.xml','2015-06-12 09:51:36','3:0b72981ca7294dc56cb2e2ecf387b183','Custom SQL','adding familyNameLocal person attribute type',NULL,'2.0.5',396,'EXECUTED'),('bahmni-core-201404021400','Hemanth, Mihir','liquibase.xml','2015-06-12 09:51:36','3:565049e112d458b650b2612891d99225','Custom SQL','adding middleNameLocal person attribute type',NULL,'2.0.5',397,'EXECUTED'),('bahmni-core-201404081612','Indraneel, Mihir','liquibase.xml','2015-06-12 09:51:36','3:5f00e15d25fb33cdcccd6e6c9497a896','Custom SQL','Adding Lab Manager Notes Concept',NULL,'2.0.5',400,'EXECUTED'),('bahmni-core-201404081624','Vivek, Shruthi','liquibase.xml','2015-06-12 09:51:36','3:de1eb764ca23267d6367b552f5bafeb6','Custom SQL','Adding diagnosis meta data concepts',NULL,'2.0.5',399,'EXECUTED'),('bahmni-core-201404081625','Indraneel, Mihir','liquibase.xml','2015-06-12 09:51:36','3:358898ceba2ae7ab1809cbc287880fc4','Custom SQL','Adding Lab Manager Notes Provider',NULL,'2.0.5',401,'EXECUTED'),('bahmni-core-201404091217','sushmitharaos, arathyjan','liquibase.xml','2015-06-12 09:51:36','3:a62e2c394c0a0078c09a9f0bd57840e7','Insert Row','add encounter type for patient document upload',NULL,'2.0.5',398,'EXECUTED'),('bahmni-core-201404101558','Indraneel, Neha','liquibase.xml','2015-06-12 09:51:36','3:48b91f5f30aa317e99a9f68e28efa3c4','Custom SQL','Adding Accession Uuid Concept',NULL,'2.0.5',402,'EXECUTED'),('bahmni-core-201404101600','Neha,Indraneel','liquibase.xml','2015-06-12 09:51:36','3:014366343276fba18ee961dc2bb7d4dc','Custom SQL','Add Encounter Type Validation Notes',NULL,'2.0.5',403,'EXECUTED'),('bahmni-core-201404211500','RT, Shruthi','liquibase.xml','2015-06-12 09:51:36','3:64b838a26669076ebcb6024a9f379803','Insert Row','add concept class Concept Attribute',NULL,'2.0.5',404,'EXECUTED'),('bahmni-core-201404281212','RT, Neha','liquibase.xml','2015-06-12 09:51:36','3:00fc3bb8433b82881f19e12948b2f167','Custom SQL','add concept numeric feild to all numeric concepts',NULL,'2.0.5',405,'EXECUTED'),('bahmni-core-201404281819','RT, Mujir','liquibase.xml','2015-06-12 09:51:36','3:1aff18cfedb228e447bf32a4b2a1da09','Insert Row','add concept class Abnormal',NULL,'2.0.5',406,'EXECUTED'),('bahmni-core-201404281820','RT, Mujir','liquibase.xml','2015-06-12 09:51:36','3:4387bcba34e892eef9cb011d9e173125','Insert Row','add concept class Duration',NULL,'2.0.5',407,'EXECUTED'),('bahmni-core-201404281823','RT, Mujir','liquibase.xml','2015-06-12 09:51:36','3:7cae6e5965378823cfcd5c756e20b984','SQL From File','add concept numeric proc',NULL,'2.0.5',408,'EXECUTED'),('bahmni-core-201404281825','RT, Mujir','liquibase.xml','2015-06-12 09:51:36','3:3b70950b84cfb887e120ba3703f03d8b','Insert Row','add concept class Concept Details',NULL,'2.0.5',409,'EXECUTED'),('bahmni-core-201404301204','RT, Mujir','liquibase.xml','2015-06-12 09:51:36','3:92ca76185ae9466fa1d67996263439aa','SQL From File','delete Concept Proc',NULL,'2.0.5',410,'EXECUTED'),('bahmni-core-201404301520','D3','liquibase.xml','2015-06-12 09:51:36','3:95dbc7a307cda404901615be33a3c95d','Custom SQL','Configure EMR API admit and discharge encounter type',NULL,'2.0.5',411,'EXECUTED'),('bahmni-core-201405041511','Mujir','liquibase.xml','2015-06-12 09:51:36','3:4387bcba34e892eef9cb011d9e173125','Insert Row','add concept class Duration',NULL,'2.0.5',412,'MARK_RAN'),('bahmni-core-201405061428','vinay','liquibase.xml','2015-06-12 09:51:36','3:d7d68a7375b05440ca8bda373b4ac5fa','Custom SQL (x2)','Fix delete_concept',NULL,'2.0.5',413,'EXECUTED'),('bahmni-core-201405061543','mujir','liquibase.xml','2015-06-12 09:51:36','3:2877b9c25cad758126432088e665ce9e','Custom SQL (x2)','Fix delete_concept. deleting concept set membership for the concept to be deleted.',NULL,'2.0.5',416,'EXECUTED'),('bahmni-core-201405071329','mujir','liquibase.xml','2015-06-12 09:51:36','3:ee64ac25598217cc8c573909029dc1b2','Custom SQL','add adt notes data concept set',NULL,'2.0.5',414,'EXECUTED'),('bahmni-core-201405081436','mujir','liquibase.xml','2015-06-12 09:51:36','3:bddad684724dec5a676c650bb36ec6d9','Custom SQL','remove adt notes data concept set',NULL,'2.0.5',415,'EXECUTED'),('bahmni-core-201405091936','rohan','liquibase.xml','2015-06-12 09:51:36','3:934b844aa6789e274c71a45a1d3a3435','Custom SQL','Change sort weight for Admit Patients.',NULL,'2.0.5',417,'EXECUTED'),('bahmni-core-201405110939','rohan','liquibase.xml','2015-06-12 09:51:36','3:7b9cc2d4c1ae2effbad88539be46f414','Custom SQL','Change sort weight for Discharge Patients.',NULL,'2.0.5',418,'EXECUTED'),('bahmni-core-201405110940','rohan','liquibase.xml','2015-06-12 09:51:36','3:a7a3f5ff1d8092f32fbe32494c20b0e8','Custom SQL','Change sort weight for Transfer Patients.',NULL,'2.0.5',419,'EXECUTED'),('bahmni-core-201405161709','d3','liquibase.xml','2015-06-12 09:51:36','3:752289f5803016fad52abe864a8278c5','Custom SQL','Update webservices.rest.maxResultsAbsolute to 1000',NULL,'2.0.5',420,'EXECUTED'),('bahmni-core-201405211239','d3','liquibase.xml','2015-06-12 09:51:36','3:7f794f2e97397f6e73645e03b39b96f3','Custom SQL','Add global property bahmni.cacheHeadersFilter.expiresDuration',NULL,'2.0.5',421,'EXECUTED'),('bahmni-core-201407011716','Crude Oil with our names','liquibase.xml','2015-06-12 09:51:36','3:50f3e10d1298194444378351763b2cad','Custom SQL','Add person name for lab and billing system users',NULL,'2.0.5',422,'EXECUTED'),('bahmni-core-201407141716','vinay','liquibase.xml','2015-06-12 09:51:36','3:1b7bdedea1809fa49e2357d93d77667e','Custom SQL','New privileges added',NULL,'2.0.5',423,'MARK_RAN'),('bahmni-core-201407141717','vinay','liquibase.xml','2015-06-12 09:51:36','3:cdc8c96250bdd912a4ddb651455b1626','Custom SQL','New privileges added',NULL,'2.0.5',424,'MARK_RAN'),('bahmni-core-201407141718','vinay','liquibase.xml','2015-06-12 09:51:36','3:35fb7afbad0ecf4121535a78d37d434d','Custom SQL','New privileges added',NULL,'2.0.5',425,'MARK_RAN'),('bahmni-core-201407161230','Rohan,Indraneel','liquibase.xml','2015-06-12 09:51:36','3:7bf3cd7d49ce7dafffe72f374be18ef7','Custom SQL','Global property pointing to the new encounter provider only session matcher',NULL,'2.0.5',426,'EXECUTED'),('bahmni-core-201407161630','Vinay','liquibase.xml','2015-06-12 09:51:36','3:896c71a461a51901e495846d9568e544','Custom SQL','Set dosing type and dosing instructions',NULL,'2.0.5',427,'EXECUTED'),('bahmni-core-201407171215','Vinay,Indraneel','liquibase.xml','2015-06-12 09:51:36','3:0275db96cf7766acc2e567c277f33764','Custom SQL','Adding concepts and concept set related to dosing units',NULL,'2.0.5',434,'EXECUTED'),('bahmni-core-201407171300','Vinay, Indraneel','liquibase.xml','2015-06-12 09:51:36','3:54519e86ea15b431d784b19eff6067b7','Custom SQL','Add drug routes and set global property',NULL,'2.0.5',435,'EXECUTED'),('bahmni-core-201407171606','Rohan, D3','liquibase.xml','2015-06-12 09:51:36','3:b556c13ad3d26a0f3c9eed4f1382a7ae','Insert Row','add concept class Image',NULL,'2.0.5',428,'EXECUTED'),('bahmni-core-201407171700','Vinay, Indraneel','liquibase.xml','2015-06-12 09:51:36','3:de28ce73c4e41ade2f900d398d9753da','Custom SQL','Adding duration unit concepts and setting up associated global property',NULL,'2.0.5',436,'EXECUTED'),('bahmni-core-201407171715','Vinay, Indraneel','liquibase.xml','2015-06-12 09:51:36','3:12d3502354c39fd991e9afc00acc3d47','Custom SQL','',NULL,'2.0.5',437,'EXECUTED'),('bahmni-core-201407180800','Shruthi','liquibase.xml','2015-06-12 09:51:36','3:e0046ba1e9356e7aa14ccf0528d1ef29','Insert Row','add concept class Computed',NULL,'2.0.5',429,'EXECUTED'),('bahmni-core-201407221627','Rohan, Shruthi','liquibase.xml','2015-06-12 09:51:36','3:ae9d9db98dd6afb973e032c3823a32c0','Custom SQL','Update custom encounter session matcher',NULL,'2.0.5',430,'EXECUTED'),('bahmni-core-201407221628','Rohan, Shruthi','liquibase.xml','2015-06-12 09:51:36','3:fa1b0ddecdad7fb9ddf999b5d1400c73','Custom SQL','Update custom encounter session matcher',NULL,'2.0.5',431,'EXECUTED'),('bahmni-core-201407251510','D3','liquibase.xml','2015-06-12 09:51:36','3:acf71b92965d81b21ef014bb4420423e','Custom SQL','Set quantity for drug orders without this data',NULL,'2.0.5',432,'EXECUTED'),('bahmni-core-201407251511','D3','liquibase.xml','2015-06-12 09:51:36','3:605537996398b795b128d19a73a6861f','Custom SQL','Set num_refills for drug orders without this data',NULL,'2.0.5',433,'EXECUTED'),('bahmni-core-201407291254','Vinay, Deepak','liquibase.xml','2015-06-12 09:51:36','3:c5fb8666de9d6276605c2967e0b63a07','Custom SQL','',NULL,'2.0.5',438,'EXECUTED'),('bahmni-core-201408111300','Indraneel','liquibase.xml','2015-06-12 09:51:36','3:6eb4aee038ee589bf2e94b5849781993','Custom SQL','Adding all templates concept set of sets',NULL,'2.0.5',439,'EXECUTED'),('bahmni-core-201408130010','Mujir','liquibase.xml','2015-06-12 09:51:36','3:4634c70a8714f77cc4f09f75a46c35cf','Create Table','',NULL,'2.0.5',441,'EXECUTED'),('bahmni-core-20140814132600','Rohan, Vinay','liquibase.xml','2015-06-12 09:51:36','3:4b2d7c60345d83f405fc7d568782d974','Custom SQL','Update Dosing type from ENUM to Class Name',NULL,'2.0.5',440,'EXECUTED'),('bahmni-core-201408180936','Mujir, Mihir','liquibase.xml','2015-06-12 09:51:36','3:8345ac4cbbbe7691f7d51bb463e05e33','Custom SQL','Add directory for imported files',NULL,'2.0.5',442,'EXECUTED'),('bahmni-core-201408251140','Sravanthi,Indraneel','liquibase.xml','2015-06-12 09:51:36','3:a01a6c591d40a29a8d2e551529d9ea24','Custom SQL','Introducing Obs relationship type and obs relationship tables',NULL,'2.0.5',443,'EXECUTED'),('bahmni-core-201408251455','Rohan','liquibase.xml','2015-06-12 09:51:36','3:bfb4ec1cd7176b82015430375f808ff7','Insert Row','add concept class URL',NULL,'2.0.5',445,'EXECUTED'),('bahmni-core-201408251456','Rohan','liquibase.xml','2015-06-12 09:51:36','3:9270f8241c0bcc95aae7c60a990ab009','Custom SQL','Add new concept LAB REPORT for uploaded file',NULL,'2.0.5',446,'EXECUTED'),('bahmni-core-201409041224','Banka','liquibase.xml','2015-06-12 09:51:36','3:5314334d0e48280727b45a8f22b34656','Insert Row','Add View Location privilege to Anonymous',NULL,'2.0.5',447,'EXECUTED'),('bahmni-core-201409041530','Rohan, Sravanthi','liquibase.xml','2015-06-12 09:51:36','3:fe380da25273bd4b920df5637e4c9cb2','Custom SQL','Adding hours, weeks and months concepts for drug order duration units',NULL,'2.0.5',457,'EXECUTED'),('bahmni-core-201409081432','Rohan, Vinay','liquibase.xml','2015-06-12 09:51:36','3:917f62fb045c3d4202989f959bfdf442','Custom SQL, SQL From File','rel2',NULL,'2.0.5',459,'EXECUTED'),('bahmni-core-20140908172845','Indraneel, Hemanth','liquibase.xml','2015-06-12 09:51:36','3:e57f6102ea40940c68b275b88d642cfc','Custom SQL','Add Impression concept',NULL,'2.0.5',462,'EXECUTED'),('bahmni-core-201409091224','Mihir, Shruthi','liquibase.xml','2015-06-12 09:51:36','3:70f412df64a299dbe9095f23e2210337','Custom SQL','Removing global property for encounter provider matcher',NULL,'2.0.5',458,'EXECUTED'),('bahmni-core-201409111200','Rohan, Vinay','liquibase.xml','2015-06-12 09:51:36','3:f660b79706d6f01b191fb373ad9435b5','Custom SQL','Adding tablet and capsule concepts to dosing units',NULL,'2.0.5',460,'EXECUTED'),('bahmni-core-201409161415','Indraneel','liquibase.xml','2015-06-12 09:51:36','3:282e2d5bec259d3eee586166f59dd687','Custom SQL','Adding obs relationship type : qualified-by',NULL,'2.0.5',463,'EXECUTED'),('bahmni-core-201409171047','Rohan, Hemanth','liquibase.xml','2015-06-12 09:51:36','3:2e9fffc9eb0bec612e04cb7803c233a9','Custom SQL, SQL From File','Fix the new add_concept procedure',NULL,'2.0.5',464,'EXECUTED'),('bahmni-core-201409171530','D3','liquibase.xml','2015-06-12 09:51:36','3:0c23ec6c66daaf133bd9ce23bcf7a7e8','Update Data','Rename OPD encounter type to Consultation',NULL,'2.0.5',465,'EXECUTED'),('bahmni-core-201409241028','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:a52883341c3b7bcefeb8689816098bf3','Custom SQL','Insert concept reference source for Duration units',NULL,'2.0.5',448,'EXECUTED'),('bahmni-core-201409241048','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:d755817db3f8a70bee6a7104446c82ea','Custom SQL','Insert concept reference term for Second(s)',NULL,'2.0.5',449,'EXECUTED'),('bahmni-core-201409241115','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:017e0e35c9599f0ad837e4fa5c4b944f','Custom SQL','Insert concept reference term for Minute(s)',NULL,'2.0.5',450,'EXECUTED'),('bahmni-core-201409241116','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:634ea355d327fac9b885f077f43e0a10','Custom SQL','Insert concept reference term for Hour(s)',NULL,'2.0.5',451,'EXECUTED'),('bahmni-core-201409241117','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:492b1d5c124c0eebf66b0f1d202ce6a7','Custom SQL','Insert concept reference term for Day(s)',NULL,'2.0.5',452,'EXECUTED'),('bahmni-core-201409241119','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:3bd0859c6ee97249a0b480340dd94157','Custom SQL','Insert concept reference term for Week(s)',NULL,'2.0.5',453,'EXECUTED'),('bahmni-core-201409241120','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:504e20ad4760ce186fe3c3bbc0ce72cf','Custom SQL','Insert concept reference term for Month(s)',NULL,'2.0.5',454,'EXECUTED'),('bahmni-core-201409241122','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:b3dd815d38fd788346eb1698e059e65b','Custom SQL','Insert concept reference term for Year(s)',NULL,'2.0.5',455,'EXECUTED'),('bahmni-core-201409241123','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:2200e99bc72d84b0d8943d6f5ed3f6c4','Custom SQL','Insert concept reference term for Time(s)',NULL,'2.0.5',456,'EXECUTED'),('bahmni-core-201409241126','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:3217972efe467098854e3c9aef041997','Custom SQL','Update hl7_code for concept reference source \'ISO 8601 Duration\'',NULL,'2.0.5',466,'EXECUTED'),('bahmni-core-201409241137','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:37817503da1a1c1ae344a405f4bac33a','Custom SQL','Update code for concept reference term \'Second(s)\'',NULL,'2.0.5',467,'EXECUTED'),('bahmni-core-201409241138','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:062aa018bb9de732d8a2931e7d318c65','Custom SQL','Update code for concept reference term \'Minute(s)\'',NULL,'2.0.5',468,'EXECUTED'),('bahmni-core-201409241139','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:43cc47425272c2a5c556822f09f71664','Custom SQL','Update code for concept reference term \'Hour(s)\'',NULL,'2.0.5',469,'EXECUTED'),('bahmni-core-201409241140','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:33a385e72bbc4c7fc51ca97c262c0ac6','Custom SQL','Update code for concept reference term \'Day(s)\'',NULL,'2.0.5',470,'EXECUTED'),('bahmni-core-201409241141','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:2285903234ce86b7ff5b0e85b8362ee3','Custom SQL','Update code for concept reference term \'Week(s)\'',NULL,'2.0.5',471,'EXECUTED'),('bahmni-core-201409241142','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:7318ad8dd850b67974c10ca515e9eee3','Custom SQL','Update code for concept reference term \'Month(s)\'',NULL,'2.0.5',472,'EXECUTED'),('bahmni-core-201409241143','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:4b36f0c93fa37c26f070f515bcf90f4f','Custom SQL','Update code for concept reference term \'Year(s)\'',NULL,'2.0.5',473,'EXECUTED'),('bahmni-core-201409241144','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:a31b734f90d0bdceb02eb121d545b12d','Custom SQL','Update code for concept reference term \'Time(s)\'',NULL,'2.0.5',474,'EXECUTED'),('bahmni-core-201409241241','Hemanth','liquibase.xml','2015-06-12 09:51:36','3:a2fdf0b98ce6e647a67fcf72d1602c2a','Custom SQL','Update name for concept reference source \'ISO 8601 Duration\'',NULL,'2.0.5',475,'EXECUTED'),('bahmni-core-201409242241','Mihir','liquibase.xml','2015-06-12 09:51:36','3:85f1c39ec6e637168365072e127ae614','Custom SQL','Add concept class for lab samples',NULL,'2.0.5',476,'EXECUTED'),('bahmni-core-201409242242','Mihir','liquibase.xml','2015-06-12 09:51:36','3:92951fdf76763a1f103aab84039c954b','Custom SQL','Add concept class for lab samples',NULL,'2.0.5',477,'EXECUTED'),('bahmni-core-201409242248','Mihir','liquibase.xml','2015-06-12 11:21:06','3:d47ca3bee89798ca0536a1f10ea4ef26','Custom SQL','Migrate sample concepts to concept class sample',NULL,'2.0.5',478,'EXECUTED'),('bahmni-core-201409242256','Mihir','liquibase.xml','2015-06-12 11:21:06','3:32ad984ea5e58c269236f0749cf4e48b','Custom SQL','Migrate department concepts to concept class department',NULL,'2.0.5',479,'EXECUTED'),('bahmni-core-201409242259','Mihir','liquibase.xml','2015-06-12 11:21:06','3:c0673760d0e658fe57e5f3ef6b33e4ee','Custom SQL','Rename Laboratory concept to Lab Samples',NULL,'2.0.5',480,'EXECUTED'),('bahmni-core-201409291027','Chethan,Banka','liquibase.xml','2015-06-12 11:21:06','3:84a5e078a1a51d9660ccc15c22de28a5','Custom SQL','Adding concepts and concept set related to dosing units',NULL,'2.0.5',482,'EXECUTED'),('bahmni-core-201409291037','Chethan, Banka','liquibase.xml','2015-06-12 11:21:06','3:19a7fca2175a4d086a1d287c1fc16a2e','Custom SQL','Adding order frequencies',NULL,'2.0.5',483,'EXECUTED'),('bahmni-core-201409291106','Chethan,Banka','liquibase.xml','2015-06-12 11:21:06','3:639dc8eb7af443e834803df9f4d68640','Custom SQL','Add drug routes and delete Percutaneous Endoscopic Gastrostomy',NULL,'2.0.5',484,'EXECUTED'),('bahmni-core-201409291458','Chethan,Banka','liquibase.xml','2015-06-12 11:21:06','3:79f42ff307a4f1e360b2bb662d857503','Custom SQL','Adding concepts and concept set related to quantity units',NULL,'2.0.5',485,'EXECUTED'),('bahmni-core-201409291704','Chethan,Banka','liquibase.xml','2015-06-12 11:21:06','3:d2cf22581d5d4e27461e29922e989ad6','Custom SQL','Changing names for Duration Units, Dose Units',NULL,'2.0.5',486,'EXECUTED'),('bahmni-core-201409291720','Chethan,Banka','liquibase.xml','2015-06-12 11:21:06','3:02b03571686d026827b06aeac801f33f','Custom SQL','Changing sort order for dose units',NULL,'2.0.5',487,'EXECUTED'),('bahmni-core-201409291830','Indraneel','liquibase.xml','2015-06-12 11:21:06','3:cf2510d1515e0be6877365aa75e18dda','Custom SQL','Adding All Disease Templates Concept Set',NULL,'2.0.5',481,'EXECUTED'),('bahmni-core-201409301255','Chethan,Banka','liquibase.xml','2015-06-12 11:21:06','3:5ece24df97ddfc91a7e0dac70970420a','Custom SQL','Changing sort order for dose quantity units',NULL,'2.0.5',488,'EXECUTED'),('bahmni-core-201410061440','Chethan, Banka','liquibase.xml','2015-06-12 11:21:06','3:46d150e6535dce6a39468ede129b5971','Update Data','Updating GP encounter feed publish url to publish BahmniEncounterTransaction',NULL,'2.0.5',490,'EXECUTED'),('bahmni-core-201410071237','D3,Arun','liquibase.xml','2015-06-12 11:21:06','3:f66d3924fa8cedc2bf684f3b63661df2','Custom SQL','Add index for orders date_activated',NULL,'2.0.5',489,'EXECUTED'),('bahmni-core-201410101048','Rohan, Chethan','liquibase.xml','2015-06-12 11:21:06','3:e2ec1e578015fb9f9e57bf1a9d4c9f6c','Custom SQL','Remove class name of reference data feed task and failed event task.',NULL,'2.0.5',491,'EXECUTED'),('bahmni-core-201410101436','banka','liquibase.xml','2015-06-12 11:21:06','3:49bcfd5ece7864cf1fea3ff911cac945','Custom SQL','Add role for clinical read only access',NULL,'2.0.5',492,'EXECUTED'),('bahmni-core-201410101440','banka','liquibase.xml','2015-06-12 11:21:06','3:89820b864e5a6b5d8a78cec170a389f4','Custom SQL','Add role for clinical full access',NULL,'2.0.5',493,'EXECUTED'),('bahmni-core-201410101446','banka','liquibase.xml','2015-06-12 11:21:06','3:08eb29e78b128ef927ef0b0bdc7ebdb3','Custom SQL','Add privileges for clinical read only',NULL,'2.0.5',499,'EXECUTED'),('bahmni-core-201410101530','banka','liquibase.xml','2015-06-12 11:21:06','3:ec590bd2a83b0e5d853456ad298d9b51','Custom SQL','Add privileges for clinical full access',NULL,'2.0.5',500,'EXECUTED'),('bahmni-core-201410151040','Mihir, Bharti','liquibase.xml','2015-06-12 11:21:06','3:9fb176d07517057d53d58fa041632507','Custom SQL','Rename Laboratory concept to Lab Samples',NULL,'2.0.5',501,'EXECUTED'),('bahmni-core-201410151525','Rohan, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:eaa11859b70513eb63c8d92bcf5ec93e','Custom SQL','',NULL,'2.0.5',494,'EXECUTED'),('bahmni-core-201410151526','Rohan, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:bf69c8d3b45b9b5afa53eb61b05dd9c9','Custom SQL','',NULL,'2.0.5',495,'EXECUTED'),('bahmni-core-201410151527','Rohan, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:c62611f7fde198bf9f8f313c8f45a152','Custom SQL','',NULL,'2.0.5',496,'EXECUTED'),('bahmni-core-201410151528','Rohan, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:e9f0181382af2500fca26a23a101b72c','Custom SQL','',NULL,'2.0.5',497,'EXECUTED'),('bahmni-core-201410151529','Rohan, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:5732866304d64c3c09b0f7d33bd4c597','Custom SQL','',NULL,'2.0.5',498,'EXECUTED'),('bahmni-core-201410211423','d3, rohan','liquibase.xml','2015-06-12 11:21:06','3:8ae3539c536db5b1764383bf375b1b9e','Custom SQL','Set global property default_locale to en',NULL,'2.0.5',502,'EXECUTED'),('bahmni-core-201410301713','Vinay','liquibase.xml','2015-06-12 11:21:06','3:57931e6b3ca38718868e5ab6816178d4','Custom SQL, SQL From File','Fix the new add_concept procedure',NULL,'2.0.5',503,'EXECUTED'),('bahmni-core-201411031108','Vinay, sravanthi','liquibase.xml','2015-06-12 11:21:06','3:b776c63935051e50c3a6843e15385e29','Custom SQL','Adding new concept for Tablet as drug form',NULL,'2.0.5',505,'EXECUTED'),('bahmni-core-201411031129','Vinay, sravanthi','liquibase.xml','2015-06-12 11:21:06','3:d7739d182bb0c0a5f6a33956a4603fba','Custom SQL','Adding new concept for Capsule as drug form',NULL,'2.0.5',506,'EXECUTED'),('bahmni-core-201411031131','Vinay, sravanthi','liquibase.xml','2015-06-12 11:21:06','3:1cf139ef7639540526e88d252ce0af87','Custom SQL','Update drug table to use the new drug forms created',NULL,'2.0.5',507,'EXECUTED'),('bahmni-core-201411041237','Vinay','liquibase.xml','2015-06-12 11:21:06','3:2c9da09899bc00752594c4e392c6c63c','Custom SQL','Ensure drug orders are always in units',NULL,'2.0.5',508,'EXECUTED'),('bahmni-core-201411041711','Vinay','liquibase.xml','2015-06-12 11:21:06','3:0b73f2814a7c5ad62289161c95b219aa','Custom SQL','Make sure doseUnits and dosingInstructions for reverse synced drug orders are sane',NULL,'2.0.5',509,'EXECUTED'),('bahmni-core-201411051148','Rohan','liquibase.xml','2015-06-12 11:21:06','3:4ee59ead112dd07062881f76eefa80cc','Custom SQL','Add concept class LabTest',NULL,'2.0.5',510,'EXECUTED'),('bahmni-core-201411051149','Rohan','liquibase.xml','2015-06-12 11:21:06','3:2c9d283f4944a421b69b9f0525c56213','Custom SQL','Add concept class Radiology',NULL,'2.0.5',511,'EXECUTED'),('bahmni-core-201411061606','Vinay, Mihir','liquibase.xml','2015-06-12 11:21:06','3:5db4ef15d594ec4dae9011474ae63e5d','Insert Row','Default chunking history entry if doesn\'t exist.',NULL,'2.0.5',513,'EXECUTED'),('bahmni-core-201411131512','D3','liquibase.xml','2015-06-12 11:21:06','3:949668dcd8829d9c6afdf03fece00830','Custom SQL','Add drug routes Topical, Nasal, Inhalation',NULL,'2.0.5',512,'EXECUTED'),('bahmni-core-201411141310','D3','liquibase.xml','2015-06-12 11:21:06','3:6188bf0917228defa2c058eb141f90df','Custom SQL, SQL From File','Fix the new add_concept procedure',NULL,'2.0.5',504,'EXECUTED'),('bahmni-core-201411141315','D3','liquibase.xml','2015-06-12 11:21:06','3:809f03e798fc7bb172ed69ed2860d093','Custom SQL','Fix concepts created in liquibase without uuid',NULL,'2.0.5',514,'EXECUTED'),('bahmni-core-201412031050','Swathi','liquibase.xml','2015-06-12 11:21:06','3:c114f261f1e82d4f5ac1b4329df5136c','Custom SQL','',NULL,'2.0.5',515,'EXECUTED'),('bahmni-core-201412051745','Rohan','liquibase.xml','2015-06-12 11:21:06','3:8cdef3e773c916485e3e2971b3a94ac5','Custom SQL','Add concept class Computed/Editable',NULL,'2.0.5',517,'EXECUTED'),('bahmni-core-201412132014','Mihir','liquibase.xml','2015-06-12 11:21:06','3:526c9878b1f0e2f406aec4938926498f','Custom SQL','Adding Immediately as Order Frequency',NULL,'2.0.5',516,'EXECUTED'),('bahmni-core-201412160932','Rohan, Shruthi','liquibase.xml','2015-06-12 11:21:06','3:a1b4545142fc7e8ab6c7907e92e1edb5','Custom SQL','Adding minutes concept for drug order duration units',NULL,'2.0.5',518,'EXECUTED'),('bahmni-core-201412171832','Mujir, Mihir','liquibase.xml','2015-06-12 11:21:06','3:1a1102e199808b8532cde54d8ffb449f','Custom SQL','Adding Admission Decision concept reference term and mapping for close visit task',NULL,'2.0.5',519,'EXECUTED'),('bahmni-core-201412171835','Mujir, Mihir','liquibase.xml','2015-06-12 11:21:06','3:425fad3bde2745adc7912cddd74dfb31','Custom SQL','Adding Deny Admission concept reference term and mapping for close visit task',NULL,'2.0.5',520,'EXECUTED'),('bahmni-core-201412181423','Rohan','liquibase.xml','2015-06-12 11:21:06','3:f3566ac13b2a0913110b3d0da179e99f','Custom SQL','Set global property allow_groovy_caching to true',NULL,'2.0.5',521,'EXECUTED'),('bahmni-core-201412311031','Mihir','liquibase.xml','2015-06-12 11:21:06','3:4c2ab825426999b4037151677e9b7f77','Custom SQL','Add Login Location Tag if not already added.',NULL,'2.0.5',522,'MARK_RAN'),('bahmni-core-201501071717','Vikash,Indraneel','liquibase.xml','2015-06-12 11:21:06','3:f30ed61c34af7d08cc4e5c2aea4b4e87','Custom SQL','Adding Order Attributes concept set',NULL,'2.0.5',523,'EXECUTED'),('bahmni-core-201501192149','Sravanthi','liquibase.xml','2015-06-12 11:21:06','3:503c09053a2a3e1db2ebf5d58e5d7c6e','Insert Row','add concept class Case Intake',NULL,'2.0.5',524,'EXECUTED'),('bahmni-core-201503101702','Sravanthi, Charles','liquibase.xml','2015-10-30 10:54:58','3:6c2f4345e5d9a8569864b2eb93983ca5','SQL From File','Sql file for getting all wards, beds and related patients info',NULL,'2.0.5',527,'RERAN'),('bahmni-core-201503270552','Sandeep, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:36ad0e08bb219e07e218a3ea8947606a','Insert Row','Adding privilege for dispensing drug orders.',NULL,'2.0.5',528,'EXECUTED'),('bahmni-core-201503270603','Sandeep, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:fb5fbba932778a9b839c1eb43d979662','Custom SQL','Adding dispensed drug order attribute',NULL,'2.0.5',529,'EXECUTED'),('bahmni-core-201504031424','Banka, Preethi','liquibase.xml','2015-06-12 11:21:06','3:0a41bb59bdbb834e36d86358e00fb605','Custom SQL','Chaning colume type of property_value in user_property to text',NULL,'2.0.5',530,'EXECUTED'),('bahmni-core-201504061124','Charles, Swathi','liquibase.xml','2015-06-12 11:21:06','3:84d6a273c419907fd2f3c535505986d6','Insert Row','Adding privilege for bi-directional navigation between registration and consultation.',NULL,'2.0.5',531,'EXECUTED'),('bahmni-core-201504070220','Preethi, Hemanth','liquibase.xml','2015-06-12 11:21:06','3:8a9b560ebf4e1ca0880ea48fa84139dd','Custom SQL','Creating Visit Status as visit attribute',NULL,'2.0.5',532,'EXECUTED'),('bahmni-core-201504131627','Soumya, Charles','liquibase.xml','2015-06-12 11:21:06','3:6e5d87b1d718758aafcb26342c797e8d','Insert Row','Adding Close Visit Privilege',NULL,'2.0.5',533,'EXECUTED'),('bahmni-core-201504231857','Charles, JP','liquibase.xml','2015-06-12 11:21:06','3:a0c246e51ee870f42ae871bbd02bf74d','Insert Row','',NULL,'2.0.5',534,'EXECUTED'),('bahmni-core-201505080200','Hemanth','liquibase.xml','2015-06-12 11:21:06','3:454f2cf8f62168eb31935c8e6a40d30b','Custom SQL','Creating Admission Status as visit attribute',NULL,'2.0.5',536,'EXECUTED'),('bahmni-core-201505081250','JP','liquibase.xml','2015-06-12 11:21:06','3:58927eb18fddf0c3eb0ee82cb8a7ef67','Insert Row','',NULL,'2.0.5',535,'EXECUTED'),('bahmni-core-201505121055','Vikash, Achinta','liquibase.xml','2015-06-12 11:21:06','3:41a059203d80ce0edf170042ee1ca7a8','Insert Row','Adding privilege for provider.',NULL,'2.0.5',537,'EXECUTED'),('bahmni-core-201505171743','Bharat','liquibase.xml','2015-06-12 11:21:06','3:6e83dcdbf780e43f18743669b7707e0c','Custom SQL','Associating LabSet and LabTest concept classes to Lab Order order type',NULL,'2.0.5',538,'EXECUTED'),('bahmni-core-201505171755','Bharat','liquibase.xml','2015-06-12 11:21:06','3:599b7a19d01dcb35ddf52c9349b2574b','Custom SQL','Adding \'All Orderables\' concept set and associating Lab Samples to it.',NULL,'2.0.5',539,'EXECUTED'),('bahmni-core-201505171808','Bharat','liquibase.xml','2015-06-12 11:21:06','3:ecb11a6c09e44e528e35b8ab0800d9cd','Custom SQL','Adding a display name for Lab Samples concept on UI',NULL,'2.0.5',540,'EXECUTED'),('bahmni-core-201505251642','Ranganathan','liquibase.xml','2015-06-12 11:21:06','3:1c6fa1b0f1592a1f4b6688ffa3be3429','Custom SQL','Adding gender values and codes used across MRS',NULL,'2.0.5',541,'EXECUTED'),('bahmni-core-201506011729','Preethi, Gautam','liquibase.xml','2015-06-12 11:21:07','3:3274243cd9e1b0e4bcec701cb1c1d2c4','Custom SQL','Changing short name for Lab Samples concept on UI',NULL,'2.0.5',544,'EXECUTED'),('bahmni-core-201506011804','Preethi, Gautam','liquibase.xml','2015-06-12 11:21:07','3:ed61279e765ce09ce44f4cd5662da89c','Custom SQL','Changing description for LabSet concept class to Panels',NULL,'2.0.5',545,'EXECUTED'),('bahmni-core-201506180200','Chethan, Preethi','liquibase.xml','2015-10-30 10:54:58','3:00f351b770b22396b03c7ee07634fbd6','Custom SQL','Global property for default encounter type.',NULL,'2.0.5',558,'EXECUTED'),('bahmni-core-201506221230','Hemanth, Preethi','liquibase.xml','2015-10-30 10:54:58','3:718ce3df908ca849e243aad4facd45df','Custom SQL','Getting rid of the revese sync schedulers for Drug.',NULL,'2.0.5',559,'EXECUTED'),('bahmni-core-201506251230','Ranganathan, Charles','liquibase.xml','2015-10-30 10:54:58','3:9a5d4e344ebd851e8b30992a1ecd031b','Custom SQL','Cleaning up relationships types for the relationships.',NULL,'2.0.5',560,'EXECUTED'),('bahmni-core-201507161455','Abishek','liquibase.xml','2015-10-30 10:54:58','3:ed677e838d8e5f7d5e88cbad1a229b66','Custom SQL','Associating LabSet and LabTest concept classes to Order order type',NULL,'2.0.5',565,'EXECUTED'),('bahmni-core-201507161455','Abishek, Vikash','liquibase.xml','2015-10-30 10:54:58','3:3d9af265aaa57522db48ae75c1ab9157','Custom SQL','Moving to order from test_order',NULL,'2.0.5',563,'EXECUTED'),('bahmni-core-201507271600','Swathi, Charles','liquibase.xml','2015-10-30 10:54:58','3:de22b0233b080ebf960e63e64f260e00','Custom SQL','Adding Telephone Number person attribute type',NULL,'2.0.5',566,'EXECUTED'),('bahmni-core-201507271605','Swathi, Charles','liquibase.xml','2015-10-30 10:54:58','3:61e9309e9bf001527e3a99a1adda56ef','Custom SQL','Adding Unknown patient person attribute type',NULL,'2.0.5',567,'EXECUTED'),('bahmni-core-201507311820','Hemanth','liquibase.xml','2015-10-30 10:54:58','3:fa8e55f7de2fbf50f8412b7c210935ea','SQL From File','Optimised the high risk patient sql to consider latest test value',NULL,'2.0.5',569,'EXECUTED'),('bahmni-core-201508180000','Banka, Swathi','liquibase.xml','2015-10-30 10:54:58','3:8b2a8442b05f979c678ff0dfe15ccb5f','Custom SQL','Changing the OrderType name for lab order from Order to Lab Order',NULL,'2.0.5',570,'EXECUTED'),('bahmni-core-201508181421','Padma, Shireesha','liquibase.xml','2015-10-30 10:54:58','3:95360f885d7148080651c9a6877da677','Custom SQL','Adding global property for Reason for death',NULL,'2.0.5',571,'EXECUTED'),('bahmni-core-201508211600','Vikash, Abishek','liquibase.xml','2015-10-30 10:54:58','3:5ed53ac922e9fc936397275aec6e60f6','Custom SQL','Updating column stage_name of import_status table',NULL,'2.0.5',572,'EXECUTED'),('bahmni-core-201508310334','Padma','liquibase.xml','2015-10-30 10:54:58','3:20549d7d7804d2d89634ea9704ac5c04','Custom SQL','Deleting bahmnicore.relationshipTypeMap from global property',NULL,'2.0.5',573,'EXECUTED'),('bahmni-core-201509231746','Swathi, Jaswanth','liquibase.xml','2015-10-30 10:54:59','3:6508854072b041e561e9f77cfc7d7597','Custom SQL','Deleting Telephone Number person attribute type',NULL,'2.0.5',578,'EXECUTED'),('bahmni-core-201509231749','Swathi, Jaswanth','liquibase.xml','2015-10-30 10:54:59','3:569ad5cc3dd69532b314d4ded22b52fe','Custom SQL','Deleting Unknown patient person attribute type',NULL,'2.0.5',579,'EXECUTED'),('bahmni-core-201509301203','Chethan, Sourav','liquibase.xml','2015-10-30 11:56:25','3:dcec039ea0c79d77e6664f3c4f866dd1','Custom SQL','',NULL,'2.0.5',596,'EXECUTED'),('bahmni-core-201510161510','Vikash, Shashi','liquibase.xml','2015-10-30 13:28:29','3:582f1eeecb2bd7f63b1e4d0ec970db71','Custom SQL','Add relationship between orderType and conceptClass',NULL,'2.0.5',620,'EXECUTED'),('bahmni-core-201510271500','Shan, Sourav','liquibase.xml','2015-10-30 13:28:29','3:edf189ea73fb69f049f23575531740a2','SQL From File','SQL query to get list of active patients by location',NULL,'2.0.5',621,'EXECUTED'),('bahmni-core-201510291400','Shan','liquibase.xml','2015-10-30 13:28:29','3:cffec54ed5b2e8f2ee567e2be0d47e84','Custom SQL','Remove the SQL query to get list of active patients by location',NULL,'2.0.5',622,'EXECUTED'),('bahmni-core-201510292222','Shan','liquibase.xml','2015-10-30 13:28:29','3:e706d735997c7c6148fc9d4fca76679d','Custom SQL','Adding privileges to Registration-Additional role',NULL,'2.0.5',623,'EXECUTED'),('bahmni-core-201521091408','Banka,Sravanthi','liquibase.xml','2015-10-30 11:03:07','3:b9381f69cdc3cfe9b8733f423811f96a','Custom SQL','Add privileges for patient listing',NULL,'2.0.5',581,'EXECUTED'),('bahmni-core-201521091414','Banka,Sravanthi','liquibase.xml','2015-10-30 11:05:21','3:bb18a788e846f3e1e79619a1bca94c4c','Custom SQL','Add privileges for clinical read only',NULL,'2.0.5',583,'EXECUTED'),('bahmni-core-201522091114','Banka,Sravanthi','liquibase.xml','2015-10-30 11:06:49','3:73afdba961d6be7a0231f50a7b83071d','Custom SQL','Add privileges consultation save',NULL,'2.0.5',585,'EXECUTED'),('bahmni-core-201522091118','Banka,Sravanthi','liquibase.xml','2015-10-30 11:08:21','3:cc7ecabfa61461b10acab4efcbc3793c','Custom SQL','Add privileges consultation observation',NULL,'2.0.5',587,'EXECUTED'),('bahmni-core-201522091122','Banka,Sravanthi','liquibase.xml','2015-10-30 11:13:11','3:6bc51163744a97a1849bcab1e7969663','Custom SQL','Add privileges consultation diagnosis',NULL,'2.0.5',589,'EXECUTED'),('bahmni-core-201522091126','Banka,Sravanthi','liquibase.xml','2015-10-30 11:14:13','3:4220c81f14d749b39464487fe038ddf3','Custom SQL','Add privileges consultation disposition',NULL,'2.0.5',591,'EXECUTED'),('bahmni-core-201522091130','Banka,Sravanthi','liquibase.xml','2015-10-30 11:15:09','3:9592304d8b871d914851a5e57f0b3ba6','Custom SQL','Add privileges consultation treatment',NULL,'2.0.5',593,'EXECUTED'),('bahmni-core-201522091134','Banka,Sravanthi','liquibase.xml','2015-10-30 11:15:59','3:d3f40e0d71d0a797079951edf3cfc65b','Custom SQL','Add privileges consultation orders',NULL,'2.0.5',595,'EXECUTED'),('bahmni-emr-reports-201513101535','Banka,Padma','liquibase.xml','2015-10-30 13:28:29','3:c33520a0ab28e32c2ddbd9d682939d65','Custom SQL','',NULL,'2.0.5',613,'MARK_RAN'),('bahmni-inpatient-patient-movement-201513101455','Banka,Padma','liquibase.xml','2015-10-30 13:24:30','3:2d8eebb99aef6a986e7f213bb43d3269','Custom SQL','',NULL,'2.0.5',609,'MARK_RAN'),('bahmni-inpatient-patient-movement-201513101524','Banka,Padma','liquibase.xml','2015-10-30 13:25:16','3:1960dba06edd84165527b0fe056c39c8','Custom SQL','',NULL,'2.0.5',610,'MARK_RAN'),('bahmni-inpatient-read-201513101438','Banka,Padma','liquibase.xml','2015-10-30 13:23:29','3:cd47e53f24d4147cbeaf56f1c5f44883','Custom SQL','',NULL,'2.0.5',608,'MARK_RAN'),('bahmni-mapping-201508200613','Gautham, Sudhakar','liquibase.xml','2015-10-30 10:54:58','3:3a9d87b0efe0b06c05c9caeb2f616599','Create Table (x2), Add Foreign Key Constraint','Entity mapping table',NULL,'2.0.5',574,'EXECUTED'),('bahmni-mapping-201508271719','Gautam, Shan','liquibase.xml','2015-10-30 10:54:59','3:f38b607def006e48591497b8d427f7cc','Insert Row','Inserting Program Obstemplate Mapping type',NULL,'2.0.5',575,'EXECUTED'),('bahmni-mapping-201508271736','Shan, Gautam','liquibase.xml','2015-10-30 10:54:59','3:65427f1edf5546ebc2284c98e17b31e7','Add Unique Constraint','Introducing constraint unique key to name column in the entity_mapping_type table',NULL,'2.0.5',576,'EXECUTED'),('bahmni-mapping-201509021719','Shruthi, Padma','liquibase.xml','2015-10-30 10:54:59','3:b514a8c7b083b0c8fc3974bbc4fa10cb','Insert Row','Inserting Program EncounterType Mapping',NULL,'2.0.5',577,'EXECUTED'),('bahmni-orders-role-201513101532','Banka,Padma','liquibase.xml','2015-10-30 13:27:28','3:69d31001038e8463398a3e77463ff968','Custom SQL','',NULL,'2.0.5',612,'MARK_RAN'),('bahmni-PatientSearch-Update-201507031840','Vikash, Achinta','liquibase.xml','2015-10-30 10:54:58','3:ddebe9600eef3a6f92e3ee4fb6fb6cad','SQL From File','rel3',NULL,'2.0.5',561,'EXECUTED'),('bahmni-PatientSearch-Update-201507071330','Vikash, Chethan','liquibase.xml','2015-10-30 10:54:58','3:50e6998a7b95a8d302ba5daccb597ade','SQL From File','rel3',NULL,'2.0.5',562,'EXECUTED'),('bahmni-PatientSearch-Update-201507161455','Abishek','liquibase.xml','2015-10-30 10:54:58','3:59c6870c2a2f8944cfe14b23f6e419a8','SQL From File','Updating sql to use order instead of lab order as order type name',NULL,'2.0.5',564,'EXECUTED'),('bahmni-PatientSearch-Update-201507271745','JP, Sravanthi','liquibase.xml','2015-10-30 10:54:58','3:6543a9af9e42feee2b196e6b6412ef07','SQL From File','Updating high risk patient sql to consider latest test value',NULL,'2.0.5',568,'EXECUTED'),('bahmni-reg-1','tw','liquibase.xml','2015-06-12 11:23:02','3:c0b629cdfcca83a11a418544618f5e64','SQL From File','rel2',NULL,'2.0.5',546,'EXECUTED'),('bahmni-reg-201401171330','banka-tw','liquibase.xml','2015-06-12 11:23:02','3:6fb4b3254235534a73f1286df1ccc85d','Insert Row','',NULL,'2.0.5',549,'EXECUTED'),('bahmni-reg-201402141455','neha','liquibase.xml','2015-06-12 11:23:02','3:eb2a5670f3bf96f9638999447a9301a3','Custom SQL','Add emrgency app role',NULL,'2.0.5',550,'EXECUTED'),('bahmni-reg-3','tw','liquibase.xml','2015-06-12 11:23:02','3:36a3c338cb6058407f036ef86ed67e0d','SQL From File','rel2',NULL,'2.0.5',547,'EXECUTED'),('bahmni-reg-5','vivek-tw','liquibase.xml','2015-06-12 11:23:02','3:35c7ab7814c60020e0c161af7bf49a30','Custom SQL','rel3',NULL,'2.0.5',548,'EXECUTED'),('bahmni-registration-201507101741','Shan,Sourav','liquibase.xml','2015-10-30 12:01:25','3:6fc1a4d30524162c1c559b9dc3b96d75','Custom SQL','Add Registration Role',NULL,'2.0.5',598,'MARK_RAN'),('bahmni-registration-201507101742','Shan,Sourav','liquibase.xml','2015-10-30 12:02:23','3:dfe3d945eb1998bdefb12aad541c6f81','Custom SQL','Add Registration Read Role',NULL,'2.0.5',599,'MARK_RAN'),('bahmni-registration-201507101744','Shan,Sourav','liquibase.xml','2015-10-30 12:02:23','3:2328f269b12ba37cc2a5e12296dcc0ac','Custom SQL','Add privileges registration read',NULL,'2.0.5',600,'EXECUTED'),('bahmni-registration-201507101747','Shan,Sourav','liquibase.xml','2015-10-30 12:03:15','3:a30e19ef0f01aa14ff0b97cded96f2c1','Custom SQL','Add Registration Write Role',NULL,'2.0.5',601,'MARK_RAN'),('bahmni-registration-201507101748','Shan,Sourav','liquibase.xml','2015-10-30 12:03:15','3:c4b84e874cd50d1025dfa4554b3ba532','Custom SQL','Add privileges registration write',NULL,'2.0.5',602,'EXECUTED'),('bahmni-registration-201507101749','Shan,Sourav','liquibase.xml','2015-10-30 12:07:49','3:1e6399b00449add0292457bce8e4e2ed','Custom SQL','Add Registration Visit Action Role',NULL,'2.0.5',603,'MARK_RAN'),('bahmni-registration-201507101753','Shan,Sourav','liquibase.xml','2015-10-30 12:07:49','3:03d6448d20ae9fe9782e7cca5fc90a43','Custom SQL','Add privileges registration visit action',NULL,'2.0.5',604,'EXECUTED'),('bahmni-registration-201507101755','Shan,Sourav','liquibase.xml','2015-10-30 12:09:11','3:4bed4922fbef0f27f5c05a666ac7ded9','Custom SQL','Add role for additional actions for registration app.',NULL,'2.0.5',605,'MARK_RAN'),('bahmni-registration-201507101757','Shan,Sourav','liquibase.xml','2015-10-30 12:09:11','3:9bca88b8b6fc70765cd71455844f1616','Custom SQL','Add privileges for additional action required for registration app like encounter etc.',NULL,'2.0.5',606,'EXECUTED'),('bahmni-registration-201507101808','Shan,Sourav','liquibase.xml','2015-10-30 12:09:11','3:1cd6d482bcc8707ddc3446d4d6e6f47b','Custom SQL','Add patient listing role to registration',NULL,'2.0.5',607,'EXECUTED'),('bahmniconfig-201505252028','Mihir','liquibase.xml','2015-06-12 11:21:06','3:f7b02e7c80d6e0f6fe2375f91b9005b1','Create Table, Add Foreign Key Constraint (x2), Add Unique Constraint (x2)','',NULL,'2.0.5',542,'EXECUTED'),('bahmniconfig-201505252128','Mihir','liquibase.xml','2015-06-12 11:21:07','3:1688c33b1d8a9bff81f123cfabc88377','Create Table, Add Foreign Key Constraint, Add Unique Constraint (x2)','',NULL,'2.0.5',543,'EXECUTED'),('bahmnimapping-201409121125','Chethan, D3','liquibase.xml','2015-06-12 09:51:36','3:7c85f09623317af6653cb48c89e27e00','Create Table, Add Foreign Key Constraint (x5)','',NULL,'2.0.5',461,'EXECUTED'),('create-logic-rule-definition','mseaton','liquibase.xml','2013-01-17 14:46:19','3:5327271907425ea8182024723912460c','Create Table, Create Index (x3), Add Foreign Key Constraint (x3)','',NULL,'2.0.5',154,'MARK_RAN'),('create-logic-rule-token-tag','nribeka','liquibase.xml','2013-01-17 14:46:19','3:0d0c10ea14371337b4b2a8da0972d768','Create Table, Add Foreign Key Constraint','',NULL,'2.0.5',153,'EXECUTED'),('create-logic_token_registration','djazayeri','liquibase.xml','2013-01-17 14:46:19','3:fba04de00a55b2d5478aed1653df7007','Create Table, Add Foreign Key Constraint (x2)','',NULL,'2.0.5',155,'MARK_RAN'),('create-logic_token_registration_tag','djazayeri','liquibase.xml','2013-01-17 14:46:19','3:e941337ae6d3dfb33bf3ff92aeb63b89','Create Table, Add Foreign Key Constraint','',NULL,'2.0.5',156,'MARK_RAN'),('create_logic_rule_token','nribeka','liquibase.xml','2013-01-17 14:46:19','3:5c95d01a824456e85a6729745a0e814d','Create Table, Add Foreign Key Constraint (x2)','',NULL,'2.0.5',152,'EXECUTED'),('drop-tribe-foreign-key-TRUNK-4492','dkayiwa','liquibase-update-to-latest.xml','2015-06-08 12:18:37','3:6f02e3203c3fe5414a44106b8f16e3cd','Drop Foreign Key Constraint','Dropping foreign key on patient.tribe',NULL,'2.0.5',298,'EXECUTED'),('drop_logic_rule_token','nribeka','liquibase.xml','2013-01-17 14:46:19','3:4bfc38917a898cfc54c440e045cd655c','Drop Table','',NULL,'2.0.5',151,'EXECUTED'),('drop_logic_rule_token_tag','nribeka','liquibase.xml','2013-01-17 14:46:19','3:4ba9ee4a3873ff8c847a3d5fb7275732','Drop Table','',NULL,'2.0.5',150,'EXECUTED'),('esaude-metadata-030420181500','edrisse','liquibase.xml','2018-10-08 11:51:21','3:f1fc86e92bf311a0135371df95791428','SQL From File','Adding form field for occupations as list on POC',NULL,'2.0.5',783,'EXECUTED'),('esaude-metadata-080320181103','ningosi','liquibase.xml','2018-10-08 11:51:21','3:90017af8bb30f681059963e9344d6dc7','Custom SQL','Adding form fields for pregnancy form fields',NULL,'2.0.5',780,'EXECUTED'),('esaude-metadata-080320181119','ningosi','liquibase.xml','2018-10-08 11:51:21','3:2aa1da8ab97b24245b2fdabf707365cb','Custom SQL','Adding form fields for pregnancy form fields',NULL,'2.0.5',781,'EXECUTED'),('esaude-metadata-1','psbrandt','liquibase.xml','2018-10-08 11:49:19','3:7f22748cadfe61d14f7da9d8d073ce5f','Custom SQL','',NULL,'2.0.5',627,'EXECUTED'),('esaude-metadata-10','ningosi','liquibase.xml','2018-10-08 11:49:26','3:f245250da36ec51c034239f1c6145aff','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_resource_ibfk_4\' and creating a new one  \'retired_by for reporting_report_design_resource\'',NULL,'2.0.5',637,'MARK_RAN'),('esaude-metadata-100','ningosi','liquibase.xml','2018-10-08 11:49:31','3:cca5d144fcfa6ca4d7e06ecb635ef390','Custom SQL','',NULL,'2.0.5',723,'EXECUTED'),('esaude-metadata-101','ningosi','liquibase.xml','2018-10-08 11:49:31','3:a74aff896261e600b846f0e101b02fa0','Custom SQL','',NULL,'2.0.5',724,'EXECUTED'),('esaude-metadata-102','ningosi','liquibase.xml','2018-10-08 11:49:31','3:e084367ec778f30985ab4cd12f216fb6','Custom SQL','',NULL,'2.0.5',725,'EXECUTED'),('esaude-metadata-103','ningosi','liquibase.xml','2018-10-08 11:49:31','3:31333159b38b325d9f6903d1c713106b','Custom SQL','',NULL,'2.0.5',726,'EXECUTED'),('esaude-metadata-104','ningosi','liquibase.xml','2018-10-08 11:49:32','3:227005c318df24fca09a6853f492a755','Drop Foreign Key Constraint','Droping the `report_definition_uuid for reporting_report_design` foreign key that stops upgrade to `1.11.6+`',NULL,'2.0.5',727,'EXECUTED'),('esaude-metadata-105','ningosi','liquibase.xml','2018-10-08 11:49:32','3:e78cc6511e7ed68d00abd74d928f4f4c','Custom SQL','Voiding concept 1534 in the en locale in concept_name table',NULL,'2.0.5',728,'EXECUTED'),('esaude-metadata-106','ningosi','liquibase.xml','2018-10-08 11:49:32','3:9b417d68ddbaf66b5953727b46956b10','Custom SQL','Voiding concept 6122 in the en locale in concept_name table',NULL,'2.0.5',729,'EXECUTED'),('esaude-metadata-107-corrected','ningosi','liquibase.xml','2018-10-08 11:49:32','3:f481c7b4a5039f792130821f60fb4214','SQL From File','flag that shows viral load dropped > 50% from start to end of prophylaxis',NULL,'2.0.5',731,'EXECUTED'),('esaude-metadata-107-correcting','ningosi','liquibase.xml','2018-10-08 11:49:32','3:75116592ed7b4d150ab668186276bfbe','Custom SQL','',NULL,'2.0.5',730,'MARK_RAN'),('esaude-metadata-108','ningosi','liquibase.xml','2018-10-08 11:49:32','3:e8427618e14b20c45ad42abefda3821f','SQL From File','Populating table address_hierarchy_address_to_entry_map',NULL,'2.0.5',732,'EXECUTED'),('esaude-metadata-109','ningosi','liquibase.xml','2018-10-08 11:49:32','3:0e1aabf04e34d1f1370f97cedbbfb809','SQL From File','Populating table address_hierarchy_entry',NULL,'2.0.5',733,'EXECUTED'),('esaude-metadata-11','ningosi','liquibase.xml','2018-10-08 11:49:27','3:a56fbb8b0c2326c7ccc78e00040d9581','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_processor_ibfk_1\' and creating a new one  \'changed_by for reporting_report_processor\'',NULL,'2.0.5',638,'MARK_RAN'),('esaude-metadata-110','ningosi','liquibase.xml','2018-10-08 11:49:33','3:1166794378677b6827c19e24133a98fa','SQL From File','Populating table address_hierarchy_level',NULL,'2.0.5',734,'EXECUTED'),('esaude-metadata-111','ningosi','liquibase.xml','2018-10-08 11:51:20','3:a5ae5df9e78fc297beb1b49cf5a0ebdb','Custom SQL','Removing that so that it could be created a fresh',NULL,'2.0.5',736,'MARK_RAN'),('esaude-metadata-112','ningosi','liquibase.xml','2018-10-08 11:51:20','3:a69f2778007ac7cb5bd4b1b060efd7dd','Custom SQL','Adding form fields for who',NULL,'2.0.5',737,'EXECUTED'),('esaude-metadata-113','ningosi','liquibase.xml','2018-10-08 11:51:20','3:a574c9b26f46cb8a3cc643985ca86770','Custom SQL','Adding form fields for who',NULL,'2.0.5',738,'EXECUTED'),('esaude-metadata-114','ningosi','liquibase.xml','2018-10-08 11:51:20','3:161a4444fed4fa54f1182f2bbc2312ce','Custom SQL','Adding form fields for who',NULL,'2.0.5',739,'EXECUTED'),('esaude-metadata-115','ningosi','liquibase.xml','2018-10-08 11:51:20','3:aa4629c59606117da9f909c0d8d3ef7a','Custom SQL','Adding form fields for who',NULL,'2.0.5',740,'EXECUTED'),('esaude-metadata-118','ningosi','liquibase.xml','2018-10-08 11:51:20','3:963282cf94d273c173b7733e421e3b76','Custom SQL','Adding form fields for diagostico 1 for child',NULL,'2.0.5',743,'EXECUTED'),('esaude-metadata-119','ningosi','liquibase.xml','2018-10-08 11:51:20','3:747de903c82c44f69dd3a0e7d79e15e1','Custom SQL','Adding form fields for diagostico 2 for child',NULL,'2.0.5',744,'EXECUTED'),('esaude-metadata-12','ningosi','liquibase.xml','2018-10-08 11:49:27','3:3ac95b6e54872731bdb2fcfd70452f5d','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_processor_ibfk_2\' and creating a new one  \'creator for reporting_report_processor\'',NULL,'2.0.5',639,'MARK_RAN'),('esaude-metadata-120','ningosi','liquibase.xml','2018-10-08 11:51:20','3:0d04cceb1fbfe30b4454f8c4036eba89','Custom SQL','Adding form fields for who',NULL,'2.0.5',741,'EXECUTED'),('esaude-metadata-121','ningosi','liquibase.xml','2018-10-08 11:51:20','3:4a45172c16408d93c5d3574a3a3fecc0','Custom SQL','Adding form fields for who',NULL,'2.0.5',742,'EXECUTED'),('esaude-metadata-122cdc','ningosi','liquibase.xml','2018-10-08 11:51:20','3:cb1a119bedb9737b737f46015ea3dbcc','SQL From File','Adding the DATAEXPORTCD4CDCMOH_DB_SP_V02.sql file for reporting purposes',NULL,'2.0.5',745,'EXECUTED'),('esaude-metadata-122cdcsp','ningosi','liquibase.xml','2018-10-08 11:51:20','3:bebb11ffeabee91552ebeb7ae2c4657c','SQL From File','Adding stored procedure needed',NULL,'2.0.5',746,'EXECUTED'),('esaude-metadata-124cdc','ningosi','liquibase.xml','2018-10-08 11:51:20','3:9db8701e1c6f5fc5ba60580d61835259','Custom SQL','Running the stroed procedure to populate the tables with data from openmrs',NULL,'2.0.5',747,'EXECUTED'),('esaude-metadata-125','ningosi','liquibase.xml','2018-10-08 11:51:20','3:32628b09289ee4f23fa188b417438b1c','Custom SQL','Making the nome of the social form compulsory',NULL,'2.0.5',748,'EXECUTED'),('esaude-metadata-126','ningosi','liquibase.xml','2018-10-08 11:51:20','3:2ff78b0f1fbdb5dcacbc63d507cb6bde','Custom SQL','Making the Apelido of the social form compulsory',NULL,'2.0.5',749,'EXECUTED'),('esaude-metadata-127','ningosi','liquibase.xml','2018-10-08 11:51:20','3:b7168533d858dfdc2b16e7904a8e9085','Custom SQL','Making the nome of the social form compulsory for the children',NULL,'2.0.5',750,'EXECUTED'),('esaude-metadata-128','ningosi','liquibase.xml','2018-10-08 11:51:20','3:5764d959c2a3a71732b42bb0ed4ddd7e','Custom SQL','Making the Apelido of the social form compulsory for the children',NULL,'2.0.5',751,'EXECUTED'),('esaude-metadata-129','ningosi','liquibase.xml','2018-10-08 11:51:20','3:f2ef2f8a394820635e30aadc8a27b961','Custom SQL','Setting the country to be required',NULL,'2.0.5',752,'EXECUTED'),('esaude-metadata-13','ningosi','liquibase.xml','2018-10-08 11:49:28','3:d64baa19d58dd9473c487a7bff0432e5','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_processor_ibfk_4\' and creating a new one  \'retired_by for reporting_report_processor\'',NULL,'2.0.5',640,'MARK_RAN'),('esaude-metadata-130','ningosi','liquibase.xml','2018-10-08 11:51:20','3:6e4a56c00ad0a70f6f429280d280c89f','Custom SQL','Setting the country to be required',NULL,'2.0.5',753,'EXECUTED'),('esaude-metadata-130320181420','ningosi','liquibase.xml','2018-10-08 11:51:21','3:589a6c391358c18f892936e2e7eac7f2','Custom SQL','Setting the default locale to pt',NULL,'2.0.5',782,'EXECUTED'),('esaude-metadata-131','ningosi','liquibase.xml','2018-10-08 11:51:20','3:8633694f6a0235af5a2f5941ccabdad2','Custom SQL','Setting the country to be required',NULL,'2.0.5',754,'EXECUTED'),('esaude-metadata-132','ningosi','liquibase.xml','2018-10-08 11:51:20','3:6c6c74abc3316c9118498d23957ea10d','Custom SQL','Setting the country to be required',NULL,'2.0.5',755,'EXECUTED'),('esaude-metadata-133','ningosi','liquibase.xml','2018-10-08 11:51:20','3:b4821b12764c49653bacbb3035c8fb15','Custom SQL','Adding form fields for who child for child - ESTADIO I',NULL,'2.0.5',756,'EXECUTED'),('esaude-metadata-134','ningosi','liquibase.xml','2018-10-08 11:51:20','3:bc34a58fdba50f6954ce51bd68209c7d','Custom SQL','Adding form fields for who child for child - ESTADIO II',NULL,'2.0.5',757,'EXECUTED'),('esaude-metadata-135','ningosi','liquibase.xml','2018-10-08 11:51:20','3:29ace1d3f36b1650c5f596a68c6f3bcd','Custom SQL','Adding form fields for who child for child - ESTADIO III',NULL,'2.0.5',758,'EXECUTED'),('esaude-metadata-136','ningosi','liquibase.xml','2018-10-08 11:51:20','3:80e19c0b9892ad32c103ab3dddf3146d','Custom SQL','Adding form fields for who child for child - ESTADIO IV',NULL,'2.0.5',759,'EXECUTED'),('esaude-metadata-137','ningosi','liquibase.xml','2018-10-08 11:51:20','3:9567798657a9a1632c8389175cb1f1f3','SQL From File','Adding the cdcdatacd4 sql report',NULL,'2.0.5',760,'EXECUTED'),('esaude-metadata-138','ningosi','liquibase.xml','2018-10-08 11:51:20','3:d232204c97ffec89ac0774256d9e2525','Custom SQL','Adding the next visit date to be compulsory for the child',NULL,'2.0.5',761,'EXECUTED'),('esaude-metadata-139','ningosi','liquibase.xml','2018-10-08 11:51:20','3:5864adbfd16fa8697e030817299bf840','Custom SQL','Adding the next visit date to be compulsory for the adult',NULL,'2.0.5',762,'EXECUTED'),('esaude-metadata-14','ningosi','liquibase.xml','2018-10-08 11:49:29','3:776f976531d05dbf673834cfb97cd74a','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_processor_ibfk_3\' and creating a new one  \'reporting_report_processor_report_design\'',NULL,'2.0.5',641,'MARK_RAN'),('esaude-metadata-140-p','ningosi','liquibase.xml','2018-10-08 11:51:20','3:2cf12f915d3e1da1fa1948be5ae82a68','SQL From File','Changing the concepts for the drug ingredients',NULL,'2.0.5',763,'EXECUTED'),('esaude-metadata-141-update','ningosi','liquibase.xml','2018-10-08 11:51:20','3:8d651db32bae101669c497cf95b3be34','Custom SQL','Updating the viral load drop criteria',NULL,'2.0.5',764,'EXECUTED'),('esaude-metadata-142','ningosi','liquibase.xml','2018-10-08 11:51:20','3:962c181a90e753c2d4f24d451aed4f1f','SQL From File','Updating the viral load drop criteria',NULL,'2.0.5',765,'EXECUTED'),('esaude-metadata-143','ningosi','liquibase.xml','2018-10-08 11:51:21','3:bddba97d81d6daa7fd6fbb478897fd84','Drop Foreign Key Constraint','Droping \'report_definition_id for reporting_report_design\'',NULL,'2.0.5',766,'MARK_RAN'),('esaude-metadata-145','ningosi','liquibase.xml','2018-10-08 11:51:21','3:8e2eb009022504a1a0c51a111f6489b0','SQL From File','Correcting velocity errors after upgrade to 1.11.5',NULL,'2.0.5',768,'EXECUTED'),('esaude-metadata-147','ningosi','liquibase.xml','2018-10-08 11:51:21','3:2173a9fe4fd3b2fa8ef0ded23dc7c999','Custom SQL','Retiring drugs that have a null drug form',NULL,'2.0.5',769,'EXECUTED'),('esaude-metadata-148','ningosi','liquibase.xml','2018-10-08 11:51:21','3:3ce15d30dd1bc49161989871e3502e83','SQL From File','Creating phm_drug_items table',NULL,'2.0.5',770,'EXECUTED'),('esaude-metadata-149','ningosi','liquibase.xml','2018-10-08 11:51:21','3:ff9eeb4542c60445771bc5bb5f7c574a','SQL From File','Insert drugItem data provided by SIGLUS',NULL,'2.0.5',771,'EXECUTED'),('esaude-metadata-15','ningosi','liquibase.xml','2018-10-08 11:49:29','3:e924c43e8b53c1c63a85371b1cd32985','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_request_ibfk_1\' and creating a new one  \'requested_by for reporting_report_request\'',NULL,'2.0.5',642,'MARK_RAN'),('esaude-metadata-150','ningosi','liquibase.xml','2018-10-08 11:51:21','3:e2426c65dde49d18c5b36b3a693f6d84','SQL From File','Creating phm_drug_regime table',NULL,'2.0.5',772,'EXECUTED'),('esaude-metadata-151','ningosi','liquibase.xml','2018-10-08 11:51:21','3:3750c1a6763f3de237942cfba555992b','SQL From File','Inserting DrugRegime data mappings',NULL,'2.0.5',773,'EXECUTED'),('esaude-metadata-152','ningosi','liquibase.xml','2018-10-08 11:51:21','3:f1cf754daaa896aaba310f18efd1a153','SQL From File','Creating phm_prescription_dispensation table',NULL,'2.0.5',774,'EXECUTED'),('esaude-metadata-153','ningosi','liquibase.xml','2018-10-08 11:51:21','3:6aa46473c027daf9c4d2cefdcd133aa9','Custom SQL','Modify the report_definition_uuid column to 38 characters',NULL,'2.0.5',775,'EXECUTED'),('esaude-metadata-154gpl','ningosi','liquibase.xml','2018-10-08 11:51:21','3:c90528fbfa74481ffae2e0d2ceb68f1f','Custom SQL','Changing cause of death global property from using concept_id to concept_uuid',NULL,'2.0.5',776,'EXECUTED'),('esaude-metadata-155','ynurmahomed','liquibase.xml','2018-10-08 11:51:21','3:1a4fecd2e97eb055243908e068916365','Custom SQL','',NULL,'2.0.5',778,'EXECUTED'),('esaude-metadata-16','ningosi','liquibase.xml','2018-10-08 11:49:30','3:d7ce3d87a0e084ae8df372df48b5cb83','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'serialized_object_ibfk_1\' and creating a new one  \'serialized_object_changed_by\'',NULL,'2.0.5',643,'MARK_RAN'),('esaude-metadata-17','ningosi','liquibase.xml','2018-10-08 11:49:30','3:83af5bc9597cf97e4afe4ff8893359af','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'serialized_object_ibfk_2\' and creating a new one  \'serialized_object_creator\'',NULL,'2.0.5',644,'MARK_RAN'),('esaude-metadata-18','ningosi','liquibase.xml','2018-10-08 11:49:31','3:281b2ad15332eb21e34528aeb7353ce3','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'serialized_object_ibfk_3\' and creating a new one  \'serialized_object_retired_by\'',NULL,'2.0.5',645,'MARK_RAN'),('esaude-metadata-19-corrected','ningosi','liquibase.xml','2018-10-08 11:49:31','3:600dad437d0123db6d72e5ce4187beea','Custom SQL','Creating person object for user for the metadata creation',NULL,'2.0.5',647,'EXECUTED'),('esaude-metadata-19-correcting','ningosi','liquibase.xml','2018-10-08 11:49:31','3:61b5a2d3d9fbc82544c75d9297747def','Custom SQL','Dropping the liquibase change set that was erronoiusly done',NULL,'2.0.5',646,'MARK_RAN'),('esaude-metadata-2','ningosi','liquibase.xml','2018-10-08 11:49:21','3:f734185e4c82747496074c458b2ec241','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_ibfk_1\' and creating a new one  \'changed_by for reporting_report_design\'',NULL,'2.0.5',628,'MARK_RAN'),('esaude-metadata-20','ningosi','liquibase.xml','2018-10-08 11:49:31','3:1bebd401b027f642e6a9ffbec9ef8adb','SQL From File','Creating person name and user objects',NULL,'2.0.5',648,'EXECUTED'),('esaude-metadata-21','ningosi','liquibase.xml','2018-10-08 11:49:31','3:b35e96fdd726d3132e436eced9fc8ee5','Custom SQL','Granting relevant roles to the \'esaude.metadata\' user',NULL,'2.0.5',649,'EXECUTED'),('esaude-metadata-22','ningosi','liquibase.xml','2018-10-08 11:49:31','3:b0bc31d5522bce51962ccc9e15eb0491','SQL From File','Creating the \'eligibles\' patient flag',NULL,'2.0.5',650,'EXECUTED'),('esaude-metadata-23-corrected','ningosi','liquibase.xml','2018-10-08 11:49:31','3:b0ce1d28c8379b256bb28b0c1aacd26f','SQL From File','Creating the \'DRUG START DATE\' patient flag',NULL,'2.0.5',652,'EXECUTED'),('esaude-metadata-23-correcting','ningosi','liquibase.xml','2018-10-08 11:49:31','3:ab879aed0ca876d3e56580bbc219cb1b','Custom SQL','',NULL,'2.0.5',651,'MARK_RAN'),('esaude-metadata-230520181041','ningosi','liquibase.xml','2018-10-08 11:51:21','3:53daa935c6f2262b274580f5d8fdfb93','Custom SQL','Making sure the unkown location is NOT retired for any installation',NULL,'2.0.5',784,'EXECUTED'),('esaude-metadata-230520181200','ningosi','liquibase.xml','2018-10-08 11:51:21','3:75ff3256cb0958cbd96a9cd4a7da5469','Custom SQL','Making sure all locations are not retired for any installation',NULL,'2.0.5',785,'EXECUTED'),('esaude-metadata-24','ningosi','liquibase.xml','2018-10-08 11:49:31','3:eed0490131e93199aaddf9b8082860c9','SQL From File','Creating the \'CTZ_PROPHILAXIS\' patient flag',NULL,'2.0.5',653,'EXECUTED'),('esaude-metadata-25-corrected','ningosi','liquibase.xml','2018-10-08 11:49:31','3:1826c6963a77a6656eecb956561657b3','SQL From File','Creating the \'CD4 FIRST CONSULTATION\' patient flag',NULL,'2.0.5',655,'EXECUTED'),('esaude-metadata-25-correcting','ningosi','liquibase.xml','2018-10-08 11:49:31','3:9b0a8719f56757068b64df3a610e59c5','Custom SQL','',NULL,'2.0.5',654,'MARK_RAN'),('esaude-metadata-26-corrected','ningosi','liquibase.xml','2018-10-08 11:49:31','3:305bdbf59333e6689fd4c4c7debce46e','SQL From File','Creating the \'CD4 6 MONTHS LATER\' patient flag',NULL,'2.0.5',657,'EXECUTED'),('esaude-metadata-26-correcting','ningosi','liquibase.xml','2018-10-08 11:49:31','3:98afd17eff781f6a45c8a7cba75bfd3d','Custom SQL','',NULL,'2.0.5',656,'MARK_RAN'),('esaude-metadata-27','ningosi','liquibase.xml','2018-10-08 11:49:31','3:5d4b252a28137a62c48795e0fdf29116','Custom SQL','Adding a system Id for the metadata user',NULL,'2.0.5',658,'EXECUTED'),('esaude-metadata-28','ningosi','liquibase.xml','2018-10-08 11:49:31','3:2cc8395e8b2523ac86981264a807e0f7','SQL From File','',NULL,'2.0.5',659,'EXECUTED'),('esaude-metadata-280220181520','ningosi','liquibase.xml','2018-10-08 11:51:21','3:9e62791638a54b7e386e37d09341b8f2','Custom SQL','Changing data type of (20687,20686,20685,20682) from Text(3) to Coded(2)',NULL,'2.0.5',779,'EXECUTED'),('esaude-metadata-3','ningosi','liquibase.xml','2018-10-08 11:49:22','3:e5fb1d635a99ff6536cf9337335fca6b','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_ibfk_2\' and creating a new one  \'creator for reporting_report_design\'',NULL,'2.0.5',629,'MARK_RAN'),('esaude-metadata-38','ningosi','liquibase.xml','2018-10-08 11:49:31','3:dbeca71363fcada46e87333b6eb0af3d','Custom SQL','Updating form fileds for vitals',NULL,'2.0.5',660,'EXECUTED'),('esaude-metadata-39','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d387d75422e58ff049316c5bf8eb7619','Custom SQL','Updating form fileds for vitals',NULL,'2.0.5',661,'EXECUTED'),('esaude-metadata-4-correct','ningosi','liquibase.xml','2018-10-08 11:49:23','3:d1c0486c0c35448162925a40c755020a','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_ibfk_3\' and creating a new one  \'retired_by for reporting_report_design\'',NULL,'2.0.5',631,'MARK_RAN'),('esaude-metadata-4-dropping','ningosi','liquibase.xml','2018-10-08 11:49:22','3:66744dbae282b7fae507a28d437b74ab','Custom SQL','Dropping the liquibase change set that was erronoiusly done',NULL,'2.0.5',630,'MARK_RAN'),('esaude-metadata-40','ningosi','liquibase.xml','2018-10-08 11:49:31','3:a98c299560a7bb84b19c8a1f6ae4acb5','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',662,'EXECUTED'),('esaude-metadata-41','ningosi','liquibase.xml','2018-10-08 11:49:31','3:dcf6f37369fbfa390c1dfb1b32319fbe','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',663,'EXECUTED'),('esaude-metadata-42','ningosi','liquibase.xml','2018-10-08 11:49:31','3:52440507730cf6cd8085c7dfc1dc0848','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',664,'EXECUTED'),('esaude-metadata-43','ningosi','liquibase.xml','2018-10-08 11:49:31','3:54fac0c9daa0a6171f08b910944ca5d2','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',665,'EXECUTED'),('esaude-metadata-44','ningosi','liquibase.xml','2018-10-08 11:49:31','3:47f98e68e36412b841d88b6d290917fe','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',666,'EXECUTED'),('esaude-metadata-45','ningosi','liquibase.xml','2018-10-08 11:49:31','3:a992be136dfe03718c2990b1591fd4b1','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',667,'EXECUTED'),('esaude-metadata-46','ningosi','liquibase.xml','2018-10-08 11:49:31','3:7e1196ebecc86a135bfdf7c681eb2ae7','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',668,'EXECUTED'),('esaude-metadata-47','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d3d14b8339eebd80e5b6a1403b2fdd45','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',669,'EXECUTED'),('esaude-metadata-48','ningosi','liquibase.xml','2018-10-08 11:49:31','3:5b1c09ab5f632476fee3bb5bd7fdb566','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',670,'EXECUTED'),('esaude-metadata-49','ningosi','liquibase.xml','2018-10-08 11:49:31','3:e8a3fc8897ba1db7440278dc1a41d4b4','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',671,'EXECUTED'),('esaude-metadata-5','ningosi','liquibase.xml','2018-10-08 11:49:23','3:0a53f068b2ce2239c786385e9223434d','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_ibfk_4\' and creating a new one  \'retired_by for reporting_report_design\'',NULL,'2.0.5',632,'MARK_RAN'),('esaude-metadata-50','ningosi','liquibase.xml','2018-10-08 11:49:31','3:67c6b2bf76dbac89929de9a665d0b3c8','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',672,'EXECUTED'),('esaude-metadata-51','ningosi','liquibase.xml','2018-10-08 11:49:31','3:de187d1d02b2a74ca104b7620a218603','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',673,'EXECUTED'),('esaude-metadata-52','ningosi','liquibase.xml','2018-10-08 11:49:31','3:05287cb0d7388fdbccfc32bc4b0ef46b','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',674,'EXECUTED'),('esaude-metadata-53','ningosi','liquibase.xml','2018-10-08 11:49:31','3:55a1a5ddae32d0e3281f674bed7e091f','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',675,'EXECUTED'),('esaude-metadata-54','ningosi','liquibase.xml','2018-10-08 11:49:31','3:12bc166ec8a0e9f3f59d6a204f43636a','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',676,'EXECUTED'),('esaude-metadata-55','ningosi','liquibase.xml','2018-10-08 11:49:31','3:5340a9a6a260f37b073d01b9c6b01eae','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',677,'EXECUTED'),('esaude-metadata-56','ningosi','liquibase.xml','2018-10-08 11:49:31','3:a3cf1233f71defb3df0a17fd687403d4','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',678,'EXECUTED'),('esaude-metadata-57','ningosi','liquibase.xml','2018-10-08 11:49:31','3:11aea692395e06cca540250851e40911','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',679,'EXECUTED'),('esaude-metadata-58','ningosi','liquibase.xml','2018-10-08 11:49:31','3:46a00c885241ef735fd8bd7116486f3c','Custom SQL','Adding form fields for diagnosis children',NULL,'2.0.5',680,'MARK_RAN'),('esaude-metadata-59','ningosi','liquibase.xml','2018-10-08 11:49:31','3:52ce79a0ffc471bb3b9561857c1e143e','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',681,'EXECUTED'),('esaude-metadata-6','ningosi','liquibase.xml','2018-10-08 11:49:23','3:fc4345ee0211bf9340bd3958bae8d058','Custom SQL','Clearing all reporting changesets for recreation',NULL,'2.0.5',633,'EXECUTED'),('esaude-metadata-60','ningosi','liquibase.xml','2018-10-08 11:49:31','3:a943c1314b1f06a2afa7698044897a53','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',682,'EXECUTED'),('esaude-metadata-61','ningosi','liquibase.xml','2018-10-08 11:49:31','3:f8ce428c8857bd543560259de58100e0','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',683,'EXECUTED'),('esaude-metadata-62','ningosi','liquibase.xml','2018-10-08 11:49:31','3:e597cbb7287b22050223df52da39c6b1','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',684,'EXECUTED'),('esaude-metadata-63','ningosi','liquibase.xml','2018-10-08 11:49:31','3:ad9dab7a3f14463593728112aaabf11f','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',685,'EXECUTED'),('esaude-metadata-64','ningosi','liquibase.xml','2018-10-08 11:49:31','3:04ec6bc54c98f9dcdc9747112775aebf','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',686,'EXECUTED'),('esaude-metadata-65','ningosi','liquibase.xml','2018-10-08 11:49:31','3:41ae547fa81a094af1396767f5c3ebfd','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',687,'EXECUTED'),('esaude-metadata-66','ningosi','liquibase.xml','2018-10-08 11:49:31','3:561f2323e00ce3fbfaf9c146ac45aabc','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',688,'EXECUTED'),('esaude-metadata-67','ningosi','liquibase.xml','2018-10-08 11:49:31','3:10ca06bf47b273462b1f765488a4b837','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',689,'EXECUTED'),('esaude-metadata-68','ningosi','liquibase.xml','2018-10-08 11:49:31','3:06740fbc82e5983059704147f77a02de','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',690,'EXECUTED'),('esaude-metadata-69','ningosi','liquibase.xml','2018-10-08 11:49:31','3:1b8ef331f5da9a357a60230c55e34842','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',691,'EXECUTED'),('esaude-metadata-7','ningosi','liquibase.xml','2018-10-08 11:49:24','3:1dbdda68c659ecc01c4949d54e858af5','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_resource_ibfk_1\' and creating a new one  \'changed_by for reporting_report_design_resource\'',NULL,'2.0.5',634,'MARK_RAN'),('esaude-metadata-70','ningosi','liquibase.xml','2018-10-08 11:49:31','3:823109051ea4cec747ab2d8678108153','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',692,'EXECUTED'),('esaude-metadata-71','ningosi','liquibase.xml','2018-10-08 11:49:31','3:ca5011b0ad6493ff924de1eaa2a1304a','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',693,'EXECUTED'),('esaude-metadata-72','ningosi','liquibase.xml','2018-10-08 11:49:31','3:b627191ef917035963bebbd3404a8c9f','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',694,'EXECUTED'),('esaude-metadata-73','ningosi','liquibase.xml','2018-10-08 11:49:31','3:c36dacbe9a00d6d3e33b2f12d5d69050','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',695,'EXECUTED'),('esaude-metadata-74','ningosi','liquibase.xml','2018-10-08 11:49:31','3:a9b4770deca90544772f17f7131d8c6e','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',696,'EXECUTED'),('esaude-metadata-75','ningosi','liquibase.xml','2018-10-08 11:49:31','3:b3052a55c1677f858b257af733131efc','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',697,'EXECUTED'),('esaude-metadata-76','ningosi','liquibase.xml','2018-10-08 11:49:31','3:449301654bc7d6cc013e96ff259d812b','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',698,'EXECUTED'),('esaude-metadata-77','ningosi','liquibase.xml','2018-10-08 11:49:31','3:01d9323f8b84e0bb1807bbb16d5bdbe4','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',699,'EXECUTED'),('esaude-metadata-78','ningosi','liquibase.xml','2018-10-08 11:49:31','3:bc69a7c18d7864874c4a1faa3bcdeb7a','Custom SQL','Adding form fields for diagnosis adults',NULL,'2.0.5',700,'EXECUTED'),('esaude-metadata-79','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d57f2fd6f952d0817cb946c4bb132ceb','Custom SQL','Updating form fileds for vitals for children',NULL,'2.0.5',701,'EXECUTED'),('esaude-metadata-8','ningosi','liquibase.xml','2018-10-08 11:49:25','3:803c8c0b47b8733dc663e1448d32ab79','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_resource_ibfk_2\' and creating a new one  \'creator for reporting_report_design_resource\'',NULL,'2.0.5',635,'MARK_RAN'),('esaude-metadata-80','ningosi','liquibase.xml','2018-10-08 11:49:31','3:c91e79ac03ce1d285f28bf7ac5453423','Custom SQL','Updating form fileds for vitals for children',NULL,'2.0.5',702,'EXECUTED'),('esaude-metadata-81-corrected','ningosi','liquibase.xml','2018-10-08 11:49:31','3:7ba783aebc873b4ce7265f548b03453c','SQL From File','Creating the \'VIRALOGICAL FAILURE\' patient flag',NULL,'2.0.5',704,'EXECUTED'),('esaude-metadata-81-correcting','ningosi','liquibase.xml','2018-10-08 11:49:31','3:899a10fbcca101c33b782604fac7d169','Custom SQL','',NULL,'2.0.5',703,'MARK_RAN'),('esaude-metadata-82','ningosi','liquibase.xml','2018-10-08 11:49:31','3:db29237581ea499b6d8bd6b73722bbad','Custom SQL','Droping concept id 2027 in pt locale to match the changes made in metadata server',NULL,'2.0.5',705,'EXECUTED'),('esaude-metadata-83','ningosi','liquibase.xml','2018-10-08 11:49:31','3:da0f6c929933690b440d41aee1bf59ce','Custom SQL','Renaming concept 159 in the pt locale',NULL,'2.0.5',706,'EXECUTED'),('esaude-metadata-84','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d520fe238173f0b2a11a7e44a6639841','Custom SQL','Voiding concept 1819 in the en locale',NULL,'2.0.5',707,'EXECUTED'),('esaude-metadata-85','ningosi','liquibase.xml','2018-10-08 11:49:31','3:94e852acc89493e7755d213e84fbfadb','Custom SQL','Voiding concept 924 in the en locale',NULL,'2.0.5',708,'EXECUTED'),('esaude-metadata-86','ningosi','liquibase.xml','2018-10-08 11:49:31','3:b0cc88486bb2ec3429e9a104a42648e5','Custom SQL','Voiding concept 1883 in the en locale',NULL,'2.0.5',709,'EXECUTED'),('esaude-metadata-87','ningosi','liquibase.xml','2018-10-08 11:49:31','3:0deac5705e745fa5eb234683de6361c7','Custom SQL','Deleting concept 1883 in the pt locale from concept_name table',NULL,'2.0.5',710,'EXECUTED'),('esaude-metadata-88','ningosi','liquibase.xml','2018-10-08 11:49:31','3:978df936548088335bc8e312b7752804','Custom SQL','Deleting concept 1445 in the pt locale in the concept_name table',NULL,'2.0.5',711,'EXECUTED'),('esaude-metadata-89','ningosi','liquibase.xml','2018-10-08 11:49:31','3:38971875f42728425110cd42323eaddd','Custom SQL','Voiding concept 891 in the pt locale',NULL,'2.0.5',712,'EXECUTED'),('esaude-metadata-9','ningosi','liquibase.xml','2018-10-08 11:49:25','3:986e4b5a67dcbbfe86716c3308dc7f81','Drop Foreign Key Constraint, Add Foreign Key Constraint','Droping \'reporting_report_design_resource_ibfk_3\' and creating a new one  \'report_design_id for reporting_report_design_resource\'',NULL,'2.0.5',636,'MARK_RAN'),('esaude-metadata-90','ningosi','liquibase.xml','2018-10-08 11:49:31','3:70c762f59669d9df2b613b23e3aea898','Custom SQL','Voiding concept 1841 in the pt locale',NULL,'2.0.5',713,'EXECUTED'),('esaude-metadata-91','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d722185a063788d65276b39e7790bf61','Custom SQL','Adding form fields for who',NULL,'2.0.5',714,'EXECUTED'),('esaude-metadata-92','ningosi','liquibase.xml','2018-10-08 11:49:31','3:e891ac76c4ee5ae6ac9345a25318c0eb','Custom SQL','Adding form fields for who',NULL,'2.0.5',715,'EXECUTED'),('esaude-metadata-93','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d5a11fd463c6d660aba67be025c603f8','Custom SQL','Adding form fields for who',NULL,'2.0.5',716,'EXECUTED'),('esaude-metadata-94','ningosi','liquibase.xml','2018-10-08 11:49:31','3:2bd0026b7c29b167634084e10e3021f7','Custom SQL','Adding form fields for who',NULL,'2.0.5',717,'EXECUTED'),('esaude-metadata-95','ningosi','liquibase.xml','2018-10-08 11:49:31','3:d35594fd3c5e4324d9322f10e168f237','SQL From File','Creating the \'LOW HEMOGLOBIN LEVEL\' patient flag',NULL,'2.0.5',718,'EXECUTED'),('esaude-metadata-96','ningosi','liquibase.xml','2018-10-08 11:49:31','3:882059828a07e52f1ea3d3cdee03cb3f','Custom SQL','',NULL,'2.0.5',719,'EXECUTED'),('esaude-metadata-97','ningosi','liquibase.xml','2018-10-08 11:49:31','3:fd64ee04ef16b3e7f72680a4df628bc4','Custom SQL','',NULL,'2.0.5',720,'EXECUTED'),('esaude-metadata-98','ningosi','liquibase.xml','2018-10-08 11:49:31','3:57022839f06358a7ce7683c3bd07c8be','Custom SQL','',NULL,'2.0.5',721,'EXECUTED'),('esaude-metadata-99','ningosi','liquibase.xml','2018-10-08 11:49:31','3:97e41a9e50f4e3444ca9f42699dbef2f','Custom SQL','',NULL,'2.0.5',722,'EXECUTED'),('esaude-metadata-form-fields-vitals-1','ningosi','liquibase.xml','2018-10-08 11:51:21','3:91ced03b7d25b95ce94c7716614f4b86','Custom SQL','',NULL,'2.0.5',777,'EXECUTED'),('esaude-metadata-revert-reports','ningosi','liquibase.xml','2018-10-08 11:51:21','3:7c6da44ccf0b2de7f4b8a7ef0ef2a349','Custom SQL','Reverting the report schema to original to maintain 1.9.2',NULL,'2.0.5',767,'MARK_RAN'),('esaue-metadata-dictinary-001','nngosi','liquibase.xml','2018-10-08 11:51:20','3:9ccbba5dd7c799ef3ed68b9b8ea5ff96','SQL From File','Loading concept dictioary for eaude',NULL,'2.0.5',735,'EXECUTED'),('htmlformentry_html_form_add_date_retired','Mark Goodrich','liquibase.xml','2018-10-08 11:51:25','3:0fae116e77e9245e48b2fd0136e4554a','Add Column','Update htmlformentry_html_form table to contain date_retired column',NULL,'2.0.5',802,'MARK_RAN'),('htmlformentry_html_form_add_description','Mark Goodrich','liquibase.xml','2018-10-08 11:51:25','3:b7dfa8d556e716719a689003445420f7','Add Column','Update htmlformentry_html_form table to contain description column',NULL,'2.0.5',800,'MARK_RAN'),('htmlformentry_html_form_add_foreign_key_to_retired_by','Mark Goodrich','liquibase.xml','2018-10-08 11:51:26','3:389e17a21881a440779fccf908ea7b04','Add Foreign Key Constraint','Add foreign key user_who_retired_html_form',NULL,'2.0.5',804,'MARK_RAN'),('htmlformentry_html_form_add_retired_by','Mark Goodrich','liquibase.xml','2018-10-08 11:51:25','3:b914df13901c5c347a2c2b0cc9fde952','Add Column','Update htmlformentry_html_form table to contain retired_by column',NULL,'2.0.5',801,'MARK_RAN'),('htmlformentry_html_form_add_retire_reason','Mark Goodrich','liquibase.xml','2018-10-08 11:51:25','3:b6188c841d77a9d8096df93d9b5c96c0','Add Column','Update htmlformentry_html_form table to contain retire_reason column',NULL,'2.0.5',803,'MARK_RAN'),('htmlformentry_html_form_add_uuid','Mark Goodrich','liquibase.xml','2018-10-08 11:51:25','3:41465834e3be18b330612636d544ff27','Add Column','Update htmlformentry_html_form table to contain uuid column',NULL,'2.0.5',799,'MARK_RAN'),('htmlformentry_html_form_create_index_for_uuid','Mark Goodrich','liquibase.xml','2018-10-08 11:51:27','3:d4625a37da17b4b98970ac8bb18c8d12','Create Index','Create index htmlformentry_html_form_uuid_index',NULL,'2.0.5',806,'MARK_RAN'),('htmlformentry_html_form_create_table','Darius Jazayeri','liquibase.xml','2018-10-08 11:51:25','3:d5454959fd46822d8f742e79204e8713','Create Table, Add Foreign Key Constraint (x3)','Create table htmlformentry_html_form, for storing html form templates',NULL,'2.0.5',798,'MARK_RAN'),('htmlformentry_html_form_make_name_nullable','Darius Jazayeri','liquibase.xml','2018-10-08 11:51:27','3:14ec9c7c2b697ce0a3da0371da162991','Modify Column','Make name column nullable (because we\'re deprecating it)',NULL,'2.0.5',807,'EXECUTED'),('htmlformentry_html_form_update_uuid','Mark Goodrich','liquibase.xml','2018-10-08 11:51:26','3:069c77d949f8a9c1a9d300057157fc95','Custom SQL, Modify Column','Remove null values from uuid column',NULL,'2.0.5',805,'EXECUTED'),('metadatamapping-2011-10-04-a','bwolfe','liquibase.xml','2013-01-17 15:09:59','3:35034abcb1ed993cde7f33847ce0ce4c','Update Data','Move MDS property addLocalMappings to metadatamapping',NULL,'2.0.5',157,'EXECUTED'),('metadatamapping-2011-10-04-b','bwolfe','liquibase.xml','2013-01-17 15:09:59','3:991431e585885ebeeaef03c760b5f6f8','Update Data','Move MDS property localConceptSourceUuid to metadatamapping',NULL,'2.0.5',158,'EXECUTED'),('metadatasharing_create_table_exported_package','Dmytro Trifonov','liquibase.xml','2018-10-08 11:49:13','3:cd6f473e1eef04494f47fbaaff70a52f','Create Table, Create Index','Create table metadatasharing_exported_package',NULL,'2.0.5',624,'MARK_RAN'),('metadatasharing_create_table_imported_item','Dmytro Trifonov','liquibase.xml','2018-10-08 11:49:13','3:412a3292ac3cc3f3d27fd8334df634c3','Create Table, Create Index','Create table metadatasharing_imported_item',NULL,'2.0.5',626,'MARK_RAN'),('metadatasharing_create_table_imported_package','Dmytro Trifonov','liquibase.xml','2018-10-08 11:49:13','3:582520a49887eb6fd3e36592693e0730','Create Table, Create Index','Create table metadatasharing_imported_package',NULL,'2.0.5',625,'MARK_RAN'),('org.ict4h.openmrs-atomfeed-2013-03-01-18:30','ict4h','liquibase.xml','2015-06-12 09:42:02','3:1a7eeaf0e4a024076bfee8d326904ece','Create Table (x2), Modify data type, Set Column as Auto-Increment, Modify data type, Set Column as Auto-Increment','',NULL,'2.0.5',324,'EXECUTED'),('org.ict4h.openmrs-atomfeed-2014-01-02-00:00','ict4h','liquibase.xml','2015-06-12 09:42:02','3:e8c753c38cfb25c50c4249ec84429e4c','Create Table','',NULL,'2.0.5',325,'EXECUTED'),('org.ict4h.openmrs-atomfeed-2014-06-10-14:22','Chethan, Banka','liquibase.xml','2015-06-12 09:42:02','3:7cc0b59c613e76b2975cfc814419c85f','Insert Row','Adding global property for encounter feed publish url',NULL,'2.0.5',326,'EXECUTED'),('pharmacyapi-v1.0.0','steliomo','liquibase.xml','2018-10-08 11:51:25','3:bb188de51d5995b51c0e5786427b4685','Create Table, Add Foreign Key Constraint (x7)','Creating the pharmacyapi_drug_items, phm_drug_regime tables',NULL,'2.0.5',794,'MARK_RAN'),('pharmacyapi-v1.0.0-table-drug_regime','Guimino','liquibase.xml','2018-10-08 11:51:25','3:ce0d30fd8e05737c269f647d3ebc9564','Create Table, Add Foreign Key Constraint (x5), Add Unique Constraint','Creating phm_drug_regime',NULL,'2.0.5',795,'MARK_RAN'),('pharmacyapi-v1.0.0-table-prescription-dispensation','Guimino','liquibase.xml','2018-10-08 11:51:25','3:48c84ae788b3e18cdb89caadedd5d117','Create Table, Add Foreign Key Constraint (x6), Add Unique Constraint','Creating phm_prescription_dispensation table',NULL,'2.0.5',796,'MARK_RAN'),('poc-v1.0.0-table-poc_sequence_generator','Guimino','liquibase.xml','2018-10-08 11:51:23','3:00bea0f6118bc98127968bfcf75d62cf','Create Table','Created table poc_sequence_generator to store all sequences needed for the business logic of the module',NULL,'2.0.5',787,'EXECUTED'),('poc-v1.0.0-table-poc_test_order_request_result','Guimino','liquibase.xml','2018-10-08 11:51:23','3:e8edeefc531ed00132caf8d138a1d36a','Create Table, Add Foreign Key Constraint (x6), Add Unique Constraint','Created TABLE poc_test_order_request_result to link all Lab Test results with theirs Lab Test requests',NULL,'2.0.5',786,'EXECUTED'),('poc.inventory-api-v1.0.0-1','Guimino','liquibase.xml','2018-10-08 11:51:24','3:adc931b3989ab3e1b6193d850175c7be','Create Table, Add Foreign Key Constraint (x4)','Creating the POC pocinv_drug_package table',NULL,'2.0.5',788,'EXECUTED'),('poc.inventory-api-v1.0.0-2','Guimino','liquibase.xml','2018-10-08 11:51:24','3:b462ea288319657b92b5604cb0ed4603','Create Table, Add Foreign Key Constraint (x5)','Creating the POC pocinv_batch table',NULL,'2.0.5',789,'EXECUTED'),('poc.inventory-api-v1.0.0-3','Guimino','liquibase.xml','2018-10-08 11:51:24','3:db9d4417a12164c79dd8af954b90ecf2','Create Table, Add Foreign Key Constraint (x7)','Creating the POC pocinv_batch_entry table',NULL,'2.0.5',790,'EXECUTED'),('poc.inventory-api-v1.0.0-4','Guimino','liquibase.xml','2018-10-08 11:51:24','3:fd33a7b5a2b3c3cd699a216f1bfa8ca2','Create Table, Add Foreign Key Constraint (x4)','Creating the POC pocinv_deliver_note table',NULL,'2.0.5',791,'EXECUTED'),('poc.inventory-api-v1.0.0-5','Guimino','liquibase.xml','2018-10-08 11:51:24','3:35f48fb62a2e29120aaa9789f56d7159','Create Table, Add Foreign Key Constraint (x6), Add Unique Constraint','Creating the POC Inventory deliver_note_item table',NULL,'2.0.5',792,'EXECUTED'),('poc.inventory-api-v1.0.0-6','Guimino','liquibase.xml','2018-10-08 11:51:24','3:661bb4256669ad4afa8c2908b3e12713','Create Table, Add Foreign Key Constraint (x4)','Creating the POC pocinv_inventory table',NULL,'2.0.5',793,'EXECUTED'),('reporting_id_set_cleanup','mseaton','liquibase.xml','2018-10-08 11:51:32','3:01cd3b88ed5e29b64b55d614d419cd2b','Drop Table','Removing reporting_idset table that is no longer used',NULL,'2.0.5',825,'MARK_RAN'),('reporting_migration_1','mseaton','liquibase.xml','2018-10-08 11:51:32','3:f6ea0df533cc324ea0d6275d72980c78','Custom SQL (x2)','Remove OpenMRS scheduled tasks produced by the reporting module',NULL,'2.0.5',823,'EXECUTED'),('reporting_migration_2','mseaton','liquibase.xml','2018-10-08 11:51:32','3:4fb91f1875cf874314393aa47c71ca83','Custom SQL','Rename the default web renderer',NULL,'2.0.5',824,'EXECUTED'),('reporting_report_design_1','mseaton','liquibase.xml','2018-10-08 11:51:31','3:482e8981e0dce9476eaf481167719579','Create Table, Add Foreign Key Constraint (x4)','Create table to persist report design specifications',NULL,'2.0.5',808,'MARK_RAN'),('reporting_report_design_2','mseaton','liquibase.xml','2018-10-08 11:51:31','3:027dbe5aeecbd08ecb7b5986a25307de','Add Column, Custom SQL','',NULL,'2.0.5',809,'MARK_RAN'),('reporting_report_design_3','mseaton','liquibase.xml','2018-10-08 11:51:31','3:8cac36c2cf24b842b8add2a5cfbb0df1','Custom SQL','',NULL,'2.0.5',810,'EXECUTED'),('reporting_report_design_4','mseaton','liquibase.xml','2018-10-08 11:51:31','3:bddba97d81d6daa7fd6fbb478897fd84','Drop Foreign Key Constraint','',NULL,'2.0.5',811,'MARK_RAN'),('reporting_report_design_5','mseaton','liquibase.xml','2018-10-08 11:51:32','3:e7dbeb93443f14c60ed2e7cd6aa1e94f','Create Index','',NULL,'2.0.5',812,'MARK_RAN'),('reporting_report_design_6','mseaton','liquibase.xml','2018-10-08 11:51:32','3:e37eef4a9c8063b4abdb8481dd8fe5f8','Drop Column','Step 4 in changing reporting_report_design to reference report definition\n			by uuid rather than id, in order to not tie it directly to the serialized object table\n			Drop report_definition_id column',NULL,'2.0.5',813,'MARK_RAN'),('reporting_report_design_resource_1','mseaton','liquibase.xml','2018-10-08 11:51:32','3:9b1f111c165c213fa2cecc37d87ed843','Create Table, Add Foreign Key Constraint (x4)','Create table to persist report design resources',NULL,'2.0.5',814,'MARK_RAN'),('reporting_report_processor_1','mseaton','liquibase.xml','2018-10-08 11:51:32','3:bc9b147af791381ff5a98a7786f7d638','Create Table, Add Foreign Key Constraint (x3)','Create tables to persist report processors',NULL,'2.0.5',819,'MARK_RAN'),('reporting_report_processor_2','mseaton','liquibase.xml','2018-10-08 11:51:32','3:9060cd2b9fc7c9a24155302d97123fc8','Drop Table','Drop the reporting_report_request_processor table (creation of this table was done\n			in the old sqldiff and not ported over to liquibase, as it is not needed.  this\n			changeset serves only to clean it up and delete it if is still exists',NULL,'2.0.5',820,'MARK_RAN'),('reporting_report_processor_3','mseaton','liquibase.xml','2018-10-08 11:51:32','3:2a2278e80933adb538d8c308eb812337','Add Column, Add Foreign Key Constraint','Update reporting_report_processor table to have report_design_id column',NULL,'2.0.5',821,'MARK_RAN'),('reporting_report_processor_4','mseaton','liquibase.xml','2018-10-08 11:51:32','3:3073b9e397f194eb5f16906f36e9c474','Add Column, Custom SQL','Update reporting_report_processor table to have processor_mode column\n			and set the value to automatic for all processors that were previously created',NULL,'2.0.5',822,'MARK_RAN'),('reporting_report_request_1','mseaton','liquibase.xml','2018-10-08 11:51:32','3:4d336ce27e1366ee39ea2b0c069e4491','Create Table, Add Foreign Key Constraint','Create tables to persist a report request and save reports',NULL,'2.0.5',815,'MARK_RAN'),('reporting_report_request_2','mseaton','liquibase.xml','2018-10-08 11:51:32','3:90834d1a3dc8b3c1f4109579c9a5b954','Add Column','Add a schedule property to ReportRequest',NULL,'2.0.5',816,'MARK_RAN'),('reporting_report_request_3','mseaton','liquibase.xml','2018-10-08 11:51:32','3:8e88f53150534221e9c32cd0e2c94706','Add Column','Add processAutomatically boolean to ReportRequest',NULL,'2.0.5',817,'MARK_RAN'),('reporting_report_request_4','mseaton','liquibase.xml','2018-10-08 11:51:32','3:e93012ef325cc3aff1c92f0ba78424a8','Add Column','Add minimum_days_to_preserve property to ReportRequest',NULL,'2.0.5',818,'EXECUTED'),('uiframework-20120913-2055','wyclif','liquibase.xml','2015-06-12 09:42:00','3:af5797791243753415f969b558c9a917','Create Table','Adding uiframework_page_view table',NULL,'2.0.5',323,'EXECUTED');
/*!40000 ALTER TABLE `liquibasechangelog` ENABLE KEYS */;
UNLOCK TABLES;
--
-- Table structure for table `liquibasechangeloglock`
--

DROP TABLE IF EXISTS `liquibasechangeloglock`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liquibasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` tinyint(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

LOCK TABLES `liquibasechangeloglock` WRITE;
/*!40000 ALTER TABLE `liquibasechangeloglock` DISABLE KEYS */;
insert into liquibasechangeloglock value(1,0,'NULL','NULL');
/*!40000 ALTER TABLE `liquibasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `parent_location` int(11) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_uuid_index` (`uuid`),
  KEY `user_who_created_location` (`creator`),
  KEY `name_of_location` (`name`),
  KEY `user_who_retired_location` (`retired_by`),
  KEY `retired_status` (`retired`),
  KEY `parent_location` (`parent_location`),
  KEY `location_changed_by` (`changed_by`),
  CONSTRAINT `location_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `parent_location` FOREIGN KEY (`parent_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `user_who_created_location` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_location` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `location_attribute`
--

DROP TABLE IF EXISTS `location_attribute`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute` (
  `location_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `location_attribute_location_fk` (`location_id`),
  KEY `location_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `location_attribute_creator_fk` (`creator`),
  KEY `location_attribute_changed_by_fk` (`changed_by`),
  KEY `location_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `location_attribute_type` (`location_attribute_type_id`),
  CONSTRAINT `location_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `location_attribute_type`
--

DROP TABLE IF EXISTS `location_attribute_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_attribute_type` (
  `location_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`location_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `location_attribute_type_unique_name` (`name`),
  KEY `location_attribute_type_creator_fk` (`creator`),
  KEY `location_attribute_type_changed_by_fk` (`changed_by`),
  KEY `location_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `location_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `location_encounter_type_map`
--

DROP TABLE IF EXISTS `location_encounter_type_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_encounter_type_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `encounter_type_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `date_voided` datetime DEFAULT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location_encounter_type_map_location_id_fk` (`location_id`),
  KEY `location_encounter_type_map_encounter_type_id_fk` (`encounter_type_id`),
  KEY `location_encounter_type_map_creator_fk` (`creator`),
  KEY `location_encounter_type_map_changed_by_fk` (`changed_by`),
  KEY `location_encounter_type_map_voided_by_fk` (`voided_by`),
  CONSTRAINT `location_encounter_type_map_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_encounter_type_map_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_encounter_type_map_encounter_type_id_fk` FOREIGN KEY (`encounter_type_id`) REFERENCES `encounter_type` (`encounter_type_id`),
  CONSTRAINT `location_encounter_type_map_location_id_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_encounter_type_map_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `location_tag`
--

DROP TABLE IF EXISTS `location_tag`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag` (
  `location_tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`location_tag_id`),
  UNIQUE KEY `location_tag_uuid_index` (`uuid`),
  KEY `location_tag_creator` (`creator`),
  KEY `location_tag_retired_by` (`retired_by`),
  KEY `location_tag_changed_by` (`changed_by`),
  CONSTRAINT `location_tag_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `location_tag_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `location_tag_map`
--

DROP TABLE IF EXISTS `location_tag_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_tag_map` (
  `location_id` int(11) NOT NULL,
  `location_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`location_tag_id`),
  KEY `location_tag_map_tag` (`location_tag_id`),
  CONSTRAINT `location_tag_map_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `location_tag_map_tag` FOREIGN KEY (`location_tag_id`) REFERENCES `location_tag` (`location_tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `note_id` int(11) NOT NULL DEFAULT '0',
  `note_type` varchar(50) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `obs_id` int(11) DEFAULT NULL,
  `encounter_id` int(11) DEFAULT NULL,
  `text` text NOT NULL,
  `priority` int(11) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`note_id`),
  UNIQUE KEY `note_uuid_index` (`uuid`),
  KEY `patient_note` (`patient_id`),
  KEY `obs_note` (`obs_id`),
  KEY `encounter_note` (`encounter_id`),
  KEY `user_who_created_note` (`creator`),
  KEY `user_who_changed_note` (`changed_by`),
  KEY `note_hierarchy` (`parent`),
  CONSTRAINT `encounter_note` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `note_hierarchy` FOREIGN KEY (`parent`) REFERENCES `note` (`note_id`),
  CONSTRAINT `obs_note` FOREIGN KEY (`obs_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `patient_note` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_note` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_note` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `notification_alert`
--

DROP TABLE IF EXISTS `notification_alert`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert` (
  `alert_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(512) NOT NULL,
  `satisfied_by_any` int(1) NOT NULL DEFAULT '0',
  `alert_read` int(1) NOT NULL DEFAULT '0',
  `date_to_expire` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`alert_id`),
  UNIQUE KEY `notification_alert_uuid_index` (`uuid`),
  KEY `alert_creator` (`creator`),
  KEY `user_who_changed_alert` (`changed_by`),
  KEY `alert_date_to_expire_idx` (`date_to_expire`),
  CONSTRAINT `alert_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_alert` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `notification_alert_recipient`
--

DROP TABLE IF EXISTS `notification_alert_recipient`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_alert_recipient` (
  `alert_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `alert_read` int(1) NOT NULL DEFAULT '0',
  `date_changed` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`alert_id`,`user_id`),
  KEY `alert_read_by_user` (`user_id`),
  KEY `id_of_alert` (`alert_id`),
  CONSTRAINT `alert_read_by_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `id_of_alert` FOREIGN KEY (`alert_id`) REFERENCES `notification_alert` (`alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `notification_template`
--

DROP TABLE IF EXISTS `notification_template`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `template` text,
  `subject` varchar(100) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `recipients` varchar(512) DEFAULT NULL,
  `ordinal` int(11) DEFAULT '0',
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `notification_template_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `obs`
--

DROP TABLE IF EXISTS `obs`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obs` (
  `obs_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `encounter_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `obs_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `location_id` int(11) DEFAULT NULL,
  `obs_group_id` int(11) DEFAULT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `value_group_id` int(11) DEFAULT NULL,
  `value_boolean` tinyint(1) DEFAULT NULL,
  `value_coded` int(11) DEFAULT NULL,
  `value_coded_name_id` int(11) DEFAULT NULL,
  `value_drug` int(11) DEFAULT NULL,
  `value_datetime` datetime DEFAULT NULL,
  `value_numeric` double DEFAULT NULL,
  `value_modifier` varchar(2) DEFAULT NULL,
  `value_text` text,
  `comments` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `value_complex` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `previous_version` int(11) DEFAULT NULL,
  `form_namespace_and_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`obs_id`),
  UNIQUE KEY `obs_uuid_index` (`uuid`),
  KEY `answer_concept` (`value_coded`),
  KEY `encounter_observations` (`encounter_id`),
  KEY `obs_concept` (`concept_id`),
  KEY `obs_enterer` (`creator`),
  KEY `obs_location` (`location_id`),
  KEY `obs_order` (`order_id`),
  KEY `patient_obs` (`person_id`),
  KEY `user_who_voided_obs` (`voided_by`),
  KEY `answer_concept_drug` (`value_drug`),
  KEY `obs_grouping_id` (`obs_group_id`),
  KEY `obs_name_of_coded_value` (`value_coded_name_id`),
  KEY `obs_datetime_idx` (`obs_datetime`),
  KEY `previous_version` (`previous_version`),
  CONSTRAINT `answer_concept` FOREIGN KEY (`value_coded`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `answer_concept_drug` FOREIGN KEY (`value_drug`) REFERENCES `drug` (`drug_id`),
  CONSTRAINT `encounter_observations` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `obs_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `obs_enterer` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `obs_grouping_id` FOREIGN KEY (`obs_group_id`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `obs_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `obs_name_of_coded_value` FOREIGN KEY (`value_coded_name_id`) REFERENCES `concept_name` (`concept_name_id`),
  CONSTRAINT `obs_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `person_obs` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `previous_version` FOREIGN KEY (`previous_version`) REFERENCES `obs` (`obs_id`),
  CONSTRAINT `user_who_voided_obs` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7523125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `order_frequency`
--

DROP TABLE IF EXISTS `order_frequency`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_frequency` (
  `order_frequency_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL,
  `frequency_per_day` double DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`order_frequency_id`),
  UNIQUE KEY `uuid` (`uuid`),
  UNIQUE KEY `concept_id` (`concept_id`),
  KEY `order_frequency_creator_fk` (`creator`),
  KEY `order_frequency_retired_by_fk` (`retired_by`),
  KEY `order_frequency_changed_by_fk` (`changed_by`),
  CONSTRAINT `order_frequency_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_concept_id_fk` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `order_frequency_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_frequency_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `order_type`
--

DROP TABLE IF EXISTS `order_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type` (
  `order_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `java_class_name` varchar(255) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  PRIMARY KEY (`order_type_id`),
  UNIQUE KEY `order_type_uuid_index` (`uuid`),
  UNIQUE KEY `name` (`name`),
  KEY `type_created_by` (`creator`),
  KEY `user_who_retired_order_type` (`retired_by`),
  KEY `retired_status` (`retired`),
  KEY `order_type_changed_by` (`changed_by`),
  KEY `order_type_parent_order_type` (`parent`),
  CONSTRAINT `order_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_type_parent_order_type` FOREIGN KEY (`parent`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `type_created_by` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_order_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `order_type_class_map`
--

DROP TABLE IF EXISTS `order_type_class_map`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type_class_map` (
  `order_type_id` int(11) NOT NULL,
  `concept_class_id` int(11) NOT NULL,
  PRIMARY KEY (`order_type_id`,`concept_class_id`),
  UNIQUE KEY `concept_class_id` (`concept_class_id`),
  CONSTRAINT `fk_order_type_class_map_concept_class_concept_class_id` FOREIGN KEY (`concept_class_id`) REFERENCES `concept_class` (`concept_class_id`),
  CONSTRAINT `fk_order_type_order_type_id` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_type_id` int(11) DEFAULT NULL,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `orderer` int(11) NOT NULL,
  `encounter_id` int(11) NOT NULL,
  `instructions` text,
  `date_activated` datetime DEFAULT NULL,
  `auto_expire_date` datetime DEFAULT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `order_reason` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `accession_number` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `order_reason_non_coded` varchar(255) DEFAULT NULL,
  `urgency` varchar(50) NOT NULL DEFAULT 'ROUTINE',
  `order_number` varchar(50) NOT NULL,
  `previous_order_id` int(11) DEFAULT NULL,
  `order_action` varchar(50) NOT NULL,
  `comment_to_fulfiller` varchar(1024) DEFAULT NULL,
  `care_setting` int(11) NOT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `orders_uuid_index` (`uuid`),
  KEY `order_creator` (`creator`),
  KEY `orderer_not_drug` (`orderer`),
  KEY `orders_in_encounter` (`encounter_id`),
  KEY `type_of_order` (`order_type_id`),
  KEY `user_who_voided_order` (`voided_by`),
  KEY `discontinued_because` (`order_reason`),
  KEY `order_for_patient` (`patient_id`),
  KEY `previous_order_id_order_id` (`previous_order_id`),
  KEY `orders_care_setting` (`care_setting`),
  KEY `bahmni_orders_date_activated` (`date_activated`),
  CONSTRAINT `discontinued_because` FOREIGN KEY (`order_reason`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `fk_orderer_provider` FOREIGN KEY (`orderer`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `order_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `order_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `orders_care_setting` FOREIGN KEY (`care_setting`) REFERENCES `care_setting` (`care_setting_id`),
  CONSTRAINT `orders_in_encounter` FOREIGN KEY (`encounter_id`) REFERENCES `encounter` (`encounter_id`),
  CONSTRAINT `previous_order_id_order_id` FOREIGN KEY (`previous_order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `type_of_order` FOREIGN KEY (`order_type_id`) REFERENCES `order_type` (`order_type_id`),
  CONSTRAINT `user_who_voided_order` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `user_who_created_patient` (`creator`),
  KEY `user_who_voided_patient` (`voided_by`),
  KEY `user_who_changed_pat` (`changed_by`),
  CONSTRAINT `person_id_for_patient` FOREIGN KEY (`patient_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_changed_pat` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_patient` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39631 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patient_identifier`
--

DROP TABLE IF EXISTS `patient_identifier`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier` (
  `patient_identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `identifier_type` int(11) NOT NULL DEFAULT '0',
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `location_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_id`),
  UNIQUE KEY `patient_identifier_uuid_index` (`uuid`),
  UNIQUE KEY `unique_patient_identifier` (`identifier`),
  KEY `defines_identifier_type` (`identifier_type`),
  KEY `identifier_creator` (`creator`),
  KEY `identifier_voider` (`voided_by`),
  KEY `identifier_location` (`location_id`),
  KEY `identifier_name` (`identifier`),
  KEY `idx_patient_identifier_patient` (`patient_id`),
  KEY `patient_identifier_changed_by` (`changed_by`),
  CONSTRAINT `defines_identifier_type` FOREIGN KEY (`identifier_type`) REFERENCES `patient_identifier_type` (`patient_identifier_type_id`),
  CONSTRAINT `identifier_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifier_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `identifies_patient` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `patient_identifier_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_identifier_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31659 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patient_identifier_type`
--

DROP TABLE IF EXISTS `patient_identifier_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_identifier_type` (
  `patient_identifier_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(255) DEFAULT NULL,
  `check_digit` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `format_description` varchar(255) DEFAULT NULL,
  `validator` varchar(200) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `location_behavior` varchar(50) DEFAULT NULL,
  `uniqueness_behavior` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`patient_identifier_type_id`),
  UNIQUE KEY `patient_identifier_type_uuid_index` (`uuid`),
  KEY `type_creator` (`creator`),
  KEY `user_who_retired_patient_identifier_type` (`retired_by`),
  KEY `retired_status` (`retired`),
  CONSTRAINT `type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_patient_identifier_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patient_program`
--

DROP TABLE IF EXISTS `patient_program`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_program` (
  `patient_program_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL DEFAULT '0',
  `program_id` int(11) NOT NULL DEFAULT '0',
  `date_enrolled` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `outcome_concept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_program_id`),
  UNIQUE KEY `patient_program_uuid_index` (`uuid`),
  KEY `patient_in_program` (`patient_id`),
  KEY `program_for_patient` (`program_id`),
  KEY `patient_program_creator` (`creator`),
  KEY `user_who_changed` (`changed_by`),
  KEY `user_who_voided_patient_program` (`voided_by`),
  KEY `patient_program_location_id` (`location_id`),
  KEY `patient_program_outcome_concept_id_fk` (`outcome_concept_id`),
  CONSTRAINT `patient_in_program` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_program_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `patient_program_outcome_concept_id_fk` FOREIGN KEY (`outcome_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_for_patient` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `user_who_changed` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_patient_program` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54711 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patient_state`
--

DROP TABLE IF EXISTS `patient_state`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_state` (
  `patient_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_program_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`patient_state_id`),
  UNIQUE KEY `patient_state_uuid_index` (`uuid`),
  KEY `state_for_patient` (`state`),
  KEY `patient_program_for_state` (`patient_program_id`),
  KEY `patient_state_creator` (`creator`),
  KEY `patient_state_changer` (`changed_by`),
  KEY `patient_state_voider` (`voided_by`),
  CONSTRAINT `patient_program_for_state` FOREIGN KEY (`patient_program_id`) REFERENCES `patient_program` (`patient_program_id`),
  CONSTRAINT `patient_state_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_state_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_for_patient` FOREIGN KEY (`state`) REFERENCES `program_workflow_state` (`program_workflow_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59483 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_displaypoint`
--

DROP TABLE IF EXISTS `patientflags_displaypoint`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_displaypoint` (
  `displaypoint_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`displaypoint_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_flag`
--

DROP TABLE IF EXISTS `patientflags_flag`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_flag` (
  `flag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `criteria` varchar(5000) NOT NULL,
  `message` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `evaluator` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `priority_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`flag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_flag_tag`
--

DROP TABLE IF EXISTS `patientflags_flag_tag`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_flag_tag` (
  `flag_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  KEY `flag_id` (`flag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `patientflags_flag_tag_ibfk_1` FOREIGN KEY (`flag_id`) REFERENCES `patientflags_flag` (`flag_id`),
  CONSTRAINT `patientflags_flag_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_priority`
--

DROP TABLE IF EXISTS `patientflags_priority`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_priority` (
  `priority_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `style` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`priority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_tag`
--

DROP TABLE IF EXISTS `patientflags_tag`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_tag_displaypoint`
--

DROP TABLE IF EXISTS `patientflags_tag_displaypoint`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_tag_displaypoint` (
  `tag_id` int(11) NOT NULL,
  `displaypoint_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `displaypoint_id` (`displaypoint_id`),
  CONSTRAINT `patientflags_tag_displaypoint_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`),
  CONSTRAINT `patientflags_tag_displaypoint_ibfk_2` FOREIGN KEY (`displaypoint_id`) REFERENCES `patientflags_displaypoint` (`displaypoint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `patientflags_tag_role`
--

DROP TABLE IF EXISTS `patientflags_tag_role`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientflags_tag_role` (
  `tag_id` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  KEY `tag_id` (`tag_id`),
  KEY `role` (`role`),
  CONSTRAINT `patientflags_tag_role_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `patientflags_tag` (`tag_id`),
  CONSTRAINT `patientflags_tag_role_ibfk_2` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(50) DEFAULT '',
  `birthdate` date DEFAULT NULL,
  `birthdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `death_date` datetime DEFAULT NULL,
  `cause_of_death` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `deathdate_estimated` tinyint(1) NOT NULL DEFAULT '0',
  `birthtime` time DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_uuid_index` (`uuid`),
  KEY `user_who_created_patient` (`creator`),
  KEY `user_who_voided_patient` (`voided_by`),
  KEY `user_who_changed_pat` (`changed_by`),
  KEY `person_birthdate` (`birthdate`),
  KEY `person_death_date` (`death_date`),
  KEY `person_died_because` (`cause_of_death`),
  CONSTRAINT `person_died_because` FOREIGN KEY (`cause_of_death`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_person` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_created_person` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_person` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39631 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'M',NULL,0,0,NULL,NULL,0,'2005-01-01 00:00:00',NULL,NULL,0,NULL,NULL,NULL,'a6395fee-c9c5-11e9-baa5-08002791e4e6',0,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_address`
--

DROP TABLE IF EXISTS `person_address`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_address` (
  `person_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `city_village` varchar(255) DEFAULT NULL,
  `state_province` varchar(255) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `county_district` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `address6` varchar(255) DEFAULT NULL,
  `address5` varchar(255) DEFAULT NULL,
  `address4` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`person_address_id`),
  UNIQUE KEY `person_address_uuid_index` (`uuid`),
  KEY `patient_address_creator` (`creator`),
  KEY `patient_addresses` (`person_id`),
  KEY `patient_address_void` (`voided_by`),
  KEY `person_address_changed_by` (`changed_by`),
  KEY `person_address_city_village` (`city_village`),
  CONSTRAINT `address_for_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `patient_address_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `patient_address_void` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_address_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38931 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `person_attribute`
--

DROP TABLE IF EXISTS `person_attribute`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute` (
  `person_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(50) NOT NULL DEFAULT '',
  `person_attribute_type_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_attribute_id`),
  UNIQUE KEY `person_attribute_uuid_index` (`uuid`),
  KEY `identifies_person` (`person_id`),
  KEY `defines_attribute_type` (`person_attribute_type_id`),
  KEY `attribute_creator` (`creator`),
  KEY `attribute_changer` (`changed_by`),
  KEY `attribute_voider` (`voided_by`),
  CONSTRAINT `attribute_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `defines_attribute_type` FOREIGN KEY (`person_attribute_type_id`) REFERENCES `person_attribute_type` (`person_attribute_type_id`),
  CONSTRAINT `identifies_person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89553 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `person_attribute_type`
--

DROP TABLE IF EXISTS `person_attribute_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_attribute_type` (
  `person_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  `format` varchar(50) DEFAULT NULL,
  `foreign_key` int(11) DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `edit_privilege` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `sort_weight` double DEFAULT NULL,
  PRIMARY KEY (`person_attribute_type_id`),
  UNIQUE KEY `person_attribute_type_uuid_index` (`uuid`),
  KEY `name_of_attribute` (`name`),
  KEY `type_creator` (`creator`),
  KEY `attribute_type_changer` (`changed_by`),
  KEY `attribute_is_searchable` (`searchable`),
  KEY `user_who_retired_person_attribute_type` (`retired_by`),
  KEY `person_attribute_type_retired_status` (`retired`),
  KEY `privilege_which_can_edit` (`edit_privilege`),
  CONSTRAINT `attribute_type_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `attribute_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `privilege_which_can_edit` FOREIGN KEY (`edit_privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `user_who_retired_person_attribute_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `person_merge_log`
--

DROP TABLE IF EXISTS `person_merge_log`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_merge_log` (
  `person_merge_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `winner_person_id` int(11) NOT NULL,
  `loser_person_id` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `merged_data` longtext NOT NULL,
  `uuid` char(38) NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`person_merge_log_id`),
  UNIQUE KEY `person_merge_log_unique_uuid` (`uuid`),
  KEY `person_merge_log_winner` (`winner_person_id`),
  KEY `person_merge_log_loser` (`loser_person_id`),
  KEY `person_merge_log_creator` (`creator`),
  KEY `person_merge_log_changed_by_fk` (`changed_by`),
  KEY `person_merge_log_voided_by_fk` (`voided_by`),
  CONSTRAINT `person_merge_log_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_loser` FOREIGN KEY (`loser_person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_merge_log_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `person_merge_log_winner` FOREIGN KEY (`winner_person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `person_name`
--

DROP TABLE IF EXISTS `person_name`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_name` (
  `person_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `person_id` int(11) NOT NULL,
  `prefix` varchar(50) DEFAULT NULL,
  `given_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `family_name_prefix` varchar(50) DEFAULT NULL,
  `family_name` varchar(50) DEFAULT NULL,
  `family_name2` varchar(50) DEFAULT NULL,
  `family_name_suffix` varchar(50) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`person_name_id`),
  UNIQUE KEY `person_name_uuid_index` (`uuid`),
  KEY `name_for_patient` (`person_id`),
  KEY `user_who_made_name` (`creator`),
  KEY `user_who_voided_name` (`voided_by`),
  KEY `first_name` (`given_name`),
  KEY `middle_name` (`middle_name`),
  KEY `last_name` (`family_name`),
  KEY `family_name2` (`family_name2`),
  CONSTRAINT `name for person` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`) ON UPDATE CASCADE,
  CONSTRAINT `user_who_made_name` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_name` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48915 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

LOCK TABLES `person_name` WRITE;
/*!40000 ALTER TABLE `person_name` DISABLE KEYS */;
INSERT INTO `person_name` VALUES (1,1,1,NULL,'Super','',NULL,'User',NULL,NULL,NULL,1,'2005-01-01 00:00:00',0,NULL,NULL,NULL,NULL,NULL,'a6415741-c9c5-11e9-baa5-08002791e4e6');
/*!40000 ALTER TABLE `person_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege` (
  `privilege` varchar(255) NOT NULL,
  `description` text,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`privilege`),
  UNIQUE KEY `privilege_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES ('Add Allergies','Add allergies','db4be0d1-347f-46aa-b074-cf74e0efcda1'),('Add Cohorts','Able to add a cohort to the system','a646621b-c9c5-11e9-baa5-08002791e4e6'),('Add Concept Proposals','Able to add concept proposals to the system','a646652c-c9c5-11e9-baa5-08002791e4e6'),('Add Encounters','Able to add patient encounters','a6466657-c9c5-11e9-baa5-08002791e4e6'),('Add HL7 Inbound Archive','Able to add an HL7 archive item','c0e1e81a-d551-4a55-8023-554f6c00f266'),('Add HL7 Inbound Exception','Able to add an HL7 error item','c9d5618d-4c28-4ee8-97a7-f0545de19269'),('Add HL7 Inbound Queue','Able to add an HL7 Queue item','77821ab3-1624-4c5f-8f6b-c80c8c9f01ac'),('Add HL7 Source','Able to add an HL7 Source','0d610b86-d14b-4c95-8339-68abed4a24d0'),('Add Observations','Able to add patient observations','a6466745-c9c5-11e9-baa5-08002791e4e6'),('Add Orders','Able to add orders','a6466826-c9c5-11e9-baa5-08002791e4e6'),('Add Patient Identifiers','Able to add patient identifiers','a646690a-c9c5-11e9-baa5-08002791e4e6'),('Add Patient Programs','Able to add patients to programs','a6466a04-c9c5-11e9-baa5-08002791e4e6'),('Add Patients','Able to add patients','a6466aee-c9c5-11e9-baa5-08002791e4e6'),('Add People','Able to add person objects','a6466bc5-c9c5-11e9-baa5-08002791e4e6'),('Add Problems','Add problems','491eb019-3c7d-41da-84c7-d4c6bb0841db'),('Add Relationships','Able to add relationships','a6466c81-c9c5-11e9-baa5-08002791e4e6'),('Add Report Objects','Able to add report objects','a6466d26-c9c5-11e9-baa5-08002791e4e6'),('Add Reports','Able to add reports','a6467188-c9c5-11e9-baa5-08002791e4e6'),('Add Users','Able to add users to OpenMRS','a6467280-c9c5-11e9-baa5-08002791e4e6'),('Add Visits','Able to add visits','65d14b28-3989-11e6-899a-a4d646d86a8a'),('Assign System Developer Role','Able to assign System Developer role','eb493f8c-3235-4441-8a10-c84043d44bf0'),('Configure Visits','Able to choose encounter visit handler and enable/disable encounter visits','b6c7510f-e6b7-4b48-b5c1-88c8dc057aca'),('Delete Cohorts','Able to add a cohort to the system','a646731f-c9c5-11e9-baa5-08002791e4e6'),('Delete Concept Proposals','Able to delete concept proposals from the system','a64673b3-c9c5-11e9-baa5-08002791e4e6'),('Delete Encounters','Able to delete patient encounters','a6467451-c9c5-11e9-baa5-08002791e4e6'),('Delete HL7 Inbound Archive','Able to delete/retire an HL7 archive item','ebe033c4-cae9-45c2-82f9-42349ce59b6c'),('Delete HL7 Inbound Exception','Able to delete an HL7 archive item','8079179b-3441-4cb6-ab24-bcc7ffc8b949'),('Delete HL7 Inbound Queue','Able to delete an HL7 Queue item','10a65934-36f0-4af2-9fdb-1c095bd95a93'),('Delete Notes','Able to delete patient notes','aca4ba78-7f1e-471d-84e7-0295cfd165b7'),('Delete Observations','Able to delete patient observations','a64674e8-c9c5-11e9-baa5-08002791e4e6'),('Delete Orders','Able to delete orders','a646757e-c9c5-11e9-baa5-08002791e4e6'),('Delete Patient Identifiers','Able to delete patient identifiers','a6467615-c9c5-11e9-baa5-08002791e4e6'),('Delete Patient Programs','Able to delete patients from programs','a64676b1-c9c5-11e9-baa5-08002791e4e6'),('Delete Patients','Able to delete patients','a646774f-c9c5-11e9-baa5-08002791e4e6'),('Delete People','Able to delete objects','a64677e7-c9c5-11e9-baa5-08002791e4e6'),('Delete Relationships','Able to delete relationships','a646787e-c9c5-11e9-baa5-08002791e4e6'),('Delete Report Objects','Able to delete report objects','a6467914-c9c5-11e9-baa5-08002791e4e6'),('Delete Reports','Able to delete reports','a64679af-c9c5-11e9-baa5-08002791e4e6'),('Delete Users','Able to delete users in OpenMRS','a6467a69-c9c5-11e9-baa5-08002791e4e6'),('Delete Visits','Able to delete visits','822e142a-9228-43f6-adba-6072ca822e11'),('Edit Allergies','Able to edit allergies','d29a66cf-3ff3-4aac-9582-2aaa0df77916'),('Edit Cohorts','Able to add a cohort to the system','a6467b26-c9c5-11e9-baa5-08002791e4e6'),('Edit Concept Proposals','Able to edit concept proposals in the system','a6467bd1-c9c5-11e9-baa5-08002791e4e6'),('Edit Encounters','Able to edit patient encounters','a6467c6c-c9c5-11e9-baa5-08002791e4e6'),('Edit Notes','Able to edit patient notes','e52694d3-6975-4387-9c52-cc5960c43cf4'),('Edit Observations','Able to edit patient observations','a6467d0d-c9c5-11e9-baa5-08002791e4e6'),('Edit Orders','Able to edit orders','a6467dab-c9c5-11e9-baa5-08002791e4e6'),('Edit Patient Identifiers','Able to edit patient identifiers','a6467e47-c9c5-11e9-baa5-08002791e4e6'),('Edit Patient Programs','Able to edit patients in programs','a6467eeb-c9c5-11e9-baa5-08002791e4e6'),('Edit Patients','Able to edit patients','a6467f8b-c9c5-11e9-baa5-08002791e4e6'),('Edit People','Able to edit person objects','a6468025-c9c5-11e9-baa5-08002791e4e6'),('Edit Problems','Able to edit problems','1c61ed0e-0398-4e2c-a066-4a52fecc23a5'),('Edit Relationships','Able to edit relationships','a64680bf-c9c5-11e9-baa5-08002791e4e6'),('Edit Report Objects','Able to edit report objects','a6468154-c9c5-11e9-baa5-08002791e4e6'),('Edit Reports','Able to edit reports','a64681f4-c9c5-11e9-baa5-08002791e4e6'),('Edit User Passwords','Able to change the passwords of users in OpenMRS','a646828f-c9c5-11e9-baa5-08002791e4e6'),('Edit Users','Able to edit users in OpenMRS','a646832d-c9c5-11e9-baa5-08002791e4e6'),('Edit Visits','Able to edit visits','2a2817ea-0d11-4e35-b57d-8164af6b30bd'),('Form Entry','Allows user to access Form Entry pages/functions','a64683bb-c9c5-11e9-baa5-08002791e4e6'),('Get Allergies','Able to get allergies','d05118c6-2490-4d78-a41a-390e3596a220'),('Get Care Settings','Able to get Care Settings','14267509-ec0b-4788-ba6c-8c0418085e23'),('Get Concept Classes','Able to get concept classes','d05118c6-2490-4d78-a41a-390e3596a238'),('Get Concept Datatypes','Able to get concept datatypes','d05118c6-2490-4d78-a41a-390e3596a237'),('Get Concept Map Types','Able to get concept map types','d05118c6-2490-4d78-a41a-390e3596a230'),('Get Concept Proposals','Able to get concept proposals to the system','d05118c6-2490-4d78-a41a-390e3596a250'),('Get Concept Reference Terms','Able to get concept reference terms','d05118c6-2490-4d78-a41a-390e3596a229'),('Get Concept Sources','Able to get concept sources','d05118c6-2490-4d78-a41a-390e3596a231'),('Get Concepts','Able to get concept entries','d05118c6-2490-4d78-a41a-390e3596a251'),('Get Database Changes','Able to get database changes from the admin screen','d05118c6-2490-4d78-a41a-390e3596a222'),('Get Encounter Roles','Able to get encounter roles','d05118c6-2490-4d78-a41a-390e3596a210'),('Get Encounter Types','Able to get encounter types','d05118c6-2490-4d78-a41a-390e3596a247'),('Get Encounters','Able to get patient encounters','d05118c6-2490-4d78-a41a-390e3596a248'),('Get Field Types','Able to get field types','d05118c6-2490-4d78-a41a-390e3596a234'),('Get Forms','Able to get forms','d05118c6-2490-4d78-a41a-390e3596a240'),('Get Global Properties','Able to get global properties on the administration screen','d05118c6-2490-4d78-a41a-390e3596a226'),('Get HL7 Inbound Archive','Able to get an HL7 archive item','d05118c6-2490-4d78-a41a-390e3596a217'),('Get HL7 Inbound Exception','Able to get an HL7 error item','d05118c6-2490-4d78-a41a-390e3596a216'),('Get HL7 Inbound Queue','Able to get an HL7 Queue item','d05118c6-2490-4d78-a41a-390e3596a218'),('Get HL7 Source','Able to get an HL7 Source','d05118c6-2490-4d78-a41a-390e3596a219'),('Get Identifier Types','Able to get patient identifier types','d05118c6-2490-4d78-a41a-390e3596a239'),('Get Location Attribute Types','Able to get location attribute types','d05118c6-2490-4d78-a41a-390e3596a212'),('Get Locations','Able to get locations','d05118c6-2490-4d78-a41a-390e3596a246'),('Get Notes','Able to get patient notes','e40483a6-c1e3-4eca-a572-0d3c0e0d228f'),('Get Observations','Able to get patient observations','d05118c6-2490-4d78-a41a-390e3596a245'),('Get Order Frequencies','Able to get Order Frequencies','4c1f2c68-f1de-457f-b2d6-805cfdb7d976'),('Get Order Types','Able to get order types','d05118c6-2490-4d78-a41a-390e3596a233'),('Get Orders','Able to get orders','d05118c6-2490-4d78-a41a-390e3596a241'),('Get Patient Cohorts','Able to get patient cohorts','d05118c6-2490-4d78-a41a-390e3596a242'),('Get Patient Identifiers','Able to get patient identifiers','d05118c6-2490-4d78-a41a-390e3596a243'),('Get Patient Programs','Able to get which programs that patients are in','d05118c6-2490-4d78-a41a-390e3596a227'),('Get Patients','Able to get patients','d05118c6-2490-4d78-a41a-390e3596a244'),('Get People','Able to get person objects','d05118c6-2490-4d78-a41a-390e3596a224'),('Get Person Attribute Types','Able to get person attribute types','d05118c6-2490-4d78-a41a-390e3596a225'),('Get Privileges','Able to get user privileges','d05118c6-2490-4d78-a41a-390e3596a236'),('Get Problems','Able to get problems','d05118c6-2490-4d78-a41a-390e3596a221'),('Get Programs','Able to get patient programs','d05118c6-2490-4d78-a41a-390e3596a228'),('Get Providers','Able to get Providers','d05118c6-2490-4d78-a41a-390e3596a211'),('Get Relationship Types','Able to get relationship types','d05118c6-2490-4d78-a41a-390e3596a232'),('Get Relationships','Able to get relationships','d05118c6-2490-4d78-a41a-390e3596a223'),('Get Roles','Able to get user roles','d05118c6-2490-4d78-a41a-390e3596a235'),('Get Users','Able to get users in OpenMRS','d05118c6-2490-4d78-a41a-390e3596a249'),('Get Visit Attribute Types','Able to get visit attribute types','d05118c6-2490-4d78-a41a-390e3596a213'),('Get Visit Types','Able to get visit types','d05118c6-2490-4d78-a41a-390e3596a215'),('Get Visits','Able to get visits','d05118c6-2490-4d78-a41a-390e3596a214'),('Manage Address Templates','Able to add/edit/delete address templates','4043bdba-2b88-4f2e-8706-6453525f45b6'),('Manage Alerts','Able to add/edit/delete user alerts','a646844b-c9c5-11e9-baa5-08002791e4e6'),('Manage Cohort Definitions','Add/Edit/Remove Cohort Definitions','05f60598-7fc7-4534-b2f0-8cb1eb3fbbc3'),('Manage Concept Classes','Able to add/edit/retire concept classes','a64684e5-c9c5-11e9-baa5-08002791e4e6'),('Manage Concept Datatypes','Able to add/edit/retire concept datatypes','a646859a-c9c5-11e9-baa5-08002791e4e6'),('Manage Concept Map Types','Able to add/edit/retire concept map types','be697435-45f2-4103-80de-92b9ca5ae283'),('Manage Concept Name tags','Able to add/edit/delete concept name tags','c62f1736-cf34-4f88-b4c2-362128ac3386'),('Manage Concept Reference Terms','Able to add/edit/retire reference terms','a4949b6b-76ee-4a86-9391-b1dbf1fc01bb'),('Manage Concept Sources','Able to add/edit/delete concept sources','a646864c-c9c5-11e9-baa5-08002791e4e6'),('Manage Concept Stop Words','Able to view/add/remove the concept stop words','512f973f-f95f-40b2-97b6-ba2424ea88bd'),('Manage Concepts','Able to add/edit/delete concept entries','a64686f5-c9c5-11e9-baa5-08002791e4e6'),('Manage Data Set Definitions','Add/Edit/Remove Data Set Definitions','5c2eceff-129e-4a7b-adc8-8d3c6ef554e5'),('Manage Dimension Definitions','Add/Edit/Remove Dimension Definitions','7b786146-edc7-4eed-a338-0864f7989d26'),('Manage Encounter Roles','Able to add/edit/retire encounter roles','93c21258-4538-43f6-99af-a912c1c703be'),('Manage Encounter Types','Able to add/edit/delete encounter types','a646879c-c9c5-11e9-baa5-08002791e4e6'),('Manage Field Types','Able to add/edit/retire field types','a646883d-c9c5-11e9-baa5-08002791e4e6'),('Manage FormEntry XSN','Allows user to upload and edit the xsns stored on the server','a64688d3-c9c5-11e9-baa5-08002791e4e6'),('Manage Forms','Able to add/edit/delete forms','a6468971-c9c5-11e9-baa5-08002791e4e6'),('Manage Global Properties','Able to add/edit global properties','a6468a08-c9c5-11e9-baa5-08002791e4e6'),('Manage HL7 Messages','Able to add/edit/delete HL7 messages','2547ad47-0f06-4a30-83b8-d04e844340e8'),('Manage Identifier Types','Able to add/edit/delete patient identifier types','a6468aa7-c9c5-11e9-baa5-08002791e4e6'),('Manage Implementation Id','Able to view/add/edit the implementation id for the system','78ffec28-c7a0-45fa-9690-77899fca0bda'),('Manage Indicator Definitions','Add/Edit/Remove Indicator Definitions','9e02619c-9ccd-42b0-9005-416b78c6146b'),('Manage Location Attribute Types','Able to add/edit/retire location attribute types','2212378c-77c0-4557-952e-db9665aa70b8'),('Manage Location Tags','Able to add/edit/delete location tags','0b1f9601-9ade-4bff-ab4c-9632bf791640'),('Manage Locations','Able to add/edit/delete locations','a6468b41-c9c5-11e9-baa5-08002791e4e6'),('Manage Modules','Able to add/remove modules to the system','a6468bd9-c9c5-11e9-baa5-08002791e4e6'),('Manage Order Frequencies','Able to add/edit/retire Order Frequencies','ca83b52f-58e1-4504-9873-7c8a59d25d93'),('Manage Order Types','Able to add/edit/retire order types','a6468c6f-c9c5-11e9-baa5-08002791e4e6'),('Manage Person Attribute Types','Able to add/edit/delete person attribute types','a6468d01-c9c5-11e9-baa5-08002791e4e6'),('Manage Privileges','Able to add/edit/delete privileges','a6468d9d-c9c5-11e9-baa5-08002791e4e6'),('Manage Programs','Able to add/view/delete patient programs','a6468e37-c9c5-11e9-baa5-08002791e4e6'),('Manage Providers','Able to edit Provider','c358d83d-1f3e-4925-bc29-ecf73189fcbf'),('Manage Relationship Types','Able to add/edit/retire relationship types','a6468ed3-c9c5-11e9-baa5-08002791e4e6'),('Manage Relationships','Able to add/edit/delete relationships','a6468f6f-c9c5-11e9-baa5-08002791e4e6'),('Manage Report Definitions','Add/Edit/Remove Report Definitions','1edbd815-c90c-48e4-98c2-1a5d6e4668fb'),('Manage Report Designs','Add/Edit/Remove Report Designs','174e57cc-6a6e-45db-b604-3b39a36615dc'),('Manage Reports','Base privilege for add/edit/delete reporting definitions. This gives access to the administrative menus, but you need to grant additional privileges to manage each specific type of reporting definition','39e93901-532d-49ff-afe2-3e3d4ee50052'),('Manage RESTWS','Allows to configure RESTWS module','d16c2407-d687-4722-aeca-8c410ef19a35'),('Manage Roles','Able to add/edit/delete user roles','a646900d-c9c5-11e9-baa5-08002791e4e6'),('Manage Scheduled Report Tasks','Manage Task Scheduling in Reporting Module','3654a37b-b9ce-4442-b00f-3d5acf2ad355'),('Manage Scheduler','Able to add/edit/remove scheduled tasks','a64690a4-c9c5-11e9-baa5-08002791e4e6'),('Manage Search Index','Able to manage the search index','8c937810-93a2-4bc6-85de-874cc1dafed6'),('Manage Token Registrations','Allows to create/update/delete token registrations','dc77adaf-9882-4f43-b9d5-924e15bf9429'),('Manage Visit Attribute Types','Able to add/edit/retire visit attribute types','cc7018a0-8a6e-4c30-af60-e647b12033d5'),('Manage Visit Types','Able to add/edit/delete visit types','a81c140d-f54a-479b-86b2-34d96fb523f0'),('Patient Dashboard - View Demographics Section','Able to view the \'Demographics\' tab on the patient dashboard','a646913b-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Encounters Section','Able to view the \'Encounters\' tab on the patient dashboard','a64691dd-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Forms Section','Allows user to view the Forms tab on the patient dashboard','a6469283-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Graphs Section','Able to view the \'Graphs\' tab on the patient dashboard','a6469328-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Overview Section','Able to view the \'Overview\' tab on the patient dashboard','a64693d7-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Patient Summary','Able to view the \'Summary\' tab on the patient dashboard','a6469483-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Regimen Section','Able to view the \'Regimen\' tab on the patient dashboard','a646952b-c9c5-11e9-baa5-08002791e4e6'),('Patient Dashboard - View Visits Section','Able to view the \'Visits\' tab on the patient dashboard','5d19e909-d9f0-462e-9c4e-6470cd1b26a7'),('Patient Overview - View Allergies','Able to view the Allergies portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a261'),('Patient Overview - View Patient Actions','Able to view the Patient Actions portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a264'),('Patient Overview - View Patient Flags','Able to view the \'Patient Flags\' portlet on the patient dashboard\'s overview tab','f749f8f1-b167-477f-8825-bc2ea46036dc'),('Patient Overview - View Problem List','Able to view the Problem List portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a260'),('Patient Overview - View Programs','Able to view the Programs portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a263'),('Patient Overview - View Relationships','Able to view the Relationships portlet on the patient overview tab','d05118c6-2490-4d78-a41a-390e3596a262'),('Purge Field Types','Able to purge field types','a64695ed-c9c5-11e9-baa5-08002791e4e6'),('Remove Allergies','Remove allergies','8f2ab489-8c92-431f-ba0c-33b1c1ef85a0'),('Remove Problems','Remove problems','f4790eb3-b1c0-4294-97e1-cc50e24bd991'),('Run Reports','Schedule the running of a report','1fd27363-6d1c-44c9-b494-16fe4fb4891c'),('Update HL7 Inbound Archive','Able to update an HL7 archive item','13b014e0-2f3b-4657-8a5c-683aa97789c9'),('Update HL7 Inbound Exception','Able to update an HL7 archive item','6fbde678-300a-4758-a928-30b2213f58bc'),('Update HL7 Inbound Queue','Able to update an HL7 Queue item','bd672257-d156-4f6d-9807-eb32bff350be'),('Update HL7 Source','Able to update an HL7 Source','bb0a89b8-dbe3-421c-a849-f32ee7da512b'),('Upload XSN','Allows user to upload/overwrite the XSNs defined for forms','a6469691-c9c5-11e9-baa5-08002791e4e6'),('View Administration Functions','Able to view the \'Administration\' link in the navigation bar','a6469728-c9c5-11e9-baa5-08002791e4e6'),('View Allergies','Able to view allergies in OpenMRS','a64697c0-c9c5-11e9-baa5-08002791e4e6'),('View Calculations','Allows to view Calculations','5def089a-9331-46f2-97c0-3616a52fd8eb'),('View Concept Classes','Able to view concept classes','a6469a9a-c9c5-11e9-baa5-08002791e4e6'),('View Concept Datatypes','Able to view concept datatypes','a6469b52-c9c5-11e9-baa5-08002791e4e6'),('View Concept Proposals','Able to view concept proposals to the system','a6469bf8-c9c5-11e9-baa5-08002791e4e6'),('View Concept Sources','Able to view concept sources','a6469c96-c9c5-11e9-baa5-08002791e4e6'),('View Concepts','Able to view concept entries','a6469d33-c9c5-11e9-baa5-08002791e4e6'),('View Data Entry Statistics','Able to view data entry statistics from the admin screen','a6469dce-c9c5-11e9-baa5-08002791e4e6'),('View Encounter Types','Able to view encounter types','a6469e6e-c9c5-11e9-baa5-08002791e4e6'),('View Encounters','Able to view patient encounters','a6469f0e-c9c5-11e9-baa5-08002791e4e6'),('View Field Types','Able to view field types','a6469fab-c9c5-11e9-baa5-08002791e4e6'),('View Forms','Able to view forms','a646a04c-c9c5-11e9-baa5-08002791e4e6'),('View Global Properties','Able to view global properties on the administration screen','a646a0ee-c9c5-11e9-baa5-08002791e4e6'),('View Identifier Types','Able to view patient identifier types','a646a191-c9c5-11e9-baa5-08002791e4e6'),('View Locations','Able to view locations','a646a4e4-c9c5-11e9-baa5-08002791e4e6'),('View Navigation Menu','Ability to see the navigation menu','a646a5aa-c9c5-11e9-baa5-08002791e4e6'),('View Observations','Able to view patient observations','a646a71d-c9c5-11e9-baa5-08002791e4e6'),('View Order Types','Able to view order types','a646a7cc-c9c5-11e9-baa5-08002791e4e6'),('View Orders','Able to view orders','a646a86f-c9c5-11e9-baa5-08002791e4e6'),('View Patient Cohorts','Able to view patient cohorts','a646a911-c9c5-11e9-baa5-08002791e4e6'),('View Patient Identifiers','Able to view patient identifiers','a646a9bb-c9c5-11e9-baa5-08002791e4e6'),('View Patient Programs','Able to see which programs that patients are in','a646aa5f-c9c5-11e9-baa5-08002791e4e6'),('View Patients','Able to view patients','a646ab04-c9c5-11e9-baa5-08002791e4e6'),('View People','Able to view person objects','a646aba5-c9c5-11e9-baa5-08002791e4e6'),('View Person Attribute Types','Able to view person attribute types','a646ac4d-c9c5-11e9-baa5-08002791e4e6'),('View Privileges','Able to view user privileges','a646acfc-c9c5-11e9-baa5-08002791e4e6'),('View Problems','Able to view problems in OpenMRS','a646ada0-c9c5-11e9-baa5-08002791e4e6'),('View Programs','Able to view patient programs','a646ae49-c9c5-11e9-baa5-08002791e4e6'),('View Relationship Types','Able to view relationship types','a646aee7-c9c5-11e9-baa5-08002791e4e6'),('View Relationships','Able to view relationships','a646af8a-c9c5-11e9-baa5-08002791e4e6'),('View Report Objects','Able to view report objects','a646b030-c9c5-11e9-baa5-08002791e4e6'),('View Reports','Able to view reports','a646b0d4-c9c5-11e9-baa5-08002791e4e6'),('View RESTWS','Gives access to RESTWS in administration','2eb8f356-f25d-4cee-b51e-6c2fb07944e2'),('View Roles','Able to view user roles','a646b178-c9c5-11e9-baa5-08002791e4e6'),('View Token Registrations','Allows to view token registrations','3ea1ebbc-0f1f-4092-8e73-2399a4c431ff'),('View Unpublished Forms','Able to view and fill out unpublished forms','a646b216-c9c5-11e9-baa5-08002791e4e6'),('View Users','Able to view users in OpenMRS','a646b2c0-c9c5-11e9-baa5-08002791e4e6');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `description` text,
  `uuid` char(38) NOT NULL,
  `outcomes_concept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`program_id`),
  UNIQUE KEY `program_uuid_index` (`uuid`),
  KEY `program_concept` (`concept_id`),
  KEY `program_creator` (`creator`),
  KEY `user_who_changed_program` (`changed_by`),
  KEY `program_outcomes_concept_id_fk` (`outcomes_concept_id`),
  CONSTRAINT `program_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `program_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `program_outcomes_concept_id_fk` FOREIGN KEY (`outcomes_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `user_who_changed_program` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `program_workflow`
--

DROP TABLE IF EXISTS `program_workflow`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow` (
  `program_workflow_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_workflow_id`),
  UNIQUE KEY `program_workflow_uuid_index` (`uuid`),
  KEY `program_for_workflow` (`program_id`),
  KEY `workflow_concept` (`concept_id`),
  KEY `workflow_creator` (`creator`),
  KEY `workflow_voided_by` (`changed_by`),
  CONSTRAINT `program_for_workflow` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `workflow_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `workflow_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `program_workflow_state`
--

DROP TABLE IF EXISTS `program_workflow_state`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_workflow_state` (
  `program_workflow_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_workflow_id` int(11) NOT NULL DEFAULT '0',
  `concept_id` int(11) NOT NULL DEFAULT '0',
  `initial` tinyint(1) NOT NULL DEFAULT '0',
  `terminal` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`program_workflow_state_id`),
  UNIQUE KEY `program_workflow_state_uuid_index` (`uuid`),
  KEY `workflow_for_state` (`program_workflow_id`),
  KEY `state_concept` (`concept_id`),
  KEY `state_creator` (`creator`),
  KEY `state_voided_by` (`changed_by`),
  CONSTRAINT `state_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `state_concept` FOREIGN KEY (`concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `state_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `workflow_for_state` FOREIGN KEY (`program_workflow_id`) REFERENCES `program_workflow` (`program_workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `provider_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_changed_by_fk` (`changed_by`),
  KEY `provider_person_id_fk` (`person_id`),
  KEY `provider_retired_by_fk` (`retired_by`),
  KEY `provider_creator_fk` (`creator`),
  KEY `provider_role_id` (`provider_role_id`),
  CONSTRAINT `provider_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_ibfk_1` FOREIGN KEY (`provider_role_id`) REFERENCES `providermanagement_provider_role` (`provider_role_id`),
  CONSTRAINT `provider_person_id_fk` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `provider_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `provider_attribute`
--

DROP TABLE IF EXISTS `provider_attribute`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute` (
  `provider_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`provider_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_provider_fk` (`provider_id`),
  KEY `provider_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `provider_attribute_creator_fk` (`creator`),
  KEY `provider_attribute_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `provider_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `provider_attribute_type` (`provider_attribute_type_id`),
  CONSTRAINT `provider_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_provider_fk` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`),
  CONSTRAINT `provider_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `provider_attribute_type`
--

DROP TABLE IF EXISTS `provider_attribute_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_attribute_type` (
  `provider_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`provider_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `provider_attribute_type_creator_fk` (`creator`),
  KEY `provider_attribute_type_changed_by_fk` (`changed_by`),
  KEY `provider_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `provider_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `provider_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_a` int(11) NOT NULL,
  `relationship` int(11) NOT NULL DEFAULT '0',
  `person_b` int(11) NOT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `relationship_uuid_index` (`uuid`),
  KEY `related_person` (`person_a`),
  KEY `related_relative` (`person_b`),
  KEY `relationship_type` (`relationship`),
  KEY `relation_creator` (`creator`),
  KEY `relation_voider` (`voided_by`),
  KEY `relationship_changed_by` (`changed_by`),
  CONSTRAINT `person_a_is_person` FOREIGN KEY (`person_a`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_b_is_person` FOREIGN KEY (`person_b`) REFERENCES `person` (`person_id`),
  CONSTRAINT `relation_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relation_voider` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `relationship_type_id` FOREIGN KEY (`relationship`) REFERENCES `relationship_type` (`relationship_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `relationship_type`
--

DROP TABLE IF EXISTS `relationship_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship_type` (
  `relationship_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_is_to_b` varchar(50) NOT NULL,
  `b_is_to_a` varchar(50) NOT NULL,
  `preferred` int(1) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `uuid` char(38) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`relationship_type_id`),
  UNIQUE KEY `relationship_type_uuid_index` (`uuid`),
  KEY `user_who_created_rel` (`creator`),
  KEY `user_who_retired_relationship_type` (`retired_by`),
  CONSTRAINT `user_who_created_rel` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_relationship_type` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `relationship_type`
--

LOCK TABLES `relationship_type` WRITE;
/*!40000 ALTER TABLE `relationship_type` DISABLE KEYS */;
INSERT INTO `relationship_type` VALUES (1,'Doctor','Patient',0,0,'Relationship from a primary care provider to the patient',1,'2007-05-04 09:59:22','8d919b58-c2cc-11de-8d13-0010c6dffd0f',0,NULL,NULL,NULL),(2,'Sibling','Sibling',0,0,'Relationship between brother/sister, brother/brother, and sister/sister',1,'2007-05-04 09:59:22','8d91a01c-c2cc-11de-8d13-0010c6dffd0f',0,NULL,NULL,NULL),(3,'Parent','Child',0,0,'Relationship from a mother/father to the child',1,'2007-05-04 09:59:22','8d91a210-c2cc-11de-8d13-0010c6dffd0f',0,NULL,NULL,NULL),(4,'Aunt/Uncle','Niece/Nephew',0,0,'Auto generated by OpenMRS',1,'2007-05-04 09:59:22','8d91a3dc-c2cc-11de-8d13-0010c6dffd0f',0,NULL,NULL,NULL),(5,'Supervisor','Supervisee',0,0,'Provider supervisor to provider supervisee relationship',1,'2017-09-14 10:26:27','2a5f4ff4-a179-4b8a-aa4c-40f71956ebbc',0,NULL,NULL,NULL),(6,'Chefe de Familia','Dependente',0,0,'Abordagem Familiar',329,'2017-10-26 12:20:21','b84191c3-880c-4dd3-a3db-4bf5dfbb66db',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `relationship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_object`
--

DROP TABLE IF EXISTS `report_object`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_object` (
  `report_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_object_type` varchar(255) NOT NULL,
  `report_object_sub_type` varchar(255) NOT NULL,
  `xml_data` text,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`report_object_id`),
  UNIQUE KEY `report_object_uuid_index` (`uuid`),
  KEY `report_object_creator` (`creator`),
  KEY `user_who_changed_report_object` (`changed_by`),
  KEY `user_who_voided_report_object` (`voided_by`),
  CONSTRAINT `report_object_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_report_object` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_voided_report_object` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `report_schema_xml`
--

DROP TABLE IF EXISTS `report_schema_xml`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_schema_xml` (
  `report_schema_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `xml_data` mediumtext NOT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`report_schema_id`),
  UNIQUE KEY `report_schema_xml_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `reporting_report_design`
--

DROP TABLE IF EXISTS `reporting_report_design`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `renderer_type` varchar(255) NOT NULL,
  `properties` text,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_definition_uuid` char(38) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_for_reporting_report_design` (`creator`) USING BTREE,
  KEY `changed_by_for_reporting_report_design` (`changed_by`) USING BTREE,
  KEY `retired_by_for_reporting_report_design` (`retired_by`) USING BTREE,
  KEY `report_definition_uuid_for_reporting_report_design` (`report_definition_uuid`) USING BTREE,
  CONSTRAINT `changed_by_for_reporting_report_design` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_reporting_report_design` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `report_definition_uuid_for_reporting_report_design` FOREIGN KEY (`report_definition_uuid`) REFERENCES `serialized_object` (`uuid`),
  CONSTRAINT `retired_by_for_reporting_report_design` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `reporting_report_design_resource`
--

DROP TABLE IF EXISTS `reporting_report_design_resource`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_design_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `report_design_id` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(50) DEFAULT NULL,
  `extension` varchar(20) DEFAULT NULL,
  `contents` longblob,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `report_design_id for reporting_report_design_resource` (`report_design_id`) USING BTREE,
  KEY `creator for reporting_report_design_resource` (`creator`) USING BTREE,
  KEY `changed_by for reporting_report_design_resource` (`changed_by`) USING BTREE,
  KEY `retired_by for reporting_report_design_resource` (`retired_by`) USING BTREE,
  CONSTRAINT `changed_by_for_reporting_report_design_resource` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_reporting_report_design_resource` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `report_design_id_for_reporting_report_design_resource` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `reporting_report_design_resource_ibfk_1` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_design_resource_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_design_resource_ibfk_3` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `reporting_report_design_resource_ibfk_4` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by_for_reporting_report_design_resource` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `reporting_report_processor`
--

DROP TABLE IF EXISTS `reporting_report_processor`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_processor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `processor_type` varchar(255) NOT NULL,
  `configuration` mediumtext,
  `run_on_success` tinyint(1) NOT NULL DEFAULT '1',
  `run_on_error` tinyint(1) NOT NULL DEFAULT '0',
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `report_design_id` int(11) DEFAULT NULL,
  `processor_mode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creator for reporting_report_processor` (`creator`) USING BTREE,
  KEY `changed_by for reporting_report_processor` (`changed_by`) USING BTREE,
  KEY `retired_by for reporting_report_processor` (`retired_by`) USING BTREE,
  KEY `reporting_report_processor_report_design` (`report_design_id`) USING BTREE,
  CONSTRAINT `changed_by_for_reporting_report_processor` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `creator_for_reporting_report_processor` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_processor_ibfk_1` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_processor_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `reporting_report_processor_ibfk_3` FOREIGN KEY (`report_design_id`) REFERENCES `reporting_report_design` (`id`),
  CONSTRAINT `reporting_report_processor_ibfk_4` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `retired_by_for_reporting_report_processor` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `reporting_report_request`
--

DROP TABLE IF EXISTS `reporting_report_request`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reporting_report_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(38) NOT NULL,
  `base_cohort_uuid` char(38) DEFAULT NULL,
  `base_cohort_parameters` text,
  `report_definition_uuid` char(38) NOT NULL,
  `report_definition_parameters` text,
  `renderer_type` varchar(255) NOT NULL,
  `renderer_argument` varchar(255) DEFAULT NULL,
  `requested_by` int(11) NOT NULL DEFAULT '0',
  `request_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `priority` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `evaluation_start_datetime` datetime DEFAULT NULL,
  `evaluation_complete_datetime` datetime DEFAULT NULL,
  `render_complete_datetime` datetime DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `schedule` varchar(100) DEFAULT NULL,
  `process_automatically` tinyint(1) NOT NULL DEFAULT '0',
  `minimum_days_to_preserve` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `requested_by for reporting_report_request` (`requested_by`) USING BTREE,
  CONSTRAINT `reporting_report_request_ibfk_1` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `requested_by_for_reporting_report_request` FOREIGN KEY (`requested_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`role`),
  UNIQUE KEY `role_uuid_index` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('Anonymous','Privileges for non-authenticated users.','774b2af3-6437-4e5a-a310-547554c7c65c'),('Authenticated','Privileges gained once authentication has been established.','f7fd42ef-880e-40c5-972d-e4ae7c990de2'),('Provider','All users with the \'Provider\' role will appear as options in the default Infopath ','8d94f280-c2cc-11de-8d13-0010c6dffd0f'),('System Developer','Developers of the OpenMRS .. have additional access to change fundamental structure of the database model.','8d94f852-c2cc-11de-8d13-0010c6dffd0f');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_privilege`
--

DROP TABLE IF EXISTS `role_privilege`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_privilege` (
  `role` varchar(50) NOT NULL DEFAULT '',
  `privilege` varchar(255) NOT NULL,
  PRIMARY KEY (`privilege`,`role`),
  KEY `role_privilege` (`role`),
  CONSTRAINT `privilege_definitions` FOREIGN KEY (`privilege`) REFERENCES `privilege` (`privilege`),
  CONSTRAINT `role_privilege` FOREIGN KEY (`role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `role_privilege`
--

LOCK TABLES `role_privilege` WRITE;
/*!40000 ALTER TABLE `role_privilege` DISABLE KEYS */;
INSERT INTO `role_privilege` VALUES ('Authenticated','Get Concept Classes'),('Authenticated','Get Concept Datatypes'),('Authenticated','Get Encounter Types'),('Authenticated','Get Field Types'),('Authenticated','Get Global Properties'),('Authenticated','Get Identifier Types'),('Authenticated','Get Locations'),('Authenticated','Get Order Types'),('Authenticated','Get Person Attribute Types'),('Authenticated','Get Privileges'),('Authenticated','Get Relationship Types'),('Authenticated','Get Relationships'),('Authenticated','Get Roles'),('Authenticated','Patient Overview - View Relationships'),('Authenticated','View Concept Classes'),('Authenticated','View Concept Datatypes'),('Authenticated','View Encounter Types'),('Authenticated','View Field Types'),('Authenticated','View Global Properties'),('Authenticated','View Identifier Types'),('Authenticated','View Locations'),('Authenticated','View Order Types'),('Authenticated','View Person Attribute Types'),('Authenticated','View Privileges'),('Authenticated','View Relationship Types'),('Authenticated','View Relationships'),('Authenticated','View Roles');
/*!40000 ALTER TABLE `role_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_role`
--

DROP TABLE IF EXISTS `role_role`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_role` (
  `parent_role` varchar(50) NOT NULL DEFAULT '',
  `child_role` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent_role`,`child_role`),
  KEY `inherited_role` (`child_role`),
  CONSTRAINT `inherited_role` FOREIGN KEY (`child_role`) REFERENCES `role` (`role`),
  CONSTRAINT `parent_role` FOREIGN KEY (`parent_role`) REFERENCES `role` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `scheduler_task_config`
--

DROP TABLE IF EXISTS `scheduler_task_config`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config` (
  `task_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `schedulable_class` text,
  `start_time` datetime DEFAULT NULL,
  `start_time_pattern` varchar(50) DEFAULT NULL,
  `repeat_interval` int(11) NOT NULL DEFAULT '0',
  `start_on_startup` int(1) NOT NULL DEFAULT '0',
  `started` int(1) NOT NULL DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `date_created` datetime DEFAULT '2005-01-01 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `last_execution_time` datetime DEFAULT NULL,
  PRIMARY KEY (`task_config_id`),
  UNIQUE KEY `scheduler_task_config_uuid_index` (`uuid`),
  KEY `schedule_creator` (`created_by`),
  KEY `schedule_changer` (`changed_by`),
  CONSTRAINT `scheduler_changer` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `scheduler_creator` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `scheduler_task_config_property`
--

DROP TABLE IF EXISTS `scheduler_task_config_property`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_task_config_property` (
  `task_config_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text,
  `task_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_config_property_id`),
  KEY `task_config` (`task_config_id`),
  CONSTRAINT `task_config_for_property` FOREIGN KEY (`task_config_id`) REFERENCES `scheduler_task_config` (`task_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `serialized_object`
--

DROP TABLE IF EXISTS `serialized_object`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serialized_object` (
  `serialized_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `subtype` varchar(255) NOT NULL,
  `serialization_class` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `date_created` datetime NOT NULL,
  `creator` int(11) NOT NULL,
  `date_changed` datetime DEFAULT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `date_retired` datetime DEFAULT NULL,
  `retired_by` int(11) DEFAULT NULL,
  `retire_reason` varchar(1000) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`serialized_object_id`),
  UNIQUE KEY `serialized_object_uuid_index` (`uuid`) USING BTREE,
  KEY `serialized_object_creator` (`creator`) USING BTREE,
  KEY `serialized_object_changed_by` (`changed_by`) USING BTREE,
  KEY `serialized_object_retired_by` (`retired_by`) USING BTREE,
  CONSTRAINT `serialized_object_ibfk_1` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `serialized_object_ibfk_3` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `test_order`
--

DROP TABLE IF EXISTS `test_order`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_order` (
  `order_id` int(11) NOT NULL DEFAULT '0',
  `specimen_source` int(11) DEFAULT NULL,
  `laterality` varchar(20) DEFAULT NULL,
  `clinical_history` text,
  `frequency` int(11) DEFAULT NULL,
  `number_of_repeats` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `test_order_specimen_source_fk` (`specimen_source`),
  KEY `test_order_frequency_fk` (`frequency`),
  CONSTRAINT `test_order_frequency_fk` FOREIGN KEY (`frequency`) REFERENCES `order_frequency` (`order_frequency_id`),
  CONSTRAINT `test_order_order_id_fk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `test_order_specimen_source_fk` FOREIGN KEY (`specimen_source`) REFERENCES `concept` (`concept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `user_property`
--

DROP TABLE IF EXISTS `user_property`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_property` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(100) NOT NULL DEFAULT '',
  `property_value` text,
  PRIMARY KEY (`user_id`,`property`),
  CONSTRAINT `user_property` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `user_property`
--

LOCK TABLES `user_property` WRITE;
/*!40000 ALTER TABLE `user_property` DISABLE KEYS */;
INSERT INTO `user_property` VALUES (1,'lockoutTimestamp',''),(1,'loginAttempts','0');
/*!40000 ALTER TABLE `user_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role`,`user_id`),
  KEY `user_role` (`user_id`),
  CONSTRAINT `role_definitions` FOREIGN KEY (`role`) REFERENCES `role` (`role`),
  CONSTRAINT `user_role` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Provider'),(1,'System Developer');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `salt` varchar(128) DEFAULT NULL,
  `secret_question` varchar(255) DEFAULT NULL,
  `secret_answer` varchar(255) DEFAULT NULL,
  `creator` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `person_id` int(11) NOT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_creator` (`creator`),
  KEY `user_who_changed_user` (`changed_by`),
  KEY `person_id_for_user` (`person_id`),
  KEY `user_who_retired_this_user` (`retired_by`),
  CONSTRAINT `person_id_for_user` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `user_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_changed_user` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `user_who_retired_this_user` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = "utf8" */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','','cc31443a3e10feb7a5c44b882805e9e6becfb819989e74211eaedab083b5abff9cc469c2407b8830751d7188493bd535a8a237dcce19a9a62b62ec916b0fe2ac','ccd5ee7fe223f168e949a613098dc3ea6c9104338a6ebefeed0cbf14ebcb1a2c732be9500ca2c8007c2652d9626c8f695413d58332ad5a7a94961b8a06146e27',NULL,NULL,1,'2005-01-01 00:00:00',1,'2019-08-28 20:59:37',1,0,NULL,NULL,NULL,'bd8289bc-c9c5-11e9-baa5-08002791e4e6'),(2,'daemon','daemon',NULL,NULL,NULL,NULL,1,'2010-04-26 13:25:00',NULL,NULL,1,0,NULL,NULL,NULL,'A4F30A1B-5EB9-11DF-A648-37A07F9C90FB');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `visit_type_id` int(11) NOT NULL,
  `date_started` datetime NOT NULL,
  `date_stopped` datetime DEFAULT NULL,
  `indication_concept_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_fk` (`visit_type_id`),
  KEY `visit_location_fk` (`location_id`),
  KEY `visit_creator_fk` (`creator`),
  KEY `visit_voided_by_fk` (`voided_by`),
  KEY `visit_changed_by_fk` (`changed_by`),
  KEY `visit_indication_concept_fk` (`indication_concept_id`),
  KEY `visit_patient_index` (`patient_id`),
  CONSTRAINT `visit_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_indication_concept_fk` FOREIGN KEY (`indication_concept_id`) REFERENCES `concept` (`concept_id`),
  CONSTRAINT `visit_location_fk` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `visit_patient_fk` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `visit_type_fk` FOREIGN KEY (`visit_type_id`) REFERENCES `visit_type` (`visit_type_id`),
  CONSTRAINT `visit_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=672043 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `visit_attribute`
--

DROP TABLE IF EXISTS `visit_attribute`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute` (
  `visit_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_id` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `value_reference` text NOT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `voided` tinyint(1) NOT NULL DEFAULT '0',
  `voided_by` int(11) DEFAULT NULL,
  `date_voided` datetime DEFAULT NULL,
  `void_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_attribute_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_visit_fk` (`visit_id`),
  KEY `visit_attribute_attribute_type_id_fk` (`attribute_type_id`),
  KEY `visit_attribute_creator_fk` (`creator`),
  KEY `visit_attribute_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_voided_by_fk` (`voided_by`),
  CONSTRAINT `visit_attribute_attribute_type_id_fk` FOREIGN KEY (`attribute_type_id`) REFERENCES `visit_attribute_type` (`visit_attribute_type_id`),
  CONSTRAINT `visit_attribute_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_visit_fk` FOREIGN KEY (`visit_id`) REFERENCES `visit` (`visit_id`),
  CONSTRAINT `visit_attribute_voided_by_fk` FOREIGN KEY (`voided_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `visit_attribute_type`
--

DROP TABLE IF EXISTS `visit_attribute_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_attribute_type` (
  `visit_attribute_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `datatype_config` text,
  `preferred_handler` varchar(255) DEFAULT NULL,
  `handler_config` text,
  `min_occurs` int(11) NOT NULL,
  `max_occurs` int(11) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(1) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  PRIMARY KEY (`visit_attribute_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_attribute_type_creator_fk` (`creator`),
  KEY `visit_attribute_type_changed_by_fk` (`changed_by`),
  KEY `visit_attribute_type_retired_by_fk` (`retired_by`),
  CONSTRAINT `visit_attribute_type_changed_by_fk` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_creator_fk` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_attribute_type_retired_by_fk` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;

--
-- Table structure for table `visit_type`
--

DROP TABLE IF EXISTS `visit_type`;

/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit_type` (
  `visit_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `uuid` char(38) NOT NULL,
  `creator` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `changed_by` int(11) DEFAULT NULL,
  `date_changed` datetime DEFAULT NULL,
  `retired` tinyint(4) NOT NULL DEFAULT '0',
  `retired_by` int(11) DEFAULT NULL,
  `date_retired` datetime DEFAULT NULL,
  `retire_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visit_type_id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `visit_type_creator` (`creator`),
  KEY `visit_type_changed_by` (`changed_by`),
  KEY `visit_type_retired_by` (`retired_by`),
  CONSTRAINT `visit_type_changed_by` FOREIGN KEY (`changed_by`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_creator` FOREIGN KEY (`creator`) REFERENCES `users` (`user_id`),
  CONSTRAINT `visit_type_retired_by` FOREIGN KEY (`retired_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = "utf8" */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 18:29:48
