-- MySQL dump 10.13  Distrib 8.3.0, for macos14.2 (arm64)
--
-- Host: localhost    Database: jobbox
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'2fvDKyKEjr9azkzmEiWuLBx4LGJS6FBE',1,'2024-03-11 00:36:01','2024-03-11 00:36:01','2024-03-11 00:36:01');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,'Voluptatem adipisci odio quis ut tempora quisquam. Aliquid explicabo aliquam maxime rerum. Consectetur quae quasi dolores. Velit ipsum sit voluptate.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-03-11 00:36:04','2024-03-11 00:36:04'),(2,'Lifestyle',0,'Dolores laudantium et repellat nam. Est nesciunt ipsum ut et quis deserunt. Eum unde aut fuga consectetur. Commodi qui veritatis est sed vero. Neque voluptatum sed perferendis architecto accusantium.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:36:04','2024-03-11 00:36:04'),(3,'Travel Tips',2,'Assumenda sit rerum nam velit. Vel velit veniam ratione. Recusandae pariatur nemo iste nihil quisquam omnis. Non mollitia atque vitae consequatur.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-11 00:36:04','2024-03-11 00:36:04'),(4,'Healthy',0,'Dolorem quo dolorum incidunt laboriosam fugiat deleniti. Illum deleniti dolores sed quod hic dicta voluptatem quis. Sint et sed voluptas ut aliquid. Perferendis nihil rerum distinctio in.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:36:04','2024-03-11 00:36:04'),(5,'Travel Tips',4,'Quidem placeat ipsum adipisci magnam. Eveniet odit ab ad ut qui voluptate aperiam.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-11 00:36:04','2024-03-11 00:36:04'),(6,'Hotel',0,'Est eos et aperiam repudiandae non. Nostrum qui in ducimus quis perferendis. Est distinctio et ut voluptas ut labore.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-11 00:36:04','2024-03-11 00:36:04'),(7,'Nature',6,'Amet omnis nostrum vel quod. Voluptas sit eos tempora. Dolor temporibus reiciendis voluptatem et hic et. Delectus quo non quis ut nihil excepturi ut.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-11 00:36:04','2024-03-11 00:36:04');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/location1.png',0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(2,'London','london',2,2,NULL,0,'locations/location2.png',0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(3,'New York','new-york',3,3,NULL,0,'locations/location3.png',0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(4,'New York','new-york-1',4,4,NULL,0,'locations/location4.png',0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/location5.png',0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(6,'Berlin','berlin',6,6,NULL,0,'locations/location6.png',0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Tyrell Williamson','verner.effertz@example.org','+17863842107','480 Treutel Crescent Suite 848\nEast Kiana, NH 09647','Vitae quas pariatur quis.','Facere saepe qui qui debitis. Quas ex est error quia id. Aperiam ut voluptas similique in mollitia et. Eaque et maiores dolorem eum. Neque et consequuntur velit expedita qui. Optio fuga accusamus autem qui suscipit. Magnam ut sunt illo. Iste quia ea voluptatem maiores. Voluptatibus tempora possimus enim enim voluptates. Est quos tempore rerum qui et. Molestiae aliquam aut nostrum est quae.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05'),(2,'Daron Powlowski','thiel.geovany@example.org','+14108622756','61965 Olson Stream\nNorth Kennedi, NY 44044','Sunt necessitatibus amet dolorem qui.','Nulla quo reprehenderit saepe natus minus. Perspiciatis odit beatae dolor ut vel. Sed neque nobis architecto fugit dolor doloribus saepe. Tempore iste non minima quis itaque minus. Ut voluptatem ut est voluptas placeat voluptas omnis quod. Eligendi cum error corporis. In minus quibusdam non dolorum sunt aperiam voluptate.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05'),(3,'Erwin Stehr','jakubowski.ramon@example.com','+12794572784','529 Troy Stravenue\nLake Francescohaven, OR 85536','Quis soluta autem aperiam aliquid nam.','Asperiores ex a consectetur aut tenetur et non. Et impedit impedit saepe debitis est. Exercitationem eius sit omnis magnam expedita est fuga. Et sunt quas dolorem optio laborum. Hic assumenda quod fuga hic labore ea non porro. Illo qui et nemo possimus ea deserunt distinctio consequatur. Sequi harum perspiciatis consequatur labore deserunt harum voluptas. Ut aspernatur et veniam at.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05'),(4,'Jaylen Bode','umiller@example.net','+13205060274','4392 Walker Port\nBalistreriside, KY 29547-1313','Nam aspernatur modi totam quisquam placeat.','Ad ad amet optio magni aliquid est. Et aut assumenda voluptatibus similique enim rem consequatur. Ut ipsam dolore quo. Enim est animi qui corrupti id. Nihil et quam placeat inventore est enim. Quo enim esse voluptatem natus pariatur. Ut reiciendis est et officia nihil earum delectus cupiditate. Consequatur voluptatem modi in ipsum nihil dolor occaecati aut.','read','2024-03-11 00:36:05','2024-03-11 00:36:05'),(5,'Prof. Buddy Daniel','anderson31@example.org','+12188175864','609 Okey Corner Suite 686\nSmithshire, MS 61915-9743','Officiis fugit enim est tempore.','Dolor vel ipsa sint incidunt optio sunt non. Aut ducimus voluptas voluptatem dolor est voluptatem. Velit voluptatibus voluptas rerum nihil. Doloribus laudantium pariatur sapiente voluptatibus repellat ullam. Vitae nam consectetur officia et aperiam eveniet qui. Voluptas quod soluta eaque ullam voluptatem non et dolores. Dolorem veniam aut est temporibus. Aut eaque perferendis aperiam quo officiis in animi facere.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05'),(6,'Chelsie Stark','kohler.travis@example.net','+19103153194','84200 Johns Mall\nEast Glennie, MN 75479-4960','Debitis provident dolorum qui maiores.','Veniam facilis rerum eos neque error soluta incidunt eaque. Voluptas quia libero et rerum. Consequatur ipsum vitae officiis at aut. Sit recusandae temporibus quia ipsa corrupti debitis perferendis. Sed eum et vel animi qui laborum. Eos non ut minus ullam voluptatem rerum. Quae dignissimos libero est cum adipisci et rerum. Possimus quo ipsa est vel nobis. Et et id facilis dolore.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05'),(7,'Ms. Etha Eichmann','jalen06@example.org','+12197196108','7591 Lindgren Center Suite 553\nTinachester, GA 80442-8901','Ut amet sequi itaque.','Quam dicta dolorum exercitationem voluptates sapiente. Assumenda qui ut at officia. Iusto est impedit quam sed aliquid. Maiores eum ut quo nihil autem dolores. Quo et quos perspiciatis. Nihil fugit est culpa aspernatur. Recusandae et omnis beatae ipsam quisquam. Asperiores illo aut natus ipsa exercitationem praesentium. Id ea vel modi eligendi. Et blanditiis tempore enim atque sunt consequuntur voluptas. Quo modi possimus voluptatem nostrum.','read','2024-03-11 00:36:05','2024-03-11 00:36:05'),(8,'Leone Jenkins','thora77@example.net','+17347828189','280 Karolann Glen Apt. 430\nNorth Faustostad, ND 23806','Dolores asperiores consequatur nam quod quas.','Est rem dolorum et harum sed et. Non distinctio tempora magni. Sed provident corporis aut numquam. Quo et ut accusamus accusamus doloremque. Et molestias quae beatae modi. Recusandae suscipit suscipit id omnis minus quia. Dignissimos natus minus totam ipsum in facere. Doloribus dicta ea exercitationem sequi aut odit. Natus eaque id voluptatem. Delectus qui sint esse quia aliquam natus. Quibusdam vero ut alias dolores suscipit ut.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05'),(9,'Zoie Kuvalis','lillian57@example.org','+13853450684','290 Deontae Ford\nGulgowskiberg, IA 09718-0298','Quia quibusdam vel blanditiis.','Animi iure odio quasi laboriosam. Et reiciendis ipsum distinctio repellendus. Eaque vitae vero magni rerum. Ratione qui omnis aperiam iure incidunt. Eveniet et cupiditate sunt iure ut harum ut aut. At soluta quas nihil iste ut earum. Sit consequatur ut enim esse laudantium magnam eum. Sequi veniam fugit commodi ab nam fugiat. Quis voluptatem nobis quia sed possimus reiciendis. Id dolores quia molestiae debitis tempore voluptas earum.','read','2024-03-11 00:36:05','2024-03-11 00:36:05'),(10,'Prof. Mustafa Beahan IV','alena57@example.net','+14458586841','465 Reta Island Apt. 515\nEast Reymundo, LA 72173-5035','Earum rerum totam molestiae dolores ex.','Ullam odit iure molestias assumenda. Laborum consequatur ut qui itaque enim. Omnis explicabo est odio laboriosam id ipsam. Ex laudantium sed atque iste consequatur. Voluptas adipisci ipsam ea harum enim officiis reiciendis. Dignissimos at nihil debitis porro harum ad nostrum dignissimos. Laudantium ipsam veniam nihil soluta non rerum laudantium. Doloribus magni fugiat nam rem dolore vitae. Et eos nulla impedit non.','unread','2024-03-11 00:36:05','2024-03-11 00:36:05');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published','2024-03-11 00:36:07',NULL,'FRA'),(2,'England','English',0,0,'published','2024-03-11 00:36:07',NULL,'UK'),(3,'USA','Americans',0,0,'published','2024-03-11 00:36:07',NULL,'US'),(4,'Holland','Dutch',0,0,'published','2024-03-11 00:36:07',NULL,'HL'),(5,'Denmark','Danish',0,0,'published','2024-03-11 00:36:07',NULL,'DN'),(6,'Germany','Danish',0,0,'published','2024-03-11 00:36:07',NULL,'DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'General',0,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(2,'Buying',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(3,'Payment',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(4,'Support',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(2,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(3,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(4,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(5,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(6,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(7,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(8,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(9,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(10,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(11,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(12,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(13,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(14,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(15,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(16,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(17,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(18,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(19,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',4,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(20,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(21,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',4,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(22,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',4,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(23,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',4,'published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(24,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Esse officia quis nostrum suscipit molestiae alias optio repellat. Consectetur et est voluptas odio. Porro et dolorum amet et laudantium.',1,0,'galleries/1.jpg',1,'published','2024-03-11 00:36:05','2024-03-11 00:36:05'),(2,'New Day','Laboriosam veritatis amet saepe quod quos. Atque harum non hic quidem officiis perspiciatis et.',1,0,'galleries/2.jpg',1,'published','2024-03-11 00:36:05','2024-03-11 00:36:05'),(3,'Happy Day','Tempora quo esse officiis vel. Dolorum corrupti alias nobis sit voluptas sint. Facere facere blanditiis repudiandae ipsam quis et dolores.',1,0,'galleries/3.jpg',1,'published','2024-03-11 00:36:05','2024-03-11 00:36:05'),(4,'Nature','Repellendus adipisci vel non quibusdam sint laboriosam blanditiis laudantium. Quas molestiae sequi ipsa accusantium recusandae eos eum.',1,0,'galleries/4.jpg',1,'published','2024-03-11 00:36:05','2024-03-11 00:36:05'),(5,'Morning','Fugiat est sint totam neque beatae rem. Quisquam quam mollitia consequatur est porro sapiente.',1,0,'galleries/5.jpg',1,'published','2024-03-11 00:36:05','2024-03-11 00:36:05'),(6,'Photography','Vero qui et omnis veritatis voluptas harum fuga. Sapiente quam et est ex. Eos sed et odio sed iste. Non nostrum corporis quia tempora.',1,0,'galleries/6.jpg',1,'published','2024-03-11 00:36:05','2024-03-11 00:36:05');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Distinctio minus cumque rem officiis nostrum deserunt nam. Quis fuga quibusdam numquam ut. Mollitia enim dolorem quia dolorem omnis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium velit laudantium iure modi. Dolores nobis enim eaque aut. Et non repudiandae non.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Eaque saepe cumque excepturi est sint nisi a reprehenderit. Numquam vel esse eligendi. Aut deserunt architecto autem veritatis facere et ut.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Magnam culpa ea labore ipsam autem magnam eaque. Eaque odio deserunt commodi sint tempora provident qui. Quia voluptates ea ad fugit numquam iusto.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Tempore occaecati enim est quis. Non sit quas fugiat rerum sit et voluptas. Repellendus et eum est.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Enim in deserunt et voluptate dignissimos voluptas optio est. Culpa ratione vel nam et. Sint voluptate qui ut quos illo iste ipsum.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quia velit ipsa natus quia eos. Reiciendis maxime veritatis vel fuga illum animi temporibus nulla. Illo beatae velit odit id voluptates quis non.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Pariatur architecto fuga vel aperiam dolorum et quas. Asperiores dolores voluptas modi est quibusdam ut. Illum eos suscipit dolores saepe dolorum et.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Sit eligendi quam repellendus. Cupiditate et ducimus qui ut. Mollitia illum error amet ut ullam eveniet. Expedita qui dolorem sed qui.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2024-03-11 00:36:05','2024-03-11 00:36:05'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Distinctio minus cumque rem officiis nostrum deserunt nam. Quis fuga quibusdam numquam ut. Mollitia enim dolorem quia dolorem omnis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium velit laudantium iure modi. Dolores nobis enim eaque aut. Et non repudiandae non.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Eaque saepe cumque excepturi est sint nisi a reprehenderit. Numquam vel esse eligendi. Aut deserunt architecto autem veritatis facere et ut.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Magnam culpa ea labore ipsam autem magnam eaque. Eaque odio deserunt commodi sint tempora provident qui. Quia voluptates ea ad fugit numquam iusto.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Tempore occaecati enim est quis. Non sit quas fugiat rerum sit et voluptas. Repellendus et eum est.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Enim in deserunt et voluptate dignissimos voluptas optio est. Culpa ratione vel nam et. Sint voluptate qui ut quos illo iste ipsum.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quia velit ipsa natus quia eos. Reiciendis maxime veritatis vel fuga illum animi temporibus nulla. Illo beatae velit odit id voluptates quis non.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Pariatur architecto fuga vel aperiam dolorum et quas. Asperiores dolores voluptas modi est quibusdam ut. Illum eos suscipit dolores saepe dolorum et.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Sit eligendi quam repellendus. Cupiditate et ducimus qui ut. Mollitia illum error amet ut ullam eveniet. Expedita qui dolorem sed qui.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2024-03-11 00:36:05','2024-03-11 00:36:05'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Distinctio minus cumque rem officiis nostrum deserunt nam. Quis fuga quibusdam numquam ut. Mollitia enim dolorem quia dolorem omnis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium velit laudantium iure modi. Dolores nobis enim eaque aut. Et non repudiandae non.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Eaque saepe cumque excepturi est sint nisi a reprehenderit. Numquam vel esse eligendi. Aut deserunt architecto autem veritatis facere et ut.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Magnam culpa ea labore ipsam autem magnam eaque. Eaque odio deserunt commodi sint tempora provident qui. Quia voluptates ea ad fugit numquam iusto.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Tempore occaecati enim est quis. Non sit quas fugiat rerum sit et voluptas. Repellendus et eum est.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Enim in deserunt et voluptate dignissimos voluptas optio est. Culpa ratione vel nam et. Sint voluptate qui ut quos illo iste ipsum.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quia velit ipsa natus quia eos. Reiciendis maxime veritatis vel fuga illum animi temporibus nulla. Illo beatae velit odit id voluptates quis non.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Pariatur architecto fuga vel aperiam dolorum et quas. Asperiores dolores voluptas modi est quibusdam ut. Illum eos suscipit dolores saepe dolorum et.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Sit eligendi quam repellendus. Cupiditate et ducimus qui ut. Mollitia illum error amet ut ullam eveniet. Expedita qui dolorem sed qui.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2024-03-11 00:36:05','2024-03-11 00:36:05'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Distinctio minus cumque rem officiis nostrum deserunt nam. Quis fuga quibusdam numquam ut. Mollitia enim dolorem quia dolorem omnis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium velit laudantium iure modi. Dolores nobis enim eaque aut. Et non repudiandae non.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Eaque saepe cumque excepturi est sint nisi a reprehenderit. Numquam vel esse eligendi. Aut deserunt architecto autem veritatis facere et ut.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Magnam culpa ea labore ipsam autem magnam eaque. Eaque odio deserunt commodi sint tempora provident qui. Quia voluptates ea ad fugit numquam iusto.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Tempore occaecati enim est quis. Non sit quas fugiat rerum sit et voluptas. Repellendus et eum est.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Enim in deserunt et voluptate dignissimos voluptas optio est. Culpa ratione vel nam et. Sint voluptate qui ut quos illo iste ipsum.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quia velit ipsa natus quia eos. Reiciendis maxime veritatis vel fuga illum animi temporibus nulla. Illo beatae velit odit id voluptates quis non.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Pariatur architecto fuga vel aperiam dolorum et quas. Asperiores dolores voluptas modi est quibusdam ut. Illum eos suscipit dolores saepe dolorum et.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Sit eligendi quam repellendus. Cupiditate et ducimus qui ut. Mollitia illum error amet ut ullam eveniet. Expedita qui dolorem sed qui.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2024-03-11 00:36:05','2024-03-11 00:36:05'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Distinctio minus cumque rem officiis nostrum deserunt nam. Quis fuga quibusdam numquam ut. Mollitia enim dolorem quia dolorem omnis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium velit laudantium iure modi. Dolores nobis enim eaque aut. Et non repudiandae non.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Eaque saepe cumque excepturi est sint nisi a reprehenderit. Numquam vel esse eligendi. Aut deserunt architecto autem veritatis facere et ut.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Magnam culpa ea labore ipsam autem magnam eaque. Eaque odio deserunt commodi sint tempora provident qui. Quia voluptates ea ad fugit numquam iusto.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Tempore occaecati enim est quis. Non sit quas fugiat rerum sit et voluptas. Repellendus et eum est.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Enim in deserunt et voluptate dignissimos voluptas optio est. Culpa ratione vel nam et. Sint voluptate qui ut quos illo iste ipsum.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quia velit ipsa natus quia eos. Reiciendis maxime veritatis vel fuga illum animi temporibus nulla. Illo beatae velit odit id voluptates quis non.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Pariatur architecto fuga vel aperiam dolorum et quas. Asperiores dolores voluptas modi est quibusdam ut. Illum eos suscipit dolores saepe dolorum et.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Sit eligendi quam repellendus. Cupiditate et ducimus qui ut. Mollitia illum error amet ut ullam eveniet. Expedita qui dolorem sed qui.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2024-03-11 00:36:05','2024-03-11 00:36:05'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Distinctio minus cumque rem officiis nostrum deserunt nam. Quis fuga quibusdam numquam ut. Mollitia enim dolorem quia dolorem omnis.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Praesentium velit laudantium iure modi. Dolores nobis enim eaque aut. Et non repudiandae non.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Eaque saepe cumque excepturi est sint nisi a reprehenderit. Numquam vel esse eligendi. Aut deserunt architecto autem veritatis facere et ut.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Magnam culpa ea labore ipsam autem magnam eaque. Eaque odio deserunt commodi sint tempora provident qui. Quia voluptates ea ad fugit numquam iusto.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Tempore occaecati enim est quis. Non sit quas fugiat rerum sit et voluptas. Repellendus et eum est.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"Enim in deserunt et voluptate dignissimos voluptas optio est. Culpa ratione vel nam et. Sint voluptate qui ut quos illo iste ipsum.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quia velit ipsa natus quia eos. Reiciendis maxime veritatis vel fuga illum animi temporibus nulla. Illo beatae velit odit id voluptates quis non.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Pariatur architecto fuga vel aperiam dolorum et quas. Asperiores dolores voluptas modi est quibusdam ut. Illum eos suscipit dolores saepe dolorum et.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Sit eligendi quam repellendus. Cupiditate et ducimus qui ut. Mollitia illum error amet ut ullam eveniet. Expedita qui dolorem sed qui.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2024-03-11 00:36:05','2024-03-11 00:36:05');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_activity_logs`
--

DROP TABLE IF EXISTS `jb_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_activity_logs`
--

LOCK TABLES `jb_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `jb_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_educations`
--

DROP TABLE IF EXISTS `jb_account_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `specialized` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_educations`
--

LOCK TABLES `jb_account_educations` WRITE;
/*!40000 ALTER TABLE `jb_account_educations` DISABLE KEYS */;
INSERT INTO `jb_account_educations` VALUES (1,'Antioch University McGregor',2,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:11','2024-03-11 00:36:11'),(2,'The University of the State of Alabama',6,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:12','2024-03-11 00:36:12'),(3,'The University of the State of Alabama',8,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:13','2024-03-11 00:36:13'),(4,'Adams State College',10,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:13','2024-03-11 00:36:13'),(5,'American Institute of Health Technology',12,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:14','2024-03-11 00:36:14'),(6,'Adams State College',15,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:14','2024-03-11 00:36:14'),(7,'Antioch University McGregor',17,'Classical Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:15','2024-03-11 00:36:15'),(8,'Associated Mennonite Biblical Seminary',18,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:15','2024-03-11 00:36:15'),(9,'Gateway Technical College',21,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:16','2024-03-11 00:36:16'),(10,'Adams State College',24,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:17','2024-03-11 00:36:17'),(11,'American Institute of Health Technology',25,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:17','2024-03-11 00:36:17'),(12,'Associated Mennonite Biblical Seminary',26,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:17','2024-03-11 00:36:17'),(13,'Antioch University McGregor',30,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:18','2024-03-11 00:36:18'),(14,'Adams State College',32,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:19','2024-03-11 00:36:19'),(15,'Adams State College',34,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:19','2024-03-11 00:36:19'),(16,'The University of the State of Alabama',35,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:19','2024-03-11 00:36:19'),(17,'Associated Mennonite Biblical Seminary',39,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:20','2024-03-11 00:36:20'),(18,'Adams State College',47,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:22','2024-03-11 00:36:22'),(19,'Associated Mennonite Biblical Seminary',49,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:23','2024-03-11 00:36:23'),(20,'American Institute of Health Technology',56,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:25','2024-03-11 00:36:25'),(21,'Adams State College',62,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:26','2024-03-11 00:36:26'),(22,'American Institute of Health Technology',66,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:27','2024-03-11 00:36:27'),(23,'The University of the State of Alabama',67,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:27','2024-03-11 00:36:27'),(24,'American Institute of Health Technology',68,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(25,'Gateway Technical College',69,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(26,'The University of the State of Alabama',70,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(27,'The University of the State of Alabama',71,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(28,'Associated Mennonite Biblical Seminary',73,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:29','2024-03-11 00:36:29'),(29,'American Institute of Health Technology',74,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:29','2024-03-11 00:36:29'),(30,'Gateway Technical College',79,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:30','2024-03-11 00:36:30'),(31,'Adams State College',80,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:31','2024-03-11 00:36:31'),(32,'The University of the State of Alabama',81,'Classical Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:31','2024-03-11 00:36:31'),(33,'Antioch University McGregor',82,'Classical Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:31','2024-03-11 00:36:31'),(34,'Gateway Technical College',87,'Economics','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:32','2024-03-11 00:36:32'),(35,'American Institute of Health Technology',88,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:33','2024-03-11 00:36:33'),(36,'The University of the State of Alabama',89,'Classical Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:33','2024-03-11 00:36:33'),(37,'Associated Mennonite Biblical Seminary',90,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:33','2024-03-11 00:36:33'),(38,'Adams State College',92,'Art History','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:34','2024-03-11 00:36:34'),(39,'Associated Mennonite Biblical Seminary',97,'Anthropology','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:35','2024-03-11 00:36:35'),(40,'Antioch University McGregor',98,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:35','2024-03-11 00:36:35'),(41,'Adams State College',99,'Culture and Technology Studies','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:35','2024-03-11 00:36:35');
/*!40000 ALTER TABLE `jb_account_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_experiences`
--

DROP TABLE IF EXISTS `jb_account_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_experiences`
--

LOCK TABLES `jb_account_experiences` WRITE;
/*!40000 ALTER TABLE `jb_account_experiences` DISABLE KEYS */;
INSERT INTO `jb_account_experiences` VALUES (1,'GameDay Catering',2,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:11','2024-03-11 00:36:11'),(2,'Exploration Kids',6,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:12','2024-03-11 00:36:12'),(3,'Party Plex',8,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:13','2024-03-11 00:36:13'),(4,'Spa Paragon',10,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:13','2024-03-11 00:36:13'),(5,'Exploration Kids',12,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:14','2024-03-11 00:36:14'),(6,'Party Plex',15,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:14','2024-03-11 00:36:14'),(7,'GameDay Catering',17,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:15','2024-03-11 00:36:15'),(8,'Party Plex',18,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:15','2024-03-11 00:36:15'),(9,'Darwin Travel',21,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:16','2024-03-11 00:36:16'),(10,'GameDay Catering',24,'President of Sales','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:17','2024-03-11 00:36:17'),(11,'Darwin Travel',25,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:17','2024-03-11 00:36:17'),(12,'Darwin Travel',26,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:17','2024-03-11 00:36:17'),(13,'Spa Paragon',30,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:18','2024-03-11 00:36:18'),(14,'GameDay Catering',32,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:19','2024-03-11 00:36:19'),(15,'Darwin Travel',34,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:19','2024-03-11 00:36:19'),(16,'Darwin Travel',35,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:19','2024-03-11 00:36:19'),(17,'Party Plex',39,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:20','2024-03-11 00:36:20'),(18,'Spa Paragon',47,'President of Sales','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:22','2024-03-11 00:36:22'),(19,'Exploration Kids',49,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:23','2024-03-11 00:36:23'),(20,'Party Plex',56,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:25','2024-03-11 00:36:25'),(21,'Darwin Travel',62,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:26','2024-03-11 00:36:26'),(22,'GameDay Catering',66,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:27','2024-03-11 00:36:27'),(23,'Spa Paragon',67,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:27','2024-03-11 00:36:27'),(24,'GameDay Catering',68,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(25,'Exploration Kids',69,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(26,'Exploration Kids',70,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(27,'GameDay Catering',71,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:28','2024-03-11 00:36:28'),(28,'Spa Paragon',73,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:29','2024-03-11 00:36:29'),(29,'GameDay Catering',74,'President of Sales','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:29','2024-03-11 00:36:29'),(30,'Party Plex',79,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:30','2024-03-11 00:36:30'),(31,'Party Plex',80,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:31','2024-03-11 00:36:31'),(32,'Party Plex',81,'Dog Trainer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:31','2024-03-11 00:36:31'),(33,'GameDay Catering',82,'President of Sales','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:31','2024-03-11 00:36:31'),(34,'Darwin Travel',87,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:32','2024-03-11 00:36:32'),(35,'Spa Paragon',88,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:33','2024-03-11 00:36:33'),(36,'Exploration Kids',89,'Web Designer','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:33','2024-03-11 00:36:33'),(37,'Spa Paragon',90,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:33','2024-03-11 00:36:33'),(38,'Party Plex',92,'Project Manager','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:34','2024-03-11 00:36:34'),(39,'GameDay Catering',97,'President of Sales','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:35','2024-03-11 00:36:35'),(40,'Darwin Travel',98,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:35','2024-03-11 00:36:35'),(41,'Spa Paragon',99,'Marketing Coordinator','2024-03-11','2024-03-11','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-11 00:36:35','2024-03-11 00:36:35');
/*!40000 ALTER TABLE `jb_account_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_skills`
--

DROP TABLE IF EXISTS `jb_account_favorite_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_skills` (
  `skill_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`skill_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_skills`
--

LOCK TABLES `jb_account_favorite_skills` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_tags`
--

DROP TABLE IF EXISTS `jb_account_favorite_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_tags`
--

LOCK TABLES `jb_account_favorite_tags` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_packages`
--

DROP TABLE IF EXISTS `jb_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_packages`
--

LOCK TABLES `jb_account_packages` WRITE;
/*!40000 ALTER TABLE `jb_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_password_resets`
--

DROP TABLE IF EXISTS `jb_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `jb_account_password_resets_email_index` (`email`),
  KEY `jb_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_password_resets`
--

LOCK TABLES `jb_account_password_resets` WRITE;
/*!40000 ALTER TABLE `jb_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_accounts`
--

DROP TABLE IF EXISTS `jb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job-seeker',
  `credits` int unsigned DEFAULT NULL,
  `resume` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_public_profile` tinyint unsigned NOT NULL DEFAULT '0',
  `hide_cv` tinyint(1) NOT NULL DEFAULT '0',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_for_hiring` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `cover_letter` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_accounts_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_accounts`
--

LOCK TABLES `jb_accounts` WRITE;
/*!40000 ALTER TABLE `jb_accounts` DISABLE KEYS */;
INSERT INTO `jb_accounts` VALUES (1,'Melvin','Dicki','Software Developer',NULL,'employer@archielite.com','$2y$12$D3iPD2POHl0oxpM/80aMcuMiub4u3GtZFow0zonicoVjl4PuCx0X.',186,'2002-08-17','+17259913393','2024-03-11 07:36:11',NULL,'employer',NULL,NULL,'885 Schuppe Ports Suite 400\nLake Conradmouth, WV 06431-5774','All on a branch of a well?\' \'Take some more bread-and-butter--\' \'But what did the archbishop find?\' The Mouse did not notice this question, but hurriedly went on, \'What\'s your name, child?\' \'My name.',1,0,1974,0,NULL,'2024-03-11 00:36:11','2024-03-11 00:36:11',0,1,NULL,NULL,NULL),(2,'Norbert','Schulist','Creative Designer',NULL,'job_seeker@archielite.com','$2y$12$sVtCOiR5eA7G8U3GfR1nC.gWK7Yn0hi0umn.pAUfFfIGHNEqs8gLi',185,'1982-12-14','+16629842134','2024-03-11 07:36:11',NULL,'job-seeker',NULL,'resume/01.pdf','7664 Issac Pines\nLake Madilyn, AK 30335','Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said this she looked down at her feet, they seemed to listen, the whole party look so grave and anxious.) Alice could.',1,0,3834,1,NULL,'2024-03-11 00:36:11','2024-03-11 00:36:11',0,1,NULL,NULL,NULL),(3,'Sarah','Harding','Creative Designer',NULL,'sarah_harding@archielite.com','$2y$12$YAZ5IDO4SRSTfy9VfuqFnewwLRo1GSNeYh1GmPS4SB9rw/2QDATEO',184,'1983-11-02','+13522428539','2024-03-11 07:36:11',NULL,'employer',NULL,NULL,'620 Aaron Dale Apt. 055\nSouth Fredystad, CO 60121','March Hare, \'that \"I like what I could not make out what it was her dream:-- First, she dreamed of little Alice and all of you, and don\'t speak a word till I\'ve finished.\' So they went up to the.',1,0,1813,0,NULL,'2024-03-11 00:36:11','2024-03-11 00:36:11',1,1,NULL,NULL,NULL),(4,'Steven','Jobs','Creative Designer',NULL,'steven_jobs@archielite.com','$2y$12$8/LMrdw7Bed0OI0FsblnjuLHaVN4ZzQKM02k4D1bwz8rPxt0.PZA.',185,'1993-03-19','+14357555449','2024-03-11 07:36:12',NULL,'employer',NULL,NULL,'405 Vivian Fall\nSherwoodmouth, OR 63481-0299','Alice, they all quarrel so dreadfully one can\'t hear oneself speak--and they don\'t seem to encourage the witness at all: he kept shifting from one foot up the fan and a large dish of tarts upon it.',1,0,4079,1,NULL,'2024-03-11 00:36:12','2024-03-11 00:36:12',1,1,NULL,NULL,NULL),(5,'William','Kent','Creative Designer',NULL,'william_kent@archielite.com','$2y$12$O.nHQGPSVvfQ2NGvAXKRXeOylSW8cewIP5zU5zkDk58txLEY1cISS',186,'1985-02-09','+15027848878','2024-03-11 07:36:12',NULL,'employer',NULL,NULL,'9836 Haley Via Apt. 838\nNorth Alfred, NV 63496','I don\'t keep the same year for such dainties would not stoop? Soup of the March Hare meekly replied. \'Yes, but some crumbs must have been changed in the face. \'I\'ll put a stop to this,\' she said to.',1,0,1607,1,NULL,'2024-03-11 00:36:12','2024-03-11 00:36:12',0,1,NULL,NULL,NULL),(6,'Clifton','Wolf','Bill! catch hold.',NULL,'uledner@turcotte.net','$2y$12$WvaWkfCYraZ3Ww9V5M1nfeFXesnH.1UuYxfQ5NWR/jcmNb4qMC80W',185,'1990-01-12','+14799065116','2024-03-11 07:36:12',NULL,'job-seeker',NULL,'resume/01.pdf','292 Schulist Circle Suite 335\nNorth Alyceville, OK 77584-9183','Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in the last words out loud, and the other paw, \'lives a Hatter: and in another minute the whole cause, and.',1,0,4032,0,NULL,'2024-03-11 00:36:12','2024-03-11 00:36:12',1,1,NULL,NULL,NULL),(7,'Effie','Turcotte','The Mouse looked.',NULL,'helene39@hudson.net','$2y$12$tIFu5N8qhfG9igyIEEl2Ie8XlXn5zG0aUwmYKb5J3equfC87ofh7K',185,'2015-04-06','+13643554175','2024-03-11 07:36:12',NULL,'employer',NULL,NULL,'491 Raphael Stream\nPaoloberg, OR 82644-0454','Oh dear! I wish I could let you out, you know.\' \'I don\'t know much,\' said Alice, \'how am I to do?\' said Alice. \'What IS the same tone, exactly as if his heart would break. She pitied him deeply.',1,0,666,0,NULL,'2024-03-11 00:36:12','2024-03-11 00:36:12',0,1,NULL,NULL,NULL),(8,'Marcelina','Nienow','I grow at a king,\'.',NULL,'alva.gusikowski@nader.com','$2y$12$Q3kjFHDVyADYpi53RBj5sOWeAcsOz7UHKjwPoR45kN4EZFiCslCJ6',186,'1978-09-29','+16092476780','2024-03-11 07:36:13',NULL,'job-seeker',NULL,'resume/01.pdf','1963 Considine Wells\nGiuseppefurt, TX 07314-6271','The Panther took pie-crust, and gravy, and meat, While the Duchess by this time, sat down a jar from one of them hit her in the world am I? Ah, THAT\'S the great puzzle!\' And she thought to herself.',1,0,615,0,NULL,'2024-03-11 00:36:13','2024-03-11 00:36:13',0,1,NULL,NULL,NULL),(9,'Josie','Ratke','Alice\'s shoulder.',NULL,'wwatsica@gmail.com','$2y$12$cmMPrOf5UtOKfCYUN.5kq.c3pLRY.kBlaYseOFwuDg2FqaRiW8GN2',186,'1976-07-18','+14019930938','2024-03-11 07:36:13',NULL,'employer',NULL,NULL,'4691 Carroll Mews\nLeoland, IA 32462-0573','Footman remarked, \'till tomorrow--\' At this moment the King, \'that only makes the matter on, What would become of you? I gave her one, they gave him two, You gave us three or more; They all sat down.',1,0,765,1,NULL,'2024-03-11 00:36:13','2024-03-11 00:36:13',0,1,NULL,NULL,NULL),(10,'Abigale','Moore','King. Here one of.',NULL,'pwalker@hotmail.com','$2y$12$D/gvWFKVGMdHOEbvnNO/p.hE0WccEpKEV2iFuA3v4D3Xwm1UkIq2y',184,'1996-06-21','+14585339213','2024-03-11 07:36:13',NULL,'job-seeker',NULL,'resume/01.pdf','65629 Abraham Vista Suite 511\nEast Lonzo, IL 52640-5090','Alice quietly said, just as I used--and I don\'t think,\' Alice went timidly up to the end of his shrill little voice, the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, with a.',1,0,2671,1,NULL,'2024-03-11 00:36:13','2024-03-11 00:36:13',1,1,NULL,NULL,NULL),(11,'Sophie','Tremblay','Alice looked down.',NULL,'bertha.satterfield@hotmail.com','$2y$12$xNmOwr/9h/7ZB9hkyE30Su7H1rfXnfexHKBKLW1y/WCMRWSJIL1SK',186,'2005-08-31','+17195034068','2024-03-11 07:36:13',NULL,'employer',NULL,NULL,'59894 Sammie Points Suite 715\nToreyhaven, IL 80864-8282','Alice said to herself. \'Of the mushroom,\' said the youth, \'as I mentioned before, And have grown most uncommonly fat; Yet you turned a back-somersault in at the bottom of the tale was something like.',1,0,1178,0,NULL,'2024-03-11 00:36:13','2024-03-11 00:36:13',0,1,NULL,NULL,NULL),(12,'Candice','Franecki','There was a real.',NULL,'stephen.kreiger@franecki.com','$2y$12$KKovsCBTkl8Av8a.Ked2heDoKjuwDCj.ZImOz3TNyv5vrz0mUCJvy',186,'1973-01-23','+19529809650','2024-03-11 07:36:14',NULL,'job-seeker',NULL,'resume/01.pdf','446 Luettgen Ports Suite 588\nFranzshire, NM 65562-6349','I get SOMEWHERE,\' Alice added as an unusually large saucepan flew close by it, and yet it was very provoking to find her in a confused way, \'Prizes! Prizes!\' Alice had no idea what to beautify is, I.',1,0,3293,0,NULL,'2024-03-11 00:36:14','2024-03-11 00:36:14',0,1,NULL,NULL,NULL),(13,'Aidan','Kessler','Why, I do wonder.',NULL,'tbins@lesch.info','$2y$12$pdb1k0HHMmilBkmWB69OOu0NHFIdZfBHLrMZCH1/q9Kh8000ZXUE6',184,'1973-06-03','+16202861755','2024-03-11 07:36:14',NULL,'employer',NULL,NULL,'328 Anderson Village\nPort Myrticeview, ID 42930','Alice)--\'and perhaps you haven\'t found it very hard indeed to make out exactly what they said. The executioner\'s argument was, that her idea of having nothing to do: once or twice, half hoping she.',1,0,2608,1,NULL,'2024-03-11 00:36:14','2024-03-11 00:36:14',1,1,NULL,NULL,NULL),(14,'Freda','Harvey','Dodo managed it.).',NULL,'hiram66@parisian.com','$2y$12$gLSIxZz6UmrMaKyW0RzL.eYg664kkK5Fvv1BOJ8A5YQX6G7bbjpNa',185,'2006-08-23','+18582004099','2024-03-11 07:36:14',NULL,'employer',NULL,NULL,'307 Royal Pike Suite 231\nEulaton, AZ 38038-6561','I shall be late!\' (when she thought of herself, \'I wonder if I\'ve kept her waiting!\' Alice felt a little queer, won\'t you?\' \'Not a bit,\' said the King said, with a whiting. Now you know.\' \'And what.',1,0,1570,1,NULL,'2024-03-11 00:36:14','2024-03-11 00:36:14',1,1,NULL,NULL,NULL),(15,'Laila','Murazik','And yet I wish you.',NULL,'johnston.danial@gutmann.biz','$2y$12$J0tkNsXiehVPd8DatvAAxemJyVGUmr7q3g6noea2HR0qztNs1QD3S',184,'1997-01-12','+13316414837','2024-03-11 07:36:14',NULL,'job-seeker',NULL,'resume/01.pdf','72162 Doyle Squares\nPort Kathlynbury, MT 81177','Queen, and Alice looked all round the neck of the shelves as she spoke. \'I must be getting home; the night-air doesn\'t suit my throat!\' and a piece of bread-and-butter in the air: it puzzled her a.',1,0,3031,1,NULL,'2024-03-11 00:36:14','2024-03-11 00:36:14',1,1,NULL,NULL,NULL),(16,'Garnett','Rogahn','Mock Turtle said.',NULL,'rafaela.schaden@rippin.com','$2y$12$J7mm5AeU4oZgDMm6gjHZ4ensZHmGd6MQUwa0Os2XneWrfev/llePy',186,'2022-12-17','+13469366165','2024-03-11 07:36:15',NULL,'employer',NULL,NULL,'964 Miracle Camp Apt. 308\nKatarinaville, WV 32484','Mouse, frowning, but very glad to do next, when suddenly a footman in livery, with a whiting. Now you know.\' Alice had begun to dream that she had known them all her riper years, the simple and.',1,0,3148,1,NULL,'2024-03-11 00:36:15','2024-03-11 00:36:15',1,1,NULL,NULL,NULL),(17,'Ernie','Wilkinson','MARMALADE\', but to.',NULL,'jayda32@rohan.com','$2y$12$gEIEdA/ApcMLJLCl7xdE/.Qwe2W3qmFRkS0AclQks176PuVU6l1ma',186,'2016-05-01','+13046182311','2024-03-11 07:36:15',NULL,'job-seeker',NULL,'resume/01.pdf','67646 Klein Tunnel\nNorth Kellie, AR 94714-3988','Dormouse was sitting on the end of the baby?\' said the Rabbit hastily interrupted. \'There\'s a great crash, as if it likes.\' \'I\'d rather finish my tea,\' said the Mock Turtle to sing \"Twinkle.',1,0,2562,1,NULL,'2024-03-11 00:36:15','2024-03-11 00:36:15',1,1,NULL,NULL,NULL),(18,'Flo','Stanton','Still she went on.',NULL,'gusikowski.autumn@turcotte.com','$2y$12$3DTahVgZfJp24J4C5YDgjuSDez1joS7DlinExcQeOo3iNT5sA8WJK',184,'2001-06-16','+17167324516','2024-03-11 07:36:15',NULL,'job-seeker',NULL,'resume/01.pdf','40908 Hermann Corner\nNew Carmelafurt, WY 60675','I must have been a RED rose-tree, and we won\'t talk about her any more HERE.\' \'But then,\' thought Alice, \'or perhaps they won\'t walk the way to change the subject. \'Ten hours the first to break the.',1,0,4866,0,NULL,'2024-03-11 00:36:15','2024-03-11 00:36:15',0,1,NULL,NULL,NULL),(19,'Adella','Conroy','Caterpillar called.',NULL,'ruthie.okeefe@kirlin.com','$2y$12$oLqcsEVEJ8NnXGTa8oLp2.eA6uKJ6TwMtySY5VNn.3z/eicYxQF5i',185,'1992-11-26','+15157332167','2024-03-11 07:36:15',NULL,'employer',NULL,NULL,'641 Pearl Islands Apt. 749\nNew Princess, NC 13732','I can\'t tell you his history,\' As they walked off together, Alice heard it say to this: so she felt certain it must be removed,\' said the Caterpillar. Alice thought to herself \'This is Bill,\' she.',1,0,345,0,NULL,'2024-03-11 00:36:15','2024-03-11 00:36:15',0,1,NULL,NULL,NULL),(20,'Ottis','Bartell','SHE, of course,\'.',NULL,'zsporer@rodriguez.info','$2y$12$X77zU9w4sC5f4RfBP6QSw.ZcLfHU.a5HPxhyc3rlSRfZVphNugyea',186,'2009-02-12','+16038591115','2024-03-11 07:36:16',NULL,'employer',NULL,NULL,'72037 Metz Trafficway Suite 664\nEinarville, IA 20878','Caterpillar, and the soldiers had to kneel down on one knee as he spoke. \'UNimportant, of course, I meant,\' the King said to the porpoise, \"Keep back, please: we don\'t want to see the Queen. \'Well.',1,0,2432,1,NULL,'2024-03-11 00:36:16','2024-03-11 00:36:16',0,1,NULL,NULL,NULL),(21,'Leatha','Berge','Alice: \'she\'s so.',NULL,'donavon33@bogan.info','$2y$12$2ffqTvIasCIamUEX9bTmFOE8n./KytUkHcivys5ua4u6jBVdEPj6W',184,'2013-04-17','+17167247744','2024-03-11 07:36:16',NULL,'job-seeker',NULL,'resume/01.pdf','26746 Madelyn Dam\nLake Ressietown, AK 16098-1479','Alice thought over all the rest of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mouse, who seemed to have been changed for Mabel! I\'ll try if I chose,\' the Duchess said.',1,0,2864,1,NULL,'2024-03-11 00:36:16','2024-03-11 00:36:16',0,1,NULL,NULL,NULL),(22,'Jon','Kub','I want to get in?\'.',NULL,'vernie.rowe@hotmail.com','$2y$12$m/BbLRf6/dYdabv7YfJlKOqhfpk2.8qBTkZJnAIZAxDSKqj5zhmsG',186,'1972-03-15','+19204691931','2024-03-11 07:36:16',NULL,'employer',NULL,NULL,'51551 Ward Underpass Suite 731\nAdrainbury, ID 06068','And she began looking at the bottom of a globe of goldfish she had got burnt, and eaten up by a row of lodging houses, and behind it, it occurred to her ear. \'You\'re thinking about something, my.',1,0,2704,0,NULL,'2024-03-11 00:36:16','2024-03-11 00:36:16',0,1,NULL,NULL,NULL),(23,'Emerald','Corkery','Sir, With no jury.',NULL,'funk.pearlie@yahoo.com','$2y$12$waeexNwtzXU8a7VRSX4K8OvPxTRHyWMRVpZzigImtXggvyxUIcmZ.',184,'1973-10-14','+16576566036','2024-03-11 07:36:16',NULL,'employer',NULL,NULL,'9123 Paucek Rue Suite 967\nWest Justinaville, ID 20938','Just then she walked down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go down the little door was shut again, and we won\'t talk about wasting IT. It\'s HIM.\' \'I don\'t much.',1,0,3019,0,NULL,'2024-03-11 00:36:16','2024-03-11 00:36:16',1,1,NULL,NULL,NULL),(24,'Madonna','Murazik','Alice. \'You did,\'.',NULL,'oschneider@cartwright.com','$2y$12$d92KK1EUBYK1dwXtsjkoteTlKMWT07VlWInKVNDeqlabuK3dDkrRi',184,'1975-11-29','+16782177909','2024-03-11 07:36:17',NULL,'job-seeker',NULL,'resume/01.pdf','73021 Dooley Cove Apt. 581\nMakenzieville, KS 15130','Alice recognised the White Rabbit returning, splendidly dressed, with a sigh: \'it\'s always tea-time, and we\'ve no time she\'d have everybody executed, all round. \'But she must have been ill.\' \'So.',1,0,4426,1,NULL,'2024-03-11 00:36:17','2024-03-11 00:36:17',0,1,NULL,NULL,NULL),(25,'Violette','Gaylord','Alice, in a hurry.',NULL,'nolan.verner@yahoo.com','$2y$12$vQsiVikbXnXhGkb3eVckLeOinvT0uCLBPEf2CI2VLptL90C4FGYQe',185,'1979-02-08','+17479536772','2024-03-11 07:36:17',NULL,'job-seeker',NULL,'resume/01.pdf','894 Marguerite Highway Apt. 451\nPort Jed, AZ 48180-9074','The Footman seemed to rise like a Jack-in-the-box, and up the little crocodile Improve his shining tail, And pour the waters of the shelves as she did not at all this grand procession, came THE KING.',1,0,2851,1,NULL,'2024-03-11 00:36:17','2024-03-11 00:36:17',1,1,NULL,NULL,NULL),(26,'Taylor','Mueller','But at any rate,\'.',NULL,'esther.mohr@gmail.com','$2y$12$BCCwySXbZKy6bpjOrVTM1eYE0boRY14zK0BxjPYMookpoVXAo3zjO',184,'1993-12-26','+14756055350','2024-03-11 07:36:17',NULL,'job-seeker',NULL,'resume/01.pdf','98875 Rath Parkways Apt. 550\nLydiahaven, TX 37967-3627','Alice alone with the Queen, \'and take this child away with me,\' thought Alice, and tried to open them again, and went back to the three gardeners who were all turning into little cakes as they came.',1,0,4709,0,NULL,'2024-03-11 00:36:17','2024-03-11 00:36:17',0,1,NULL,NULL,NULL),(27,'Garret','Pacocha','WOULD twist itself.',NULL,'hallie.herman@ebert.com','$2y$12$2TNrar.7wUSObSbx3QnF1udMEVMrl.Y0EtsYgX1EPadI28f.M6kam',185,'1982-07-22','+13863900064','2024-03-11 07:36:17',NULL,'employer',NULL,NULL,'1501 William Fords\nSusietown, DC 84601-7177','Alice, \'Have you seen the Mock Turtle, who looked at the place where it had gone. \'Well! I\'ve often seen them so often, of course had to kneel down on one knee. \'I\'m a poor man,\' the Hatter.',1,0,3994,0,NULL,'2024-03-11 00:36:17','2024-03-11 00:36:17',1,1,NULL,NULL,NULL),(28,'Annabell','Sipes','The Panther took.',NULL,'douglas.scotty@weber.com','$2y$12$vgLwuE2sUdyjg17vUR5H5.ChZG12p2wiiv.3GLTXVUQbEC36nJY1m',185,'2020-08-14','+13232832621','2024-03-11 07:36:18',NULL,'employer',NULL,NULL,'619 Mazie Camp\nJacquelyntown, ID 83882-9510','Hatter was out of its little eyes, but it puzzled her too much, so she set to partners--\' \'--change lobsters, and retire in same order,\' continued the Pigeon, but in a large pool all round her.',1,0,4648,0,NULL,'2024-03-11 00:36:18','2024-03-11 00:36:18',0,1,NULL,NULL,NULL),(29,'Anastasia','Nienow','PLEASE mind what.',NULL,'jane.funk@emard.com','$2y$12$77Ulv3wyetXi8HJERPgPEONGO7X7j..uhzEYUFQHiINyDs18UYq06',185,'1978-08-26','+18385266543','2024-03-11 07:36:18',NULL,'employer',NULL,NULL,'325 Sipes Heights Apt. 471\nBabyburgh, DE 04491','Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly enough of it in time,\' said the Gryphon. \'Well, I shan\'t grow any more--As it.',1,0,4965,0,NULL,'2024-03-11 00:36:18','2024-03-11 00:36:18',0,1,NULL,NULL,NULL),(30,'Eleanora','Nitzsche','Knave \'Turn them.',NULL,'elvis89@hotmail.com','$2y$12$RhRqEK9NhCvNzrAIv7mJseEtBvnn6GdmqDVNdXg.uIRJRh.qUe8sC',185,'2022-11-26','+16203747688','2024-03-11 07:36:18',NULL,'job-seeker',NULL,'resume/01.pdf','156 Hirthe Plains Apt. 246\nLake Elouiseborough, DC 77415-6628','Alice, \'or perhaps they won\'t walk the way to hear the rattle of the officers: but the cook had disappeared. \'Never mind!\' said the King. \'When did you manage to do so. \'Shall we try another figure.',1,0,2928,1,NULL,'2024-03-11 00:36:18','2024-03-11 00:36:18',1,1,NULL,NULL,NULL),(31,'Herminia','McCullough','Between yourself.',NULL,'schultz.gabe@schroeder.info','$2y$12$4bS2AVtJl0u9xZQtXH4eH.xRREUwjzbjL8rBI6RicMGekVGisVxHu',186,'2006-05-15','+13856163806','2024-03-11 07:36:18',NULL,'employer',NULL,NULL,'6920 Feest Parkway\nEast Euniceport, HI 62564','Dormouse!\' And they pinched it on both sides at once. \'Give your evidence,\' said the Duchess. \'I make you grow taller, and the moon, and memory, and muchness--you know you say \"What a pity!\"?\' the.',1,0,1334,1,NULL,'2024-03-11 00:36:18','2024-03-11 00:36:18',0,1,NULL,NULL,NULL),(32,'Savion','Connelly','So she swallowed.',NULL,'tate.langosh@gmail.com','$2y$12$AM1LanCY86jskP8AA9z1Oe76JCZ.fC0TbRupcqPuz4rubyxXs/hiK',184,'1985-02-26','+15405908086','2024-03-11 07:36:19',NULL,'job-seeker',NULL,'resume/01.pdf','99807 Batz Loaf\nWest Carlieshire, FL 85777-1978','I could let you out, you know.\' He was looking up into the sea, \'and in that case I can do without lobsters, you know. So you see, because some of them can explain it,\' said the Gryphon, and the.',1,0,4810,1,NULL,'2024-03-11 00:36:19','2024-03-11 00:36:19',1,1,NULL,NULL,NULL),(33,'Jakob','Lind','Alice, \'we learned.',NULL,'tatyana58@brakus.info','$2y$12$dxHSOIJkNNwMNWW.ccDP0eroEmZAVA61DkSXyVA3AN5gN2B6oEgKm',185,'1980-12-20','+19527424488','2024-03-11 07:36:19',NULL,'employer',NULL,NULL,'815 Predovic Courts Apt. 232\nStromanmouth, ID 83572','Alice coming. \'There\'s PLENTY of room!\' said Alice to herself. (Alice had no reason to be ashamed of yourself for asking such a very good height indeed!\' said Alice, a good deal frightened at the.',1,0,269,0,NULL,'2024-03-11 00:36:19','2024-03-11 00:36:19',0,1,NULL,NULL,NULL),(34,'Evert','Krajcik','Hatter. \'You might.',NULL,'dare.elissa@jacobs.org','$2y$12$L6SgH8pNcHtN9ID1mt9DUOQ5gBaxazh7o6FJs.5DgXb49WdIsxrIe',185,'2014-08-10','+18043936689','2024-03-11 07:36:19',NULL,'job-seeker',NULL,'resume/01.pdf','74088 Quitzon Radial Apt. 878\nEast Meta, NM 23437','The judge, by the whole head appeared, and then turned to the game, feeling very curious to know when the White Rabbit with pink eyes ran close by her. There was a little glass table. \'Now, I\'ll.',1,0,1408,0,NULL,'2024-03-11 00:36:19','2024-03-11 00:36:19',0,1,NULL,NULL,NULL),(35,'Fernando','Wiegand','YOU,\"\' said Alice.',NULL,'deborah91@lueilwitz.org','$2y$12$W9Bgw6JYNtlcOqQXv3aVKugbCIfncAMeZFFdYfiibjYchMxB/muaW',184,'1988-02-21','+17856307022','2024-03-11 07:36:19',NULL,'job-seeker',NULL,'resume/01.pdf','624 Karelle Via Apt. 903\nMorissetteborough, OR 35213-8870','Game, or any other dish? Who would not open any of them. \'I\'m sure those are not the same, the next verse,\' the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not.',1,0,2725,1,NULL,'2024-03-11 00:36:19','2024-03-11 00:36:19',0,1,NULL,NULL,NULL),(36,'Lupe','Lueilwitz','Dormouse,\' thought.',NULL,'george10@yahoo.com','$2y$12$IlMOc25maZ7HZAfOpvrsuO9C2aHXnzJfw3NBwBEeeycHSinv9QTze',184,'2011-01-02','+15858578267','2024-03-11 07:36:20',NULL,'employer',NULL,NULL,'5183 O\'Keefe Orchard\nPort Hopetown, NE 63027-4666','The adventures first,\' said the Duchess. \'I make you dry enough!\' They all made a memorandum of the day; and this was the only difficulty was, that you weren\'t to talk about her pet: \'Dinah\'s our.',1,0,4936,1,NULL,'2024-03-11 00:36:20','2024-03-11 00:36:20',0,1,NULL,NULL,NULL),(37,'Esta','Roob','March Hare. \'Yes.',NULL,'monahan.lucinda@schmeler.info','$2y$12$mQWb/C0DNLYCQhHlUlngYuVS6W03etaJ83yIHyJM2tWmN.f6zRU5O',184,'1997-04-04','+17867537955','2024-03-11 07:36:20',NULL,'employer',NULL,NULL,'92059 Crooks Tunnel Suite 918\nWest Caleberg, NH 38119','I was a general chorus of voices asked. \'Why, SHE, of course,\' the Dodo could not even get her head made her next remark. \'Then the words \'DRINK ME\' beautifully printed on it (as she had nothing.',1,0,3856,1,NULL,'2024-03-11 00:36:20','2024-03-11 00:36:20',0,1,NULL,NULL,NULL),(38,'Destiny','Gutkowski','Tortoise--\' \'Why.',NULL,'imoen@hane.biz','$2y$12$7XBFc8uorIu80CtnURhZA.4p9/bjvD0vxg1zXEKEdFn53Vra7wggW',185,'2020-12-19','+12346476617','2024-03-11 07:36:20',NULL,'employer',NULL,NULL,'704 Zieme Radial Apt. 926\nFeeneymouth, OK 87685','Five, in a melancholy way, being quite unable to move. She soon got it out to her lips. \'I know SOMETHING interesting is sure to kill it in her life before, and he went on, half to Alice. \'Only a.',1,0,3661,1,NULL,'2024-03-11 00:36:20','2024-03-11 00:36:20',0,1,NULL,NULL,NULL),(39,'Madilyn','Hane','But, now that I\'m.',NULL,'uglover@hotmail.com','$2y$12$QF95/Gyc/Od.3NycBoD3.eohy17Y81cgVbW1Uq4vb2OddQObU1S3C',184,'1997-06-25','+12607269448','2024-03-11 07:36:20',NULL,'job-seeker',NULL,'resume/01.pdf','8629 Zulauf Village\nSouth Ursulastad, CO 27283','WOULD put their heads downward! The Antipathies, I think--\' (she was obliged to write with one eye; \'I seem to see its meaning. \'And just as well say,\' added the Gryphon, and the pair of the.',1,0,3526,1,NULL,'2024-03-11 00:36:20','2024-03-11 00:36:20',1,1,NULL,NULL,NULL),(40,'Frederick','Reynolds','Alice. \'You must.',NULL,'lillie17@daniel.com','$2y$12$8rIY2xSoAJVjLMYFuoWjWuhLNrVFEkyRJebNiqvoIF6AjcNg7PL22',184,'1987-09-27','+12543170180','2024-03-11 07:36:21',NULL,'employer',NULL,NULL,'5113 Hahn Crest Suite 929\nNicholasside, GA 54541-8811','As she said this, she noticed that the cause of this remark, and thought it must be the use of a sea of green leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'I wonder.',1,0,2097,0,NULL,'2024-03-11 00:36:21','2024-03-11 00:36:21',0,1,NULL,NULL,NULL),(41,'Royce','Botsford','Tell her to speak.',NULL,'sraynor@von.com','$2y$12$7r.ThB.LB4ysLsRGHDiXqu.La/BQH6Ge2AQXNOpa2AIV57Png8MbO',184,'2019-05-19','+14432996929','2024-03-11 07:36:21',NULL,'employer',NULL,NULL,'7247 Dangelo Unions Apt. 390\nMayaberg, WY 17428','Mouse, do you like the look of it altogether; but after a few minutes that she was dozing off, and had no idea what a long time with the bread-and-butter getting so thin--and the twinkling of the.',1,0,342,0,NULL,'2024-03-11 00:36:21','2024-03-11 00:36:21',0,1,NULL,NULL,NULL),(42,'Travon','Brown','HAVE tasted eggs.',NULL,'paris47@murphy.com','$2y$12$iQN4wvQ80DJlM9McvlyUYu/G5fT1.ov9MhYfDAe8Y64UG6Z7vs9DS',185,'1998-09-22','+17734295817','2024-03-11 07:36:21',NULL,'employer',NULL,NULL,'64620 Donato Crossing Apt. 916\nBerneicefurt, OR 57030','Alice, every now and then quietly marched off after the birds! Why, she\'ll eat a little nervous about this; \'for it might injure the brain; But, now that I\'m doubtful about the twentieth time that.',1,0,2127,0,NULL,'2024-03-11 00:36:21','2024-03-11 00:36:21',0,1,NULL,NULL,NULL),(43,'Filiberto','Orn','There seemed to be.',NULL,'hoyt.robel@yahoo.com','$2y$12$QLZ3kcUetYgV6qBVM0U88.aXu7gll2SyNPIUZ7dBK4/o8S6vVxhpy',184,'1979-08-12','+19085831921','2024-03-11 07:36:21',NULL,'employer',NULL,NULL,'9336 Allison Locks\nLucilechester, NM 09293','You MUST have meant some mischief, or else you\'d have signed your name like an arrow. The Cat\'s head with great curiosity. \'Soles and eels, of course,\' said the Queen, in a hoarse growl, \'the world.',1,0,1724,1,NULL,'2024-03-11 00:36:21','2024-03-11 00:36:21',0,1,NULL,NULL,NULL),(44,'Milan','Olson','Alice was silent.',NULL,'alvena11@monahan.info','$2y$12$BNfj9TL65xC3NSMLG/L2lOo86BLXRGGm8Swu77K/kJ5TEky4cuYXC',186,'2003-08-13','+15717788765','2024-03-11 07:36:22',NULL,'employer',NULL,NULL,'410 Antwan Estate\nNew Dean, NY 74260','William the Conqueror.\' (For, with all her fancy, that: he hasn\'t got no business there, at any rate, there\'s no use speaking to a mouse, That he met in the window, she suddenly spread out her hand.',1,0,1050,1,NULL,'2024-03-11 00:36:22','2024-03-11 00:36:22',0,1,NULL,NULL,NULL),(45,'Bernadine','Kovacek','And with that she.',NULL,'ewell.jenkins@hotmail.com','$2y$12$RYudlzvfAi0elcDEiOhAquTGPu80zHS.qTPsb344e7mEcoPwve5VG',185,'2017-06-14','+18026684107','2024-03-11 07:36:22',NULL,'employer',NULL,NULL,'36683 Aidan Plains Apt. 727\nNew Martafort, SC 58334','Hatter. He came in sight of the wood--(she considered him to be done, I wonder?\' And here poor Alice began to tremble. Alice looked down at her rather inquisitively, and seemed to be otherwise than.',1,0,3030,1,NULL,'2024-03-11 00:36:22','2024-03-11 00:36:22',1,1,NULL,NULL,NULL),(46,'Robb','Berge','The first question.',NULL,'delilah.macejkovic@hotmail.com','$2y$12$NzFpsMWaKEWQeVH16QhsHuEPnxub.slA3i7S5dDcT0ZBgroByhmv2',186,'1984-01-05','+14353457969','2024-03-11 07:36:22',NULL,'employer',NULL,NULL,'275 Tate Terrace\nNew Rory, DC 55739-6557','I hadn\'t mentioned Dinah!\' she said to herself; \'the March Hare said to the other, looking uneasily at the bottom of a globe of goldfish she had got to grow up again! Let me see--how IS it to be an.',1,0,909,0,NULL,'2024-03-11 00:36:22','2024-03-11 00:36:22',1,1,NULL,NULL,NULL),(47,'Thora','Gaylord','Alice called after.',NULL,'qwalsh@greenfelder.com','$2y$12$30XNk0L69Kn.AUCjKIgEI.NSVABuNcb3FV0nneFgXSFT5ev.TTW/W',184,'1972-06-13','+16695556534','2024-03-11 07:36:22',NULL,'job-seeker',NULL,'resume/01.pdf','16351 Rogahn Terrace\nWest Tabithaland, LA 75872','King, the Queen, who was peeping anxiously into its face was quite out of it, and then said, \'It WAS a narrow escape!\' said Alice, who felt ready to sink into the sky all the rest, Between yourself.',1,0,4496,1,NULL,'2024-03-11 00:36:22','2024-03-11 00:36:22',0,1,NULL,NULL,NULL),(48,'Justice','Nolan','I\'ll manage better.',NULL,'bstiedemann@hotmail.com','$2y$12$vFRfdKJqKcmuyEUDoptJOOQIsYaQoI36IcCUHS0KGDf8CyNQzfd2q',185,'1999-03-17','+13856704943','2024-03-11 07:36:23',NULL,'employer',NULL,NULL,'981 Emard Unions Suite 986\nElseview, CA 80317-4007','So she called softly after it, and very neatly and simply arranged; the only one way of keeping up the little door, had vanished completely. Very soon the Rabbit say to this: so she set to work, and.',1,0,1019,1,NULL,'2024-03-11 00:36:23','2024-03-11 00:36:23',1,1,NULL,NULL,NULL),(49,'Delta','Howe','Cat\'s head began.',NULL,'letitia38@crona.com','$2y$12$snxLx5jPSqzF.R2eauz9QOPjlUDE1a5VYXemGgN8hx0aquwSh6hum',186,'2009-07-23','+16897788892','2024-03-11 07:36:23',NULL,'job-seeker',NULL,'resume/01.pdf','677 Skiles Fall\nWest Myrtleville, PA 09719','The Cat\'s head began fading away the time. Alice had got so much contradicted in her life; it was the matter on, What would become of me? They\'re dreadfully fond of pretending to be sure, this.',1,0,2860,0,NULL,'2024-03-11 00:36:23','2024-03-11 00:36:23',0,1,NULL,NULL,NULL),(50,'Brendan','Cummerata','Alice. \'Stand up.',NULL,'rohan.ara@yahoo.com','$2y$12$Gbg3Wqy17lTdxEGYQuvKBuV6CuYmlJTezKvNPW8rZp.NxHBpNIb0C',186,'1995-12-19','+18319131089','2024-03-11 07:36:23',NULL,'employer',NULL,NULL,'143 Margarita Knoll Apt. 873\nNew Hertha, MO 13190-6357','But at any rate it would be worth the trouble of getting up and say \"Who am I to get dry again: they had a consultation about this, and Alice looked up, but it is.\' \'I quite agree with you,\' said.',1,0,4730,0,NULL,'2024-03-11 00:36:23','2024-03-11 00:36:23',1,1,NULL,NULL,NULL),(51,'Harvey','Crooks','Gryphon. \'We can.',NULL,'ngoyette@gmail.com','$2y$12$vp8296tCMU9Q6.ayhDzEJOyeKHRiZpiItC4PxizcIeb1HipgvBi4e',186,'2003-02-17','+15869956764','2024-03-11 07:36:23',NULL,'employer',NULL,NULL,'21092 Homenick Freeway\nSouth Brittany, SD 59355-4631','I could shut up like telescopes: this time the Mouse was bristling all over, and both the hedgehogs were out of the wood--(she considered him to you, Though they were all writing very busily on.',1,0,712,1,NULL,'2024-03-11 00:36:23','2024-03-11 00:36:23',1,1,NULL,NULL,NULL),(52,'Elaina','Ebert','She said it to be.',NULL,'frami.nicolette@lemke.org','$2y$12$U5y5NGXSlu/KM3Dqrjc0OuP0e4QXbTLGyfMAxXf/nCmFCi5rUbZhG',186,'2014-03-20','+16026478519','2024-03-11 07:36:24',NULL,'employer',NULL,NULL,'6467 Victoria Plaza Suite 478\nHeidenreichfurt, LA 61274','Dormouse was sitting on a little of her skirt, upsetting all the unjust things--\' when his eye chanced to fall a long hookah, and taking not the right way of keeping up the fan and gloves--that is.',1,0,690,1,NULL,'2024-03-11 00:36:24','2024-03-11 00:36:24',0,1,NULL,NULL,NULL),(53,'Candace','Macejkovic','I think you\'d take.',NULL,'ransom92@gmail.com','$2y$12$MOJPVuwfwvb6tC1lzhYO6.weyhmWLlox9KqUi2PYL3JGOiFsqX04y',185,'1979-03-22','+15625403749','2024-03-11 07:36:24',NULL,'employer',NULL,NULL,'317 Pollich Mill Apt. 940\nHazlechester, MO 50609-7850','And it\'ll fetch things when you come to an end! \'I wonder if I chose,\' the Duchess was VERY ugly; and secondly, because she was coming back to her: first, because the chimneys were shaped like the.',1,0,866,1,NULL,'2024-03-11 00:36:24','2024-03-11 00:36:24',1,1,NULL,NULL,NULL),(54,'Loren','West','White Rabbit cried.',NULL,'wilhelmine20@hotmail.com','$2y$12$rjQoilsnDGFz37mhG/q1J.LSWo2nykkNn4EKsoOpastkVyQIV0Z/O',184,'2001-12-10','+16063441550','2024-03-11 07:36:24',NULL,'employer',NULL,NULL,'21225 Jordi Fields Suite 929\nWest Eriberto, MO 03425-4533','She was walking by the hedge!\' then silence, and then Alice dodged behind a great deal too flustered to tell you--all I know is, it would be very likely true.) Down, down, down. There was not going.',1,0,3501,1,NULL,'2024-03-11 00:36:24','2024-03-11 00:36:24',0,1,NULL,NULL,NULL),(55,'Alberta','Boehm','King, going up to.',NULL,'cary.barrows@yahoo.com','$2y$12$zY2A9rPqCV6dWxlV6OE1hej26C3gdQ.0H/w13Qk1CnFJv5tQe0Yyq',186,'1997-01-09','+14432070015','2024-03-11 07:36:24',NULL,'employer',NULL,NULL,'2761 Huel Isle\nNorbertofurt, LA 12580-8865','Dodo solemnly presented the thimble, looking as solemn as she came upon a heap of sticks and dry leaves, and the beak-- Pray how did you ever saw. How she longed to change the subject. \'Go on with.',1,0,3523,0,NULL,'2024-03-11 00:36:24','2024-03-11 00:36:24',0,1,NULL,NULL,NULL),(56,'Tyler','Von','Queen in front of.',NULL,'ortiz.murphy@grimes.com','$2y$12$aCQ6rQdLHJBa/kyYJnOGkemxuUpGT458YVjkB4jdKOi0EEAkgvIwi',184,'2008-09-09','+13206789947','2024-03-11 07:36:25',NULL,'job-seeker',NULL,'resume/01.pdf','8673 Ariel Corner\nRicemouth, VT 59634-5796','Rabbit\'s little white kid gloves, and was surprised to find herself talking familiarly with them, as if he wasn\'t going to turn round on its axis--\' \'Talking of axes,\' said the White Rabbit.',1,0,3030,1,NULL,'2024-03-11 00:36:25','2024-03-11 00:36:25',0,1,NULL,NULL,NULL),(57,'Zita','Hessel','And will talk in.',NULL,'kuphal.franco@glover.info','$2y$12$FpNqdhUk/mJqwtZpkiDskOo/yaty6g5uDvuzAPlTMfUv9Zruzn8ZO',185,'2014-11-24','+16319406640','2024-03-11 07:36:25',NULL,'employer',NULL,NULL,'42306 Cronin Shore Apt. 921\nNorth Trentberg, TX 89811-8385','Then she went slowly after it: \'I never said I could shut up like a star-fish,\' thought Alice. \'I\'ve so often read in the other. \'I beg pardon, your Majesty,\' he began. \'You\'re a very interesting.',1,0,901,0,NULL,'2024-03-11 00:36:25','2024-03-11 00:36:25',1,1,NULL,NULL,NULL),(58,'Ramiro','Bahringer','King; \'and don\'t.',NULL,'hkuhn@yahoo.com','$2y$12$ROBeW/hpk6DwteVxIeM4y.5bZbBOvbQyROXJW71akY7OSa8VhZh36',185,'1979-01-06','+18158949040','2024-03-11 07:36:25',NULL,'employer',NULL,NULL,'679 Valentin Spring\nKozeyport, OK 08127','Gryphon said to the puppy; whereupon the puppy began a series of short charges at the March Hare said to the door, and tried to beat time when she had never done such a curious croquet-ground in her.',1,0,3211,1,NULL,'2024-03-11 00:36:25','2024-03-11 00:36:25',0,1,NULL,NULL,NULL),(59,'Charlene','Legros','BEST butter, you.',NULL,'vernon30@mann.com','$2y$12$mtCoOplUbuBRiz3BDy2rWu28Zqg9NINjsHNEsctbmzE2R2yvv4pWC',185,'2004-03-23','+12622886170','2024-03-11 07:36:25',NULL,'employer',NULL,NULL,'19568 Izabella Plaza Suite 436\nBrittanyborough, NJ 63374-9911','Dormouse again, so that altogether, for the next moment she appeared; but she did it so VERY nearly at the door of which was full of tears, \'I do wish they COULD! I\'m sure I don\'t want to go on.',1,0,824,1,NULL,'2024-03-11 00:36:25','2024-03-11 00:36:25',1,1,NULL,NULL,NULL),(60,'Roxane','Bashirian','Alice very meekly.',NULL,'patience21@adams.org','$2y$12$RrFojwMhLpAB/Y2EkRsloezrC3X0lwQwLJ/KfI8J2dwHLP7OV9Pre',185,'1998-05-03','+14848895900','2024-03-11 07:36:26',NULL,'employer',NULL,NULL,'696 Feil Spur\nHuldachester, MA 39208','The Rabbit Sends in a great thistle, to keep back the wandering hair that curled all over crumbs.\' \'You\'re wrong about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle at last, more.',1,0,4386,1,NULL,'2024-03-11 00:36:26','2024-03-11 00:36:26',0,1,NULL,NULL,NULL),(61,'Albertha','Konopelski','I should like to.',NULL,'shodkiewicz@yahoo.com','$2y$12$R0hvoxRk4jrl.av3qh4AGORoq8EhaqzgDB7UZGAAW9HqFfRVAmgPK',185,'1972-07-01','+15514812299','2024-03-11 07:36:26',NULL,'employer',NULL,NULL,'345 Welch Isle Suite 652\nHermannport, ND 16033','Mock Turtle; \'but it doesn\'t matter which way it was just in time to avoid shrinking away altogether. \'That WAS a curious feeling!\' said Alice; \'I can\'t explain MYSELF, I\'m afraid, sir\' said Alice.',1,0,4088,1,NULL,'2024-03-11 00:36:26','2024-03-11 00:36:26',1,1,NULL,NULL,NULL),(62,'Nathaniel','Braun','THAT\'S a good deal.',NULL,'anjali95@goyette.com','$2y$12$Mx/UGS0Rus6/4/nyqyp0mub8g5.wKr4YNxTzcADwBx5s3NSbiS6BC',185,'1989-07-14','+16782816501','2024-03-11 07:36:26',NULL,'job-seeker',NULL,'resume/01.pdf','43568 Lockman Course Suite 220\nNolanshire, VT 64678','And beat him when he sneezes; For he can thoroughly enjoy The pepper when he finds out who I WAS when I got up and picking the daisies, when suddenly a White Rabbit cried out, \'Silence in the pool a.',1,0,4248,0,NULL,'2024-03-11 00:36:26','2024-03-11 00:36:26',0,1,NULL,NULL,NULL),(63,'Tyra','Rempel','I\'ll just see what.',NULL,'brenda31@okuneva.com','$2y$12$KFc3JcEt06IbCcL93wRU5uKkVckjEv1PAYlX57/f2xT7pLDNC/JsK',185,'1979-10-14','+15639280280','2024-03-11 07:36:26',NULL,'employer',NULL,NULL,'97087 Muller Cove Apt. 145\nCecilfurt, AK 77829','Duchess: \'what a clear way you have to whisper a hint to Time, and round Alice, every now and then Alice put down the chimney close above her: then, saying to herself, \'the way all the same, the.',1,0,3561,0,NULL,'2024-03-11 00:36:26','2024-03-11 00:36:26',0,1,NULL,NULL,NULL),(64,'Marianna','Ritchie','As she said to the.',NULL,'celia15@yahoo.com','$2y$12$.MLc9ubEnGL/nmKeeRPvqeSA7xv1Gbb8f/NC2prvx9vj4V4tL0Xru',185,'2010-08-12','+17854554731','2024-03-11 07:36:27',NULL,'employer',NULL,NULL,'17450 Collier Bridge\nNew Derekborough, KY 31988-8934','Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was moderate. But the snail replied \"Too far, too far!\" and gave a sudden burst of tears, but said nothing. \'This.',1,0,2353,1,NULL,'2024-03-11 00:36:27','2024-03-11 00:36:27',1,1,NULL,NULL,NULL),(65,'Lurline','Kris','Knave. The Knave.',NULL,'nfay@feest.com','$2y$12$nRpN.uSyLLvuMUzdnwpgKeAANIfTdAnzf6qnte2DOP6vGqCRnVUKy',185,'2021-05-10','+16624451998','2024-03-11 07:36:27',NULL,'employer',NULL,NULL,'310 Thurman View Suite 203\nEast Alessandrabury, NE 05470-3219','White Rabbit hurried by--the frightened Mouse splashed his way through the air! Do you think, at your age, it is all the time they were getting extremely small for a rabbit! I suppose I ought to.',1,0,4182,1,NULL,'2024-03-11 00:36:27','2024-03-11 00:36:27',0,1,NULL,NULL,NULL),(66,'Luis','Runolfsdottir','Pigeon. \'I can see.',NULL,'zwaters@blanda.biz','$2y$12$8wb.Sn.3RGpVrLmox09tF.umMBUNjeIwukSs0ebT2USs9CJRXGO1C',186,'1998-09-18','+18783903081','2024-03-11 07:36:27',NULL,'job-seeker',NULL,'resume/01.pdf','711 Theresia Point Apt. 027\nNienowberg, MS 31250','And the Gryphon went on, \'\"--found it advisable to go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was in March.\' As she said to herself \'This is Bill,\'.',1,0,3549,1,NULL,'2024-03-11 00:36:27','2024-03-11 00:36:27',1,1,NULL,NULL,NULL),(67,'Earline','Jacobi','Kings and Queens.',NULL,'mia.welch@gorczany.com','$2y$12$1RFtwAGDbIRIXsDL0Snv4OpfC7GonBWbdxU07M7dii0aUQN3rzuou',186,'2012-05-07','+16127102353','2024-03-11 07:36:27',NULL,'job-seeker',NULL,'resume/01.pdf','57260 Elyse Terrace Suite 290\nLake Violetteland, WI 31005-2038','Gryphon, \'she wants for to know when the Rabbit say, \'A barrowful will do, to begin lessons: you\'d only have to beat time when she heard something like it,\' said Alice to herself, \'the way all the.',1,0,3010,1,NULL,'2024-03-11 00:36:27','2024-03-11 00:36:27',1,1,NULL,NULL,NULL),(68,'Franco','Kessler','Alice began, in a.',NULL,'hegmann.maymie@gaylord.com','$2y$12$X1zC1Bc./f3/r858rf.i6eXEHeAesNCtlRM19C2Bnn.yxVzsSunmm',185,'2022-10-02','+18146891720','2024-03-11 07:36:28',NULL,'job-seeker',NULL,'resume/01.pdf','83149 Lilla Overpass Apt. 106\nKatherineshire, ND 20005','Mabel, for I know all the rest of it at all. \'But perhaps he can\'t help it,\' she said to the conclusion that it led into the sky all the rest of the e--e--evening, Beautiful, beautiful Soup!.',1,0,2483,0,NULL,'2024-03-11 00:36:28','2024-03-11 00:36:28',0,1,NULL,NULL,NULL),(69,'Chris','Crona','So she tucked it.',NULL,'devon69@sauer.net','$2y$12$r9/fOLBw8ZVC91WKA/us1u87l0dWc9.t/LSPZpBiM1OsyKKRxKbj.',186,'2007-10-18','+16815742621','2024-03-11 07:36:28',NULL,'job-seeker',NULL,'resume/01.pdf','39258 Stoltenberg Locks Apt. 487\nEast Hildegard, WV 61102','I can\'t be Mabel, for I know all sorts of things, and she, oh! she knows such a very respectful tone, but frowning and making quite a large one, but it is.\' \'I quite agree with you,\' said the.',1,0,4109,1,NULL,'2024-03-11 00:36:28','2024-03-11 00:36:28',1,1,NULL,NULL,NULL),(70,'Alexander','Doyle','I hadn\'t cried so.',NULL,'waters.kailey@lind.com','$2y$12$ZkE7AGXPKXCvDdLe.Q35KuqWYSZ6yLYx9MumKuB.daeEdwlCgsiDe',184,'2000-03-22','+16033090318','2024-03-11 07:36:28',NULL,'job-seeker',NULL,'resume/01.pdf','9667 Morar Lodge\nNorth Alanis, WV 43721-2191','VERY much out of its voice. \'Back to land again, and Alice looked all round her, calling out in a minute. Alice began in a trembling voice, \'Let us get to twenty at that rate! However, the.',1,0,1502,0,NULL,'2024-03-11 00:36:28','2024-03-11 00:36:28',1,1,NULL,NULL,NULL),(71,'Terrill','Dibbert','The only things in.',NULL,'gottlieb.greyson@klocko.com','$2y$12$IKJI3lLbKfuJlXGxfvkseuAr5OKbjq4U2eP4qpNbme9VmtQS1Eb5u',184,'1972-02-04','+16054056840','2024-03-11 07:36:28',NULL,'job-seeker',NULL,'resume/01.pdf','2473 Hermiston Forges\nPort Namestad, MS 36871-6712','They all sat down and cried. \'Come, there\'s half my plan done now! How puzzling all these changes are! I\'m never sure what I\'m going to give the prizes?\' quite a large cauldron which seemed to.',1,0,1432,0,NULL,'2024-03-11 00:36:28','2024-03-11 00:36:28',1,1,NULL,NULL,NULL),(72,'Delia','Huels','I hadn\'t cried so.',NULL,'donna.simonis@romaguera.com','$2y$12$UFYy68Qazhl417xc6hGF6ejX6fIyMySCKaejgVWk1mXZyLaT7dEUe',184,'2014-09-25','+13255060349','2024-03-11 07:36:29',NULL,'employer',NULL,NULL,'4270 Haley Mill\nKirlinton, HI 68495','Luckily for Alice, the little passage: and THEN--she found herself in a melancholy air, and, after waiting till she was now only ten inches high, and she dropped it hastily, just in time to wash the.',1,0,3125,1,NULL,'2024-03-11 00:36:29','2024-03-11 00:36:29',1,1,NULL,NULL,NULL),(73,'Betty','VonRueden','Dinah stop in the.',NULL,'kkulas@corwin.biz','$2y$12$yvmaW739nbj8FSd0b0U9gugLYflG.KMMnKUtQar8RO090Glo4t0yG',184,'1970-06-26','+17012491257','2024-03-11 07:36:29',NULL,'job-seeker',NULL,'resume/01.pdf','48283 Brooke Vista\nNew Erickaville, FL 10178','How puzzling all these strange Adventures of hers would, in the house till she got to come out among the people that walk with their fur clinging close to her feet, for it to make out what it meant.',1,0,2767,1,NULL,'2024-03-11 00:36:29','2024-03-11 00:36:29',0,1,NULL,NULL,NULL),(74,'Kaden','McKenzie','I? Ah, THAT\'S the.',NULL,'maximilian03@runolfsson.com','$2y$12$1IsDERSQxog8Qtfz1SjM0OGKTLlDLpfMFmF2uZD7s4xvJ4Zysvgne',185,'1975-06-28','+16679161425','2024-03-11 07:36:29',NULL,'job-seeker',NULL,'resume/01.pdf','998 Cortney Alley Apt. 288\nNedside, NJ 50108','You see, she came up to Alice, they all crowded round it, panting, and asking, \'But who has won?\' This question the Dodo replied very politely, feeling quite pleased to find that the mouse doesn\'t.',1,0,2805,1,NULL,'2024-03-11 00:36:29','2024-03-11 00:36:29',1,1,NULL,NULL,NULL),(75,'Johanna','Ferry','Alice again, in a.',NULL,'crona.karelle@yahoo.com','$2y$12$zG/zSEOQlSsK4t5a7cTzOOBsPglQqDknr43qiKHId1JVCUGSlsxtO',184,'1977-02-08','+12035848416','2024-03-11 07:36:29',NULL,'employer',NULL,NULL,'47809 Murray Motorway Apt. 125\nLake Evan, NC 90859','I almost think I could, if I shall have somebody to talk to.\' \'How are you getting on?\' said Alice, \'but I haven\'t been invited yet.\' \'You\'ll see me there,\' said the King; and the pool as it didn\'t.',1,0,2690,0,NULL,'2024-03-11 00:36:29','2024-03-11 00:36:29',0,1,NULL,NULL,NULL),(76,'Mckayla','Miller','Queen. \'It proves.',NULL,'yfriesen@gmail.com','$2y$12$uznMF21IIcz5dA3E7MyQgOM1mMZHjQxFRlm868QyXJqL7HqLdkPtO',186,'1979-11-14','+18607528087','2024-03-11 07:36:30',NULL,'employer',NULL,NULL,'76937 Grant Freeway\nSchmidtview, KY 15612-8971','I THINK; or is it I can\'t see you?\' She was a body to cut it off from: that he had a VERY turn-up nose, much more like a serpent. She had just begun to dream that she had nothing else to do, and.',1,0,4479,0,NULL,'2024-03-11 00:36:30','2024-03-11 00:36:30',0,1,NULL,NULL,NULL),(77,'Reyna','Yost','INSIDE, you might.',NULL,'kreiger.carlos@gmail.com','$2y$12$cUbYFr2Tq6zck4JCvBbFV.AMQ.25oBBEC8NR0xNXbgwFB3q4.hnWq',185,'1993-10-15','+13097220459','2024-03-11 07:36:30',NULL,'employer',NULL,NULL,'9044 Alison Circle Apt. 883\nTyrelland, KS 99587','Alice looked down at her as she went on in the face. \'I\'ll put a stop to this,\' she said these words her foot as far down the little door, had vanished completely. Very soon the Rabbit just under.',1,0,3511,1,NULL,'2024-03-11 00:36:30','2024-03-11 00:36:30',1,1,NULL,NULL,NULL),(78,'Layne','Dickens','Alice thought she.',NULL,'dora.kihn@yahoo.com','$2y$12$qnfWqyF9Hvfo27j702B20eD3O7b0.BIr0NMOgKq/Kmme7sNmSUbyC',184,'2004-05-24','+17406561325','2024-03-11 07:36:30',NULL,'employer',NULL,NULL,'265 Christopher Fields Apt. 055\nPort Demarcusview, MA 66654-9320','These words were followed by a very pretty dance,\' said Alice very politely; but she could remember them, all these changes are! I\'m never sure what I\'m going to dive in among the bright eager eyes.',1,0,793,1,NULL,'2024-03-11 00:36:30','2024-03-11 00:36:30',1,1,NULL,NULL,NULL),(79,'Lamont','Towne','King, \'unless it.',NULL,'senger.michale@braun.biz','$2y$12$HJ7YPvxQ6FMs4Mk4j2KiAejjBArbmXGZhEUdSu2G/R6egPmfQfYwi',186,'2016-11-14','+19257682287','2024-03-11 07:36:30',NULL,'job-seeker',NULL,'resume/01.pdf','91866 Camylle Point\nEast Kamron, OH 04178-0217','Alice thought she had gone through that day. \'No, no!\' said the Caterpillar angrily, rearing itself upright as it didn\'t sound at all this time, as it turned a back-somersault in at once.\' However.',1,0,3588,0,NULL,'2024-03-11 00:36:30','2024-03-11 00:36:30',0,1,NULL,NULL,NULL),(80,'Emery','Hegmann','Who ever saw in my.',NULL,'imckenzie@hotmail.com','$2y$12$V/SbNWrI.Xh3U0AotqbML.YAtzzwtKGA8O6LT7zH9GQvFr0sTMWhe',185,'1991-01-16','+13417478273','2024-03-11 07:36:31',NULL,'job-seeker',NULL,'resume/01.pdf','603 Marielle Hill Apt. 344\nRichiechester, IA 18847','Father William,\' the young man said, \'And your hair has become very white; And yet I wish you could see it written up somewhere.\' Down, down, down. There was a little shriek and a scroll of.',1,0,1241,1,NULL,'2024-03-11 00:36:31','2024-03-11 00:36:31',1,1,NULL,NULL,NULL),(81,'Loma','Monahan','Who ever saw one.',NULL,'tatyana84@yahoo.com','$2y$12$ayCUGudo9880vyStH9QpCOxDh3E56KUEgmfzTNpHQ/ntSI8RCfKjy',186,'1977-04-05','+18627893647','2024-03-11 07:36:31',NULL,'job-seeker',NULL,'resume/01.pdf','846 Kuvalis Plaza\nBodefurt, OR 59222','Gryphon, and the choking of the Mock Turtle drew a long and a long way. So she began looking at the top of his tail. \'As if it makes me grow larger, I can say.\' This was quite surprised to find any.',1,0,1692,0,NULL,'2024-03-11 00:36:31','2024-03-11 00:36:31',0,1,NULL,NULL,NULL),(82,'Orion','Murazik','Which shall sing?\'.',NULL,'weldon07@crooks.com','$2y$12$FIxlnrigYR317fpz.8mp8u4I9gO/WtFa4853RAp88HkHIuq7.vIga',186,'2013-01-28','+14242300585','2024-03-11 07:36:31',NULL,'job-seeker',NULL,'resume/01.pdf','64706 Lowe Hills Suite 901\nPatmouth, AL 68839','English!\' said the Dormouse, who was sitting on a little timidly, for she felt that this could not help bursting out laughing: and when she first saw the Mock Turtle replied in an encouraging tone.',1,0,2784,1,NULL,'2024-03-11 00:36:31','2024-03-11 00:36:31',1,1,NULL,NULL,NULL),(83,'Grayce','Runolfsdottir','I shall fall right.',NULL,'birdie.hamill@hoeger.com','$2y$12$PJPNen3t4lJS1ltphwiBZOtfvdQjTRbcua4EYpg4EbuNRJQ.NBp5y',186,'1999-02-16','+13477827363','2024-03-11 07:36:31',NULL,'employer',NULL,NULL,'881 Shea Union\nVanceland, OR 55875-8482','Alice\'s shoulder, and it was very nearly getting up and picking the daisies, when suddenly a footman in livery came running out of sight: then it watched the Queen had never heard before, \'Sure then.',1,0,2657,1,NULL,'2024-03-11 00:36:31','2024-03-11 00:36:31',1,1,NULL,NULL,NULL),(84,'Mose','Torphy','The Hatter shook.',NULL,'weber.caroline@gmail.com','$2y$12$HykXZfim3d6CCZln0Uhb3uLk4FcF31.NbG9Ywa5UXDE0ASV/qL7KK',186,'2012-10-13','+16673261116','2024-03-11 07:36:32',NULL,'employer',NULL,NULL,'882 Keagan Dam Suite 959\nHellerton, NC 47844-3282','The Hatter opened his eyes. \'I wasn\'t asleep,\' he said to Alice, that she was to find herself still in existence; \'and now for the baby, and not to her, And mentioned me to him: She gave me a good.',1,0,4794,0,NULL,'2024-03-11 00:36:32','2024-03-11 00:36:32',1,1,NULL,NULL,NULL),(85,'Bryana','Grady','I shall have some.',NULL,'wuckert.ena@yahoo.com','$2y$12$GhbhO2O0VW8bMwjxztUDmed7tZ1SSDYS5xgLlvyuh/tlimvXzRdDW',186,'1974-07-08','+17255702522','2024-03-11 07:36:32',NULL,'employer',NULL,NULL,'945 Laurie Passage Suite 819\nBrennaton, SC 16424-3788','Rabbit\'s voice along--\'Catch him, you by the whole thing, and longed to change the subject. \'Go on with the distant green leaves. As there seemed to follow, except a tiny golden key, and Alice\'s.',1,0,1400,0,NULL,'2024-03-11 00:36:32','2024-03-11 00:36:32',0,1,NULL,NULL,NULL),(86,'Shana','Hahn','Alice noticed with.',NULL,'kassulke.demond@kunze.com','$2y$12$DgpdqndITWUD5bCKrqKpTuGDEhnA7iKQJxoI18Dczm.wBooxcI0Oe',186,'2011-11-07','+14255513865','2024-03-11 07:36:32',NULL,'employer',NULL,NULL,'427 Jaren Plaza Apt. 912\nEast Alexburgh, MN 22132-4956','However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the same thing a bit!\' said the Caterpillar. Alice thought the whole party swam to the law, And argued each case.',1,0,4316,0,NULL,'2024-03-11 00:36:32','2024-03-11 00:36:32',0,1,NULL,NULL,NULL),(87,'Estrella','Connelly','Mock Turtle. \'And.',NULL,'xsipes@hotmail.com','$2y$12$cTGJ0VGV3MoMX/WAdjSed.a7SYuiu98aHuhl8J8V7PIGYBW0pV62C',184,'1985-05-10','+13619306465','2024-03-11 07:36:32',NULL,'job-seeker',NULL,'resume/01.pdf','215 Ila Corner\nNorth Shanieport, RI 84799','Alice said; \'there\'s a large caterpillar, that was lying on their faces, so that by the soldiers, who of course had to kneel down on their hands and feet at the flowers and the little golden key.',1,0,720,0,NULL,'2024-03-11 00:36:32','2024-03-11 00:36:32',1,1,NULL,NULL,NULL),(88,'Ivy','Shanahan','Alice could bear.',NULL,'friedrich96@gmail.com','$2y$12$aa.2Er94r0NaYXBoBjpMXe.LG4.F2dR4/viR7Hy7KgANXIaUCm2oS',186,'1987-09-13','+19102643470','2024-03-11 07:36:33',NULL,'job-seeker',NULL,'resume/01.pdf','9091 Buford Club\nEast Darrion, CO 94580-7088','Her first idea was that it was a general clapping of hands at this: it was her turn or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. \'Well, I should like it put the hookah out of.',1,0,2012,0,NULL,'2024-03-11 00:36:33','2024-03-11 00:36:33',1,1,NULL,NULL,NULL),(89,'Catharine','Bartell','Alice. It looked.',NULL,'geraldine72@yahoo.com','$2y$12$2eBXjNWRW489zfdUZjlTcu9W8lbPJEuuduLeXd2Wo043lXc7xs4Te',186,'1980-02-03','+17695039606','2024-03-11 07:36:33',NULL,'job-seeker',NULL,'resume/01.pdf','256 Jerel Dam Apt. 020\nJosiahshire, CA 25684','On which Seven looked up and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence. \'It\'s a Cheshire cat,\' said the.',1,0,2817,0,NULL,'2024-03-11 00:36:33','2024-03-11 00:36:33',1,1,NULL,NULL,NULL),(90,'Madie','Kihn','I could show you.',NULL,'morris72@crooks.org','$2y$12$L/.BAeDyd60dhnqDEEgViegxYCxtQGuC7EY4Yn8HNWXp6WcvVRT.u',186,'1991-09-21','+13074513023','2024-03-11 07:36:33',NULL,'job-seeker',NULL,'resume/01.pdf','69591 Carlo Hills\nLake Earlene, CO 47591','And in she went. Once more she found that her idea of having nothing to do.\" Said the mouse to the other, looking uneasily at the top of her head pressing against the roof was thatched with fur. It.',1,0,1078,0,NULL,'2024-03-11 00:36:33','2024-03-11 00:36:33',1,1,NULL,NULL,NULL),(91,'Floy','Mayer','Mock Turtle to the.',NULL,'jasen.maggio@kirlin.com','$2y$12$xuTRwzmB6W0BbIE4Zm2XLux.y0XRcfer.lPLhjST9Z2vz/Hh44.f2',185,'1978-05-20','+12814996223','2024-03-11 07:36:33',NULL,'employer',NULL,NULL,'8174 Carmine Squares Apt. 111\nLebsackbury, MS 88045','ME\' beautifully printed on it except a little different. But if I\'m not the smallest notice of her voice, and the Hatter added as an unusually large saucepan flew close by her. There was a body to.',1,0,233,0,NULL,'2024-03-11 00:36:33','2024-03-11 00:36:33',1,1,NULL,NULL,NULL),(92,'Sydney','Will','Soup! Soup of the.',NULL,'iwunsch@ullrich.com','$2y$12$wB9Uado2DZRks4c63KER9.lUO5NwoeaGmghm79XJX7YGl79dlwHJW',184,'1979-07-23','+16052348508','2024-03-11 07:36:34',NULL,'job-seeker',NULL,'resume/01.pdf','49907 Gideon Green\nEast Nellatown, FL 82945','Rabbit came up to the general conclusion, that wherever you go to law: I will prosecute YOU.--Come, I\'ll take no denial; We must have imitated somebody else\'s hand,\' said the Mouse. \'--I proceed.',1,0,117,1,NULL,'2024-03-11 00:36:34','2024-03-11 00:36:34',1,1,NULL,NULL,NULL),(93,'Vanessa','Swift','White Rabbit. She.',NULL,'sanford27@yahoo.com','$2y$12$Unf17FZpiBmkPEs63hVcleSMcjKd9RAFX6VUvYWouxrBZVfxrbX5G',186,'2011-07-04','+16034960878','2024-03-11 07:36:34',NULL,'employer',NULL,NULL,'24873 Mertz Well\nWest Cyrushaven, MS 46223-3662','I wonder what I used to queer things happening. While she was appealed to by all three dates on their slates, and then turned to the fifth bend, I think?\' \'I had NOT!\' cried the Mouse, sharply and.',1,0,4778,0,NULL,'2024-03-11 00:36:34','2024-03-11 00:36:34',0,1,NULL,NULL,NULL),(94,'Dylan','Altenwerth','Alice replied in.',NULL,'lacey44@gmail.com','$2y$12$5XqsNXlOrPQirL4YJJkzkenBHaLk1jfHuffJOu9r1QPGNpmfVsycG',184,'1975-02-13','+14433327887','2024-03-11 07:36:34',NULL,'employer',NULL,NULL,'51157 Camylle Island Suite 555\nAnaisfurt, SD 88685-1232','In a little before she got used to come down the hall. After a time there were ten of them, with her head!\' Those whom she sentenced were taken into custody by the little thing howled so, that he.',1,0,2316,0,NULL,'2024-03-11 00:36:34','2024-03-11 00:36:34',0,1,NULL,NULL,NULL),(95,'Sonya','Murphy','IT,\' the Mouse in.',NULL,'price.alfredo@mccullough.com','$2y$12$HPpAZpHsUbTBAcYBb4zMA.NqMFBVbsB8GPRnrVB7uGLZG0qOSjcHK',184,'2013-06-25','+19294401960','2024-03-11 07:36:34',NULL,'employer',NULL,NULL,'1067 Adelle Forge Suite 094\nLake Christy, UT 60144-6877','Turtle replied; \'and then the Mock Turtle, \'Drive on, old fellow! Don\'t be all day about it!\' and he checked himself suddenly: the others looked round also, and all the time she saw them, they were.',1,0,1126,1,NULL,'2024-03-11 00:36:34','2024-03-11 00:36:34',1,1,NULL,NULL,NULL),(96,'Hulda','Borer','Mock Turtle to the.',NULL,'wwitting@hotmail.com','$2y$12$Uo3UUurjcyHgULbhKRymbOYHk5G3Bb/JLHzWTyKNCLhq9GltdUg.O',185,'1990-04-19','+16502407216','2024-03-11 07:36:35',NULL,'employer',NULL,NULL,'42205 Kaylin Lake\nGrantside, CA 04342','Cat again, sitting on the floor, and a sad tale!\' said the Footman, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on in the wind, and the Hatter hurriedly left the.',1,0,3599,1,NULL,'2024-03-11 00:36:35','2024-03-11 00:36:35',1,1,NULL,NULL,NULL),(97,'Jordi','Schimmel','Then came a little.',NULL,'bernier.vergie@gmail.com','$2y$12$sY0h25v37XxT.TX1NZ.AsOIKyDQD8o3vK3DQb8SkGagQLM13cT.ie',184,'2014-06-14','+16057579024','2024-03-11 07:36:35',NULL,'job-seeker',NULL,'resume/01.pdf','50265 Jasper Plain\nSouth Nat, NH 01201','I don\'t care which happens!\' She ate a little different. But if I\'m not used to queer things happening. While she was nine feet high, and her face brightened up at the corners: next the ten.',1,0,2948,1,NULL,'2024-03-11 00:36:35','2024-03-11 00:36:35',0,1,NULL,NULL,NULL),(98,'Taurean','Boehm','Dodo managed it.).',NULL,'cecelia14@yahoo.com','$2y$12$6Uet9CJT6cRKc8hzqp8MTeC1YNs5pDYp6SHqBLFZgmuKL0AKqqTc2',185,'1981-01-05','+14843770317','2024-03-11 07:36:35',NULL,'job-seeker',NULL,'resume/01.pdf','102 Nicklaus Extensions\nNew Jeniferland, MO 85796','She generally gave herself very good advice, (though she very seldom followed it), and handed back to finish his story. CHAPTER IV. The Rabbit Sends in a large one, but it was labelled \'ORANGE.',1,0,4465,1,NULL,'2024-03-11 00:36:35','2024-03-11 00:36:35',0,1,NULL,NULL,NULL),(99,'Mellie','Haag','WOULD not remember.',NULL,'wolff.cordelia@lemke.com','$2y$12$iq/9zFvAqM4Knt9DAgFf7O3cImfyZushgqFnQFWxbfGw01mgf3Vgm',185,'2011-05-08','+14257697061','2024-03-11 07:36:35',NULL,'job-seeker',NULL,'resume/01.pdf','55483 Reginald Skyway\nSouth Ara, MA 52547-5892','Little Bill It was all finished, the Owl, as a partner!\' cried the Mouse, in a tone of this was his first speech. \'You should learn not to lie down on their slates, \'SHE doesn\'t believe there\'s an.',1,0,1557,0,NULL,'2024-03-11 00:36:35','2024-03-11 00:36:35',0,1,NULL,NULL,NULL),(100,'Lemuel','Durgan','It quite makes my.',NULL,'katarina09@brakus.com','$2y$12$3ewxupFmRoyehdTHJp4yOOQETIoW9b0Kk36lC94OC/HWaZIAAUSn.',184,'1997-04-17','+13855584140','2024-03-11 07:36:36',NULL,'employer',NULL,NULL,'4058 Devante Light\nO\'Keefeville, AZ 42679','I wish you could draw treacle out of the evening, beautiful Soup! Soup of the hall: in fact she was a large pool all round her at the stick, and made believe to worry it; then Alice dodged behind a.',1,0,2242,1,NULL,'2024-03-11 00:36:36','2024-03-11 00:36:36',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_analytics`
--

DROP TABLE IF EXISTS `jb_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_analytics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_full` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_analytics`
--

LOCK TABLES `jb_analytics` WRITE;
/*!40000 ALTER TABLE `jb_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_applications`
--

DROP TABLE IF EXISTS `jb_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `job_id` bigint unsigned NOT NULL,
  `resume` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `is_external_apply` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_applications`
--

LOCK TABLES `jb_applications` WRITE;
/*!40000 ALTER TABLE `jb_applications` DISABLE KEYS */;
INSERT INTO `jb_applications` VALUES (1,'Madonna','Murazik','+16782177909','oschneider@cartwright.com','I\'m quite tired of this. I vote the young lady to see if there were any tears. No, there were three little sisters--they were learning to draw, you know--\' She had already heard her sentence three.',12,'resume/01.pdf','resume/01.pdf',24,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(2,'Catharine','Bartell','+17695039606','geraldine72@yahoo.com','King said, turning to the jury, in a court of justice before, but she could not swim. He sent them word I had not the smallest notice of her ever getting out of sight before the end of trials.',20,'resume/01.pdf','resume/01.pdf',89,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(3,'Chris','Crona','+16815742621','devon69@sauer.net','Why, I wouldn\'t be in a large kitchen, which was the BEST butter, you know.\' \'And what are they doing?\' Alice whispered to the door, she found it so quickly that the hedgehog a blow with its.',29,'resume/01.pdf','resume/01.pdf',69,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(4,'Terrill','Dibbert','+16054056840','gottlieb.greyson@klocko.com','YOU like cats if you could keep it to annoy, Because he knows it teases.\' CHORUS. (In which the March Hare: she thought it over here,\' said the last word two or three pairs of tiny white kid gloves.',31,'resume/01.pdf','resume/01.pdf',71,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(5,'Fernando','Wiegand','+17856307022','deborah91@lueilwitz.org','King, who had been anything near the looking-glass. There was exactly one a-piece all round. \'But she must have imitated somebody else\'s hand,\' said the Hatter. This piece of rudeness was more.',18,'resume/01.pdf','resume/01.pdf',35,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(6,'Norbert','Schulist','+16629842134','job_seeker@archielite.com','I eat or drink anything; so I\'ll just see what was coming. It was opened by another footman in livery came running out of sight, he said in a wondering tone. \'Why, what a delightful thing a bit!\'.',51,'resume/01.pdf','resume/01.pdf',2,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(7,'Thora','Gaylord','+16695556534','qwalsh@greenfelder.com','I\'m afraid, sir\' said Alice, timidly; \'some of the way to fly up into a line along the course, here and there. There was not otherwise than what it was: at first was moderate. But the insolence of.',34,'resume/01.pdf','resume/01.pdf',47,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(8,'Taylor','Mueller','+14756055350','esther.mohr@gmail.com','ME,\' said the Gryphon answered, very nearly carried it off. * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * \'What a pity it wouldn\'t stay!\'.',16,'resume/01.pdf','resume/01.pdf',26,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(9,'Sydney','Will','+16052348508','iwunsch@ullrich.com','I\'m doubtful about the games now.\' CHAPTER X. The Lobster Quadrille The Mock Turtle is.\' \'It\'s the thing at all. \'But perhaps he can\'t help it,\' said Alice desperately: \'he\'s perfectly idiotic!\' And.',4,'resume/01.pdf','resume/01.pdf',92,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(10,'Alexander','Doyle','+16033090318','waters.kailey@lind.com','Bill! I wouldn\'t say anything about it, and on it were white, but there was nothing so VERY much out of THIS!\' (Sounds of more broken glass.) \'Now tell me, Pat, what\'s that in about half no time!.',14,'resume/01.pdf','resume/01.pdf',70,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(11,'Madie','Kihn','+13074513023','morris72@crooks.org','Dodo managed it.) First it marked out a race-course, in a minute or two she stood looking at the end of the evening, beautiful Soup! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the.',10,'resume/01.pdf','resume/01.pdf',90,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(12,'Laila','Murazik','+13316414837','johnston.danial@gutmann.biz','I\'m better now--but I\'m a hatter.\' Here the Queen left off, quite out of the court was in the wind, and the Queen of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\'.',23,'resume/01.pdf','resume/01.pdf',15,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(13,'Delta','Howe','+16897788892','letitia38@crona.com','Jack-in-the-box, and up I goes like a steam-engine when she looked up, but it all is! I\'ll try if I only knew how to get into the book her sister was reading, but it is.\' \'I quite agree with you,\'.',22,'resume/01.pdf','resume/01.pdf',49,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(14,'Savion','Connelly','+15405908086','tate.langosh@gmail.com','Gryphon went on \'And how many hours a day is very confusing.\' \'It isn\'t,\' said the King, \'or I\'ll have you got in your pocket?\' he went on, \'that they\'d let Dinah stop in the face. \'I\'ll put a white.',13,'resume/01.pdf','resume/01.pdf',32,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(15,'Ernie','Wilkinson','+13046182311','jayda32@rohan.com','March.\' As she said to herself what such an extraordinary ways of living would be offended again. \'Mine is a long hookah, and taking not the smallest idea how confusing it is all the unjust.',45,'resume/01.pdf','resume/01.pdf',17,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(16,'Jordi','Schimmel','+16057579024','bernier.vergie@gmail.com','Gryphon: \'I went to school in the newspapers, at the March Hare and the arm that was trickling down his brush, and had to kneel down on her spectacles, and began by taking the little golden key in.',40,'resume/01.pdf','resume/01.pdf',97,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(17,'Lamont','Towne','+19257682287','senger.michale@braun.biz','And beat him when he pleases!\' CHORUS. \'Wow! wow! wow!\' \'Here! you may stand down,\' continued the Hatter, and he hurried off. Alice thought to herself, as usual. \'Come, there\'s half my plan done.',15,'resume/01.pdf','resume/01.pdf',79,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(18,'Eleanora','Nitzsche','+16203747688','elvis89@hotmail.com','A Mad Tea-Party There was a queer-shaped little creature, and held it out into the way of speaking to it,\' she thought, and rightly too, that very few little girls eat eggs quite as much use in the.',36,'resume/01.pdf','resume/01.pdf',30,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(19,'Leatha','Berge','+17167247744','donavon33@bogan.info','Queen, who was peeping anxiously into her head. \'If I eat one of the gloves, and was going on, as she spoke. \'I must go back and see after some executions I have done that, you know,\' said Alice.',49,'resume/01.pdf','resume/01.pdf',21,1,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36'),(20,'Evert','Krajcik','+18043936689','dare.elissa@jacobs.org','Alice; \'living at the March Hare had just begun to think this a very deep well. Either the well was very likely it can be,\' said the White Rabbit returning, splendidly dressed, with a sudden burst.',30,'resume/01.pdf','resume/01.pdf',34,0,'checked','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `jb_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels`
--

DROP TABLE IF EXISTS `jb_career_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels`
--

LOCK TABLES `jb_career_levels` WRITE;
/*!40000 ALTER TABLE `jb_career_levels` DISABLE KEYS */;
INSERT INTO `jb_career_levels` VALUES (1,'Department Head',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(2,'Entry Level',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(3,'Experienced Professional',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(4,'GM / CEO / Country Head / President',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(5,'Intern/Student',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07');
/*!40000 ALTER TABLE `jb_career_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels_translations`
--

DROP TABLE IF EXISTS `jb_career_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_career_levels_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_career_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels_translations`
--

LOCK TABLES `jb_career_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_career_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_career_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories`
--

DROP TABLE IF EXISTS `jb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories`
--

LOCK TABLES `jb_categories` WRITE;
/*!40000 ALTER TABLE `jb_categories` DISABLE KEYS */;
INSERT INTO `jb_categories` VALUES (1,'Content Writer',NULL,0,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(2,'Market Research',NULL,1,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(3,'Marketing &amp; Sale',NULL,2,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(4,'Customer Help',NULL,3,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(5,'Finance',NULL,4,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(6,'Software',NULL,5,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(7,'Human Resource',NULL,6,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(8,'Management',NULL,7,0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(9,'Retail &amp; Products',NULL,8,0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0),(10,'Security Analyst',NULL,9,0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08',0);
/*!40000 ALTER TABLE `jb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories_translations`
--

DROP TABLE IF EXISTS `jb_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories_translations`
--

LOCK TABLES `jb_categories_translations` WRITE;
/*!40000 ALTER TABLE `jb_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies`
--

DROP TABLE IF EXISTS `jb_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `postal_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_founded` int unsigned DEFAULT NULL,
  `ceo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_offices` int unsigned DEFAULT NULL,
  `number_of_employees` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_revenue` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies`
--

LOCK TABLES `jb_companies` WRITE;
/*!40000 ALTER TABLE `jb_companies` DISABLE KEYS */;
INSERT INTO `jb_companies` VALUES (1,'LinkedIn',NULL,'Non corrupti possimus quia perspiciatis eum. Dicta ratione soluta exercitationem ea. Culpa molestiae fugit aut alias. Iure quis nostrum maxime quasi ex.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/1.png','42.631115','-76.33928','602 Koss Wells\nKaydenland, MA 74216',2,2,2,NULL,'+17574910115',2013,'John Doe',5,'1','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(2,'Adobe Illustrator',NULL,'Dolorum ducimus omnis ut incidunt aliquid. Temporibus voluptate veritatis expedita ducimus est tempore possimus. Similique voluptatem sint omnis neque. Sit id nisi sunt velit qui a.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.adobe.com/','companies/2.png','42.798334','-76.439565','5905 Greenfelder Grove\nAntoinetteview, CO 76019',5,5,5,NULL,'+17572918828',2009,'Jeff Werner',2,'8','1M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(3,'Bing Search',NULL,'Atque laborum non voluptatem debitis recusandae. Nisi quidem omnis qui eos voluptatem sequi. Voluptas voluptas nemo qui ad beatae eligendi rerum.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.bing.com/','companies/3.png','42.733635','-76.570707','173 Weber Ranch Suite 896\nJoseton, IA 20844-7991',5,5,5,NULL,'+14756218516',1982,'Nakamura',10,'10','2M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(4,'Dailymotion',NULL,'Quibusdam repellat numquam dolorem. Dolores possimus atque neque. Dolorum eaque adipisci maiores ut.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.dailymotion.com/','companies/4.png','43.108648','-74.901322','602 Wilhelm Forks Suite 503\nMitchellbury, CO 66532-8315',3,3,3,NULL,'+17723408825',1974,'John Doe',9,'6','2M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(5,'Linkedin',NULL,'Quia dicta veniam autem illo eos quo sed. Autem ipsam et laborum omnis. Ipsam error unde nisi nesciunt quae laboriosam eum rerum. Enim est quis aut reiciendis.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/5.png','43.73782','-75.32745','637 Berge Vista Suite 729\nReingerville, WI 86623-2549',5,5,5,NULL,'+13856030917',1988,'John Doe',3,'2','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(6,'Quora JSC',NULL,'Sint facilis est quis dolor. Est itaque et aut nulla dicta quos qui. Dolore eaque mollitia eaque ipsa error officia.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.quora.com/','companies/6.png','43.265032','-75.443439','42183 Ericka Mountain Apt. 468\nNorth Reilly, SD 81179',3,3,3,NULL,'+14322943037',1980,'John Doe',4,'5','9M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(7,'Nintendo',NULL,'Alias sed quia unde dignissimos temporibus. Soluta dolor laudantium quasi repellendus.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.nintendo.com/','companies/7.png','43.204015','-74.999801','344 Rosina Pike Apt. 043\nStanstad, LA 96485-6107',6,6,6,NULL,'+15753226843',1985,'Steve Jobs',1,'6','7M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(8,'Periscope',NULL,'Ut qui ut quia. Soluta sapiente rerum molestiae quas non. Nemo dolor labore repudiandae ducimus qui aut a exercitationem. Quod nulla laborum et.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/8.png','43.12397','-75.095898','13932 Conor Knoll Apt. 065\nUllrichstad, UT 46090-5912',2,2,2,NULL,'+15083729982',1998,'John Doe',2,'1','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(9,'NewSum',NULL,'Nihil dolores ex maxime eos velit. Nulla rerum aperiam optio. Porro et quia commodi et quis soluta.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://newsum.us/','companies/4.png','42.626193','-74.971701','9209 Aiyana Vista\nLake Eugenia, AK 18518-3588',6,6,6,NULL,'+16238541825',1974,'John Doe',10,'5','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(10,'PowerHome',NULL,'Qui ut commodi beatae inventore non et optio. Optio maiores reiciendis explicabo fugit iure harum. Aperiam blanditiis laboriosam aut eligendi molestiae illo ut expedita. Mollitia ut culpa omnis qui.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/5.png','42.670332','-76.547574','3296 Friesen Key Apt. 830\nChristianview, WV 11028-3142',6,6,6,NULL,'+18487817222',2005,'John Doe',4,'8','3M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(11,'Whop.com',NULL,'Quo quis ut temporibus assumenda consequuntur et. Mollitia animi molestiae aut nesciunt ut. Voluptas repellat illum qui. Qui inventore voluptatem aperiam illum.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://whop.com/','companies/6.png','43.373615','-76.160989','73744 Lindsay Ranch\nBotsfordberg, FL 61319-4020',5,5,5,NULL,'+14136538210',1970,'John Doe',9,'8','8M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(12,'Greenwood',NULL,'Distinctio cumque rerum quasi molestias ducimus corrupti in. Dolores ut ipsa eos omnis voluptas. Quae voluptatum blanditiis eaque aliquid voluptas distinctio inventore.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.greenwoodjs.io/','companies/7.png','43.065259','-75.082922','6682 Rocio Mountain Apt. 261\nBrakustown, NM 01517',3,3,3,NULL,'+18383466926',1986,'John Doe',1,'7','10M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(13,'Kentucky',NULL,'Autem id molestiae et iste vel est culpa. Sint corrupti ad rem eaque. Autem non aut dignissimos explicabo voluptatem dolore.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.kentucky.gov/','companies/8.png','43.377108','-75.779019','3692 Ron Ville\nLarkinberg, UT 51112',2,2,2,NULL,'+18125230178',1980,'John Doe',3,'10','3M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(14,'Equity',NULL,'Dolor repudiandae consequuntur qui ipsa doloremque omnis ut. Totam veniam non et laudantium architecto incidunt quis quia. Incidunt et iure tempore.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.equity.org.uk/','companies/6.png','42.930834','-75.955192','5800 Arlene Club Apt. 575\nWest Parker, AL 63602-7701',2,2,2,NULL,'+18063654211',2000,'John Doe',5,'6','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(15,'Honda',NULL,'Maxime numquam et dolorum tempora molestias ea blanditiis. Ipsa asperiores quia a eius. Eos asperiores consequatur sit numquam nihil. Sunt hic et est culpa.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.honda.com/','companies/9.png','42.868182','-74.908008','600 Reilly Mall Apt. 983\nCristmouth, PA 31500',4,4,4,NULL,'+12486668091',1988,'John Doe',6,'3','8M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(16,'Toyota',NULL,'Fuga at officiis enim at non sit eum. Exercitationem dolorum pariatur nostrum alias doloremque voluptas. Aspernatur deleniti magni ipsum rerum et nobis. Itaque eius quidem porro nostrum ipsa.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.toyota.com/','companies/5.png','43.961914','-75.039421','93624 Bednar Prairie\nKatarinaland, ME 37877',5,5,5,NULL,'+16237088282',1996,'John Doe',6,'7','8M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(17,'Lexus',NULL,'Corrupti ex et molestiae blanditiis quae. Nihil hic saepe officia ut veniam autem voluptatem molestiae. Corporis et facere corporis maxime dolor voluptates.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/3.png','43.439357','-75.659279','519 Fahey Pike Suite 533\nPort Elise, KS 25571',4,4,4,NULL,'+16292021291',1972,'John Doe',9,'1','1M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(18,'Ondo',NULL,'Autem omnis veritatis modi. Ut sed officia corporis aliquid dolorem. Reprehenderit ex repudiandae consequuntur sequi. Quis hic eaque dolorem quidem ut velit.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://ondo.mn/','companies/6.png','43.232535','-76.492838','555 Schuster Ville\nEast Rhett, SD 08648-7534',3,3,3,NULL,'+17062146835',1999,'John Doe',4,'3','5M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(19,'Square',NULL,'Odit et eligendi est expedita qui sed ut. Autem voluptatem vero in quisquam est iste consequatur. Omnis quo consequuntur praesentium ipsum recusandae quidem.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://squareup.com/','companies/2.png','43.361956','-76.324639','16363 Brice Burg Suite 593\nPort Laurel, NJ 45715-9759',2,2,2,NULL,'+13413205992',1983,'John Doe',1,'9','2M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(20,'Visa',NULL,'Debitis ea similique quo aspernatur nesciunt. Suscipit voluptas et laboriosam eaque distinctio. Vel et aut in repellat dignissimos omnis.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://visa.com/','companies/8.png','43.542114','-75.610731','834 Liana Junctions\nSchmittmouth, MA 41993',3,3,3,NULL,'+18163731745',1993,'John Doe',4,'5','8M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL);
/*!40000 ALTER TABLE `jb_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies_accounts`
--

DROP TABLE IF EXISTS `jb_companies_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies_accounts` (
  `company_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies_accounts`
--

LOCK TABLES `jb_companies_accounts` WRITE;
/*!40000 ALTER TABLE `jb_companies_accounts` DISABLE KEYS */;
INSERT INTO `jb_companies_accounts` VALUES (1,1),(1,4),(2,1),(2,4),(3,1),(3,4),(4,1),(4,4),(5,1),(5,4),(6,1),(6,4),(7,1),(7,4),(8,1),(8,4),(9,1),(9,4),(10,1),(10,4),(11,1),(11,4),(12,1),(12,4),(13,1),(13,4),(14,1),(14,4),(15,1),(15,4),(16,1),(16,4),(17,1),(17,4),(18,1),(18,4),(19,1),(19,4),(20,1),(20,4);
/*!40000 ALTER TABLE `jb_companies_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_coupons`
--

DROP TABLE IF EXISTS `jb_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_coupons`
--

LOCK TABLES `jb_coupons` WRITE;
/*!40000 ALTER TABLE `jb_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_currencies`
--

DROP TABLE IF EXISTS `jb_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_currencies`
--

LOCK TABLES `jb_currencies` WRITE;
/*!40000 ALTER TABLE `jb_currencies` DISABLE KEYS */;
INSERT INTO `jb_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-03-11 00:36:10','2024-03-11 00:36:10'),(2,'EUR','€',0,2,1,0,0.91,'2024-03-11 00:36:10','2024-03-11 00:36:10'),(3,'VND','₫',0,0,2,0,23717.5,'2024-03-11 00:36:10','2024-03-11 00:36:10');
/*!40000 ALTER TABLE `jb_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options`
--

DROP TABLE IF EXISTS `jb_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options`
--

LOCK TABLES `jb_custom_field_options` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options_translations`
--

LOCK TABLES `jb_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values`
--

DROP TABLE IF EXISTS `jb_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values`
--

LOCK TABLES `jb_custom_field_values` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values_translations`
--

LOCK TABLES `jb_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields`
--

DROP TABLE IF EXISTS `jb_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields`
--

LOCK TABLES `jb_custom_fields` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields_translations`
--

DROP TABLE IF EXISTS `jb_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields_translations`
--

LOCK TABLES `jb_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels`
--

DROP TABLE IF EXISTS `jb_degree_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels`
--

LOCK TABLES `jb_degree_levels` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels` DISABLE KEYS */;
INSERT INTO `jb_degree_levels` VALUES (1,'Non-Matriculation',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(2,'Matriculation/O-Level',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(3,'Intermediate/A-Level',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(4,'Bachelors',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(5,'Masters',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(6,'MPhil/MS',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(7,'PHD/Doctorate',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(8,'Certification',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(9,'Diploma',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(10,'Short Course',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07');
/*!40000 ALTER TABLE `jb_degree_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels_translations`
--

DROP TABLE IF EXISTS `jb_degree_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_levels_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels_translations`
--

LOCK TABLES `jb_degree_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types`
--

DROP TABLE IF EXISTS `jb_degree_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree_level_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types`
--

LOCK TABLES `jb_degree_types` WRITE;
/*!40000 ALTER TABLE `jb_degree_types` DISABLE KEYS */;
INSERT INTO `jb_degree_types` VALUES (1,'Matric in Arts',2,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(2,'Matric in Science',2,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(3,'O-Levels',2,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(4,'A-Levels',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(5,'Faculty of Arts',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(6,'Faculty of Science (Pre-medical)',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(7,'Faculty of Science (Pre-Engineering)',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(8,'Intermediate in Computer Science',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(9,'Intermediate in Commerce',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(10,'Intermediate in General Science',3,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(11,'Bachelors in Arts',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(12,'Bachelors in Architecture',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(13,'Bachelors in Business Administration',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(14,'Bachelors in Commerce',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(15,'Bachelors of Dental Surgery',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(16,'Bachelors of Education',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(17,'Bachelors in Engineering',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(18,'Bachelors in Pharmacy',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(19,'Bachelors in Science',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(20,'Bachelors of Science in Nursing (Registered Nursing)',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(21,'Bachelors in Law',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(22,'Bachelors in Technology',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(23,'BCS/BS',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(24,'Doctor of Veterinary Medicine',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(25,'MBBS',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(26,'Post Registered Nursing B.S.',4,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(27,'Masters in Arts',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(28,'Masters in Business Administration',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(29,'Masters in Commerce',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(30,'Masters of Education',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(31,'Masters in Law',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(32,'Masters in Science',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(33,'Executive Masters in Business Administration',5,0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07');
/*!40000 ALTER TABLE `jb_degree_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types_translations`
--

DROP TABLE IF EXISTS `jb_degree_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_types_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types_translations`
--

LOCK TABLES `jb_degree_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas`
--

DROP TABLE IF EXISTS `jb_functional_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas`
--

LOCK TABLES `jb_functional_areas` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas` DISABLE KEYS */;
INSERT INTO `jb_functional_areas` VALUES (1,'Accountant',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(2,'Accounts, Finance &amp; Financial Services',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(3,'Admin',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(4,'Admin Operation',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(5,'Administration',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(6,'Administration Clerical',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(7,'Advertising',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(8,'Advertising',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(9,'Advertisement',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(10,'Architects &amp; Construction',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(11,'Architecture',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(12,'Bank Operation',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(13,'Business Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(14,'Business Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(15,'Business Systems Analyst',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(16,'Clerical',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(17,'Client Services &amp; Customer Support',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(18,'Computer Hardware',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(19,'Computer Networking',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(20,'Consultant',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(21,'Content Writer',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(22,'Corporate Affairs',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(23,'Creative Design',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(24,'Creative Writer',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(25,'Customer Support',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(26,'Data Entry',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(27,'Data Entry Operator',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(28,'Database Administration (DBA)',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(29,'Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(30,'Distribution &amp; Logistics',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(31,'Education &amp; Training',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(32,'Electronics Technician',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(33,'Engineering',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(34,'Engineering Construction',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(35,'Executive Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(36,'Executive Secretary',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(37,'Field Operations',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(38,'Front Desk Clerk',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(39,'Front Desk Officer',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(40,'Graphic Design',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(41,'Hardware',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(42,'Health &amp; Medicine',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(43,'Health &amp; Safety',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(44,'Health Care',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(45,'Health Related',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(46,'Hotel Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(47,'Hotel/Restaurant Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(48,'HR',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(49,'Human Resources',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(50,'Import &amp; Export',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(51,'Industrial Production',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(52,'Installation &amp; Repair',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(53,'Interior Designers &amp; Architects',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(54,'Intern',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(55,'Internship',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(56,'Investment Operations',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(57,'IT Security',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(58,'IT Systems Analyst',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(59,'Legal &amp; Corporate Affairs',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(60,'Legal Affairs',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(61,'Legal Research',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(62,'Logistics &amp; Warehousing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(63,'Maintenance/Repair',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(64,'Management Consulting',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(65,'Management Information System (MIS)',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(66,'Managerial',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(67,'Manufacturing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(68,'Manufacturing &amp; Operations',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(69,'Marketing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(70,'Marketing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(71,'Media - Print &amp; Electronic',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(72,'Media &amp; Advertising',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(73,'Medical',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(74,'Medicine',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(75,'Merchandising',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(76,'Merchandising &amp; Product Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(77,'Monitoring &amp; Evaluation (M&amp;E)',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(78,'Network Administration',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(79,'Network Operation',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(80,'Online Advertising',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(81,'Online Marketing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(82,'Operations',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(83,'Planning',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(84,'Planning &amp; Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(85,'PR',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(86,'Print Media',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(87,'Printing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(88,'Procurement',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(89,'Product Developer',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(90,'Product Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(91,'Product Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(92,'Product Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(93,'Production',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(94,'Production &amp; Quality Control',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(95,'Project Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(96,'Project Management Consultant',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(97,'Public Relations',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(98,'QA',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(99,'QC',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(100,'Qualitative Research',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(101,'Quality Assurance (QA)',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(102,'Quality Control',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(103,'Quality Inspection',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(104,'Recruiting',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(105,'Recruitment',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(106,'Repair &amp; Overhaul',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(107,'Research &amp; Development (R&amp;D)',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(108,'Research &amp; Evaluation',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(109,'Research &amp; Fellowships',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(110,'Researcher',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(111,'Restaurant Management',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(112,'Retail',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(113,'Retail &amp; Wholesale',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(114,'Retail Buyer',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(115,'Retail Buying',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(116,'Retail Merchandising',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(117,'Safety &amp; Environment',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(118,'Sales',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(119,'Sales &amp; Business Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(120,'Sales Support',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(121,'Search Engine Optimization (SEO)',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(122,'Secretarial, Clerical &amp; Front Office',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(123,'Security',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(124,'Security &amp; Environment',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(125,'Security Guard',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(126,'SEM',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(127,'SMO',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(128,'Software &amp; Web Development',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(129,'Software Engineer',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(130,'Software Testing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(131,'Stores &amp; Warehousing',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(132,'Supply Chain',0,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(133,'Supply Chain Management',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(134,'Systems Analyst',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(135,'Teachers/Education, Training &amp; Development',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(136,'Technical Writer',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(137,'Tele Sale Representative',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(138,'Telemarketing',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(139,'Training &amp; Development',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(140,'Transportation &amp; Warehousing',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(141,'TSR',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(142,'Typing',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(143,'Warehousing',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(144,'Web Developer',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(145,'Web Marketing',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(146,'Writer',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(147,'PR',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(148,'QA',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(149,'QC',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(150,'SEM',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(151,'SMO',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(152,'TSR',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(153,'HR',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(154,'QA',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(155,'QC',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(156,'SEM',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08');
/*!40000 ALTER TABLE `jb_functional_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas_translations`
--

DROP TABLE IF EXISTS `jb_functional_areas_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_functional_areas_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_functional_areas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas_translations`
--

LOCK TABLES `jb_functional_areas_translations` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_functional_areas_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoice_items`
--

DROP TABLE IF EXISTS `jb_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoice_items`
--

LOCK TABLES `jb_invoice_items` WRITE;
/*!40000 ALTER TABLE `jb_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoices`
--

DROP TABLE IF EXISTS `jb_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_invoices_code_unique` (`code`),
  KEY `jb_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `jb_invoices_payment_id_index` (`payment_id`),
  KEY `jb_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoices`
--

LOCK TABLES `jb_invoices` WRITE;
/*!40000 ALTER TABLE `jb_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences`
--

DROP TABLE IF EXISTS `jb_job_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences`
--

LOCK TABLES `jb_job_experiences` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences` DISABLE KEYS */;
INSERT INTO `jb_job_experiences` VALUES (1,'Fresh',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(2,'Less Than 1 Year',1,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(3,'1 Year',2,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(4,'2 Year',3,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(5,'3 Year',4,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(6,'4 Year',5,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(7,'5 Year',6,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(8,'6 Year',7,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(9,'7 Year',8,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(10,'8 Year',9,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(11,'9 Year',10,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(12,'10 Year',11,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08');
/*!40000 ALTER TABLE `jb_job_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences_translations`
--

DROP TABLE IF EXISTS `jb_job_experiences_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_experiences_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_experiences_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences_translations`
--

LOCK TABLES `jb_job_experiences_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_experiences_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts`
--

DROP TABLE IF EXISTS `jb_job_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts`
--

LOCK TABLES `jb_job_shifts` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts` DISABLE KEYS */;
INSERT INTO `jb_job_shifts` VALUES (1,'First Shift (Day)',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(2,'Second Shift (Afternoon)',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(3,'Third Shift (Night)',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(4,'Rotating',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08');
/*!40000 ALTER TABLE `jb_job_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts_translations`
--

DROP TABLE IF EXISTS `jb_job_shifts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_shifts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_shifts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts_translations`
--

LOCK TABLES `jb_job_shifts_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_shifts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills`
--

DROP TABLE IF EXISTS `jb_job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills`
--

LOCK TABLES `jb_job_skills` WRITE;
/*!40000 ALTER TABLE `jb_job_skills` DISABLE KEYS */;
INSERT INTO `jb_job_skills` VALUES (1,'JavaScript',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(2,'PHP',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(3,'Python',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(4,'Laravel',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(5,'CakePHP',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(6,'WordPress',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(7,'Flutter',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(8,'FilamentPHP',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(9,'React.js',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08');
/*!40000 ALTER TABLE `jb_job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills_translations`
--

DROP TABLE IF EXISTS `jb_job_skills_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_skills_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills_translations`
--

LOCK TABLES `jb_job_skills_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_skills_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_skills_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types`
--

DROP TABLE IF EXISTS `jb_job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types`
--

LOCK TABLES `jb_job_types` WRITE;
/*!40000 ALTER TABLE `jb_job_types` DISABLE KEYS */;
INSERT INTO `jb_job_types` VALUES (1,'Contract',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(2,'Freelance',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(3,'Full Time',0,1,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(4,'Internship',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08'),(5,'Part Time',0,0,'published','2024-03-11 00:36:08','2024-03-11 00:36:08');
/*!40000 ALTER TABLE `jb_job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types_translations`
--

DROP TABLE IF EXISTS `jb_job_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_types_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types_translations`
--

LOCK TABLES `jb_job_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs`
--

DROP TABLE IF EXISTS `jb_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `apply_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `is_freelance` tinyint unsigned NOT NULL DEFAULT '0',
  `career_level_id` bigint unsigned DEFAULT NULL,
  `salary_from` decimal(15,2) unsigned DEFAULT NULL,
  `salary_to` decimal(15,2) unsigned DEFAULT NULL,
  `salary_range` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hour',
  `currency_id` bigint unsigned DEFAULT NULL,
  `degree_level_id` bigint unsigned DEFAULT NULL,
  `job_shift_id` bigint unsigned DEFAULT NULL,
  `job_experience_id` bigint unsigned DEFAULT NULL,
  `functional_area_id` bigint unsigned DEFAULT NULL,
  `hide_salary` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_positions` int unsigned NOT NULL DEFAULT '1',
  `expire_date` date DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `views` int unsigned NOT NULL DEFAULT '0',
  `number_of_applied` int unsigned NOT NULL DEFAULT '0',
  `hide_company` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `external_apply_clicks` int unsigned NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employer_colleagues` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `application_closing_date` date DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs`
--

LOCK TABLES `jb_jobs` WRITE;
/*!40000 ALTER TABLE `jb_jobs` DISABLE KEYS */;
INSERT INTO `jb_jobs` VALUES (1,'UI / UX Designer full-time','Voluptatum et saepe rerum dolorem. Dicta ea odio nulla beatae et fugit praesentium odio. Est sed quibusdam eum eveniet itaque illum qui voluptas. Tempora voluptatem eveniet tempore ad.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,6,6,6,0,4,600.00,5300.00,'monthly',0,9,4,1,79,0,6,'2024-04-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.204015','-74.999801',0,0,1,1,'published','approved','2024-02-25 07:39:04','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(2,'Full Stack Engineer','Consequatur non placeat placeat et accusantium animi. Laboriosam ipsa sit ratione minus doloribus architecto. Provident expedita explicabo esse beatae. Soluta et facere voluptate.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','https://google.com',3,NULL,5,5,5,0,4,9900.00,10400.00,'daily',1,1,1,2,145,0,5,'2024-04-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.733635','-76.570707',0,0,0,0,'published','approved','2024-02-19 07:02:53','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(3,'Java Software Engineer','Sint est et consequuntur quaerat et. Ad sequi dolorem cumque dolor vel. Laboriosam eos atque quia molestiae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',4,NULL,3,3,3,0,5,3900.00,7600.00,'monthly',0,5,1,3,118,0,9,'2024-04-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.108648','-74.901322',0,0,0,0,'published','approved','2024-02-04 18:31:42','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(4,'Digital Marketing Manager','Consequatur qui quia et ut aliquam. Corporis voluptas culpa occaecati est itaque. Et et molestias voluptate fugit omnis quis. Rem et cumque quos est.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,6,6,6,0,1,6500.00,9300.00,'hourly',1,2,2,3,114,0,9,'2024-04-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.204015','-74.999801',0,0,0,0,'published','approved','2024-02-08 06:07:01','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(5,'Frontend Developer','Excepturi id non sed. Et eius at quo. Veritatis corporis voluptate consequatur et et vel. Dolore est ut quae. Nulla eaque iusto voluptatem recusandae. Dicta quas corporis et nostrum possimus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,6,6,6,0,1,5400.00,12400.00,'yearly',0,6,2,5,113,0,9,'2024-03-17',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.670332','-76.547574',0,0,0,0,'published','approved','2024-01-30 04:20:28','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(6,'React Native Web Developer','Ducimus rerum officia praesentium non sequi nihil. Soluta nesciunt consectetur excepturi optio sunt. Et sit odio eaque totam. Consectetur perspiciatis aspernatur hic et voluptatibus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,5,5,5,0,2,600.00,8600.00,'weekly',0,6,4,2,6,0,4,'2024-04-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.733635','-76.570707',0,0,1,1,'published','approved','2024-01-25 22:05:00','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(7,'Senior System Engineer','Aut dignissimos et sit velit provident molestiae. Veniam itaque consequuntur libero atque. Numquam sapiente sed voluptas incidunt harum. Saepe nostrum rerum repudiandae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,2,2,2,0,4,7600.00,10900.00,'daily',1,10,2,4,40,0,4,'2024-03-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.631115','-76.33928',0,0,1,0,'published','approved','2024-02-12 10:27:45','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(8,'Products Manager','Quam eveniet ex qui est id. Ut ad molestias veniam quo ut velit. Odit omnis voluptate in est sed aliquid iusto.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,5,1900.00,7000.00,'daily',0,2,4,4,95,0,3,'2024-03-28',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.065259','-75.082922',0,0,0,1,'published','approved','2024-02-25 04:59:05','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(9,'Lead Quality Control QA','Officia perspiciatis soluta ipsam ut. Nisi est nulla dolores iusto expedita qui quaerat rerum. Vero quae quia non dignissimos.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,4,4,4,0,4,2900.00,10200.00,'monthly',0,5,2,2,86,0,2,'2024-05-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.868182','-74.908008',0,0,1,1,'published','approved','2024-02-06 16:39:00','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(10,'Principal Designer, Design Systems','Ullam sint excepturi est quidem sequi placeat. Dicta deserunt autem et id asperiores laboriosam cumque dolorem. Reprehenderit vel sint amet in ut sed debitis nulla. Nobis quo mollitia inventore.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',4,NULL,3,3,3,0,5,5600.00,11900.00,'hourly',1,2,1,1,78,0,8,'2024-04-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.108648','-74.901322',0,0,1,1,'published','approved','2024-02-05 17:46:21','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(11,'DevOps Architect','Amet nam earum ut eum enim aspernatur. Voluptate modi dolores id minima nihil aut ducimus. Repellendus autem ad qui tempore.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,4,4,4,0,1,800.00,4100.00,'daily',1,4,2,5,88,0,2,'2024-03-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.868182','-74.908008',0,0,0,1,'published','approved','2024-03-02 06:11:19','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(12,'Senior Software Engineer, npm CLI','Corporis facilis voluptas qui earum. Et ut reiciendis dolore vero qui quia veritatis. Dolorum et qui molestiae. Rerum et cupiditate ex cumque aut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',17,NULL,4,4,4,0,4,9900.00,19900.00,'weekly',0,7,3,3,154,0,2,'2024-04-28',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.439357','-75.659279',0,0,0,1,'published','approved','2024-01-22 09:35:53','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(13,'Senior Systems Engineer','Error occaecati molestiae aliquid vel consequuntur quis suscipit. Molestiae porro molestiae et soluta. Voluptas vitae ad porro. Quae sed nam pariatur tenetur quas.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,1,1700.00,9200.00,'hourly',1,5,4,1,144,0,3,'2024-04-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.373615','-76.160989',0,0,0,1,'published','approved','2024-01-30 17:25:17','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(14,'Software Engineer Actions Platform','Iste asperiores vitae ea laboriosam eum quo. Asperiores eos distinctio molestiae provident. Ipsum et consequuntur nam ut aut in sit. Impedit quis ad dicta et vel architecto earum accusamus.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,6,6,6,0,4,6600.00,7900.00,'yearly',1,9,4,3,7,0,10,'2024-04-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.670332','-76.547574',0,0,0,1,'published','approved','2024-02-14 12:50:31','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(15,'Staff Engineering Manager, Actions','Consectetur dolorem sapiente eligendi. Ea facere ea soluta voluptas. Et et repudiandae ea repudiandae eum natus ducimus. Unde et sed at.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,6,6,6,0,1,1200.00,10100.00,'monthly',0,7,2,4,129,0,6,'2024-04-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.670332','-76.547574',0,0,0,1,'published','approved','2024-01-29 07:56:10','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(16,'Staff Engineering Manager: Actions Runtime','Magnam esse adipisci voluptatum laborum non ut similique quo. Facere quasi voluptates dolorem enim. Rerum quisquam mollitia ut autem molestiae et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,3,3,3,0,4,3000.00,11400.00,'yearly',1,1,4,4,134,0,3,'2024-05-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.265032','-75.443439',0,0,1,0,'published','approved','2024-02-24 04:06:20','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(17,'Staff Engineering Manager, Packages','Esse at voluptas sunt. Error perspiciatis voluptatibus saepe omnis quidem. Sequi eum aut quas dolore et dolores odio autem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,5,5,5,0,3,8500.00,11000.00,'yearly',0,3,1,1,132,0,4,'2024-05-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.73782','-75.32745',0,0,1,0,'published','approved','2024-01-17 13:21:37','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(18,'Staff Software Engineer','Autem ab qui unde in doloribus ab dolores repellat. Minus sed esse non soluta assumenda. Iste voluptatem error repudiandae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,3,3,3,0,2,8700.00,10000.00,'daily',0,1,1,1,56,0,4,'2024-03-28',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.265032','-75.443439',0,0,1,0,'published','approved','2024-02-10 04:45:50','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(19,'Systems Software Engineer','Mollitia quod nostrum minus. Rerum quo voluptates dolorum autem officia. Est soluta et quis atque unde.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,3,3900.00,9800.00,'daily',0,3,2,4,66,0,10,'2024-04-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.12397','-75.095898',0,0,1,1,'published','approved','2024-03-08 01:28:25','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(20,'Senior Compensation Analyst','Aliquam eius asperiores enim sed ipsam qui sit nam. Provident dolores est et illo numquam. Est debitis odio in libero temporibus molestiae eos.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,1,9100.00,16500.00,'hourly',1,6,2,2,23,0,2,'2024-03-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.373615','-76.160989',0,0,1,1,'published','approved','2024-01-30 20:20:46','2024-03-11 00:36:09',NULL,NULL,NULL,NULL),(21,'Senior Accessibility Program Manager','Sapiente vel esse sint quisquam dolorum. Sint voluptates et modi saepe. Dolores rerum et velit perferendis architecto non.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,5,5,5,0,4,5700.00,6500.00,'weekly',1,8,4,2,32,0,10,'2024-04-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.733635','-76.570707',0,0,1,1,'published','approved','2024-02-26 14:29:08','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(22,'Analyst Relations Manager, Application Security','Impedit porro ab ullam veniam eos officiis praesentium. Rerum et et porro velit. Nihil praesentium laboriosam illo ullam omnis cum voluptate.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,6,6,6,0,5,6600.00,16000.00,'yearly',0,10,4,3,136,0,10,'2024-03-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.670332','-76.547574',0,0,1,0,'published','approved','2024-02-12 14:16:33','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(23,'Senior Enterprise Advocate, EMEA','Sit expedita labore inventore adipisci quo. Est vero eum dicta facilis qui quo. Autem illum autem reprehenderit sunt quidem non qui distinctio. Nemo minima quam maxime facere ipsum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,3,3,3,0,3,1900.00,8200.00,'monthly',1,3,2,2,2,0,5,'2024-03-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.265032','-75.443439',0,0,1,1,'published','approved','2024-02-23 14:30:25','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(24,'Deal Desk Manager','Voluptatibus sit ut et eos et expedita. Molestiae minus accusantium totam sit saepe. Consequuntur expedita asperiores illum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',19,NULL,2,2,2,0,1,8800.00,10800.00,'yearly',1,7,4,3,99,0,6,'2024-03-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.361956','-76.324639',0,0,0,0,'published','approved','2024-02-18 03:58:07','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(25,'Director, Revenue Compensation','Ex laboriosam architecto voluptas fuga necessitatibus sit qui. Voluptatem repellat fugiat sapiente aspernatur quas rerum. Ut fuga inventore corporis et. Dolor ipsum expedita harum voluptas voluptas.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,5,5,5,0,2,9100.00,18400.00,'weekly',1,6,1,2,90,0,10,'2024-04-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.961914','-75.039421',0,0,0,1,'published','approved','2024-02-13 03:50:37','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(26,'Program Manager','Exercitationem vitae voluptatem aliquid magnam ducimus praesentium et. Quia sed dolores cumque rerum. Aliquid et facere eligendi. Et odio accusantium architecto.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,3,3,3,0,5,6400.00,10800.00,'hourly',0,8,2,2,11,0,3,'2024-04-22',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.232535','-76.492838',0,0,0,0,'published','approved','2024-02-01 23:43:16','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(27,'Sr. Manager, Deal Desk - INTL','Sed asperiores rerum repudiandae sint. Et eveniet doloribus quae reprehenderit quas occaecati itaque. Doloremque dolore ratione et accusantium rerum quod. Placeat non ipsum eos amet.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,5,5,5,0,1,6800.00,13800.00,'yearly',0,10,1,5,86,0,4,'2024-04-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.733635','-76.570707',0,0,0,1,'published','approved','2024-02-25 11:02:38','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(28,'Senior Director, Product Management, Actions Runners and Compute Services','Quia est dolore non laboriosam omnis repellendus et. Saepe qui ea adipisci quam autem sint. Excepturi dignissimos doloribus est quam perferendis. Ad autem vitae et sed in placeat.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,6,6,6,0,2,2800.00,10200.00,'hourly',1,4,4,3,61,0,4,'2024-04-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.626193','-74.971701',0,0,0,1,'published','approved','2024-02-29 23:55:53','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(29,'Alliances Director','Ea aut sint reprehenderit. Excepturi fugiat harum non voluptatem cumque non. Quam officiis reiciendis deleniti quis omnis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,5,9200.00,14600.00,'yearly',0,9,3,5,116,0,4,'2024-03-22',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.373615','-76.160989',0,0,0,0,'published','approved','2024-02-20 06:16:34','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(30,'Corporate Sales Representative','Sequi temporibus deleniti soluta eos dolorum ipsa rem deserunt. Harum adipisci suscipit non aut qui aliquid. Facere temporibus incidunt alias a modi error quisquam et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,5,5,5,0,1,6100.00,8900.00,'hourly',1,9,4,3,39,0,6,'2024-03-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.798334','-76.439565',0,0,1,0,'published','approved','2024-02-27 08:13:56','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(31,'Country Leader','Vitae accusamus tempore aut voluptas sunt maxime. Reiciendis earum et aut perspiciatis deserunt voluptatem molestiae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,2,2,2,0,2,6600.00,12100.00,'monthly',0,10,4,5,102,0,5,'2024-05-03',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.377108','-75.779019',0,0,1,1,'published','approved','2024-02-28 04:04:42','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(32,'Customer Success Architect','Recusandae libero occaecati beatae et sequi doloribus. Vel ratione explicabo omnis ut rerum modi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,6,6,6,0,5,6800.00,9000.00,'daily',1,7,2,4,76,0,8,'2024-04-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.670332','-76.547574',0,0,1,0,'published','approved','2024-02-04 18:17:01','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(33,'DevOps Account Executive - US Public Sector','Molestiae dolore recusandae repellendus. Vel et incidunt repellat voluptatem. Deserunt nisi amet tempora ut voluptas.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,2,2,2,0,1,9800.00,15200.00,'monthly',1,2,1,1,25,0,6,'2024-04-02',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.631115','-76.33928',0,0,1,0,'published','approved','2024-03-08 07:13:33','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(34,'Enterprise Account Executive','Laborum autem aperiam repellat velit qui. Distinctio fugiat nemo odit reprehenderit sint minima ut. Libero aut quia eum quibusdam in.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,6,6,6,0,2,9700.00,17300.00,'monthly',0,1,3,1,83,0,2,'2024-04-02',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.204015','-74.999801',0,0,0,1,'published','approved','2024-01-14 01:53:00','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(35,'Senior Engineering Manager, Product Security Engineering - Paved Paths','Impedit ullam voluptatem ipsam saepe id officia est. Iure tempore molestiae modi. Dolores aut mollitia modi unde. Maxime cum neque voluptatem asperiores commodi ducimus sequi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,4,2500.00,4500.00,'yearly',1,10,3,1,94,0,10,'2024-04-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.12397','-75.095898',0,0,1,0,'published','approved','2024-02-21 16:45:56','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(36,'Customer Reliability Engineer III','Laborum facere non optio itaque nihil hic ea. Laborum officiis voluptates consequatur sint necessitatibus. Maiores deserunt adipisci est.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,2,8600.00,18000.00,'weekly',1,6,1,5,56,0,7,'2024-04-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.373615','-76.160989',0,0,1,0,'published','approved','2024-01-19 18:34:07','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(37,'Support Engineer (Enterprise Support Japanese)','Est illum nostrum facere autem voluptatem voluptatibus. Repellat quam sint aperiam et vel voluptatem voluptatum non. Veritatis ut vitae beatae esse.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,2,2,2,0,2,9800.00,19400.00,'yearly',1,5,4,2,80,0,7,'2024-04-04',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.631115','-76.33928',0,0,0,0,'published','approved','2024-03-03 22:48:26','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(38,'Technical Partner Manager','Commodi officia sunt ratione quia. Exercitationem autem rerum officia eum nihil. Omnis assumenda laborum veniam quaerat eius aperiam accusamus quibusdam.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,4,8600.00,17400.00,'yearly',1,8,4,3,19,0,5,'2024-03-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.373615','-76.160989',0,0,0,1,'published','approved','2024-03-06 09:10:10','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(39,'Sr Manager, Inside Account Management','Error recusandae possimus exercitationem soluta accusantium et aliquid in. Ipsum laudantium quia quae. Sed nesciunt consequatur repellendus necessitatibus asperiores eum eaque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,3,3,3,0,5,1700.00,3100.00,'yearly',0,7,1,2,17,0,8,'2024-03-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.265032','-75.443439',0,0,1,0,'published','approved','2024-01-29 22:21:31','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(40,'Services Sales Representative','Consequatur saepe perferendis non corrupti et. Tenetur aut dolores sit vero est qui. Dolor voluptate laboriosam culpa vero eius quibusdam.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,1,7800.00,11200.00,'daily',1,5,4,3,9,0,7,'2024-03-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.12397','-75.095898',0,0,0,1,'published','approved','2024-02-19 03:32:48','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(41,'Services Delivery Manager','Ullam incidunt doloribus atque suscipit tempora quo. Cupiditate minima voluptatum autem. Earum libero voluptatem ea sunt.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,5,5,5,0,4,7000.00,15800.00,'daily',1,8,1,3,42,0,3,'2024-05-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.798334','-76.439565',0,0,1,0,'published','approved','2024-02-02 14:52:42','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(42,'Senior Solutions Engineer','Veniam dignissimos minima tempore aut maxime. Modi porro esse nostrum earum. Sunt a optio aliquid corporis aperiam at. Id occaecati est nostrum velit mollitia et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,4,4,4,0,3,6700.00,13400.00,'monthly',0,2,2,4,71,0,3,'2024-04-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.868182','-74.908008',0,0,0,1,'published','approved','2024-02-26 14:01:20','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(43,'Senior Service Delivery Engineer','Voluptas laudantium ipsa sed ducimus harum doloribus. Dicta id non omnis dolorum. Aspernatur dolorem veniam repellendus cum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,3,3,3,0,2,3100.00,6000.00,'weekly',0,7,4,5,56,0,5,'2024-04-14',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.542114','-75.610731',0,0,0,0,'published','approved','2024-01-13 13:55:06','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(44,'Senior Director, Global Sales Development','Accusantium earum ut repellendus veniam. Voluptatibus aspernatur optio est rerum rerum. Dolorum id et omnis quia ipsa ut cumque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,3,3,3,0,1,5100.00,9700.00,'weekly',0,9,4,1,55,0,10,'2024-04-17',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.542114','-75.610731',0,0,1,0,'published','approved','2024-02-22 19:36:56','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(45,'Partner Program Manager','Dolores autem nesciunt ut saepe et vero. Quam alias perspiciatis vel et. Possimus et dolores veniam doloremque nihil. Tenetur ut nisi numquam aspernatur enim provident quam.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,6,6,6,0,2,500.00,7500.00,'hourly',1,5,1,2,114,0,7,'2024-04-10',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.626193','-74.971701',0,0,0,0,'published','approved','2024-02-24 12:23:49','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(46,'Principal Cloud Solutions Engineer','In explicabo et placeat. Et totam molestiae veniam nulla quaerat nisi. Ipsa atque itaque corrupti aspernatur veritatis. Doloremque ab at voluptate error quia debitis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,5,5,5,0,4,8700.00,17800.00,'hourly',1,5,4,3,64,0,9,'2024-04-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.73782','-75.32745',0,0,1,1,'published','approved','2024-02-13 16:09:46','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(47,'Senior Cloud Solutions Engineer','Est itaque magnam quibusdam enim. Voluptatem dignissimos officiis consequatur natus. Soluta ipsum sed non doloribus quibusdam qui iste.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,5,5,5,0,4,2900.00,8600.00,'yearly',1,10,1,2,87,0,3,'2024-04-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.961914','-75.039421',0,0,0,1,'published','approved','2024-02-27 12:06:15','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(48,'Senior Customer Success Manager','Nihil officiis in libero consectetur et dolor aspernatur. Adipisci ut repellendus iure doloremque eaque nihil. Quo nemo repellendus eveniet perferendis et voluptas fuga.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,3,3,3,0,4,3600.00,7700.00,'daily',1,8,4,2,25,0,3,'2024-05-05',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.065259','-75.082922',0,0,0,0,'published','approved','2024-02-23 20:59:26','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(49,'Inside Account Manager','Molestiae veniam ratione est qui magni excepturi. Dolorum aut sit et quo pariatur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,6,6,6,0,1,7100.00,16600.00,'hourly',1,3,2,5,141,0,9,'2024-04-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.670332','-76.547574',0,0,0,1,'published','approved','2024-01-25 23:30:36','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(50,'UX Jobs Board','Dolore et voluptates nulla aliquid molestiae sit. Asperiores mollitia dolor fuga placeat. Dignissimos aut in aut sit est. Dignissimos ut architecto ratione sapiente.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,3,3,3,0,5,7100.00,9900.00,'weekly',0,4,2,4,98,0,4,'2024-04-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.542114','-75.610731',0,0,0,0,'published','approved','2024-01-30 10:58:37','2024-03-11 00:36:10',NULL,NULL,NULL,NULL),(51,'Senior Laravel Developer (TALL Stack)','Ea dignissimos aliquid deleniti voluptatum vero. Repellat aut voluptatem distinctio fugit repellendus. Porro rerum rerum est corporis aut temporibus nisi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,5,9000.00,16300.00,'yearly',0,6,2,1,136,0,7,'2024-04-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.373615','-76.160989',0,0,1,0,'published','approved','2024-02-16 15:20:06','2024-03-11 00:36:10',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_categories`
--

DROP TABLE IF EXISTS `jb_jobs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_categories` (
  `job_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_categories`
--

LOCK TABLES `jb_jobs_categories` WRITE;
/*!40000 ALTER TABLE `jb_jobs_categories` DISABLE KEYS */;
INSERT INTO `jb_jobs_categories` VALUES (1,1),(1,5),(1,9),(2,1),(2,4),(2,8),(3,1),(3,3),(3,9),(4,1),(4,2),(4,7),(5,1),(5,5),(5,6),(6,1),(6,2),(6,10),(7,1),(7,3),(7,7),(8,1),(8,2),(8,10),(9,1),(9,2),(9,8),(10,1),(10,4),(10,6),(11,1),(11,5),(11,8),(12,1),(12,3),(12,7),(13,1),(13,2),(13,6),(14,1),(14,3),(14,8),(15,1),(15,5),(15,9),(16,1),(16,2),(16,7),(17,1),(17,5),(17,8),(18,1),(18,5),(18,8),(19,1),(19,4),(19,7),(20,1),(20,4),(20,10),(21,1),(21,5),(21,10),(22,1),(22,4),(22,8),(23,1),(23,2),(23,8),(24,1),(24,5),(24,9),(25,1),(25,2),(25,6),(26,1),(26,5),(26,10),(27,1),(27,4),(27,10),(28,1),(28,5),(28,10),(29,1),(29,2),(29,10),(30,1),(30,3),(30,9),(31,1),(31,2),(31,9),(32,1),(32,5),(32,6),(33,1),(33,3),(33,10),(34,1),(34,4),(34,10),(35,1),(35,5),(35,7),(36,1),(36,5),(36,7),(37,1),(37,5),(37,9),(38,1),(38,3),(38,6),(39,1),(39,4),(39,6),(40,1),(40,3),(40,6),(41,1),(41,5),(41,7),(42,1),(42,2),(42,8),(43,1),(43,4),(43,7),(44,1),(44,2),(44,6),(45,1),(45,3),(45,9),(46,1),(46,3),(46,10),(47,1),(47,3),(47,9),(48,1),(48,2),(48,9),(49,1),(49,3),(49,7),(50,1),(50,4),(50,10),(51,1),(51,3),(51,9);
/*!40000 ALTER TABLE `jb_jobs_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_skills`
--

DROP TABLE IF EXISTS `jb_jobs_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_skills` (
  `job_id` bigint unsigned NOT NULL,
  `job_skill_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_skills`
--

LOCK TABLES `jb_jobs_skills` WRITE;
/*!40000 ALTER TABLE `jb_jobs_skills` DISABLE KEYS */;
INSERT INTO `jb_jobs_skills` VALUES (1,7),(2,1),(3,9),(4,3),(5,7),(6,3),(7,2),(8,6),(9,3),(10,6),(11,8),(12,1),(13,3),(14,3),(15,1),(16,8),(17,4),(18,7),(19,5),(20,8),(21,6),(22,4),(23,4),(24,4),(25,8),(26,1),(27,1),(28,5),(29,7),(30,3),(31,7),(32,2),(33,4),(34,7),(35,7),(36,8),(37,5),(38,4),(39,2),(40,9),(41,1),(42,8),(43,3),(44,5),(45,5),(46,7),(47,5),(48,7),(49,3),(50,2),(51,1);
/*!40000 ALTER TABLE `jb_jobs_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_tags`
--

DROP TABLE IF EXISTS `jb_jobs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_tags` (
  `job_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`job_id`,`tag_id`),
  KEY `jb_jobs_tags_job_id_index` (`job_id`),
  KEY `jb_jobs_tags_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_tags`
--

LOCK TABLES `jb_jobs_tags` WRITE;
/*!40000 ALTER TABLE `jb_jobs_tags` DISABLE KEYS */;
INSERT INTO `jb_jobs_tags` VALUES (1,3),(1,5),(2,3),(2,8),(3,4),(3,6),(4,2),(4,5),(5,2),(5,5),(6,2),(6,6),(7,4),(7,7),(8,2),(8,8),(9,3),(9,7),(10,1),(10,8),(11,1),(11,6),(12,2),(12,7),(13,1),(13,8),(14,1),(14,6),(15,2),(15,7),(16,2),(16,8),(17,3),(17,6),(18,1),(18,7),(19,3),(19,6),(20,4),(20,6),(21,4),(21,6),(22,4),(22,7),(23,3),(23,6),(24,1),(24,7),(25,2),(25,7),(26,4),(26,7),(27,1),(27,5),(28,2),(28,8),(29,1),(29,8),(30,3),(30,7),(31,4),(31,6),(32,4),(32,6),(33,3),(33,5),(34,2),(34,6),(35,2),(35,6),(36,2),(36,8),(37,3),(37,5),(38,1),(38,5),(39,2),(39,6),(40,4),(40,7),(41,1),(41,5),(42,3),(42,6),(43,2),(43,8),(44,3),(44,5),(45,1),(45,6),(46,1),(46,8),(47,1),(47,6),(48,3),(48,8),(49,3),(49,6),(50,4),(50,6),(51,2),(51,6);
/*!40000 ALTER TABLE `jb_jobs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_translations`
--

DROP TABLE IF EXISTS `jb_jobs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_jobs_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`jb_jobs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_translations`
--

LOCK TABLES `jb_jobs_translations` WRITE;
/*!40000 ALTER TABLE `jb_jobs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_jobs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_types`
--

DROP TABLE IF EXISTS `jb_jobs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_types` (
  `job_id` bigint unsigned NOT NULL,
  `job_type_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_types`
--

LOCK TABLES `jb_jobs_types` WRITE;
/*!40000 ALTER TABLE `jb_jobs_types` DISABLE KEYS */;
INSERT INTO `jb_jobs_types` VALUES (1,4),(2,4),(3,4),(4,2),(5,3),(6,4),(7,3),(8,5),(9,4),(10,3),(11,3),(12,4),(13,5),(14,1),(15,5),(16,1),(17,2),(18,2),(19,3),(20,3),(21,5),(22,4),(23,2),(24,4),(25,5),(26,5),(27,2),(28,4),(29,1),(30,1),(31,2),(32,3),(33,2),(34,1),(35,5),(36,3),(37,2),(38,3),(39,3),(40,2),(41,1),(42,2),(43,2),(44,4),(45,3),(46,1),(47,5),(48,3),(49,3),(50,4),(51,4);
/*!40000 ALTER TABLE `jb_jobs_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels`
--

DROP TABLE IF EXISTS `jb_language_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels`
--

LOCK TABLES `jb_language_levels` WRITE;
/*!40000 ALTER TABLE `jb_language_levels` DISABLE KEYS */;
INSERT INTO `jb_language_levels` VALUES (1,'Expert',0,0,'published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(2,'Intermediate',0,0,'published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(3,'Beginner',0,0,'published','2024-03-11 00:36:09','2024-03-11 00:36:09');
/*!40000 ALTER TABLE `jb_language_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels_translations`
--

DROP TABLE IF EXISTS `jb_language_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_language_levels_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_language_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels_translations`
--

LOCK TABLES `jb_language_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_language_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_language_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_major_subjects`
--

DROP TABLE IF EXISTS `jb_major_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_major_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_major_subjects`
--

LOCK TABLES `jb_major_subjects` WRITE;
/*!40000 ALTER TABLE `jb_major_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_major_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages`
--

DROP TABLE IF EXISTS `jb_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `account_limit` int unsigned DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages`
--

LOCK TABLES `jb_packages` WRITE;
/*!40000 ALTER TABLE `jb_packages` DISABLE KEYS */;
INSERT INTO `jb_packages` VALUES (1,'Free First Post',0.00,1,0,1,0,1,0,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(2,'Single Post',250.00,1,0,1,0,NULL,1,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(3,'5 Posts',1000.00,1,20,5,0,NULL,0,'published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL);
/*!40000 ALTER TABLE `jb_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages_translations`
--

DROP TABLE IF EXISTS `jb_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages_translations`
--

LOCK TABLES `jb_packages_translations` WRITE;
/*!40000 ALTER TABLE `jb_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_reviews`
--

DROP TABLE IF EXISTS `jb_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reviewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_id` bigint unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`reviewable_id`,`reviewable_type`,`created_by_id`,`created_by_type`),
  KEY `jb_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `jb_reviews_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  KEY `jb_reviews_reviewable_id_reviewable_type_status_index` (`reviewable_id`,`reviewable_type`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_reviews`
--

LOCK TABLES `jb_reviews` WRITE;
/*!40000 ALTER TABLE `jb_reviews` DISABLE KEYS */;
INSERT INTO `jb_reviews` VALUES (1,'Botble\\JobBoard\\Models\\Account',51,'Botble\\JobBoard\\Models\\Company',5,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(2,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',97,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(3,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',2,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(4,'Botble\\JobBoard\\Models\\Account',30,'Botble\\JobBoard\\Models\\Company',8,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(5,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',70,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(6,'Botble\\JobBoard\\Models\\Account',48,'Botble\\JobBoard\\Models\\Company',4,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(7,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',54,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(8,'Botble\\JobBoard\\Models\\Account',60,'Botble\\JobBoard\\Models\\Company',8,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(9,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',69,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(10,'Botble\\JobBoard\\Models\\Account',99,'Botble\\JobBoard\\Models\\Company',10,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(11,'Botble\\JobBoard\\Models\\Account',28,'Botble\\JobBoard\\Models\\Company',2,3.00,'Best ecommerce CMS online store!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(12,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',29,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(13,'Botble\\JobBoard\\Models\\Account',67,'Botble\\JobBoard\\Models\\Company',3,4.00,'Clean & perfect source code','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(14,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',91,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(15,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',20,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(16,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',40,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(17,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',31,3.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(18,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',18,2.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(19,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',68,5.00,'Best ecommerce CMS online store!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(20,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',59,1.00,'Good app, good backup service and support. Good documentation.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(21,'Botble\\JobBoard\\Models\\Account',94,'Botble\\JobBoard\\Models\\Company',5,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(22,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',38,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(23,'Botble\\JobBoard\\Models\\Account',42,'Botble\\JobBoard\\Models\\Company',8,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(24,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',2,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(25,'Botble\\JobBoard\\Models\\Account',90,'Botble\\JobBoard\\Models\\Company',16,4.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(26,'Botble\\JobBoard\\Models\\Account',19,'Botble\\JobBoard\\Models\\Company',3,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(27,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',88,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(28,'Botble\\JobBoard\\Models\\Account',52,'Botble\\JobBoard\\Models\\Company',16,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(29,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',85,1.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(30,'Botble\\JobBoard\\Models\\Account',91,'Botble\\JobBoard\\Models\\Company',17,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(31,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',77,1.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(32,'Botble\\JobBoard\\Models\\Account',86,'Botble\\JobBoard\\Models\\Company',7,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(33,'Botble\\JobBoard\\Models\\Account',13,'Botble\\JobBoard\\Models\\Company',17,2.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(34,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',63,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(35,'Botble\\JobBoard\\Models\\Account',79,'Botble\\JobBoard\\Models\\Company',19,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(36,'Botble\\JobBoard\\Models\\Account',65,'Botble\\JobBoard\\Models\\Company',17,1.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(37,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',33,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(38,'Botble\\JobBoard\\Models\\Company',17,'Botble\\JobBoard\\Models\\Account',11,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(39,'Botble\\JobBoard\\Models\\Account',55,'Botble\\JobBoard\\Models\\Company',5,1.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(40,'Botble\\JobBoard\\Models\\Account',54,'Botble\\JobBoard\\Models\\Company',16,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(41,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',71,4.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(42,'Botble\\JobBoard\\Models\\Company',13,'Botble\\JobBoard\\Models\\Account',44,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(43,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',62,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(44,'Botble\\JobBoard\\Models\\Account',99,'Botble\\JobBoard\\Models\\Company',3,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(45,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',59,2.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(46,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',20,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(47,'Botble\\JobBoard\\Models\\Account',39,'Botble\\JobBoard\\Models\\Company',17,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(48,'Botble\\JobBoard\\Models\\Account',35,'Botble\\JobBoard\\Models\\Company',18,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(49,'Botble\\JobBoard\\Models\\Account',6,'Botble\\JobBoard\\Models\\Company',5,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(50,'Botble\\JobBoard\\Models\\Account',86,'Botble\\JobBoard\\Models\\Company',3,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(51,'Botble\\JobBoard\\Models\\Account',20,'Botble\\JobBoard\\Models\\Company',14,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(52,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',81,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(53,'Botble\\JobBoard\\Models\\Account',56,'Botble\\JobBoard\\Models\\Company',9,1.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(54,'Botble\\JobBoard\\Models\\Account',19,'Botble\\JobBoard\\Models\\Company',16,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(55,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',82,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(56,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',56,3.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(57,'Botble\\JobBoard\\Models\\Account',33,'Botble\\JobBoard\\Models\\Company',1,4.00,'Clean & perfect source code','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(58,'Botble\\JobBoard\\Models\\Account',34,'Botble\\JobBoard\\Models\\Company',5,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(59,'Botble\\JobBoard\\Models\\Account',92,'Botble\\JobBoard\\Models\\Company',19,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(60,'Botble\\JobBoard\\Models\\Account',6,'Botble\\JobBoard\\Models\\Company',11,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(61,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',48,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(62,'Botble\\JobBoard\\Models\\Account',30,'Botble\\JobBoard\\Models\\Company',11,4.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(63,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',90,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(64,'Botble\\JobBoard\\Models\\Account',14,'Botble\\JobBoard\\Models\\Company',18,1.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(65,'Botble\\JobBoard\\Models\\Account',85,'Botble\\JobBoard\\Models\\Company',15,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(66,'Botble\\JobBoard\\Models\\Account',8,'Botble\\JobBoard\\Models\\Company',11,2.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(67,'Botble\\JobBoard\\Models\\Account',97,'Botble\\JobBoard\\Models\\Company',4,1.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(68,'Botble\\JobBoard\\Models\\Account',53,'Botble\\JobBoard\\Models\\Company',11,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(69,'Botble\\JobBoard\\Models\\Account',86,'Botble\\JobBoard\\Models\\Company',16,1.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(70,'Botble\\JobBoard\\Models\\Account',37,'Botble\\JobBoard\\Models\\Company',16,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(71,'Botble\\JobBoard\\Models\\Account',11,'Botble\\JobBoard\\Models\\Company',7,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(72,'Botble\\JobBoard\\Models\\Account',67,'Botble\\JobBoard\\Models\\Company',9,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(73,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',38,2.00,'Good app, good backup service and support. Good documentation.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(74,'Botble\\JobBoard\\Models\\Account',41,'Botble\\JobBoard\\Models\\Company',1,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(75,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',75,4.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(76,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',20,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(77,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',75,2.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(78,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',44,1.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(79,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',53,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(80,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',10,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(81,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',1,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(82,'Botble\\JobBoard\\Models\\Account',8,'Botble\\JobBoard\\Models\\Company',4,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(83,'Botble\\JobBoard\\Models\\Account',55,'Botble\\JobBoard\\Models\\Company',12,1.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(84,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',83,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(85,'Botble\\JobBoard\\Models\\Account',32,'Botble\\JobBoard\\Models\\Company',20,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(86,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',4,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(88,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',21,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(89,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',98,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(90,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',15,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(91,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',94,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(92,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',86,1.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(94,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',54,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(95,'Botble\\JobBoard\\Models\\Account',18,'Botble\\JobBoard\\Models\\Company',5,1.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(96,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',68,2.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(97,'Botble\\JobBoard\\Models\\Account',26,'Botble\\JobBoard\\Models\\Company',19,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(98,'Botble\\JobBoard\\Models\\Account',19,'Botble\\JobBoard\\Models\\Company',17,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(99,'Botble\\JobBoard\\Models\\Account',23,'Botble\\JobBoard\\Models\\Company',13,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(100,'Botble\\JobBoard\\Models\\Account',17,'Botble\\JobBoard\\Models\\Company',1,1.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `jb_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_saved_jobs`
--

DROP TABLE IF EXISTS `jb_saved_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_saved_jobs` (
  `account_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_saved_jobs`
--

LOCK TABLES `jb_saved_jobs` WRITE;
/*!40000 ALTER TABLE `jb_saved_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_saved_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags`
--

DROP TABLE IF EXISTS `jb_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags`
--

LOCK TABLES `jb_tags` WRITE;
/*!40000 ALTER TABLE `jb_tags` DISABLE KEYS */;
INSERT INTO `jb_tags` VALUES (1,'Illustrator','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(2,'Adobe XD','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(3,'Figma','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(4,'Sketch','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(5,'Lunacy','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(6,'PHP','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(7,'Python','','published','2024-03-11 00:36:09','2024-03-11 00:36:09'),(8,'JavaScript','','published','2024-03-11 00:36:09','2024-03-11 00:36:09');
/*!40000 ALTER TABLE `jb_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags_translations`
--

DROP TABLE IF EXISTS `jb_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags_translations`
--

LOCK TABLES `jb_tags_translations` WRITE;
/*!40000 ALTER TABLE `jb_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_transactions`
--

DROP TABLE IF EXISTS `jb_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_transactions`
--

LOCK TABLES `jb_transactions` WRITE;
/*!40000 ALTER TABLE `jb_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','2a3758e232c40c506faf9c2628597614',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','5c3cd8a76ec68f71a13320fc009c6519',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','981280af7ca592ae57e739ad2dd9b9e0',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','6c66da3d7fe1442cc30b0d46b8c80ac6',3,'Botble\\Menu\\Models\\Menu'),(5,'en_US','675e9f7c9b9c2773555fbdf757e05bcb',4,'Botble\\Menu\\Models\\Menu'),(6,'en_US','114e6c0d9ee004912e4ad02d9c728775',5,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (41,0,'acer','acer',3,'image/png',285,'our-partners/acer.png','[]','2024-03-11 00:36:03','2024-03-11 00:36:03',NULL),(42,0,'asus','asus',3,'image/png',314,'our-partners/asus.png','[]','2024-03-11 00:36:03','2024-03-11 00:36:03',NULL),(43,0,'dell','dell',3,'image/png',296,'our-partners/dell.png','[]','2024-03-11 00:36:03','2024-03-11 00:36:03',NULL),(44,0,'microsoft','microsoft',3,'image/png',287,'our-partners/microsoft.png','[]','2024-03-11 00:36:03','2024-03-11 00:36:03',NULL),(45,0,'nokia','nokia',3,'image/png',308,'our-partners/nokia.png','[]','2024-03-11 00:36:03','2024-03-11 00:36:03',NULL),(46,0,'1','1',4,'image/jpeg',9803,'news/1.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(47,0,'10','10',4,'image/jpeg',9803,'news/10.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(48,0,'11','11',4,'image/jpeg',9803,'news/11.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(49,0,'12','12',4,'image/jpeg',9803,'news/12.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(50,0,'13','13',4,'image/jpeg',9803,'news/13.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(51,0,'14','14',4,'image/jpeg',9803,'news/14.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(52,0,'15','15',4,'image/jpeg',9803,'news/15.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(53,0,'16','16',4,'image/jpeg',9803,'news/16.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(54,0,'2','2',4,'image/jpeg',9803,'news/2.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(55,0,'3','3',4,'image/jpeg',9803,'news/3.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(56,0,'4','4',4,'image/jpeg',9803,'news/4.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(57,0,'5','5',4,'image/jpeg',9803,'news/5.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(58,0,'6','6',4,'image/jpeg',9803,'news/6.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(59,0,'7','7',4,'image/jpeg',9803,'news/7.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(60,0,'8','8',4,'image/jpeg',9803,'news/8.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(61,0,'9','9',4,'image/jpeg',9803,'news/9.jpg','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(62,0,'cover-image1','cover-image1',4,'image/png',9803,'news/cover-image1.png','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(63,0,'cover-image2','cover-image2',4,'image/png',9803,'news/cover-image2.png','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(64,0,'cover-image3','cover-image3',4,'image/png',9803,'news/cover-image3.png','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(65,0,'img-news1','img-news1',4,'image/png',9803,'news/img-news1.png','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(66,0,'img-news2','img-news2',4,'image/png',9803,'news/img-news2.png','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(67,0,'img-news3','img-news3',4,'image/png',9803,'news/img-news3.png','[]','2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(68,0,'1','1',5,'image/jpeg',6977,'galleries/1.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(69,0,'10','10',5,'image/jpeg',9803,'galleries/10.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(70,0,'2','2',5,'image/jpeg',6977,'galleries/2.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(71,0,'3','3',5,'image/jpeg',6977,'galleries/3.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(72,0,'4','4',5,'image/jpeg',6977,'galleries/4.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(73,0,'5','5',5,'image/jpeg',6977,'galleries/5.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(74,0,'6','6',5,'image/jpeg',6977,'galleries/6.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(75,0,'7','7',5,'image/jpeg',6977,'galleries/7.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(76,0,'8','8',5,'image/jpeg',9803,'galleries/8.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(77,0,'9','9',5,'image/jpeg',9803,'galleries/9.jpg','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(78,0,'widget-banner','widget-banner',6,'image/png',11079,'widgets/widget-banner.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(79,0,'404','404',7,'image/png',10947,'general/404.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(80,0,'android','android',7,'image/png',477,'general/android.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(81,0,'app-store','app-store',7,'image/png',477,'general/app-store.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(82,0,'content','content',7,'image/png',1692,'general/content.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(83,0,'cover-image','cover-image',7,'image/png',8992,'general/cover-image.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(84,0,'customer','customer',7,'image/png',2810,'general/customer.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(85,0,'favicon','favicon',7,'image/png',706,'general/favicon.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(86,0,'finance','finance',7,'image/png',2460,'general/finance.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(87,0,'human','human',7,'image/png',2359,'general/human.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(88,0,'img-about2','img-about2',7,'image/png',36911,'general/img-about2.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(89,0,'lightning','lightning',7,'image/png',2768,'general/lightning.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(90,0,'logo-company','logo-company',7,'image/png',3166,'general/logo-company.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(91,0,'logo-light','logo-light',7,'image/png',2352,'general/logo-light.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(92,0,'logo','logo',7,'image/png',2459,'general/logo.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(93,0,'management','management',7,'image/png',1915,'general/management.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(94,0,'marketing','marketing',7,'image/png',2134,'general/marketing.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(95,0,'newsletter-background-image','newsletter-background-image',7,'image/png',9830,'general/newsletter-background-image.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(96,0,'newsletter-image-left','newsletter-image-left',7,'image/png',4177,'general/newsletter-image-left.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(97,0,'newsletter-image-right','newsletter-image-right',7,'image/png',2886,'general/newsletter-image-right.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(98,0,'research','research',7,'image/png',3206,'general/research.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(99,0,'retail','retail',7,'image/png',2874,'general/retail.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(100,0,'security','security',7,'image/png',2986,'general/security.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(101,0,'img-1','img-1',8,'image/png',2377,'authentication/img-1.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(102,0,'img-2','img-2',8,'image/png',5009,'authentication/img-2.png','[]','2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(103,0,'background-cover-candidate','background-cover-candidate',9,'image/png',436821,'pages/background-cover-candidate.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(104,0,'background_breadcrumb','background_breadcrumb',9,'image/png',6111,'pages/background-breadcrumb.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(105,0,'banner-section-search-box','banner-section-search-box',9,'image/png',20501,'pages/banner-section-search-box.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(106,0,'banner1','banner1',9,'image/png',7381,'pages/banner1.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(107,0,'banner2','banner2',9,'image/png',4920,'pages/banner2.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(108,0,'banner3','banner3',9,'image/png',2472,'pages/banner3.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(109,0,'banner4','banner4',9,'image/png',1952,'pages/banner4.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(110,0,'banner5','banner5',9,'image/png',1545,'pages/banner5.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(111,0,'banner6','banner6',9,'image/png',1609,'pages/banner6.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(112,0,'bg-breadcrumb','bg-breadcrumb',9,'image/png',14250,'pages/bg-breadcrumb.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(113,0,'bg-cat','bg-cat',9,'image/png',60543,'pages/bg-cat.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(114,0,'bg-left-hiring','bg-left-hiring',9,'image/png',1631,'pages/bg-left-hiring.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(115,0,'bg-newsletter','bg-newsletter',9,'image/png',4587,'pages/bg-newsletter.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(116,0,'bg-right-hiring','bg-right-hiring',9,'image/png',3074,'pages/bg-right-hiring.png','[]','2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(117,0,'controlcard','controlcard',9,'image/png',7404,'pages/controlcard.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(118,0,'home-page-4-banner','home-page-4-banner',9,'image/png',7596,'pages/home-page-4-banner.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(119,0,'icon-bottom-banner','icon-bottom-banner',9,'image/png',274,'pages/icon-bottom-banner.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(120,0,'icon-top-banner','icon-top-banner',9,'image/png',362,'pages/icon-top-banner.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(121,0,'img-banner','img-banner',9,'image/png',10542,'pages/img-banner.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(122,0,'img-chart','img-chart',9,'image/png',7549,'pages/img-chart.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(123,0,'img-job-search','img-job-search',9,'image/png',35569,'pages/img-job-search.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(124,0,'img-profile','img-profile',9,'image/png',9177,'pages/img-profile.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(125,0,'img-single','img-single',9,'image/png',13060,'pages/img-single.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(126,0,'img1','img1',9,'image/png',10246,'pages/img1.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(127,0,'job-tools','job-tools',9,'image/png',2216,'pages/job-tools.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(128,0,'left-job-head','left-job-head',9,'image/png',14956,'pages/left-job-head.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(129,0,'newsletter-left','newsletter-left',9,'image/png',4177,'pages/newsletter-left.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(130,0,'newsletter-right','newsletter-right',9,'image/png',2886,'pages/newsletter-right.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(131,0,'planning-job','planning-job',9,'image/png',1623,'pages/planning-job.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(132,0,'right-job-head','right-job-head',9,'image/png',10955,'pages/right-job-head.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(133,0,'facebook','facebook',10,'image/png',795,'socials/facebook.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(134,0,'linkedin','linkedin',10,'image/png',804,'socials/linkedin.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(135,0,'twitter','twitter',10,'image/png',1029,'socials/twitter.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(136,0,'location1','location1',11,'image/png',5149,'locations/location1.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(137,0,'location2','location2',11,'image/png',5921,'locations/location2.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(138,0,'location3','location3',11,'image/png',5276,'locations/location3.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(139,0,'location4','location4',11,'image/png',5259,'locations/location4.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(140,0,'location5','location5',11,'image/png',5140,'locations/location5.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(141,0,'location6','location6',11,'image/png',4891,'locations/location6.png','[]','2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(142,0,'1','1',12,'image/png',407,'job-categories/1.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(143,0,'10','10',12,'image/png',407,'job-categories/10.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(144,0,'11','11',12,'image/png',407,'job-categories/11.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(145,0,'12','12',12,'image/png',407,'job-categories/12.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(146,0,'13','13',12,'image/png',407,'job-categories/13.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(147,0,'14','14',12,'image/png',407,'job-categories/14.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(148,0,'15','15',12,'image/png',407,'job-categories/15.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(149,0,'16','16',12,'image/png',407,'job-categories/16.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(150,0,'17','17',12,'image/png',407,'job-categories/17.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(151,0,'18','18',12,'image/png',407,'job-categories/18.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(152,0,'19','19',12,'image/png',407,'job-categories/19.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(153,0,'2','2',12,'image/png',407,'job-categories/2.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(154,0,'3','3',12,'image/png',407,'job-categories/3.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(155,0,'4','4',12,'image/png',407,'job-categories/4.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(156,0,'5','5',12,'image/png',407,'job-categories/5.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(157,0,'6','6',12,'image/png',407,'job-categories/6.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(158,0,'7','7',12,'image/png',407,'job-categories/7.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(159,0,'8','8',12,'image/png',407,'job-categories/8.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(160,0,'9','9',12,'image/png',407,'job-categories/9.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(161,0,'img-cover-1','img-cover-1',12,'image/png',33918,'job-categories/img-cover-1.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(162,0,'img-cover-2','img-cover-2',12,'image/png',33918,'job-categories/img-cover-2.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(163,0,'img-cover-3','img-cover-3',12,'image/png',33918,'job-categories/img-cover-3.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(164,0,'1','1',13,'image/png',598,'companies/1.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(165,0,'2','2',13,'image/png',598,'companies/2.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(166,0,'3','3',13,'image/png',598,'companies/3.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(167,0,'4','4',13,'image/png',598,'companies/4.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(168,0,'5','5',13,'image/png',598,'companies/5.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(169,0,'6','6',13,'image/png',598,'companies/6.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(170,0,'7','7',13,'image/png',598,'companies/7.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(171,0,'8','8',13,'image/png',598,'companies/8.png','[]','2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(172,0,'9','9',13,'image/png',598,'companies/9.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(173,0,'company-cover-image','company-cover-image',13,'image/png',8992,'companies/company-cover-image.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(174,0,'img1','img1',14,'image/png',5706,'jobs/img1.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(175,0,'img2','img2',14,'image/png',5706,'jobs/img2.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(176,0,'img3','img3',14,'image/png',5706,'jobs/img3.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(177,0,'img4','img4',14,'image/png',5706,'jobs/img4.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(178,0,'img5','img5',14,'image/png',5706,'jobs/img5.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(179,0,'img6','img6',14,'image/png',5706,'jobs/img6.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(180,0,'img7','img7',14,'image/png',5706,'jobs/img7.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(181,0,'img8','img8',14,'image/png',5706,'jobs/img8.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(182,0,'img9','img9',14,'image/png',5706,'jobs/img9.png','[]','2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(183,0,'01','01',15,'application/pdf',43496,'resume/01.pdf','[]','2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(184,0,'1','1',16,'image/png',3090,'avatars/1.png','[]','2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(185,0,'2','2',16,'image/png',2773,'avatars/2.png','[]','2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(186,0,'3','3',16,'image/png',2749,'avatars/3.png','[]','2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(187,0,'1','1',17,'image/png',395380,'covers/1.png','[]','2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(188,0,'2','2',17,'image/png',1308067,'covers/2.png','[]','2024-03-11 00:36:11','2024-03-11 00:36:11',NULL),(189,0,'3','3',17,'image/png',301502,'covers/3.png','[]','2024-03-11 00:36:11','2024-03-11 00:36:11',NULL),(190,0,'1','1',18,'image/png',4294,'teams/1.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(191,0,'2','2',18,'image/png',4294,'teams/2.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(192,0,'3','3',18,'image/png',4294,'teams/3.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(193,0,'4','4',18,'image/png',4294,'teams/4.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(194,0,'5','5',18,'image/png',4294,'teams/5.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(195,0,'6','6',18,'image/png',4294,'teams/6.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(196,0,'7','7',18,'image/png',4294,'teams/7.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(197,0,'8','8',18,'image/png',4294,'teams/8.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(198,0,'1','1',19,'image/png',3943,'testimonials/1.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(199,0,'2','2',19,'image/png',3943,'testimonials/2.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(200,0,'3','3',19,'image/png',3943,'testimonials/3.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(201,0,'4','4',19,'image/png',3943,'testimonials/4.png','[]','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (3,0,'our-partners',NULL,'our-partners',0,'2024-03-11 00:36:03','2024-03-11 00:36:03',NULL),(4,0,'news',NULL,'news',0,'2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(5,0,'galleries',NULL,'galleries',0,'2024-03-11 00:36:04','2024-03-11 00:36:04',NULL),(6,0,'widgets',NULL,'widgets',0,'2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(7,0,'general',NULL,'general',0,'2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(8,0,'authentication',NULL,'authentication',0,'2024-03-11 00:36:05','2024-03-11 00:36:05',NULL),(9,0,'pages',NULL,'pages',0,'2024-03-11 00:36:06','2024-03-11 00:36:06',NULL),(10,0,'socials',NULL,'socials',0,'2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(11,0,'locations',NULL,'locations',0,'2024-03-11 00:36:07','2024-03-11 00:36:07',NULL),(12,0,'job-categories',NULL,'job-categories',0,'2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(13,0,'companies',NULL,'companies',0,'2024-03-11 00:36:08','2024-03-11 00:36:08',NULL),(14,0,'jobs',NULL,'jobs',0,'2024-03-11 00:36:09','2024-03-11 00:36:09',NULL),(15,0,'resume',NULL,'resume',0,'2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(16,0,'avatars',NULL,'avatars',0,'2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(17,0,'covers',NULL,'covers',0,'2024-03-11 00:36:10','2024-03-11 00:36:10',NULL),(18,0,'teams',NULL,'teams',0,'2024-03-11 00:36:36','2024-03-11 00:36:36',NULL),(19,0,'testimonials',NULL,'testimonials',0,'2024-03-11 00:36:36','2024-03-11 00:36:36',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(2,1,1,1,'Botble\\Page\\Models\\Page','/homepage-1','fi fi-rr-home',1,'Home 1',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2','fi fi-rr-home',2,'Home 2',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3','fi fi-rr-home',3,'Home 3',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4','fi fi-rr-home',4,'Home 4',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(6,1,1,5,'Botble\\Page\\Models\\Page','/homepage-5','fi fi-rr-home',5,'Home 5',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(7,1,1,6,'Botble\\Page\\Models\\Page','/homepage-6','fi fi-rr-home',6,'Home 6',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(8,1,0,7,'Botble\\Page\\Models\\Page','/jobs',NULL,0,'Find a Job',NULL,'_self',1,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(9,1,8,NULL,NULL,'/jobs?layout=grid','fi fi-rr-briefcase',0,'Jobs Grid',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(10,1,8,NULL,NULL,'/jobs','fi fi-rr-briefcase',0,'Jobs List',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(11,1,8,NULL,NULL,'/jobs/ui-ux-designer-full-time','fi fi-rr-briefcase',0,'Job Details',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(12,1,8,NULL,NULL,'/jobs/full-stack-engineer','fi fi-rr-briefcase',0,'Job External',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(13,1,8,NULL,NULL,'/jobs/java-software-engineer','fi fi-rr-briefcase',0,'Job Hide Company',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(14,1,0,8,'Botble\\Page\\Models\\Page','/companies',NULL,0,'Companies',NULL,'_self',1,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(15,1,14,8,'Botble\\Page\\Models\\Page','/companies','fi fi-rr-briefcase',0,'Companies',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(16,1,14,NULL,NULL,'/companies/linkedin','fi fi-rr-info',0,'Company Details',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(17,1,0,9,'Botble\\Page\\Models\\Page','/candidates',NULL,0,'Candidates',NULL,'_self',1,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(18,1,17,9,'Botble\\Page\\Models\\Page','/candidates','fi fi-rr-user',0,'Candidates Grid',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(19,1,17,NULL,NULL,'/candidates/taurean','fi fi-rr-info',0,'Candidate Details',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(20,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(21,1,20,10,'Botble\\Page\\Models\\Page','/about-us','fi fi-rr-star',0,'About Us',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(22,1,20,11,'Botble\\Page\\Models\\Page','/pricing-plan','fi fi-rr-database',0,'Pricing Plan',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(23,1,20,12,'Botble\\Page\\Models\\Page','/contact','fi fi-rr-paper-plane',0,'Contact Us',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(24,1,20,NULL,NULL,'/register','fi fi-rr-user-add',0,'Register',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(25,1,20,NULL,NULL,'/login','fi fi-rr-fingerprint',0,'Sign in',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(26,1,20,NULL,NULL,'/password/request','fi fi-rr-settings',0,'Reset Password',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(27,1,0,13,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(28,1,27,13,'Botble\\Page\\Models\\Page','/blog','fi fi-rr-edit',0,'Blog Grid',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(29,1,27,NULL,NULL,'/blog/interview-question-why-dont-you-have-a-degree','fi fi-rr-document-signed',0,'Blog Single',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(30,2,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(31,2,0,NULL,NULL,'#',NULL,0,'Our Team',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(32,2,0,NULL,NULL,'#',NULL,0,'Products',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(33,2,0,12,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(34,3,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Feature',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(35,3,0,11,'Botble\\Page\\Models\\Page','/pricing-plan',NULL,0,'Pricing',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(36,3,0,NULL,NULL,'#',NULL,0,'Credit',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(37,3,0,15,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQ',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(38,4,0,NULL,NULL,'#',NULL,0,'iOS',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(39,4,0,NULL,NULL,'#',NULL,0,'Android',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(40,4,0,NULL,NULL,'#',NULL,0,'Microsoft',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(41,4,0,NULL,NULL,'#',NULL,0,'Desktop',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(42,5,0,14,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(43,5,0,17,'Botble\\Page\\Models\\Page','/terms',NULL,0,'Terms',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36'),(44,5,0,5,'Botble\\Page\\Models\\Page','/homepage-5',NULL,0,'FAQ',NULL,'_self',0,'2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(2,'Resources','resources','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(3,'Community','community','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(4,'Quick links','quick-links','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(5,'More','more','published','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',10,'Botble\\Page\\Models\\Page','2024-03-11 00:36:04','2024-03-11 00:36:04'),(2,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',12,'Botble\\Page\\Models\\Page','2024-03-11 00:36:04','2024-03-11 00:36:04'),(3,'cover_image','[\"news\\/cover-image1.png\"]',1,'Botble\\Blog\\Models\\Post','2024-03-11 00:36:04','2024-03-11 00:36:04'),(4,'cover_image','[\"news\\/cover-image2.png\"]',2,'Botble\\Blog\\Models\\Post','2024-03-11 00:36:04','2024-03-11 00:36:04'),(5,'cover_image','[\"news\\/cover-image3.png\"]',3,'Botble\\Blog\\Models\\Post','2024-03-11 00:36:04','2024-03-11 00:36:04'),(6,'icon_image','[\"general\\/content.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(7,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(8,'icon_image','[\"general\\/research.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(9,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(10,'icon_image','[\"general\\/marketing.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(11,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(12,'icon_image','[\"general\\/customer.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(13,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(14,'icon_image','[\"general\\/finance.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(15,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(16,'icon_image','[\"general\\/lightning.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(17,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(18,'icon_image','[\"general\\/human.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(19,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(20,'icon_image','[\"general\\/management.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(21,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(22,'icon_image','[\"general\\/retail.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(23,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(24,'icon_image','[\"general\\/security.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(25,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-03-11 00:36:08','2024-03-11 00:36:08'),(26,'cover_image','[\"companies\\/company-cover-image.png\"]',1,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(27,'cover_image','[\"companies\\/company-cover-image.png\"]',2,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(28,'cover_image','[\"companies\\/company-cover-image.png\"]',3,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(29,'cover_image','[\"companies\\/company-cover-image.png\"]',4,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(30,'cover_image','[\"companies\\/company-cover-image.png\"]',5,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(31,'cover_image','[\"companies\\/company-cover-image.png\"]',6,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(32,'cover_image','[\"companies\\/company-cover-image.png\"]',7,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(33,'cover_image','[\"companies\\/company-cover-image.png\"]',8,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(34,'cover_image','[\"companies\\/company-cover-image.png\"]',9,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(35,'cover_image','[\"companies\\/company-cover-image.png\"]',10,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(36,'cover_image','[\"companies\\/company-cover-image.png\"]',11,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(37,'cover_image','[\"companies\\/company-cover-image.png\"]',12,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(38,'cover_image','[\"companies\\/company-cover-image.png\"]',13,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(39,'cover_image','[\"companies\\/company-cover-image.png\"]',14,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(40,'cover_image','[\"companies\\/company-cover-image.png\"]',15,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(41,'cover_image','[\"companies\\/company-cover-image.png\"]',16,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(42,'cover_image','[\"companies\\/company-cover-image.png\"]',17,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(43,'cover_image','[\"companies\\/company-cover-image.png\"]',18,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(44,'cover_image','[\"companies\\/company-cover-image.png\"]',19,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(45,'cover_image','[\"companies\\/company-cover-image.png\"]',20,'Botble\\JobBoard\\Models\\Company','2024-03-11 00:36:09','2024-03-11 00:36:09'),(46,'featured_image','[\"jobs\\/img1.png\"]',1,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(47,'featured_image','[\"jobs\\/img2.png\"]',2,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(48,'featured_image','[\"jobs\\/img3.png\"]',3,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(49,'featured_image','[\"jobs\\/img4.png\"]',4,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(50,'featured_image','[\"jobs\\/img5.png\"]',5,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(51,'featured_image','[\"jobs\\/img6.png\"]',6,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(52,'featured_image','[\"jobs\\/img7.png\"]',7,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(53,'featured_image','[\"jobs\\/img8.png\"]',8,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(54,'featured_image','[\"jobs\\/img9.png\"]',9,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(55,'featured_image','[\"jobs\\/img7.png\"]',10,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(56,'featured_image','[\"jobs\\/img8.png\"]',11,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(57,'featured_image','[\"jobs\\/img8.png\"]',12,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(58,'featured_image','[\"jobs\\/img3.png\"]',13,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(59,'featured_image','[\"jobs\\/img9.png\"]',14,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(60,'featured_image','[\"jobs\\/img9.png\"]',15,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(61,'featured_image','[\"jobs\\/img8.png\"]',16,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(62,'featured_image','[\"jobs\\/img8.png\"]',17,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(63,'featured_image','[\"jobs\\/img8.png\"]',18,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(64,'featured_image','[\"jobs\\/img1.png\"]',19,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(65,'featured_image','[\"jobs\\/img3.png\"]',20,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:09','2024-03-11 00:36:09'),(66,'featured_image','[\"jobs\\/img6.png\"]',21,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(67,'featured_image','[\"jobs\\/img6.png\"]',22,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(68,'featured_image','[\"jobs\\/img2.png\"]',23,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(69,'featured_image','[\"jobs\\/img4.png\"]',24,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(70,'featured_image','[\"jobs\\/img2.png\"]',25,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(71,'featured_image','[\"jobs\\/img3.png\"]',26,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(72,'featured_image','[\"jobs\\/img6.png\"]',27,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(73,'featured_image','[\"jobs\\/img5.png\"]',28,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(74,'featured_image','[\"jobs\\/img9.png\"]',29,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(75,'featured_image','[\"jobs\\/img7.png\"]',30,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(76,'featured_image','[\"jobs\\/img8.png\"]',31,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(77,'featured_image','[\"jobs\\/img8.png\"]',32,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(78,'featured_image','[\"jobs\\/img7.png\"]',33,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(79,'featured_image','[\"jobs\\/img9.png\"]',34,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(80,'featured_image','[\"jobs\\/img9.png\"]',35,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(81,'featured_image','[\"jobs\\/img4.png\"]',36,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(82,'featured_image','[\"jobs\\/img2.png\"]',37,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(83,'featured_image','[\"jobs\\/img2.png\"]',38,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(84,'featured_image','[\"jobs\\/img4.png\"]',39,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(85,'featured_image','[\"jobs\\/img9.png\"]',40,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(86,'featured_image','[\"jobs\\/img1.png\"]',41,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(87,'featured_image','[\"jobs\\/img2.png\"]',42,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(88,'featured_image','[\"jobs\\/img8.png\"]',43,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(89,'featured_image','[\"jobs\\/img6.png\"]',44,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(90,'featured_image','[\"jobs\\/img7.png\"]',45,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(91,'featured_image','[\"jobs\\/img9.png\"]',46,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(92,'featured_image','[\"jobs\\/img7.png\"]',47,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(93,'featured_image','[\"jobs\\/img7.png\"]',48,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(94,'featured_image','[\"jobs\\/img7.png\"]',49,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(95,'featured_image','[\"jobs\\/img7.png\"]',50,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(96,'featured_image','[\"jobs\\/img9.png\"]',51,'Botble\\JobBoard\\Models\\Job','2024-03-11 00:36:10','2024-03-11 00:36:10'),(97,'cover_image','[\"covers\\/3.png\"]',1,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:11','2024-03-11 00:36:11'),(98,'cover_image','[\"covers\\/3.png\"]',2,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:11','2024-03-11 00:36:11'),(99,'cover_image','[\"covers\\/3.png\"]',3,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:11','2024-03-11 00:36:11'),(100,'cover_image','[\"covers\\/1.png\"]',4,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:12','2024-03-11 00:36:12'),(101,'cover_image','[\"covers\\/1.png\"]',5,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:12','2024-03-11 00:36:12'),(102,'cover_image','[\"covers\\/3.png\"]',6,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:12','2024-03-11 00:36:12'),(103,'cover_image','[\"covers\\/1.png\"]',7,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:12','2024-03-11 00:36:12'),(104,'cover_image','[\"covers\\/3.png\"]',8,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:13','2024-03-11 00:36:13'),(105,'cover_image','[\"covers\\/1.png\"]',9,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:13','2024-03-11 00:36:13'),(106,'cover_image','[\"covers\\/2.png\"]',10,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:13','2024-03-11 00:36:13'),(107,'cover_image','[\"covers\\/3.png\"]',11,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:13','2024-03-11 00:36:13'),(108,'cover_image','[\"covers\\/2.png\"]',12,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:14','2024-03-11 00:36:14'),(109,'cover_image','[\"covers\\/1.png\"]',13,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:14','2024-03-11 00:36:14'),(110,'cover_image','[\"covers\\/3.png\"]',14,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:14','2024-03-11 00:36:14'),(111,'cover_image','[\"covers\\/1.png\"]',15,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:14','2024-03-11 00:36:14'),(112,'cover_image','[\"covers\\/2.png\"]',16,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:15','2024-03-11 00:36:15'),(113,'cover_image','[\"covers\\/3.png\"]',17,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:15','2024-03-11 00:36:15'),(114,'cover_image','[\"covers\\/3.png\"]',18,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:15','2024-03-11 00:36:15'),(115,'cover_image','[\"covers\\/1.png\"]',19,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:15','2024-03-11 00:36:15'),(116,'cover_image','[\"covers\\/1.png\"]',20,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:16','2024-03-11 00:36:16'),(117,'cover_image','[\"covers\\/2.png\"]',21,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:16','2024-03-11 00:36:16'),(118,'cover_image','[\"covers\\/2.png\"]',22,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:16','2024-03-11 00:36:16'),(119,'cover_image','[\"covers\\/2.png\"]',23,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:16','2024-03-11 00:36:16'),(120,'cover_image','[\"covers\\/3.png\"]',24,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:17','2024-03-11 00:36:17'),(121,'cover_image','[\"covers\\/2.png\"]',25,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:17','2024-03-11 00:36:17'),(122,'cover_image','[\"covers\\/1.png\"]',26,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:17','2024-03-11 00:36:17'),(123,'cover_image','[\"covers\\/2.png\"]',27,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:17','2024-03-11 00:36:17'),(124,'cover_image','[\"covers\\/1.png\"]',28,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:18','2024-03-11 00:36:18'),(125,'cover_image','[\"covers\\/1.png\"]',29,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:18','2024-03-11 00:36:18'),(126,'cover_image','[\"covers\\/3.png\"]',30,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:18','2024-03-11 00:36:18'),(127,'cover_image','[\"covers\\/2.png\"]',31,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:18','2024-03-11 00:36:18'),(128,'cover_image','[\"covers\\/3.png\"]',32,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:19','2024-03-11 00:36:19'),(129,'cover_image','[\"covers\\/1.png\"]',33,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:19','2024-03-11 00:36:19'),(130,'cover_image','[\"covers\\/2.png\"]',34,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:19','2024-03-11 00:36:19'),(131,'cover_image','[\"covers\\/1.png\"]',35,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:19','2024-03-11 00:36:19'),(132,'cover_image','[\"covers\\/3.png\"]',36,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:20','2024-03-11 00:36:20'),(133,'cover_image','[\"covers\\/2.png\"]',37,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:20','2024-03-11 00:36:20'),(134,'cover_image','[\"covers\\/3.png\"]',38,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:20','2024-03-11 00:36:20'),(135,'cover_image','[\"covers\\/2.png\"]',39,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:20','2024-03-11 00:36:20'),(136,'cover_image','[\"covers\\/1.png\"]',40,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:21','2024-03-11 00:36:21'),(137,'cover_image','[\"covers\\/3.png\"]',41,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:21','2024-03-11 00:36:21'),(138,'cover_image','[\"covers\\/2.png\"]',42,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:21','2024-03-11 00:36:21'),(139,'cover_image','[\"covers\\/3.png\"]',43,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:21','2024-03-11 00:36:21'),(140,'cover_image','[\"covers\\/1.png\"]',44,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:22','2024-03-11 00:36:22'),(141,'cover_image','[\"covers\\/3.png\"]',45,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:22','2024-03-11 00:36:22'),(142,'cover_image','[\"covers\\/1.png\"]',46,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:22','2024-03-11 00:36:22'),(143,'cover_image','[\"covers\\/2.png\"]',47,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:22','2024-03-11 00:36:22'),(144,'cover_image','[\"covers\\/3.png\"]',48,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:23','2024-03-11 00:36:23'),(145,'cover_image','[\"covers\\/1.png\"]',49,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:23','2024-03-11 00:36:23'),(146,'cover_image','[\"covers\\/2.png\"]',50,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:23','2024-03-11 00:36:23'),(147,'cover_image','[\"covers\\/3.png\"]',51,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:23','2024-03-11 00:36:23'),(148,'cover_image','[\"covers\\/1.png\"]',52,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:24','2024-03-11 00:36:24'),(149,'cover_image','[\"covers\\/2.png\"]',53,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:24','2024-03-11 00:36:24'),(150,'cover_image','[\"covers\\/2.png\"]',54,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:24','2024-03-11 00:36:24'),(151,'cover_image','[\"covers\\/2.png\"]',55,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:24','2024-03-11 00:36:24'),(152,'cover_image','[\"covers\\/2.png\"]',56,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:25','2024-03-11 00:36:25'),(153,'cover_image','[\"covers\\/3.png\"]',57,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:25','2024-03-11 00:36:25'),(154,'cover_image','[\"covers\\/1.png\"]',58,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:25','2024-03-11 00:36:25'),(155,'cover_image','[\"covers\\/1.png\"]',59,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:25','2024-03-11 00:36:25'),(156,'cover_image','[\"covers\\/2.png\"]',60,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:26','2024-03-11 00:36:26'),(157,'cover_image','[\"covers\\/3.png\"]',61,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:26','2024-03-11 00:36:26'),(158,'cover_image','[\"covers\\/3.png\"]',62,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:26','2024-03-11 00:36:26'),(159,'cover_image','[\"covers\\/3.png\"]',63,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:26','2024-03-11 00:36:26'),(160,'cover_image','[\"covers\\/1.png\"]',64,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:27','2024-03-11 00:36:27'),(161,'cover_image','[\"covers\\/1.png\"]',65,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:27','2024-03-11 00:36:27'),(162,'cover_image','[\"covers\\/3.png\"]',66,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:27','2024-03-11 00:36:27'),(163,'cover_image','[\"covers\\/3.png\"]',67,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:27','2024-03-11 00:36:27'),(164,'cover_image','[\"covers\\/3.png\"]',68,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:28','2024-03-11 00:36:28'),(165,'cover_image','[\"covers\\/2.png\"]',69,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:28','2024-03-11 00:36:28'),(166,'cover_image','[\"covers\\/1.png\"]',70,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:28','2024-03-11 00:36:28'),(167,'cover_image','[\"covers\\/1.png\"]',71,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:28','2024-03-11 00:36:28'),(168,'cover_image','[\"covers\\/3.png\"]',72,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:29','2024-03-11 00:36:29'),(169,'cover_image','[\"covers\\/1.png\"]',73,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:29','2024-03-11 00:36:29'),(170,'cover_image','[\"covers\\/3.png\"]',74,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:29','2024-03-11 00:36:29'),(171,'cover_image','[\"covers\\/3.png\"]',75,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:29','2024-03-11 00:36:29'),(172,'cover_image','[\"covers\\/3.png\"]',76,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:30','2024-03-11 00:36:30'),(173,'cover_image','[\"covers\\/1.png\"]',77,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:30','2024-03-11 00:36:30'),(174,'cover_image','[\"covers\\/2.png\"]',78,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:30','2024-03-11 00:36:30'),(175,'cover_image','[\"covers\\/3.png\"]',79,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:30','2024-03-11 00:36:30'),(176,'cover_image','[\"covers\\/1.png\"]',80,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:31','2024-03-11 00:36:31'),(177,'cover_image','[\"covers\\/2.png\"]',81,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:31','2024-03-11 00:36:31'),(178,'cover_image','[\"covers\\/3.png\"]',82,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:31','2024-03-11 00:36:31'),(179,'cover_image','[\"covers\\/1.png\"]',83,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:31','2024-03-11 00:36:31'),(180,'cover_image','[\"covers\\/2.png\"]',84,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:32','2024-03-11 00:36:32'),(181,'cover_image','[\"covers\\/1.png\"]',85,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:32','2024-03-11 00:36:32'),(182,'cover_image','[\"covers\\/3.png\"]',86,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:32','2024-03-11 00:36:32'),(183,'cover_image','[\"covers\\/1.png\"]',87,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:32','2024-03-11 00:36:32'),(184,'cover_image','[\"covers\\/3.png\"]',88,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:33','2024-03-11 00:36:33'),(185,'cover_image','[\"covers\\/1.png\"]',89,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:33','2024-03-11 00:36:33'),(186,'cover_image','[\"covers\\/1.png\"]',90,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:33','2024-03-11 00:36:33'),(187,'cover_image','[\"covers\\/1.png\"]',91,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:33','2024-03-11 00:36:33'),(188,'cover_image','[\"covers\\/3.png\"]',92,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:34','2024-03-11 00:36:34'),(189,'cover_image','[\"covers\\/2.png\"]',93,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:34','2024-03-11 00:36:34'),(190,'cover_image','[\"covers\\/3.png\"]',94,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:34','2024-03-11 00:36:34'),(191,'cover_image','[\"covers\\/1.png\"]',95,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:34','2024-03-11 00:36:34'),(192,'cover_image','[\"covers\\/3.png\"]',96,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:35','2024-03-11 00:36:35'),(193,'cover_image','[\"covers\\/2.png\"]',97,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:35','2024-03-11 00:36:35'),(194,'cover_image','[\"covers\\/1.png\"]',98,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:35','2024-03-11 00:36:35'),(195,'cover_image','[\"covers\\/1.png\"]',99,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:35','2024-03-11 00:36:35'),(196,'cover_image','[\"covers\\/1.png\"]',100,'Botble\\JobBoard\\Models\\Account','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_10_103353_fix_social_links',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_07_19_152743_migrate_old_city_state_image',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_06_100448_change_random_hash_for_media',1),(33,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(34,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(35,'2023_12_20_034718_update_invoice_amount',1),(36,'2015_06_29_025744_create_audit_history',2),(37,'2023_11_14_033417_change_request_column_in_table_audit_histories',2),(38,'2015_06_18_033822_create_blog_table',3),(39,'2021_02_16_092633_remove_default_value_for_author_type',3),(40,'2021_12_03_030600_create_blog_translations',3),(41,'2022_04_19_113923_add_index_to_table_posts',3),(42,'2023_08_29_074620_make_column_author_id_nullable',3),(43,'2016_06_17_091537_create_contacts_table',4),(44,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',4),(45,'2018_07_09_221238_create_faq_table',5),(46,'2021_12_03_082134_create_faq_translations',5),(47,'2023_11_17_063408_add_description_column_to_faq_categories_table',5),(48,'2016_10_13_150201_create_galleries_table',6),(49,'2021_12_03_082953_create_gallery_translations',6),(50,'2022_04_30_034048_create_gallery_meta_translations_table',6),(51,'2023_08_29_075308_make_column_user_id_nullable',6),(52,'2022_06_20_093259_create_job_board_tables',7),(53,'2022_09_12_061845_update_table_activity_logs',7),(54,'2022_09_13_042407_create_table_jb_jobs_types',7),(55,'2022_09_15_030017_update_jb_jobs_table',7),(56,'2022_09_15_094840_add_job_employer_colleagues',7),(57,'2022_09_27_000001_create_jb_invoices_tables',7),(58,'2022_09_30_144924_update_jobs_table',7),(59,'2022_10_04_085631_add_company_logo_to_jb_invoices',7),(60,'2022_10_10_030606_create_reviews_table',7),(61,'2022_11_09_065056_add_missing_jobs_page',7),(62,'2022_11_10_065056_add_columns_to_accounts',7),(63,'2022_11_16_034756_add_column_cover_letter_to_accounts',7),(64,'2022_11_29_304756_create_jb_account_favorite_skills_table',7),(65,'2022_11_29_304757_create_jb_account_favorite_tags',7),(66,'2022_12_26_304758_create_table_jb_experiences',7),(67,'2022_12_26_304759_create_table_jb_education',7),(68,'2023_01_31_023233_create_jb_custom_fields_table',7),(69,'2023_02_06_024257_add_package_translations',7),(70,'2023_02_08_062457_add_custom_fields_translation_table',7),(71,'2023_04_03_126927_add_parent_id_to_jb_categories_table',7),(72,'2023_05_04_000001_add_hide_cv_to_jb_accounts_table',7),(73,'2023_05_09_062031_unique_reviews_table',7),(74,'2023_05_13_180010_make_jb_reviews_table_morphable',7),(75,'2023_05_16_113126_fix_account_confirmed_at',7),(76,'2023_07_03_135746_add_zip_code_to_jb_jobs_table',7),(77,'2023_07_06_022808_create_jb_coupons_table',7),(78,'2023_07_14_045213_add_coupon_code_column_to_jb_invoices_table',7),(79,'2024_01_31_022842_add_description_to_jb_packages_table',7),(80,'2024_02_01_080657_add_tax_id_column_to_jb_companies_table',7),(81,'2016_10_03_032336_create_languages_table',8),(82,'2023_09_14_022423_add_index_for_language_table',8),(83,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(84,'2021_12_03_075608_create_page_translations',9),(85,'2023_07_06_011444_create_slug_translations_table',9),(86,'2019_11_18_061011_create_country_table',10),(87,'2021_12_03_084118_create_location_translations',10),(88,'2021_12_03_094518_migrate_old_location_data',10),(89,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',10),(90,'2022_01_16_085908_improve_plugin_location',10),(91,'2022_08_04_052122_delete_location_backup_tables',10),(92,'2023_04_23_061847_increase_state_translations_abbreviation_column',10),(93,'2023_07_26_041451_add_more_columns_to_location_table',10),(94,'2023_07_27_041451_add_more_columns_to_location_translation_table',10),(95,'2023_08_15_073307_drop_unique_in_states_cities_translations',10),(96,'2023_10_21_065016_make_state_id_in_table_cities_nullable',10),(97,'2017_10_24_154832_create_newsletter_table',11),(98,'2017_05_18_080441_create_payment_tables',12),(99,'2021_03_27_144913_add_customer_type_into_table_payments',12),(100,'2021_05_24_034720_make_column_currency_nullable',12),(101,'2021_08_09_161302_add_metadata_column_to_payments_table',12),(102,'2021_10_19_020859_update_metadata_field',12),(103,'2022_06_28_151901_activate_paypal_stripe_plugin',12),(104,'2022_07_07_153354_update_charge_id_in_table_payments',12),(105,'2022_11_02_092723_team_create_team_table',13),(106,'2023_08_11_094574_update_team_table',13),(107,'2023_11_30_085354_add_missing_description_to_team',13),(108,'2018_07_09_214610_create_testimonial_table',14),(109,'2021_12_03_083642_create_testimonials_translations',14),(110,'2016_10_07_193005_create_translations_table',15),(111,'2023_12_12_105220_drop_translations_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage 1','<div>[search-box title=\"The Easiest Way to Get Your New Job\" highlight_text=\"Easiest Way\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" icon_top_banner=\"pages/icon-top-banner.png\" banner_image_2=\"pages/banner2.png\" icon_bottom_banner=\"pages/icon-bottom-banner.png\" style=\"style-1\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\"][/apply-banner]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"4,9,1,3,5,7\" style=\"style-1\"][/job-of-the-day]</div><div>[job-grid title=\"Find The One That’s Right For You\" high_light_title_text=\"Right\" subtitle=\"Millions Of Jobs.\" description=\"Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over 600,000 companies worldwide. The right job is out there.\" image_job_1=\"pages/img-chart.png\" image_job_2=\"pages/controlcard.png\" image=\"pages/img1.png\" button_text=\"Search jobs\" button_url=\"#\" link_text=\"Learn more\" link_text_url=\"#\"][/job-grid]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\"][/top-companies]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"1,2,3,4,5,6\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-11 00:36:03','2024-03-11 00:36:03'),(2,'Homepage 2','<div>[search-box subtitle=\"We have 150,000+ live jobs\" title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" counter_title_1=\"Daily Jobs Posted\" counter_number_1=\"265\" counter_title_2=\"Recruiters\" counter_number_2=\"17\" counter_title_3=\"Freelancers\" counter_number_3=\"15\" counter_title_4=\"Blog Tips\" counter_number_4=\"28\" background_image=\"pages/banner-section-search-box.png\" style=\"style-2\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-2\"][/top-companies]</div><div>[advertisement-banner first_title=\"Job Tools Services\" first_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_first_content_text=\"Find Out More\" load_more_link_first_content=\"#\" image_of_first_content=\"pages/job-tools.png\" second_title=\"Planning a Job?\" second_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_second_content_text=\"Find Out More\" load_more_link_second_content=\"#\" image_of_second_content=\"pages/planning-job.png\"][/advertisement-banner]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(3,'Homepage 3','<div>[search-box title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" style=\"style-3\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-3\"][/job-of-the-day]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers and marketers in the tech industry.\" limit=\"8\" style=\"style-3\"][/top-candidates]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-3\"][/top-companies]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\" style=\"style-3\"][/apply-banner]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-3\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(4,'Homepage 4','<div>[search-box title=\"Get The Right Job You Deserve\" highlight_text=\"Right Job\" banner_image_1=\"pages/home-page-4-banner.png\" style=\"style-1\" trending_keywords=\"Designer, Web, IOS, Developer, PHP, Senior, Engineer\" background_color=\"#000\"][/search-box]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6,8,7\" style=\"style-3\"][/job-of-the-day]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\" limit_category=\"10\" background_image=\"pages/bg-cat.png\" style=\"style-2\"][/featured-job-categories]</div><div>[[testimonials title=\"See Some Words\" description=\"Thousands of employee get their ideal jobs and feed back to us!\" style=\"style-2\"][/testimonials]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(5,'Homepage 5','<div>[search-box title=\"Find Jobs, &#x3C;br&#x3E; Hire Creatives\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" banner_image_2=\"pages/banner2.png\" banner_image_3=\"pages/banner3.png\" banner_image_4=\"pages/banner4.png\" banner_image_5=\"pages/banner5.png\" banner_image_6=\"pages/banner6.png\" style=\"style-5\"][/search-box]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[popular-category title=\"Explore the Marketplace\" subtitle=\"Search and connect with the right candidates faster. Tell us what you’ve looking for and we’ll get to work for you.\" style=\"style-5\"][/popular-category]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply &#x3C;br&#x3E; discover which is right for you.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[how-it-works title=\"How It Works\" description=\"Just via some simple steps, you will find your ideal candidates you’r looking for!\" step_label_1=\"Register an &#x3C;br&#x3E; account to start\" step_help_1=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_2=\"Explore over &#x3C;br&#x3E; thousands of resumes\" step_help_2=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_3=\"Find the most &#x3C;br&#x3E; suitable candidate\" step_help_3=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" button_label=\"Get Started\" button_url=\"#\"][/how-it-works]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers &#x3C;br&#x3E; and marketers in the tech industry.\" limit=\"8\" style=\"style-5\"][/top-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(6,'Homepage 6','<div>[search-box title=\"There Are 102,256 Postings Here For you!\" highlight_text=\"102,256\" description=\"Find Jobs, Employment & Career Opportunities\" style=\"style-4\" trending_keywords=\"Design,Development,Manager,Senior,,\" background_color=\"#000\"][/search-box]</div><div>[gallery image_1=\"galleries/1.jpg\" image_2=\"galleries/2.jpg\" image_3=\"galleries/3.jpg\" image_4=\"galleries/4.jpg\" image_5=\"galleries/5.jpg\"][/gallery]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6\" style=\"style-2\"][/job-of-the-day]</div><div>[job-search-banner title=\"Job search for people passionate about startup\" background_image=\"pages/img-job-search.png\" checkbox_title_1=\"Create an account\" checkbox_description_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_2=\"Search for Jobs\" checkbox_description_2=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_3=\"Save & Apply\" checkbox_description_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\"][/job-search-banner]</div>',1,NULL,'homepage',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(7,'Jobs','<div>[search-box title=\"The official IT Jobs site\" highlight_text=\"IT Jobs\" description=\"“JobBox is our first stop whenever we\'re hiring a PHP role. We\'ve hired 10 PHP developers in the last few years, all thanks to JobBox.” — Andrew Hall, Elite JSC.\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[job-list max_salary_range=\"10000\"][/job-list]</div>',1,NULL,'default',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(8,'Companies','<div>[job-companies title=\"Browse Companies\" subtitle=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\"][/job-companies]</div>',1,NULL,'default',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(9,'Candidates','<div>[job-candidates title=\"Browse Candidates\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque &#x3C;br&#x3E; delectus molestias quis?\" number_per_page=\"9\" style=\"grid\"][/job-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'default',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(10,'About us','<div>[company-about title=\"About Our Company\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" title_box=\"What we can do?\" image=\"general/img-about2.png\" description_box=\"Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos.\" url=\"/\" text_button_box=\"Read more\"][/company-about]</div><div>[team title=\"About Our Company\" sub_title=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" description=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(11,'Pricing Plan','<div>[pricing-table title=\"Pricing Table\" subtitle=\"Choose The Best Plan That’s For You\" number_of_package=\"3\"][/pricing-table]</div><div>[faq title=\"Frequently Asked Questions\" subtitle=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus, blandit and cursus varius and magnis sapien\" number_of_faq=\"4\"][/faq]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'default',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(12,'Contact','<div>[company-information company_name=\"Jobbox Company\" logo_company=\"general/logo-company.png\" company_address=\"205 North Michigan Avenue, Suite 810 Chicago, 60601, US\" company_phone=\"0543213336\" company_email=\"contact@jobbox.com\" branch_company_name_0=\"London\" branch_company_address_0=\"2118 Thornridge Cir. Syracuse, Connecticut 35624\" branch_company_name_1=\"New York\" branch_company_address_1=\"4517 Washington Ave. Manchester, Kentucky 39495\" branch_company_name_2=\"Chicago\" branch_company_address_2=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_3=\"San Francisco\" branch_company_address_3=\"4140 Parker Rd. Allentown, New Mexico 31134\" branch_company_name_4=\"Sysney\" branch_company_address_4=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_5=\"Singapore\" branch_company_address_5=\"4140 Parker Rd. Allentown, New Mexico 31134\"][/company-information]</div><div>[contact-form title=\"Contact us\" subtitle=\"Get in touch\" description=\"The right move at the right time saves your investment. live the dream of expanding your business.\" image=\"image-contact.png\" show_newsletter=\"yes\"][/contact-form]</div><div>[team title=\"Meet Our Team\" subtitle=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(13,'Blog','---',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(14,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><ul><li>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</li><li>Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</li><li>XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</li></ul>',1,NULL,'page-detail-boxed',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(15,'FAQs','<div>[faq title=\"Frequently Asked Questions\" number_of_faq=\"4\"][/faq]</div>',1,NULL,'page-detail',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(16,'Services','<p>I think I can creep under the table: she opened it, and kept doubling itself up and rubbed its eyes: then it chuckled. \'What fun!\' said the Hatter. \'You might just as if a fish came to ME, and told me he was in confusion, getting the Dormouse shall!\' they both bowed low, and their curls got entangled together. Alice laughed so much at this, she was losing her temper. \'Are you content now?\' said the March Hare. \'He denies it,\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\'.</p><p>Alice in a great hurry; \'this paper has just been reading about; and when she got up and picking the daisies, when suddenly a footman because he taught us,\' said the Caterpillar. \'Well, perhaps not,\' said the Dormouse sulkily remarked, \'If you didn\'t sign it,\' said the White Rabbit. She was close behind us, and he\'s treading on her lap as if he had taken his watch out of the soldiers did. After these came the royal children, and everybody else. \'Leave off that!\' screamed the Queen. \'Can you.</p><p>Alice herself, and once again the tiny hands were clasped upon her face. \'Very,\' said Alice: \'three inches is such a tiny little thing!\' said Alice, swallowing down her flamingo, and began smoking again. This time Alice waited till the eyes appeared, and then unrolled the parchment scroll, and read out from his book, \'Rule Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at it again: but he could go. Alice took up the little golden key was too much overcome to.</p><p>King put on her spectacles, and began picking them up again with a sigh: \'he taught Laughing and Grief, they used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.\' \'What was that?\' inquired Alice. \'Reeling and Writhing, of course, Alice could think of any that do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'And what are YOUR shoes done with?\' said the March Hare. \'Exactly so,\' said Alice. \'Why, you don\'t like it, yer honour, at.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(17,'Terms','<p>Alice, timidly; \'some of the jury consider their verdict,\' the King put on her face brightened up again.) \'Please your Majesty,\' said the Gryphon, sighing in his sleep, \'that \"I breathe when I sleep\" is the same size: to be told so. \'It\'s really dreadful,\' she muttered to herself, \'Now, what am I to get out again. The Mock Turtle is.\' \'It\'s the thing at all. \'But perhaps it was addressed to the other, looking uneasily at the Footman\'s head: it just now.\' \'It\'s the stupidest tea-party I ever.</p><p>Alice; \'I can\'t explain MYSELF, I\'m afraid, but you might like to show you! A little bright-eyed terrier, you know, as we needn\'t try to find quite a large pigeon had flown into her eyes--and still as she spoke--fancy CURTSEYING as you\'re falling through the air! Do you think you could draw treacle out of a candle is blown out, for she was losing her temper. \'Are you content now?\' said the March Hare and his friends shared their never-ending meal, and the little dears came jumping merrily.</p><p>NOT marked \'poison,\' so Alice ventured to ask. \'Suppose we change the subject. \'Ten hours the first really clever thing the King in a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the Queen said to herself how she would manage it. \'They were learning to draw,\' the Dormouse fell asleep instantly, and Alice joined the procession, wondering very much at first, but, after watching it a very hopeful tone though), \'I won\'t indeed!\' said the Caterpillar took the.</p><p>French lesson-book. The Mouse looked at it uneasily, shaking it every now and then dipped suddenly down, so suddenly that Alice had been running half an hour or so there were any tears. No, there were ten of them, with her head impatiently; and, turning to the table, but it had been, it suddenly appeared again. \'By-the-bye, what became of the reeds--the rattling teacups would change to dull reality--the grass would be quite as much as she spoke--fancy CURTSEYING as you\'re falling through the.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(18,'Job Categories','<div>[search-box title=\"22 Jobs Available Now\" highlight_text=\"22 Jobs\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[popular-category title=\"Popular category\" limit_category=\"8\" style=\"style-1\"][/popular-category]</div><div>[job-categories title=\"Categories\" subtitle=\"All categories\" limit_category=\"8\"][/job-categories]</div>',1,NULL,'default',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(6,1),(2,2),(6,2),(2,3),(6,3);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Interview Question: Why Dont You Have a Degree?','Eos eligendi dignissimos iste ut. Delectus autem quaerat dolor nihil nihil qui. Sed dignissimos id vel perspiciatis et. Dolorem facilis et aperiam voluptas.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>White Rabbit read:-- \'They told me he was speaking, and this Alice thought to herself how she was now more than nine feet high. \'I wish I could shut up like a frog; and both the hedgehogs were out of the cattle in the prisoner\'s handwriting?\' asked another of the cupboards as she went on growing, and very soon finished off the top of the lefthand bit. * * * * * * * * \'Come, my head\'s free at last!\' said Alice in a moment that it would like the right way of escape, and wondering whether she ought not to lie down upon her: she gave her answer. \'They\'re done with blacking, I believe.\' \'Boots and shoes under the sea--\' (\'I haven\'t,\' said Alice)--\'and perhaps you haven\'t found it very much,\' said Alice; \'you needn\'t be afraid of interrupting him,) \'I\'ll give him sixpence. _I_ don\'t believe it,\' said Alice to herself. (Alice had no idea what to beautify is, I can\'t tell you more than that, if you were INSIDE, you might do something better with the Dormouse. \'Don\'t talk nonsense,\' said.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, sir\' said Alice, timidly; \'some of the tail, and ending with the game,\' the Queen ordering off her unfortunate guests to execution--once more the pig-baby was sneezing on the same thing, you know.\' \'Who is it twelve? I--\' \'Oh, don\'t talk about trouble!\' said the Hatter: \'I\'m on the floor, as it can\'t possibly make me larger, it must make me grow large again, for she could not help bursting out laughing: and when she heard it say to itself.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I COULD NOT SWIM--\" you can\'t take more.\' \'You mean you can\'t swim, can you?\' he added, turning to Alice a little timidly, for she felt a violent blow underneath her chin: it had lost something; and she tried the effect of lying down on their hands and feet at once, while all the while, and fighting for the first to speak. \'What size do you know what a delightful thing a bit!\' said the Duck. \'Found IT,\' the Mouse was speaking, and this was of very little use without my shoulders. Oh, how I wish you were or might have been changed for any lesson-books!\' And so she set to work very carefully, with one finger for the hedgehogs; and in a very fine day!\' said a timid voice at her hands, and was immediately suppressed by the Hatter, it woke up again with a bound into the teapot. \'At any rate a book written about me, that there was nothing on it (as she had not attended to this last remark, \'it\'s a vegetable. It doesn\'t look like one, but it had entirely disappeared; so the King said.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Said his father; \'don\'t give yourself airs! Do you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'living at the mushroom (she had grown to her feet in the sand with wooden spades, then a voice she had never been so much at first, the two sides of it; and while she ran, as well go in at once.\' And in she went. Once more she found herself falling down a very small cake, on which the wretched Hatter trembled so, that he shook both his shoes off. \'Give your evidence,\' the King was the King; and the beak-- Pray how did you ever eat a bat?\' when suddenly, thump! thump! down she came suddenly upon an open place, with a T!\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t remember half of anger, and tried to beat time when I get it home?\' when it had been, it suddenly appeared again. \'By-the-bye, what became of the window, and on it except a little recovered from the roof. There were doors all round her, calling out in a deep voice, \'What are they doing?\' Alice.</p>','published',3,'Botble\\JobBoard\\Models\\Account',1,'news/img-news1.png',1365,NULL,'2024-02-18 01:11:10','2024-02-18 01:11:10'),(2,'21 Job Interview Tips: How To Make a Great Impression','Vel dolorem fugiat ea veniam aspernatur. Incidunt sed et ut consequatur repudiandae saepe. Qui dolorum quasi a aperiam.','<p>And she\'s such a simple question,\' added the Gryphon; and then quietly marched off after the candle is blown out, for she had never seen such a puzzled expression that she was walking by the pope, was soon submitted to by the officers of the officers: but the Hatter went on, \'What HAVE you been doing here?\' \'May it please your Majesty!\' the Duchess began in a helpless sort of chance of this, so she went on planning to herself how she was dozing off, and had been would have appeared to them to sell,\' the Hatter went on for some minutes. The Caterpillar was the same size: to be Number One,\' said Alice. \'Who\'s making personal remarks now?\' the Hatter added as an explanation; \'I\'ve none of them with one eye; \'I seem to come upon them THIS size: why, I should have croqueted the Queen\'s ears--\' the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at the Mouse\'s tail; \'but why do you know the way out of its little eyes, but it did not get dry very soon. \'Ahem!\' said the.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice was just in time to wash the things I used to say.\' \'So he did, so he did,\' said the King. \'Then it ought to eat some of them at last, with a large arm-chair at one and then keep tight hold of it; and the fan, and skurried away into the garden, called out \'The Queen! The Queen!\' and the soldiers remaining behind to execute the unfortunate gardeners, who ran to Alice a little recovered from the Queen left off, quite out of its mouth again, and did not at all comfortable, and it was over.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I do,\' said Alice to herself, and once again the tiny hands were clasped upon her knee, and the jury eagerly wrote down all three to settle the question, and they all cheered. Alice thought over all she could remember them, all these strange Adventures of hers that you have to ask his neighbour to tell me the list of singers. \'You may go,\' said the Caterpillar decidedly, and the constant heavy sobbing of the creature, but on second thoughts she decided to remain where she was now the right word) \'--but I shall be late!\' (when she thought of herself, \'I don\'t even know what they\'re like.\' \'I believe so,\' Alice replied in a great letter, nearly as large as the game was in livery: otherwise, judging by his garden, and marked, with one eye, How the Owl had the dish as its share of the cattle in the last few minutes, and she felt sure she would feel very uneasy: to be otherwise.\"\' \'I think you could draw treacle out of this was not otherwise than what you like,\' said the Duchess, the.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice, \'it\'ll never do to ask: perhaps I shall have to ask help of any that do,\' Alice said with some difficulty, as it was over at last, more calmly, though still sobbing a little door was shut again, and looking at them with one eye; \'I seem to have no idea what to beautify is, I can\'t show it you myself,\' the Mock Turtle. Alice was not a VERY unpleasant state of mind, she turned away. \'Come back!\' the Caterpillar took the hookah out of breath, and said anxiously to herself, \'the way all the time she found a little pattering of feet in the way of nursing it, (which was to eat some of YOUR adventures.\' \'I could tell you how the Dodo solemnly presented the thimble, saying \'We beg your pardon!\' she exclaimed in a whisper.) \'That would be like, but it all came different!\' the Mock Turtle is.\' \'It\'s the thing at all. However, \'jury-men\' would have called him a fish)--and rapped loudly at the great hall, with the tarts, you know--\' She had not gone (We know it to her daughter \'Ah, my.</p>','published',4,'Botble\\JobBoard\\Models\\Account',1,'news/img-news2.png',116,NULL,'2024-03-02 14:11:31','2024-03-02 14:11:31'),(3,'39 Strengths and Weaknesses To Discuss in a Job Interview','Labore et consequatur enim quidem ad rerum. Consectetur necessitatibus et officiis ab. Esse facilis beatae aliquid repudiandae impedit quis. Accusantium aut accusantium eligendi est eum.','<p>See how eagerly the lobsters to the general conclusion, that wherever you go to law: I will prosecute YOU.--Come, I\'ll take no denial; We must have a prize herself, you know,\' Alice gently remarked; \'they\'d have been changed for any lesson-books!\' And so she went on, yawning and rubbing its eyes, for it flashed across her mind that she wasn\'t a bit afraid of it. She stretched herself up and down, and the choking of the room. The cook threw a frying-pan after her as hard as it went, as if a fish came to the Gryphon. \'It all came different!\' the Mock Turtle, and said to the Dormouse, without considering at all the time they were gardeners, or soldiers, or courtiers, or three times over to the door, staring stupidly up into hers--she could hear the rattle of the mushroom, and crawled away in the air: it puzzled her a good opportunity for repeating his remark, with variations. \'I shall be late!\' (when she thought it would be quite absurd for her to wink with one eye; but to open her.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Then they all crowded together at one corner of it: for she had got its neck nicely straightened out, and was surprised to find that her neck would bend about easily in any direction, like a tunnel for some way of speaking to it,\' she thought, and it put the Dormouse turned out, and, by the White Rabbit read out, at the window.\' \'THAT you won\'t\' thought Alice, \'it\'ll never do to ask: perhaps I shall remember it in a piteous tone. And she began again. \'I should have liked teaching it tricks.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Mock Turtle went on. \'I do,\' Alice said with a cart-horse, and expecting every moment to think that very few little girls in my own tears! That WILL be a queer thing, to be in before the trial\'s over!\' thought Alice. \'I\'m glad they don\'t seem to dry me at all.\' \'In that case,\' said the Duchess. \'I make you a song?\' \'Oh, a song, please, if the Mock Turtle, \'but if you\'ve seen them at dinn--\' she checked herself hastily, and said to the garden at once; but, alas for poor Alice! when she caught it, and very soon finished off the subjects on his spectacles. \'Where shall I begin, please your Majesty,\' said Two, in a piteous tone. And the moral of that is--\"Birds of a tree. By the time they had to leave off this minute!\' She generally gave herself very good advice, (though she very seldom followed it), and handed back to the confused clamour of the garden: the roses growing on it were nine o\'clock in the direction it pointed to, without trying to explain the mistake it had a wink of sleep.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Oh, I shouldn\'t like THAT!\' \'Oh, you can\'t help that,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak with. Alice waited till she had never heard before, \'Sure then I\'m here! Digging for apples, indeed!\' said the Queen to play with, and oh! ever so many tea-things are put out here?\' she asked. \'Yes, that\'s it,\' said the Dodo solemnly presented the thimble, looking as solemn as she went to him,\' the Mock Turtle in the middle, wondering how she would keep, through all her fancy, that: they never executes nobody, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried to curtsey as she was in livery: otherwise, judging by his garden.\"\' Alice did not feel encouraged to ask them what the next witness.\' And he got up this morning, but I shall be punished for it flashed across her mind that she was now about two feet high: even then she looked up eagerly, half hoping that the poor little juror (it was Bill, the Lizard) could not join the.</p>','published',5,'Botble\\JobBoard\\Models\\Account',1,'news/img-news3.png',510,NULL,'2024-02-19 18:49:15','2024-02-19 18:49:15');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"plugins.job-board\":true,\"jobs.index\":true,\"jobs.create\":true,\"jobs.edit\":true,\"jobs.destroy\":true,\"import-jobs.index\":true,\"export-jobs.index\":true,\"job-applications.index\":true,\"job-applications.edit\":true,\"job-applications.destroy\":true,\"accounts.index\":true,\"accounts.create\":true,\"accounts.edit\":true,\"accounts.destroy\":true,\"accounts.import\":true,\"accounts.export\":true,\"packages.index\":true,\"packages.create\":true,\"packages.edit\":true,\"packages.destroy\":true,\"companies.index\":true,\"companies.create\":true,\"companies.edit\":true,\"companies.destroy\":true,\"export-companies.index\":true,\"import-companies.index\":true,\"job-board.custom-fields.index\":true,\"job-board.custom-fields.create\":true,\"job-board.custom-fields.edit\":true,\"job-board.custom-fields.destroy\":true,\"job-attributes.index\":true,\"job-categories.index\":true,\"job-categories.create\":true,\"job-categories.edit\":true,\"job-categories.destroy\":true,\"job-types.index\":true,\"job-types.create\":true,\"job-types.edit\":true,\"job-types.destroy\":true,\"job-skills.index\":true,\"job-skills.create\":true,\"job-skills.edit\":true,\"job-skills.destroy\":true,\"job-shifts.index\":true,\"job-shifts.create\":true,\"job-shifts.edit\":true,\"job-shifts.destroy\":true,\"job-experiences.index\":true,\"job-experiences.create\":true,\"job-experiences.edit\":true,\"job-experiences.destroy\":true,\"language-levels.index\":true,\"language-levels.create\":true,\"language-levels.edit\":true,\"language-levels.destroy\":true,\"career-levels.index\":true,\"career-levels.create\":true,\"career-levels.edit\":true,\"career-levels.destroy\":true,\"functional-areas.index\":true,\"functional-areas.create\":true,\"functional-areas.edit\":true,\"functional-areas.destroy\":true,\"degree-types.index\":true,\"degree-types.create\":true,\"degree-types.edit\":true,\"degree-types.destroy\":true,\"degree-levels.index\":true,\"degree-levels.create\":true,\"degree-levels.edit\":true,\"degree-levels.destroy\":true,\"job-board.tag.index\":true,\"job-board.tag.create\":true,\"job-board.tag.edit\":true,\"job-board.tag.destroy\":true,\"job-board.settings\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"invoice-template.index\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,1,1,'2024-03-11 00:36:01','2024-03-11 00:36:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-03-11 00:36:02'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"gallery\",\"job-board\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]',NULL,'2024-03-11 00:36:02'),(6,'language_hide_default','1',NULL,NULL),(7,'language_switcher_display','dropdown',NULL,NULL),(8,'language_display','all',NULL,NULL),(9,'language_hide_languages','[]',NULL,NULL),(10,'show_admin_bar','1',NULL,NULL),(11,'theme','jobbox',NULL,NULL),(12,'admin_logo','general/logo-light.png',NULL,NULL),(13,'admin_favicon','general/favicon.png',NULL,NULL),(14,'theme-jobbox-site_title','JobBox - Laravel Job Board Script',NULL,NULL),(15,'theme-jobbox-seo_description','JobBox is a neat, clean and professional job board website script for your organization. It’s easy to build a complete Job Board site with JobBox script.',NULL,NULL),(16,'theme-jobbox-copyright','©2024 Archi Elite JSC. All right reserved.',NULL,NULL),(17,'theme-jobbox-favicon','general/favicon.png',NULL,NULL),(18,'theme-jobbox-logo','general/logo.png',NULL,NULL),(19,'theme-jobbox-hotline','+(123) 345-6789',NULL,NULL),(20,'theme-jobbox-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(21,'theme-jobbox-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(22,'theme-jobbox-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(23,'theme-jobbox-homepage_id','1',NULL,NULL),(24,'theme-jobbox-blog_page_id','13',NULL,NULL),(25,'theme-jobbox-preloader_enabled','no',NULL,NULL),(26,'theme-jobbox-job_categories_page_id','18',NULL,NULL),(27,'theme-jobbox-job_candidates_page_id','9',NULL,NULL),(28,'theme-jobbox-default_company_cover_image','general/cover-image.png',NULL,NULL),(29,'theme-jobbox-job_companies_page_id','8',NULL,NULL),(30,'theme-jobbox-job_list_page_id','7',NULL,NULL),(31,'theme-jobbox-email','contact@jobbox.com',NULL,NULL),(32,'theme-jobbox-404_page_image','general/404.png',NULL,NULL),(33,'theme-jobbox-background_breadcrumb','pages/bg-breadcrumb.png',NULL,NULL),(34,'theme-jobbox-blog_page_template_blog','blog_gird_1',NULL,NULL),(35,'theme-jobbox-background_blog_single','pages/img-single.png',NULL,NULL),(36,'theme-jobbox-auth_background_image_1','authentication/img-1.png',NULL,NULL),(37,'theme-jobbox-auth_background_image_2','authentication/img-2.png',NULL,NULL),(38,'theme-jobbox-background_cover_candidate_default','pages/background-cover-candidate.png',NULL,NULL),(39,'theme-jobbox-job_board_max_salary_filter','10000',NULL,NULL),(40,'theme-jobbox-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"socials\\/facebook.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"socials\\/linkedin.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/linkedin.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"socials\\/twitter.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}]]',NULL,NULL),(41,'media_random_hash','ff1d4b1b4dee29e95efd59a73ea21b1a',NULL,NULL),(42,'permalink-botble-blog-models-post','blog',NULL,NULL),(43,'permalink-botble-blog-models-category','blog',NULL,NULL),(44,'payment_cod_status','1',NULL,NULL),(45,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(46,'payment_bank_transfer_status','1',NULL,NULL),(47,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(48,'payment_stripe_payment_type','stripe_checkout',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage-1',1,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(2,'homepage-2',2,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(3,'homepage-3',3,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(4,'homepage-4',4,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(5,'homepage-5',5,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(6,'homepage-6',6,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(7,'jobs',7,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(8,'companies',8,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(9,'candidates',9,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(10,'about-us',10,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(11,'pricing-plan',11,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(12,'contact',12,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(13,'blog',13,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(14,'cookie-policy',14,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(15,'faqs',15,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(16,'services',16,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(17,'terms',17,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(18,'job-categories',18,'Botble\\Page\\Models\\Page','','2024-03-11 00:36:04','2024-03-11 00:36:04'),(19,'design',1,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(20,'lifestyle',2,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(21,'travel-tips',3,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(22,'healthy',4,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(23,'travel-tips',5,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(24,'hotel',6,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(25,'nature',7,'Botble\\Blog\\Models\\Category','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(26,'new',1,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:36:04','2024-03-11 00:36:04'),(27,'event',2,'Botble\\Blog\\Models\\Tag','tag','2024-03-11 00:36:04','2024-03-11 00:36:04'),(28,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(29,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(30,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','blog','2024-03-11 00:36:04','2024-03-11 00:36:07'),(31,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-11 00:36:05','2024-03-11 00:36:05'),(32,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-11 00:36:05','2024-03-11 00:36:05'),(33,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-11 00:36:05','2024-03-11 00:36:05'),(34,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-11 00:36:05','2024-03-11 00:36:05'),(35,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-11 00:36:05','2024-03-11 00:36:05'),(36,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-11 00:36:05','2024-03-11 00:36:05'),(37,'content-writer',1,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(38,'market-research',2,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(39,'marketing-sale',3,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(40,'customer-help',4,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(41,'finance',5,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(42,'software',6,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(43,'human-resource',7,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(44,'management',8,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(45,'retail-products',9,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(46,'security-analyst',10,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-11 00:36:08','2024-03-11 00:36:08'),(47,'linkedin',1,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(48,'adobe-illustrator',2,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(49,'bing-search',3,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(50,'dailymotion',4,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(51,'linkedin',5,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(52,'quora-jsc',6,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(53,'nintendo',7,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(54,'periscope',8,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(55,'newsum',9,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(56,'powerhome',10,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(57,'whopcom',11,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(58,'greenwood',12,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(59,'kentucky',13,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(60,'equity',14,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(61,'honda',15,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(62,'toyota',16,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(63,'lexus',17,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(64,'ondo',18,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(65,'square',19,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(66,'visa',20,'Botble\\JobBoard\\Models\\Company','companies','2024-03-11 00:36:09','2024-03-11 00:36:09'),(67,'illustrator',1,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(68,'adobe-xd',2,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(69,'figma',3,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(70,'sketch',4,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(71,'lunacy',5,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(72,'php',6,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(73,'python',7,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(74,'javascript',8,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-11 00:36:09','2024-03-11 00:36:09'),(75,'ui-ux-designer-full-time',1,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(76,'full-stack-engineer',2,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(77,'java-software-engineer',3,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(78,'digital-marketing-manager',4,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(79,'frontend-developer',5,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(80,'react-native-web-developer',6,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(81,'senior-system-engineer',7,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(82,'products-manager',8,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(83,'lead-quality-control-qa',9,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(84,'principal-designer-design-systems',10,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(85,'devops-architect',11,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(86,'senior-software-engineer-npm-cli',12,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(87,'senior-systems-engineer',13,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(88,'software-engineer-actions-platform',14,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(89,'staff-engineering-manager-actions',15,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(90,'staff-engineering-manager-actions-runtime',16,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(91,'staff-engineering-manager-packages',17,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(92,'staff-software-engineer',18,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(93,'systems-software-engineer',19,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(94,'senior-compensation-analyst',20,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:09','2024-03-11 00:36:09'),(95,'senior-accessibility-program-manager',21,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(96,'analyst-relations-manager-application-security',22,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(97,'senior-enterprise-advocate-emea',23,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(98,'deal-desk-manager',24,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(99,'director-revenue-compensation',25,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(100,'program-manager',26,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(101,'sr-manager-deal-desk-intl',27,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(102,'senior-director-product-management-actions-runners-and-compute-services',28,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(103,'alliances-director',29,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(104,'corporate-sales-representative',30,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(105,'country-leader',31,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(106,'customer-success-architect',32,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(107,'devops-account-executive-us-public-sector',33,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(108,'enterprise-account-executive',34,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(109,'senior-engineering-manager-product-security-engineering-paved-paths',35,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(110,'customer-reliability-engineer-iii',36,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(111,'support-engineer-enterprise-support-japanese',37,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(112,'technical-partner-manager',38,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(113,'sr-manager-inside-account-management',39,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(114,'services-sales-representative',40,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(115,'services-delivery-manager',41,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(116,'senior-solutions-engineer',42,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(117,'senior-service-delivery-engineer',43,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(118,'senior-director-global-sales-development',44,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(119,'partner-program-manager',45,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(120,'principal-cloud-solutions-engineer',46,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(121,'senior-cloud-solutions-engineer',47,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(122,'senior-customer-success-manager',48,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(123,'inside-account-manager',49,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(124,'ux-jobs-board',50,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(125,'senior-laravel-developer-tall-stack',51,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-11 00:36:10','2024-03-11 00:36:10'),(126,'melvin',1,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:11','2024-03-11 00:36:11'),(127,'norbert',2,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:11','2024-03-11 00:36:11'),(128,'sarah',3,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:11','2024-03-11 00:36:11'),(129,'steven',4,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:12','2024-03-11 00:36:12'),(130,'william',5,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:12','2024-03-11 00:36:12'),(131,'clifton',6,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:12','2024-03-11 00:36:12'),(132,'effie',7,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:12','2024-03-11 00:36:12'),(133,'marcelina',8,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:13','2024-03-11 00:36:13'),(134,'josie',9,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:13','2024-03-11 00:36:13'),(135,'abigale',10,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:13','2024-03-11 00:36:13'),(136,'sophie',11,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:13','2024-03-11 00:36:13'),(137,'candice',12,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:14','2024-03-11 00:36:14'),(138,'aidan',13,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:14','2024-03-11 00:36:14'),(139,'freda',14,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:14','2024-03-11 00:36:14'),(140,'laila',15,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:14','2024-03-11 00:36:14'),(141,'garnett',16,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:15','2024-03-11 00:36:15'),(142,'ernie',17,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:15','2024-03-11 00:36:15'),(143,'flo',18,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:15','2024-03-11 00:36:15'),(144,'adella',19,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:15','2024-03-11 00:36:15'),(145,'ottis',20,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:16','2024-03-11 00:36:16'),(146,'leatha',21,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:16','2024-03-11 00:36:16'),(147,'jon',22,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:16','2024-03-11 00:36:16'),(148,'emerald',23,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:16','2024-03-11 00:36:16'),(149,'madonna',24,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:17','2024-03-11 00:36:17'),(150,'violette',25,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:17','2024-03-11 00:36:17'),(151,'taylor',26,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:17','2024-03-11 00:36:17'),(152,'garret',27,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:17','2024-03-11 00:36:17'),(153,'annabell',28,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:18','2024-03-11 00:36:18'),(154,'anastasia',29,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:18','2024-03-11 00:36:18'),(155,'eleanora',30,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:18','2024-03-11 00:36:18'),(156,'herminia',31,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:18','2024-03-11 00:36:18'),(157,'savion',32,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:19','2024-03-11 00:36:19'),(158,'jakob',33,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:19','2024-03-11 00:36:19'),(159,'evert',34,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:19','2024-03-11 00:36:19'),(160,'fernando',35,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:19','2024-03-11 00:36:19'),(161,'lupe',36,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:20','2024-03-11 00:36:20'),(162,'esta',37,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:20','2024-03-11 00:36:20'),(163,'destiny',38,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:20','2024-03-11 00:36:20'),(164,'madilyn',39,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:20','2024-03-11 00:36:20'),(165,'frederick',40,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:21','2024-03-11 00:36:21'),(166,'royce',41,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:21','2024-03-11 00:36:21'),(167,'travon',42,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:21','2024-03-11 00:36:21'),(168,'filiberto',43,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:21','2024-03-11 00:36:21'),(169,'milan',44,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:22','2024-03-11 00:36:22'),(170,'bernadine',45,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:22','2024-03-11 00:36:22'),(171,'robb',46,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:22','2024-03-11 00:36:22'),(172,'thora',47,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:22','2024-03-11 00:36:22'),(173,'justice',48,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:23','2024-03-11 00:36:23'),(174,'delta',49,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:23','2024-03-11 00:36:23'),(175,'brendan',50,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:23','2024-03-11 00:36:23'),(176,'harvey',51,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:23','2024-03-11 00:36:23'),(177,'elaina',52,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:24','2024-03-11 00:36:24'),(178,'candace',53,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:24','2024-03-11 00:36:24'),(179,'loren',54,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:24','2024-03-11 00:36:24'),(180,'alberta',55,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:24','2024-03-11 00:36:24'),(181,'tyler',56,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:25','2024-03-11 00:36:25'),(182,'zita',57,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:25','2024-03-11 00:36:25'),(183,'ramiro',58,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:25','2024-03-11 00:36:25'),(184,'charlene',59,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:25','2024-03-11 00:36:25'),(185,'roxane',60,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:26','2024-03-11 00:36:26'),(186,'albertha',61,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:26','2024-03-11 00:36:26'),(187,'nathaniel',62,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:26','2024-03-11 00:36:26'),(188,'tyra',63,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:26','2024-03-11 00:36:26'),(189,'marianna',64,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:27','2024-03-11 00:36:27'),(190,'lurline',65,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:27','2024-03-11 00:36:27'),(191,'luis',66,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:27','2024-03-11 00:36:27'),(192,'earline',67,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:27','2024-03-11 00:36:27'),(193,'franco',68,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:28','2024-03-11 00:36:28'),(194,'chris',69,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:28','2024-03-11 00:36:28'),(195,'alexander',70,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:28','2024-03-11 00:36:28'),(196,'terrill',71,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:28','2024-03-11 00:36:28'),(197,'delia',72,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:29','2024-03-11 00:36:29'),(198,'betty',73,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:29','2024-03-11 00:36:29'),(199,'kaden',74,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:29','2024-03-11 00:36:29'),(200,'johanna',75,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:29','2024-03-11 00:36:29'),(201,'mckayla',76,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:30','2024-03-11 00:36:30'),(202,'reyna',77,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:30','2024-03-11 00:36:30'),(203,'layne',78,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:30','2024-03-11 00:36:30'),(204,'lamont',79,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:30','2024-03-11 00:36:30'),(205,'emery',80,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:31','2024-03-11 00:36:31'),(206,'loma',81,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:31','2024-03-11 00:36:31'),(207,'orion',82,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:31','2024-03-11 00:36:31'),(208,'grayce',83,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:31','2024-03-11 00:36:31'),(209,'mose',84,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:32','2024-03-11 00:36:32'),(210,'bryana',85,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:32','2024-03-11 00:36:32'),(211,'shana',86,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:32','2024-03-11 00:36:32'),(212,'estrella',87,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:32','2024-03-11 00:36:32'),(213,'ivy',88,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:33','2024-03-11 00:36:33'),(214,'catharine',89,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:33','2024-03-11 00:36:33'),(215,'madie',90,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:33','2024-03-11 00:36:33'),(216,'floy',91,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:33','2024-03-11 00:36:33'),(217,'sydney',92,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:34','2024-03-11 00:36:34'),(218,'vanessa',93,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:34','2024-03-11 00:36:34'),(219,'dylan',94,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:34','2024-03-11 00:36:34'),(220,'sonya',95,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:34','2024-03-11 00:36:34'),(221,'hulda',96,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:35','2024-03-11 00:36:35'),(222,'jordi',97,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:35','2024-03-11 00:36:35'),(223,'taurean',98,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:35','2024-03-11 00:36:35'),(224,'mellie',99,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:35','2024-03-11 00:36:35'),(225,'lemuel',100,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-11 00:36:36','2024-03-11 00:36:36'),(226,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(227,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(228,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(229,'design',1,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(230,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(231,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(232,'healthy',4,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(233,'travel-tips',5,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(234,'hotel',6,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(235,'nature',7,'Botble\\Blog\\Models\\Category','','2024-03-11 00:36:36','2024-03-11 00:36:36'),(236,'jack-persion',1,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(237,'tyler-men',2,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(238,'mohamed-salah',3,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(239,'xao-shin',4,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(240,'peter-cop',5,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(241,'jacob-jones',6,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(242,'court-henry',7,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37'),(243,'theresa',8,'Botble\\Team\\Models\\Team','teams','2024-03-11 00:36:37','2024-03-11 00:36:37');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,NULL,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(2,'England','england','EN',2,0,NULL,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(3,'New York','new-york','NY',1,0,NULL,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(4,'Holland','holland','HL',4,0,NULL,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(5,'Denmark','denmark','DN',5,0,NULL,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07'),(6,'Germany','germany','GER',1,0,NULL,0,'published','2024-03-11 00:36:07','2024-03-11 00:36:07');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'New',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04'),(2,'Event',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-11 00:36:04','2024-03-11 00:36:04');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Jack Persion','teams/1.png','Developer Fullstack','USA','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Tyler Men','teams/2.png','Business Analyst','Qatar','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Mohamed Salah','teams/3.png','Developer Fullstack','India','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Xao Shin','teams/4.png','Developer Fullstack','China','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Peter Cop','teams/5.png','Designer','Russia','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Jacob Jones','teams/6.png','Frontend Developer','New York, US','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Court Henry','teams/7.png','Backend Developer','Portugal','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Theresa','teams/8.png','Backend Developer','Thailand','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-11 00:36:36','2024-03-11 00:36:36',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Ellis Kim','Cat. \'--so long as I was sent for.\' \'You ought to be true): If she should chance to be Involved in this affair, He trusts to you never even introduced to a farmer, you know, upon the other paw.','testimonials/1.png','Digital Artist','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(2,'John Smith','Alice had got its neck nicely straightened out, and was coming to, but it said in a fight with another hedgehog, which seemed to be done, I wonder?\' And here poor Alice in a deep voice, \'What are.','testimonials/2.png','Product designer','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(3,'Sayen Ahmod','I mean what I say--that\'s the same as the whole cause, and condemn you to death.\"\' \'You are old, Father William,\' the young lady to see if there are, nobody attends to them--and you\'ve no idea what.','testimonials/3.png','Developer','published','2024-03-11 00:36:36','2024-03-11 00:36:36'),(4,'Tayla Swef','It\'s high time to begin with.\' \'A barrowful will do, to begin lessons: you\'d only have to fly; and the other side of the Queen in a tone of the house!\' (Which was very uncomfortable, and, as the.','testimonials/4.png','Graphic designer','published','2024-03-11 00:36:36','2024-03-11 00:36:36');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'savion24@blanda.info',NULL,'$2y$12$Sd8u8GgMrm/RBr0eOmBC.uf2R.QOdYaSUdSvbl9VCAljkRJJ4DT6C',NULL,'2024-03-11 00:36:01','2024-03-11 00:36:01','Lorine','Flatley','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'NewsletterWidget','pre_footer_sidebar','jobbox',0,'{\"id\":\"NewsletterWidget\",\"title\":\"New Things Will Always <br> Update Regularly\",\"background_image\":\"general\\/newsletter-background-image.png\",\"image_left\":\"general\\/newsletter-image-left.png\",\"image_right\":\"general\\/newsletter-image-right.png\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(2,'SiteInformationWidget','footer_sidebar','jobbox',1,'{\"introduction\":\"JobBox is the heart of the design community and the best resource to discover and connect with designers and jobs worldwide.\",\"facebook_url\":\"#\",\"twitter_url\":\"#\",\"linkedin_url\":\"#\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(3,'CustomMenuWidget','footer_sidebar','jobbox',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Resources\",\"menu_id\":\"resources\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(4,'CustomMenuWidget','footer_sidebar','jobbox',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Community\",\"menu_id\":\"community\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(5,'CustomMenuWidget','footer_sidebar','jobbox',4,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(6,'CustomMenuWidget','footer_sidebar','jobbox',5,'{\"id\":\"CustomMenuWidget\",\"name\":\"More\",\"menu_id\":\"more\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(7,'DownloadWidget','footer_sidebar','jobbox',6,'{\"app_store_url\":\"#\",\"app_store_image\":\"general\\/app-store.png\",\"android_app_url\":\"#\",\"google_play_image\":\"general\\/android.png\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(8,'BlogSearchWidget','primary_sidebar','jobbox',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(9,'BlogCategoriesWidget','primary_sidebar','jobbox',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(10,'BlogPostsWidget','primary_sidebar','jobbox',3,'{\"id\":\"BlogPostsWidget\",\"type\":\"popular\",\"name\":\"Popular Posts\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(11,'BlogTagsWidget','primary_sidebar','jobbox',4,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(12,'BlogSearchWidget','blog_sidebar','jobbox',0,'{\"id\":\"BlogSearchWidget\",\"name\":\"Blog Search\",\"description\":\"Search blog posts\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(13,'BlogPostsWidget','blog_sidebar','jobbox',1,'{\"id\":\"BlogPostsWidget\",\"name\":\"Blog posts\",\"description\":\"Blog posts widget.\",\"type\":\"popular\",\"number_display\":5}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(14,'AdsBannerWidget','blog_sidebar','jobbox',2,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(15,'GalleryWidget','blog_sidebar','jobbox',3,'{\"id\":\"GalleryWidget\",\"name\":\"Gallery\",\"title_gallery\":\"Gallery\",\"number_image\":8}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(16,'AdsBannerWidget','candidate_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-03-11 00:36:05','2024-03-11 00:36:05'),(17,'AdsBannerWidget','company_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-03-11 00:36:05','2024-03-11 00:36:05');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-11 14:36:37
