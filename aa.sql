-- MySQL dump 10.13  Distrib 5.7.29, for osx10.15 (x86_64)
--
-- Host: dotser.ie    Database: abbeymachinery_main_draft
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.16.04.1-log

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
-- Current Database: `abbeymachinery_main_draft`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `abbeymachinery_main_draft` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `abbeymachinery_main_draft`;

--
-- Table structure for table `Access_Resource`
--

DROP TABLE IF EXISTS `Access_Resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access_Resource` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SourceId` int(10) NOT NULL,
  `SourceName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ViewMode` tinyint(3) unsigned NOT NULL,
  `EditMode` tinyint(3) unsigned NOT NULL,
  `AdminMode` tinyint(3) unsigned NOT NULL,
  `ViewRoles` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `EditRoles` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AdminRoles` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Source` (`SourceId`,`SourceName`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Resource`
--

LOCK TABLES `Access_Resource` WRITE;
/*!40000 ALTER TABLE `Access_Resource` DISABLE KEYS */;
INSERT INTO `Access_Resource` VALUES (1,1,'Pages',0,0,0,'','',''),(2,0,'Pages',0,0,0,'','',''),(3,247,'Pages',0,0,0,'','',''),(4,249,'Pages',0,0,0,'','',''),(5,35,'Pages',0,0,0,'','',''),(6,251,'Pages',0,0,0,'','',''),(7,258,'Pages',0,0,0,'','',''),(8,248,'Pages',0,0,0,'','',''),(9,246,'Pages',0,0,0,'','',''),(10,250,'Pages',0,0,0,'','',''),(11,1,'Events',0,0,0,'','',''),(12,0,'News',0,0,0,'','',''),(13,1,'News',0,0,0,'','',''),(14,268,'Pages',0,0,0,'','',''),(15,255,'Pages',0,0,0,'','',''),(16,261,'Pages',0,0,0,'','',''),(17,264,'Pages',0,0,0,'','',''),(18,273,'Pages',0,0,0,'','',''),(19,252,'Pages',0,0,0,'','',''),(20,253,'Pages',0,0,0,'','',''),(21,254,'Pages',0,0,0,'','',''),(22,281,'Pages',0,0,0,'','',''),(23,282,'Pages',0,0,0,'','',''),(24,2,'News',0,0,0,'','',''),(25,285,'Pages',0,0,0,'','',''),(26,286,'Pages',0,0,0,'','',''),(27,279,'Pages',0,0,0,'','',''),(28,3,'News',0,0,0,'','',''),(29,278,'Pages',0,0,0,'','',''),(30,275,'Pages',0,0,0,'','',''),(31,277,'Pages',0,0,0,'','',''),(32,283,'Pages',0,0,0,'','',''),(33,284,'Pages',0,0,0,'','',''),(34,280,'Pages',0,0,0,'','',''),(35,287,'Pages',0,0,0,'','','');
/*!40000 ALTER TABLE `Access_Resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Access_Resource_Role`
--

DROP TABLE IF EXISTS `Access_Resource_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access_Resource_Role` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SourceId` int(10) NOT NULL,
  `SourceName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ResourceId` int(10) unsigned NOT NULL,
  `RoleId` int(10) unsigned NOT NULL,
  `Permission` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Action` enum('Deny','Allow') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Allow',
  PRIMARY KEY (`Id`),
  KEY `RoleId` (`RoleId`),
  CONSTRAINT `access_resource_role_ibfk_1` FOREIGN KEY (`RoleId`) REFERENCES `Access_Role` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Resource_Role`
--

LOCK TABLES `Access_Resource_Role` WRITE;
/*!40000 ALTER TABLE `Access_Resource_Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access_Resource_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Access_Role`
--

DROP TABLE IF EXISTS `Access_Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access_Role` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `CreatedBy` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Role`
--

LOCK TABLES `Access_Role` WRITE;
/*!40000 ALTER TABLE `Access_Role` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access_Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Access_Role_User`
--

DROP TABLE IF EXISTS `Access_Role_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Access_Role_User` (
  `UserId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RoleId` int(10) unsigned NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `CreatedBy` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Access_Role_User`
--

LOCK TABLES `Access_Role_User` WRITE;
/*!40000 ALTER TABLE `Access_Role_User` DISABLE KEYS */;
/*!40000 ALTER TABLE `Access_Role_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ActivitiesCastles`
--

DROP TABLE IF EXISTS `ActivitiesCastles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ActivitiesCastles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ActivityId` int(10) unsigned NOT NULL DEFAULT '0',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci,
  `Location` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  `Contact` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ActivitiesCastles`
--

LOCK TABLES `ActivitiesCastles` WRITE;
/*!40000 ALTER TABLE `ActivitiesCastles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ActivitiesCastles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdDrafts`
--

DROP TABLE IF EXISTS `AdDrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdDrafts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `AdId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdDrafts`
--

LOCK TABLES `AdDrafts` WRITE;
/*!40000 ALTER TABLE `AdDrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdDrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Addresses`
--

DROP TABLE IF EXISTS `Addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Addresses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `FirstName` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LastName` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Country` char(50) COLLATE utf8_unicode_ci DEFAULT 'Ireland',
  `Phone` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  `Billing` tinyint(3) unsigned DEFAULT '0',
  `Shipping` tinyint(3) unsigned DEFAULT '0',
  `DefaultBilling` tinyint(1) DEFAULT '0',
  `DefaultShipping` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `IndexUserId` (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addresses`
--

LOCK TABLES `Addresses` WRITE;
/*!40000 ALTER TABLE `Addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdminLinks`
--

DROP TABLE IF EXISTS `AdminLinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminLinks` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(11) unsigned NOT NULL,
  `Position` int(10) NOT NULL DEFAULT '0',
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Module` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `SuperShow` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SuperAdminOnly` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminLinks`
--

LOCK TABLES `AdminLinks` WRITE;
/*!40000 ALTER TABLE `AdminLinks` DISABLE KEYS */;
INSERT INTO `AdminLinks` VALUES (1,0,14,'pages.php','module-list','Modules','',1,'N','N'),(3,0,6,'news.php','news','News','news',1,'N','N'),(4,0,9,'events.php','events','Events','events',1,'N','N'),(5,0,11,'products.php','products','Products','shop',1,'N','N'),(6,5,1,'products.php','items','Items','shop',1,'N','N'),(7,5,4,'categories.php','categories','Categories','shop',0,'N','Y'),(8,10,4,'requests.php','enquiries','Enquiries','',1,'N','N'),(10,0,13,'settings.php','site-settings','Admin','',1,'N','Y'),(11,10,2,'settings.php','settings-2','Settings','',1,'N','Y'),(12,10,6,'loginhistory.php','login-history','Login History','',1,'N','Y'),(13,10,5,'emails.php','automatic-emails','Automatic Emails','',1,'N','Y'),(14,5,3,'productsversions.php','versions','Versions','shop',1,'N','N'),(15,5,6,'productmodels.php','models','Models','shop',0,'N','Y'),(17,1,10,'filemanager.php','file-manager','File Manager','filemanager',1,'N','Y'),(19,1,11,'gallery.php','image-gallery','Image Gallery','filemanager',1,'N','Y'),(20,1,3,'testimonials.php','testimonials','Testimonials','testimonials',1,'N','Y'),(21,1,2,'adverts.php','advertisments','Advertisments','adverts',1,'N','Y'),(22,1,4,'clients.php','clients','Clients','clients',1,'N','Y'),(23,1,6,'industry.php','industries','Industries','industries',1,'N','Y'),(24,60,1,'location.php','location','Map Settings','',1,'N','N'),(27,1,18,'links.php','links','Links','links',1,'N','N'),(28,1,7,'schedules.php','schedules','Schedules','schedules',1,'N','Y'),(30,1,8,'projectsportfolio.php','projects-portfolio','Projects portfolio','projectsportfolio',1,'N','Y'),(31,1,9,'partners.php','partners','Partners','partners',1,'N','Y'),(32,10,3,'administrators.php','users','Users','',1,'N','Y'),(33,34,2,'statistics.php','statistics','Statistics','',1,'N','Y'),(34,0,12,'seo.php','seo','SEO','',1,'N','N'),(35,1,13,'members.php','membership','Membership','membership',1,'N','Y'),(36,35,1,'members.php','members','Members','membership',1,'N','Y'),(37,35,2,'membersUrls.php','members-pages','Members Pages','membership',1,'N','Y'),(38,1,12,'forumconfig.php','forum','Forum','forum',1,'N','Y'),(39,38,1,'forumconfig.php','settings-3','Settings','forum',1,'N','Y'),(40,38,2,'forumcats.php','categories-2','Categories','forum',1,'N','Y'),(41,0,10,'shop.php','shop','Shop','shop',1,'N','N'),(42,41,1,'shop.php','settings','Settings','shop',1,'N','N'),(43,41,2,'shippings.php','shipping-costs','Shipping Costs','shop',1,'N','N'),(44,41,3,'voucherdiscounts.php','discounts','Discounts','shop',0,'N','Y'),(45,41,4,'customers.php','customers','Customers','shop',1,'N','N'),(46,41,5,'orders.php','orders-placed','Orders Placed','shop',1,'N','N'),(47,0,5,'pages.php','web-pages','Web Pages','',1,'N','N'),(48,47,1,'gallery.php','image-gallery-2','Image Gallery','filemanager',0,'N','Y'),(49,10,7,'management.php','management','Management','',1,'N','Y'),(50,49,1,'menu.php','menu','Menu','',1,'N','Y'),(51,49,2,'management.php?cmd=modules','modules','Modules','',1,'N','N'),(52,34,1,'seo.php','meta-tags','Meta Tags','',1,'N','N'),(53,11,2,'settings.php?cmd=image','image-settings','Images','',1,'N','N'),(54,11,3,'news.php?cmd=settings','news-settings','News','',1,'N','N'),(55,11,4,'events.php?cmd=settings','event-settings','Events','',1,'N','N'),(56,11,1,'settings.php?cmd=layout','layout-settings','Layouts','',1,'N','N'),(58,4,1,'eventtypes.php','event-types','Event Types','events, eventtypes',1,'N','N'),(59,0,4,'view','view','','',1,'N','N'),(60,0,15,'locations.php','location','Map Locations','',1,'N','N'),(61,1,5,'socialmedia.php','social-media','Social Media','socialmedia',1,'N','N'),(62,5,2,'brands.php','brands','Brands','',1,'N','N'),(63,3,1,'newstypes.php','news-types','News Types','news, newstypes',1,'N','N'),(64,1,14,'videos.php','videos','Videos','videos',1,'N','N'),(65,5,5,'productsdeposits.php','deposits','Deposits','shop',0,'N','Y'),(66,47,2,'pagerequestcontacts.php','contact-requests','Contact Requests','',1,'N','N'),(67,1,15,'staff.php','staff','Staff','staff',1,'N','N'),(68,67,1,'stafftypes.php','staff-types','Staff Types','staff',1,'N','N'),(69,0,3,'eventtypetypes.php','super-event-types','Super Event Types','eventtypes_extra',1,'N','N'),(70,0,2,'businessdirectory.php','business-directory','Business Directory','businessdirectory',1,'N','N'),(71,1,16,'newslettertypes.php','newsletter-types','Newsletter Types','newsletter_subscribe',1,'N','N'),(72,1,17,'contactlist.php',NULL,'Contact List','contactlist',1,'N','N'),(73,0,8,'faqs.php','faqs','FAQs','faqs',1,'N','N'),(74,1,19,'outlets.php','outlets','Outlets','outlets',1,'N','N'),(75,0,7,'documents.php','documents','Documents','documents',1,'N','N'),(76,75,1,'documenttypes.php','document-types','Document Types','documentstypes',1,'N','N'),(77,1,20,'pageicons.php',NULL,'Page Icons','pageicons',1,'N','N'),(78,1,21,'nominations.php',NULL,'Award Nominations','nominationform',1,'N','N'),(79,0,16,'schools.php',NULL,'Schools','schoolbookshop',1,'N','N'),(80,79,1,'schooltypes.php',NULL,'School Types','schoolbookshop',1,'N','N'),(81,79,2,'schoolyears.php',NULL,'School Years','schoolbookshop',1,'N','N'),(82,5,7,'authors.php',NULL,'Authors','schoolbookshop',1,'N','N'),(83,5,8,'schoolbooksubjects.php',NULL,'School Book Subjects','schoolbookshop',1,'N','N'),(84,5,9,'booklists.php',NULL,'Book Lists','schoolbookshop',1,'N','N'),(85,1,22,'prescriptions.php',NULL,'Uploaded Prescriptions','prescriptions',1,'N','N'),(86,0,17,'floorproducts.php',NULL,'Floor Products','floorproducts',1,'N','N'),(87,1,1,'captcha.php','captcha-settings','Captcha Settings','',1,'N','N'),(88,0,1,'view','view','','',1,'Y','N'),(89,0,18,'cakes.php','cakes','Cakes','cakes',1,'N','N'),(90,89,1,'cakespurchased.php','cakes-purchased','Cakes Purchased','cakes',1,'N','N'),(91,10,1,'itemstatuses.php','item-statuses','Generic Item Statuses','',0,'N','N'),(92,0,19,'hireproducts.php','hireproducts','Hire Products','hireproducts',1,'N','N'),(93,92,1,'usageinformation.php','usageinformation','Usage Information','hireproducts',1,'N','N'),(94,92,2,'brands.php','brands','Brands','hireproducts',1,'N','N'),(95,0,20,'super_show/printing.php','printing-options','PDF Options','',1,'Y','N'),(96,1,23,'jobs.php','jobs','Jobs','jobs',1,'N','N');
/*!40000 ALTER TABLE `AdminLinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ads`
--

DROP TABLE IF EXISTS `Ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ads` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CategoryId` int(10) NOT NULL,
  `Make` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeId` int(10) NOT NULL,
  `SellerId` int(10) NOT NULL,
  `StraightAway` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DisplayFrom` datetime NOT NULL,
  `DisplayTo` datetime NOT NULL,
  `PriceType` enum('Euro','Sterling') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `ContactNumber` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Website` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateAdded` datetime NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Views` int(10) DEFAULT '0',
  `IsFrom` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Coupon` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Video` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ads`
--

LOCK TABLES `Ads` WRITE;
/*!40000 ALTER TABLE `Ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdsCategories`
--

DROP TABLE IF EXISTS `AdsCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdsCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Position` tinyint(3) NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Abstract` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdsCategories`
--

LOCK TABLES `AdsCategories` WRITE;
/*!40000 ALTER TABLE `AdsCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdsCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdsFavorites`
--

DROP TABLE IF EXISTS `AdsFavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdsFavorites` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `AdId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdsFavorites`
--

LOCK TABLES `AdsFavorites` WRITE;
/*!40000 ALTER TABLE `AdsFavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdsFavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Adverts`
--

DROP TABLE IF EXISTS `Adverts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Adverts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Web` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Position` tinyint(3) unsigned DEFAULT '1',
  `Pages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` tinyint(3) DEFAULT '1',
  `Format` tinyint(1) NOT NULL DEFAULT '1',
  `Views` int(10) DEFAULT '0',
  `Clicks` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Adverts`
--

LOCK TABLES `Adverts` WRITE;
/*!40000 ALTER TABLE `Adverts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Adverts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvertsPages`
--

DROP TABLE IF EXISTS `AdvertsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvertsPages` (
  `AdvertId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`AdvertId`,`PageId`),
  KEY `PageId` (`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvertsPages`
--

LOCK TABLES `AdvertsPages` WRITE;
/*!40000 ALTER TABLE `AdvertsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvertsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvocacyCampaigns`
--

DROP TABLE IF EXISTS `AdvocacyCampaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvocacyCampaigns` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `About` text COLLATE utf8_unicode_ci NOT NULL,
  `Recipients` text COLLATE utf8_unicode_ci,
  `Multi` tinyint(3) NOT NULL DEFAULT '1',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Political action e-mail campaigns.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvocacyCampaigns`
--

LOCK TABLES `AdvocacyCampaigns` WRITE;
/*!40000 ALTER TABLE `AdvocacyCampaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvocacyCampaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvocacyCampaignsSent`
--

DROP TABLE IF EXISTS `AdvocacyCampaignsSent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvocacyCampaignsSent` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CampaignId` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SenderEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Recipients` text COLLATE utf8_unicode_ci NOT NULL,
  `Invitations` text COLLATE utf8_unicode_ci NOT NULL,
  `InvitationText` text COLLATE utf8_unicode_ci NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Record of sent campaigns.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvocacyCampaignsSent`
--

LOCK TABLES `AdvocacyCampaignsSent` WRITE;
/*!40000 ALTER TABLE `AdvocacyCampaignsSent` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvocacyCampaignsSent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdvocacyCampaignsTo`
--

DROP TABLE IF EXISTS `AdvocacyCampaignsTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdvocacyCampaignsTo` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Authority` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Recipients of Campaigns.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdvocacyCampaignsTo`
--

LOCK TABLES `AdvocacyCampaignsTo` WRITE;
/*!40000 ALTER TABLE `AdvocacyCampaignsTo` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdvocacyCampaignsTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AffiliateTypes`
--

DROP TABLE IF EXISTS `AffiliateTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AffiliateTypes` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AffiliateTypes`
--

LOCK TABLES `AffiliateTypes` WRITE;
/*!40000 ALTER TABLE `AffiliateTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `AffiliateTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Affiliates`
--

DROP TABLE IF EXISTS `Affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Affiliates` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TypeId` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `Web` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueName` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Module Affiliates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Affiliates`
--

LOCK TABLES `Affiliates` WRITE;
/*!40000 ALTER TABLE `Affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AlbumCategories`
--

DROP TABLE IF EXISTS `AlbumCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlbumCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumCategories`
--

LOCK TABLES `AlbumCategories` WRITE;
/*!40000 ALTER TABLE `AlbumCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `AlbumCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Animals`
--

DROP TABLE IF EXISTS `Animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Animals` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `BreedId` tinyint(3) NOT NULL DEFAULT '0',
  `Description` text COLLATE utf8_unicode_ci,
  `RegNumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MicroChipCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sex` enum('male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` int(10) NOT NULL DEFAULT '0',
  `SireId` int(10) DEFAULT NULL,
  `Sire` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SireRegNum` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SireBreed` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SireStatus` int(10) NOT NULL DEFAULT '0',
  `DamId` int(10) DEFAULT NULL,
  `Dam` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DamRegNum` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DamBreed` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DamStatus` int(10) NOT NULL DEFAULT '0',
  `Colour` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FleeceDetails` text COLLATE utf8_unicode_ci,
  `FibreTestingAuthority` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShowResults` text COLLATE utf8_unicode_ci,
  `isStud` tinyint(1) NOT NULL DEFAULT '0',
  `FarmFee` int(10) NOT NULL DEFAULT '0',
  `DriveFee` int(10) NOT NULL DEFAULT '0',
  `MobileFee` int(10) NOT NULL DEFAULT '0',
  `forSale` tinyint(1) NOT NULL DEFAULT '0',
  `Price` int(10) NOT NULL DEFAULT '0',
  `IsFeatured` tinyint(3) NOT NULL DEFAULT '0',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `IsPregnant` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Animals`
--

LOCK TABLES `Animals` WRITE;
/*!40000 ALTER TABLE `Animals` DISABLE KEYS */;
/*!40000 ALTER TABLE `Animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalsPages`
--

DROP TABLE IF EXISTS `AnimalsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnimalsPages` (
  `AnimalId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`AnimalId`,`PageId`),
  KEY `PageId` (`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Animal categories (JOIN AnimalId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalsPages`
--

LOCK TABLES `AnimalsPages` WRITE;
/*!40000 ALTER TABLE `AnimalsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnimalsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalsSocicities`
--

DROP TABLE IF EXISTS `AnimalsSocicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnimalsSocicities` (
  `AnimalId` int(10) unsigned NOT NULL,
  `SocicitiesId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`AnimalId`,`SocicitiesId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalsSocicities`
--

LOCK TABLES `AnimalsSocicities` WRITE;
/*!40000 ALTER TABLE `AnimalsSocicities` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnimalsSocicities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AppointmentRequests`
--

DROP TABLE IF EXISTS `AppointmentRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AppointmentRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `EventDate` date NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentTime` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `GDPR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Appointment requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AppointmentRequests`
--

LOCK TABLES `AppointmentRequests` WRITE;
/*!40000 ALTER TABLE `AppointmentRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `AppointmentRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ArtistsDiscs`
--

DROP TABLE IF EXISTS `ArtistsDiscs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ArtistsDiscs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ArtistsDiscs`
--

LOCK TABLES `ArtistsDiscs` WRITE;
/*!40000 ALTER TABLE `ArtistsDiscs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ArtistsDiscs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Authors`
--

DROP TABLE IF EXISTS `Authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Authors` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Authors`
--

LOCK TABLES `Authors` WRITE;
/*!40000 ALTER TABLE `Authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Availability`
--

DROP TABLE IF EXISTS `Availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Availability` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Availability`
--

LOCK TABLES `Availability` WRITE;
/*!40000 ALTER TABLE `Availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `Availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BER`
--

DROP TABLE IF EXISTS `BER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BER` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BER`
--

LOCK TABLES `BER` WRITE;
/*!40000 ALTER TABLE `BER` DISABLE KEYS */;
/*!40000 ALTER TABLE `BER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BoipaPaymentRecord`
--

DROP TABLE IF EXISTS `BoipaPaymentRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BoipaPaymentRecord` (
  `OrderId` int(10) unsigned NOT NULL,
  `CardType` enum('amex','diners','laser','mc','mc/debit','switch','uatp','visa','visa/debit') COLLATE utf8_unicode_ci NOT NULL,
  `Result` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `MerchantId` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `MerchantTxId` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `TxId` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Currency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerId` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Action` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `PAN` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `BrandId` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `PaymentSolutionId` char(18) COLLATE utf8_unicode_ci NOT NULL,
  `FreeText` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Language` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `AcquirerAmount` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `AcquirerCurrency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `PaymentSolutionDetails` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Should be Type: JSON, but older MySQL does not yet support it',
  `Status` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Errors` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BoipaPaymentRecord`
--

LOCK TABLES `BoipaPaymentRecord` WRITE;
/*!40000 ALTER TABLE `BoipaPaymentRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `BoipaPaymentRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookCovers`
--

DROP TABLE IF EXISTS `BookCovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookCovers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Value` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookCovers`
--

LOCK TABLES `BookCovers` WRITE;
/*!40000 ALTER TABLE `BookCovers` DISABLE KEYS */;
/*!40000 ALTER TABLE `BookCovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookLists`
--

DROP TABLE IF EXISTS `BookLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookLists` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(105) COLLATE utf8_unicode_ci NOT NULL,
  `SchoolId` int(10) NOT NULL,
  `SchoolYearId` char(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`SchoolId`,`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookLists`
--

LOCK TABLES `BookLists` WRITE;
/*!40000 ALTER TABLE `BookLists` DISABLE KEYS */;
/*!40000 ALTER TABLE `BookLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bookings` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` char(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Time` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Kids` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Boys` char(3) COLLATE utf8_unicode_ci DEFAULT '',
  `BoysNames` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Girls` char(3) COLLATE utf8_unicode_ci DEFAULT '',
  `GirlsNames` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `KidNames` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comments` text COLLATE utf8_unicode_ci,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branches`
--

DROP TABLE IF EXISTS `Branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Branches` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BranchName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Eircode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Facebook` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Instagram` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Twitter` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GDPR` tinyint(1) NOT NULL,
  `Type` enum('branch','board') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'branch',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branches`
--

LOCK TABLES `Branches` WRITE;
/*!40000 ALTER TABLE `Branches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BrandhubCustomers`
--

DROP TABLE IF EXISTS `BrandhubCustomers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BrandhubCustomers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `ResellerId` int(10) unsigned DEFAULT '0',
  `AccountNumber` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `VATReg` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Fax` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(60) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(90) COLLATE utf8_unicode_ci DEFAULT '',
  `LoyaltyPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `Currency` enum('EUR','GBP','USD','AUD') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EUR',
  `Approved` tinyint(1) unsigned DEFAULT '2',
  `Display` tinyint(1) unsigned DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BrandhubCustomers`
--

LOCK TABLES `BrandhubCustomers` WRITE;
/*!40000 ALTER TABLE `BrandhubCustomers` DISABLE KEYS */;
/*!40000 ALTER TABLE `BrandhubCustomers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brands`
--

DROP TABLE IF EXISTS `Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brands` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Pages` text COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Slogan` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Web` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brands`
--

LOCK TABLES `Brands` WRITE;
/*!40000 ALTER TABLE `Brands` DISABLE KEYS */;
INSERT INTO `Brands` VALUES (1,1,'','Abbey Machinery','abbey-machinery','','','','',1,'','',''),(2,2,'','Battioni','battioni','','','','',1,'','',''),(4,3,'','KUHN','kuhn','','','','',1,'','',''),(5,4,'','McHale','mchale','','','','',1,'','',''),(6,5,'','John Deere','john-deere','','','','',1,'','','');
/*!40000 ALTER TABLE `Brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Breeds`
--

DROP TABLE IF EXISTS `Breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Breeds` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Breeds`
--

LOCK TABLES `Breeds` WRITE;
/*!40000 ALTER TABLE `Breeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `Breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessDirectory`
--

DROP TABLE IF EXISTS `BusinessDirectory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessDirectory` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `UserId` int(10) unsigned DEFAULT NULL,
  `TypeId` int(10) unsigned DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(1) NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(80) COLLATE utf8_unicode_ci NOT NULL,
  `ContactName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `PrivateName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `PrivatePhone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `PrivateMobile` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `PrivateFax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AddressCountry` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AddressLocality` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapsZoom` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `MapsStreetView` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MapsInfo` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MapsType` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Url` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(3) NOT NULL DEFAULT '0',
  `Pages` text COLLATE utf8_unicode_ci,
  `IndustryId` int(10) unsigned DEFAULT NULL,
  `SiteLinked` int(11) NOT NULL DEFAULT '0',
  `Emailed` int(11) NOT NULL DEFAULT '0',
  `Viewed` int(11) NOT NULL DEFAULT '0',
  `ShowContactName` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ShowWebsite` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ShowEmail` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessDirectory`
--

LOCK TABLES `BusinessDirectory` WRITE;
/*!40000 ALTER TABLE `BusinessDirectory` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessDirectory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessDirectoryContactRequests`
--

DROP TABLE IF EXISTS `BusinessDirectoryContactRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessDirectoryContactRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactName` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactPhone` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactMobile` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactFax` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactEmail` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactWho` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BusinessId` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessDirectoryContactRequests`
--

LOCK TABLES `BusinessDirectoryContactRequests` WRITE;
/*!40000 ALTER TABLE `BusinessDirectoryContactRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessDirectoryContactRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessDirectoryListingTypes`
--

DROP TABLE IF EXISTS `BusinessDirectoryListingTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessDirectoryListingTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessDirectoryListingTypes`
--

LOCK TABLES `BusinessDirectoryListingTypes` WRITE;
/*!40000 ALTER TABLE `BusinessDirectoryListingTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessDirectoryListingTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeColours`
--

DROP TABLE IF EXISTS `CakeColours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeColours` (
  `CakeId` int(10) unsigned NOT NULL,
  `ColourId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CakeId`,`ColourId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeColours`
--

LOCK TABLES `CakeColours` WRITE;
/*!40000 ALTER TABLE `CakeColours` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeColours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeExtrasAvailable`
--

DROP TABLE IF EXISTS `CakeExtrasAvailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeExtrasAvailable` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Position` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Position` (`Position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeExtrasAvailable`
--

LOCK TABLES `CakeExtrasAvailable` WRITE;
/*!40000 ALTER TABLE `CakeExtrasAvailable` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeExtrasAvailable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeExtrasPrices`
--

DROP TABLE IF EXISTS `CakeExtrasPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeExtrasPrices` (
  `CakeId` int(10) unsigned NOT NULL,
  `ExtraId` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CakeId`,`ExtraId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeExtrasPrices`
--

LOCK TABLES `CakeExtrasPrices` WRITE;
/*!40000 ALTER TABLE `CakeExtrasPrices` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeExtrasPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeLogoSizes`
--

DROP TABLE IF EXISTS `CakeLogoSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeLogoSizes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeLogoSizes`
--

LOCK TABLES `CakeLogoSizes` WRITE;
/*!40000 ALTER TABLE `CakeLogoSizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeLogoSizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeLogoSizesPrices`
--

DROP TABLE IF EXISTS `CakeLogoSizesPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeLogoSizesPrices` (
  `CakeId` int(10) unsigned NOT NULL,
  `SizeId` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CakeId`,`SizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeLogoSizesPrices`
--

LOCK TABLES `CakeLogoSizesPrices` WRITE;
/*!40000 ALTER TABLE `CakeLogoSizesPrices` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeLogoSizesPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeSizes`
--

DROP TABLE IF EXISTS `CakeSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeSizes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Serves` char(10) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeSizes`
--

LOCK TABLES `CakeSizes` WRITE;
/*!40000 ALTER TABLE `CakeSizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeSizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeSizesPrices`
--

DROP TABLE IF EXISTS `CakeSizesPrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeSizesPrices` (
  `CakeId` int(10) unsigned NOT NULL,
  `SizeId` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CakeId`,`SizeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeSizesPrices`
--

LOCK TABLES `CakeSizesPrices` WRITE;
/*!40000 ALTER TABLE `CakeSizesPrices` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeSizesPrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeSpongeTypesAvailable`
--

DROP TABLE IF EXISTS `CakeSpongeTypesAvailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeSpongeTypesAvailable` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeSpongeTypesAvailable`
--

LOCK TABLES `CakeSpongeTypesAvailable` WRITE;
/*!40000 ALTER TABLE `CakeSpongeTypesAvailable` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeSpongeTypesAvailable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakeSpongeTypesSelected`
--

DROP TABLE IF EXISTS `CakeSpongeTypesSelected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakeSpongeTypesSelected` (
  `CakeId` int(10) unsigned NOT NULL,
  `SpongeId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CakeId`,`SpongeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakeSpongeTypesSelected`
--

LOCK TABLES `CakeSpongeTypesSelected` WRITE;
/*!40000 ALTER TABLE `CakeSpongeTypesSelected` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakeSpongeTypesSelected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cakes`
--

DROP TABLE IF EXISTS `Cakes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cakes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Highlights` text COLLATE utf8_unicode_ci NOT NULL,
  `SloganId` int(10) unsigned NOT NULL,
  `SpecialOfferActive` tinyint(1) unsigned NOT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `SpecialOfferContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `IsFeatured` tinyint(3) unsigned NOT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `GlutenFreeAvailable` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PartialPaymentAvailable` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cakes`
--

LOCK TABLES `Cakes` WRITE;
/*!40000 ALTER TABLE `Cakes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cakes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakesPages`
--

DROP TABLE IF EXISTS `CakesPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakesPages` (
  `CakeId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CakeId`,`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakesPages`
--

LOCK TABLES `CakesPages` WRITE;
/*!40000 ALTER TABLE `CakesPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakesPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CakesPurchased`
--

DROP TABLE IF EXISTS `CakesPurchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CakesPurchased` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `CakeId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Extras` text COLLATE utf8_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  `Text` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Size` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Colour` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `BasePrice` decimal(10,2) NOT NULL,
  `ExtrasPrice` decimal(10,2) NOT NULL,
  `LogoPrice` decimal(10,2) NOT NULL,
  `OverallPrice` decimal(10,2) NOT NULL,
  `PricePaid` decimal(10,2) NOT NULL,
  `Logo` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PartialPayment` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `Status` enum('ordered','collected','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ordered',
  `Quantity` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `CakeId` (`CakeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CakesPurchased`
--

LOCK TABLES `CakesPurchased` WRITE;
/*!40000 ALTER TABLE `CakesPurchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `CakesPurchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarModels`
--

DROP TABLE IF EXISTS `CarModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarModels` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarModels`
--

LOCK TABLES `CarModels` WRITE;
/*!40000 ALTER TABLE `CarModels` DISABLE KEYS */;
/*!40000 ALTER TABLE `CarModels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CarbonRegistry`
--

DROP TABLE IF EXISTS `CarbonRegistry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CarbonRegistry` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` tinyint(4) DEFAULT NULL,
  `Address` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` tinyint(4) DEFAULT NULL,
  `Latitude` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Longitude` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `CarbonCredit` decimal(10,2) DEFAULT '0.00',
  `CreditType` tinyint(4) DEFAULT NULL,
  `Quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CarbonRegistry`
--

LOCK TABLES `CarbonRegistry` WRITE;
/*!40000 ALTER TABLE `CarbonRegistry` DISABLE KEYS */;
/*!40000 ALTER TABLE `CarbonRegistry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carts`
--

DROP TABLE IF EXISTS `Carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Carts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `Message` text COLLATE utf8_unicode_ci,
  `ShippingFirstName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingLastName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingAddress` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingStreet` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingTown` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingCode` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingState` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingCountry` char(60) COLLATE utf8_unicode_ci DEFAULT 'Ireland',
  `ShippingPhone` char(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingFirstName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingLastName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingAddress` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingStreet` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingTown` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingCode` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingState` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingCountry` char(60) COLLATE utf8_unicode_ci DEFAULT 'Ireland',
  `CompanyName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VatReg` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyReg` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `CardFee` decimal(10,2) DEFAULT NULL,
  `Shipping` int(10) DEFAULT NULL,
  `ShippingName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CollectionTime` int(10) DEFAULT NULL,
  `CollectionDate` date DEFAULT NULL,
  `DiscountToken` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Discount` decimal(10,2) unsigned DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL,
  `LoyaltyCard` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentType` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PurchaseOrderNumber` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Points` int(10) DEFAULT NULL,
  `Currency` char(4) COLLATE utf8_unicode_ci DEFAULT 'EUR',
  `Coupon` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueUser` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carts`
--

LOCK TABLES `Carts` WRITE;
/*!40000 ALTER TABLE `Carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartsItems`
--

DROP TABLE IF EXISTS `CartsItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartsItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `ProductVersion` int(10) unsigned NOT NULL,
  `Qty` int(10) unsigned DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueUserProduct` (`UserId`,`ItemId`,`ProductVersion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartsItems`
--

LOCK TABLES `CartsItems` WRITE;
/*!40000 ALTER TABLE `CartsItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartsItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CartsItemsData`
--

DROP TABLE IF EXISTS `CartsItemsData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CartsItemsData` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `Qty` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `PricePaying` decimal(10,2) NOT NULL,
  `Discount` decimal(10,2) DEFAULT '0.00',
  `OriginationCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `RushCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `CreatedAt` int(10) unsigned NOT NULL,
  `AccountRequired` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AllowPartialPayment` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SkipValidation` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Message` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `Currency` char(4) COLLATE utf8_unicode_ci DEFAULT 'EUR',
  `PrintCosts` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`ItemId`,`ItemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CartsItemsData`
--

LOCK TABLES `CartsItemsData` WRITE;
/*!40000 ALTER TABLE `CartsItemsData` DISABLE KEYS */;
/*!40000 ALTER TABLE `CartsItemsData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Castles`
--

DROP TABLE IF EXISTS `Castles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Castles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(3) unsigned DEFAULT '1',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PropertyType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AccomodationType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Stars` tinyint(1) NOT NULL DEFAULT '0',
  `Sleeps` int(5) NOT NULL DEFAULT '0',
  `Bedrooms` int(5) NOT NULL DEFAULT '0',
  `BedroomsDouble` int(5) NOT NULL DEFAULT '0',
  `BedroomsTwin` int(5) NOT NULL DEFAULT '0',
  `BedroomsSingle` int(5) NOT NULL DEFAULT '0',
  `Bathrooms` int(5) NOT NULL DEFAULT '0',
  `ShowerRooms` int(5) NOT NULL DEFAULT '0',
  `WC` int(5) NOT NULL DEFAULT '0',
  `EnsuiteBathrooms` int(5) NOT NULL DEFAULT '0',
  `CheckIn` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CheckOut` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IsFeatured` tinyint(1) NOT NULL DEFAULT '0',
  `SquareFeet` int(5) NOT NULL DEFAULT '0',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Region` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Eircode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Latitude` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Longitude` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `History` text COLLATE utf8_unicode_ci,
  `Video` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `RelatedOf` int(10) NOT NULL DEFAULT '0',
  `WeddingsDescription` text COLLATE utf8_unicode_ci,
  `LogBurningFire` tinyint(1) DEFAULT '0',
  `DrawingRoom` tinyint(1) DEFAULT '0',
  `DiningRoom` tinyint(1) DEFAULT '0',
  `BanquetingHall` tinyint(1) DEFAULT '0',
  `Wifi` tinyint(1) DEFAULT '0',
  `Banqueting` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `NearestAirport` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `PetFriendly` tinyint(1) DEFAULT '0',
  `Stables` tinyint(1) DEFAULT '0',
  `GolfCourse` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Castles`
--

LOCK TABLES `Castles` WRITE;
/*!40000 ALTER TABLE `Castles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Castles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesActivities`
--

DROP TABLE IF EXISTS `CastlesActivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesActivities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` tinyint(3) DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SupplierId` int(10) DEFAULT NULL,
  `RegionId` int(10) DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Description2` text COLLATE utf8_unicode_ci,
  `Address` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` tinyint(4) DEFAULT NULL,
  `Country` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesActivities`
--

LOCK TABLES `CastlesActivities` WRITE;
/*!40000 ALTER TABLE `CastlesActivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesActivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesActivitiesTypes`
--

DROP TABLE IF EXISTS `CastlesActivitiesTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesActivitiesTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Description2` text COLLATE utf8_unicode_ci,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesActivitiesTypes`
--

LOCK TABLES `CastlesActivitiesTypes` WRITE;
/*!40000 ALTER TABLE `CastlesActivitiesTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesActivitiesTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesAttractions`
--

DROP TABLE IF EXISTS `CastlesAttractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesAttractions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SupplierId` int(10) DEFAULT NULL,
  `RegionId` int(10) DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Address` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` tinyint(4) DEFAULT NULL,
  `Country` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesAttractions`
--

LOCK TABLES `CastlesAttractions` WRITE;
/*!40000 ALTER TABLE `CastlesAttractions` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesAttractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesBooking`
--

DROP TABLE IF EXISTS `CastlesBooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesBooking` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  `FirstName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateFrom` date NOT NULL,
  `DateTo` date NOT NULL,
  `Guests` int(10) DEFAULT '0',
  `Interest` char(25) COLLATE utf8_unicode_ci DEFAULT '',
  `Activities` text COLLATE utf8_unicode_ci,
  `Attractions` text COLLATE utf8_unicode_ci,
  `ThemedEvents` text COLLATE utf8_unicode_ci,
  `Message` text COLLATE utf8_unicode_ci,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesBooking`
--

LOCK TABLES `CastlesBooking` WRITE;
/*!40000 ALTER TABLE `CastlesBooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesBooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesBookingTemp`
--

DROP TABLE IF EXISTS `CastlesBookingTemp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesBookingTemp` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  `FirstName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LastName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `Guests` int(10) DEFAULT '0',
  `Interest` char(25) COLLATE utf8_unicode_ci DEFAULT '',
  `Activities` text COLLATE utf8_unicode_ci,
  `ThemedEvents` text COLLATE utf8_unicode_ci,
  `Message` text COLLATE utf8_unicode_ci,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Token` (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesBookingTemp`
--

LOCK TABLES `CastlesBookingTemp` WRITE;
/*!40000 ALTER TABLE `CastlesBookingTemp` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesBookingTemp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesCastlesActivities`
--

DROP TABLE IF EXISTS `CastlesCastlesActivities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesCastlesActivities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ActivityId` int(10) unsigned NOT NULL DEFAULT '0',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesCastlesActivities`
--

LOCK TABLES `CastlesCastlesActivities` WRITE;
/*!40000 ALTER TABLE `CastlesCastlesActivities` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesCastlesActivities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesCastlesAttractions`
--

DROP TABLE IF EXISTS `CastlesCastlesAttractions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesCastlesAttractions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AttractionId` int(10) unsigned NOT NULL DEFAULT '0',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesCastlesAttractions`
--

LOCK TABLES `CastlesCastlesAttractions` WRITE;
/*!40000 ALTER TABLE `CastlesCastlesAttractions` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesCastlesAttractions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesCastlesFacilities`
--

DROP TABLE IF EXISTS `CastlesCastlesFacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesCastlesFacilities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FacilityId` int(10) unsigned NOT NULL DEFAULT '0',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesCastlesFacilities`
--

LOCK TABLES `CastlesCastlesFacilities` WRITE;
/*!40000 ALTER TABLE `CastlesCastlesFacilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesCastlesFacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesCastlesServices`
--

DROP TABLE IF EXISTS `CastlesCastlesServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesCastlesServices` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ServiceId` int(10) unsigned NOT NULL DEFAULT '0',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesCastlesServices`
--

LOCK TABLES `CastlesCastlesServices` WRITE;
/*!40000 ALTER TABLE `CastlesCastlesServices` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesCastlesServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesCastlesThemedEvents`
--

DROP TABLE IF EXISTS `CastlesCastlesThemedEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesCastlesThemedEvents` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventId` int(10) unsigned NOT NULL DEFAULT '0',
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesCastlesThemedEvents`
--

LOCK TABLES `CastlesCastlesThemedEvents` WRITE;
/*!40000 ALTER TABLE `CastlesCastlesThemedEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesCastlesThemedEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesContacts`
--

DROP TABLE IF EXISTS `CastlesContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesContacts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  `IsPrimary` tinyint(1) NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesContacts`
--

LOCK TABLES `CastlesContacts` WRITE;
/*!40000 ALTER TABLE `CastlesContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesFacilities`
--

DROP TABLE IF EXISTS `CastlesFacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesFacilities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` tinyint(3) DEFAULT '0',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesFacilities`
--

LOCK TABLES `CastlesFacilities` WRITE;
/*!40000 ALTER TABLE `CastlesFacilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesFacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesFacilitiesTypes`
--

DROP TABLE IF EXISTS `CastlesFacilitiesTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesFacilitiesTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesFacilitiesTypes`
--

LOCK TABLES `CastlesFacilitiesTypes` WRITE;
/*!40000 ALTER TABLE `CastlesFacilitiesTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesFacilitiesTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesPages`
--

DROP TABLE IF EXISTS `CastlesPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesPages` (
  `CastleId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CastleId`,`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesPages`
--

LOCK TABLES `CastlesPages` WRITE;
/*!40000 ALTER TABLE `CastlesPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesRegions`
--

DROP TABLE IF EXISTS `CastlesRegions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesRegions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesRegions`
--

LOCK TABLES `CastlesRegions` WRITE;
/*!40000 ALTER TABLE `CastlesRegions` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesRegions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesRooms`
--

DROP TABLE IF EXISTS `CastlesRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesRooms` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CastleId` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Position` tinyint(4) NOT NULL DEFAULT '0',
  `Price` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesRooms`
--

LOCK TABLES `CastlesRooms` WRITE;
/*!40000 ALTER TABLE `CastlesRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesServices`
--

DROP TABLE IF EXISTS `CastlesServices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesServices` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SupplierId` int(10) DEFAULT NULL,
  `RegionId` int(10) DEFAULT NULL,
  `Address` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` tinyint(4) DEFAULT NULL,
  `Country` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Description2` text COLLATE utf8_unicode_ci,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Type` tinyint(3) DEFAULT '0',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesServices`
--

LOCK TABLES `CastlesServices` WRITE;
/*!40000 ALTER TABLE `CastlesServices` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesServices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesServicesTypes`
--

DROP TABLE IF EXISTS `CastlesServicesTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesServicesTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Description2` text COLLATE utf8_unicode_ci,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesServicesTypes`
--

LOCK TABLES `CastlesServicesTypes` WRITE;
/*!40000 ALTER TABLE `CastlesServicesTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesServicesTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CastlesThemedEvents`
--

DROP TABLE IF EXISTS `CastlesThemedEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CastlesThemedEvents` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SupplierId` int(10) DEFAULT NULL,
  `RegionId` int(10) DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Description2` text COLLATE utf8_unicode_ci,
  `Address` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` tinyint(4) DEFAULT NULL,
  `Country` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Contact` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CastlesThemedEvents`
--

LOCK TABLES `CastlesThemedEvents` WRITE;
/*!40000 ALTER TABLE `CastlesThemedEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `CastlesThemedEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned DEFAULT NULL,
  `Position` int(10) unsigned DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Topic` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `IndexName` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Certificates`
--

DROP TABLE IF EXISTS `Certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Certificates` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) DEFAULT '1',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Price` decimal(10,2) DEFAULT '0.00',
  `CertType` enum('','RAC','Fire','Both') COLLATE utf8_unicode_ci DEFAULT '',
  `CompanySize` enum('','SoleT','Small','Medium') COLLATE utf8_unicode_ci DEFAULT '',
  `DisplayFrom` datetime DEFAULT NULL,
  `DisplayTo` datetime DEFAULT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Renewal` tinyint(1) DEFAULT '0',
  `ValidFrom` date DEFAULT NULL,
  `ValidTo` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Certificates`
--

LOCK TABLES `Certificates` WRITE;
/*!40000 ALTER TABLE `Certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `Certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChampionshipEntrants`
--

DROP TABLE IF EXISTS `ChampionshipEntrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChampionshipEntrants` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ChampionshipId` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShowId` int(10) unsigned NOT NULL DEFAULT '0',
  `Animals` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IHRNumbers` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `RuleAgree` tinyint(3) NOT NULL DEFAULT '0',
  `PublishAgree` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChampionshipEntrants`
--

LOCK TABLES `ChampionshipEntrants` WRITE;
/*!40000 ALTER TABLE `ChampionshipEntrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChampionshipEntrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChampionshipPlaces`
--

DROP TABLE IF EXISTS `ChampionshipPlaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChampionshipPlaces` (
  `ChampionshipId` int(10) unsigned NOT NULL,
  `EntrantId` int(10) unsigned NOT NULL,
  `Place` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ChampionshipId`,`EntrantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChampionshipPlaces`
--

LOCK TABLES `ChampionshipPlaces` WRITE;
/*!40000 ALTER TABLE `ChampionshipPlaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChampionshipPlaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChampionshipSponsors`
--

DROP TABLE IF EXISTS `ChampionshipSponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChampionshipSponsors` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Url` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ContactName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address1` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Postcode` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChampionshipSponsors`
--

LOCK TABLES `ChampionshipSponsors` WRITE;
/*!40000 ALTER TABLE `ChampionshipSponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChampionshipSponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChampionshipTypes`
--

DROP TABLE IF EXISTS `ChampionshipTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChampionshipTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='module/eventtypes. For sorting events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChampionshipTypes`
--

LOCK TABLES `ChampionshipTypes` WRITE;
/*!40000 ALTER TABLE `ChampionshipTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChampionshipTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Championships`
--

DROP TABLE IF EXISTS `Championships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Championships` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `TypeId` int(10) unsigned NOT NULL DEFAULT '0',
  `VenueAddress` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `VenueStreet` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `VenueTown` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `VenueCode` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `VenueCounty` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `VenueCountry` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Rules` text COLLATE utf8_unicode_ci,
  `Deadline` datetime DEFAULT NULL,
  `EventDate` datetime DEFAULT NULL,
  `EntryFee` decimal(10,2) unsigned DEFAULT NULL,
  `TotalPrize` decimal(10,2) unsigned DEFAULT NULL,
  `Prize1` decimal(10,2) unsigned DEFAULT NULL,
  `Prize2` decimal(10,2) unsigned DEFAULT NULL,
  `Prize3` decimal(10,2) unsigned DEFAULT NULL,
  `Prize4` decimal(10,2) unsigned DEFAULT NULL,
  `Prize5` decimal(10,2) unsigned DEFAULT NULL,
  `Prize6` decimal(10,2) unsigned DEFAULT NULL,
  `Prize7` decimal(10,2) unsigned DEFAULT NULL,
  `Prize8` decimal(10,2) unsigned DEFAULT NULL,
  `Prize9` decimal(10,2) unsigned DEFAULT NULL,
  `Prize10` decimal(10,2) unsigned DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `ValidatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Championships`
--

LOCK TABLES `Championships` WRITE;
/*!40000 ALTER TABLE `Championships` DISABLE KEYS */;
/*!40000 ALTER TABLE `Championships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChampionshipsChampionshipSponsors`
--

DROP TABLE IF EXISTS `ChampionshipsChampionshipSponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChampionshipsChampionshipSponsors` (
  `ChampionShipId` int(10) unsigned NOT NULL,
  `SponsorId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ChampionShipId`,`SponsorId`),
  KEY `SponsorId` (`SponsorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='JOIN ChampionShip to Sponsors';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChampionshipsChampionshipSponsors`
--

LOCK TABLES `ChampionshipsChampionshipSponsors` WRITE;
/*!40000 ALTER TABLE `ChampionshipsChampionshipSponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChampionshipsChampionshipSponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChampionshipsShowDirectory`
--

DROP TABLE IF EXISTS `ChampionshipsShowDirectory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ChampionshipsShowDirectory` (
  `ChampionshipId` int(10) unsigned NOT NULL,
  `ShowId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ChampionshipId`,`ShowId`),
  KEY `ShowId` (`ShowId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='JOIN Championship to Show';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChampionshipsShowDirectory`
--

LOCK TABLES `ChampionshipsShowDirectory` WRITE;
/*!40000 ALTER TABLE `ChampionshipsShowDirectory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChampionshipsShowDirectory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Circulars`
--

DROP TABLE IF EXISTS `Circulars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Circulars` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Subject` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `Type` tinyint(3) unsigned DEFAULT '1',
  `Display` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Circulars`
--

LOCK TABLES `Circulars` WRITE;
/*!40000 ALTER TABLE `Circulars` DISABLE KEYS */;
/*!40000 ALTER TABLE `Circulars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clients` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Website` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Testimonial` text COLLATE utf8_unicode_ci,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsZoom` tinyint(3) unsigned DEFAULT '16',
  `MapsInfo` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsType` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsStreetView` tinyint(3) DEFAULT '1',
  `Loc8Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Url` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Position` tinyint(4) unsigned DEFAULT '0',
  `IndustryId` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubContacts`
--

DROP TABLE IF EXISTS `ClubContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubContacts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `ClubId` int(10) NOT NULL DEFAULT '0',
  `Position` int(10) NOT NULL DEFAULT '0',
  `FirstName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tullamore',
  `County` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubContacts`
--

LOCK TABLES `ClubContacts` WRITE;
/*!40000 ALTER TABLE `ClubContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubDetails`
--

DROP TABLE IF EXISTS `ClubDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubDetails` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(90) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Website` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `PaymentStatus` enum('paid','unpaid') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembershipStatus` enum('registered','paid','incomplete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentMethodId` int(11) NOT NULL,
  `PriceType` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DatePayment` date DEFAULT NULL,
  `CardIssued` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` int(10) NOT NULL DEFAULT '0',
  `OtherAssociation` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Conduct` tinyint(4) NOT NULL DEFAULT '0',
  `InsurancePolicy` tinyint(4) NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `MemberId` int(10) unsigned NOT NULL DEFAULT '0',
  `Code` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubDetails`
--

LOCK TABLES `ClubDetails` WRITE;
/*!40000 ALTER TABLE `ClubDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubDirectory`
--

DROP TABLE IF EXISTS `ClubDirectory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubDirectory` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(4) DEFAULT '0',
  `Comments` text COLLATE utf8_unicode_ci COMMENT 'This information is used only at the back end.',
  `Description` text COLLATE utf8_unicode_ci,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `CategoryId` int(10) unsigned NOT NULL,
  `LocationId` int(10) unsigned NOT NULL,
  `FacilityId` int(10) unsigned DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactName` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '0',
  `IpAddress` char(18) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubDirectory`
--

LOCK TABLES `ClubDirectory` WRITE;
/*!40000 ALTER TABLE `ClubDirectory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubDirectory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubEntities`
--

DROP TABLE IF EXISTS `ClubEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubEntities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` int(10) unsigned NOT NULL DEFAULT '0',
  `ClubTeamId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubEntities`
--

LOCK TABLES `ClubEntities` WRITE;
/*!40000 ALTER TABLE `ClubEntities` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubMembers`
--

DROP TABLE IF EXISTS `ClubMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubMembers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Website` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubMembers`
--

LOCK TABLES `ClubMembers` WRITE;
/*!40000 ALTER TABLE `ClubMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubTeamTypes`
--

DROP TABLE IF EXISTS `ClubTeamTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubTeamTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubTeamTypes`
--

LOCK TABLES `ClubTeamTypes` WRITE;
/*!40000 ALTER TABLE `ClubTeamTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubTeamTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClubTeams`
--

DROP TABLE IF EXISTS `ClubTeams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClubTeams` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `TypeId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AgeType` enum('Adult','Underage') COLLATE utf8_unicode_ci DEFAULT 'Underage',
  `YearBirth` int(11) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `AgeType` (`AgeType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClubTeams`
--

LOCK TABLES `ClubTeams` WRITE;
/*!40000 ALTER TABLE `ClubTeams` DISABLE KEYS */;
/*!40000 ALTER TABLE `ClubTeams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CollectionRequests`
--

DROP TABLE IF EXISTS `CollectionRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CollectionRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Eircode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Loose` int(10) unsigned NOT NULL DEFAULT '0',
  `Palletised` int(10) unsigned NOT NULL DEFAULT '0',
  `Cage` int(10) unsigned NOT NULL DEFAULT '0',
  `Bin` int(10) unsigned NOT NULL DEFAULT '0',
  `ExistingCustomer` tinyint(1) unsigned DEFAULT '1',
  `Comments` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Materials` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CollectionRequests`
--

LOCK TABLES `CollectionRequests` WRITE;
/*!40000 ALTER TABLE `CollectionRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `CollectionRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colours`
--

DROP TABLE IF EXISTS `Colours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Colours` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colours`
--

LOCK TABLES `Colours` WRITE;
/*!40000 ALTER TABLE `Colours` DISABLE KEYS */;
/*!40000 ALTER TABLE `Colours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comments`
--

DROP TABLE IF EXISTS `Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned DEFAULT NULL,
  `UserId` int(10) unsigned DEFAULT NULL,
  `SourceId` int(10) unsigned DEFAULT NULL,
  `SourceTable` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `VotesUp` int(11) DEFAULT '0',
  `VotesDown` int(11) DEFAULT '0',
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comments`
--

LOCK TABLES `Comments` WRITE;
/*!40000 ALTER TABLE `Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Companies`
--

DROP TABLE IF EXISTS `Companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Companies` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned NOT NULL DEFAULT '0',
  `CategoryId` int(10) unsigned NOT NULL DEFAULT '0',
  `TypeId` int(10) unsigned NOT NULL DEFAULT '1',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CRO` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `VAT` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Type` enum('','PubLC','PrivLC','SoleT','Other') COLLATE utf8_unicode_ci NOT NULL,
  `Size` enum('','SoleT','Small','Medium','Large') COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCountry` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Postcode` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Website` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `DateEstablished` date DEFAULT NULL,
  `Rating` tinyint(1) NOT NULL,
  `BlackList` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `BlacklistReason` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `DisplayAs` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companies`
--

LOCK TABLES `Companies` WRITE;
/*!40000 ALTER TABLE `Companies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyCategories`
--

DROP TABLE IF EXISTS `CompanyCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Position` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyCategories`
--

LOCK TABLES `CompanyCategories` WRITE;
/*!40000 ALTER TABLE `CompanyCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyContacts`
--

DROP TABLE IF EXISTS `CompanyContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyContacts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `CompanyId` int(10) NOT NULL DEFAULT '0',
  `Position` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FirstName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tullamore',
  `County` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Mobile` char(25) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyContacts`
--

LOCK TABLES `CompanyContacts` WRITE;
/*!40000 ALTER TABLE `CompanyContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyDetails`
--

DROP TABLE IF EXISTS `CompanyDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyDetails` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LandLine` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactPerson` char(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Website` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AboutUs` text COLLATE utf8_unicode_ci,
  `OpeningHours` text COLLATE utf8_unicode_ci,
  `CategoryId` int(10) DEFAULT '0',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `PaymentStatus` enum('paid','unpaid') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembershipStatus` enum('registered','paid','incomplete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentMethodId` int(11) NOT NULL,
  `PriceType` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DatePayment` date DEFAULT NULL,
  `CardIssued` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` int(10) NOT NULL DEFAULT '0',
  `Conduct` tinyint(4) NOT NULL DEFAULT '0',
  `OtherAssociation` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `InsurancePolicy` tinyint(4) NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `EmailVisible` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `MemberId` int(10) unsigned NOT NULL DEFAULT '0',
  `Approved` tinyint(3) NOT NULL DEFAULT '0',
  `IsActive` tinyint(3) NOT NULL DEFAULT '1',
  `TypeId` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyDetails`
--

LOCK TABLES `CompanyDetails` WRITE;
/*!40000 ALTER TABLE `CompanyDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyEmployees`
--

DROP TABLE IF EXISTS `CompanyEmployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyEmployees` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CompanyRegistrationId` int(10) unsigned NOT NULL DEFAULT '0',
  `CompanyId` int(10) DEFAULT '0',
  `Name` char(80) COLLATE utf8_unicode_ci NOT NULL,
  `PPSN` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Birth` date NOT NULL,
  `CertificateType` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CertificateNumber` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CertificateAwarded` date NOT NULL,
  `AwardingCentre` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyEmployees`
--

LOCK TABLES `CompanyEmployees` WRITE;
/*!40000 ALTER TABLE `CompanyEmployees` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyEmployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyMembers`
--

DROP TABLE IF EXISTS `CompanyMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyMembers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(200) COLLATE utf8_unicode_ci DEFAULT '',
  `Category` char(200) COLLATE utf8_unicode_ci DEFAULT '',
  `Website` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyMembers`
--

LOCK TABLES `CompanyMembers` WRITE;
/*!40000 ALTER TABLE `CompanyMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyRegistration`
--

DROP TABLE IF EXISTS `CompanyRegistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyRegistration` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `CompanyId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) DEFAULT '0',
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  `ApplicationType` enum('','RAC','Fire') COLLATE utf8_unicode_ci NOT NULL,
  `BusinessNature` enum('','c','e') COLLATE utf8_unicode_ci NOT NULL,
  `PrincipleContactName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `PrincipleContactPosition` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `PrincipleContactTelephone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `PrincipleContactEmail` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `SchemeContactName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `SchemeContactPosition` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `SchemeContactTelephone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `SchemeContactEmail` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `PercentageInstallation` int(3) unsigned NOT NULL,
  `PercentageService` int(3) unsigned NOT NULL,
  `EmployeesWorking` int(3) unsigned NOT NULL,
  `EmployeesCertified` int(3) unsigned NOT NULL,
  `Category1` tinyint(1) DEFAULT '0',
  `Category2` tinyint(1) DEFAULT '0',
  `Category3` tinyint(1) DEFAULT '0',
  `Category4` tinyint(1) DEFAULT '0',
  `RecoveryMachines` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WeighingFacilities` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `LeakDetectors` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Gauges` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VacuumPump` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RefrigerantTools` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CylinderHandTruck` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `17mmSpanners` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `17mmBoxSpanner` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `19mmSpanner` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `15mmSpanner` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PipeWrench` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TransportLid` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PTFETape` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `LeakDetection` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MasonryDrill` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RefrigerantTracking` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ListPublicly` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Displayed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CertIssued` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Approved` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CertSent` enum('Y','N','') COLLATE utf8_unicode_ci DEFAULT 'N',
  `CertSentOn` date DEFAULT NULL,
  `CertDate` date NOT NULL,
  `CertNo` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `OverallPrice` decimal(10,2) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ReminderMe` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Finished` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyRegistration`
--

LOCK TABLES `CompanyRegistration` WRITE;
/*!40000 ALTER TABLE `CompanyRegistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyRegistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompetitionCategories`
--

DROP TABLE IF EXISTS `CompetitionCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) NOT NULL DEFAULT '0',
  `Position` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompetitionCategories`
--

LOCK TABLES `CompetitionCategories` WRITE;
/*!40000 ALTER TABLE `CompetitionCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompetitionCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompetitionDisciplines`
--

DROP TABLE IF EXISTS `CompetitionDisciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionDisciplines` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) NOT NULL DEFAULT '0',
  `Position` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompetitionDisciplines`
--

LOCK TABLES `CompetitionDisciplines` WRITE;
/*!40000 ALTER TABLE `CompetitionDisciplines` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompetitionDisciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompetitionPlayers`
--

DROP TABLE IF EXISTS `CompetitionPlayers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionPlayers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `CompetitionId` int(10) NOT NULL DEFAULT '0',
  `Score` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompetitionPlayers`
--

LOCK TABLES `CompetitionPlayers` WRITE;
/*!40000 ALTER TABLE `CompetitionPlayers` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompetitionPlayers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompetitionTypes`
--

DROP TABLE IF EXISTS `CompetitionTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompetitionTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) NOT NULL DEFAULT '0',
  `Position` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompetitionTypes`
--

LOCK TABLES `CompetitionTypes` WRITE;
/*!40000 ALTER TABLE `CompetitionTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompetitionTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competitions`
--

DROP TABLE IF EXISTS `Competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Competitions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DisciplineId` int(10) NOT NULL DEFAULT '0',
  `Date` datetime NOT NULL,
  `TypeId` int(10) NOT NULL DEFAULT '0',
  `CategoryId` int(10) NOT NULL DEFAULT '0',
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Winner` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WinnerScore` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Results` text COLLATE utf8_unicode_ci,
  `Description` text COLLATE utf8_unicode_ci,
  `Fee` decimal(10,2) unsigned DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `CustomTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competitions`
--

LOCK TABLES `Competitions` WRITE;
/*!40000 ALTER TABLE `Competitions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Config`
--

DROP TABLE IF EXISTS `Config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Config` (
  `Name` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Config`
--

LOCK TABLES `Config` WRITE;
/*!40000 ALTER TABLE `Config` DISABLE KEYS */;
INSERT INTO `Config` VALUES ('access/message','YOU DON\'T HAVE THE APPROPRIATE PRIVILEGES TO VIEW THIS PAGE.'),('admin/products/filter','list'),('admin/products/list/code','1'),('adverts/change','8'),('adverts/change/time',''),('adverts/settings','page-rand'),('businessdirectory/assign/pages','1'),('businessdirectory/filter/industries','1'),('businessdirectory/header/search','1'),('businessdirectory/filter/name','1'),('businessdirectory/show/contactname','0'),('projectsportfolio/filter/sidebar','0'),('businessdirectory/use/locality','1'),('client/id','12'),('company/freeusers','3'),('member/status/default','Registered'),('default/users/group/id','1'),('flash/body/height','400'),('flash/body/width','1004'),('flash/top/height','260'),('flash/top/width','1004'),('forum/avatars','gravatar'),('forum/cats','1'),('forum/display/cats','mixed'),('forum/enabled','1'),('forum/gravatars','custom'),('forum/hidden','1'),('forum/icon_style','identicon'),('forum/icons','default'),('forum/moderation','none'),('forum/moderation/topics','none'),('forum/profile/hidden',''),('forum/signup',''),('forum/topic/new','0'),('forum/user_icon_personal','gravatar'),('site/homepage-pages/position','normal'),('images/brands/width','100'),('images/brands/x',''),('images/brands/y',''),('images/businessdirectory/width','0'),('images/clients/width','100'),('images/events/width','200'),('images/fading/delay','8000'),('images/fading/delay2','0'),('images/featured_projects/width',''),('images/featured/width','200'),('images/floatright/width','100'),('images/front/width','185'),('images/gallery/border','0'),('images/gallery/gap','5'),('images/gallery/number','3'),('images/gallery/width','304'),('images/homepage-pages/width','180'),('images/item/width','185'),('images/lightbox/cols','3'),('images/lightbox/width','305'),('images/links/width','135'),('images/locations_homepage/width','133'),('images/locations/width','400'),('images/news/width','200'),('images/partners_homepage/width','100'),('images/partners/width','135'),('images/projects/width','225'),('images/documents/width','135'),('images/ratio/x','5'),('images/ratio/y','3'),('images/related/width','120'),('images/special/width','230'),('images/staff/list/show',''),('images/staff/width',''),('images/testimonials/width','200'),('images/thumbs/crop/default','0'),('images/thumbs/fit/default','0'),('images/title/ratio/x','4'),('images/title/ratio/y','1'),('images/title/width','676'),('layout/bottom/include','1'),('layout/clients','industries'),('layout/color','weather'),('layout/color/preview',''),('layout/colour/preview',''),('layout/columns/brands','4'),('layout/columns/businessdirectory','3'),('layout/columns/children','3'),('layout/columns/events','1'),('layout/columns/homepage_pages','3'),('layout/columns/members','3'),('layout/columns/news','3'),('layout/columns/partners','1'),('layout/columns/partners/home','3'),('layout/columns/podcasts','6'),('layout/columns/products','3'),('layout/columns/projectsportfolio','3'),('layout/columns/relatedproducts','4'),('layout/columns/staff','4'),('layout/columns/staff/perpage','1'),('layout/columns/videos','3'),('layout/content2','1'),('layout/locations',''),('layout/locations/columns','1'),('layout/menu/horizontal',''),('layout/menu/vertical',''),('layout/products/display','table'),('layout/products/display/position','Float'),('layout/sitemap','none'),('layout/staff/showallbutton','1'),('site/menu/top/position','header'),('layout/truncate/businessdirectory','100'),('layout/truncate/default','120'),('layout/truncate/default/home',''),('layout/truncate/events',''),('layout/truncate/events/home',''),('layout/truncate/news','300'),('layout/truncate/news/home','80'),('layout/truncate/pages',''),('layout/truncate/pages/home',''),('layout/wraptext','0'),('map/display/coordinates','1'),('map/display/coordinates/preview',''),('map/extra_note',''),('map/extra_note/title',''),('map/height/homepage','237px'),('maps/width','460px'),('map/width/homepage','295px'),('maps/info',''),('maps/keys','AIzaSyAA5XDLlSyKZsWrwxNxELKCpneZ26qSuiY'),('maps/lat',''),('maps/long',''),('maps/zoom','7'),('member/status/passkey','Approved'),('membership/display/all','1'),('membership/payments','2'),('meta-tags/author',''),('meta-tags/description',''),('faqs/types','0'),('faqs/types/display','list'),('meta-tags/google-analytics',''),('meta-tags/keywords',''),('meta-tags/title',''),('meta-tags/title/after',''),('meta-tags/title/before',''),('meta-tags/verify-v1',''),('module/action_flags','0'),('module/adverts','0'),('module/advocacy','0'),('module/backgroundimages','1'),('module/businessdirectory','0'),('module/clients','0'),('module/clientsmap','0'),('module/documents','0'),('module/documentstypes','0'),('module/events','1'),('module/eventtypes','0'),('module/eventtypes_extra','0'),('module/expresscheckout',''),('module/featured_brands','0'),('module/filemanager','0'),('module/files','1'),('module/forum','0'),('module/homepage/stores','1'),('module/industries','0'),('module/jobs','1'),('module/links','1'),('module/marketing','0'),('module/membership','0'),('module/news','1'),('module/newsletter_subscribe','1'),('module/newsletters','0'),('module/newstypes','0'),('module/partners','0'),('module/payments','1'),('module/podcast/types','0'),('module/podcasts','0'),('module/policies',''),('module/projectsportfolio','1'),('module/publications',''),('module/schedules','0'),('module/security','0'),('module/shop','1'),('module/shopback','0'),('module/socialmedia','1'),('module/socialmedia/display/twitterfeed','0'),('module/staff','1'),('module/staff/socialmedia','1'),('module/stores','1'),('module/tenders',''),('module/testimonials','1'),('shop/brands/models','0'),('layout/columns/products/noside','0'),('module/videos','1'),('module/videostypes','1'),('overwrite/theme/config',''),('product/type/text','Vehicle'),('shop/active','2'),('shop/addcart/text','More Details'),('shop/addmore/link','products'),('shop/addmore/text','Add more products'),('shop/address/code','0'),('shop/address/phone','1'),('shop/address/phone/req','1'),('shop/brands','1'),('shop/brands/pages_sort','1'),('shop/cardfee/laser','0'),('shop/cardfee/mc','0'),('shop/cardfee/paypal','0'),('shop/cardfee/visa','0'),('shop/cart/code',''),('shop/cart/vat','1'),('shop/checkout/announcement',''),('images/jpeg/thumbs','100'),('module/files_protected','0'),('shop/decimal','0'),('shop/default/incvat','1'),('shop/default/ssl/image/show','1'),('shop/default/vatrate','1'),('shop/checkout/guest','1'),('shop/discount/bulk/text','Bulk discounts on this product.'),('shop/discount/flat','0'),('shop/discount/rate','0'),('shop/featured/rotating',''),('shop/hide/details','0'),('shop/hide/incvat','1'),('shop/hide/pricing','0'),('shop/hide/vatrate','0'),('shop/item/button','complex_product_switch'),('shop/variants','0'),('shop/variants/heading_text','Size Options'),('shop/variants/variantsonly',''),('shop/variants/price',''),('shop/default/producttype','1'),('shop/mode','test'),('site/menu/partial/all/siblings',''),('shop/novariant/text','simple'),('shop/gallery/location','above_header'),('shop/paypal/pwd',''),('shop/paypal/signature',''),('shop/paypal/user',''),('shop/price/tba','TBA'),('shop/productcode','0'),('shop/brands/show','0'),('shop/products/featured/price_struck','0'),('shop/products/preview/quantity','1'),('site/backgroundimage/display','l-f'),('shop/products/brands/sidebar','0'),('shop/on_purchase/cart','0'),('shop/products/special/price_struck','0'),('site/contractorsperpage','10'),('shop/registration','0'),('shop/registration/confirm','0'),('shop/related','1'),('shop/request/company_details','0'),('shop/request/company_details/req','neither'),('shop/request/delivery','1'),('shop/rrp','0'),('shop/special/special_content_view','1'),('shop/special/title','Featured Gift'),('shop/specifications','1'),('site/ssl','1'),('module/contactlist','0'),('shop/stock','1'),('shop/normal_price/label','Normal Price:'),('shop/telephone',''),('shop/versions','1'),('site/account/new/address','0'),('site/account/validate','0'),('site/addthis','0'),('site/brandsperpage','6'),('site/businessdirectoryperpage','10'),('site/cache','1'),('site/children/content','1'),('site/children/images','below'),('site/children/images/hopacity','1'),('site/contact',''),('site/cro',''),('site/css/base64','1'),('site/css/compress','0'),('site/display/advanced','1'),('site/email','info@abbeymachinery.com'),('site/events/calendar/cols','3'),('site/eventsperpage','9'),('site/extrainfo','1'),('site/extrainfo/displayBuyOnline','0'),('site/extrainfo/displayfeatProducts','1'),('site/extrainfo/displayProducts','1'),('site/extrainfo/displaySpecialOffer','1'),('site/extrainfo/events','0'),('site/extrainfo/events/summary','1'),('site/extrainfo/gallery/width','0'),('site/extrainfo/index','0'),('site/extrainfo/news','4'),('site/extrainfo/news/summary','1'),('site/extrainfo/partners','0'),('site/extrainfo/partners/heading','Partners'),('site/extrainfo/projects','3'),('site/extrainfo/stores','0'),('site/extrainfo/testimonials','0'),('site/extrainfo/testimonials/fading',''),('site/fax',''),('site/homepage-pages/children','1'),('site/homepage-pages/content','1'),('site/homepage-pages/images','1'),('site/homepage-pages/images/hopacity','1'),('site/homepage/events','2'),('site/homepage/news','2'),('site/images/display','fading'),('site/images/table/cols','3'),('site/images/title',''),('site/images/title/inc','1'),('site/images/top','fading'),('site/layout/date','0'),('site/layout/footer/below',''),('site/layout/footer/bg',''),('site/layout/footer/powered',''),('site/layout/footer/text',''),('site/layout/login_form','0'),('site/layout/mobile',''),('site/layout/search','0'),('site/layout/shop-icons','1'),('site/layout/socialmedia','1'),('site/layout/socialmedia/fixed','0'),('site/layout/socialmedia/horizontal','1'),('site/layout/socialmedia/vertical','0'),('site/layout/time','0'),('site/layout/top_bar','0'),('site/licence_num','X'),('site/live','1'),('site/live/display/logo','1'),('shop/cart/message','<span id=\"item_count\">(%1$d)</span><span id=\"cart_value\">%3$s</span>'),('site/login/display','top-bar'),('site/member/company','0'),('site/menu','horizontal'),('site/menu/children/main','2'),('site/menu/children/sub','2'),('site/menu/current_ancestor','1'),('site/menu/depth','2'),('site/menu/horizontal/color','white'),('site/menu/horizontal/columns',''),('site/menu/horizontal/effect','slide'),('site/menu/horizontal/effect/speed','fast'),('site/menu/horizontal/popbgcolor',''),('site/menu/horizontal/popheadingcolor',''),('site/menu/horizontal/popheadinghovercolor',''),('site/menu/horizontal/std/active-sub',''),('site/menu/horizontal/use-theme-menu-colors',''),('site/menu/partial','all'),('site/menu/partial/children','1'),('site/menu/partial/products','0'),('site/menu/partial/show','ancestor'),('site/menu/partial/siblings',''),('site/menu/partial/side','l'),('site/menu/partial/top','ancestor'),('site/menu/partial/tree','1'),('site/menu/partial/tree/level',''),('site/menu/subpages','set'),('site/menu/version','standard'),('site/name','Abbey Machinery'),('site/news/archive','12'),('site/newsperpage','9'),('site/partners/home',''),('site/podcasts/archive','2'),('site/podcastsperpage','6'),('site/products/onpage/heading',''),('site/productsperpage','30'),('site/projectsperpage','9'),('site/signature','<p>Regards,<br />\r\n[site/name]<br />\r\n[site/contact]</p>\r\n\r\n<p>Tel.: [site/telephone]<br />\r\nE-mail: [site/email]<br />\r\nWeb: <a href=\"http://[site/host]\">[site/host]</a></p>\r\n'),('site/slogan',''),('site/featured/random_order','0'),('site/url_terms','http://www.dotser.ie/terms'),('site/vat',''),('staff/display/email','1'),('staff/display/phone','1'),('staff/display/role','1'),('staff/display/start-date','1'),('system/provider/contact','Loughnan Hooper'),('system/provider/name','Dotser'),('system/provider/phone','+535 (0)57 932 3262'),('system/provider/support','support@dotser.ie'),('system/provider/web-site','http://www.dotser.ie/'),('system/theme/updated','1599560375'),('system/version','7.269'),('testimonals/pages/all','1'),('testimonials/change/time','8005'),('theme/item/general',''),('twitter/shell/background','333333'),('twitter/shell/color','FFFFFF'),('twitter/tweets/background','FFFFFF'),('twitter/tweets/color','FFFFFF'),('twitter/tweets/links','FF9B00'),('videos/title/show','1'),('module/productscustom','0'),('site/extrainfo/news/image',''),('images/news/extrainfo/width','64'),('maps/height','590px'),('shop/brands/pages',''),('site/notfound','not-found'),('shop/products/announcement',''),('shop/product/announcement',''),('shop/show_only_special','0'),('shop/products/special/rotate','0'),('news/home/header','Latest News'),('shop/products/filter/brands','1'),('shop/products/filter/specials','1'),('shop/products/filter/productscustom','1'),('site/extrainfo/news/rotate',''),('module/realmpi','0'),('shop/viewdetails/text','More Information'),('news/home/footer','See more news items'),('news/view/return','See all news'),('shop/debug','0'),('module/productrequests','0'),('shop/product-sale/name','Sale Product'),('shop/product-form/name','Enquiry Product'),('site/images/display/products','vertical-thumbs'),('site/images/display/news',''),('site/images/display/events',''),('images/vthumbs/thumbside','right'),('site/cookie-warning','We use cookies to tailor your web browsing experience. By accepting below and continuing to browse our site, you agree to our privacy policy. '),('shop/product-form/show_price','0'),('shop/price_details/display','tall'),('shop/product_vew/type','boxes'),('shop/versions/heading_text','Sizes'),('shop/versions/front_text','Sizes'),('site/images/display/pos','content'),('site/images/display/pos/news',''),('site/images/display/pos/events',''),('site/images/display/pos/products',''),('site/extrainfo/news/rotate/time','555'),('shop/products/special/link','product'),('shop/products/special/all/text','View all special offers'),('map/type','ROADMAP'),('show/tradestand/extrarequests/head','Special Requests/Comments'),('layout/columns/contactlist','1'),('site/contactlistperpage','12'),('module/faqs','0'),('shop/products/sidebar','1'),('shop/brands/show/haveproducts','1'),('module/outlets','0'),('layout/columns/searchresults','3'),('shop/product-form/email',''),('shop/products/filter/price','0'),('module/magicscroll','0'),('faqs/title',''),('faqs/topselect',''),('videos/display/popup','1'),('videos/display/count','3'),('module/travel','0'),('site/layout/socialmedia/horizontal/header','0'),('site/extrainfo/featProducts/count','1'),('images/hotels/width',''),('site/layout/themetype','legacy'),('module/phonerequests','0'),('module/faqtypes','0'),('module/dpd','0'),('shop/highlights/title','Highlights'),('module/properties','0'),('images/properties/width',''),('images/properties-thumb/width',''),('layout/columns/accessories','4'),('shop/related/brands','1'),('layout/truncate/products/related','20'),('shop/related/slogan','1'),('shop/related/purchase','0'),('staff/display/details','0'),('staff/display/clickthrough','1'),('staff/display/mobile','0'),('staff/display/preview/email','0'),('staff/display/preview/phone','0'),('staff/display/preview/mobile','0'),('staff/display/type','1'),('staff/display/preview/type','1'),('site/homepage-pages/view','front'),('site/homepage-pages/children/separator','comma'),('layout/products/preview','item'),('shop/related/buynow','0'),('videos/width/gallery','1'),('module/sportsclub','0'),('sports/fixture/location/home','Home Ground'),('shop/cardfee/visa/debit','0'),('module/nightline','0'),('shop/description/preview/show','1'),('shop/more_details_link','1'),('shop/tax/preview','0'),('shop/tax/display','none'),('shop/special_price/label',''),('businessdirectory/new/page','0'),('site/menu/megamenu/children/display','var'),('images/products/width',''),('module/pageicons','0'),('layout/pageicons/display','0'),('layout/pageicons/header/vertical','0'),('layout/pageicons/header/horizontal','0'),('layout/pageicons/footer/horizontal','0'),('module/socialmediashare','0'),('socialmediashare/private','1'),('socialmediashare/twitter','1'),('socialmediashare/fb-like','1'),('socialmediashare/fb-share','1'),('socialmediashare/linkedin','1'),('socialmediashare/google-plus','1'),('module/nominationform','0'),('businessdirectory/filter/alphabet','1'),('businessdirectory/filter/location','1'),('businessdirectory/filter/pages','1'),('businessdirectory/show/website','1'),('businessdirectory/show/email','1'),('businessdirectory/assign/industries','0'),('businessdirectory/preview/summary','1'),('businessdirectory/preview/location','1'),('businessdirectory/signup/show','1'),('businessdirectory/signup/text','Create Your Membership'),('projectsportfolio/filter/form','0'),('site/extrainfo/projects/summary','0'),('site/extrainfo/projects/featured','0'),('site/extrainfo/projects/all','See All Projects'),('shop/invoice/reference','payment'),('shop/card/visa/enabled','1'),('shop/card/mc/enabled','1'),('shop/responsive/registration','default'),('layout/responsive/home/featured/show_price_struck','1'),('layout/responsive/login_text',''),('layout/responsive/carousels/top/caption_enabled','0'),('layout/responsive/findoutmore/text',''),('layout/responsive/register_text',''),('supershow/schedule/StartTime','1'),('supershow/schedule/EntryFee','1'),('system/support/show','0'),('supershow/schedule/SponsorLabel','1'),('supershow/catalogue/IncludeEmpty','1'),('layout/responsive/findoutmore','0'),('layout/responsive/project/titles/lines','0'),('layout/responsive/project/subtitle','0'),('layout/responsive/project/date_completed','0'),('layout/responsive/project/industry','0'),('layout/responsive/project/type','0'),('layout/responsive/project/location','0'),('layout/responsive/project/client','0'),('layout/columns/projects',''),('layout/columns/projects_sm',''),('layout/columns/projects_xs',''),('layout/responsive/projects/background_image',''),('layout/responsive/projects/background_color',''),('layout/responsive/homepage_pages/title','Leading supplier of tractors, farm machinery, parts, tools and after sales service'),('layout/responsive/homepage_pages/columns','2'),('layout/responsive/homepage_pages/background_image',''),('layout/responsive/homepage_pages/background_color','FFFFFF'),('layout/responsive/homepage_partners/title','Partners'),('layout/responsive/partners/background_image',''),('layout/responsive/partners/background_color','FFFFFF'),('layout/responsive/partners/link','0'),('layout/responsive/homepage_custom/title',''),('layout/responsive/homepage_custom/background_color',''),('layout/responsive/homepage_sponsors_name',''),('layout/responsive/affiliates/background_image',''),('layout/responsive/affiliates/background_color',''),('layout/responsive/staff/allstaff_link','0'),('layout/responsive/callout','0'),('layout/responsive/gallery_type','fade'),('layout/responsive/galleries/page/homepage_navigation','0'),('layout/responsive/galleries/page/homepage_pagination','0'),('layout/responsive/galleries/page/homepage_thumbnails','0'),('supershow/catalogue/SponsorLabel','1'),('supershow/results/SponsorLabel','1'),('supershow/schedule/CategoryLocation','1'),('supershow/catalogue/CategoryLocation','1'),('supershow/results/CategoryLocation','1'),('supershow/schedule/BoldClasses','1'),('supershow/schedule/BoldCategories','1'),('supershow/catalogue/BoldClasses','1'),('supershow/catalogue/BoldCategories','1'),('supershow/results/BoldClasses','1'),('supershow/results/BoldCategories','1'),('search/index/name','abbeymachinery.dotser.com'),('shop/order/varientview','1'),('shop/shipping/style','country'),('site/responsive','all'),('site/responsive/theme','abbeymachinery'),('site/mobilesite',''),('layout/pagepath','0'),('layout/responsive/fonts/body_font','Open+Sans'),('layout/responsive/fonts/menu_font','Titillium+Web'),('layout/responsive/fonts/title_font','Titillium+Web'),('layout/responsive/sizes/main_menu','16'),('layout/responsive/sizes/body','14'),('layout/responsive/sizes/titles','28'),('layout/responsive/sizes/titlesweight','300'),('layout/responsive/sizes/children_titles','22'),('site/color_definition','1'),('site/logosizecontrol','1'),('site/layout/general_image_ratio','5by3'),('layout/responsive/breadcrumbs','Y'),('layout/responsive/breadcrumbs_position','header'),('layout/responsive/breadcrumbs_header_alt','0'),('layout/responsive/menu_type','standard'),('layout/responsive/menu_alignment','standard'),('site/layout/search_enabled','0'),('layout/responsive/featured_products_homepage_name','FEATURED MACHINERY'),('layout/responsive/featured_products_style','standard'),('layout/responsive/featured/background_image',''),('layout/responsive/featured/background_color',''),('layout/responsive/news_homepage_name',''),('layout/responsive/news_homepage_seeall_txt',''),('layout/responsive/news/background_image',''),('layout/responsive/news/background_color','FFFFFF'),('layout/responsive/events_homepage_name',''),('layout/responsive/events_homepage_seeall_txt',''),('layout/responsive/events/background_image',''),('layout/responsive/events/background_color',''),('layout/responsive/brands_homepage','Y'),('layout/responsive/brands/background_image',''),('layout/responsive/brands/background_color','FFFFFF'),('layout/responsive/testimonials_homepage_name','Testimonials'),('layout/responsive/testimonials/background_image',''),('layout/responsive/testimonials/background_color','FFFFFF'),('layout/responsive/projects_homepage_name',''),('layout/responsive/projects_homepage_seeall_txt',''),('layout/responsive/projects/all_mode','all'),('layout/responsive/project_arrows','0'),('layout/responsive/products/show_slogan','1'),('layout/responsive/projects/filters','0'),('layout/responsive/carousels/layers','0'),('layout/footer/footer_type','normal'),('footer/locations/site_cat',''),('footer/locations/powered_by',''),('footer/locations/powered_by_link',''),('footer/locations/title',''),('footer/shop/show_info','0'),('footer/twitter/url',''),('footer/facebook/url',''),('layout/sitemap/news','0'),('layout/sitemap/events','0'),('layout/sitemap/products','0'),('layout/sitemap/clients','0'),('layout/sitemap/projects','0'),('layout/responsive/footer/about',''),('layout/columns/searchresults/switch',''),('layout/responsive/colors/pagebackcolor','FFFFFF'),('layout/responsive/colors/topmenucolor','E1562C'),('layout/responsive/colors/middlemenucolor','F25D33'),('layout/responsive/colors/mainmenucolor','210800'),('layout/responsive/colors/mobilemenucolor','F25D33'),('layout/responsive/colors/mobileburguercolor','FFFFFF'),('layout/responsive/colors/menuHoverActiveColourFont','210800'),('layout/responsive/colors/menuHoverActiveColourBackground','FFFFFF'),('layout/responsive/colors/menudropdowncolor','D15029'),('layout/responsive/colors/menudropdownsubcategorycolor','9A9A9C'),('layout/responsive/colors/menudropdownsubcategorybackcolor','A9AAAE'),('layout/responsive/colors/menudropdownhovercolor','210800'),('layout/responsive/colors/gallerycaptiontitlecolor','FFFFFF'),('layout/responsive/colors/gallerycaptioncolor','FFFFFF'),('layout/responsive/colors/topmenufontcolor','FFFFFF'),('layout/responsive/colors/mainmenufontcolor','FFFFFF'),('layout/responsive/colors/dropdownsfontcolor','FFFFFF'),('layout/responsive/colors/mobdropdownsfontcolor','FFFFFF'),('layout/responsive/colors/subsubcolor','210800'),('layout/responsive/colors/subsubbackcolor','FFFFFF'),('layout/responsive/colors/cartsearchcolor','A9AAAE'),('layout/responsive/colors/cartsearchcolorhover','A9AAAE'),('layout/responsive/colors/buttonscolor','9A9A9C'),('layout/responsive/colors/buttonsfontcolor','FFFFFF'),('layout/responsive/colors/hoverbuttonscolor','A9AAAE'),('layout/responsive/colors/backgroundcolor','FFFFFF'),('layout/responsive/colors/itembackgroundcolor','BCBDC1'),('layout/responsive/colors/linkcolor','F25D33'),('layout/responsive/colors/bandcolor','FFFFFF'),('layout/responsive/colors/bandcoloralt','FFFFFF'),('layout/responsive/colors/titlescolor','210800'),('layout/responsive/colors/footerfontcolor','FFFFFF'),('layout/responsive/colors/footergetintouchcolor','9A9A9C'),('layout/responsive/colors/footerbackgroundcolor','210800'),('layout/responsive/colors/footersocialmediacolor','FFFFFF'),('layout/responsive/colors/breadcrumbactivepage','F25D33'),('layout/responsive/colors/sidemenubackcolor','9A9A9C'),('layout/responsive/colors/breadcrumbsbackcolor','DDDDDD'),('layout/responsive/colors/breadcrumbstitlecolor',''),('s3/asset/path','abbey-machinery'),('site/global/message',''),('site/require/login','255'),('site/restrict/users','0'),('site/login/message',''),('site/ssl/permanent','0'),('site/keepalive','0'),('site/pages/gdpr_page','cookie-policy'),('site/pages/terms_page','terms-conditions'),('site/pages/newsletter_page','keeping-you-informed'),('site/contact/request_gdpr','0'),('site/checkout/request_gdpr','0'),('site/account/request_gdpr','0'),('site/default_landing/create_account',''),('site/default_landing/login',''),('site/default_landing/admin_login',''),('footer/shop/info_text',''),('footer/shop/payment_image',''),('layout/responsive/callout/newsletter_link_text',''),('layout/responsive/callout/newsletter_link_url',''),('layout/responsive/callout/newsletter_title',''),('layout/responsive/carousels/layers/color',''),('layout/responsive/carousels/layers/opacity',''),('layout/responsive/featured/tab1',''),('layout/responsive/featured/tab2',''),('site/extrainfo/projects/heading',''),('site/layout/logo_bottom_desktop','-4'),('site/layout/logo_top_mobile','3'),('site/layout/logo_width_desktop','315'),('site/layout/logo_width_mobile','155'),('module/affiliates','0'),('module/cakes','0'),('module/carbonneutral','0'),('module/castles','0'),('module/certificates','0'),('module/championships','0'),('module/championshiptypes','0'),('module/clubdirectory','0'),('module/collectiontimes','0'),('module/competitions','0'),('module/courses','0'),('module/coursetypes','0'),('module/coursetypes_extra','0'),('shop/deposits','0'),('module/documentrequests','0'),('module/eClub','0'),('module/orders_edit','0'),('module/exhibitor_letter','0'),('module/floorproducts','0'),('module/irishshowdirectory','0'),('module/levies','0'),('module/productsmulti-d','0'),('module/openproducts','0'),('module/prescriptions','0'),('module/productimport','1'),('module/schoolbookshop','0'),('module/hireproducts','0'),('module/simple-projects','0'),('module/parts','0'),('module/menu-subhead','0'),('module/super_show','0'),('module/super_show/online','0'),('module/tileshop','0'),('module/vimeoupload','0'),('module/wishlists','0'),('system/uploads/files/type',''),('site/images/display/projectsportfolio',''),('site/images/display/pos/projectsportfolio',''),('news/home/items','3'),('news/home/cols','3'),('news/home/cols_sm','2'),('news/home/cols_xs','1'),('layout/columns/news_sm','2'),('layout/columns/news_xs','1'),('shop/deferred-payment/approved-users','0'),('shop/currency_symbol',''),('shop/delivery_info',''),('site/pdf_invoice','0'),('layout/shippings/disable','0'),('shop/costprice','0'),('shop/hide/highlights','0'),('shop/hide/spotlight','0'),('shop/order/vat','0'),('shop/address/code_required','0'),('shop/success/extra_delivery_message',''),('shop/products/featured/style',''),('shop/loyaltycard','0'),('shop/shipping_label',''),('shop/card_fee','0'),('shop/allow_only_guest','0'),('shop/submit_order_text',''),('shop/cart/message/empty',''),('shop/cart/add_more_items','0'),('shop/continue_shopping','0'),('shop/cart/show_vat','0'),('submit/hide_qtys','0'),('submit/hide_unit_prices','0'),('search/exclude/pages','1'),('site/search/last-import','2020-06-25 12:14:58'),('site/search/last-import-counters','{\"Products\":8,\"News\":3,\"Events\":1}'),('site/layout/responsive/socialmedia/header','0'),('shop/status/default/failed',''),('shop/status/default/','');
/*!40000 ALTER TABLE `Config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactList`
--

DROP TABLE IF EXISTS `ContactList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactList` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(155) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `ContactTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactFirst` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactLast` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `OrganizationPosition` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `OrganizationDepartment` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `OrganizationSection` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `OrganizationCentre` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Website` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `InternationalPhone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Helpline` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCountry` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `CreatedAt` datetime DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactList`
--

LOCK TABLES `ContactList` WRITE;
/*!40000 ALTER TABLE `ContactList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactOptions`
--

DROP TABLE IF EXISTS `ContactOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactOptions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Phone` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueName` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactOptions`
--

LOCK TABLES `ContactOptions` WRITE;
/*!40000 ALTER TABLE `ContactOptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ContactOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contractors`
--

DROP TABLE IF EXISTS `Contractors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contractors` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(200) COLLATE utf8_unicode_ci DEFAULT '',
  `Website` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Lat` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lng` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactPhone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contractors`
--

LOCK TABLES `Contractors` WRITE;
/*!40000 ALTER TABLE `Contractors` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contractors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CorkRegistrations`
--

DROP TABLE IF EXISTS `CorkRegistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CorkRegistrations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CompanyName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Website` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `StandSize` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PowerRequired` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TCAgree` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CorkRegistrations`
--

LOCK TABLES `CorkRegistrations` WRITE;
/*!40000 ALTER TABLE `CorkRegistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `CorkRegistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Counties`
--

DROP TABLE IF EXISTS `Counties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Counties` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned DEFAULT NULL,
  `Position` int(10) unsigned DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Display` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexName` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Counties`
--

LOCK TABLES `Counties` WRITE;
/*!40000 ALTER TABLE `Counties` DISABLE KEYS */;
INSERT INTO `Counties` VALUES (1,0,1,'ireland','Ireland','',0),(2,0,3,'ulster','Ulster','',1),(3,0,4,'munster','Munster','',1),(4,0,5,'leinster','Leinster','',1),(5,0,6,'connacht','Connacht','',1),(6,5,1,'galway','Galway','',1),(7,5,2,'leitrim','Leitrim','',1),(8,5,3,'mayo','Mayo','',1),(9,5,4,'roscommon','Roscommon','',1),(10,5,5,'sligo','Sligo','',1),(11,4,1,'carlow','Carlow','',1),(12,4,2,'dublin','Dublin','',1),(13,4,3,'kildare','Kildare','',1),(14,4,4,'kilkenny','Kilkenny','',1),(15,4,5,'laois','Laois','',1),(16,4,6,'longford','Longford','',1),(17,4,7,'louth','Louth','',1),(18,4,8,'meath','Meath','',1),(19,4,9,'offaly','Offaly','',1),(20,4,10,'westmeath','Westmeath','',1),(21,4,11,'wexford','Wexford','',1),(22,4,12,'wicklow','Wicklow','',1),(23,3,1,'clare','Clare','',1),(24,3,2,'cork','Cork','',1),(25,3,3,'kerry','Kerry','',1),(26,3,4,'limerick','Limerick','',1),(27,3,5,'tipperary','Tipperary','',1),(28,3,6,'waterford','Waterford','',1),(29,8,4,'northern-ireland','Northern Ireland','',1),(30,2,1,'antrim','Antrim','',1),(31,2,2,'armagh','Armagh','',1),(32,2,3,'down','Down','',1),(33,2,4,'fermanagh','Fermanagh','',1),(34,2,5,'derry','Derry','',1),(35,2,6,'tyrone','Tyrone','',1),(36,2,7,'cavan','Cavan','',1),(37,2,8,'monaghan','Monaghan','',1),(38,2,9,'donegal','Donegal',NULL,1);
/*!40000 ALTER TABLE `Counties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Countries`
--

DROP TABLE IF EXISTS `Countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Countries` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneCode` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `IsoCountry` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `Capital` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Currency` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IsoCurrency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `Digraph` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `Language` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IsoLanguage` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `IsoNumber` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'ISO 3166-1 numeric',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=526 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Countries`
--

LOCK TABLES `Countries` WRITE;
/*!40000 ALTER TABLE `Countries` DISABLE KEYS */;
INSERT INTO `Countries` VALUES (5,'Afghanistan','93','AF','Kabul','Afghani','AFA','AF','Pashto','PS','004'),(7,'Albania','355','AL','Tirana','Lek','ALL','AL','Albanian','SQ','008'),(9,'Algeria','213','DZ','Algiers','Dinar','DZD','AG','Arabic','AR','012'),(11,'Andorra','33 628','AD','And. La Vella','French Franc','FRF','AN','Catalan','CA','020'),(13,'Angola','244','AO','Luanda','New Irwanza','AON','AO','Portuguese','PT','024'),(15,'Anguilla','1 809','AI','','East Caribbean Dollar','XCD','AV','','','660'),(17,'Antarctica','','AQ','','','','AY','','','010'),(19,'Antigua and Barbuda','1 809','AG','St Johns','East Caribbean Dollar','XCD','AC','English','EN','028'),(21,'Arctic Ocean','','','','','','AR','','',''),(23,'Argentina','54','AR','Buenos Aires','Peso','ARS','','Spanish','ES','032'),(25,'Armenia','7','AM','Yerevan','Dram','','AM','','','051'),(27,'Aruba','297','AW','','Aruban Guilder','AWG','AA','','','533'),(29,'Ascension Island','247','','','','','','','',''),(31,'Atlantic Ocean','','','','','','ZH','','',''),(33,'Australia','61','AU','Canberra','Australian Dollar','AUD','AS','English','EN','036'),(35,'Austria','43','AT','Vienna','Schilling','ATS','AU','German','DE','040'),(37,'Azerbaijan','994','AZ','Rezayeh','Manat','','AJ','','','031'),(39,'Azores','351','','','','','','','',''),(41,'Bahamas','1 809','BS','Nassau','Bahamian Dollar','BSD','BF','English','EN','044'),(43,'Bahrain','973','BH','Manama','Bahrain Dinar','BHD','BA','Arabic','AR','048'),(45,'Bangladesh','880','BD','Dacca','Taka','BDT','BG','Bengali','??','050'),(47,'Barbados','1 809','BB','Bridgetown','Barbados Dollar','BBD','BB','English','EN','052'),(49,'Belarus','7','BY','','Rouble','BYB','BO','Belorussian','','112'),(51,'Belgium','32','BE','Brussels','Franc','BEF','BE','Flemish','??','056'),(53,'Belize','501','BZ','Belmopan','Dollar','BZD','BH','English','EN','084'),(55,'Benin','229','BJ','Porto Novo','CFA Franc','XOF','BN','French','FR','204'),(57,'Bermuda','1 809','BM','Hamilton','Bermuda Dollar','BMD','BD','','','060'),(59,'Bhutan','975','BT','Timphu','Indian Rupee','INR','BT','Jonkha','??','064'),(61,'Bolivia','591','BO','Sucre/La Paz','Boliviano','BOB','BL','Spanish','ES','068'),(63,'Bosnia and Herzegovina','387','','Sarajevo','','','BK','','',''),(65,'Botswana','267','BW','Gaborone','Pula','BWP','BC','English','EN','072'),(67,'Bouvet Island','','BV','','Norwegian Krone','NOK','BV','','','074'),(69,'Brazil','55','BR','Brasilia','Cruzeiro','BRE','BR','Portuguese','PT','076'),(71,'British Indian Ocean Territory','','IO','','US Dollar','USD','IO','','','086'),(73,'Brunei','673','BN','Bandar Seri Begawan','Brunei Dollar','BND','BX','Malay','MS','096'),(75,'Bulgaria','359','BG','Sofia','Lev','BGL','BU','Bulgarian','BG','100'),(77,'Burkina Faso','226','BF','Ouagadougou','CFA Franc','XOF','UV','French','FR','854'),(79,'Burundi','257','BI','Bujumbura','Burundi Franc','BIF','BY','French','FR','108'),(81,'Cambodia (Kampuchea)','855','KH','Phnom Penh','Riel','KHR','CB','Khmer','??','116'),(83,'Cameroon','237','CM','Yaounde','CFA Franc','XAF','CM','English','EN','120'),(85,'Canada','1','CA','Ottawa','Dollar','CAD','CA','English','EN','124'),(87,'Cape Verde','238','CV','Praia','Cape Verde Escudo','CVE','CV','Portuguese','PT','132'),(89,'Cayman Islands','1 809','KY','Georgetown','Cayman Islands Dollar','KYD','CJ','','','136'),(91,'Central African Republic','236','CF','Bangui','CFA Franc','XAF','CT','French','FR','140'),(93,'Chad','235','TD','N\'Djamena','CFA Franc','XAF','CD','French','FR','148'),(95,'Chile','56','CL','Gran Santiago','Chilean Peso','CLP','CI','Spanish','ES','152'),(97,'China','86','CN','Beijing','Yuan (Renminbi)','CNY','CH','Chinese','ZH','156'),(99,'Christmas Island','6 724','CX','','Australian Dollar','AUD','KT','','','162'),(101,'Cocos (Keeling) Islands','6 722','CC','','Australian Dollar','AUD','CK','','','166'),(103,'Colombia','57','CO','Bogota','Colombian Peso','COP','CO','Spanish','','170'),(105,'Comoro Islands','269','KM','Moroni','Comoros Franc','KMF','CN','Swahili','SW','174'),(107,'Congo','242','CG','Brazzaville','CFA Franc','XAF','CF','French','FR','178'),(109,'Cook Islands','682','CK','','New Zealand Dollar','NZD','CW','','','184'),(111,'Coral Sea Islands','','','','','','CR','','',''),(113,'Costa Rica','506','CR','San Jose','Colon','CRC','CS','Spanish','ES','188'),(115,'Croatia','385','HR','Zagreb','Dinar','HRD','HR','','','191'),(117,'Cuba','53','CU','Havana','Cuban Peso','CUB','CU','Spanish','ES','192'),(119,'Cyprus','357','CY','Nicosia','Cyprus Pound','CYP','CY','Greek','EL','196'),(121,'Czech Republic','42','CZ','Prague','Koruna','CZK','EZ','Czech','','203'),(123,'Denmark','45','DK','Copenhagen','Danish Krone','DKK','DA','Danish','DA','208'),(125,'Djibouti','253','DJ','Djibouti','Djibouti Franc','DJF','DJ','French','FR','262'),(127,'Dominica','1 809','DM','Roseau','East Caribbean Dollar','XCD','DO','English','EN','212'),(129,'Dominican Republic','1 809','DO','Santo Domingo','Dominican Peso','DOP','DR','Spanish','ES','214'),(131,'Ecuador','593','EC','Quito','Sucre','ECS','EC','Spanish','ES','218'),(133,'Egypt','20','EG','Cairo','Pound','EGP','EG','Arabic','AR','818'),(135,'El Salvador','503','SV','San Salvador','Colon','SVC','ES','Spanish','ES','222'),(137,'Equatorial Guinea','240','GQ','Malabo','CFA Franc','XAF','EK','Spanish','ES','226'),(139,'Eritrea','','','Asmara','','','ER','','',''),(141,'Estonia','372','EE','Tallinn','Kroon','EEK','EN','','','233'),(143,'Ethiopia','251','ET','Addis Ababa','Birr','ETB','ET','Amharic','AM','231'),(145,'Europa Island','','','','','','EU','','',''),(147,'Falkland Islands (Malvinas)','500','FK','Stanley','Falkland Island Pound','FKP','FA','English','','238'),(149,'Faroe Islands','298','FO','Thorshavn','Danish Krone','DKK','FO','','','234'),(151,'Fiji','679','FJ','Suva','Fiji Dollar','FJD','FJ','Fijian','EN','242'),(153,'Finland','358','FI','Helsinki','Markka','FIM','FI','Finnish','FI','246'),(155,'France','33','FR','Paris','French Franc','FRF','FR','French','FR','250'),(157,'French Southern and Antarctic','','','','','','FS','','',''),(159,'Gabon','241','GA','Libreville','CFA Franc','XAF','GB','French','FR','266'),(161,'Gambia','220','GM','Banjul','Dalasi','GMD','GA','English','EN','270'),(163,'Gaza Strip','','','','','','GZ','','',''),(165,'Georgia','7','GE','Tbilisi','Georgian Coupon','','GG','','','268'),(167,'Germany','49','DE','Berlin','Deutschemark','DEM','GM','German','DE','276'),(169,'Ghana','233','GH','Accra','Cedi','GHC','GH','English','EN','288'),(171,'Gibraltar','350','GI','','Gibraltar Pound','GIP','GI','English','','292'),(173,'Greece','30','GR','Athens','Drachma','GRD','GR','Greek','EL','300'),(175,'Greenland','299','GL','Godthab','Danish Krone','DKK','GL','','','304'),(177,'Grenada','1 809','GD','St George\'s','East Caribbean Dollar','XCD','GJ','English','EN','308'),(179,'Guadeloupe','590','GP','Basse-Terre','French Franc','FRF','GP','','','312'),(181,'Guam','671','GU','Agana','US Dollar','USD','GQ','','','316'),(183,'Guatemala','502','GT','Guatemala City','Quetzal','GTQ','GT','Spanish','ES','320'),(185,'Guernsey','44','','St Peter Port','Pound','','GK','English','',''),(187,'Guiana (French)','','GF','','French Franc','FRF','FG','French','','254'),(189,'Guinea','224','GN','Conakry','Guinea Franc','GNF','GV','French','','324'),(191,'Guinea Bissau','245','GW','Bissau','Guinea Peso','GWP','PU','Portuguese','PT','624'),(193,'Guyana','592','GY','Georgetown','Guyana Dollar','GYD','GY','English','EN','328'),(195,'Haiti','509','HT','Port au Prince','Gourde','HTG','HA','Creole','??','332'),(197,'Honduras','504','HN','Tegucigalpa','Lempira','HNL','HO','Spanish','ES','340'),(199,'Hong Kong','852','HK','Victoria','Hong Kong Dollar','HKD','HK','Chinese','','344'),(201,'Howland Island','','','','','','HQ','','',''),(203,'Hungary','36','HU','Budapest','Forint','HUF','HU','Hungarian','HU','348'),(205,'Iceland','354','IS','Reykjavik','Icelandic Krona','ISK','IC','Icelandic','IS','352'),(207,'India','91','IN','New Delhi','Indian Rupee','INR','IN','Hindi','HI','356'),(209,'Indian Ocean','','','','','','XO','','',''),(211,'Indonesia','62','ID','Jakarta','Rupiah','IDR','ID','Indonesian','IN','360'),(213,'Iran','98','IR','Tehran','Rial','IRR','IR','Farsi','??','364'),(215,'Iraq','964','IQ','Baghdad','Iraqi Dinar','IQD','IZ','Arabic','AR','368'),(217,'Ireland','353','IE','Dublin','Punt','IEP','EI','Irish','GA','372'),(219,'Isle of Man','44','','Douglas','Pound','','IM','English','',''),(221,'Israel','972','IL','Jerusalem','New Shekel','ILS','IS','Hebrew','IW','376'),(223,'Italy','39','IT','Rome','Italian Lira','ITL','IT','Italian','IT','380'),(225,'Ivory Coast','225','CI','','CFA Franc','XOF','IV','French','FR','384'),(227,'Jamaica','1 809','JM','Kingston','Jamaican Dollar','JMD','JM','English','EN','388'),(229,'Jan Mayen','','','','','','JN','','',''),(231,'Japan','81','JP','Tokyo','Yen','JPY','JA','Japanese','JA','392'),(233,'Jersey','44','','St Helier','Pound','','JE','English','',''),(235,'Johnston Island','','JT','','US Dollar','USD','JQ','','',''),(237,'Jordan','962','JO','Amman','Jordan Dinar','JOD','JO','Arabic','AR','400'),(239,'Kazakhstan','7','KZ','','Tenge','KZT','KZ','','','398'),(241,'Kenya','254','KE','Nairobi','Kenya Shilling','KES','KE','English','EN','404'),(243,'Kingman Reef','','','','','','KQ','','',''),(245,'Kiribati','686','KI','Tarawa','Australian Dollar','AUD','KR','English','EN','296'),(247,'Korea (North)','850','KP','','North Korean Won','KPW','KN','Korean','KO','408'),(249,'Korea (South)','82','KR','','South Korean Won','KRW','KS','Korean','KO','410'),(251,'Kuwait','965','KW','Kuwait City','Kuwaiti Dinar','KWD','KU','Arabic','AR','414'),(253,'Kyrgyzstan','','KG','','Som','KGS','KG','','','417'),(255,'Laos','Operator','LA','','Kip','LAK','LA','Laotian','LO','418'),(257,'Latvia','371','LV','','Lat','LVL','LG','','','428'),(259,'Lebanon','961','LB','Beirut','Lebanese Pound','LBP','LE','Arabic','AR','422'),(261,'Lesotho','266','LS','Maseru','Loti','LSL','LT','Sotho','ST','426'),(263,'Liberia','231','LR','Monrovia','Liberian Dollar','LRD','LI','English','EN','430'),(265,'Libya','218','LY','Tripoli','Libyan Dinar','LYD','LY','Arabic','AR','434'),(267,'Liechtenstein','41 75','LI','Vaduz','Swiss Franc','CHF','LS','German','DE','438'),(269,'Lithuania','370','LT','','Litas','LTL','LH','','','440'),(271,'Luxembourg','352','LU','Luxembourg Ville','Luxembourg Franc','LUF','LU','Luxembourgish','??','442'),(273,'Macau','853','MO','','Pataca','MOP','MC','','','446'),(275,'Macedonia','389','','','','','MK','','',''),(277,'Madagascar','261','MG','Antananarivo','Madagascar Franc','MGF','MA','French','FR','450'),(279,'Malawi','265','MW','Lilongwe','Kwacha','MWK','MI','English','EN','454'),(281,'Malaysia','60','MY','Kuala Lumpur','Ringgit','MYR','MY','Malay','MS','458'),(283,'Maldives','960','MV','Male','Maldivian Rupee','MVR','MV','Singhalese','SI','462'),(285,'Mali','223','ML','Bamako','CFA Franc','XOF','ML','French','FR','466'),(287,'Malta','356','MT','Valletta','Maltese Lira','MTL','MT','Maltese','MT','470'),(289,'Mariana Islands','','','','','','','','',''),(291,'Marshall Islands','692','MH','Majuro','','','RM','English','EN','584'),(293,'Martinique','596','MQ','Fort de France','French Franc','FRF','MB','','','474'),(295,'Mauritania','222','MR','Nouakchott','Ouguiya','MRO','MR','French','FR','478'),(297,'Mauritius','230','MU','Port Louis','Mauritius Rupee','MUR','MP','English','EN','480'),(299,'Mayotte','269','','','','','MF','','',''),(301,'Mexico','52','MX','Mexico City','Peso','MXP','MX','Spanish','ES','484'),(303,'Micronesia','691','FM','Kolonia','','','FM','English','EN','583'),(305,'Midway Islands','Operator','MI','','US Dollar','USD','MQ','','',''),(307,'Moldavia','373','MD','Kishinev','Leu','MDL','MD','','','498'),(309,'Monaco','33','MC','Monaco','French Franc','FRF','MN','French','FR','492'),(311,'Mongolia','Operator','MN','Ulan Bator','Tugrik','MNT','MG','Khalka','MN','496'),(313,'Montserrat','1 809','MS','Plymouth','East Caribbean Dollar','XCD','MH','','','500'),(315,'Morocco','212','MA','Rabat','Dirham','MAD','MO','Arabic','AR','504'),(317,'Mozambique','258','MZ','Maputo','Metical','MZM','MZ','Portuguese','PT','508'),(319,'Myanmar','95','MM','Rangoon','Kyat','MMK','','Burmese','','104'),(321,'Namibia','264','NA','Windhoek and Swakopmund','South African Rand','ZAR','WA','Afrikaans','AF','516'),(323,'Nauru','674','NR','','Australian Dollar','AUD','NR','Nauru','NA','520'),(325,'Navassa Island','','','','','','BQ','','',''),(327,'Nepal','977','NP','Katmandu','Nepalese Rupee','NPR','NP','Nepali','NE','524'),(329,'Netherlands','31','NL','Amsterdam','Guilder','NLG','NL','Dutch','NL','528'),(331,'Netherlands Antilles','','AN','Willemstad','Netherlands Antillian Guilder','ANG','NA','','','530'),(333,'New Caledonia','687','NC','Noumea','CFP Franc','XPF','NC','','','540'),(335,'New Zealand','64','NZ','Wellington','New Zealand Dollar','NZD','NZ','English','EN','554'),(337,'Nicaragua','505','NI','Managua','Cordoba','NIO','NU','Spanish','ES','558'),(339,'Niger','227','NE','Niamey','CFA Franc','XOF','NG','French','FR','562'),(341,'Nigeria','234','NG','Lagos','Naira','NGN','NI','English','EN','566'),(343,'Niue','683','NU','Alofi','New Zealand Dollar','NZD','NE','','','570'),(345,'Norfolk Island','6 723','NF','','Australian Dollar','AUD','NF','','','574'),(347,'Norway','47','NO','Oslo','Krone','NOK','NO','Norwegian','NO','578'),(349,'Oman','968','OM','Muscat','Rial Omani','OMR','MU','Arabic','AR','512'),(351,'Pacific Islands (US)','','PC','Saipan','US Dollar','USD','NQ','','',''),(353,'Pacific Ocean','','','','','','ZN','','',''),(355,'Pakistan','92','PK','Islamabad','Pakistan Rupee','PKR','PK','Urdu','UR','586'),(357,'Palmyra Islands (Line Islands)','','','','','','LQ','','',''),(359,'Panama','507','PA','Panama City','Balboa','PAB','PM','Spanish','ES','591'),(361,'Papua New Guinea','675','PG','Port Moresby','Kina','PGK','PP','Pidgin English & Police Motu','??','598'),(363,'Paracel Islands','','','','','','PF','','',''),(365,'Paraguay','595','PY','Asuncion','Guarani','PYG','PA','Spanish','ES','600'),(367,'Peru','51','PE','Lima','Nuevo Sol','PEN','PE','Spanish','ES','604'),(369,'Philippines','63','PH','Manila','Philippine Peso','PHP','RP','Pilipino','??','608'),(371,'Pitcairn Islands','Operator','PN','','New Zealand Dollar','NZD','PC','','','612'),(373,'Poland','48','PL','Warsaw','Zloty','PLZ','PL','Polish','PL','616'),(375,'Polynesia (French)','','PF','','CFP Franc','XPF','FP','','','258'),(377,'Portugal','351','PT','Lisbon','Escudo','PTE','PO','Portuguese','PT','620'),(379,'Puerto Rico','1 809','PR','San Juan','US Dollar','USD','QR','','','630'),(381,'Qatar','974','QA','Doha','Qatar Riyal','QAR','QA','Arabic','AR','634'),(383,'Reunion','262','RE','St Denis','French Franc','FRF','RE','','','638'),(385,'Romania','40','RO','Bucharest','Leu','ROL','RO','Romanian','RO','642'),(387,'Russia','7','RU','Moscow','Rouble','RUR','RS','Russian','RU','643'),(389,'Rwanda','250','RW','Kigali','Rwanda Franc','RWF','RW','Kinyarwanda','RW','646'),(391,'Sahara (Western)','','EH','','Moroccan Dirham','MAD','','','','732'),(393,'Saint Barthelemy','','','','','','','','',''),(395,'Saint Helena','290','SH','Jamestown','St Helena Pound','SHP','SH','','','654'),(397,'Saint Kitts and Nevis','1 809','KN','Basseterre','East Caribbean Dollar','XCD','SC','English','EN','659'),(399,'Saint Lucia','1 809','LC','Castries','East Caribbean Dollar','XCD','ST','English','EN','662'),(401,'Saint Pierre and Miquelon','508','PM','St Pierre','French Franc','FRF','SB','','','666'),(403,'Saint Vincent and Grenadines','1 809','VC','Kingstown','East Caribbean Dollar','XCD','VC','','','670'),(405,'Samoa (American)','684','AS','','US Dollar','USD','AQ','','','016'),(407,'Samoa (Western)','685','WS','Apia','Tala','WST','WS','Samoan','SM','882'),(409,'San Marino','39 549','SM','San Marino','Italian Lira','ITL','SM','Italian','IT','674'),(411,'Sao Tome and Principe','23 912','ST','Sao Tome','Dobra','STD','TP','Portuguese','PT','678'),(413,'Saudi Arabia','966','SA','Riyadh','Saudi Riyal','SAR','SA','Arabic','AR','682'),(415,'Senegal','221','SN','Dakar','CFA Franc','XOF','SG','French','FR','686'),(417,'Serbia and Montenegro','','','Belgrade','','','SR','','',''),(419,'Seychelles','248','SC','Victoria','Seychelles Rupee','SCR','SE','English','EN','690'),(421,'Sierra Leone','232','SL','Freetown','Leone','SLL','SL','English','EN','694'),(423,'Singapore','65','SG','Singapore','Singapore Dollar','SGD','SN','Chinese','ZH','702'),(425,'Slovakia','42','SK','Bratislava','Slovak Koruna','SKK','LO','Slovak','','703'),(427,'Slovenia','386','SI','Ljubliana','Tollar','SIT','SI','','','705'),(429,'Solomon Islands','677','SB','Honiara','Solomon Islands Dollar','SBD','BP','','??','090'),(431,'Somalia','252','SO','Mogadishu','Somali Shilling','SOS','SO','Somali','SO','706'),(433,'South Africa','27','ZA','Cape Town','Rand','ZAR','SF','Afrikaans','AF','710'),(435,'South Georgia','','','','','','SX','','',''),(437,'Spain','34','ES','Madrid','Peseta','ESP','SP','Spanish','ES','724'),(439,'Spratley Islands','','','','','','PG','','',''),(441,'Sri Lanka','94','LK','Colombo','Rupee','LKR','CE','Singhalese','SI','144'),(443,'Sudan','249','SD','Khartoum','Sudanese Pound','SDP','SU','Arabic','AR','736'),(445,'Surinam','597','SR','Paramaribo','Surinam Guilder','SRG','NS','','','740'),(447,'Swaziland','268','SZ','Mbabane','Lilangeni','SZL','WZ','English','EN','748'),(449,'Sweden','46','SE','Stockholm','Swedish Krona','SEK','SW','Swedish','SV','752'),(451,'Switzerland','41','CH','Berne','Swiss Franc','CHF','SZ','German','DE','756'),(453,'Syria','963','SY','Damascus','Syrian Pound','SYP','SY','Arabic','AR','760'),(455,'Tadzhikistan','7','TJ','Dushanbe','Rouble','RUR','TI','','','762'),(457,'Taiwan','886','TW','Taipei','New Taiwan Dollar','TWD','TW','Mandarin Chinese','??','158'),(459,'Tanzania','255','TZ','Dodoma','Tanzanian Shilling','TZS','TZ','Swahili','SW','834'),(461,'Thailand','66','TH','Bangkok','Baht','THB','TH','Thai','TH','764'),(463,'Timor (East)','','TP','','Timor Escudo','TPE','','','',''),(465,'Togo','228','TG','Lome','Indonesian Rupiah','XOF','TO','French','FR','768'),(467,'Tokelau','','TK','','CFA Franc','NZD','TL','','','772'),(469,'Tonga','676','TO','Nuku\'alofa','Pa\'anga','TOP','TN','Tongan','TO','776'),(471,'Trinidad and Tobago','1 809','TT','Port of Spain','','TTD','TD','English','EN','780'),(473,'Tristan Da Cunha','Operator','','','','','','','',''),(475,'Tunisia','216','TN','Tunis','Tunisian Dinar','TND','TS','Arabic','AR','788'),(477,'Turkey','90','TR','Ankara','Lira','TRL','TU','Turkish','TR','792'),(479,'Turkmenistan','7','TM','Ashkhabad','Manat','TMM','TX','','','795'),(481,'Turks and Caicos Islands','1 809','TC','Grand Turk','US Dollar','USD','TK','','','796'),(483,'Tuvalu','688','TV','Funafuti','Australian Dollar','AUD','TV','Tuvaluan','??','798'),(485,'Uganda','256','UG','Kampala','Uganda Shilling','UGX','UG','English','EN','800'),(487,'Ukraine','7','UA','Kiev','Karbovanets','UAK','UP','','','804'),(489,'United Arab Emirates','971','AE','Abu Dhabi','UAE Dirham','AED','TC','Arabic','AR','784'),(490,'United Kingdom','44','GB','London','Pound','GBP','UK','English','EN','826'),(491,'United Nations','','','','','','','','',''),(492,'United States of America','1','US','Washington DC','US Dollar','USD','US','English','EN','840'),(493,'Uruguay','598','UY','Montevideo','New Uruguayan Peso','UYP','UY','Spanish','ES','858'),(495,'Uzbekistan','7','UZ','Tashkent','Sum Coupons','','UZ','','','860'),(497,'Vanuatu','678','VU','Port Vila','Vatu','VUV','NH','English','EN','548'),(499,'Vatican','39','VA','Vatican City','Italian Lira','ITL','VT','Latin','','336'),(501,'Venezuela','58','VE','Caracas','Bolivar','VEB','VE','Spanish','','862'),(503,'Vietnam','84','VN','Hanoi','Dong','VND','VM','Vietnamese','VI','704'),(505,'Virgin Islands (British)','1 809 49','VG','','US Dollar','USD','VQ','','','092'),(507,'Virgin Islands (US)','1 809','VI','Charlotte Amalie','US Dollar','USD','','','','850'),(509,'Wake Island','Operator','WK','','US Dollar','USD','WQ','','',''),(511,'Wallis and Futuna Islands','Operator','WF','','CFP Franc','XPF','WF','','','876'),(513,'West Bank','','','','','','WG','','',''),(515,'World','','','','','','XX','','',''),(517,'Yemen','967','YE','Sana\'a','Yemeni Rial','YER','YM','Arabic','AR','887'),(519,'Yugoslavia','381','YU','Belgrade','Yugoslav Dinar','YUN','','Serbo-Croatian','SH',''),(521,'Zaire','243','ZR','Kinshasa','Zaire','ZRZ','CG','French','FR',''),(523,'Zambia','260','ZM','Lusaka','Kwacha','ZMK','ZA','English','EN','894'),(525,'Zimbabwe','263','ZW','Harare','Zimbabwe Dollar','ZWD','ZI','English','EN','716');
/*!40000 ALTER TABLE `Countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coupons`
--

DROP TABLE IF EXISTS `Coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coupons` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Code` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CategoryId` int(10) unsigned NOT NULL,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `SellerType` enum('All','Individual','Business') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'All',
  `DiscountType` enum('Percentage','Amount') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Percentage',
  `DiscountAmount` decimal(10,2) unsigned DEFAULT NULL,
  `ValidFrom` datetime DEFAULT NULL,
  `ValidTo` datetime DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Active` enum('Yes','No') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `UsesAllowed` char(10) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coupons`
--

LOCK TABLES `Coupons` WRITE;
/*!40000 ALTER TABLE `Coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `Coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CouponsSellers`
--

DROP TABLE IF EXISTS `CouponsSellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CouponsSellers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SellerId` int(10) unsigned NOT NULL,
  `CouponId` int(10) unsigned NOT NULL,
  `Uses` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CouponsSellers`
--

LOCK TABLES `CouponsSellers` WRITE;
/*!40000 ALTER TABLE `CouponsSellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `CouponsSellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseTypeTypes`
--

DROP TABLE IF EXISTS `CourseTypeTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseTypeTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseTypeTypes`
--

LOCK TABLES `CourseTypeTypes` WRITE;
/*!40000 ALTER TABLE `CourseTypeTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseTypeTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseTypes`
--

DROP TABLE IF EXISTS `CourseTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseTypes`
--

LOCK TABLES `CourseTypes` WRITE;
/*!40000 ALTER TABLE `CourseTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Courses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `StartDate` date DEFAULT NULL,
  `FinishDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `FinishTime` time DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Type` tinyint(3) NOT NULL,
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `AddressCountry` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `ContactWeb` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CrmEmails`
--

DROP TABLE IF EXISTS `CrmEmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CrmEmails` (
  `Uid` int(10) unsigned NOT NULL,
  `UserId` int(10) DEFAULT '0',
  `Type` enum('','sent','received') COLLATE utf8_unicode_ci DEFAULT '',
  `Subject` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FromField` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ToField` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `SentOn` datetime DEFAULT NULL,
  `Body` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CrmEmails`
--

LOCK TABLES `CrmEmails` WRITE;
/*!40000 ALTER TABLE `CrmEmails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CrmEmails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerCalls`
--

DROP TABLE IF EXISTS `CustomerCalls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerCalls` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Date` date NOT NULL,
  `Caller` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactPosition` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactMethod` enum('','Email','Phone','Other') COLLATE utf8_unicode_ci DEFAULT '',
  `Description` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerCalls`
--

LOCK TABLES `CustomerCalls` WRITE;
/*!40000 ALTER TABLE `CustomerCalls` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerCalls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerCompanies`
--

DROP TABLE IF EXISTS `CustomerCompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomerCompanies` (
  `UserId` int(10) unsigned NOT NULL,
  `CompanyName` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VatReg` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyReg` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Customer company details for use in shop checkout.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerCompanies`
--

LOCK TABLES `CustomerCompanies` WRITE;
/*!40000 ALTER TABLE `CustomerCompanies` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomerCompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersPrintProducts`
--

DROP TABLE IF EXISTS `CustomersPrintProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersPrintProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintFinish` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperSize` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperStock` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `SidesPrint` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Qty` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersPrintProducts`
--

LOCK TABLES `CustomersPrintProducts` WRITE;
/*!40000 ALTER TABLE `CustomersPrintProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersPrintProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersPrintProductsCart`
--

DROP TABLE IF EXISTS `CustomersPrintProductsCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersPrintProductsCart` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintFinish` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperSize` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperStock` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `SidesPrint` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Type` char(5) COLLATE utf8_unicode_ci DEFAULT 'C',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersPrintProductsCart`
--

LOCK TABLES `CustomersPrintProductsCart` WRITE;
/*!40000 ALTER TABLE `CustomersPrintProductsCart` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersPrintProductsCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersPrintProductsOrder`
--

DROP TABLE IF EXISTS `CustomersPrintProductsOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersPrintProductsOrder` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintFinish` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperSize` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperStock` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `SidesPrint` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersPrintProductsOrder`
--

LOCK TABLES `CustomersPrintProductsOrder` WRITE;
/*!40000 ALTER TABLE `CustomersPrintProductsOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersPrintProductsOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersPrinting`
--

DROP TABLE IF EXISTS `CustomersPrinting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersPrinting` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintPosition` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintTechnique` int(10) unsigned NOT NULL DEFAULT '0',
  `Colors` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersPrinting`
--

LOCK TABLES `CustomersPrinting` WRITE;
/*!40000 ALTER TABLE `CustomersPrinting` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersPrinting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersPrintingCart`
--

DROP TABLE IF EXISTS `CustomersPrintingCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersPrintingCart` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintPosition` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintTechnique` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Colors` int(10) DEFAULT '0',
  `Type` char(5) COLLATE utf8_unicode_ci DEFAULT 'C',
  `QuoteId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersPrintingCart`
--

LOCK TABLES `CustomersPrintingCart` WRITE;
/*!40000 ALTER TABLE `CustomersPrintingCart` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersPrintingCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersPrintingOrder`
--

DROP TABLE IF EXISTS `CustomersPrintingOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersPrintingOrder` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `PrintPosition` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintTechnique` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Colors` int(10) DEFAULT '0',
  `QuoteId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersPrintingOrder`
--

LOCK TABLES `CustomersPrintingOrder` WRITE;
/*!40000 ALTER TABLE `CustomersPrintingOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersPrintingOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersSizes`
--

DROP TABLE IF EXISTS `CustomersSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersSizes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `Colour` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Size` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Amount` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersSizes`
--

LOCK TABLES `CustomersSizes` WRITE;
/*!40000 ALTER TABLE `CustomersSizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersSizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersSizesCart`
--

DROP TABLE IF EXISTS `CustomersSizesCart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersSizesCart` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `Colour` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Size` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Amount` int(10) DEFAULT '0',
  `Type` char(5) COLLATE utf8_unicode_ci DEFAULT 'C',
  `QuoteId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersSizesCart`
--

LOCK TABLES `CustomersSizesCart` WRITE;
/*!40000 ALTER TABLE `CustomersSizesCart` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersSizesCart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomersSizesOrder`
--

DROP TABLE IF EXISTS `CustomersSizesOrder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CustomersSizesOrder` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  `CustomerId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `Colour` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Size` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Amount` int(10) DEFAULT '0',
  `QuoteId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomersSizesOrder`
--

LOCK TABLES `CustomersSizesOrder` WRITE;
/*!40000 ALTER TABLE `CustomersSizesOrder` DISABLE KEYS */;
/*!40000 ALTER TABLE `CustomersSizesOrder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DealersWanted`
--

DROP TABLE IF EXISTS `DealersWanted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DealersWanted` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CompanyName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Telephone` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DealersWanted`
--

LOCK TABLES `DealersWanted` WRITE;
/*!40000 ALTER TABLE `DealersWanted` DISABLE KEYS */;
/*!40000 ALTER TABLE `DealersWanted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DentalImplants`
--

DROP TABLE IF EXISTS `DentalImplants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DentalImplants` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ContactAge` int(3) NOT NULL DEFAULT '0',
  `ContactPhone` char(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `ContactEmail` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Teeth` int(3) NOT NULL DEFAULT '0',
  `Dentures` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DentalImplants`
--

LOCK TABLES `DentalImplants` WRITE;
/*!40000 ALTER TABLE `DentalImplants` DISABLE KEYS */;
/*!40000 ALTER TABLE `DentalImplants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DisciplineCategories`
--

DROP TABLE IF EXISTS `DisciplineCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DisciplineCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DisciplineCategories`
--

LOCK TABLES `DisciplineCategories` WRITE;
/*!40000 ALTER TABLE `DisciplineCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `DisciplineCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DiscsGenres`
--

DROP TABLE IF EXISTS `DiscsGenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiscsGenres` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DiscsGenres`
--

LOCK TABLES `DiscsGenres` WRITE;
/*!40000 ALTER TABLE `DiscsGenres` DISABLE KEYS */;
/*!40000 ALTER TABLE `DiscsGenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DiscsStyles`
--

DROP TABLE IF EXISTS `DiscsStyles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DiscsStyles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DiscsStyles`
--

LOCK TABLES `DiscsStyles` WRITE;
/*!40000 ALTER TABLE `DiscsStyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `DiscsStyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentRequests`
--

DROP TABLE IF EXISTS `DocumentRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocumentRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Company` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentRequests`
--

LOCK TABLES `DocumentRequests` WRITE;
/*!40000 ALTER TABLE `DocumentRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentTypes`
--

DROP TABLE IF EXISTS `DocumentTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocumentTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='module/documentstypes. For sorting documents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentTypes`
--

LOCK TABLES `DocumentTypes` WRITE;
/*!40000 ALTER TABLE `DocumentTypes` DISABLE KEYS */;
INSERT INTO `DocumentTypes` VALUES (1,'Publications','publications'),(2,'Policy Documents','policies');
/*!40000 ALTER TABLE `DocumentTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documents`
--

DROP TABLE IF EXISTS `Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Documents` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `DateAdded` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='module/documents';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documents`
--

LOCK TABLES `Documents` WRITE;
/*!40000 ALTER TABLE `Documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailMember`
--

DROP TABLE IF EXISTS `EmailMember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailMember` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactTitle` char(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactFirst` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactLast` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactPhone` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactMobile` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactFax` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactEmail` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactWho` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `MemberId` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Emails Sent to Members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailMember`
--

LOCK TABLES `EmailMember` WRITE;
/*!40000 ALTER TABLE `EmailMember` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmailMember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Emails`
--

DROP TABLE IF EXISTS `Emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Emails` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Subject` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `AdministratorSubject` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AdministratorContent` text COLLATE utf8_unicode_ci NOT NULL,
  `SendEmail` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SendEmailAdmin` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AdminEmailTo` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AdminEmailReplyTo` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueName` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='System-generated e-mails';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Emails`
--

LOCK TABLES `Emails` WRITE;
/*!40000 ALTER TABLE `Emails` DISABLE KEYS */;
INSERT INTO `Emails` VALUES (1,'orders/created','Your order was created (Ref: [OrderReference])','<p>Hello [BillingFirstName] [BillingLastName],</p><p>Your new order with [site/name] was created for the total of €[Total]. Order reference: <strong>[OrderReference]</strong>.</p>\r\n\r\n[details]\r\n\r\n<p>To view the order details, go to <a href=\"http://[site/host]/account/orders/[OrderReference]\">[site/host]/account/orders/[OrderReference]</a>.</p><p>&nbsp;</p><p>Many thanks for your custom.</p>\r\n','Order [OrderReference] received from [BillingFirstName] [BillingLastName]','<p>[site/name] has just received an order for the total of €[Total]. Order reference: [OrderReference].</p><p>To view the order details, go to <a href=\"http://[site/host]/admin/orders.php?id=[Id]\">[site/host]/admin/orders.php?id=[Id]</a></p>\r\n\r\n[details]\r\n\r\n','Y','Y','','user'),(2,'account/create','Welcome to [site/name]','<p>\r\n	Hello [Name],</p>\r\n<p>\r\n	Congratulations on creating your [site/name] Account.</p>\r\n<p>\r\n	<strong><em>Useful links:</em></strong></p>\r\n<ul>\r\n	<li>\r\n		<strong>Login:</strong> <a href=\"http://[site/host]/account/login\">[site/host]/account/login</a></li>\r\n	<li>\r\n		<strong>Orders:</strong> <a href=\"http://[site/host]/account/orders\">[site/host]/account/orders</a></li>\r\n	<li>\r\n		<strong>Account Profile:</strong> <a href=\"http://[site/host]/account\">[site/host]/account</a></li>\r\n</ul>\r\n','New account: [Name]','<p>\r\n	Hello,</p>\r\n<p>\r\n	[Name] has created a new account on [site/name].</p>\r\n','N','N','','user'),(3,'account/forgot','Reset your password','<p>\r\n	Hi [Name],</p>\r\n<p>\r\n	You have received this email because you requested to reset your password for your [site/name] Account.</p>\r\n<p>\r\n	Just click in the link below to reset your password:</p>\r\n<p>\r\n	<a href=\"[ForgotLink]\">[ForgotLink]</a></p>\r\n<p>\r\n	<em>This reset link is valid for the next 24 hours only.</em></p>\r\n','','','Y','N','','user'),(4,'account/delete','Account deleted','<p>\r\n	Hello [Name],</p>\r\n<p>\r\n	Your account was deleted and all your data was erased.</p>\r\n<p>\r\n	Perhaps we&#39;ll see you again soon!</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	[site/name]</p>\r\n','Account deleted','<p>\r\n	Hello,</p>\r\n<p>\r\n	[Name] has deleted their account on [site/name].</p>\r\n','Y','Y','','user'),(5,'account/reset','Password reset','<p>\r\n	Hi [Name],</p>\r\n<p>\r\n	your password was changed.</p>\r\n',NULL,'','Y','N','','user'),(6,'administrators/create','You are now an administrator of [site/name]','<p>\r\n	Hi [Name],</p>\r\n<p>\r\n	You are now an administrator at [site/name].</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://[site/host]/admin\">[site/host]/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"[ForgotLink]\">[ForgotLink]</a>.</li>\r\n</ul>\r\n','','','Y','Y','','user'),(7,'account/pending','[site/name]: Validate Your Account','<p>Hello [Email],</p><p>Welcome to [site/name]. To proceed, please <a href=\"http://[site/host]/account/validate/[Token]\">validate your account</a>.</p><p>To validate your account, please follow the link above. If links are disabled, please visit http://[site/host]/account/verify. Your security token is <strong>[Token]</strong>.</p><p>You will have to create a password, and then your account will be verified.</p>','Account Created (Pending)','<p>A new account on [site/name] has been created as follows:</p><p>Status: Pending verification.</p><p>E-mail: [Email]</p><p>Date Created:&nbsp;[CreatedAt]</p><p>IP Address:&nbsp;[IpAddress]</p>','Y','Y','','user'),(8,'membership/join','Membership Created: [Company]','<p>\r\n	Hello [ContactTitle] [ContactFirst] [ContactLast],</p>\r\n<p>\r\n	The account [Company] has been created on [site/name]. You will be notified when it is approved.</p>\r\n<p>\r\n	Please follow this link to set your password:&nbsp;<a href=\"[SetPasswordLink]\">[SetPasswordLink]</a></p>\r\n','New Membership Created: [Company]','<p>\r\n	Hello,</p>\r\n<p>\r\n	A new membership has been created on [site/name].</p>\r\n<p>\r\n	Details:</p>\r\n<p>\r\n	Company Name: [Company].</p>\r\n<p>\r\n	Contact Name:&nbsp;[ContactTitle] [ContactFirst] [ContactLast].</p>\r\n<p>\r\n	Contact Details: [ContactEmail]; [ContactMobile].</p>\r\n<p>\r\n	Address: [Address] [Address2] [AddressTown] [AddressCounty].</p>\r\n<p>\r\n	<a href=\"http://[site/host]/admin/members.php?id=[MembershipId]\">Further Details</a>.</p>\r\n<p>\r\n	<a href=\"http://[site/host]/admin/users.php?companyId=[CompanyId]\">Approve Member</a>.</p>\r\n','Y','Y','','user'),(9,'profile/approved','Profile Approved','<p>\r\n	Hello [Name],</p>\r\n<p>\r\n	Your profile on [site/name] has been approved by a site administrator.</p>\r\n','','','Y','Y','','user'),(10,'orders/paypalupdate','Order [OrderRef]: Payment status changed','<p>Payment status changed:</p>\r\n<div>[table]</div>\r\n<p><a href=\"http://[site/host]/admin/orders.php?id=[OrderId]\">View order details</a></p>',NULL,'','Y','N','','user'),(11,'account/email_change','Your account email address has changed','<p>The e-mail address on your [site/name] account has changed from [old_email] to [new_email].</p>\r\n<p>You can log into your account at <a href=\"http://[site/host]/account/login\">[site/host]/account/login</a>.</p>',NULL,'','Y','N','','user'),(12,'travelpackage/alert','Payment is due on your booking (Ref: [BookingRef]) [Title]','<p>Payment is now due for [Title] on [date].</p><p>Booking Ref.: [BookingRef]</p><p>Please visit <a href=\"http://[site/host]/account/travelpackages\">[site/host]/account/travelpackages</a> to complete payment on your booking.</p><p>Payment is due on or before [balance_due].</p>','Payment is due on Booking [BookingRef]: [Title]','<p>Payment is now due for [Title] on [date].</p><p>Booking Ref.: [BookingRef]</p><p>Payment is due on or before [balance_due].</p>','Y','Y','','user'),(13,'travelpackage/details','Your travel has been booked (Ref: TPB[BookingId]) [Title]','\n        <h2>[ItemTitle]</h2>\n        <p>[Details]</p>\n        <p>View booking details at <a href=\"http://[site/host]/travelpackages_booking/details/[BookingId]\">[site/host]/travelpackages_booking/details/[BookingId]</a></p>\n        ','Travel Booking received (Ref: TPB[BookingId]) [Title]','\n        <h2>[ItemTitle]</h2>\n        <p>[Details]</p>\n        <p>View booking details at <a href=\"http://[site/host]/admin/travelpackagesbooked?id=[BookingId]\">[site/host]/admin/travelpackagesbooked?id=[BookingId]</a></p>\n        ','Y','Y','','user'),(14,'travelpackage/accept_terms','[title] booked: INCOMPLETE: Action Required','<p>[message]</p><p><a href=\"[url]\">Follow this link to accept the conditions</a></p>',NULL,'','Y','N','','user'),(15,'companyregistration/notification','Your F-Gas Certificate HAS EXPIRED on the 31st December [PreviousYear].','<p>Hello [PrincipleContactName],</p>\r\n<p>Your F-Gas Certificate HAS EXPIRED on the 31st December [PreviousYear].</p>\r\n\r\n<p><strong>RENEWAL REMINDER</strong></p>\r\n<p>Your F-Gas [ApplicationType] Certificate [CertNo] for [CompanyName] expired on 31st December [PrevioiousYear]. Please renew to get your [CurrentYear] certificate. If you&rsquo;ve already renewed, there&rsquo;s nothing you need to do.</p>\r\n<p>You will no longer be listed on F-Gas Registration&rsquo;s Certified Companies directory as your [PreviousYear] certificate has expired.</p>\r\n\r\n<p><strong>Please proceed to renew:</strong></p>\r\n<p>You can proceed with renewing your F-Gas [ApplicationType] Certificate for [CurrentYear] by following the link below. Please ensure you review and update your company details when renewing.</p>\r\n<p><a href=\"https://[site/host]/renew\">https://[site/host]/renew</a></p>\r\n<p>Log in with the email address [Email].</p>',NULL,'','Y','N','','user'),(16,'companyregistration/reminder','Your F-Gas [ApplicationType] Certificate [CertNo] for [CompanyName] expires in [DaysLeft] days','<p>Hello [PrincipleContactName],</p>\r\n\r\n<p><strong>RENEWAL REMINDER</strong></p>\r\n<p>Your F-Gas [ApplicationType] Certificate [CertNo] for [CompanyName] expires in [DaysLeft] days on 31st December [CurrentYear]. Please renew to get your [NextYear] certificate. If you&rsquo;ve already renewed, there&rsquo;s nothing you need to do.<p>\r\n\r\n<p><strong>Please proceed to renew:</strong></p>\r\n<p>You can proceed with renewing your F-Gas [ApplicationType] Certificate for [NextYear] by following the link below. Please ensure you review and update your company details when renewing.</p>\r\n<p><a href=\"https://[site/host]/renew\">https://[site/host]/renew</a></p>\r\n<p>Log in with the email address [Email].</p>',NULL,'','Y','N','','user');
/*!40000 ALTER TABLE `Emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventAttendees`
--

DROP TABLE IF EXISTS `EventAttendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventAttendees` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventId` int(10) DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Company` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Attendees` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventAttendees`
--

LOCK TABLES `EventAttendees` WRITE;
/*!40000 ALTER TABLE `EventAttendees` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventAttendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventTypeTypes`
--

DROP TABLE IF EXISTS `EventTypeTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventTypeTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='module/eventtypes; module/eventtypes_extra. Sort events.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventTypeTypes`
--

LOCK TABLES `EventTypeTypes` WRITE;
/*!40000 ALTER TABLE `EventTypeTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventTypeTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventTypes`
--

DROP TABLE IF EXISTS `EventTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='module/eventtypes. For sorting events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventTypes`
--

LOCK TABLES `EventTypes` WRITE;
/*!40000 ALTER TABLE `EventTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Events` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `StartDate` date DEFAULT NULL,
  `FinishDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `FinishTime` time DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Type` tinyint(3) NOT NULL,
  `Attendable` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `AddressCountry` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `ContactWeb` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
INSERT INTO `Events` VALUES (1,'FTMTA Grass & Muck','ftmta-grass-muck','Gurteen College','<p>Abbey are delighted to be exhibiting once again at the FTMTA Grass &amp; Muck Event on the 14th May, in Gurteen College. This event is focused around working grassland machinery demonstrations, has proven very attractive to both exhibitors and visitors from the outset, having grown on each occasion that it has been held. We will be having exhibiting with a stand alongside partaking in both Muck Spreading and Diet Feeder demonstrations.</p>\r\n','2020-05-14','2020-05-14','10:00:00','17:00:00',1,NULL,NULL,NULL,0,'N','','','','','','','','Offaly','Ireland','','',0);
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EventsPages`
--

DROP TABLE IF EXISTS `EventsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EventsPages` (
  `EventId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`EventId`,`PageId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Event categories (JOIN EventId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EventsPages`
--

LOCK TABLES `EventsPages` WRITE;
/*!40000 ALTER TABLE `EventsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `EventsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExchangeRates`
--

DROP TABLE IF EXISTS `ExchangeRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExchangeRates` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CurrencyFROM` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `CurrencyTO` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `Rate` decimal(10,2) unsigned NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExchangeRates`
--

LOCK TABLES `ExchangeRates` WRITE;
/*!40000 ALTER TABLE `ExchangeRates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ExchangeRates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAQTypes`
--

DROP TABLE IF EXISTS `FAQTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FAQTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For sorting FAQs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAQTypes`
--

LOCK TABLES `FAQTypes` WRITE;
/*!40000 ALTER TABLE `FAQTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `FAQTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FAQs`
--

DROP TABLE IF EXISTS `FAQs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FAQs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL,
  `Title` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `Question` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Answer` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `CreatedAt` datetime DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FAQs`
--

LOCK TABLES `FAQs` WRITE;
/*!40000 ALTER TABLE `FAQs` DISABLE KEYS */;
/*!40000 ALTER TABLE `FAQs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facilities`
--

DROP TABLE IF EXISTS `Facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facilities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(4) DEFAULT '0',
  `AddressTown` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CategoryId` int(10) unsigned DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telephone` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressStreet` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressCounty` char(255) COLLATE utf8_unicode_ci DEFAULT 'Offaly',
  `Description` text COLLATE utf8_unicode_ci,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comments` text COLLATE utf8_unicode_ci COMMENT 'Not displayed at the front of the website.',
  `Display` tinyint(3) unsigned DEFAULT '0',
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facilities`
--

LOCK TABLES `Facilities` WRITE;
/*!40000 ALTER TABLE `Facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `Facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fields`
--

DROP TABLE IF EXISTS `Fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fields` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Source` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Item` int(10) unsigned NOT NULL,
  `Position` int(10) unsigned DEFAULT NULL,
  `Title` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DefaultValue` text COLLATE utf8_unicode_ci,
  `Required` tinyint(3) unsigned DEFAULT '0',
  `Data` text COLLATE utf8_unicode_ci,
  `Rule` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Properties` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`),
  KEY `IndexParent` (`Item`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fields`
--

LOCK TABLES `Fields` WRITE;
/*!40000 ALTER TABLE `Fields` DISABLE KEYS */;
INSERT INTO `Fields` VALUES (1,'ProductsTypes',1,NULL,'PartID','Text',NULL,0,NULL,NULL,NULL,1,NULL),(2,'ProductsTypes',5,NULL,'Start Date','Text',NULL,0,NULL,NULL,NULL,1,NULL),(3,'ProductsTypes',5,NULL,'End Date','Text',NULL,0,NULL,NULL,NULL,1,NULL),(4,'ProductsTypes',5,NULL,'Duration','Text',NULL,0,NULL,NULL,NULL,1,NULL),(5,'ProductsTypes',3,1,'Year','Text','',0,NULL,NULL,NULL,1,NULL),(6,'ProductsTypes',3,5,'Horsepower','Text','',0,NULL,NULL,NULL,1,NULL),(7,'ProductsTypes',3,2,'Registration','Text','',0,NULL,NULL,NULL,1,NULL),(8,'ProductsTypes',3,6,'Condition','Text',NULL,0,NULL,NULL,NULL,1,NULL),(9,'ProductsTypes',3,4,'Cab','Yes/No',NULL,0,NULL,NULL,NULL,1,NULL),(10,'ProductsTypes',1,NULL,'OEM ID','Text',NULL,0,NULL,NULL,NULL,1,NULL),(11,'ProductsTypes',1,NULL,'Suits Models','Text',NULL,0,NULL,NULL,NULL,1,NULL),(12,'ProductsTypes',6,NULL,'Manufacturer\'s Code','Text',NULL,0,NULL,NULL,NULL,1,NULL),(13,'ProductsTypes',3,3,'Hours','Text',NULL,0,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `Fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FieldsData`
--

DROP TABLE IF EXISTS `FieldsData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FieldsData` (
  `FieldId` int(10) unsigned NOT NULL,
  `SourceId` int(10) unsigned NOT NULL DEFAULT '0',
  `SourceTable` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SourceId`,`SourceTable`,`FieldId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FieldsData`
--

LOCK TABLES `FieldsData` WRITE;
/*!40000 ALTER TABLE `FieldsData` DISABLE KEYS */;
/*!40000 ALTER TABLE `FieldsData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FileManagerFolders`
--

DROP TABLE IF EXISTS `FileManagerFolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FileManagerFolders` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Path` text COLLATE utf8_unicode_ci NOT NULL,
  `FolderName` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Original Folder Name',
  `Description` text COLLATE utf8_unicode_ci,
  `Rules` tinyint(3) unsigned DEFAULT '0',
  `Roles` text COLLATE utf8_unicode_ci,
  `Users` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Folders for File Manager.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FileManagerFolders`
--

LOCK TABLES `FileManagerFolders` WRITE;
/*!40000 ALTER TABLE `FileManagerFolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `FileManagerFolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Files`
--

DROP TABLE IF EXISTS `Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Files` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Source` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Item` smallint(5) unsigned NOT NULL,
  `Target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Size` int(10) unsigned NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `Mime` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Type` tinyint(3) unsigned DEFAULT NULL,
  `OriginalName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RemoteUrl` text COLLATE utf8_unicode_ci,
  `AssetUrl` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `FileHash` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `IndexSourceItem` (`Source`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Files`
--

LOCK TABLES `Files` WRITE;
/*!40000 ALTER TABLE `Files` DISABLE KEYS */;
/*!40000 ALTER TABLE `Files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FixtureTypes`
--

DROP TABLE IF EXISTS `FixtureTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FixtureTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FixtureTypes`
--

LOCK TABLES `FixtureTypes` WRITE;
/*!40000 ALTER TABLE `FixtureTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `FixtureTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fixtures`
--

DROP TABLE IF EXISTS `Fixtures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fixtures` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TeamId` int(10) unsigned NOT NULL,
  `ClubId` int(10) unsigned NOT NULL,
  `Date` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `Referee` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `TypeId` int(10) unsigned NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `ResultUs` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ResultThem` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fixtures`
--

LOCK TABLES `Fixtures` WRITE;
/*!40000 ALTER TABLE `Fixtures` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fixtures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flashes`
--

DROP TABLE IF EXISTS `Flashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flashes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Source` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Item` smallint(5) unsigned NOT NULL,
  `Target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Size` int(10) unsigned NOT NULL,
  `Width` int(10) unsigned NOT NULL,
  `Height` int(10) unsigned NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `Mime` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `Type` tinyint(3) unsigned NOT NULL,
  `OriginalName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `RemoteUrl` text COLLATE utf8_unicode_ci,
  `AssetUrl` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `FileHash` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `IndexSourceItem` (`Source`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flashes`
--

LOCK TABLES `Flashes` WRITE;
/*!40000 ALTER TABLE `Flashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProducts`
--

DROP TABLE IF EXISTS `FloorProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(10) unsigned NOT NULL,
  `BrandId` int(10) unsigned NOT NULL DEFAULT '0',
  `ModelId` int(10) unsigned NOT NULL DEFAULT '0',
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `TaxId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `RRPrice` decimal(10,2) unsigned NOT NULL,
  `FittingPrice` decimal(10,2) unsigned NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  `PriceDetails` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SpecialOfferContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `FeatureContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ExtraContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Specifications` text COLLATE utf8_unicode_ci NOT NULL,
  `SqMPerBox` decimal(8,5) NOT NULL,
  `Thickness` decimal(8,5) NOT NULL,
  `WeightId` int(10) NOT NULL,
  `BackingId` int(10) NOT NULL,
  `StyleId` int(10) NOT NULL,
  `Country` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Flagged` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VAT` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `SpecialOfferActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpecialOfferPrice` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `SearchText` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `IsFeatured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PurchaseEnabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `IsOnHomepage` tinyint(1) NOT NULL DEFAULT '0',
  `IsExtra` tinyint(3) NOT NULL DEFAULT '0',
  `SloganId` int(11) NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `BrandId` (`BrandId`),
  KEY `Name` (`Name`),
  KEY `TaxId` (`TaxId`),
  KEY `ModelId` (`ModelId`),
  KEY `SloganId` (`SloganId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProducts`
--

LOCK TABLES `FloorProducts` WRITE;
/*!40000 ALTER TABLE `FloorProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsBackings`
--

DROP TABLE IF EXISTS `FloorProductsBackings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsBackings` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsBackings`
--

LOCK TABLES `FloorProductsBackings` WRITE;
/*!40000 ALTER TABLE `FloorProductsBackings` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsBackings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsFloorProductsRooms`
--

DROP TABLE IF EXISTS `FloorProductsFloorProductsRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsFloorProductsRooms` (
  `FloorProductId` int(10) unsigned NOT NULL,
  `RoomId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`FloorProductId`,`RoomId`),
  KEY `FloorProductId` (`FloorProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Floor Product Rooms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsFloorProductsRooms`
--

LOCK TABLES `FloorProductsFloorProductsRooms` WRITE;
/*!40000 ALTER TABLE `FloorProductsFloorProductsRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsFloorProductsRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsFloorProductsWidths`
--

DROP TABLE IF EXISTS `FloorProductsFloorProductsWidths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsFloorProductsWidths` (
  `FloorProductId` int(10) unsigned NOT NULL,
  `WidthId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`FloorProductId`,`WidthId`),
  KEY `FloorProductId` (`FloorProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Floor Product Widths';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsFloorProductsWidths`
--

LOCK TABLES `FloorProductsFloorProductsWidths` WRITE;
/*!40000 ALTER TABLE `FloorProductsFloorProductsWidths` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsFloorProductsWidths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsItems`
--

DROP TABLE IF EXISTS `FloorProductsItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CartItemDataId` int(10) NOT NULL,
  `Length` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Width` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SqMeters` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fitting` tinyint(4) DEFAULT '0',
  `Boxes` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsItems`
--

LOCK TABLES `FloorProductsItems` WRITE;
/*!40000 ALTER TABLE `FloorProductsItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsPages`
--

DROP TABLE IF EXISTS `FloorProductsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsPages` (
  `FloorProductId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`FloorProductId`,`PageId`),
  KEY `PageId` (`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Floor Product categories (JOIN FloorProductId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsPages`
--

LOCK TABLES `FloorProductsPages` WRITE;
/*!40000 ALTER TABLE `FloorProductsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsRooms`
--

DROP TABLE IF EXISTS `FloorProductsRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsRooms` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsRooms`
--

LOCK TABLES `FloorProductsRooms` WRITE;
/*!40000 ALTER TABLE `FloorProductsRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsStyles`
--

DROP TABLE IF EXISTS `FloorProductsStyles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsStyles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsStyles`
--

LOCK TABLES `FloorProductsStyles` WRITE;
/*!40000 ALTER TABLE `FloorProductsStyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsStyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsTypes`
--

DROP TABLE IF EXISTS `FloorProductsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` enum('lxw','box') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsTypes`
--

LOCK TABLES `FloorProductsTypes` WRITE;
/*!40000 ALTER TABLE `FloorProductsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsVersions`
--

DROP TABLE IF EXISTS `FloorProductsVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsVersions` (
  `FloorProductId` int(10) unsigned NOT NULL,
  `VersionId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`FloorProductId`,`VersionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsVersions`
--

LOCK TABLES `FloorProductsVersions` WRITE;
/*!40000 ALTER TABLE `FloorProductsVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsVersionsStock`
--

DROP TABLE IF EXISTS `FloorProductsVersionsStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsVersionsStock` (
  `FloorProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `VersionId` int(10) unsigned NOT NULL,
  `StockAmount` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`FloorProductId`,`VersionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Stock count per version';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsVersionsStock`
--

LOCK TABLES `FloorProductsVersionsStock` WRITE;
/*!40000 ALTER TABLE `FloorProductsVersionsStock` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsVersionsStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsWeights`
--

DROP TABLE IF EXISTS `FloorProductsWeights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsWeights` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsWeights`
--

LOCK TABLES `FloorProductsWeights` WRITE;
/*!40000 ALTER TABLE `FloorProductsWeights` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsWeights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FloorProductsWidths`
--

DROP TABLE IF EXISTS `FloorProductsWidths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FloorProductsWidths` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FloorProductsWidths`
--

LOCK TABLES `FloorProductsWidths` WRITE;
/*!40000 ALTER TABLE `FloorProductsWidths` DISABLE KEYS */;
/*!40000 ALTER TABLE `FloorProductsWidths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fonts`
--

DROP TABLE IF EXISTS `Fonts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fonts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fonts`
--

LOCK TABLES `Fonts` WRITE;
/*!40000 ALTER TABLE `Fonts` DISABLE KEYS */;
INSERT INTO `Fonts` VALUES (1,'Arial, Helvetica, sans-serif'),(2,'\"Arial Black\", Gadget, sans-se'),(3,'\"Comic Sans MS\", cursive'),(4,'\"Courier New\", monospace'),(5,'Georgia, serif'),(6,'Impact, Charcoal, sans-serif'),(7,'\"Lucida Console\", Monaco, mono'),(8,'\"Lucida Sans Unicode\", \"Lucida'),(9,'\"Palatino Linotype\", \"Book Ant'),(10,'Tahoma, Geneva, sans-serif'),(11,'\"Times New Roman\", Times, seri'),(12,'\"Trebuchet MS\", sans-serif'),(13,'Verdana, Geneva, sans-serif'),(14,'\"MS Sans Serif\", Geneva, sans-'),(15,'\"MS Serif\", \"New York\", serif'),(16,'Parisienne'),(17,'Belleza'),(18,'\"Josefin Sans\"'),(19,'\"Century Gothic\"'),(20,'Calibri'),(21,'Roboto'),(22,'\"Roboto Condensed\"');
/*!40000 ALTER TABLE `Fonts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FontsNames`
--

DROP TABLE IF EXISTS `FontsNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FontsNames` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FontId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FontsNames`
--

LOCK TABLES `FontsNames` WRITE;
/*!40000 ALTER TABLE `FontsNames` DISABLE KEYS */;
INSERT INTO `FontsNames` VALUES (1,16,'Parisienne'),(2,16,'Parisienne-Regular'),(3,17,'Belleza'),(4,17,'Belleza-Regular'),(5,18,'JosefinSans'),(6,21,'Roboto Regular'),(7,21,'Roboto-Regular'),(8,22,'RobotoCondensed'),(9,22,'Roboto Condensed Regular');
/*!40000 ALTER TABLE `FontsNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FontsUrls`
--

DROP TABLE IF EXISTS `FontsUrls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FontsUrls` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FontId` int(10) unsigned NOT NULL DEFAULT '0',
  `Url` char(150) COLLATE utf8_unicode_ci NOT NULL,
  `Format` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FontsUrls`
--

LOCK TABLES `FontsUrls` WRITE;
/*!40000 ALTER TABLE `FontsUrls` DISABLE KEYS */;
INSERT INTO `FontsUrls` VALUES (1,16,'https://themes.googleusercontent.com/static/fonts/parisienne/v1/1wiHF6pWOa568Cj3p-anxFQlYEbsez9cZjKsNMjLOwM.eot','embedded-opentype'),(2,16,'https://themes.googleusercontent.com/static/fonts/parisienne/v1/1wiHF6pWOa568Cj3p-anxBsxEYwM7FgeyaSgU71cLG0.woff','woff'),(3,17,'https://themes.googleusercontent.com/static/fonts/belleza/v1/6vro92rxXIoeIhMkLHqPOg.eot','embedded-opentype'),(4,17,'https://themes.googleusercontent.com/static/fonts/belleza/v1/hrFuBwXjCvf5Qp3q0X6-3Q.woff','woff'),(5,18,'https://themes.googleusercontent.com/static/fonts/josefinsans/v3/xgzbb53t8j-Mo-vYa23n5nZ2MAKAc2x4R1uOSeegc5U.eot','embedded-opentype'),(6,18,'https://themes.googleusercontent.com/static/fonts/josefinsans/v3/xgzbb53t8j-Mo-vYa23n5nhCUOGz7vYGh680lGh-uXM.woff','woff'),(7,21,'https://themes.googleusercontent.com/static/fonts/roboto/v8/5YB-ifwqHP20Yn46l_BDhA.eot','embedded-opentype'),(8,21,'https://themes.googleusercontent.com/static/fonts/roboto/v8/2UX7WLTfW3W8TclTUvlFyQ.woff','woff'),(9,22,'https://themes.googleusercontent.com/static/fonts/robotocondensed/v7/Zd2E9abXLFGSr9G3YK2MsFzqCfRpIA3W6ypxnPISCPA.woff','woff'),(10,22,'https://themes.googleusercontent.com/static/fonts/robotocondensed/v7/b9QBgL0iMZfDSpmcXcE8nCrW_eugtb5_efFKynOEdiw.eot','embedded-opentype');
/*!40000 ALTER TABLE `FontsUrls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Forms`
--

DROP TABLE IF EXISTS `Forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Forms` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Success` text COLLATE utf8_unicode_ci,
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SendEmail` tinyint(3) unsigned DEFAULT '1',
  `HasCaptcha` tinyint(3) unsigned DEFAULT '1',
  `Display` tinyint(3) unsigned DEFAULT '1',
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `Fields` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Forms`
--

LOCK TABLES `Forms` WRITE;
/*!40000 ALTER TABLE `Forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `Forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Forum_Categories`
--

DROP TABLE IF EXISTS `Forum_Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Forum_Categories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned DEFAULT NULL,
  `Position` int(10) unsigned DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Topic` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `IndexName` (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Forum_Categories`
--

LOCK TABLES `Forum_Categories` WRITE;
/*!40000 ALTER TABLE `Forum_Categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `Forum_Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Forum_Topics`
--

DROP TABLE IF EXISTS `Forum_Topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Forum_Topics` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned DEFAULT NULL,
  `CatId` int(10) unsigned DEFAULT '0',
  `Title` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Views` int(10) unsigned DEFAULT '0',
  `Validated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Forum_Topics`
--

LOCK TABLES `Forum_Topics` WRITE;
/*!40000 ALTER TABLE `Forum_Topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `Forum_Topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Forum_Topics_Comments`
--

DROP TABLE IF EXISTS `Forum_Topics_Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Forum_Topics_Comments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned DEFAULT NULL,
  `TopicId` int(10) unsigned DEFAULT '0',
  `Comment` text COLLATE utf8_unicode_ci NOT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Validated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Forum_Topics_Comments`
--

LOCK TABLES `Forum_Topics_Comments` WRITE;
/*!40000 ALTER TABLE `Forum_Topics_Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Forum_Topics_Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HireEnquiry`
--

DROP TABLE IF EXISTS `HireEnquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HireEnquiry` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='hire requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HireEnquiry`
--

LOCK TABLES `HireEnquiry` WRITE;
/*!40000 ALTER TABLE `HireEnquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `HireEnquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HireEnquiryProducts`
--

DROP TABLE IF EXISTS `HireEnquiryProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HireEnquiryProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) NOT NULL,
  `Quantity` int(3) NOT NULL DEFAULT '1',
  `EnquiryId` int(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `EnquiryId` (`EnquiryId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='hire request products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HireEnquiryProducts`
--

LOCK TABLES `HireEnquiryProducts` WRITE;
/*!40000 ALTER TABLE `HireEnquiryProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `HireEnquiryProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HireProductUsage`
--

DROP TABLE IF EXISTS `HireProductUsage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HireProductUsage` (
  `ProductId` int(10) unsigned NOT NULL,
  `InfoId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProductId`,`InfoId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='JOIN HireProducts to UsageInformation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HireProductUsage`
--

LOCK TABLES `HireProductUsage` WRITE;
/*!40000 ALTER TABLE `HireProductUsage` DISABLE KEYS */;
/*!40000 ALTER TABLE `HireProductUsage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HireProducts`
--

DROP TABLE IF EXISTS `HireProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HireProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BrandId` int(10) unsigned NOT NULL DEFAULT '0',
  `ModelId` int(10) unsigned NOT NULL DEFAULT '0',
  `TaxId` int(10) unsigned DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Spotlight` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  `PriceWeek` decimal(10,2) unsigned NOT NULL,
  `PriceExtra` decimal(10,2) unsigned NOT NULL,
  `FeatureContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ExtraContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Specifications` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Flagged` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VAT` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `SearchText` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Versions` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsFeatured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PurchaseEnabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `IsTest` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SloganId` int(11) NOT NULL,
  `ProductType` tinyint(3) NOT NULL DEFAULT '1',
  `Availability` char(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `TaxId` (`TaxId`),
  KEY `ModelId` (`ModelId`),
  KEY `SloganId` (`SloganId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HireProducts`
--

LOCK TABLES `HireProducts` WRITE;
/*!40000 ALTER TABLE `HireProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `HireProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HireProductsPages`
--

DROP TABLE IF EXISTS `HireProductsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HireProductsPages` (
  `ProductId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProductId`,`PageId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Hire Product categories (JOIN ProductId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HireProductsPages`
--

LOCK TABLES `HireProductsPages` WRITE;
/*!40000 ALTER TABLE `HireProductsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `HireProductsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HireRequests`
--

DROP TABLE IF EXISTS `HireRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HireRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Pickup` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DropOff` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateFrom` datetime NOT NULL,
  `DateTo` datetime NOT NULL,
  `FirstChoice` int(11) NOT NULL,
  `SecondChoice` int(11) NOT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `MobilePhone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `DriverAge` int(11) NOT NULL,
  `LicenseAge` int(11) NOT NULL,
  `AdditionalDrivers` tinyint(4) NOT NULL DEFAULT '0',
  `ChildSeat` tinyint(4) NOT NULL DEFAULT '0',
  `SatNav` tinyint(4) NOT NULL DEFAULT '0',
  `SnowChains` tinyint(4) NOT NULL DEFAULT '0',
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HireRequests`
--

LOCK TABLES `HireRequests` WRITE;
/*!40000 ALTER TABLE `HireRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `HireRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelRoomTypes`
--

DROP TABLE IF EXISTS `HotelRoomTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelRoomTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Adult` tinyint(4) NOT NULL,
  `Child` tinyint(4) NOT NULL,
  `Total` tinyint(4) NOT NULL,
  `Single` enum('n/a','available','supplement') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Hotel details (for Travel module).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelRoomTypes`
--

LOCK TABLES `HotelRoomTypes` WRITE;
/*!40000 ALTER TABLE `HotelRoomTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `HotelRoomTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotels`
--

DROP TABLE IF EXISTS `Hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotels` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Location` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Detail` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Hotel details (for Travel module).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotels`
--

LOCK TABLES `Hotels` WRITE;
/*!40000 ALTER TABLE `Hotels` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelsRooms`
--

DROP TABLE IF EXISTS `HotelsRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelsRooms` (
  `HotelId` int(10) unsigned NOT NULL,
  `RoomTypeId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`HotelId`,`RoomTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelsRooms`
--

LOCK TABLES `HotelsRooms` WRITE;
/*!40000 ALTER TABLE `HotelsRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `HotelsRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Images`
--

DROP TABLE IF EXISTS `Images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Images` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Source` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Item` int(10) unsigned NOT NULL,
  `Target` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Caption` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `TitleText` text COLLATE utf8_unicode_ci NOT NULL,
  `AltText` text COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `Position` int(10) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Valid` tinyint(3) unsigned NOT NULL,
  `Size` int(10) unsigned NOT NULL,
  `Width` int(10) unsigned NOT NULL,
  `Height` int(10) unsigned NOT NULL,
  `HtmlSize` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `OriginalName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CurrentName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `Mime` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Type` tinyint(3) unsigned NOT NULL,
  `Front` tinyint(3) unsigned NOT NULL,
  `RemoteUrl` text COLLATE utf8_unicode_ci,
  `AssetUrl` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `FileHash` char(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ThumbName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `IndexSourceItem` (`Source`,`Item`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Images`
--

LOCK TABLES `Images` WRITE;
/*!40000 ALTER TABLE `Images` DISABLE KEYS */;
INSERT INTO `Images` VALUES (1,'PagesGallery',249,'abbey-machinery-state-of-the-art-factory-1024x529.jpg','','','','','',1,1,0,163413,1024,529,'width=\"1024\" height=\"529\"','Abbey-Machinery-State-of-the-Art-Factory-1024x529.jpg','',1592234356,'image/jpeg',2,0,NULL,'','',''),(4,'ConfigGallery',1,'abbey-machinery-1.png','','','','','',1,1,0,139186,800,480,'width=\"800\" height=\"480\"','abbey-machinery.png','',1592236092,'image/png',3,0,NULL,'','',''),(5,'ConfigBanner',1,'abbey-machinery-logo-2.png','','','','','',1,0,0,70236,696,197,'width=\"696\" height=\"197\"','abbey-machinery-logo-2.png','',1592236731,'image/png',3,0,NULL,'','',''),(6,'PagesGallery',1,'20191009-153801.jpg','','','','','',1,0,0,547316,1920,1440,'width=\"1920\" height=\"1440\"','20191009_153801.jpg','',1592293851,'image/jpeg',2,0,NULL,'','',''),(7,'PagesTop',1,'20191009-153801-1.jpg','','','','','',1,0,0,547316,1920,1440,'width=\"1920\" height=\"1440\"','20191009_153801.jpg','',1592293900,'image/jpeg',2,0,NULL,'','',''),(9,'PagesGallery',248,'qparts-welcome-image-300x225.jpg','','','','','',1,0,0,21806,300,225,'width=\"300\" height=\"225\"','qparts-welcome-image-300x225.jpg','',1592388753,'image/jpeg',2,0,NULL,'','',''),(10,'PagesGallery',246,'abbey-machinery-state-of-the-art-factory-600x399.jpg','','','','','',1,1,0,47089,600,399,'width=\"600\" height=\"399\"','Abbey-Machinery-State-of-the-Art-Factory-600x399.jpg','',1592388851,'image/jpeg',2,0,NULL,'','',''),(11,'PagesGallery',250,'abbey-machine.jpeg','','','','','',1,1,0,56687,600,450,'width=\"600\" height=\"450\"','Abbey-Machine.jpeg','',1592388915,'image/jpeg',2,0,NULL,'','',''),(12,'PagesGallery',247,'abbey-product-image.jpg','','','','','',1,1,0,913397,2048,1536,'width=\"2048\" height=\"1536\"','Abbey-Product-Image.jpg','',1592389091,'image/jpeg',2,0,NULL,'','',''),(13,'EventsGallery',1,'ftmta-grass-muck.png','','','','','',1,1,0,104252,208,300,'width=\"208\" height=\"300\"','FTMTA-Grass-Muck.png','',1592393046,'image/png',3,0,NULL,'','',''),(14,'NewsGallery',1,'multi-arm.jpg','','','','','',1,0,0,68251,600,450,'width=\"600\" height=\"450\"','Multi-Arm.jpg','',1592393341,'image/jpeg',2,0,NULL,'','',''),(15,'NewsGallery',1,'nir-on-board-evo-600x351.jpg','','','','','',3,1,0,26852,600,351,'width=\"600\" height=\"351\"','nir-on-board-evo-600x351.jpg','',1592393638,'image/jpeg',2,0,NULL,'','',''),(16,'TestimonialsGallery',2,'richard-westlake-2-300x300.jpg','','','','','',1,1,0,24156,300,300,'width=\"300\" height=\"300\"','Richard-Westlake-2-300x300.jpg','',1592473101,'image/jpeg',2,0,NULL,'','',''),(17,'TestimonialsGallery',1,'desmond-fennell-pic-in-front-of-tanker-and-diet-feeder-300x300.jpg','','','','','',1,1,0,18474,300,300,'width=\"300\" height=\"300\"','Desmond-Fennell-pic-in-front-of-tanker-and-diet-feeder-300x300.jpg','',1592473211,'image/jpeg',2,0,NULL,'','',''),(18,'ProductsGallery',1,'static-feeder.jpg','','','','','',3,0,0,317027,2048,1536,'width=\"2048\" height=\"1536\"','Static-Feeder.jpg','',1592488773,'image/jpeg',2,0,NULL,'','',''),(19,'ProductsGallery',1,'static-feeder-on-truck.jpg','','','','','',4,1,0,535434,2048,1536,'width=\"2048\" height=\"1536\"','Static-Feeder-on-truck.jpg','',1592488912,'image/jpeg',2,0,NULL,'','',''),(20,'ProductsGallery',2,'abbey-paddle-feeder.jpg','','','','','',1,0,0,633446,2048,1536,'width=\"2048\" height=\"1536\"','Abbey-Paddle-Feeder.jpg','',1592489081,'image/jpeg',2,0,NULL,'','',''),(21,'ProductsGallery',3,'slurry-tanker.jpg','','','','','',1,0,0,703908,2048,1536,'width=\"2048\" height=\"1536\"','Slurry-Tanker.jpg','',1592489879,'image/jpeg',2,0,NULL,'','',''),(22,'ProductsGallery',4,'grassland-topper.jpg','','','','','',1,0,0,977513,2048,1536,'width=\"2048\" height=\"1536\"','Grassland Topper.jpg','',1592490522,'image/jpeg',2,0,NULL,'','',''),(23,'NewsGallery',2,'img-1554-3-600x450.jpg','','','','','',1,0,0,56146,600,450,'width=\"600\" height=\"450\"','IMG_1554-3-600x450.jpg','',1592491570,'image/jpeg',2,0,NULL,'','',''),(24,'JobsGallery',1,'calculator-385506-1280.jpg','','','','','',1,1,0,127337,1280,754,'width=\"1280\" height=\"754\"','calculator-385506_1280.jpg','',1592492188,'image/jpeg',2,0,NULL,'','',''),(25,'JobsGallery',3,'blowtorch-596294-640.jpg','','','','','',1,1,0,22087,640,427,'width=\"640\" height=\"427\"','blowtorch-596294_640.jpg','',1592492284,'image/jpeg',2,0,NULL,'','',''),(26,'BrandsGallery',2,'battioni-logo.png','','','','','',1,0,0,171609,2344,1142,'width=\"2344\" height=\"1142\"','Battioni-logo.png','',1592579697,'image/png',3,0,NULL,'','',''),(27,'SocialMediaGallery',1,'twitter1b3764.png','','','','','',1,1,0,780,50,50,'width=\"50\" height=\"50\"','twitter1B3764.png','',1592821352,'image/png',3,0,NULL,'','',''),(28,'SocialMediaGallery',2,'facebook1b3764.png','','','','','',1,1,0,442,50,50,'width=\"50\" height=\"50\"','facebook1B3764.png','',1592821428,'image/png',3,0,NULL,'','',''),(29,'ConfigFavicon',1,'abbey-machinery-favicon.png','','','','','',1,1,0,3270,35,35,'width=\"35\" height=\"35\"','abbey-retail-favicon.png','abbey-machinery-favicon.png',1592821478,'image/png',3,0,NULL,'','',''),(30,'SocialMediaGallery',3,'youtube08244f.png','','','','','',1,1,0,763,50,50,'width=\"50\" height=\"50\"','youtube08244f.png','',1592821522,'image/png',3,0,NULL,'','',''),(31,'NewsGallery',2,'img-1554-3-600x450.png','','','','','',2,1,0,56146,598,359,'width=\"598\" height=\"359\"','IMG_1554-3-600x450.jpg [cropped]','',1592823029,'image/jpeg',2,0,NULL,'','',''),(33,'ProductsGallery',3,'slurry-tanker.png','','','','','',2,1,0,703908,2047,1228,'width=\"2047\" height=\"1228\"','Slurry-Tanker.jpg [cropped]','',1592823115,'image/jpeg',2,0,NULL,'','',''),(34,'ProductsGallery',1,'static-feeder.png','','','','','',2,0,0,317027,2048,1229,'width=\"2048\" height=\"1229\"','Static-Feeder.jpg [cropped]','',1592823181,'image/jpeg',2,0,NULL,'','',''),(36,'ProductsGallery',4,'grassland-topper.png','','','','','',2,1,0,977513,1908,1145,'width=\"1908\" height=\"1145\"','Grassland Topper.jpg [cropped]','',1592823422,'image/jpeg',2,0,NULL,'','',''),(37,'PagesGallery',281,'grassland-topper-1.png','','','','','',1,0,0,3452483,1908,1145,'width=\"1908\" height=\"1145\"','grassland-topper.png','',1592823459,'image/png',3,0,NULL,'','',''),(38,'PagesGallery',248,'qparts-welcome-image-300x225.png','','','','','',2,1,0,21806,300,180,'width=\"300\" height=\"180\"','qparts-welcome-image-300x225.jpg [cropped]','',1592823502,'image/jpeg',2,0,NULL,'','',''),(39,'NewsGallery',1,'multi-arm-1.png','','','','','',2,1,0,68251,600,360,'width=\"600\" height=\"360\"','Multi-Arm.jpg [cropped]','',1592824134,'image/jpeg',2,0,NULL,'','',''),(40,'ProductsGallery',8,'battioni-pump.jpg','','','','','',1,1,0,9109,220,229,'width=\"220\" height=\"229\"','Battioni-pump.jpg','',1592843577,'image/jpeg',2,0,NULL,'','',''),(41,'PagesGallery',1,'abbey-yellow-tanker.jpg','','','','','',2,0,0,442901,2048,1536,'width=\"2048\" height=\"1536\"','Abbey-Yellow-Tanker.jpg','',1592843788,'image/jpeg',2,0,NULL,'','',''),(44,'BrandsGallery',4,'kuhn.png','','','','','',1,1,0,47651,600,314,'width=\"600\" height=\"314\"','KUHN.png','',1592898590,'image/png',3,0,NULL,'','',''),(45,'BrandsGallery',5,'mchale.jpg','','','','','',1,0,0,76158,669,399,'width=\"669\" height=\"399\"','McHale.jpg','',1592898741,'image/jpeg',2,0,NULL,'','',''),(46,'BrandsGallery',6,'john-deere.png','','','','','',1,0,0,64573,884,663,'width=\"884\" height=\"663\"','John-Deere.png','',1592898804,'image/png',3,0,NULL,'','',''),(48,'PagesTop',1,'pic-7-factory-picture.png','','','','','',2,0,0,131116,1017,376,'width=\"1017\" height=\"376\"','Pic-7-Factory-Picture.jpg [cropped]','',1592985588,'image/jpeg',2,0,NULL,'','',''),(49,'PagesTop',1,'img-3031-1.png','Experts in Feeding, Slurry and Grassland Management','','','','',3,1,0,6131512,3752,1280,'width=\"3752\" height=\"1280\"','img-3031.png','img-3031.png',1592986512,'image/png',3,0,NULL,'','',''),(50,'ConfigBanner',1,'abbey-machinery-logo-update.png','','','','','',2,0,0,64261,696,159,'width=\"696\" height=\"159\"','abbey-machinery-logo-update.png','',1592987705,'image/png',3,0,NULL,'','',''),(51,'ConfigBanner',1,'abbey-machinery-logo-white.png','','','','','',3,1,0,65855,696,159,'width=\"696\" height=\"159\"','abbey-machinery-logo-White.png','',1592996619,'image/png',3,0,NULL,'','',''),(52,'ProductsGallery',5,'4-battioni-pumps-mec-1000-1600-2000-3000-4000-5000-6500-8000.jpg','','','','','',1,1,0,57965,483,515,'width=\"483\" height=\"515\"','4-Battioni-Pumps---MEC-1000-1600-2000-3000-4000-5000-6500-8000.jpg','',1593000645,'image/jpeg',2,0,NULL,'','',''),(53,'PagesGallery',252,'100-feeder.png','','','','','',1,0,0,28110,800,480,'width=\"800\" height=\"480\"','100-Feeder.png','',1593001143,'image/png',3,0,NULL,'','',''),(54,'PagesGallery',251,'slurry-tanker-2.png','','','','','',1,0,0,29073,800,480,'width=\"800\" height=\"480\"','Slurry-tanker-2.png','',1593001186,'image/png',3,0,NULL,'','',''),(55,'NewsGallery',3,'dc.jpg','','','','','',1,1,0,4315,200,200,'width=\"200\" height=\"200\"','dc.jpg','',1593004541,'image/jpeg',2,0,NULL,'','',''),(56,'PagesGallery',253,'mower.png','','','','','',1,0,0,27795,800,480,'width=\"800\" height=\"480\"','Mower.png','',1593004715,'image/png',3,0,NULL,'','',''),(57,'ProductsGallery',1,'static-feeder-2.png','','','','','',1,1,0,317027,1800,1080,'width=\"1800\" height=\"1080\"','Static-Feeder.jpg [cropped] [cropped]','',1593005365,'image/jpeg',2,0,NULL,'','',''),(58,'ProductsGallery',2,'abbey-paddle-feeder.png','','','','','',2,1,0,633446,2048,1229,'width=\"2048\" height=\"1229\"','Abbey-Paddle-Feeder.jpg [cropped]','',1593005399,'image/jpeg',2,0,NULL,'','',''),(62,'PagesGallery',278,'abbey-paddle-feeder-1.png','','','','','',1,1,0,2573521,2048,1229,'width=\"2048\" height=\"1229\"','abbey-paddle-feeder.png','',1593005499,'image/png',3,0,NULL,'','',''),(65,'BrandsGallery',2,'battioni-pagani-logo-2-1.png','','','','','',2,1,0,16302,610,250,'width=\"610\" height=\"250\"','battioni_pagani_logo-2.png','',1593006053,'image/png',3,0,NULL,'','',''),(66,'BrandsGallery',5,'mh-logo1.png','','','','','',2,1,0,6923,504,117,'width=\"504\" height=\"117\"','MH logo1.png','',1593006068,'image/png',3,0,NULL,'','',''),(67,'BrandsGallery',6,'jd-2.png','','','','','',2,1,0,60709,527,315,'width=\"527\" height=\"315\"','JD-2.png','',1593006083,'image/png',3,0,NULL,'','',''),(68,'PagesGallery',251,'slurry-muck-handling.png','','','','','',2,0,0,12735,800,480,'width=\"800\" height=\"480\"','Slurry & Muck Handling.png','',1593428223,'image/png',3,1,NULL,'','',''),(69,'PagesGallery',252,'diet-feeders.png','','','','','',2,0,0,12216,800,481,'width=\"800\" height=\"481\"','Diet Feeders.png','',1593428241,'image/png',3,1,NULL,'','',''),(70,'PagesGallery',253,'grassland-management.png','','','','','',2,0,0,7020,800,481,'width=\"800\" height=\"481\"','Grassland Management.png','',1593428262,'image/png',3,1,NULL,'','',''),(71,'PagesGallery',275,'slurry-muck-handling-1.png','','','','','',1,0,0,12735,800,480,'width=\"800\" height=\"480\"','Slurry & Muck Handling.png','',1593437392,'image/png',3,1,NULL,'','',''),(72,'PagesGallery',277,'untitled-3-04.png','','','','','',1,0,0,18242,801,480,'width=\"801\" height=\"480\"','Untitled-3-04.png','',1593437422,'image/png',3,1,NULL,'','',''),(74,'PagesGallery',284,'untitled-3-05.png','','','','','',1,0,0,13220,801,481,'width=\"801\" height=\"481\"','Untitled-3-05.png','',1593437724,'image/png',3,1,NULL,'','',''),(75,'PagesGallery',283,'untitled-3-06.png','','','','','',1,0,0,11802,801,481,'width=\"801\" height=\"481\"','Untitled-3-06.png','',1593437746,'image/png',3,1,NULL,'','',''),(76,'PagesGallery',278,'untitled-3-02-1.png','','','','','',2,0,0,12216,800,481,'width=\"800\" height=\"481\"','Untitled-3-02.png','',1593437810,'image/png',3,1,NULL,'','',''),(77,'PagesGallery',280,'vertical-feeder.png','','','','','',1,0,0,12361,800,480,'width=\"800\" height=\"480\"','vertical-feeder.png','',1593438953,'image/png',3,1,NULL,'','',''),(78,'PagesGallery',279,'static-feeder-3.png','','','','','',1,1,0,5335,800,480,'width=\"800\" height=\"480\"','Static-Feeder.png','',1593438972,'image/png',3,0,NULL,'','',''),(79,'PagesGallery',287,'dewalt-dcd796n-brushless-combi-drill.jpg','','','','','',1,1,0,277350,960,960,'width=\"960\" height=\"960\"','DeWALT-DCD796N-Brushless-Combi-Drill.jpg','',1595329898,'image/jpeg',2,0,NULL,'','','');
/*!40000 ALTER TABLE `Images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IndividualMembership`
--

DROP TABLE IF EXISTS `IndividualMembership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IndividualMembership` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TeamId` int(10) NOT NULL,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `ParentId` int(10) NOT NULL DEFAULT '0',
  `IsMember` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FirstName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tullamore',
  `County` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `Mobile` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LandLine` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `School` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Relationship1` enum('mother','father','sister','brother','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Relationship2` enum('mother','father','sister','brother','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentName1` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentName2` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentOccupation1` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentOccupation2` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentPhone1` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentPhone2` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentEmail1` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentEmail2` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Volunteer1` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Volunteer2` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MedicalCondition` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Treatment` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MedicalDetails` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProtectionAgreed` tinyint(4) NOT NULL DEFAULT '0',
  `PaymentStatus` enum('paid','unpaid') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembershipStatus` enum('registered','paid','incomplete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentMethodId` int(11) NOT NULL,
  `PriceType` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DatePayment` date DEFAULT NULL,
  `CardIssued` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` int(10) NOT NULL DEFAULT '0',
  `Federated` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `FederationNumber` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InsurancePolicy` tinyint(4) NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ModifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `InternalCode` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Conduct` tinyint(4) NOT NULL DEFAULT '0',
  `AntiDoping` tinyint(4) NOT NULL DEFAULT '0',
  `MembershipNumber` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `OtherAssociation` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IsChild` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `EmailVisible` enum('Yes','No') COLLATE utf8_unicode_ci DEFAULT 'No',
  `Country` char(255) COLLATE utf8_unicode_ci DEFAULT 'Ireland',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IndividualMembership`
--

LOCK TABLES `IndividualMembership` WRITE;
/*!40000 ALTER TABLE `IndividualMembership` DISABLE KEYS */;
/*!40000 ALTER TABLE `IndividualMembership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Industry`
--

DROP TABLE IF EXISTS `Industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Industry` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Industry`
--

LOCK TABLES `Industry` WRITE;
/*!40000 ALTER TABLE `Industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `Industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemPositions`
--

DROP TABLE IF EXISTS `ItemPositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItemPositions` (
  `Table` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Subdivision` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Item` int(10) unsigned NOT NULL,
  `Subitem` int(10) unsigned DEFAULT NULL,
  `Position` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`Table`,`Subdivision`,`Item`,`Subitem`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Positions for any items with complex positions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemPositions`
--

LOCK TABLES `ItemPositions` WRITE;
/*!40000 ALTER TABLE `ItemPositions` DISABLE KEYS */;
INSERT INTO `ItemPositions` VALUES ('Products','Page',1,NULL,1),('Products','Page',1,252,1),('Products','Page',1,279,1),('Products','Page',2,NULL,2),('Products','Page',2,252,2),('Products','Page',2,278,1),('Products','Page',3,NULL,3),('Products','Page',3,251,1),('Products','Page',4,NULL,4),('Products','Page',4,253,1),('Products','Page',4,281,1),('Products','Page',5,NULL,5),('Products','Page',6,NULL,6),('Products','Page',7,NULL,7),('Products','Page',8,NULL,8),('Products','Page',9,NULL,9),('Products','Page',5,251,2),('Products','Page',6,251,3),('Products','Page',7,251,4),('Products','Page',8,251,5),('Products','Page',8,276,1),('Products','Page',6,276,2),('Products','Page',7,276,3),('Pages','Page',248,1,1),('Pages','Page',251,1,2),('Pages','Page',252,1,3),('Pages','Page',253,1,4),('Pages','Page',254,1,5);
/*!40000 ALTER TABLE `ItemPositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ItemStatuses`
--

DROP TABLE IF EXISTS `ItemStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ItemStatuses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItemStatuses`
--

LOCK TABLES `ItemStatuses` WRITE;
/*!40000 ALTER TABLE `ItemStatuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItemStatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobApplications`
--

DROP TABLE IF EXISTS `JobApplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobApplications` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobApplications`
--

LOCK TABLES `JobApplications` WRITE;
/*!40000 ALTER TABLE `JobApplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobApplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobFields`
--

DROP TABLE IF EXISTS `JobFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobFields` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobFields`
--

LOCK TABLES `JobFields` WRITE;
/*!40000 ALTER TABLE `JobFields` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobHours`
--

DROP TABLE IF EXISTS `JobHours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobHours` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobHours`
--

LOCK TABLES `JobHours` WRITE;
/*!40000 ALTER TABLE `JobHours` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobHours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobStatuses`
--

DROP TABLE IF EXISTS `JobStatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobStatuses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobStatuses`
--

LOCK TABLES `JobStatuses` WRITE;
/*!40000 ALTER TABLE `JobStatuses` DISABLE KEYS */;
INSERT INTO `JobStatuses` VALUES (1,'Open','open');
/*!40000 ALTER TABLE `JobStatuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jobs`
--

DROP TABLE IF EXISTS `Jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jobs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Salary` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Location` char(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Qualifications` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) unsigned DEFAULT NULL,
  `Status` int(10) NOT NULL COMMENT 'JobStatuses',
  `Hours` int(10) NOT NULL COMMENT 'JobHours',
  `Field` int(10) NOT NULL COMMENT 'JobFields',
  `CreatedOn` datetime DEFAULT NULL,
  `Expires` datetime DEFAULT NULL,
  `PreviewText` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Job Vancancies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jobs`
--

LOCK TABLES `Jobs` WRITE;
/*!40000 ALTER TABLE `Jobs` DISABLE KEYS */;
INSERT INTO `Jobs` VALUES (1,NULL,'Management Accountant','mechanic','','TBA','Nenagh','<p>Abbey Machinery Limited are delighted to come to market looking for a skilled Management Accountant to join the Finance Team on a contract basis. The successful candidate will play a key role in analysing and reporting on margins to management. This is a very hands-on role working closely with operations, engineering and supply chain. The successful candidate will also provide maternity cover for the management accountant position, including monthly management accounts and payroll. The role will report to the Financial Controller.</p>\r\n\r\n<p><strong>To apply send CV and Cover Letter to&nbsp;hr@abbeymachinery.com</strong></p>\r\n','',1,1,0,0,NULL,NULL,'',NULL,NULL,NULL),(2,NULL,'General Operative','general-operative','','TBA','Nenagh','<p>We are looking for a general operative to join our expanding team. The applicant must to hard working and be able to work in a fast-pace environment.</p>\r\n\r\n<p>To apply send CV and Cover Letter to&nbsp;hr@abbeymachinery.com</p>\r\n','',0,1,0,0,NULL,NULL,'',NULL,NULL,NULL),(3,NULL,'Welder','welder','','TBA','Nenagh','<p>We have an opening for an experienced welder to join our team.</p>\r\n\r\n<p>To apply send CV and Cover Letter to&nbsp;hr@abbeymachinery.com</p>\r\n','',1,1,0,0,NULL,NULL,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobsApplications`
--

DROP TABLE IF EXISTS `JobsApplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobsApplications` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `JobId` int(10) NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comments` text COLLATE utf8_unicode_ci,
  `OwnCode` text COLLATE utf8_unicode_ci,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `SubmittedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobsApplications`
--

LOCK TABLES `JobsApplications` WRITE;
/*!40000 ALTER TABLE `JobsApplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `JobsApplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Levies`
--

DROP TABLE IF EXISTS `Levies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Levies` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CompetitionId` int(10) NOT NULL DEFAULT '0',
  `ClubId` int(10) NOT NULL DEFAULT '0',
  `Entries` int(10) NOT NULL DEFAULT '0',
  `Junior` int(10) NOT NULL DEFAULT '0',
  `Senior` int(10) NOT NULL DEFAULT '0',
  `ICTFS` int(10) NOT NULL DEFAULT '0',
  `Insurance` int(10) NOT NULL DEFAULT '0',
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Levies`
--

LOCK TABLES `Levies` WRITE;
/*!40000 ALTER TABLE `Levies` DISABLE KEYS */;
/*!40000 ALTER TABLE `Levies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Links`
--

DROP TABLE IF EXISTS `Links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Links` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) NOT NULL DEFAULT '0',
  `Type` int(10) NOT NULL DEFAULT '0',
  `Title` char(70) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Links`
--

LOCK TABLES `Links` WRITE;
/*!40000 ALTER TABLE `Links` DISABLE KEYS */;
/*!40000 ALTER TABLE `Links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LinksTypes`
--

DROP TABLE IF EXISTS `LinksTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LinksTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For sorting links';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LinksTypes`
--

LOCK TABLES `LinksTypes` WRITE;
/*!40000 ALTER TABLE `LinksTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `LinksTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned DEFAULT NULL,
  `Position` int(10) unsigned DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Display` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexName` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,0,1,'ireland','Ireland','',1),(2,1,3,'ulster','Ulster','',1),(3,1,4,'munster','Munster','',1),(4,1,5,'leinster','Leinster','',1),(5,1,6,'connacht','Connacht','',1),(6,5,1,'galway','Galway','',1),(7,5,2,'leitrim','Leitrim','',1),(8,5,3,'mayo','Mayo','',1),(9,5,4,'roscommon','Roscommon','',1),(10,5,5,'sligo','Sligo','',1),(11,4,1,'carlow','Carlow','',1),(12,4,2,'dublin','Dublin','',1),(13,4,3,'kildare','Kildare','',1),(14,4,4,'kilkenny','Kilkenny','',1),(15,4,5,'laois','Laois','',1),(16,4,6,'longford','Longford','',1),(17,4,7,'louth','Louth','',1),(18,4,8,'meath','Meath','',1),(19,4,9,'offaly','Offaly','',1),(20,4,10,'westmeath','Westmeath','',1),(21,4,11,'wexford','Wexford','',1),(22,4,12,'wicklow','Wicklow','',1),(23,3,1,'clare','Clare','',1),(24,3,2,'cork','Cork','',1),(25,3,3,'kerry','Kerry','',1),(26,3,4,'limerick','Limerick','',1),(27,3,5,'tipperary','Tipperary','',1),(28,3,6,'waterford','Waterford','',1),(29,2,4,'northern-ireland','Northern Ireland','',1),(30,29,1,'antrim','Antrim','',1),(31,29,2,'armagh','Armagh','',1),(32,29,3,'down','Down','',1),(33,29,4,'fermanagh','Fermanagh','',1),(34,29,5,'derry-londonderry','Derry (Londonderry)','',1),(35,29,6,'tyrone','Tyrone','',1),(36,2,2,'donegal','Donegal','',1),(37,2,3,'monaghan','Monaghan','',1),(38,12,1,'dublin-city','Dublin City','',1),(39,12,2,'dun-laoghaire-rathdown','Dun Laoghaire-Rathdown','',1),(40,12,3,'fingal','Fingal','',1),(41,12,4,'south-dublin','South Dublin','',1),(42,2,1,'cavan','Cavan','',1);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Locations`
--

DROP TABLE IF EXISTS `Locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Locations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Manager` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneInternational` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Web` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Town` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Postcode` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `MapsLat` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapsZoom` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `MapsStreetView` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MapsInfo` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MapsType` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Url` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Footer` tinyint(3) NOT NULL DEFAULT '1',
  `HeaderPhone` tinyint(3) NOT NULL DEFAULT '0',
  `HeaderPhoneInternational` tinyint(3) NOT NULL,
  `HeaderEmail` tinyint(3) NOT NULL DEFAULT '0',
  `HeaderAddr` tinyint(3) NOT NULL DEFAULT '0',
  `SidePhone` tinyint(3) NOT NULL DEFAULT '0',
  `SideEmail` tinyint(3) NOT NULL DEFAULT '0',
  `SideAddr` tinyint(3) NOT NULL DEFAULT '0',
  `FooterLogo` tinyint(3) NOT NULL,
  `FooterPhone` tinyint(3) NOT NULL,
  `FooterPhoneInternational` tinyint(3) NOT NULL,
  `FooterFax` tinyint(3) NOT NULL,
  `FooterEmail` tinyint(3) NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ExtraNote` text COLLATE utf8_unicode_ci NOT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Map Locations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Locations`
--

LOCK TABLES `Locations` WRITE;
/*!40000 ALTER TABLE `Locations` DISABLE KEYS */;
INSERT INTO `Locations` VALUES (1,1,'abbey-toomevara','Abbey Toomevara','','','','353 67 26677','','','','info@abbeymachinery.com','','Clonalea','','Toomevara','Co Tipperrary','','Ireland','52.852454','-8.0566857',16,1,'','','','',1,0,0,0,0,0,0,0,0,0,0,0,0,1,'','','','');
/*!40000 ALTER TABLE `Locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginHistory`
--

DROP TABLE IF EXISTS `LoginHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginHistory` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `Action` enum('In','Out') COLLATE utf8_unicode_ci NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `IndexUserId` (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginHistory`
--

LOCK TABLES `LoginHistory` WRITE;
/*!40000 ALTER TABLE `LoginHistory` DISABLE KEYS */;
INSERT INTO `LoginHistory` VALUES (1,1,'2020-06-15 13:58:23','In','37.228.236.41'),(2,1,'2020-06-15 14:03:48','In','78.17.216.199'),(3,1,'2020-06-15 14:14:19','In','86.40.70.149'),(4,1,'2020-06-15 16:08:10','In','78.17.216.199'),(5,1,'2020-06-15 16:39:53','In','86.42.115.198'),(6,1,'2020-06-15 17:27:36','Out','86.40.70.149'),(7,1,'2020-06-15 21:54:28','In','78.17.216.199'),(8,1,'2020-06-16 08:12:47','In','78.17.216.199'),(9,1,'2020-06-16 10:11:19','Out','78.17.216.199'),(10,1,'2020-06-16 14:29:30','In','78.17.216.199'),(11,1,'2020-06-16 14:58:52','Out','78.17.216.199'),(12,1,'2020-06-17 10:59:37','In','78.17.216.199'),(13,1,'2020-06-17 12:21:22','In','78.17.216.199'),(14,1,'2020-06-17 15:02:05','Out','78.17.216.199'),(15,1,'2020-06-17 15:02:22','In','78.17.216.199'),(16,1,'2020-06-18 10:07:29','In','78.17.216.199'),(17,1,'2020-06-18 10:42:41','Out','78.17.216.199'),(18,1,'2020-06-18 12:47:48','In','86.40.70.149'),(19,1,'2020-06-18 13:15:41','Out','86.40.70.149'),(20,1,'2020-06-18 13:15:43','In','86.40.70.149'),(21,1,'2020-06-18 14:10:31','In','78.17.216.199'),(22,1,'2020-06-18 14:12:43','In','86.40.70.149'),(23,1,'2020-06-19 05:58:46','In','86.40.70.149'),(24,1,'2020-06-19 05:59:08','Out','86.40.70.149'),(25,1,'2020-06-19 05:59:16','In','86.40.70.149'),(26,1,'2020-06-19 15:54:34','In','78.17.216.199'),(27,1,'2020-06-19 16:18:13','Out','78.17.216.199'),(28,1,'2020-06-19 16:18:16','In','78.17.216.199'),(29,1,'2020-06-22 09:05:43','In','212.129.76.154'),(30,1,'2020-06-22 12:05:01','In','78.17.216.199'),(31,1,'2020-06-22 16:48:09','In','212.129.76.154'),(32,1,'2020-06-22 17:05:17','In','78.17.216.199'),(33,1,'2020-06-23 08:34:23','In','78.17.216.199'),(34,1,'2020-06-23 09:56:20','Out','78.17.216.199'),(35,1,'2020-06-23 09:56:45','In','78.17.216.199'),(36,1,'2020-06-23 09:59:57','Out','78.17.216.199'),(37,2,'2020-06-23 10:00:15','In','78.17.216.199'),(38,2,'2020-06-23 10:03:39','Out','78.17.216.199'),(39,1,'2020-06-23 10:03:57','In','78.17.216.199'),(40,1,'2020-06-23 10:09:10','Out','78.17.216.199'),(41,4,'2020-06-23 10:09:23','In','78.17.216.199'),(42,4,'2020-06-23 10:09:33','Out','78.17.216.199'),(43,3,'2020-06-23 10:09:52','In','78.17.216.199'),(44,1,'2020-06-23 10:23:30','In','212.129.72.112'),(45,3,'2020-06-23 10:23:47','Out','78.17.216.199'),(46,1,'2020-06-23 11:56:35','In','86.40.70.149'),(47,4,'2020-06-23 12:39:54','In','78.17.216.199'),(48,4,'2020-06-23 12:39:57','Out','78.17.216.199'),(49,3,'2020-06-23 12:59:53','In','89.127.62.41'),(50,4,'2020-06-23 13:06:06','In','93.107.228.12'),(51,1,'2020-06-23 14:54:34','In','212.129.72.112'),(52,1,'2020-06-24 08:24:12','In','86.40.70.149'),(53,1,'2020-06-24 08:49:10','Out','86.40.70.149'),(54,1,'2020-06-24 08:49:33','In','86.40.70.149'),(55,4,'2020-06-24 09:04:07','Out','93.107.228.12'),(56,1,'2020-06-24 09:11:22','In','78.17.220.74'),(57,1,'2020-06-24 09:22:01','In','212.129.72.188'),(58,1,'2020-06-24 09:26:25','In','86.40.70.149'),(59,1,'2020-06-24 09:33:05','In','78.17.220.74'),(60,1,'2020-06-24 09:51:36','In','78.17.220.74'),(61,3,'2020-06-24 10:19:49','In','89.127.62.41'),(62,1,'2020-06-24 10:20:12','Out','78.17.220.74'),(63,3,'2020-06-24 11:43:26','In','89.127.62.41'),(64,1,'2020-06-24 12:01:00','In','86.42.115.198'),(65,1,'2020-06-24 12:37:06','In','78.17.220.74'),(66,1,'2020-06-24 14:02:02','In','78.17.220.74'),(67,3,'2020-06-24 14:12:14','In','89.127.62.41'),(68,3,'2020-06-24 14:15:23','In','89.127.62.41'),(69,1,'2020-06-24 14:18:45','Out','86.42.115.198'),(70,1,'2020-06-24 14:18:47','In','86.42.115.198'),(71,1,'2020-06-24 14:36:45','In','80.233.41.168'),(72,1,'2020-06-24 14:36:50','In','93.107.84.132'),(73,1,'2020-06-24 14:36:55','In','37.228.236.41'),(74,1,'2020-06-24 14:37:55','In','78.17.220.74'),(75,4,'2020-06-24 16:17:17','In','93.107.228.12'),(76,1,'2020-06-24 17:33:15','Out','212.129.72.188'),(77,1,'2020-06-24 17:33:17','In','212.129.72.188'),(78,1,'2020-06-25 06:48:17','In','86.40.70.149'),(79,1,'2020-06-25 08:59:33','In','212.129.77.103'),(80,1,'2020-06-25 09:10:28','In','86.42.115.198'),(81,3,'2020-06-25 10:07:32','In','213.233.148.2'),(82,1,'2020-06-25 10:16:08','In','80.233.49.21'),(83,1,'2020-06-25 11:46:20','In','109.77.77.203'),(84,1,'2020-06-25 12:12:03','In','37.228.236.41'),(85,1,'2020-06-25 12:21:46','In','37.228.236.41'),(86,1,'2020-06-25 15:21:59','In','80.233.44.153'),(87,1,'2020-06-25 15:34:51','In','80.233.47.227'),(88,1,'2020-06-25 17:13:59','In','78.17.219.23'),(89,1,'2020-06-25 22:02:28','In','78.17.219.23'),(90,1,'2020-06-26 10:17:42','In','212.129.76.67'),(91,1,'2020-06-26 10:57:21','In','109.77.85.125'),(92,1,'2020-06-26 12:27:23','In','109.77.85.125'),(93,1,'2020-06-26 15:49:59','In','86.40.70.149'),(94,1,'2020-06-29 09:18:41','In','212.129.78.132'),(95,1,'2020-06-29 10:15:11','In','86.42.115.198'),(96,1,'2020-06-29 11:33:42','Out','86.42.115.198'),(97,1,'2020-06-29 11:33:44','In','86.42.115.198'),(98,1,'2020-06-29 12:55:23','Out','86.42.115.198'),(99,1,'2020-06-29 12:55:25','In','86.42.115.198'),(100,1,'2020-06-29 14:29:16','Out','86.42.115.198'),(101,1,'2020-06-29 14:29:19','In','86.42.115.198'),(102,1,'2020-06-29 14:46:33','In','86.40.70.149'),(103,1,'2020-06-29 15:30:08','Out','86.40.70.149'),(104,1,'2020-06-29 15:30:12','In','86.40.70.149'),(105,1,'2020-06-29 15:30:57','In','78.17.219.23'),(106,1,'2020-06-29 16:14:45','Out','86.40.70.149'),(107,1,'2020-06-29 16:14:47','In','86.40.70.149'),(108,1,'2020-06-29 17:05:50','In','212.129.78.132'),(109,1,'2020-06-29 17:13:15','In','80.233.37.185'),(110,1,'2020-06-29 17:30:56','In','86.42.115.198'),(111,1,'2020-06-30 08:57:49','In','212.129.78.12'),(112,3,'2020-06-30 15:29:12','In','89.127.62.41'),(113,1,'2020-07-01 11:24:31','In','80.233.58.166'),(114,1,'2020-07-01 15:13:05','In','212.129.76.51'),(115,1,'2020-07-01 16:07:16','In','86.40.70.149'),(116,1,'2020-07-01 16:15:09','In','86.40.70.149'),(117,3,'2020-07-02 09:47:57','In','93.107.228.12'),(118,1,'2020-07-02 11:44:47','In','212.129.76.100'),(119,1,'2020-07-02 14:24:12','In','212.129.76.100'),(120,4,'2020-07-02 16:08:12','In','93.107.228.12'),(121,4,'2020-07-02 16:25:31','In','93.107.228.12'),(122,3,'2020-07-02 17:12:37','In','93.107.228.12'),(123,4,'2020-07-03 07:52:10','In','93.107.228.12'),(124,4,'2020-07-03 11:49:39','In','93.107.228.12'),(125,1,'2020-07-06 10:28:12','In','212.129.79.211'),(126,4,'2020-07-06 14:15:29','In','93.107.228.12'),(127,1,'2020-07-06 14:20:25','In','78.17.250.241'),(128,1,'2020-07-06 14:23:25','In','212.129.79.211'),(129,4,'2020-07-06 14:52:01','Out','93.107.228.12'),(130,1,'2020-07-06 17:16:31','In','212.129.79.211'),(131,1,'2020-07-07 09:19:18','In','109.78.70.39'),(132,3,'2020-07-07 09:20:40','In','89.19.79.1'),(133,1,'2020-07-07 15:40:10','In','212.129.76.22'),(134,1,'2020-07-08 09:43:42','In','212.129.78.66'),(135,1,'2020-07-08 10:22:47','In','212.129.78.66'),(136,1,'2020-07-08 15:26:12','In','212.129.79.231'),(137,1,'2020-07-08 19:35:03','In','86.40.70.149'),(138,1,'2020-07-09 09:47:10','In','212.129.74.154'),(139,1,'2020-07-09 13:22:30','In','212.129.74.154'),(140,1,'2020-07-09 17:14:05','In','212.129.74.154'),(141,1,'2020-07-10 11:46:50','In','212.129.79.246'),(142,1,'2020-07-13 09:30:59','In','86.42.115.198'),(143,1,'2020-07-13 15:09:40','In','212.129.73.66'),(144,1,'2020-07-14 08:30:13','In','78.17.218.84'),(145,1,'2020-07-14 09:01:38','In','86.40.70.149'),(146,1,'2020-07-14 09:03:53','In','212.129.73.183'),(147,1,'2020-07-14 09:14:45','In','86.42.115.198'),(148,1,'2020-07-14 10:03:29','Out','86.40.70.149'),(149,4,'2020-07-17 14:06:43','In','93.107.228.12'),(150,4,'2020-07-20 12:33:41','In','93.107.228.12'),(151,1,'2020-07-21 11:58:32','In','109.78.73.176'),(152,1,'2020-07-21 11:58:54','In','212.129.77.198'),(153,1,'2020-07-22 11:33:14','In','212.129.77.109'),(154,1,'2020-07-22 13:02:45','In','80.233.36.45'),(155,1,'2020-08-06 15:44:45','In','64.43.168.203'),(156,6,'2020-09-04 13:20:07','In','93.89.242.195');
/*!40000 ALTER TABLE `LoginHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lotto`
--

DROP TABLE IF EXISTS `Lotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lotto` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Winner` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Date` date DEFAULT NULL,
  `Prize` decimal(10,0) NOT NULL,
  `Numbers` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lotto`
--

LOCK TABLES `Lotto` WRITE;
/*!40000 ALTER TABLE `Lotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoyaltyCartsItemsData`
--

DROP TABLE IF EXISTS `LoyaltyCartsItemsData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoyaltyCartsItemsData` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `PricePaying` decimal(10,2) NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `AccountRequired` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AllowPartialPayment` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SkipValidation` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Qty` int(10) unsigned DEFAULT '1',
  `OriginationCharges` decimal(10,2) unsigned DEFAULT '0.00',
  `RushCharges` decimal(10,2) unsigned DEFAULT '0.00',
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `PrintCosts` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`ItemId`,`ItemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoyaltyCartsItemsData`
--

LOCK TABLES `LoyaltyCartsItemsData` WRITE;
/*!40000 ALTER TABLE `LoyaltyCartsItemsData` DISABLE KEYS */;
/*!40000 ALTER TABLE `LoyaltyCartsItemsData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `M1Aux`
--

DROP TABLE IF EXISTS `M1Aux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `M1Aux` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PartCode` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Catalogue` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SubCategory` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SubSubCategory` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Brand` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT NULL,
  `ImportedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `BaseImage` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `M1Aux`
--

LOCK TABLES `M1Aux` WRITE;
/*!40000 ALTER TABLE `M1Aux` DISABLE KEYS */;
/*!40000 ALTER TABLE `M1Aux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `M1Products`
--

DROP TABLE IF EXISTS `M1Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `M1Products` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PartCode` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Catalogue` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SubCategory` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SubSubCategory` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Brand` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT NULL,
  `IsFeatured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Summary` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `Specifications` text COLLATE utf8_unicode_ci,
  `PurchaseEnabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Sloganid` int(10) DEFAULT '0',
  `ImportedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `BaseImage` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MetaKeywords` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `SearchText` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `M1Products`
--

LOCK TABLES `M1Products` WRITE;
/*!40000 ALTER TABLE `M1Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `M1Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealBooking`
--

DROP TABLE IF EXISTS `MealBooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealBooking` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Coeliac` int(11) NOT NULL,
  `Vegetarian` int(11) NOT NULL,
  `Vegan` int(11) NOT NULL,
  `DietaryRequirements` text COLLATE utf8_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Venue` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Adults` int(10) unsigned DEFAULT '1',
  `Children` int(10) unsigned DEFAULT NULL,
  `Status` enum('ordered','collected','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ordered',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealBooking`
--

LOCK TABLES `MealBooking` WRITE;
/*!40000 ALTER TABLE `MealBooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealBooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MealVenues`
--

DROP TABLE IF EXISTS `MealVenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MealVenues` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MealVenues`
--

LOCK TABLES `MealVenues` WRITE;
/*!40000 ALTER TABLE `MealVenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `MealVenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Members`
--

DROP TABLE IF EXISTS `Members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Members` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactTitle` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `ContactFirst` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ContactLast` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ContactPosition` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ContactPhone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ContactMobile` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ContactFax` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ContactEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactWeb` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ContactCompany` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tullamore',
  `AddressCounty` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `AddressCountry` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `Type` int(10) unsigned DEFAULT '1',
  `Status` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Comments` text COLLATE utf8_unicode_ci NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Industry` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  `UserId` int(10) unsigned DEFAULT NULL,
  `CompanyId` int(4) DEFAULT NULL,
  `IndustryId` tinyint(3) unsigned DEFAULT NULL,
  `ProfileViewed` int(10) unsigned DEFAULT '0',
  `SiteLinked` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Members`
--

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;
/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersContacts`
--

DROP TABLE IF EXISTS `MembersContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersContacts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `Relation` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Position` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `IsPrimary` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `FirstName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `LandLine` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `IsVolunteer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersContacts`
--

LOCK TABLES `MembersContacts` WRITE;
/*!40000 ALTER TABLE `MembersContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersDetails`
--

DROP TABLE IF EXISTS `MembersDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersDetails` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `MemberNumber` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `TeamId` char(15) COLLATE utf8_unicode_ci DEFAULT '',
  `MembershipType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `SubType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ParentId` int(10) NOT NULL DEFAULT '0',
  `IsMember` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `IsVolunteer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `FirstName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Mobile` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Landline` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IsPlayer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ClubName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `School` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Active` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Amount` decimal(10,2) DEFAULT '0.00',
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Discount` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Coupon` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersDetails`
--

LOCK TABLES `MembersDetails` WRITE;
/*!40000 ALTER TABLE `MembersDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersDetailsEntities`
--

DROP TABLE IF EXISTS `MembersDetailsEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersDetailsEntities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `EntityId` int(11) unsigned DEFAULT '0',
  `Qty` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersDetailsEntities`
--

LOCK TABLES `MembersDetailsEntities` WRITE;
/*!40000 ALTER TABLE `MembersDetailsEntities` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersDetailsEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersExtra`
--

DROP TABLE IF EXISTS `MembersExtra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersExtra` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `GDPR` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `MedicalCondition` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Treatment` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `MedicalDetails` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Federated` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `FederationNumber` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `InsurancePolicy` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Conduct` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `AntiDoping` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `AssociationMember` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `OtherAssociation` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Volunteer` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `FireArms` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `LicenceNumber` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersExtra`
--

LOCK TABLES `MembersExtra` WRITE;
/*!40000 ALTER TABLE `MembersExtra` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersExtra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersOptions`
--

DROP TABLE IF EXISTS `MembersOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersOptions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(4) NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `AccountType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Max` char(6) COLLATE utf8_unicode_ci DEFAULT '',
  `MaxMembers` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MinMembers` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MinAdults` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MinUnderage` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaxAdults` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaxUnderage` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersOptions`
--

LOCK TABLES `MembersOptions` WRITE;
/*!40000 ALTER TABLE `MembersOptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersOptionsConfig`
--

DROP TABLE IF EXISTS `MembersOptionsConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersOptionsConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntityId` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionId` int(10) unsigned NOT NULL DEFAULT '0',
  `Min` char(6) COLLATE utf8_unicode_ci DEFAULT '',
  `Max` char(6) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersOptionsConfig`
--

LOCK TABLES `MembersOptionsConfig` WRITE;
/*!40000 ALTER TABLE `MembersOptionsConfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersOptionsConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersPayments`
--

DROP TABLE IF EXISTS `MembersPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersPayments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT '0',
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `OrderId` int(10) NOT NULL DEFAULT '0',
  `Season` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Type` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `DatePaid` date DEFAULT NULL,
  `ExpiryDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersPayments`
--

LOCK TABLES `MembersPayments` WRITE;
/*!40000 ALTER TABLE `MembersPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembersSocial`
--

DROP TABLE IF EXISTS `MembersSocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembersSocial` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `Provider` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembersSocial`
--

LOCK TABLES `MembersSocial` WRITE;
/*!40000 ALTER TABLE `MembersSocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembersSocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembershipEntities`
--

DROP TABLE IF EXISTS `MembershipEntities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembershipEntities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(4) NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Type` enum('','Adult','Underage','Club','Company') COLLATE utf8_unicode_ci DEFAULT '',
  `MinAge` char(6) COLLATE utf8_unicode_ci DEFAULT '',
  `MaxAge` char(6) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembershipEntities`
--

LOCK TABLES `MembershipEntities` WRITE;
/*!40000 ALTER TABLE `MembershipEntities` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembershipEntities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembershipPayments`
--

DROP TABLE IF EXISTS `MembershipPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembershipPayments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `MembershipId` int(10) NOT NULL DEFAULT '0',
  `MembershipMode` enum('Individual','Club','Company') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Expiration` date NOT NULL,
  `PaymentDate` date NOT NULL,
  `Year` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembershipPayments`
--

LOCK TABLES `MembershipPayments` WRITE;
/*!40000 ALTER TABLE `MembershipPayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembershipPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembershipTypes`
--

DROP TABLE IF EXISTS `MembershipTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembershipTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Price` decimal(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembershipTypes`
--

LOCK TABLES `MembershipTypes` WRITE;
/*!40000 ALTER TABLE `MembershipTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembershipTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Metadata`
--

DROP TABLE IF EXISTS `Metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Metadata` (
  `Source` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Item` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Value` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CreatedAt` int(10) unsigned NOT NULL DEFAULT '0',
  `CreatedBy` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Source`,`Item`,`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Metadata`
--

LOCK TABLES `Metadata` WRITE;
/*!40000 ALTER TABLE `Metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `Metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicArtists`
--

DROP TABLE IF EXISTS `MusicArtists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicArtists` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Aliases` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(90) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicArtists`
--

LOCK TABLES `MusicArtists` WRITE;
/*!40000 ALTER TABLE `MusicArtists` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicArtists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicCollaborations`
--

DROP TABLE IF EXISTS `MusicCollaborations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicCollaborations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ItemType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ItemId` int(10) unsigned DEFAULT '0',
  `CollaboratorId` int(10) unsigned DEFAULT '0',
  `CollaborationType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicCollaborations`
--

LOCK TABLES `MusicCollaborations` WRITE;
/*!40000 ALTER TABLE `MusicCollaborations` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicCollaborations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicCollaborators`
--

DROP TABLE IF EXISTS `MusicCollaborators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicCollaborators` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Type` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Websites` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicCollaborators`
--

LOCK TABLES `MusicCollaborators` WRITE;
/*!40000 ALTER TABLE `MusicCollaborators` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicCollaborators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicCollaboratorsLinks`
--

DROP TABLE IF EXISTS `MusicCollaboratorsLinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicCollaboratorsLinks` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicCollaboratorsLinks`
--

LOCK TABLES `MusicCollaboratorsLinks` WRITE;
/*!40000 ALTER TABLE `MusicCollaboratorsLinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicCollaboratorsLinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicCollaboratorsMusicCollaboratorsTypes`
--

DROP TABLE IF EXISTS `MusicCollaboratorsMusicCollaboratorsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicCollaboratorsMusicCollaboratorsTypes` (
  `CollaboratorId` int(10) unsigned NOT NULL,
  `TypeId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`CollaboratorId`,`TypeId`),
  KEY `DiscId` (`CollaboratorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicCollaboratorsMusicCollaboratorsTypes`
--

LOCK TABLES `MusicCollaboratorsMusicCollaboratorsTypes` WRITE;
/*!40000 ALTER TABLE `MusicCollaboratorsMusicCollaboratorsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicCollaboratorsMusicCollaboratorsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicCollaboratorsTypes`
--

DROP TABLE IF EXISTS `MusicCollaboratorsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicCollaboratorsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicCollaboratorsTypes`
--

LOCK TABLES `MusicCollaboratorsTypes` WRITE;
/*!40000 ALTER TABLE `MusicCollaboratorsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicCollaboratorsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicDiscs`
--

DROP TABLE IF EXISTS `MusicDiscs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicDiscs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Artists` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Year` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Type` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Genres` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Styles` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(90) COLLATE utf8_unicode_ci DEFAULT '',
  `Labels` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Collaborators` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Categories` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Distributors` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicDiscs`
--

LOCK TABLES `MusicDiscs` WRITE;
/*!40000 ALTER TABLE `MusicDiscs` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicDiscs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicDiscsArtistsDiscs`
--

DROP TABLE IF EXISTS `MusicDiscsArtistsDiscs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicDiscsArtistsDiscs` (
  `DiscId` int(10) unsigned NOT NULL,
  `ArtistId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`DiscId`,`ArtistId`),
  KEY `DiscId` (`DiscId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicDiscsArtistsDiscs`
--

LOCK TABLES `MusicDiscsArtistsDiscs` WRITE;
/*!40000 ALTER TABLE `MusicDiscsArtistsDiscs` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicDiscsArtistsDiscs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicDiscsDiscsGenres`
--

DROP TABLE IF EXISTS `MusicDiscsDiscsGenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicDiscsDiscsGenres` (
  `DiscId` int(10) unsigned NOT NULL,
  `GenreId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`DiscId`,`GenreId`),
  KEY `DiscId` (`DiscId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicDiscsDiscsGenres`
--

LOCK TABLES `MusicDiscsDiscsGenres` WRITE;
/*!40000 ALTER TABLE `MusicDiscsDiscsGenres` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicDiscsDiscsGenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicDiscsDiscsStyles`
--

DROP TABLE IF EXISTS `MusicDiscsDiscsStyles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicDiscsDiscsStyles` (
  `DiscId` int(10) unsigned NOT NULL,
  `StyleId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`DiscId`,`StyleId`),
  KEY `DiscId` (`DiscId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicDiscsDiscsStyles`
--

LOCK TABLES `MusicDiscsDiscsStyles` WRITE;
/*!40000 ALTER TABLE `MusicDiscsDiscsStyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicDiscsDiscsStyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicGenres`
--

DROP TABLE IF EXISTS `MusicGenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicGenres` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicGenres`
--

LOCK TABLES `MusicGenres` WRITE;
/*!40000 ALTER TABLE `MusicGenres` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicGenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicLabels`
--

DROP TABLE IF EXISTS `MusicLabels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicLabels` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(90) COLLATE utf8_unicode_ci DEFAULT '',
  `Url` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicLabels`
--

LOCK TABLES `MusicLabels` WRITE;
/*!40000 ALTER TABLE `MusicLabels` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicLabels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicStyles`
--

DROP TABLE IF EXISTS `MusicStyles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicStyles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicStyles`
--

LOCK TABLES `MusicStyles` WRITE;
/*!40000 ALTER TABLE `MusicStyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicStyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicTracks`
--

DROP TABLE IF EXISTS `MusicTracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicTracks` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Artists` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DiscId` int(10) unsigned DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Lyrics` text COLLATE utf8_unicode_ci,
  `Length` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Version` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Genres` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Styles` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Collaborators` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicTracks`
--

LOCK TABLES `MusicTracks` WRITE;
/*!40000 ALTER TABLE `MusicTracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicTracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicTracksArtistsDiscs`
--

DROP TABLE IF EXISTS `MusicTracksArtistsDiscs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicTracksArtistsDiscs` (
  `TrackId` int(10) unsigned NOT NULL,
  `ArtistId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TrackId`,`ArtistId`),
  KEY `DiscId` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicTracksArtistsDiscs`
--

LOCK TABLES `MusicTracksArtistsDiscs` WRITE;
/*!40000 ALTER TABLE `MusicTracksArtistsDiscs` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicTracksArtistsDiscs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicTracksDiscsGenres`
--

DROP TABLE IF EXISTS `MusicTracksDiscsGenres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicTracksDiscsGenres` (
  `TrackId` int(10) unsigned NOT NULL,
  `GenreId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TrackId`,`GenreId`),
  KEY `TrackId` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicTracksDiscsGenres`
--

LOCK TABLES `MusicTracksDiscsGenres` WRITE;
/*!40000 ALTER TABLE `MusicTracksDiscsGenres` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicTracksDiscsGenres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MusicTracksDiscsStyles`
--

DROP TABLE IF EXISTS `MusicTracksDiscsStyles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MusicTracksDiscsStyles` (
  `TrackId` int(10) unsigned NOT NULL,
  `StyleId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TrackId`,`StyleId`),
  KEY `TrackId` (`TrackId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MusicTracksDiscsStyles`
--

LOCK TABLES `MusicTracksDiscsStyles` WRITE;
/*!40000 ALTER TABLE `MusicTracksDiscsStyles` DISABLE KEYS */;
/*!40000 ALTER TABLE `MusicTracksDiscsStyles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Published` date DEFAULT NULL,
  `Status` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  `Type` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES (1,'New Technologies from Abbey Machinery','new-technologies-from-abbey-machinery','Multi-Stage Arm & NIR Technology','<p><strong>Multi-Stage Arm</strong></p>\r\n\r\n<p>Time is money, so to speak. Getting the slurry tanker filled quickly helps to get more loads done per day and also reduces the physical task in loading slurry. Abbey Machinery have listened to their customers and have launched a new 8&rdquo; (200mm) Multi-Stage-Arm. This arm can be operated from the comfort of the tractor cab (so, there is no physical handling of the hose pipes). Its unique modular system makes it extremely versatile.&nbsp;From a filling perspective it can fill from Abbey hoppers, high or low transport tanker hoppers, open slurry pits and under-ground storage areas. It can come with the option of a turbo filler for even faster filling times. It has a reach of 2.6m and a suction depths of around 3m.</p>\r\n\r\n<p><strong>NIR Technology</strong></p>\r\n\r\n<p>Abbey Machinery&rsquo;s latest developments uses Near-Infra-Red (NIR) technology to measure live the nitrogen, potassium, phosphorus and dry matter in the slurry. This allows the farmer to apply exacting nutrients where and when they are needed, this will in turn help to better care for the environment and also significantly reduce artificial fertiliser inputs on-farm. It is precision technology at its best.</p>\r\n',NULL,2,1,'','','','',0,0),(2,'Abbey Enters the Lithuania Market','jhkjhkjh','Exciting new development','<p>Abbey are very proud to launch into the Lithuania market with Agronoja, our new partner at Ką pasėsi Show.. ,Int&rsquo;l Agricultural Exhibition from April 04-06, 2019, Kaunas, Lithuani</p>\r\n\r\n<p>&ldquo;This is a very exciting development, with so many similarities between Ireland and Lithuania in terms of farm size, need to mechanism farming tasks and desire for high quality products&rdquo; remarks Michael O&rsquo;Grady, Abbey&rsquo;s International Sales Manager</p>\r\n','2020-04-10',2,1,'','','','',0,0),(3,'David Cotter','david-cotter','David Cotter shaves off beard','',NULL,2,1,'','','','',0,0);
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsTypes`
--

DROP TABLE IF EXISTS `NewsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For sorting news';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsTypes`
--

LOCK TABLES `NewsTypes` WRITE;
/*!40000 ALTER TABLE `NewsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `NewsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsletterSubscriptions`
--

DROP TABLE IF EXISTS `NewsletterSubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsletterSubscriptions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(10) unsigned NOT NULL DEFAULT '0',
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Subscription` (`Email`,`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Users subscribed to newsletters.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsletterSubscriptions`
--

LOCK TABLES `NewsletterSubscriptions` WRITE;
/*!40000 ALTER TABLE `NewsletterSubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `NewsletterSubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsletterTypes`
--

DROP TABLE IF EXISTS `NewsletterTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsletterTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Newsletter categories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsletterTypes`
--

LOCK TABLES `NewsletterTypes` WRITE;
/*!40000 ALTER TABLE `NewsletterTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `NewsletterTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NominationCategories`
--

DROP TABLE IF EXISTS `NominationCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NominationCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Position` int(10) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NominationCategories`
--

LOCK TABLES `NominationCategories` WRITE;
/*!40000 ALTER TABLE `NominationCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `NominationCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nominations`
--

DROP TABLE IF EXISTS `Nominations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nominations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nominee` char(80) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeOrganisation` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `NomineePhone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeEmail` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeWebsite` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeAddress` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeAddress2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeAddressStreet` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeAddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `NomineeAddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Category` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Category2` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Category3` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerName` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerPhone` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerEmail` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerAddress` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerAddress2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerAddressStreet` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerAddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `ProposerAddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Reason` text COLLATE utf8_unicode_ci NOT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Award Nominations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nominations`
--

LOCK TABLES `Nominations` WRITE;
/*!40000 ALTER TABLE `Nominations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nominations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Officers`
--

DROP TABLE IF EXISTS `Officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Officers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BranchId` int(10) unsigned NOT NULL,
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `ContactName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Position` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Other` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficerPhone` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `OfficerEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Officers`
--

LOCK TABLES `Officers` WRITE;
/*!40000 ALTER TABLE `Officers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OpenProducts`
--

DROP TABLE IF EXISTS `OpenProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OpenProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Quantity` int(10) unsigned DEFAULT '1',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `VatId` int(10) unsigned NOT NULL,
  `VatRate` decimal(10,2) unsigned NOT NULL,
  `VatDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PriceIncVat` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Price` decimal(10,2) unsigned NOT NULL,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Currency` char(4) COLLATE utf8_unicode_ci DEFAULT 'EUR',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OpenProducts`
--

LOCK TABLES `OpenProducts` WRITE;
/*!40000 ALTER TABLE `OpenProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `OpenProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderCollectionTimes`
--

DROP TABLE IF EXISTS `OrderCollectionTimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderCollectionTimes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Time` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderCollectionTimes`
--

LOCK TABLES `OrderCollectionTimes` WRITE;
/*!40000 ALTER TABLE `OrderCollectionTimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderCollectionTimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderForm`
--

DROP TABLE IF EXISTS `OrderForm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderForm` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactFirst` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ContactLast` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ContactPhone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ContactMobile` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ContactFax` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ContactEmail` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ContactWeb` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCountry` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Business` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Type` int(3) unsigned NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Information` text COLLATE utf8_unicode_ci NOT NULL,
  `StatusId` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderForm`
--

LOCK TABLES `OrderForm` WRITE;
/*!40000 ALTER TABLE `OrderForm` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderForm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomId` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserId` int(10) unsigned NOT NULL,
  `OrderReference` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `OrderNumber` int(11) NOT NULL,
  `IpAddress` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `Message` text COLLATE utf8_unicode_ci,
  `SystemMessage` text COLLATE utf8_unicode_ci,
  `ShippingFirstName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingLastName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingAddress` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingStreet` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingTown` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingCode` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingState` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingCountry` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShippingPhone` char(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingFirstName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingLastName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingAddress` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingStreet` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingTown` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingCode` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingState` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BillingCountry` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyName` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VatReg` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyReg` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CardFee` decimal(10,2) DEFAULT NULL,
  `CurrencyName` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CurrencyRate` decimal(5,5) unsigned DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Shipping` decimal(10,2) DEFAULT NULL,
  `ShippingName` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CollectionTime` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CollectionDate` date DEFAULT NULL,
  `Dispatcher` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DispatcherRef` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Total` decimal(10,2) DEFAULT NULL,
  `Mode` enum('live','test','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `LoyaltyCard` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiscountToken` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Discount` decimal(10,2) unsigned DEFAULT NULL,
  `StatusId` int(10) unsigned NOT NULL DEFAULT '1',
  `CustomerStatusId` int(10) unsigned NOT NULL DEFAULT '1',
  `NoVariantText` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `PaymentMethod` enum('order','realex','rms','paypal','sage','stripe','free') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentType` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Success` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DatePaid` date DEFAULT NULL,
  `Newsletters` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `LayoutType` enum('unknown','standard','responsive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `PurchaseOrderNumber` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `ReceiptEmail` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Points` int(10) NOT NULL DEFAULT '0',
  `Currency` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EUR',
  `Coupon` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Commission` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`),
  KEY `IndexUserId` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,NULL,3,'P1',0,NULL,NULL,'# Order created in-house.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jhicks@abbeymachinery.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,'unknown',NULL,NULL,NULL,1,1,'','order',NULL,0,NULL,'','unknown','','',0,'EUR','',0.00);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersExternal`
--

DROP TABLE IF EXISTS `OrdersExternal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdersExternal` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomId` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserId` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  `ShippingFirstName` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingLastName` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingAddress` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingStreet` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingTown` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingCode` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingState` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingCountry` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingPhone` char(70) COLLATE utf8_unicode_ci NOT NULL,
  `BillingFirstName` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingLastName` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingAddress` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingStreet` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingTown` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingCode` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingState` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `BillingCountry` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `CompanyName` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `VatReg` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `CompanyReg` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `CardFee` decimal(10,2) NOT NULL,
  `Shipping` int(10) NOT NULL,
  `ShippingName` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `CollectionTime` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `CollectionDate` date NOT NULL,
  `DiscountToken` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Discount` decimal(10,2) unsigned NOT NULL,
  `Total` decimal(10,2) NOT NULL,
  `LoyaltyCard` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentType` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PurchaseOrderNumber` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Points` int(11) NOT NULL,
  `Currency` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EUR',
  `Coupon` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LayoutType` enum('unknown','standard','responsive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`Id`),
  KEY `IndexUserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temp store for orders processed through external checkout.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersExternal`
--

LOCK TABLES `OrdersExternal` WRITE;
/*!40000 ALTER TABLE `OrdersExternal` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersExternal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersItems`
--

DROP TABLE IF EXISTS `OrdersItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdersItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL,
  `ProductId` int(10) unsigned NOT NULL,
  `ProductVersion` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VersionName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Qty` int(10) unsigned DEFAULT NULL,
  `VariantTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `VariantOf` int(10) NOT NULL,
  `Price` decimal(10,2) unsigned DEFAULT NULL,
  `Tax` decimal(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexOrder` (`OrderId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersItems`
--

LOCK TABLES `OrdersItems` WRITE;
/*!40000 ALTER TABLE `OrdersItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersItemsData`
--

DROP TABLE IF EXISTS `OrdersItemsData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdersItemsData` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `Qty` int(10) NOT NULL DEFAULT '1',
  `Price` decimal(10,2) NOT NULL,
  `Discount` decimal(10,2) DEFAULT '0.00',
  `OriginationCharges` decimal(10,2) NOT NULL,
  `RushCharges` decimal(10,2) NOT NULL,
  `Tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `PrintCosts` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersItemsData`
--

LOCK TABLES `OrdersItemsData` WRITE;
/*!40000 ALTER TABLE `OrdersItemsData` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersItemsData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersItemsExternal`
--

DROP TABLE IF EXISTS `OrdersItemsExternal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdersItemsExternal` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `ProductVersion` int(10) unsigned NOT NULL,
  `VariantOf` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VariantTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Version` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Qty` int(10) unsigned DEFAULT NULL,
  `Price` decimal(10,2) unsigned DEFAULT NULL,
  `PriceExVat` decimal(10,2) unsigned DEFAULT NULL,
  `PriceIncVat` decimal(10,2) unsigned DEFAULT NULL,
  `Tax` decimal(10,2) unsigned DEFAULT NULL,
  `SpecialOfferPrice` decimal(10,2) unsigned DEFAULT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `SpecialOfferActive` tinyint(1) unsigned DEFAULT NULL,
  `VAT` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexOrder` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersItemsExternal`
--

LOCK TABLES `OrdersItemsExternal` WRITE;
/*!40000 ALTER TABLE `OrdersItemsExternal` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersItemsExternal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersItemsExternalData`
--

DROP TABLE IF EXISTS `OrdersItemsExternalData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdersItemsExternalData` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `Qty` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `OriginationCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `RushCharges` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `MemberId` int(10) NOT NULL DEFAULT '0',
  `PrintCosts` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`ItemId`,`ItemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersItemsExternalData`
--

LOCK TABLES `OrdersItemsExternalData` WRITE;
/*!40000 ALTER TABLE `OrdersItemsExternalData` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersItemsExternalData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersStatus`
--

DROP TABLE IF EXISTS `OrdersStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrdersStatus` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `Highlight` tinyint(3) NOT NULL DEFAULT '0',
  `OrderValid` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersStatus`
--

LOCK TABLES `OrdersStatus` WRITE;
/*!40000 ALTER TABLE `OrdersStatus` DISABLE KEYS */;
INSERT INTO `OrdersStatus` VALUES (1,'Ordered',0,'Y'),(2,'Boxed',0,'Y'),(3,'Dispatched',0,'Y'),(4,'Delivered',0,'Y');
/*!40000 ALTER TABLE `OrdersStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OriginationCharges`
--

DROP TABLE IF EXISTS `OriginationCharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OriginationCharges` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductCode` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Charge` decimal(10,2) unsigned DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OriginationCharges`
--

LOCK TABLES `OriginationCharges` WRITE;
/*!40000 ALTER TABLE `OriginationCharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `OriginationCharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orthodontics`
--

DROP TABLE IF EXISTS `Orthodontics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orthodontics` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ContactAge` int(3) NOT NULL DEFAULT '0',
  `ContactPhone` char(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `ContactEmail` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TreatmentType` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orthodontics`
--

LOCK TABLES `Orthodontics` WRITE;
/*!40000 ALTER TABLE `Orthodontics` DISABLE KEYS */;
/*!40000 ALTER TABLE `Orthodontics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Outlets`
--

DROP TABLE IF EXISTS `Outlets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Outlets` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Manager` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Web` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Town` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `MapsLat` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapsZoom` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `MapsStreetView` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MapsInfo` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MapsType` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Loc8Url` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Outlets`
--

LOCK TABLES `Outlets` WRITE;
/*!40000 ALTER TABLE `Outlets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Outlets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageIcons`
--

DROP TABLE IF EXISTS `PageIcons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageIcons` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PageId` int(10) unsigned NOT NULL,
  `Position` int(10) NOT NULL DEFAULT '0',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Set of links to selected pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PageIcons`
--

LOCK TABLES `PageIcons` WRITE;
/*!40000 ALTER TABLE `PageIcons` DISABLE KEYS */;
/*!40000 ALTER TABLE `PageIcons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageRequestContacts`
--

DROP TABLE IF EXISTS `PageRequestContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageRequestContacts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Pages` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PageRequestContacts`
--

LOCK TABLES `PageRequestContacts` WRITE;
/*!40000 ALTER TABLE `PageRequestContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `PageRequestContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PageRequests`
--

DROP TABLE IF EXISTS `PageRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PageRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PageId` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ContactId` int(11) NOT NULL,
  `ContactEmail` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contact requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PageRequests`
--

LOCK TABLES `PageRequests` WRITE;
/*!40000 ALTER TABLE `PageRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `PageRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pages`
--

DROP TABLE IF EXISTS `Pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pages` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Area` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Parent` int(10) unsigned DEFAULT NULL,
  `Position` int(10) unsigned DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Path` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Preview` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `Content2` text COLLATE utf8_unicode_ci,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `SearchText` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Flags` int(10) unsigned DEFAULT '128',
  `Menu` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Visibility` tinyint(3) DEFAULT '1',
  `Comments` tinyint(3) unsigned DEFAULT NULL,
  `PathOption` tinyint(3) unsigned DEFAULT '1',
  `GroupOption` tinyint(3) unsigned DEFAULT '7',
  `AcceptProducts` tinyint(3) unsigned DEFAULT '0',
  `AcceptProjects` int(11) NOT NULL DEFAULT '0',
  `DisplayOptions` tinyint(3) unsigned DEFAULT NULL,
  `GroupOption2` int(7) unsigned DEFAULT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  `Abstract` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Special` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `ChildrenView` tinyint(1) NOT NULL,
  `ChildrenClickthrough` tinyint(1) NOT NULL DEFAULT '1',
  `ChildrenPreview` tinyint(1) NOT NULL DEFAULT '0',
  `ChildrenSummary` tinyint(1) NOT NULL DEFAULT '0',
  `ChildrenContent` tinyint(1) NOT NULL DEFAULT '0',
  `ProductsPosition` enum('Normal','Float') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Normal',
  `RequestForm` tinyint(1) NOT NULL DEFAULT '0',
  `NewTab` tinyint(1) NOT NULL DEFAULT '0',
  `HasCustomForm` tinyint(1) NOT NULL DEFAULT '0',
  `FormSource` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FormAction` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `IndexName` (`Name`),
  KEY `IndexPath` (`Path`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pages`
--

LOCK TABLES `Pages` WRITE;
/*!40000 ALTER TABLE `Pages` DISABLE KEYS */;
INSERT INTO `Pages` VALUES (1,1,0,1,'welcome','welcome','Abbey Machinery','','','<p style=\"text-align: center;\"><strong>Abbey Machinery is one of Ireland&rsquo;s largest and most respected manufacturers of agricultural equipment.</strong></p>\r\n\r\n<p style=\"text-align: center;\">Abbey Machinery was established by the Cavanagh family in 1947, a family which has a tradition in agricultural engineering dating back to the 19th Century.</p>\r\n','<p style=\"text-align: center;\">Lower Content</p>\r\n','','','','',0,'Home',1,1,0,0,NULL,0,0,NULL,7,'',0,'','2020-07-21 11:15:37','',0,1,0,1,0,'Normal',0,0,0,'',''),(4,4,0,1,'events','events','Events','',NULL,'','','','','',NULL,128,'',1,1,0,0,NULL,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','events.php',0,1,0,0,0,'Normal',0,0,0,'',''),(5,4,0,3,'locations','locations','Location','',NULL,'','','','','',NULL,128,'',0,1,0,0,NULL,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:38','location.php',0,1,0,0,0,'Normal',0,0,0,'',''),(6,2,0,3,'contact','contact','Contact Us','',NULL,'','','','','',NULL,128,'',0,1,0,0,NULL,0,0,NULL,NULL,'',0,'','2020-06-18 14:50:03','requests.php',0,1,0,0,0,'Normal',0,0,0,'',''),(7,2,0,1,'news','news','News','',NULL,'','','','','',NULL,128,'',1,1,0,0,NULL,0,0,NULL,NULL,'',0,'','2020-06-29 16:15:15','news.php',0,1,0,0,0,'Normal',0,0,0,'',''),(8,4,0,14,'products','products','Products','',NULL,'','',NULL,NULL,NULL,NULL,128,'',1,1,0,0,6,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','products.php',0,1,0,0,0,'Normal',0,0,0,'',''),(13,4,0,4,'clients','clients','Clients Portfolio','',NULL,'','','','','',NULL,128,'',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:26','clients.php',0,1,0,0,0,'Normal',0,0,0,'',''),(14,4,0,11,'forum','forum','Forum','',NULL,'','',NULL,NULL,NULL,NULL,128,'',1,1,NULL,0,6,0,0,0,NULL,'',0,'','2020-06-15 15:27:45','forumcats.php',0,1,0,0,0,'Normal',0,0,0,'',''),(15,4,0,10,'industries','industries','Industries','',NULL,'','',NULL,NULL,NULL,NULL,128,'',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','industry.php',0,1,0,0,0,'Normal',0,0,0,'',''),(16,4,0,5,'publications','publications','Publications','',NULL,'','','','','',NULL,128,'',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-18 14:23:56','publications.php',0,1,0,0,0,'Normal',0,0,0,'',''),(17,2,0,2,'documents','documents','Downloads','',NULL,'','','','','',NULL,128,'',0,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-18 13:26:58','documents.php',0,1,0,0,0,'Normal',0,0,0,'',''),(18,4,0,12,'partners','partners','Partners','',NULL,'','',NULL,NULL,NULL,NULL,128,'',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','partners.php',0,1,0,0,0,'Normal',0,0,0,'',''),(19,4,0,9,'stores','stores','Stores','',NULL,'','',NULL,NULL,NULL,NULL,128,'',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','stores.php',0,1,0,0,0,'Normal',0,0,0,'',''),(20,2,0,4,'links','links','Links','',NULL,'','','','','',NULL,128,'',0,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:26','links.php',0,1,0,0,0,'Normal',0,0,0,'',''),(32,4,0,13,'brands','brands','Brands','',NULL,'','','','','',NULL,128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','brands.php',0,1,0,0,0,'Normal',0,0,0,'',''),(35,2,0,5,'testimonials','testimonials','Testimonials','','','','','','','','',128,'',1,1,NULL,1,4,0,0,NULL,NULL,'',0,'','2020-06-18 14:23:56','testimonials.php',0,1,0,0,0,'Normal',0,0,0,'',''),(59,4,0,6,'projectsportfolio','projectsportfolio','Projects','',NULL,'','','','','',NULL,128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-18 14:23:31','projectsportfolio.php',0,1,0,0,0,'Normal',0,0,0,'',''),(60,4,0,7,'businessdirectory','businessdirectorty','Business Directory',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,128,NULL,1,1,NULL,1,7,0,0,NULL,NULL,NULL,0,NULL,'2020-06-23 12:01:34','businessdirectory.php',0,1,0,0,0,'Normal',0,0,0,'',''),(190,2,0,9,'contactmap','contactmap','Contact Map','',NULL,'','','','','',NULL,128,'Contact Us',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:11','requests.php',0,1,0,0,0,'Normal',0,0,0,'',''),(196,4,0,8,'contactlist','contactlist','Contact List',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,128,NULL,1,1,NULL,0,7,0,0,NULL,NULL,NULL,0,NULL,'2020-06-23 07:40:26','contactlist.php',0,1,0,0,0,'Normal',0,0,0,'',''),(197,4,0,2,'faqs','faqs','Sunshine','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget mi quis libero tincidunt pulvinar. Aliquam auctor dictum consectetur. Nulla non facilisis erat. Donec facilisis, justo sed tincidunt tincidunt, tortor sapien rhoncus erat, ac hendrerit ',NULL,'<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget mi quis libero tincidunt pulvinar. Aliquam auctor dictum consectetur. Nulla non facilisis erat. Donec facilisis, justo sed tincidunt tincidunt, tortor sapien rhoncus erat, ac hendrerit justo nibh ut neque. Donec non luctus sapien, pretium adipiscing neque. Nulla in viverra ligula. Praesent ut scelerisque nisl. Pellentesque eu eros id quam bibendum consectetur. Ut sit amet tincidunt diam.</p>\r\n<p>\r\n	Nam pretium mollis tortor. Praesent ut semper nisi, eu accumsan orci. Sed eget lobortis nunc, sit amet auctor tellus. Proin volutpat urna a tellus faucibus, et vehicula nulla fringilla. Praesent bibendum purus id blandit pretium. Maecenas id lacus eget est aliquet dictum vel ut urna. Mauris id est nec leo fringilla pretium non non nisl. Nullam non aliquam justo, non sodales eros. Nullam vitae erat at velit rhoncus consectetur nec sit amet felis. Ut id faucibus diam, vel gravida odio. Integer a felis vulputate, malesuada velit sit amet, auctor est. Proin imperdiet elementum ante, dignissim auctor dolor bibendum sit amet.</p>\r\n<p>\r\n	In tristique velit enim, non pulvinar turpis euismod sed. Nulla semper eget ligula non tincidunt. Etiam dignissim erat nibh, eu pretium massa bibendum at. Sed pulvinar eget arcu non faucibus. Aliquam erat volutpat. Curabitur convallis nulla ac sollicitudin molestie. Praesent pulvinar sem metus, sit amet luctus ante tincidunt at. Ut ac venenatis leo. Sed in sem facilisis, scelerisque dui id, rutrum felis. Cras semper aliquet lobortis. Aliquam porta rhoncus orci sed mattis. Aliquam egestas diam vel volutpat convallis. Donec scelerisque tincidunt facilisis. Cras non magna eget diam egestas rhoncus iaculis ut est.</p>\r\n','<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget mi quis libero tincidunt pulvinar. Aliquam auctor dictum consectetur. Nulla non facilisis erat. Donec facilisis, justo sed tincidunt tincidunt, tortor sapien rhoncus erat, ac hendrerit justo nibh ut neque. Donec non luctus sapien, pretium adipiscing neque. Nulla in viverra ligula. Praesent ut scelerisque nisl. Pellentesque eu eros id quam bibendum consectetur. Ut sit amet tincidunt diam.</p>\r\n<p>\r\n	Nam pretium mollis tortor. Praesent ut semper nisi, eu accumsan orci. Sed eget lobortis nunc, sit amet auctor tellus. Proin volutpat urna a tellus faucibus, et vehicula nulla fringilla. Praesent bibendum purus id blandit pretium. Maecenas id lacus eget est aliquet dictum vel ut urna. Mauris id est nec leo fringilla pretium non non nisl. Nullam non aliquam justo, non sodales eros. Nullam vitae erat at velit rhoncus consectetur nec sit amet felis. Ut id faucibus diam, vel gravida odio. Integer a felis vulputate, malesuada velit sit amet, auctor est. Proin imperdiet elementum ante, dignissim auctor dolor bibendum sit amet.</p>\r\n<p>\r\n	In tristique velit enim, non pulvinar turpis euismod sed. Nulla semper eget ligula non tincidunt. Etiam dignissim erat nibh, eu pretium massa bibendum at. Sed pulvinar eget arcu non faucibus. Aliquam erat volutpat. Curabitur convallis nulla ac sollicitudin molestie. Praesent pulvinar sem metus, sit amet luctus ante tincidunt at. Ut ac venenatis leo. Sed in sem facilisis, scelerisque dui id, rutrum felis. Cras semper aliquet lobortis. Aliquam porta rhoncus orci sed mattis. Aliquam egestas diam vel volutpat convallis. Donec scelerisque tincidunt facilisis. Cras non magna eget diam egestas rhoncus iaculis ut est.</p>\r\n','','','',NULL,128,'',1,1,NULL,0,6,0,0,NULL,NULL,'',0,'','2020-06-15 15:27:45','faqs.php',0,1,0,0,0,'Normal',0,0,0,'',''),(245,4,0,15,'nomination','nomination','Award Nominations',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,128,NULL,0,1,NULL,1,7,0,0,NULL,NULL,NULL,0,NULL,'2020-06-15 15:27:45','nominations.php',0,1,0,0,0,'Normal',0,0,0,'',''),(246,1,0,6,'sales-services','sales-services','Sales & Services','','','','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(248,1,0,7,'q-parts','q-parts','Q Parts','','<p><strong>Fusce lacinia condimentum facilisis. Curabitur porta scelerisque dolor, et sollicitudin elit ornare vitae. Cras nec tincidunt neque. Praesent vehicula enim metus. In hac habitasse platea dictumst.</strong></p>\r\n\r\n<p>Curabitur quis auctor orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris enim risus, tincidunt a lectus non, sagittis congue mauris.</p>\r\n','','','','','','',128,'',0,1,NULL,1,6,0,0,1,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(249,2,0,10,'about-us','about-us','About Us','','','<p><strong>Production</strong></p>\r\n\r\n<p>Our new 100,000 sq. ft. purpose built manufacturing facility set on a 30 acre site based in Toomevara, Co. Tipperary, Ireland enables testing facilities for our product allowing us to vigorously field test.</p>\r\n\r\n<p>In addition we have a dedicated Research &amp; Development facility of 30,000sq ft, together with a diligent Engineering Department with over 125 years engineering experience within the team combined with state of art CAD systems</p>\r\n\r\n<p><strong>Manufacturing</strong></p>\r\n\r\n<p>With production lines running all year round from the new location, Abbey Machinery has increased the processes and capabilities available on the new site. The new factory, built on an expansive thirty acre plot, is home to an array of new technologies including improved laser cutting, shot blasting, and 2 pack painting with forced drying finishing process</p>\r\n\r\n<p><strong>Research &amp; Development</strong></p>\r\n\r\n<p>The new facility is complemented by an extensive investment in the research and development department, which has seen its resources increase substantially, and also with company owned land that allows for the testing of all product functionality in a real agricultural environment.</p>\r\n','','','','','',128,'',0,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-23 07:36:49','',0,1,0,0,0,'Normal',0,0,0,'',''),(250,1,0,2,'machines','machines','Farm Machinery','','','','','','','','',128,'',0,1,NULL,1,7,0,0,0,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(251,1,0,3,'slurry-muck-handling','slurry-muck-handling','Slurry & Muck Handling','','<p><strong>Experts in Slurry Management systems -&nbsp;Trusted for Generations. </strong><br />\r\n<br />\r\nSlurry Tankers, Side Discharge Spreaders, Slurry Mixers, Umbilical Cord Systems and All Purpose (AP) Spreaders.</p>\r\n','<p><strong>The Abbey Machinery Slurry range caters for the &#39;Total Cow&#39; by handling the waste products in economic and environmentally friendly way.&nbsp;It consists of the most extensive range of tanker models and sizes available for today&#39;s farm and contracting customer.</strong></p>\r\n\r\n<p>Each tanker comprises of key specifications that make the Abbey Machinery Tanker the best suited tanker to meet the demanding customer needs.</p>\r\n','','','','','',128,'',1,1,NULL,1,6,1,0,1,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(252,1,0,4,'diet-feeders','diet-feeders','Diet Feeders','','<p><strong>Curabitur quis auctor orci. Pellentesque habitant morbi tristique.</strong></p>\r\n\r\n<p>Mauris enim risus, tincidunt a lectus non, sagittis congue mauris.</p>\r\n','','','','','','',128,'',1,1,NULL,1,6,1,0,1,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(253,1,0,5,'grassland-management','grassland-management','Grassland Management','','<p><strong>Maecenas nec metus vel sem tempor tincidunt vel sed nulla. Fusce id libero a nisi tincidunt lobortis a quis lectus.</strong></p>\r\n\r\n<p>Donec faucibus lobortis tortor, sit amet hendrerit nisl ullamcorper nec.</p>\r\n','','','','','','',128,'',1,1,NULL,1,6,1,0,1,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(254,1,0,9,'industrial-applications','industrial-applications','Industrial Applications','','','','','','','','',128,'',1,1,NULL,1,6,0,0,1,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(255,2,0,6,'about-abbey-machinery','about-abbey-machinery','About Us','','','<p>Production</p>\r\n\r\n<p>Our new 100,000 sq. ft. purpose built manufacturing facility set on a 30 acre site based in Toomevara, Co. Tipperary, Ireland enables testing facilities for our product allowing us to vigorously field test.</p>\r\n\r\n<p>In addition we have a dedicated Research &amp; Development facility of 30,000sq ft, together with a diligent Engineering Department with over 125 years engineering experience within the team combined with state of art CAD systems</p>\r\n\r\n<p>Manufacturing</p>\r\n\r\n<p>With production lines running all year round from the new location, Abbey Machinery has increased the processes and capabilities available on the new site. The new factory, built on an expansive thirty acre plot, is home to an array of new technologies including improved laser cutting, shot blasting, and 2 pack painting with forced drying finishing process</p>\r\n\r\n<p>Research &amp; Development</p>\r\n\r\n<p>The new facility is complemented by an extensive investment in the research and development department, which has seen its resources increase substantially, and also with company owned land that allows for the testing of all product functionality in a real agricultural environment.</p>\r\n','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-18 14:23:31','',0,1,0,0,0,'Normal',0,0,0,'',''),(256,1,246,1,'sales-team','sales-services/sales-team','Sales Team','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-17 10:05:18','',0,1,0,0,0,'Normal',0,0,0,'',''),(257,1,246,2,'dealer-network','sales-services/dealer-network','Dealer Network','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-17 10:05:36','',0,1,0,0,0,'Normal',0,0,0,'',''),(258,1,246,3,'quality','sales-services/quality','Quality','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-17 10:05:52','',0,1,0,0,0,'Normal',0,0,0,'',''),(259,1,246,4,'warranty-registration','sales-services/warranty-registration','Warranty Registration','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-17 10:06:09','',0,1,0,0,0,'Normal',0,0,0,'',''),(260,1,246,5,'finance-grant-information','sales-services/finance-grant-information','Finance & Grant Information','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-17 10:06:28','',0,1,0,0,0,'Normal',0,0,0,'',''),(261,2,255,1,'history','about-abbey-machinery/history','History','','<p>hghjbjhbjhvhv</p>\r\n','','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:06','',0,1,0,0,0,'Normal',0,0,0,'',''),(263,2,255,2,'innovation','about-abbey-machinery/innovation','Innovation','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:06','',0,1,0,0,0,'Normal',0,0,0,'',''),(265,2,255,3,'technical','about-abbey-machinery/technical','Technical','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:06','',0,1,0,0,0,'Normal',0,0,0,'',''),(266,2,255,4,'production','about-abbey-machinery/production','Production','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:06','',0,1,0,0,0,'Normal',0,0,0,'',''),(267,2,255,5,'merchandise','about-abbey-machinery/merchandise','Merchandise','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:06','',0,1,0,0,0,'Normal',0,0,0,'',''),(268,2,0,7,'downloads','downloads','Downloads','','','','','','','','',128,'',0,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-24 11:34:02','',0,1,0,0,0,'Normal',0,0,0,'',''),(269,2,268,1,'brochures','downloads/brochures','Brochures','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:11','',0,1,0,0,0,'Normal',0,0,0,'',''),(270,2,268,2,'videos','downloads/videos','Videos','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:11','',0,1,0,0,0,'Normal',0,0,0,'',''),(271,2,268,3,'images','downloads/images','Images','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:11','',0,1,0,0,0,'Normal',0,0,0,'',''),(272,2,268,4,'training','downloads/training','Training','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-06-18 13:51:11','',0,1,0,0,0,'Normal',0,0,0,'',''),(273,2,0,8,'careers','careers','Careers','','','<p>Abbey Machinery knows that one of its greatest assets is their staff and are currently looking for top quality workers to join their team.&nbsp;</p>\r\n\r\n<p>If you are interested in working for one of Ireland&rsquo;s largest and most respected manufacturers of agricultural equipment,&nbsp;please send your CV and cover letter to&nbsp;hr@abbeymachinery.com</p>\r\n','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-23 07:40:26','',0,1,0,0,0,'Normal',0,0,0,'',''),(274,1,0,8,'dealers','dealers','Dealers','','','','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(275,1,251,1,'slurry-tankers','slurry-muck-handling/slurry-tankers','Slurry Tankers','','','','','','','','',128,'',1,1,NULL,1,6,1,0,NULL,NULL,'',0,'','2020-06-18 14:18:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(276,1,251,2,'slurry-pumps','slurry-muck-handling/slurry-pumps','Slurry Pumps','','','','','','','','',128,'',1,1,NULL,1,6,1,0,NULL,NULL,'',0,'','2020-06-18 14:18:39','',0,1,0,0,0,'Normal',0,0,0,'',''),(277,1,251,3,'low-emission-slurry-applicators','slurry-muck-handling/low-emission-slurry-applicators','Low Emission Slurry Applicators','','','','','','','','',128,'',1,1,NULL,1,6,1,0,NULL,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(278,1,252,1,'paddle-feeder','diet-feeders/paddle-feeder','Paddle Feeder','','','','','','','','',128,'',1,1,NULL,1,7,1,0,NULL,NULL,'',0,'','2020-06-18 14:00:23','',0,1,0,0,0,'Normal',0,0,0,'',''),(279,1,252,2,'static-feeder','diet-feeders/static-feeder','Static Feeder','','','','','','','','',128,'',1,1,NULL,1,6,1,0,NULL,NULL,'',0,'','2020-06-22 10:54:24','',0,1,0,0,0,'Normal',0,0,0,'',''),(280,1,252,3,'vertical-feeder','diet-feeders/vertical-feeder','Vertical Feeder','','','','','','','','',128,'',1,1,NULL,1,7,1,0,NULL,NULL,'',0,'','2020-06-18 14:00:25','',0,1,0,0,0,'Normal',0,0,0,'',''),(281,1,253,1,'grassland-toppers','grassland-management/grassland-toppers','Grassland Toppers','','','','','','','','',128,'',1,1,NULL,1,6,1,0,NULL,NULL,'',0,'','2020-06-18 14:24:32','',0,1,0,0,0,'Normal',0,0,0,'',''),(282,1,253,2,'fertiliser-applicators','grassland-management/fertiliser-applicators','Fertiliser Applicators','','','','','','','','',128,'',1,1,NULL,1,6,1,0,NULL,NULL,'',0,'','2020-06-18 14:24:36','',0,1,0,0,0,'Normal',0,0,0,'',''),(283,1,251,4,'ap-side-spreader','slurry-muck-handling/ap-side-spreader','AP Side Spreader','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(284,1,251,5,'flail-side-spreaders','slurry-muck-handling/flail-side-spreaders','Flail Side Spreaders','','','','','','','','',128,'',1,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'',''),(285,3,0,1,'terms-conditions','terms-conditions','Terms & Conditions','','','','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-22 10:41:54','',0,1,0,0,0,'Normal',0,0,0,'',''),(286,3,0,2,'privacy-policy','privacy-policy','Privacy Policy','','','','','','','','',128,'',1,1,NULL,1,6,0,0,NULL,NULL,'',0,'','2020-06-22 10:42:11','',0,1,0,0,0,'Normal',0,0,0,'',''),(287,2,251,1,'toys','slurry-muck-handling/toys','Toys','','','<p>Toys details in here....</p>\r\n\r\n<p>Slurry and Muck Handling</p>\r\n\r\n<p>Abbey Machinery&rsquo;s Slurry and Muck Handling Equipment catering for the back end of the cow. These include Slurry Tankers, Side Discharge Spreaders, Slurry Mixers, Umbilical Cord Systems and All Purpose (AP) Spreaders. We are the Experts in Slurry Management systems and are Trusted by Generations. Our technology ensures maximum nutrient use of the manure to maximise crop potential, while catering for environment and legislative concerns.</p>\r\n\r\n<p>&nbsp;</p>\r\n','','','','','',128,'',0,1,NULL,1,7,0,0,NULL,NULL,'',0,'','2020-07-21 11:15:37','',0,1,0,0,0,'Normal',0,0,0,'','');
/*!40000 ALTER TABLE `Pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PagesFeaturedBrands`
--

DROP TABLE IF EXISTS `PagesFeaturedBrands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PagesFeaturedBrands` (
  `PageId` int(10) unsigned NOT NULL,
  `BrandId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`PageId`,`BrandId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PagesFeaturedBrands`
--

LOCK TABLES `PagesFeaturedBrands` WRITE;
/*!40000 ALTER TABLE `PagesFeaturedBrands` DISABLE KEYS */;
/*!40000 ALTER TABLE `PagesFeaturedBrands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Partners`
--

DROP TABLE IF EXISTS `Partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Partners` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `Web` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Redirect` tinyint(3) NOT NULL DEFAULT '0',
  `Display` tinyint(3) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Module Partners';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Partners`
--

LOCK TABLES `Partners` WRITE;
/*!40000 ALTER TABLE `Partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `Partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parts`
--

DROP TABLE IF EXISTS `Parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parts` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Position` int(10) NOT NULL,
  `BrandId` int(10) NOT NULL DEFAULT '0',
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Description` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parts`
--

LOCK TABLES `Parts` WRITE;
/*!40000 ALTER TABLE `Parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayPalPaymentRecord`
--

DROP TABLE IF EXISTS `PayPalPaymentRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayPalPaymentRecord` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrderId` int(10) unsigned NOT NULL,
  `TransactionId` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `TransactionVerified` enum('verified','unverified') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentStatus` enum('Canceled_Reversal','Completed','Created','Denied','Expired','Failed','Pending','Refunded','Reversed','Processed','Voided') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PendingReason` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RawData` text COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayPalPaymentRecord`
--

LOCK TABLES `PayPalPaymentRecord` WRITE;
/*!40000 ALTER TABLE `PayPalPaymentRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `PayPalPaymentRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonMembers`
--

DROP TABLE IF EXISTS `PersonMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PersonMembers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(200) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Club` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Lotto` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonMembers`
--

LOCK TABLES `PersonMembers` WRITE;
/*!40000 ALTER TABLE `PersonMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `PersonMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Podcasts`
--

DROP TABLE IF EXISTS `Podcasts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Podcasts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Published` datetime NOT NULL,
  `TypeId` int(11) NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(1) NOT NULL DEFAULT '0',
  `Display` tinyint(1) NOT NULL DEFAULT '1',
  `Status` tinyint(1) NOT NULL DEFAULT '2',
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual podcast episodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Podcasts`
--

LOCK TABLES `Podcasts` WRITE;
/*!40000 ALTER TABLE `Podcasts` DISABLE KEYS */;
/*!40000 ALTER TABLE `Podcasts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PodcastsTypes`
--

DROP TABLE IF EXISTS `PodcastsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PodcastsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='This is an entry for each podcast.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PodcastsTypes`
--

LOCK TABLES `PodcastsTypes` WRITE;
/*!40000 ALTER TABLE `PodcastsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PodcastsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PointsTransactions`
--

DROP TABLE IF EXISTS `PointsTransactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PointsTransactions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `Date` date DEFAULT NULL,
  `OrderId` int(10) unsigned NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Points` int(10) NOT NULL,
  `PointsLeft` int(10) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PointsTransactions`
--

LOCK TABLES `PointsTransactions` WRITE;
/*!40000 ALTER TABLE `PointsTransactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `PointsTransactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioOriginationCodes`
--

DROP TABLE IF EXISTS `PortfolioOriginationCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioOriginationCodes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioOriginationCodes`
--

LOCK TABLES `PortfolioOriginationCodes` WRITE;
/*!40000 ALTER TABLE `PortfolioOriginationCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioOriginationCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioPaperSizes`
--

DROP TABLE IF EXISTS `PortfolioPaperSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioPaperSizes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioPaperSizes`
--

LOCK TABLES `PortfolioPaperSizes` WRITE;
/*!40000 ALTER TABLE `PortfolioPaperSizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioPaperSizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioPaperStock`
--

DROP TABLE IF EXISTS `PortfolioPaperStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioPaperStock` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioPaperStock`
--

LOCK TABLES `PortfolioPaperStock` WRITE;
/*!40000 ALTER TABLE `PortfolioPaperStock` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioPaperStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioPrintCodes`
--

DROP TABLE IF EXISTS `PortfolioPrintCodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioPrintCodes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioPrintCodes`
--

LOCK TABLES `PortfolioPrintCodes` WRITE;
/*!40000 ALTER TABLE `PortfolioPrintCodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioPrintCodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioPrintFinishing`
--

DROP TABLE IF EXISTS `PortfolioPrintFinishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioPrintFinishing` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioPrintFinishing`
--

LOCK TABLES `PortfolioPrintFinishing` WRITE;
/*!40000 ALTER TABLE `PortfolioPrintFinishing` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioPrintFinishing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioPrintSides`
--

DROP TABLE IF EXISTS `PortfolioPrintSides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioPrintSides` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioPrintSides`
--

LOCK TABLES `PortfolioPrintSides` WRITE;
/*!40000 ALTER TABLE `PortfolioPrintSides` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioPrintSides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioPrintTypes`
--

DROP TABLE IF EXISTS `PortfolioPrintTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioPrintTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `OriginationCode` char(60) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioPrintTypes`
--

LOCK TABLES `PortfolioPrintTypes` WRITE;
/*!40000 ALTER TABLE `PortfolioPrintTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioPrintTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProducts`
--

DROP TABLE IF EXISTS `PortfolioProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(10) unsigned NOT NULL,
  `Sku` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `IsFeatured` tinyint(3) DEFAULT '0',
  `ProductIncludes` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Short` text COLLATE utf8_unicode_ci,
  `PackSize` int(10) unsigned DEFAULT '0',
  `PackDescription` text COLLATE utf8_unicode_ci,
  `Cost` decimal(10,2) unsigned DEFAULT NULL,
  `PrintCode` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `OriginationCode` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `RushCharge` decimal(10,2) unsigned DEFAULT NULL,
  `EURPrice` decimal(10,2) unsigned DEFAULT NULL,
  `GBPPrice` decimal(10,2) unsigned DEFAULT NULL,
  `VAT` tinyint(1) unsigned DEFAULT NULL,
  `RetailPrice` decimal(10,2) unsigned DEFAULT NULL,
  `IsLoyalty` tinyint(1) unsigned DEFAULT NULL,
  `Colour` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Version` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `NumberOfColours` char(5) COLLATE utf8_unicode_ci DEFAULT '',
  `Brand` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `BarCode` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `EDT` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `AgeGroup` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `KeyFeature` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Size` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LabelsSheet` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `WhoFor` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `IndustryTypes` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `BarrelPrintArea` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ClipPrintArea` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintArea` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintType` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Weight` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `InkColour` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  `ClothingSize` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperPrintSide` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperSize` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintPositions` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PaperStock` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintFinish` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintSize` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PrintTechnique` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `SpecialOfferActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpecialOfferPriceEUR` decimal(10,2) unsigned DEFAULT NULL,
  `SpecialOfferPriceGBP` decimal(10,2) unsigned DEFAULT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `AddedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProducts`
--

LOCK TABLES `PortfolioProducts` WRITE;
/*!40000 ALTER TABLE `PortfolioProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProductsColours`
--

DROP TABLE IF EXISTS `PortfolioProductsColours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProductsColours` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) unsigned NOT NULL,
  `ProductSku` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Colour` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProductsColours`
--

LOCK TABLES `PortfolioProductsColours` WRITE;
/*!40000 ALTER TABLE `PortfolioProductsColours` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProductsColours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProductsFeatures`
--

DROP TABLE IF EXISTS `PortfolioProductsFeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProductsFeatures` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) DEFAULT '0',
  `ProductSku` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `FeatureId` int(10) DEFAULT '0',
  `Feature` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProductsFeatures`
--

LOCK TABLES `PortfolioProductsFeatures` WRITE;
/*!40000 ALTER TABLE `PortfolioProductsFeatures` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProductsFeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProductsPages`
--

DROP TABLE IF EXISTS `PortfolioProductsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProductsPages` (
  `ProductId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProductId`,`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProductsPages`
--

LOCK TABLES `PortfolioProductsPages` WRITE;
/*!40000 ALTER TABLE `PortfolioProductsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProductsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProductsTypes`
--

DROP TABLE IF EXISTS `PortfolioProductsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProductsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProductsTypes`
--

LOCK TABLES `PortfolioProductsTypes` WRITE;
/*!40000 ALTER TABLE `PortfolioProductsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProductsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProfileTypes`
--

DROP TABLE IF EXISTS `PortfolioProfileTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProfileTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PriceRelation` enum('Increase','Discount') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Discount',
  `Percentage` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `AllowOrders` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `Display` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProfileTypes`
--

LOCK TABLES `PortfolioProfileTypes` WRITE;
/*!40000 ALTER TABLE `PortfolioProfileTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProfileTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioProfiles`
--

DROP TABLE IF EXISTS `PortfolioProfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioProfiles` (
  `Id` int(10) unsigned NOT NULL,
  `UserId` int(10) unsigned NOT NULL,
  `AccountNumber` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Newsletter` tinyint(1) unsigned DEFAULT '0',
  `VATReg` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ProfileType` int(10) unsigned NOT NULL,
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyPhone` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyFax` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `LoyaltyPoints` int(10) unsigned NOT NULL DEFAULT '0',
  `Currency` enum('EUR','GBP','USD','AUD') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EUR',
  `BusinessType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `RetailerType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Approved` tinyint(1) unsigned DEFAULT '0',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioProfiles`
--

LOCK TABLES `PortfolioProfiles` WRITE;
/*!40000 ALTER TABLE `PortfolioProfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioProfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioRushCharges`
--

DROP TABLE IF EXISTS `PortfolioRushCharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioRushCharges` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Service` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) unsigned DEFAULT '0.00',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioRushCharges`
--

LOCK TABLES `PortfolioRushCharges` WRITE;
/*!40000 ALTER TABLE `PortfolioRushCharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioRushCharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PortfolioShippingZones`
--

DROP TABLE IF EXISTS `PortfolioShippingZones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PortfolioShippingZones` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CartAmountGreaterThanEUR` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `CartAmountGreaterThanGBP` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `ValueEUR` decimal(10,2) unsigned NOT NULL,
  `ValueGBP` decimal(10,2) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `RequestQuote` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Countries` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PortfolioShippingZones`
--

LOCK TABLES `PortfolioShippingZones` WRITE;
/*!40000 ALTER TABLE `PortfolioShippingZones` DISABLE KEYS */;
/*!40000 ALTER TABLE `PortfolioShippingZones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Positions`
--

DROP TABLE IF EXISTS `Positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Positions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Type` enum('Club','Company') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Positions`
--

LOCK TABLES `Positions` WRITE;
/*!40000 ALTER TABLE `Positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrintCategories`
--

DROP TABLE IF EXISTS `PrintCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PrintCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrintCategories`
--

LOCK TABLES `PrintCategories` WRITE;
/*!40000 ALTER TABLE `PrintCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrintCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductColors`
--

DROP TABLE IF EXISTS `ProductColors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductColors` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Hexa` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductColors`
--

LOCK TABLES `ProductColors` WRITE;
/*!40000 ALTER TABLE `ProductColors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductColors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductComparisons`
--

DROP TABLE IF EXISTS `ProductComparisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductComparisons` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) unsigned NOT NULL,
  `UserId` int(10) unsigned NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(10) unsigned NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductComparisons`
--

LOCK TABLES `ProductComparisons` WRITE;
/*!40000 ALTER TABLE `ProductComparisons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductComparisons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductDiscountsBulk`
--

DROP TABLE IF EXISTS `ProductDiscountsBulk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductDiscountsBulk` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductAmount` int(10) unsigned NOT NULL DEFAULT '0',
  `ProductPrice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Shop discounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductDiscountsBulk`
--

LOCK TABLES `ProductDiscountsBulk` WRITE;
/*!40000 ALTER TABLE `ProductDiscountsBulk` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductDiscountsBulk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductDiscountsVouchers`
--

DROP TABLE IF EXISTS `ProductDiscountsVouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductDiscountsVouchers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Value` float NOT NULL DEFAULT '0',
  `Code` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `UseOnce` tinyint(3) NOT NULL DEFAULT '0',
  `DateFrom` date DEFAULT NULL,
  `DateTo` date DEFAULT NULL,
  `Type` tinyint(3) NOT NULL DEFAULT '1' COMMENT 'Percentage or Set Value Discount',
  `OrderId` int(10) NOT NULL COMMENT 'If UseOnce, mark here when used',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `DiscountToken` (`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Shop discounts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductDiscountsVouchers`
--

LOCK TABLES `ProductDiscountsVouchers` WRITE;
/*!40000 ALTER TABLE `ProductDiscountsVouchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductDiscountsVouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductDisplayLocations`
--

DROP TABLE IF EXISTS `ProductDisplayLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductDisplayLocations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductDisplayLocations`
--

LOCK TABLES `ProductDisplayLocations` WRITE;
/*!40000 ALTER TABLE `ProductDisplayLocations` DISABLE KEYS */;
INSERT INTO `ProductDisplayLocations` VALUES (1,1,'General Homepage'),(2,2,'Important Products Carousel'),(3,3,'Best Deals Carousel'),(4,4,'Outstanding Products Carousel');
/*!40000 ALTER TABLE `ProductDisplayLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductEnquiries`
--

DROP TABLE IF EXISTS `ProductEnquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductEnquiries` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `Product` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HireDate` date DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Enquiries about Products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductEnquiries`
--

LOCK TABLES `ProductEnquiries` WRITE;
/*!40000 ALTER TABLE `ProductEnquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductEnquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductModels`
--

DROP TABLE IF EXISTS `ProductModels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductModels` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BrandId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `StyleId` int(10) NOT NULL DEFAULT '0',
  `WeightId` int(10) NOT NULL DEFAULT '0',
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Country` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Specifications` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductModels`
--

LOCK TABLES `ProductModels` WRITE;
/*!40000 ALTER TABLE `ProductModels` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductModels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductModelsFloorProductsRooms`
--

DROP TABLE IF EXISTS `ProductModelsFloorProductsRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductModelsFloorProductsRooms` (
  `RangeId` int(10) unsigned NOT NULL,
  `RoomId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`RangeId`,`RoomId`),
  KEY `RangeId` (`RangeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductModelsFloorProductsRooms`
--

LOCK TABLES `ProductModelsFloorProductsRooms` WRITE;
/*!40000 ALTER TABLE `ProductModelsFloorProductsRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductModelsFloorProductsRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductReviews`
--

DROP TABLE IF EXISTS `ProductReviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductReviews` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `NickName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ItemId` int(10) unsigned NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(10) unsigned NOT NULL DEFAULT '0',
  `ReviewTitle` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Review` text COLLATE utf8_unicode_ci,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductReviews`
--

LOCK TABLES `ProductReviews` WRITE;
/*!40000 ALTER TABLE `ProductReviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductReviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductTags`
--

DROP TABLE IF EXISTS `ProductTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductTags` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(10) unsigned NOT NULL DEFAULT '0',
  `Tag` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductTags`
--

LOCK TABLES `ProductTags` WRITE;
/*!40000 ALTER TABLE `ProductTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductVariantDimensionValues`
--

DROP TABLE IF EXISTS `ProductVariantDimensionValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductVariantDimensionValues` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DimensionId` int(10) unsigned NOT NULL,
  `Value` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `DimensionId_Value` (`DimensionId`,`Value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Allowable values for each dimension';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductVariantDimensionValues`
--

LOCK TABLES `ProductVariantDimensionValues` WRITE;
/*!40000 ALTER TABLE `ProductVariantDimensionValues` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductVariantDimensionValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductVariantDimensions`
--

DROP TABLE IF EXISTS `ProductVariantDimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductVariantDimensions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Dimensions available for product variants';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductVariantDimensions`
--

LOCK TABLES `ProductVariantDimensions` WRITE;
/*!40000 ALTER TABLE `ProductVariantDimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductVariantDimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductVariants`
--

DROP TABLE IF EXISTS `ProductVariants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductVariants` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int(10) unsigned NOT NULL,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `SupplierCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ManufacturerCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `AltCode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `EAN` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `RRPrice` decimal(10,2) unsigned NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  `CostPrice` decimal(10,2) unsigned NOT NULL,
  `PriceDetails` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SpecialOfferActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpecialOfferPrice` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `SpecialOfferContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Stock` smallint(3) unsigned DEFAULT NULL,
  `PurchaseEnabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductVariants`
--

LOCK TABLES `ProductVariants` WRITE;
/*!40000 ALTER TABLE `ProductVariants` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductVariants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductVariantsDimensions`
--

DROP TABLE IF EXISTS `ProductVariantsDimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductVariantsDimensions` (
  `VariantId` int(10) unsigned NOT NULL,
  `ValueId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`VariantId`,`ValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Dimensions that product variants have';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductVariantsDimensions`
--

LOCK TABLES `ProductVariantsDimensions` WRITE;
/*!40000 ALTER TABLE `ProductVariantsDimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductVariantsDimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BrandId` int(10) unsigned NOT NULL DEFAULT '0',
  `ModelId` int(10) unsigned NOT NULL DEFAULT '0',
  `TaxId` int(10) unsigned DEFAULT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `SupplierCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ManufacturerCode` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `AltCode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `EAN` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ImportInformation` text COLLATE utf8_unicode_ci NOT NULL,
  `ImportLocked` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Spotlight` text COLLATE utf8_unicode_ci NOT NULL,
  `RRPrice` decimal(10,2) unsigned NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  `CostPrice` decimal(10,2) unsigned NOT NULL,
  `VariantOf` int(10) NOT NULL DEFAULT '0',
  `VariantDisplay` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VariantVersionsDisplay` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `PriceDetails` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SpecialOfferContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `FeatureContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ExtraContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Specifications` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `EnquiryForm` enum('s','f') COLLATE utf8_unicode_ci NOT NULL,
  `Flagged` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flagged2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flagged3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VAT` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `SpecialOfferActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpecialOfferPrice` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `SearchText` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Versions` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsFeatured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PurchaseEnabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `IsTest` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IsExtra` tinyint(3) NOT NULL DEFAULT '0',
  `IsBook` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SloganId` int(11) NOT NULL,
  `ProductType` tinyint(3) NOT NULL DEFAULT '1',
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  `Deposits` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Availability` char(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ShowStruck` tinyint(3) DEFAULT '0',
  `SavingValue` tinyint(3) DEFAULT '0',
  `SavingPercent` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `TaxId` (`TaxId`),
  KEY `ModelId` (`ModelId`),
  KEY `SloganId` (`SloganId`),
  KEY `VariantOf` (`VariantOf`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,1,0,1,'Static Feeder','static-feeder','','','','','','','Y','','',0.00,0.00,0.00,0,'Y','N','','','','','<p><strong>Exciting new range of Static Mounted Electrically Driven Feeders for on farm or industrial use.</strong></p>\r\n\r\n<p>Contact your&nbsp;Local Area Sales Manager&nbsp;for details.&nbsp;</p>\r\n','',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-24 13:27:45',0,0,0),(2,1,0,1,'Paddle Feeder','paddle-feeder','','','','','','','Y','','',0.00,0.00,0.00,0,'Y','N','','','','','<p><strong>The proven Abbey Mixer/Feeder range is now well recognised for their many distinctive characteristics; superior mixing and feed preparation qualities; even distribution; strength and unrivalled reliability. They are a popular choice on many leading farms and farming institutions in Ireland, Europe and other countries.</strong></p>\r\n\r\n<p>The Abbey Paddle mixing action concentrates on the use of individually angled paddle arms connected to a single rotor, rotating and moving all the feed material gently forward and backwards, lifting the feed material around the machine &ndash; within minutes this action creates a light fluffy open textured ration. This unique design ensures that even the smallest ingredients is uniformly distributed throughout the mix, while maintaining low HP requirements.</p>\r\n\r\n<p>To discharge the feed from the Abbey Paddle Feeder, the operator just has to open the large hydraulically operated guillotine door at the side of the Diet Feeder, situated on the right side of the machine for ease to use with the hydraulic controls in the tractor. The use of a wide discharge door allows you to feed out the ration accurately and consistently.</p>\r\n\r\n<p>Abbey can tailor the discharge height to suit your own individual farm requirements. With the different options Abbey provide in discharge elevators, either a slat and chain or PVC belt the feed can be delivered over feed barriers of different heights.</p>\r\n\r\n<p>The Construction of the Abbey Paddle Feeder has no rival in terms of strength or design. It is built with a double chassis ensuring even weight distribution, greater stability and extra strength to the overall build of the Paddle Feeder.</p>\r\n\r\n<p>Here at Abbey, we understand that fast and accurate mixing means less waste and optimum animal performance. This is why we use the Digi-Star Programmable 3400 box complete with a four point load system, one of the best and most accurate systems on the market today</p>\r\n','<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 500px;\">\r\n	<caption>\r\n	<p style=\"text-align: left;\"><strong>Technical Data</strong></p>\r\n	</caption>\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center;\"><strong>Specification</strong></td>\r\n			<td style=\"text-align: center;\"><strong>Capacity (M3)</strong></td>\r\n			<td style=\"text-align: center;\"><strong>Width (M)</strong></td>\r\n			<td style=\"text-align: center;\"><strong>Length (M)</strong></td>\r\n			<td style=\"text-align: center;\"><strong>Height (M)</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">Paddle 100</td>\r\n			<td style=\"text-align: center;\">10</td>\r\n			<td style=\"text-align: center;\">2.19</td>\r\n			<td style=\"text-align: center;\">4.75</td>\r\n			<td style=\"text-align: center;\">2.66</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center;\">Paddle 145</td>\r\n			<td style=\"text-align: center;\">14.5</td>\r\n			<td style=\"text-align: center;\">2.21</td>\r\n			<td style=\"text-align: center;\">5.77</td>\r\n			<td style=\"text-align: center;\">2.59</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-24 13:27:58',0,0,0),(3,1,0,1,'Slurry Tanker','slurry-tanker','','','','','','','Y','','',0.00,0.00,0.00,0,'Y','N','','','','','<p><strong>The Abbey Machinery Slurry Tanker range caters for the &lsquo;Total Cow&rsquo; by handling the waste product in an economic and environmentally way. It consists of the most extensive range of tanker models and sizes available for today&rsquo;s farm and contracting customer. Each tanker comprises of key specifications that make the Abbey Machinery Tanker the best suited tanker to meet the demanding customer needs.</strong></p>\r\n\r\n<p>The Abbey tanker consists of 5 range options;</p>\r\n\r\n<ul>\r\n	<li><strong>Standard Tanks 900 &ndash; 2000</strong></li>\r\n	<li><strong>Premium Recess Tanks 1600-2000</strong></li>\r\n	<li><strong>Premium Plus Recess Tanks 1600-3000</strong></li>\r\n	<li><strong>Tandem Tanks 2000-4500</strong></li>\r\n	<li><strong>Tridem Tanks 3000-7000</strong></li>\r\n</ul>\r\n','',1,'s',0,0,0,1,0,15000.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,4,'',0,NULL,NULL,'2020-06-24 13:28:15',0,0,0),(4,1,0,1,'Grassland Toppers','grassland-toppers','','','','','','','Y','','',0.00,0.00,0.00,0,'Y','N','','','','','<p><strong>Abbey Toppers are ideal for paddock topping to optimise quality grass re-growth and to assist weed control -keeping pasture clean and fresh and meeting all the requirements of cutting and maintenance. Abbey has the most comprehensive range of topping equipment available.</strong></p>\r\n\r\n<p>Abbey builds its machinery to the highest standards using a highly qualified team of engineers with emphasis on being robust, safe, accurate, efficient and cost effective. All Toppers are gear driven and fitted with high quality &lsquo;Comer gearboxes&rsquo;. Comer are recognised as the world&rsquo;s leader in gearbox manufacturing. Each topper flail is specially engineered, shaped with hardened steel, cranked and free swinging minimising damage from concealed objects while a high quality finish is maintained.&nbsp; The cranked blades allow a high ground clearance on the main rotor blade, again minimising risk of damage. The blades uniquely mulch the topped grass, which optimise re-growth.</p>\r\n\r\n<p>All Abbey toppers are built utilising the company&rsquo;s long standing tradition of using the highest grades of components available and using a highly qualified team of engineers with emphasis on the machine being robust, safe, accurate, efficient and cost effective.</p>\r\n','',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-24 13:28:24',0,0,0),(5,2,0,1,'Battioni MEC 8000 Pump Unit Complete','battioni-mec-8000-pump-unit-complete','PMA101.01','','','','','<strong>Created from Import Fri, 19 Jun 2020 16:16:57 +0100</strong><br><br>\n\nStock Code: PMA101.01<br>Brand Name: Battioni<br>Price: 1715<br>Stock Amount: 100<br>','Y','','',0.00,1715.00,0.00,0,'Y','N','','','','','','',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-24 12:10:23',0,0,0),(6,2,0,1,'Battioni MEC 9000 Pump Unit Complete','battioni-mec-9000-pump-unit-complete','PMA102.01','','','','','<strong>Created from Import Fri, 19 Jun 2020 16:16:57 +0100</strong><br><br>\n\nStock Code: PMA102.01<br>Brand Name: Battioni<br>Price: 1520<br>Stock Amount: 100<br>','Y','','',0.00,1520.00,0.00,0,'Y','N','','','','','','',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-19 15:20:47',0,0,0),(7,2,0,1,'Battioni MEC 11000 Pump Unit Complete','battioni-mec-11000-pump-unit-complete','PMA104.01','','','','','<strong>Created from Import Fri, 19 Jun 2020 16:16:57 +0100</strong><br><br>\n\nStock Code: PMA104.01<br>Brand Name: Battioni<br>Price: 1815<br>Stock Amount: 100<br>','Y','','',0.00,1815.00,0.00,0,'Y','N','','','','','','',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-19 15:20:54',0,0,0),(8,2,0,1,'Battioni MEC 13500 Pump Unit Complete','battioni-mec-13500-pump-unit-complete','PMA106.01','','','','','<strong>Created from Import Fri, 19 Jun 2020 16:16:57 +0100</strong><br><br>\n\nStock Code: PMA106.01<br>Brand Name: Battioni<br>Price: 2428<br>Stock Amount: 100<br>','Y','','',0.00,2428.00,0.00,0,'Y','N','','','','','','',1,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,1,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-19 15:20:00',0,0,0),(9,3,0,3,'','x','','','','','','<strong>Created from Import Fri, 19 Jun 2020 16:16:57 +0100</strong><br><br>\n\nStock Code: <br>','N','','',0.00,0.00,0.00,0,'Y','N','','','','','','',0,'s',0,0,0,1,0,0.00,NULL,NULL,'','','','',NULL,0,0,0,0,'N',0,1,'',0,NULL,NULL,'2020-06-19 15:16:57',0,0,0);
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsAuthors`
--

DROP TABLE IF EXISTS `ProductsAuthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsAuthors` (
  `ProductId` int(10) unsigned NOT NULL,
  `AuthorId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ProductId`,`AuthorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsAuthors`
--

LOCK TABLES `ProductsAuthors` WRITE;
/*!40000 ALTER TABLE `ProductsAuthors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsAuthors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsBookCovers`
--

DROP TABLE IF EXISTS `ProductsBookCovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsBookCovers` (
  `ProductId` int(10) unsigned NOT NULL,
  `CoverId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsBookCovers`
--

LOCK TABLES `ProductsBookCovers` WRITE;
/*!40000 ALTER TABLE `ProductsBookCovers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsBookCovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsBooksList`
--

DROP TABLE IF EXISTS `ProductsBooksList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsBooksList` (
  `ProductId` int(10) unsigned NOT NULL,
  `BookListId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ProductId`,`BookListId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsBooksList`
--

LOCK TABLES `ProductsBooksList` WRITE;
/*!40000 ALTER TABLE `ProductsBooksList` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsBooksList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsEnquiries`
--

DROP TABLE IF EXISTS `ProductsEnquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsEnquiries` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Store` char(255) COLLATE utf8_unicode_ci DEFAULT 'Tullamore',
  `AddInfo` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsEnquiries`
--

LOCK TABLES `ProductsEnquiries` WRITE;
/*!40000 ALTER TABLE `ProductsEnquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsEnquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsEnquiriesItems`
--

DROP TABLE IF EXISTS `ProductsEnquiriesItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsEnquiriesItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ItemType` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Product',
  `ItemId` int(10) unsigned NOT NULL,
  `EnquiryId` int(10) unsigned NOT NULL,
  `Qty` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `ItemId_EnquiryId_ItemType` (`ItemType`,`ItemId`,`EnquiryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsEnquiriesItems`
--

LOCK TABLES `ProductsEnquiriesItems` WRITE;
/*!40000 ALTER TABLE `ProductsEnquiriesItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsEnquiriesItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsHolidays`
--

DROP TABLE IF EXISTS `ProductsHolidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsHolidays` (
  `ProductId` int(10) unsigned NOT NULL,
  `DateDepart` date DEFAULT NULL,
  `DateMatch` date DEFAULT NULL,
  `DateReturn` date DEFAULT NULL,
  `Location` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `HotelId` int(10) NOT NULL DEFAULT '0',
  `PriceChild` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PriceSingleSupplement` decimal(10,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `Id` (`ProductId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Extra product fields for Midland Travel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsHolidays`
--

LOCK TABLES `ProductsHolidays` WRITE;
/*!40000 ALTER TABLE `ProductsHolidays` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsHolidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsPages`
--

DROP TABLE IF EXISTS `ProductsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsPages` (
  `ProductId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProductId`,`PageId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Product categories (JOIN ProductId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsPages`
--

LOCK TABLES `ProductsPages` WRITE;
/*!40000 ALTER TABLE `ProductsPages` DISABLE KEYS */;
INSERT INTO `ProductsPages` VALUES (1,252),(1,279),(2,252),(2,278),(3,251),(4,253),(4,281),(5,251),(6,251),(6,276),(7,251),(7,276),(8,251),(8,276);
/*!40000 ALTER TABLE `ProductsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsProductDisplayLocations`
--

DROP TABLE IF EXISTS `ProductsProductDisplayLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsProductDisplayLocations` (
  `ProductId` int(10) unsigned NOT NULL,
  `LocationId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProductId`,`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsProductDisplayLocations`
--

LOCK TABLES `ProductsProductDisplayLocations` WRITE;
/*!40000 ALTER TABLE `ProductsProductDisplayLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsProductDisplayLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsRelated`
--

DROP TABLE IF EXISTS `ProductsRelated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsRelated` (
  `RelationshipTypeId` int(10) unsigned NOT NULL,
  `ProductId` int(10) unsigned NOT NULL,
  `RelatedId` int(10) unsigned NOT NULL,
  `ProductSourceTable` char(75) COLLATE utf8_unicode_ci DEFAULT 'Products',
  `RelatedSourceTable` char(75) COLLATE utf8_unicode_ci DEFAULT 'Products',
  UNIQUE KEY `FullyUnique` (`RelationshipTypeId`,`ProductId`,`RelatedId`,`ProductSourceTable`,`RelatedSourceTable`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Products related to other products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsRelated`
--

LOCK TABLES `ProductsRelated` WRITE;
/*!40000 ALTER TABLE `ProductsRelated` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsRelated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsRelatedTypes`
--

DROP TABLE IF EXISTS `ProductsRelatedTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsRelatedTypes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Position` int(11) NOT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Alert` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsRelatedTypes`
--

LOCK TABLES `ProductsRelatedTypes` WRITE;
/*!40000 ALTER TABLE `ProductsRelatedTypes` DISABLE KEYS */;
INSERT INTO `ProductsRelatedTypes` VALUES (1,1,'Related Products',0),(2,2,'Recommended Accessories',0);
/*!40000 ALTER TABLE `ProductsRelatedTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsSchoolBookSubjects`
--

DROP TABLE IF EXISTS `ProductsSchoolBookSubjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsSchoolBookSubjects` (
  `ProductId` int(10) unsigned NOT NULL,
  `SubjectId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ProductId`,`SubjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsSchoolBookSubjects`
--

LOCK TABLES `ProductsSchoolBookSubjects` WRITE;
/*!40000 ALTER TABLE `ProductsSchoolBookSubjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsSchoolBookSubjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsSchoolYears`
--

DROP TABLE IF EXISTS `ProductsSchoolYears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsSchoolYears` (
  `ProductId` int(10) unsigned NOT NULL,
  `YearId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ProductId`,`YearId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsSchoolYears`
--

LOCK TABLES `ProductsSchoolYears` WRITE;
/*!40000 ALTER TABLE `ProductsSchoolYears` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsSchoolYears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsShippings`
--

DROP TABLE IF EXISTS `ProductsShippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsShippings` (
  `ProductId` int(10) unsigned NOT NULL,
  `ProductType` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `ShippingId` int(10) DEFAULT NULL,
  `Weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  UNIQUE KEY `ProductId_ProductType` (`ProductId`,`ProductType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='For special shipping options.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsShippings`
--

LOCK TABLES `ProductsShippings` WRITE;
/*!40000 ALTER TABLE `ProductsShippings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsShippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsSlogans`
--

DROP TABLE IF EXISTS `ProductsSlogans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsSlogans` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Best Buy, Mega Price, Mega Offer, Now in Stock, New';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsSlogans`
--

LOCK TABLES `ProductsSlogans` WRITE;
/*!40000 ALTER TABLE `ProductsSlogans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsSlogans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsTypes`
--

DROP TABLE IF EXISTS `ProductsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='module/productscustom';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsTypes`
--

LOCK TABLES `ProductsTypes` WRITE;
/*!40000 ALTER TABLE `ProductsTypes` DISABLE KEYS */;
INSERT INTO `ProductsTypes` VALUES (1,'Parts','parts'),(2,'Software','software'),(3,'Used Machines','used-machines'),(4,'Machinery','machinery'),(5,'Online Course','online-course'),(6,'Merchandise','merchandise'),(7,'Standard Products','standard-products');
/*!40000 ALTER TABLE `ProductsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsVersions`
--

DROP TABLE IF EXISTS `ProductsVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsVersions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsVersions`
--

LOCK TABLES `ProductsVersions` WRITE;
/*!40000 ALTER TABLE `ProductsVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductsVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductsVersionsStock`
--

DROP TABLE IF EXISTS `ProductsVersionsStock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductsVersionsStock` (
  `ProductId` int(10) unsigned NOT NULL DEFAULT '0',
  `VersionId` int(10) unsigned NOT NULL,
  `StockAmount` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProductId`,`VersionId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Stock count per version';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductsVersionsStock`
--

LOCK TABLES `ProductsVersionsStock` WRITE;
/*!40000 ALTER TABLE `ProductsVersionsStock` DISABLE KEYS */;
INSERT INTO `ProductsVersionsStock` VALUES (5,0,100),(6,0,100),(7,0,100),(8,0,100),(9,0,0);
/*!40000 ALTER TABLE `ProductsVersionsStock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profiles`
--

DROP TABLE IF EXISTS `Profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profiles` (
  `UserId` int(10) unsigned NOT NULL,
  `Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `FirstName` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastName` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ForumAbout` text COLLATE utf8_unicode_ci NOT NULL,
  `Company` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `JobTitle` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Department` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Division` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Mobile` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Fax` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Discounted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DiscountRate` smallint(3) unsigned NOT NULL DEFAULT '0',
  `DiscountFlat` smallint(3) unsigned NOT NULL DEFAULT '0',
  `Approved` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ExternalApproved` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Reseller` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DeferredPayment` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Activated` int(10) NOT NULL DEFAULT '0',
  `HasMembership` tinyint(4) NOT NULL DEFAULT '0',
  `DateApproved` datetime DEFAULT NULL,
  `Type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IndustryType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsSponsor` enum('Y','N','U') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'U',
  `SponsorshipAmount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SponsorshipPledged` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PayPalPayerId` char(13) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `LoyaltyPoints` int(10) NOT NULL DEFAULT '0' COMMENT '0',
  `Status` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IsProblem` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AdminNote` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AccountReference` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Credit` int(10) DEFAULT NULL,
  `Budget` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ApprovalEmailSent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ApprovalEmailSentOn` datetime DEFAULT NULL,
  `QuoteEmailSent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `QuoteEmailSentOn` datetime DEFAULT NULL,
  `InterestedIn` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ServiceDeskEnabled` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `IsMaintenance` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Assignee` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='User profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profiles`
--

LOCK TABLES `Profiles` WRITE;
/*!40000 ALTER TABLE `Profiles` DISABLE KEYS */;
INSERT INTO `Profiles` VALUES (1,'dotsupport',0,'','Dotser','Support','','','','','','+353 57 932 3262','','',0,0,0,1,0,'N','N',1,1,'0000-00-00 00:00:00','1',NULL,'Y',0.00,0.00,'',0,'','N','','',NULL,'','N',NULL,'N',NULL,'','N','N',''),(5,'',15,'','loalivso88','','','','','','','','','',0,0,0,0,0,'N','N',0,0,NULL,NULL,NULL,'U',0.00,0.00,'',0,'','N','','',NULL,'','N',NULL,'N',NULL,'','N','N',''),(6,'',15,'','maevetobin53','','','','','','','','','',0,0,0,0,0,'N','N',0,0,NULL,NULL,NULL,'U',0.00,0.00,'',0,'','N','','',NULL,'','N',NULL,'N',NULL,'','N','N','');
/*!40000 ALTER TABLE `Profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgrammeTypes`
--

DROP TABLE IF EXISTS `ProgrammeTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProgrammeTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For different types of programmes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgrammeTypes`
--

LOCK TABLES `ProgrammeTypes` WRITE;
/*!40000 ALTER TABLE `ProgrammeTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProgrammeTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Programmes`
--

DROP TABLE IF EXISTS `Programmes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Programmes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Presenters` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Type` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Programmes`
--

LOCK TABLES `Programmes` WRITE;
/*!40000 ALTER TABLE `Programmes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Programmes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProgrammesSocialMedia`
--

DROP TABLE IF EXISTS `ProgrammesSocialMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProgrammesSocialMedia` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProgId` int(10) DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Links to social media for program listings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProgrammesSocialMedia`
--

LOCK TABLES `ProgrammesSocialMedia` WRITE;
/*!40000 ALTER TABLE `ProgrammesSocialMedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProgrammesSocialMedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectTypes`
--

DROP TABLE IF EXISTS `ProjectTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For different types of projects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectTypes`
--

LOCK TABLES `ProjectTypes` WRITE;
/*!40000 ALTER TABLE `ProjectTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectsPortfolio`
--

DROP TABLE IF EXISTS `ProjectsPortfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectsPortfolio` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `TitleTypes` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ClientId` int(10) DEFAULT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `UpperContent` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `IsFeatured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Location` int(10) NOT NULL,
  `Completed` date DEFAULT NULL,
  `Flagged` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(1) NOT NULL DEFAULT '0',
  `MapLat` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapLong` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `MapInfo` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Processes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectsPortfolio`
--

LOCK TABLES `ProjectsPortfolio` WRITE;
/*!40000 ALTER TABLE `ProjectsPortfolio` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectsPortfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectsPortfolioPages`
--

DROP TABLE IF EXISTS `ProjectsPortfolioPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectsPortfolioPages` (
  `ProjectId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProjectId`,`PageId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Project categories (JOIN ProjectId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectsPortfolioPages`
--

LOCK TABLES `ProjectsPortfolioPages` WRITE;
/*!40000 ALTER TABLE `ProjectsPortfolioPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectsPortfolioPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProjectsPortfolioTypes`
--

DROP TABLE IF EXISTS `ProjectsPortfolioTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProjectsPortfolioTypes` (
  `ProjectId` int(10) unsigned NOT NULL,
  `TypeId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ProjectId`,`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Project Type assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProjectsPortfolioTypes`
--

LOCK TABLES `ProjectsPortfolioTypes` WRITE;
/*!40000 ALTER TABLE `ProjectsPortfolioTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProjectsPortfolioTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Properties`
--

DROP TABLE IF EXISTS `Properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Properties` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned DEFAULT NULL,
  `NullPriceText` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Content` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `SaleLet` enum('sale','let') COLLATE utf8_unicode_ci DEFAULT NULL,
  `LetTerm` enum('week','month','year') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Published` date DEFAULT NULL,
  `SpecialOfferActive` tinyint(3) unsigned DEFAULT '0',
  `SpecialOfferPrice` decimal(10,2) unsigned DEFAULT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `IsFeatured` tinyint(3) unsigned DEFAULT '0',
  `Address` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Postcode` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `County` tinyint(4) DEFAULT NULL,
  `Country` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLat` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsLong` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsZoom` tinyint(3) DEFAULT '11',
  `MapsStreetView` tinyint(3) DEFAULT NULL,
  `MapsType` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MapsInfo` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BerRating` tinyint(4) DEFAULT NULL,
  `Banner` char(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BER` tinyint(4) NOT NULL DEFAULT '0',
  `Sticker` tinyint(4) NOT NULL DEFAULT '0',
  `Availability` tinyint(4) NOT NULL DEFAULT '0',
  `AgentId` int(10) DEFAULT NULL,
  `ForSale` tinyint(3) DEFAULT '0',
  `ToLet` tinyint(3) DEFAULT '0',
  `SizeId` int(10) DEFAULT '0',
  `RegionId` int(10) DEFAULT '0',
  `Size` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SizeRange` decimal(10,2) DEFAULT '0.00',
  `Units` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'm',
  `Rent` decimal(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Properties`
--

LOCK TABLES `Properties` WRITE;
/*!40000 ALTER TABLE `Properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `Properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropertiesPages`
--

DROP TABLE IF EXISTS `PropertiesPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PropertiesPages` (
  `PropertyId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`PropertyId`,`PageId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Connect Properties to Pages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropertiesPages`
--

LOCK TABLES `PropertiesPages` WRITE;
/*!40000 ALTER TABLE `PropertiesPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropertiesPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropertyEnquiries`
--

DROP TABLE IF EXISTS `PropertyEnquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PropertyEnquiries` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PropertyId` int(10) unsigned NOT NULL DEFAULT '0',
  `Property` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Enquries about Properties';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropertyEnquiries`
--

LOCK TABLES `PropertyEnquiries` WRITE;
/*!40000 ALTER TABLE `PropertyEnquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropertyEnquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropertyRegions`
--

DROP TABLE IF EXISTS `PropertyRegions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PropertyRegions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropertyRegions`
--

LOCK TABLES `PropertyRegions` WRITE;
/*!40000 ALTER TABLE `PropertyRegions` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropertyRegions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropertySizes`
--

DROP TABLE IF EXISTS `PropertySizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PropertySizes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropertySizes`
--

LOCK TABLES `PropertySizes` WRITE;
/*!40000 ALTER TABLE `PropertySizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropertySizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PropertyTypes`
--

DROP TABLE IF EXISTS `PropertyTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PropertyTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='module/properties';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PropertyTypes`
--

LOCK TABLES `PropertyTypes` WRITE;
/*!40000 ALTER TABLE `PropertyTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PropertyTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuantityBreaks`
--

DROP TABLE IF EXISTS `QuantityBreaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuantityBreaks` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Sku` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Qty` int(10) unsigned NOT NULL,
  `EURPrice` decimal(10,2) unsigned DEFAULT NULL,
  `GBPPrice` decimal(10,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuantityBreaks`
--

LOCK TABLES `QuantityBreaks` WRITE;
/*!40000 ALTER TABLE `QuantityBreaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuantityBreaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuoteItems`
--

DROP TABLE IF EXISTS `QuoteItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuoteItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `Qty` int(10) unsigned DEFAULT '1',
  `OriginationCharges` decimal(10,2) unsigned DEFAULT '0.00',
  `RushCharges` decimal(10,2) unsigned DEFAULT '0.00',
  `Message` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`ItemId`,`ItemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuoteItems`
--

LOCK TABLES `QuoteItems` WRITE;
/*!40000 ALTER TABLE `QuoteItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuoteItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuoteSavedItems`
--

DROP TABLE IF EXISTS `QuoteSavedItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuoteSavedItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `QuoteId` int(10) NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `CreatedAt` int(10) unsigned NOT NULL,
  `Qty` int(10) unsigned DEFAULT '1',
  `OriginationCharges` decimal(10,2) unsigned DEFAULT '0.00',
  `RushCharges` decimal(10,2) unsigned DEFAULT '0.00',
  `Message` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuoteSavedItems`
--

LOCK TABLES `QuoteSavedItems` WRITE;
/*!40000 ALTER TABLE `QuoteSavedItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuoteSavedItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Quotes`
--

DROP TABLE IF EXISTS `Quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Quotes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Status` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Open',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Quotes`
--

LOCK TABLES `Quotes` WRITE;
/*!40000 ALTER TABLE `Quotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RealMPIRecord`
--

DROP TABLE IF EXISTS `RealMPIRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealMPIRecord` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RemoteServiceId` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RequestType` enum('enrolled','sig') COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `ResponseXML` text COLLATE utf8_unicode_ci,
  `Message` text COLLATE utf8_unicode_ci,
  `ECI` tinyint(1) DEFAULT NULL,
  `Action` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Real MPI (3D Secure) Record';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RealMPIRecord`
--

LOCK TABLES `RealMPIRecord` WRITE;
/*!40000 ALTER TABLE `RealMPIRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `RealMPIRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RealexPaymentRecord`
--

DROP TABLE IF EXISTS `RealexPaymentRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RealexPaymentRecord` (
  `OrderId` int(10) unsigned NOT NULL,
  `PaymentId` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CardType` enum('amex','diners','laser','mc','mc/debit','switch','uatp','visa','visa/debit') COLLATE utf8_unicode_ci NOT NULL,
  `CardName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CardDigits` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `ResponseXml` text COLLATE utf8_unicode_ci NOT NULL,
  `ResultCode` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `CvnResult` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `Bank` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `BankCountry` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RealexPaymentRecord`
--

LOCK TABLES `RealexPaymentRecord` WRITE;
/*!40000 ALTER TABLE `RealexPaymentRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `RealexPaymentRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recycles`
--

DROP TABLE IF EXISTS `Recycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recycles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Source` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DeletedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Deleted items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recycles`
--

LOCK TABLES `Recycles` WRITE;
/*!40000 ALTER TABLE `Recycles` DISABLE KEYS */;
INSERT INTO `Recycles` VALUES (1,'Pages','Item: 262','2020-06-18 13:22:52'),(2,'Pages','Item: 264','2020-06-18 13:32:34'),(3,'Pages','Item: 247','2020-06-18 13:47:53'),(4,'Brands','Item: 3','2020-06-19 15:17:58');
/*!40000 ALTER TABLE `Recycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RecyclesItems`
--

DROP TABLE IF EXISTS `RecyclesItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RecyclesItems` (
  `RecycleId` int(10) unsigned DEFAULT NULL,
  `Field` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Value` text COLLATE utf8_unicode_ci,
  KEY `IndexParent` (`RecycleId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Deleted item data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RecyclesItems`
--

LOCK TABLES `RecyclesItems` WRITE;
/*!40000 ALTER TABLE `RecyclesItems` DISABLE KEYS */;
INSERT INTO `RecyclesItems` VALUES (1,'Id','262'),(1,'Area','2'),(1,'Parent','255'),(1,'Position','2'),(1,'Name','news-events'),(1,'Path','about-us-2/news-events'),(1,'Title','News & Events'),(1,'Summary',''),(1,'Preview',''),(1,'Content',''),(1,'Content2',''),(1,'MetaTitle',''),(1,'MetaDescription',''),(1,'MetaKeywords',''),(1,'SearchText',''),(1,'Flags','128'),(1,'Menu',''),(1,'Display','1'),(1,'Visibility','1'),(1,'Comments',''),(1,'PathOption','1'),(1,'GroupOption','7'),(1,'AcceptProducts','0'),(1,'AcceptProjects','0'),(1,'DisplayOptions',''),(1,'GroupOption2',''),(1,'Link',''),(1,'Redirect','0'),(1,'Abstract',''),(1,'ModifiedOn','2020-06-18 13:22:39'),(1,'Special',''),(1,'ChildrenView','0'),(1,'ChildrenClickthrough','1'),(1,'ChildrenPreview','0'),(1,'ChildrenSummary','0'),(1,'ChildrenContent','0'),(1,'ProductsPosition','Normal'),(1,'RequestForm','0'),(1,'NewTab','0'),(1,'HasCustomForm','0'),(1,'FormSource',''),(1,'FormAction',''),(2,'Id','264'),(2,'Area','2'),(2,'Parent','255'),(2,'Position','1'),(2,'Name','careers'),(2,'Path','about-abbey-machinery/careers'),(2,'Title','Careers'),(2,'Summary',''),(2,'Preview',''),(2,'Content',''),(2,'Content2',''),(2,'MetaTitle',''),(2,'MetaDescription',''),(2,'MetaKeywords',''),(2,'SearchText',''),(2,'Flags','128'),(2,'Menu',''),(2,'Display','1'),(2,'Visibility','1'),(2,'Comments',''),(2,'PathOption','1'),(2,'GroupOption','6'),(2,'AcceptProducts','0'),(2,'AcceptProjects','0'),(2,'DisplayOptions',''),(2,'GroupOption2',''),(2,'Link',''),(2,'Redirect','0'),(2,'Abstract',''),(2,'ModifiedOn','2020-06-18 13:29:07'),(2,'Special',''),(2,'ChildrenView','0'),(2,'ChildrenClickthrough','1'),(2,'ChildrenPreview','0'),(2,'ChildrenSummary','0'),(2,'ChildrenContent','0'),(2,'ProductsPosition','Normal'),(2,'RequestForm','0'),(2,'NewTab','0'),(2,'HasCustomForm','0'),(2,'FormSource',''),(2,'FormAction',''),(3,'Id','247'),(3,'Area','1'),(3,'Parent','0'),(3,'Position','4'),(3,'Name','products-2'),(3,'Path','products-2'),(3,'Title','Products'),(3,'Summary',''),(3,'Preview',''),(3,'Content',''),(3,'Content2',''),(3,'MetaTitle',''),(3,'MetaDescription',''),(3,'MetaKeywords',''),(3,'SearchText',''),(3,'Flags','128'),(3,'Menu',''),(3,'Display','1'),(3,'Visibility','1'),(3,'Comments',''),(3,'PathOption','1'),(3,'GroupOption','7'),(3,'AcceptProducts','0'),(3,'AcceptProjects','0'),(3,'DisplayOptions','0'),(3,'GroupOption2',''),(3,'Link',''),(3,'Redirect','0'),(3,'Abstract',''),(3,'ModifiedOn','2020-06-18 13:47:12'),(3,'Special',''),(3,'ChildrenView','0'),(3,'ChildrenClickthrough','1'),(3,'ChildrenPreview','0'),(3,'ChildrenSummary','0'),(3,'ChildrenContent','0'),(3,'ProductsPosition','Normal'),(3,'RequestForm','0'),(3,'NewTab','0'),(3,'HasCustomForm','0'),(3,'FormSource',''),(3,'FormAction',''),(4,'Id','3'),(4,'Position','0'),(4,'Pages',''),(4,'Title',''),(4,'Name','x'),(4,'Slogan',''),(4,'Summary',''),(4,'Content',''),(4,'Web',''),(4,'Display','1'),(4,'MetaTitle',''),(4,'MetaDescription',''),(4,'MetaKeywords','');
/*!40000 ALTER TABLE `RecyclesItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegisterInterest`
--

DROP TABLE IF EXISTS `RegisterInterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RegisterInterest` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactFirst` char(25) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactLast` char(25) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactPhone` char(25) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactEmail` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `PropertyType` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `BuyerStatus` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `BuyerType` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `MortgageApproval` tinyint(1) NOT NULL DEFAULT '0',
  `PropertyAppraisal` tinyint(1) NOT NULL DEFAULT '0',
  `MarketingPermissions` tinyint(1) NOT NULL DEFAULT '0',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UserId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RegisterInterest`
--

LOCK TABLES `RegisterInterest` WRITE;
/*!40000 ALTER TABLE `RegisterInterest` DISABLE KEYS */;
/*!40000 ALTER TABLE `RegisterInterest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Registrations`
--

DROP TABLE IF EXISTS `Registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Registrations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `MemberId` int(10) unsigned NOT NULL DEFAULT '0',
  `MemberType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Season` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `OverallPrice` decimal(10,2) NOT NULL,
  `Display` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Registrations`
--

LOCK TABLES `Registrations` WRITE;
/*!40000 ALTER TABLE `Registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `Registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportedAds`
--

DROP TABLE IF EXISTS `ReportedAds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportedAds` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AdvertId` int(10) unsigned NOT NULL,
  `Reason` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Comments` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VisitorIP` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ReportedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportedAds`
--

LOCK TABLES `ReportedAds` WRITE;
/*!40000 ALTER TABLE `ReportedAds` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportedAds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Requests`
--

DROP TABLE IF EXISTS `Requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Requests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactFirst` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactLast` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactPhone` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactMobile` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactFax` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactEmail` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactWeb` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyName` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyPhone` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CompanyEmail` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressStreet` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressTown` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressCounty` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressCountry` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ContactMethod` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Category` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ContentAbout` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci,
  `Extra` text COLLATE utf8_unicode_ci,
  `GDPR` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Status` tinyint(3) unsigned DEFAULT '1',
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Attr` tinyint(3) unsigned DEFAULT '0',
  `StaffId` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contact requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Requests`
--

LOCK TABLES `Requests` WRITE;
/*!40000 ALTER TABLE `Requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `Requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RequestsPhone`
--

DROP TABLE IF EXISTS `RequestsPhone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RequestsPhone` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ContactPhone` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CreatedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Contact requests';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RequestsPhone`
--

LOCK TABLES `RequestsPhone` WRITE;
/*!40000 ALTER TABLE `RequestsPhone` DISABLE KEYS */;
/*!40000 ALTER TABLE `RequestsPhone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResellerApplications`
--

DROP TABLE IF EXISTS `ResellerApplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResellerApplications` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `CompanyName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `IpAddress` char(16) COLLATE utf8_unicode_ci NOT NULL,
  `VATorPPS` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressPostcode` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `FirmTelephone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `FirmFax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `FirmEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirmWebsite` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalNameFirst` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalNameLast` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalTelephone` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResellerApplications`
--

LOCK TABLES `ResellerApplications` WRITE;
/*!40000 ALTER TABLE `ResellerApplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResellerApplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resellers`
--

DROP TABLE IF EXISTS `Resellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resellers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `ResellerCode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `AccountNumber` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `VATReg` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyPhone` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyFax` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(60) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(90) COLLATE utf8_unicode_ci DEFAULT '',
  `CommissionPercentage` decimal(5,2) DEFAULT '0.00',
  `Commissions` decimal(10,2) DEFAULT '0.00',
  `Currency` enum('EUR','GBP','USD','AUD') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'EUR',
  `Approved` tinyint(1) unsigned DEFAULT '2',
  `Display` tinyint(1) unsigned DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resellers`
--

LOCK TABLES `Resellers` WRITE;
/*!40000 ALTER TABLE `Resellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Resellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RmsPaymentRecord`
--

DROP TABLE IF EXISTS `RmsPaymentRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RmsPaymentRecord` (
  `OrderId` int(10) unsigned NOT NULL,
  `PaymentId` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `MerchantId` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CustomerId` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `TransactionId` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `OrderReference` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `TransactionUnique` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CardType` enum('amex','diners','laser','mc','mc/debit','switch','uatp','visa','visa/debit') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Provided by customer',
  `CardName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CardDigits` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `CardTypeCode` char(4) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Returned by RMS',
  `CardTypeName` char(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Returned by RMS',
  `CardIssuer` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CardIssuerCountry` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `CardIssuerCountryCode` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `AvsCv2ResponseCode` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `AvsCv2ResponseMessage` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Cv2Check` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `AvsCv2AuthEntity` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `ResponseData` text COLLATE utf8_unicode_ci NOT NULL,
  `ResultCode` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Message` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `3DSCheck` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `3DSEnabled` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `3DSEnrolled` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `3DSAuthenticated` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `3DSResponseCode` char(5) COLLATE utf8_unicode_ci NOT NULL,
  `3DSResponseMessage` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RmsPaymentRecord`
--

LOCK TABLES `RmsPaymentRecord` WRITE;
/*!40000 ALTER TABLE `RmsPaymentRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `RmsPaymentRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RugbyClubMembers`
--

DROP TABLE IF EXISTS `RugbyClubMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RugbyClubMembers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TeamId` int(10) NOT NULL,
  `FirstName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `DateOfBirth` date NOT NULL,
  `DatePayment` date DEFAULT NULL,
  `Address` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IRFU` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Tullamore',
  `County` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `Mobile` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `School` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Relationship1` enum('mother','father','sister','brother','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Relationship2` enum('mother','father','sister','brother','other') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentName1` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentName2` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentOccupation1` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentOccupation2` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentPhone1` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentPhone2` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentEmail1` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ParentEmail2` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Volunteer1` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Volunteer2` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `CardIssued` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MedicalCondition` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Treatment` enum('','Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `MembershipStatus` enum('registered','paid','incomplete') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentStatus` enum('paid','unpaid') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentMethodId` int(11) NOT NULL,
  `PriceType` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MedicalDetails` varchar(254) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` int(10) NOT NULL DEFAULT '0',
  `ProtectionAgreed` tinyint(4) NOT NULL DEFAULT '0',
  `UserId` int(10) NOT NULL DEFAULT '0',
  `IsMember` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ParentId` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `TeamId` (`TeamId`),
  KEY `UserId` (`UserId`),
  KEY `ParentId` (`ParentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RugbyClubMembers`
--

LOCK TABLES `RugbyClubMembers` WRITE;
/*!40000 ALTER TABLE `RugbyClubMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `RugbyClubMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RugbyClubPaymentMethods`
--

DROP TABLE IF EXISTS `RugbyClubPaymentMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RugbyClubPaymentMethods` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RugbyClubPaymentMethods`
--

LOCK TABLES `RugbyClubPaymentMethods` WRITE;
/*!40000 ALTER TABLE `RugbyClubPaymentMethods` DISABLE KEYS */;
INSERT INTO `RugbyClubPaymentMethods` VALUES (1,'Cash'),(2,'Cheque'),(3,'Bank Transfer'),(4,'Online CC'),(5,'Terminal CC');
/*!40000 ALTER TABLE `RugbyClubPaymentMethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SagePaymentRecord`
--

DROP TABLE IF EXISTS `SagePaymentRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SagePaymentRecord` (
  `OrderId` int(10) unsigned NOT NULL,
  `CardType` enum('amex','diners','laser','mc','mc/debit','switch','uatp','visa','visa/debit') COLLATE utf8_unicode_ci NOT NULL,
  `CardName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CardDigits` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `Message` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SagePaymentRecord`
--

LOCK TABLES `SagePaymentRecord` WRITE;
/*!40000 ALTER TABLE `SagePaymentRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `SagePaymentRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SantaVisit`
--

DROP TABLE IF EXISTS `SantaVisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SantaVisit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` text COLLATE utf8_unicode_ci NOT NULL,
  `Date` date NOT NULL,
  `Time` time NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Adults` int(10) unsigned DEFAULT '1',
  `Children` int(10) unsigned DEFAULT '1',
  `Status` enum('ordered','collected','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ordered',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SantaVisit`
--

LOCK TABLES `SantaVisit` WRITE;
/*!40000 ALTER TABLE `SantaVisit` DISABLE KEYS */;
/*!40000 ALTER TABLE `SantaVisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schedules`
--

DROP TABLE IF EXISTS `Schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schedules` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `StartDate` date DEFAULT NULL,
  `FinishDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `FinishTime` time DEFAULT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Offaly',
  `AddressCountry` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `ContactWeb` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Style` char(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schedules`
--

LOCK TABLES `Schedules` WRITE;
/*!40000 ALTER TABLE `Schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolBookSubjects`
--

DROP TABLE IF EXISTS `SchoolBookSubjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchoolBookSubjects` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolBookSubjects`
--

LOCK TABLES `SchoolBookSubjects` WRITE;
/*!40000 ALTER TABLE `SchoolBookSubjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolBookSubjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolTypes`
--

DROP TABLE IF EXISTS `SchoolTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchoolTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `PageId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolTypes`
--

LOCK TABLES `SchoolTypes` WRITE;
/*!40000 ALTER TABLE `SchoolTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SchoolYears`
--

DROP TABLE IF EXISTS `SchoolYears`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SchoolYears` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Position` int(10) NOT NULL DEFAULT '0',
  `TypeId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SchoolYears`
--

LOCK TABLES `SchoolYears` WRITE;
/*!40000 ALTER TABLE `SchoolYears` DISABLE KEYS */;
/*!40000 ALTER TABLE `SchoolYears` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Schools`
--

DROP TABLE IF EXISTS `Schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Schools` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(10) unsigned NOT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressStreet` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressTown` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressCounty` int(10) DEFAULT NULL,
  `Phone` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fax` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Web` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Schools`
--

LOCK TABLES `Schools` WRITE;
/*!40000 ALTER TABLE `Schools` DISABLE KEYS */;
/*!40000 ALTER TABLE `Schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SecurityStringsUsed`
--

DROP TABLE IF EXISTS `SecurityStringsUsed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecurityStringsUsed` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `String` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `String` (`String`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SecurityStringsUsed`
--

LOCK TABLES `SecurityStringsUsed` WRITE;
/*!40000 ALTER TABLE `SecurityStringsUsed` DISABLE KEYS */;
/*!40000 ALTER TABLE `SecurityStringsUsed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SecurityTokens`
--

DROP TABLE IF EXISTS `SecurityTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SecurityTokens` (
  `Item` int(10) NOT NULL,
  `Token` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `Expires` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='For password recovery';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SecurityTokens`
--

LOCK TABLES `SecurityTokens` WRITE;
/*!40000 ALTER TABLE `SecurityTokens` DISABLE KEYS */;
INSERT INTO `SecurityTokens` VALUES (2,'e663-26d4-4e28-9d79-9f32-b8e1',1592989183),(3,'512b-7b25-876a-2cc8-d1e9-cf33',1592989595),(4,'7451-b020-4f5f-c206-47fd-c7ff',1592989739);
/*!40000 ALTER TABLE `SecurityTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sellers`
--

DROP TABLE IF EXISTS `Sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sellers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `AccountType` enum('Individual','Business') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sellers`
--

LOCK TABLES `Sellers` WRITE;
/*!40000 ALTER TABLE `Sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SensitiveConfig`
--

DROP TABLE IF EXISTS `SensitiveConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SensitiveConfig` (
  `Name` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Stuff which shouldn''t be in Config.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SensitiveConfig`
--

LOCK TABLES `SensitiveConfig` WRITE;
/*!40000 ALTER TABLE `SensitiveConfig` DISABLE KEYS */;
INSERT INTO `SensitiveConfig` VALUES ('invoice/account_number',''),('invoice/bank/account',''),('invoice/bank/address',''),('invoice/bank/name',''),('invoice/bic',''),('invoice/business_name',''),('invoice/iban',''),('invoice/sort_code',''),('shop/internal/payment_fee',''),('shop/internal/payment_fee_label',''),('shop/internal/payment_fee_minimum',''),('shop/internal/payments/provider','');
/*!40000 ALTER TABLE `SensitiveConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SentEmails`
--

DROP TABLE IF EXISTS `SentEmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SentEmails` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Config` text COLLATE utf8_unicode_ci NOT NULL,
  `Subject` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci NOT NULL,
  `Files` text COLLATE utf8_unicode_ci,
  `Sent` enum('Y','N','X') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CreatedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Queue of e-mails to be sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SentEmails`
--

LOCK TABLES `SentEmails` WRITE;
/*!40000 ALTER TABLE `SentEmails` DISABLE KEYS */;
INSERT INTO `SentEmails` VALUES (1,'{\"smtp_auth\":{\"sender\":\"noreply@dotser.ie\",\"server\":\"smtp.gmail.com\",\"port\":587,\"username\":\"noreply@dotser.ie\",\"password\":\"Vpew29#w8!m!\",\"encrypt\":\"tls\"},\"to\":\"Cormac.Cavanagh@abbeymachinery.com\",\"reply_to\":\"info@abbeymachinery.com\",\"from_name\":\"Abbey Machinery\"}','You are now an administrator of Abbey Machinery','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>You are now an administrator of Abbey Machinery</title>\n</head>\n<body>\n<div id=\"body_entire\"><p>\r\n	Hi Cormac.Cavanagh,</p>\r\n<p>\r\n	You are now an administrator at Abbey Machinery.</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://abbeymachinery.dotser.com/admin\">abbeymachinery.dotser.com/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"http://abbeymachinery.dotser.com/account/reset/e663-26d4-4e28-9d79-9f32-b8e1\">http://abbeymachinery.dotser.com/account/reset/e663-26d4-4e28-9d79-9f32-b8e1</a>.</li>\r\n</ul>\r\n<p>Regards,<br />\r\nAbbey Machinery<br />\r\n</p>\r\n\r\n<p>Tel.: 353 67 26677<br />\r\nE-mail: info@abbeymachinery.com<br />\r\nWeb: <a href=\"http://abbeymachinery.dotser.com\">abbeymachinery.dotser.com</a></p>\r\n</div>\n</body>\n</html>',NULL,'Y','2020-06-23 08:59:44'),(2,'{\"smtp_auth\":{\"sender\":\"noreply@dotser.ie\",\"server\":\"smtp.gmail.com\",\"port\":587,\"username\":\"noreply@dotser.ie\",\"password\":\"Vpew29#w8!m!\",\"encrypt\":\"tls\"},\"to\":\"info@abbeymachinery.com\",\"reply_to\":\"Cormac.Cavanagh@abbeymachinery.com\",\"from_name\":\"Abbey Machinery\"}','(Copy of) You are now an administrator of Abbey Machinery','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>(Copy of) You are now an administrator of Abbey Machinery</title>\n</head>\n<body>\n<div id=\"body_entire\">(This is the administration carbon copy of the message sent to \"<b>Cormac.Cavanagh@abbeymachinery.com</b>\")<hr><p>\r\n	Hi Cormac.Cavanagh,</p>\r\n<p>\r\n	You are now an administrator at Abbey Machinery.</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://abbeymachinery.dotser.com/admin\">abbeymachinery.dotser.com/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"http://abbeymachinery.dotser.com/account/reset/e663-26d4-4e28-9d79-9f32-b8e1\">http://abbeymachinery.dotser.com/account/reset/e663-26d4-4e28-9d79-9f32-b8e1</a>.</li>\r\n</ul>\r\n<p>Regards,<br />\r\nAbbey Machinery<br />\r\n</p>\r\n\r\n<p>Tel.: 353 67 26677<br />\r\nE-mail: info@abbeymachinery.com<br />\r\nWeb: <a href=\"http://abbeymachinery.dotser.com\">abbeymachinery.dotser.com</a></p>\r\n</div>\n</body>\n</html>',NULL,'Y','2020-06-23 08:59:47'),(3,'{\"smtp_auth\":{\"sender\":\"noreply@dotser.ie\",\"server\":\"smtp.gmail.com\",\"port\":587,\"username\":\"noreply@dotser.ie\",\"password\":\"Vpew29#w8!m!\",\"encrypt\":\"tls\"},\"to\":\"jhicks@abbeymachinery.com\",\"reply_to\":\"info@abbeymachinery.com\",\"from_name\":\"Abbey Machinery\"}','You are now an administrator of Abbey Machinery','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>You are now an administrator of Abbey Machinery</title>\n</head>\n<body>\n<div id=\"body_entire\"><p>\r\n	Hi jhicks,</p>\r\n<p>\r\n	You are now an administrator at Abbey Machinery.</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://abbeymachinery.dotser.com/admin\">abbeymachinery.dotser.com/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"http://abbeymachinery.dotser.com/account/reset/512b-7b25-876a-2cc8-d1e9-cf33\">http://abbeymachinery.dotser.com/account/reset/512b-7b25-876a-2cc8-d1e9-cf33</a>.</li>\r\n</ul>\r\n<p>Regards,<br />\r\nAbbey Machinery<br />\r\n</p>\r\n\r\n<p>Tel.: 353 67 26677<br />\r\nE-mail: info@abbeymachinery.com<br />\r\nWeb: <a href=\"http://abbeymachinery.dotser.com\">abbeymachinery.dotser.com</a></p>\r\n</div>\n</body>\n</html>',NULL,'Y','2020-06-23 09:06:36'),(4,'{\"smtp_auth\":{\"sender\":\"noreply@dotser.ie\",\"server\":\"smtp.gmail.com\",\"port\":587,\"username\":\"noreply@dotser.ie\",\"password\":\"Vpew29#w8!m!\",\"encrypt\":\"tls\"},\"to\":\"info@abbeymachinery.com\",\"reply_to\":\"jhicks@abbeymachinery.com\",\"from_name\":\"Abbey Machinery\"}','(Copy of) You are now an administrator of Abbey Machinery','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>(Copy of) You are now an administrator of Abbey Machinery</title>\n</head>\n<body>\n<div id=\"body_entire\">(This is the administration carbon copy of the message sent to \"<b>jhicks@abbeymachinery.com</b>\")<hr><p>\r\n	Hi jhicks,</p>\r\n<p>\r\n	You are now an administrator at Abbey Machinery.</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://abbeymachinery.dotser.com/admin\">abbeymachinery.dotser.com/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"http://abbeymachinery.dotser.com/account/reset/512b-7b25-876a-2cc8-d1e9-cf33\">http://abbeymachinery.dotser.com/account/reset/512b-7b25-876a-2cc8-d1e9-cf33</a>.</li>\r\n</ul>\r\n<p>Regards,<br />\r\nAbbey Machinery<br />\r\n</p>\r\n\r\n<p>Tel.: 353 67 26677<br />\r\nE-mail: info@abbeymachinery.com<br />\r\nWeb: <a href=\"http://abbeymachinery.dotser.com\">abbeymachinery.dotser.com</a></p>\r\n</div>\n</body>\n</html>',NULL,'Y','2020-06-23 09:06:39'),(5,'{\"smtp_auth\":{\"sender\":\"noreply@dotser.ie\",\"server\":\"smtp.gmail.com\",\"port\":587,\"username\":\"noreply@dotser.ie\",\"password\":\"Vpew29#w8!m!\",\"encrypt\":\"tls\"},\"to\":\"marketing@abbeymachinery.com\",\"reply_to\":\"info@abbeymachinery.com\",\"from_name\":\"Abbey Machinery\"}','You are now an administrator of Abbey Machinery','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>You are now an administrator of Abbey Machinery</title>\n</head>\n<body>\n<div id=\"body_entire\"><p>\r\n	Hi marketing,</p>\r\n<p>\r\n	You are now an administrator at Abbey Machinery.</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://abbeymachinery.dotser.com/admin\">abbeymachinery.dotser.com/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"http://abbeymachinery.dotser.com/account/reset/7451-b020-4f5f-c206-47fd-c7ff\">http://abbeymachinery.dotser.com/account/reset/7451-b020-4f5f-c206-47fd-c7ff</a>.</li>\r\n</ul>\r\n<p>Regards,<br />\r\nAbbey Machinery<br />\r\n</p>\r\n\r\n<p>Tel.: 353 67 26677<br />\r\nE-mail: info@abbeymachinery.com<br />\r\nWeb: <a href=\"http://abbeymachinery.dotser.com\">abbeymachinery.dotser.com</a></p>\r\n</div>\n</body>\n</html>',NULL,'Y','2020-06-23 09:09:00'),(6,'{\"smtp_auth\":{\"sender\":\"noreply@dotser.ie\",\"server\":\"smtp.gmail.com\",\"port\":587,\"username\":\"noreply@dotser.ie\",\"password\":\"Vpew29#w8!m!\",\"encrypt\":\"tls\"},\"to\":\"info@abbeymachinery.com\",\"reply_to\":\"marketing@abbeymachinery.com\",\"from_name\":\"Abbey Machinery\"}','(Copy of) You are now an administrator of Abbey Machinery','<!DOCTYPE html>\n<html>\n<head>\n<meta charset=\"utf-8\" />\n<title>(Copy of) You are now an administrator of Abbey Machinery</title>\n</head>\n<body>\n<div id=\"body_entire\">(This is the administration carbon copy of the message sent to \"<b>marketing@abbeymachinery.com</b>\")<hr><p>\r\n	Hi marketing,</p>\r\n<p>\r\n	You are now an administrator at Abbey Machinery.</p>\r\n<p>\r\n	Useful links:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Manage site:</strong> <a href=\"http://abbeymachinery.dotser.com/admin\">abbeymachinery.dotser.com/admin</a>.</li>\r\n	<li>\r\n		<strong>Set password:</strong> <a href=\"http://abbeymachinery.dotser.com/account/reset/7451-b020-4f5f-c206-47fd-c7ff\">http://abbeymachinery.dotser.com/account/reset/7451-b020-4f5f-c206-47fd-c7ff</a>.</li>\r\n</ul>\r\n<p>Regards,<br />\r\nAbbey Machinery<br />\r\n</p>\r\n\r\n<p>Tel.: 353 67 26677<br />\r\nE-mail: info@abbeymachinery.com<br />\r\nWeb: <a href=\"http://abbeymachinery.dotser.com\">abbeymachinery.dotser.com</a></p>\r\n</div>\n</body>\n</html>',NULL,'Y','2020-06-23 09:09:02');
/*!40000 ALTER TABLE `SentEmails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SentEmailsAttachments`
--

DROP TABLE IF EXISTS `SentEmailsAttachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SentEmailsAttachments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EmailId` int(10) unsigned NOT NULL,
  `Type` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Data` longblob,
  PRIMARY KEY (`Id`),
  KEY `EmailId` (`EmailId`),
  CONSTRAINT `SentEmailsAttachments_ibfk_2` FOREIGN KEY (`EmailId`) REFERENCES `SentEmails` (`Id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Queue of e-mails to be sent';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SentEmailsAttachments`
--

LOCK TABLES `SentEmailsAttachments` WRITE;
/*!40000 ALTER TABLE `SentEmailsAttachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `SentEmailsAttachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceDeskAssignees`
--

DROP TABLE IF EXISTS `ServiceDeskAssignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceDeskAssignees` (
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `Bugs` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Improvements` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Queries` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceDeskAssignees`
--

LOCK TABLES `ServiceDeskAssignees` WRITE;
/*!40000 ALTER TABLE `ServiceDeskAssignees` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceDeskAssignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceDeskComments`
--

DROP TABLE IF EXISTS `ServiceDeskComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceDeskComments` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CommentId` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Reference` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FirstName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `IpAddress` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceDeskComments`
--

LOCK TABLES `ServiceDeskComments` WRITE;
/*!40000 ALTER TABLE `ServiceDeskComments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceDeskComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceDeskRequests`
--

DROP TABLE IF EXISTS `ServiceDeskRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceDeskRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Reference` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `FirstName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Type` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Url` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Importance` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ContactEmail` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Status` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Project` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Company` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Assignee` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `UpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceDeskRequests`
--

LOCK TABLES `ServiceDeskRequests` WRITE;
/*!40000 ALTER TABLE `ServiceDeskRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceDeskRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceRepairs`
--

DROP TABLE IF EXISTS `ServiceRepairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceRepairs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TractorHours` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `RegNumber` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Comments` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IpAddress` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceRepairs`
--

LOCK TABLES `ServiceRepairs` WRITE;
/*!40000 ALTER TABLE `ServiceRepairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServiceRepairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shippings`
--

DROP TABLE IF EXISTS `Shippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shippings` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `CartAmountGreaterThan` decimal(10,2) unsigned DEFAULT NULL,
  `AllowDiscounts` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Weight` decimal(10,2) unsigned DEFAULT NULL,
  `Value` decimal(10,2) unsigned DEFAULT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Countries` text COLLATE utf8_unicode_ci,
  `DateFrom` datetime DEFAULT '0000-00-00 00:00:00',
  `DateTo` datetime DEFAULT '0000-00-00 00:00:00',
  `IsClickCollect` tinyint(3) unsigned DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Shop shipping costs';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shippings`
--

LOCK TABLES `Shippings` WRITE;
/*!40000 ALTER TABLE `Shippings` DISABLE KEYS */;
INSERT INTO `Shippings` VALUES (3,3,'Ireland','',0.00,'Y',0.00,10.00,1,', ie, ','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(7,7,'UK','',0.00,'Y',0.00,15.00,1,', gb, ','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(8,8,'Europe','',0.00,'Y',0.00,20.00,1,', al, ad, am, at, az, by, be, ba, bg, hr, cy, cz, dk, ee, fi, fr, ge, de, gr, hu, is, it, lv, li, lt, lu, mk, mt, md, mc, nl, no, pl, pt, ro, ru, sm, sk, si, es, se, ch, tr, ua, ','0000-00-00 00:00:00','0000-00-00 00:00:00',0),(9,9,'Rest of World','',0.00,'Y',0.00,25.00,1,', bf, cm, ky, cl, cc, cg, ck, ci, dj, dm, tp, ec, sv, gq, et, fo, fj, gf, pf, tf, ga, gm, gh, gi, gl, gd, gp, gu, gt, gn, gw, gy, ht, hm, va, hn, hk, ir, iq, jm, jo, kz, ke, ki, kp, kr, kw, kg, la, ls, ly, mo, mg, mv, ml, mh, mr, mu, yt, mx, fm, md, mn, ms, mz, mm, na, nr, np, an, nc, nz, ni, ne, ng, nu, nf, mp, om, pk, pw, ps, pa, pg, pe, ph, pn, pl, pr, qa, re, ru, rw, sh, kn, lc, pm, vc, ws, st, sa, sn, sc, sl, sg, sb, so, za, gs, lk, sd, sr, sj, sz, sy, tw, tj, tz, th, tg, tk, to, tt, tn, tm, tc, tv, ug, ae, us, um, uy, uz, vu, ve, vg, vi, vn, wf, eh, ye, yu, zm, zw, ','0000-00-00 00:00:00','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `Shippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shooters`
--

DROP TABLE IF EXISTS `Shooters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shooters` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MemberNumber` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `FirstName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DOB` date NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `GDPR` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `CoC` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Affiliation` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Class` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Category` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shooters`
--

LOCK TABLES `Shooters` WRITE;
/*!40000 ALTER TABLE `Shooters` DISABLE KEYS */;
/*!40000 ALTER TABLE `Shooters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShootingEntries`
--

DROP TABLE IF EXISTS `ShootingEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShootingEntries` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Code` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `ShooterId` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Competition` enum('S','P','W') COLLATE utf8_unicode_ci NOT NULL,
  `Date` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Time` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Squad` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Peg` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TimeBooked` datetime DEFAULT NULL,
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShootingEntries`
--

LOCK TABLES `ShootingEntries` WRITE;
/*!40000 ALTER TABLE `ShootingEntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShootingEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowAnimalsAccommodations`
--

DROP TABLE IF EXISTS `ShowAnimalsAccommodations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowAnimalsAccommodations` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(11) unsigned NOT NULL,
  `Dairy` int(11) NOT NULL,
  `Other` int(11) NOT NULL,
  `Price` decimal(5,2) NOT NULL,
  `Created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `User ID` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowAnimalsAccommodations`
--

LOCK TABLES `ShowAnimalsAccommodations` WRITE;
/*!40000 ALTER TABLE `ShowAnimalsAccommodations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowAnimalsAccommodations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClasses`
--

DROP TABLE IF EXISTS `ShowCompetitionClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClasses` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryId` int(10) unsigned NOT NULL,
  `Number` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `StartTime` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `EntryFee` decimal(10,2) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Featured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PrizeFundEnabled` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `PrizeFundAmount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `PrizeType` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ShowPrizeOverride` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ShowSponsorOverride` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QualNote` text COLLATE utf8_unicode_ci NOT NULL,
  `RingArena` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Footnotes` text COLLATE utf8_unicode_ci NOT NULL,
  `EntryConditions` enum('none','championship','day-only','no-pre-entry','no-direct-entry','no-online-entry') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `EntrantAge` enum('adult','youth','open','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `LevyPercentage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UploadImageMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UploadImageMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UploadVideoMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UploadVideoMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UploadFileMax` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UploadFileMin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EntryFieldsX` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ShowNationalTagNo` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BankPayouts` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ResultsStatus` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  `PublicVote` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ShowVotes` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Id`),
  KEY `Number` (`Number`),
  KEY `CategoryId` (`CategoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClasses`
--

LOCK TABLES `ShowCompetitionClasses` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesCategories`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesCategories` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Parent` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `OpeningNote` text COLLATE utf8_unicode_ci NOT NULL,
  `ClosingNote` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `StartTime` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `EntryFee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Location` text COLLATE utf8_unicode_ci NOT NULL,
  `ShowSponsors` tinyint(3) NOT NULL DEFAULT '1',
  `ShowPrizes` tinyint(3) NOT NULL DEFAULT '1',
  `ClassEntryFields` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BusinessDetails` tinyint(3) NOT NULL DEFAULT '0',
  `Users` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `StaffId` int(10) DEFAULT '0',
  `BankPayouts` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ShowHerdNumber` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MetaTitle` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesCategories`
--

LOCK TABLES `ShowCompetitionClassesCategories` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesFieldsAnimals`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesFieldsAnimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesFieldsAnimals` (
  `EntryId` int(10) unsigned NOT NULL,
  `FieldNo` int(10) unsigned NOT NULL DEFAULT '1',
  `AnimalName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NationalTag` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sire` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Dam` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BirthDate` date NOT NULL,
  `ExhibitorBirthDate` date NOT NULL,
  `HerdNo` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BordBia` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Owner` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Rider` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SJAI` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PremisesRegNo` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sex` enum('gelding','colt','filly','mare','male','female','stallion') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Colour` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Age` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Breed` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BreederName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PassportNo` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VehicleRegNo` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HerdOwner` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HerdOwnerAddress` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HerdOwnerPostcode` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HerdName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KiddingDate` char(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FirstKidder` enum('','Yes','No') COLLATE utf8_unicode_ci DEFAULT '',
  `RunningThrough` enum('','Yes','No') COLLATE utf8_unicode_ci DEFAULT '',
  `RegistrationNumber` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `Number` (`EntryId`,`FieldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesFieldsAnimals`
--

LOCK TABLES `ShowCompetitionClassesFieldsAnimals` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsAnimals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsAnimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesFieldsDogs`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesFieldsDogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesFieldsDogs` (
  `EntryId` int(10) unsigned NOT NULL,
  `FieldNo` int(10) unsigned NOT NULL DEFAULT '1',
  `AnimalName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Breed` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `Number` (`EntryId`,`FieldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesFieldsDogs`
--

LOCK TABLES `ShowCompetitionClassesFieldsDogs` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsDogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsDogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesFieldsFloral`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesFieldsFloral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesFieldsFloral` (
  `EntryId` int(10) unsigned NOT NULL,
  `FieldNo` int(10) unsigned NOT NULL DEFAULT '1',
  `FlowerClub` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `Number` (`EntryId`,`FieldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesFieldsFloral`
--

LOCK TABLES `ShowCompetitionClassesFieldsFloral` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsFloral` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsFloral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesFieldsInventions`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesFieldsInventions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesFieldsInventions` (
  `EntryId` int(10) unsigned NOT NULL,
  `FieldNo` int(10) unsigned NOT NULL DEFAULT '1',
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `InventionName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BirthDate` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  UNIQUE KEY `Number` (`EntryId`,`FieldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesFieldsInventions`
--

LOCK TABLES `ShowCompetitionClassesFieldsInventions` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsInventions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsInventions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesFieldsPoultry`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesFieldsPoultry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesFieldsPoultry` (
  `EntryId` int(10) unsigned NOT NULL,
  `FieldNo` int(10) unsigned NOT NULL DEFAULT '1',
  `FlockNo` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FlockOwner` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Breed` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Sex` enum('male','female') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Colour` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Size` enum('large','bantam') COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `Number` (`EntryId`,`FieldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesFieldsPoultry`
--

LOCK TABLES `ShowCompetitionClassesFieldsPoultry` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsPoultry` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsPoultry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesFieldsSchools`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesFieldsSchools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesFieldsSchools` (
  `EntryId` int(10) unsigned NOT NULL,
  `FieldNo` int(10) unsigned NOT NULL DEFAULT '1',
  `ChildName` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TeacherName` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SchoolName` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SchoolYear` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `Number` (`EntryId`,`FieldNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesFieldsSchools`
--

LOCK TABLES `ShowCompetitionClassesFieldsSchools` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsSchools` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesFieldsSchools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionClassesPublicVotes`
--

DROP TABLE IF EXISTS `ShowCompetitionClassesPublicVotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionClassesPublicVotes` (
  `ClassId` int(10) unsigned NOT NULL,
  `EntryId` int(10) unsigned NOT NULL,
  `IpAddress` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Received` int(10) NOT NULL,
  KEY `ClassId_EntryId` (`ClassId`,`EntryId`),
  KEY `IpAddress` (`IpAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionClassesPublicVotes`
--

LOCK TABLES `ShowCompetitionClassesPublicVotes` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionClassesPublicVotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionClassesPublicVotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionFeederClasses`
--

DROP TABLE IF EXISTS `ShowCompetitionFeederClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionFeederClasses` (
  `ChampionshipClassId` int(10) unsigned NOT NULL,
  `FeederClassId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ChampionshipClassId`,`FeederClassId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Establish feeder classes for championships';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionFeederClasses`
--

LOCK TABLES `ShowCompetitionFeederClasses` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionFeederClasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionFeederClasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionPrizes`
--

DROP TABLE IF EXISTS `ShowCompetitionPrizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionPrizes` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ClassId` int(10) unsigned NOT NULL,
  `Type` enum('cash','cup','in-kind','medal','merch','plaque','rosette','rosette-special','sash','trophy','voucher') COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Rank` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `LevyPercentage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `ClassId` (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionPrizes`
--

LOCK TABLES `ShowCompetitionPrizes` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionPrizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionPrizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowCompetitionPrizesAwarded`
--

DROP TABLE IF EXISTS `ShowCompetitionPrizesAwarded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowCompetitionPrizesAwarded` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntryId` int(10) unsigned NOT NULL,
  `ClassId` int(10) unsigned NOT NULL,
  `Rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Unique` (`ClassId`,`Rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowCompetitionPrizesAwarded`
--

LOCK TABLES `ShowCompetitionPrizesAwarded` WRITE;
/*!40000 ALTER TABLE `ShowCompetitionPrizesAwarded` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowCompetitionPrizesAwarded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowContactRoles`
--

DROP TABLE IF EXISTS `ShowContactRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowContactRoles` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(110) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(110) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowContactRoles`
--

LOCK TABLES `ShowContactRoles` WRITE;
/*!40000 ALTER TABLE `ShowContactRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowContactRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowDirectory`
--

DROP TABLE IF EXISTS `ShowDirectory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowDirectory` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ShowName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Region` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `StartDate` date DEFAULT NULL,
  `StartTime` time DEFAULT NULL,
  `FinishDate` date DEFAULT NULL,
  `FinishTime` time DEFAULT NULL,
  `Description` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `About` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Website` char(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ShowAddress` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ShowStreet` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ShowTown` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ShowCounty` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ShowEircode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Latitude` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Longitude` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeAddress` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OfficeStreet` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeTown` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeCounty` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeEircode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeLat` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeLong` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HideMap` tinyint(3) NOT NULL DEFAULT '0',
  `OfficePhone` char(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OfficeMobile` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OfficeEmail` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Active` tinyint(3) NOT NULL DEFAULT '1',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Facebook` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Twitter` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Instagram` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowDirectory`
--

LOCK TABLES `ShowDirectory` WRITE;
/*!40000 ALTER TABLE `ShowDirectory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowDirectory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowDirectoryContacts`
--

DROP TABLE IF EXISTS `ShowDirectoryContacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowDirectoryContacts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Role` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HidePhone` tinyint(3) NOT NULL DEFAULT '0',
  `Mobile` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HideMobile` tinyint(3) NOT NULL DEFAULT '0',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HideEmail` tinyint(3) NOT NULL DEFAULT '0',
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Country` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HideAddress` tinyint(3) NOT NULL DEFAULT '0',
  `Facebook` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Twitter` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Instagram` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `ShowId` int(10) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowDirectoryContacts`
--

LOCK TABLES `ShowDirectoryContacts` WRITE;
/*!40000 ALTER TABLE `ShowDirectoryContacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowDirectoryContacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowDirectorysKeys`
--

DROP TABLE IF EXISTS `ShowDirectorysKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowDirectorysKeys` (
  `ShowId` int(10) unsigned NOT NULL,
  `KeyId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`ShowId`,`KeyId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ShowDirectory disciplines (JOIN ShowDirectory to ShowEventKeys)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowDirectorysKeys`
--

LOCK TABLES `ShowDirectorysKeys` WRITE;
/*!40000 ALTER TABLE `ShowDirectorysKeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowDirectorysKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowEntries`
--

DROP TABLE IF EXISTS `ShowEntries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowEntries` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ContactId` int(10) unsigned NOT NULL,
  `ClassId` int(10) unsigned NOT NULL,
  `EntryNo` int(10) unsigned DEFAULT NULL,
  `Notes` text COLLATE utf8_unicode_ci,
  `PrintedNotes` text COLLATE utf8_unicode_ci,
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CopyOf` int(10) unsigned DEFAULT NULL,
  `Status` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `Excluded` int(10) unsigned DEFAULT NULL,
  `Finished` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Flagged` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`Id`),
  KEY `UserId` (`ContactId`),
  KEY `ClassId` (`ClassId`),
  KEY `CopyOf` (`CopyOf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowEntries`
--

LOCK TABLES `ShowEntries` WRITE;
/*!40000 ALTER TABLE `ShowEntries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowEntries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowEventKeys`
--

DROP TABLE IF EXISTS `ShowEventKeys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowEventKeys` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `DKey` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Description` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CategoryId` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowEventKeys`
--

LOCK TABLES `ShowEventKeys` WRITE;
/*!40000 ALTER TABLE `ShowEventKeys` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowEventKeys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowJudges`
--

DROP TABLE IF EXISTS `ShowJudges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowJudges` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastName` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Role` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Type` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Fees` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address1` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Address2` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Town` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `County` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Postcode` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Accommodation` text COLLATE utf8_unicode_ci NOT NULL,
  `Transport` text COLLATE utf8_unicode_ci NOT NULL,
  `Travel` text COLLATE utf8_unicode_ci NOT NULL,
  `Food` text COLLATE utf8_unicode_ci,
  `Other` text COLLATE utf8_unicode_ci,
  `AccomodationCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TransportCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FoodCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OtherCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TotalCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowJudges`
--

LOCK TABLES `ShowJudges` WRITE;
/*!40000 ALTER TABLE `ShowJudges` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowJudges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowJudgesNotes`
--

DROP TABLE IF EXISTS `ShowJudgesNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowJudgesNotes` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `JudgeId` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ClassId` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Notes` text COLLATE utf8_unicode_ci,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowJudgesNotes`
--

LOCK TABLES `ShowJudgesNotes` WRITE;
/*!40000 ALTER TABLE `ShowJudgesNotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowJudgesNotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowJudging`
--

DROP TABLE IF EXISTS `ShowJudging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowJudging` (
  `ClassId` int(10) unsigned NOT NULL,
  `JudgeId` int(10) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`ClassId`,`JudgeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowJudging`
--

LOCK TABLES `ShowJudging` WRITE;
/*!40000 ALTER TABLE `ShowJudging` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowJudging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowSponsored`
--

DROP TABLE IF EXISTS `ShowSponsored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowSponsored` (
  `ClassId` int(10) unsigned NOT NULL DEFAULT '0',
  `CategoryId` int(10) unsigned NOT NULL DEFAULT '0',
  `SponsorId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ClassId`,`CategoryId`,`SponsorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowSponsored`
--

LOCK TABLES `ShowSponsored` WRITE;
/*!40000 ALTER TABLE `ShowSponsored` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowSponsored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowSponsors`
--

DROP TABLE IF EXISTS `ShowSponsors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowSponsors` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Position` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Url` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ContactName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address1` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address2` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Postcode` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Notes` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowSponsors`
--

LOCK TABLES `ShowSponsors` WRITE;
/*!40000 ALTER TABLE `ShowSponsors` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowSponsors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowStewards`
--

DROP TABLE IF EXISTS `ShowStewards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowStewards` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastName` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Role` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Type` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Fees` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Address1` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Address2` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Town` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `County` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Postcode` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Country` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Accommodation` text COLLATE utf8_unicode_ci,
  `Transport` text COLLATE utf8_unicode_ci,
  `Food` text COLLATE utf8_unicode_ci,
  `Other` text COLLATE utf8_unicode_ci,
  `AccomodationCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TransportCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FoodCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OtherCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TotalCosts` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowStewards`
--

LOCK TABLES `ShowStewards` WRITE;
/*!40000 ALTER TABLE `ShowStewards` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowStewards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTickets`
--

DROP TABLE IF EXISTS `ShowTickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTickets` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `Price` decimal(4,2) unsigned NOT NULL,
  `Qty` int(10) unsigned NOT NULL,
  `Created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Sent` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTickets`
--

LOCK TABLES `ShowTickets` WRITE;
/*!40000 ALTER TABLE `ShowTickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandAddons`
--

DROP TABLE IF EXISTS `ShowTradeStandAddons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandAddons` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Notes` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandAddons`
--

LOCK TABLES `ShowTradeStandAddons` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandAddons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandAddons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandAddonsBooked`
--

DROP TABLE IF EXISTS `ShowTradeStandAddonsBooked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandAddonsBooked` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApplicationId` int(10) unsigned NOT NULL DEFAULT '0',
  `AddonId` int(10) unsigned NOT NULL DEFAULT '0',
  `Amount` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandAddonsBooked`
--

LOCK TABLES `ShowTradeStandAddonsBooked` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandAddonsBooked` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandAddonsBooked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandApplications`
--

DROP TABLE IF EXISTS `ShowTradeStandApplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandApplications` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `Configuration` enum('','s','b','o') COLLATE utf8_unicode_ci NOT NULL,
  `Requirements` text COLLATE utf8_unicode_ci NOT NULL,
  `Information` text COLLATE utf8_unicode_ci NOT NULL,
  `TermsConditions` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LitterPower` tinyint(3) unsigned DEFAULT '0',
  `Area` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ExtraSpace` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `AreaAllocated` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `SSEnd` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SSEndDouble` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `StdSection` int(10) unsigned NOT NULL DEFAULT '0',
  `OtherStands` int(10) unsigned NOT NULL DEFAULT '0',
  `PowerSupplies` tinyint(3) unsigned NOT NULL,
  `StandStructure` text COLLATE utf8_unicode_ci NOT NULL,
  `ProductsServices` text COLLATE utf8_unicode_ci NOT NULL,
  `BusinessDescription` text COLLATE utf8_unicode_ci NOT NULL,
  `PromotionalActivity` text COLLATE utf8_unicode_ci NOT NULL,
  `PersonalPosition` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsuranceCompany` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsuranceBroker` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsurancePolicyNumber` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `InsurancePhone` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `InsuranceExpiry` date NOT NULL,
  `ExtraTickets` tinyint(3) unsigned NOT NULL,
  `AllocationLetter` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AllocationNumber` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AdminNotes` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PromotionalTickets` tinyint(3) NOT NULL DEFAULT '0',
  `ChequeNumber` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChequeCustomerName` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChequeCmyName` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ApplicationComplete` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TradePackSent` date DEFAULT NULL,
  `InsuranceAdmin` enum('undefined','absent','incorrect','correct') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'undefined',
  `InsuranceNotes` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandApplications`
--

LOCK TABLES `ShowTradeStandApplications` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandApplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandApplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandApplicationsReuse`
--

DROP TABLE IF EXISTS `ShowTradeStandApplicationsReuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandApplicationsReuse` (
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `Information` text COLLATE utf8_unicode_ci NOT NULL,
  `ProductsServices` text COLLATE utf8_unicode_ci NOT NULL,
  `BusinessDescription` text COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UserId` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandApplicationsReuse`
--

LOCK TABLES `ShowTradeStandApplicationsReuse` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandApplicationsReuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandApplicationsReuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandAreas`
--

DROP TABLE IF EXISTS `ShowTradeStandAreas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandAreas` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Notes` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `IsFood` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandAreas`
--

LOCK TABLES `ShowTradeStandAreas` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandAreas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandAreas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandTypes`
--

DROP TABLE IF EXISTS `ShowTradeStandTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `AreaId` int(10) unsigned NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Notes` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandTypes`
--

LOCK TABLES `ShowTradeStandTypes` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShowTradeStandTypesBooked`
--

DROP TABLE IF EXISTS `ShowTradeStandTypesBooked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShowTradeStandTypesBooked` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApplicationId` int(10) unsigned NOT NULL DEFAULT '0',
  `StandTypeId` int(10) unsigned NOT NULL DEFAULT '0',
  `Amount` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShowTradeStandTypesBooked`
--

LOCK TABLES `ShowTradeStandTypesBooked` WRITE;
/*!40000 ALTER TABLE `ShowTradeStandTypesBooked` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShowTradeStandTypesBooked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SocialMedia`
--

DROP TABLE IF EXISTS `SocialMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocialMedia` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Links to our presense on other sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SocialMedia`
--

LOCK TABLES `SocialMedia` WRITE;
/*!40000 ALTER TABLE `SocialMedia` DISABLE KEYS */;
INSERT INTO `SocialMedia` VALUES (1,'Twitter','https://twitter.com/abbeymachinery?lang=en',1),(2,'Facebook','https://www.facebook.com/AbbeyMachinery/',1),(3,'YouTube','https://www.youtube.com/channel/UCD--peq5msr1DFGz_z6F1OQ',1),(4,'LinkedIn','http://www.example.net',0),(5,'Google+','http://www.example.net',0),(6,'MySpace','http://www.example.net',0),(7,'RSS','http://www.example.net',0),(8,'Pinterest','http://www.example.net',0),(9,'Instagram','http://www.example.net',0);
/*!40000 ALTER TABLE `SocialMedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SocialNetworks`
--

DROP TABLE IF EXISTS `SocialNetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocialNetworks` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SocialNetworks`
--

LOCK TABLES `SocialNetworks` WRITE;
/*!40000 ALTER TABLE `SocialNetworks` DISABLE KEYS */;
/*!40000 ALTER TABLE `SocialNetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SocialNetworksLinks`
--

DROP TABLE IF EXISTS `SocialNetworksLinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SocialNetworksLinks` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ItemType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ItemId` int(10) unsigned DEFAULT '0',
  `NetworkId` int(10) unsigned DEFAULT '0',
  `NetworkLink` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SocialNetworksLinks`
--

LOCK TABLES `SocialNetworksLinks` WRITE;
/*!40000 ALTER TABLE `SocialNetworksLinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `SocialNetworksLinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socicities`
--

DROP TABLE IF EXISTS `Socicities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Socicities` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socicities`
--

LOCK TABLES `Socicities` WRITE;
/*!40000 ALTER TABLE `Socicities` DISABLE KEYS */;
/*!40000 ALTER TABLE `Socicities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SolarFundingPartners`
--

DROP TABLE IF EXISTS `SolarFundingPartners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SolarFundingPartners` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CompanyName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `SolarSystemInstalled` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `PartnershipType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IpAddress` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SolarFundingPartners`
--

LOCK TABLES `SolarFundingPartners` WRITE;
/*!40000 ALTER TABLE `SolarFundingPartners` DISABLE KEYS */;
/*!40000 ALTER TABLE `SolarFundingPartners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SolarRequests`
--

DROP TABLE IF EXISTS `SolarRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SolarRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FirstName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `County` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Eircode` char(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AverageBill` char(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PVSolar` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `BatteryBox` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ResidentialGrant` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `SystemType` char(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CommercialContracts` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `IpAddress` char(55) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SolarRequests`
--

LOCK TABLES `SolarRequests` WRITE;
/*!40000 ALTER TABLE `SolarRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `SolarRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsorships`
--

DROP TABLE IF EXISTS `Sponsorships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sponsorships` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SponsoredId` int(10) NOT NULL DEFAULT '0',
  `FirstName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Message` text COLLATE utf8_unicode_ci,
  `Amount` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `OrderId` int(10) NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Size` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsorships`
--

LOCK TABLES `Sponsorships` WRITE;
/*!40000 ALTER TABLE `Sponsorships` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sponsorships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SportClubLocations`
--

DROP TABLE IF EXISTS `SportClubLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SportClubLocations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClubId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SportClubLocations`
--

LOCK TABLES `SportClubLocations` WRITE;
/*!40000 ALTER TABLE `SportClubLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `SportClubLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SportClubs`
--

DROP TABLE IF EXISTS `SportClubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SportClubs` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SportClubs`
--

LOCK TABLES `SportClubs` WRITE;
/*!40000 ALTER TABLE `SportClubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `SportClubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Staff` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `StartDate` date DEFAULT NULL,
  `Role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Mobile` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Type` text COLLATE utf8_unicode_ci,
  `Pages` text COLLATE utf8_unicode_ci,
  `ShowCompetitionClassesCategories` text COLLATE utf8_unicode_ci,
  `Extension` int(3) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffProductsTypes`
--

DROP TABLE IF EXISTS `StaffProductsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaffProductsTypes` (
  `StaffId` int(10) unsigned NOT NULL,
  `ProdTypeId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`StaffId`,`ProdTypeId`),
  KEY `StaffId` (`StaffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Staff Product Types (JOIN Staff to ProductsTypes)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffProductsTypes`
--

LOCK TABLES `StaffProductsTypes` WRITE;
/*!40000 ALTER TABLE `StaffProductsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffProductsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffSocialMedia`
--

DROP TABLE IF EXISTS `StaffSocialMedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaffSocialMedia` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `StaffId` int(10) DEFAULT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Links to social media for staff members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffSocialMedia`
--

LOCK TABLES `StaffSocialMedia` WRITE;
/*!40000 ALTER TABLE `StaffSocialMedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffSocialMedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaffTypes`
--

DROP TABLE IF EXISTS `StaffTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaffTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For different types of staff';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaffTypes`
--

LOCK TABLES `StaffTypes` WRITE;
/*!40000 ALTER TABLE `StaffTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `StaffTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Statuses`
--

DROP TABLE IF EXISTS `Statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Statuses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(40) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Statuses`
--

LOCK TABLES `Statuses` WRITE;
/*!40000 ALTER TABLE `Statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sticker`
--

DROP TABLE IF EXISTS `Sticker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sticker` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sticker`
--

LOCK TABLES `Sticker` WRITE;
/*!40000 ALTER TABLE `Sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sticker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StreamingLinks`
--

DROP TABLE IF EXISTS `StreamingLinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StreamingLinks` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ItemType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ItemId` int(10) unsigned DEFAULT '0',
  `PlatformId` int(10) unsigned DEFAULT '0',
  `PlatformItemId` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `PlatformItemLink` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StreamingLinks`
--

LOCK TABLES `StreamingLinks` WRITE;
/*!40000 ALTER TABLE `StreamingLinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `StreamingLinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StreamingPlatforms`
--

DROP TABLE IF EXISTS `StreamingPlatforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StreamingPlatforms` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StreamingPlatforms`
--

LOCK TABLES `StreamingPlatforms` WRITE;
/*!40000 ALTER TABLE `StreamingPlatforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `StreamingPlatforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StripePaymentRecord`
--

DROP TABLE IF EXISTS `StripePaymentRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StripePaymentRecord` (
  `OrderId` int(10) unsigned NOT NULL,
  `ChargeId` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CardBrand` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CardType` enum('amex','diners','laser','mc','mc/debit','switch','uatp','visa','visa/debit','other') COLLATE utf8_unicode_ci NOT NULL COMMENT 'For Order list view',
  `CardName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `CardCountry` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `CardCvcCheck` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `CardDigits` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `Message` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ReceiptUrl` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StripePaymentRecord`
--

LOCK TABLES `StripePaymentRecord` WRITE;
/*!40000 ALTER TABLE `StripePaymentRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `StripePaymentRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StyleOptions`
--

DROP TABLE IF EXISTS `StyleOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StyleOptions` (
  `Table` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Item` int(11) NOT NULL,
  `Stylesheet` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChildrenColumns` int(10) DEFAULT NULL,
  `ChildrenImageWidth` int(10) DEFAULT NULL,
  `ChildrenImageHeight` int(10) DEFAULT NULL,
  `ChildrenImageShow` enum('above','below','none') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ChildrenContentShow` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `TopGalleryType` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TitleGalleryType` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GalleryType` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GalleryPosition` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GalleryOrientation` tinyint(3) NOT NULL DEFAULT '0',
  `TitleImageWidth` int(10) DEFAULT NULL,
  `ImageWidth` int(10) DEFAULT NULL,
  `BorderWidth` int(10) DEFAULT NULL,
  `BorderColour` int(10) DEFAULT NULL,
  `Crop` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fit` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT NULL,
  `RatioX` int(10) DEFAULT NULL,
  `RatioY` int(10) DEFAULT NULL,
  `TitleRatioX` int(10) DEFAULT NULL,
  `TitleRatioY` int(10) DEFAULT NULL,
  `StdGap` int(10) DEFAULT NULL,
  `StdCols` int(11) DEFAULT NULL,
  `FadingFrequency` int(10) DEFAULT NULL,
  `FadingPause` int(10) DEFAULT NULL,
  `LightboxCols` int(10) DEFAULT NULL,
  `LightboxThumbWidth` int(10) DEFAULT NULL,
  `ProductsDisplay` enum('table','list','imagelist') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProductsColumns` tinyint(3) DEFAULT NULL,
  `WrapText` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `Subpages` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MenuDepth` tinyint(4) DEFAULT NULL,
  `MegaMenuChildren` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PageLayout` char(100) COLLATE utf8_unicode_ci DEFAULT 'standard',
  UNIQUE KEY `Linking` (`Table`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Style Options for Pages, Products, News, Events, etc.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StyleOptions`
--

LOCK TABLES `StyleOptions` WRITE;
/*!40000 ALTER TABLE `StyleOptions` DISABLE KEYS */;
INSERT INTO `StyleOptions` VALUES ('Pages',246,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',248,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',249,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',250,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',251,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',253,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',254,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',255,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',256,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',257,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',258,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',259,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',260,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',261,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',263,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',265,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',266,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',267,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',268,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',269,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',270,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',271,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',272,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',273,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',274,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',275,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',276,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',277,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',278,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',279,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',280,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',281,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',282,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',283,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',284,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',285,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',286,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard'),('Pages',287,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'N',NULL,NULL,NULL,'standard');
/*!40000 ALTER TABLE `StyleOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubAccounts`
--

DROP TABLE IF EXISTS `SubAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubAccounts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `CompanyName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `BusinessType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `VATorPPS` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Address` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressStreet` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressTown` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCounty` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `AddressCountry` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `AddressPostcode` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `FirmTelephone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `FirmFax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `FirmEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `FirmWebsite` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalNameFirst` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalNameLast` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalEmail` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PersonalTelephone` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ReceivePrizes` enum('receive','donate','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `BankAccountName` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IBAN` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `BIC` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PaymentComplete` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AboutUs` text COLLATE utf8_unicode_ci,
  `CompanyCategoryId` int(10) DEFAULT '0',
  `MemberNumber` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubAccounts`
--

LOCK TABLES `SubAccounts` WRITE;
/*!40000 ALTER TABLE `SubAccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubAccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEvents`
--

DROP TABLE IF EXISTS `SuperEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEvents` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TypeId` int(4) NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Date` datetime NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Location` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MapsLat` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MapsLong` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ClosingDate` datetime DEFAULT NULL,
  `RequiresPayment` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEvents`
--

LOCK TABLES `SuperEvents` WRITE;
/*!40000 ALTER TABLE `SuperEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsAnimals`
--

DROP TABLE IF EXISTS `SuperEventsAnimals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsAnimals` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `RiderFirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `RiderLastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `RiderReg` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HorseName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Owner` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Club` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `HorseReg` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HorsePassport` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Sire` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Dame` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `EquinePremises` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `IpAddress` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsAnimals`
--

LOCK TABLES `SuperEventsAnimals` WRITE;
/*!40000 ALTER TABLE `SuperEventsAnimals` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsAnimals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsClasses`
--

DROP TABLE IF EXISTS `SuperEventsClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsClasses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventId` int(10) NOT NULL DEFAULT '0',
  `Number` int(10) NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Fee` decimal(10,2) DEFAULT '0.00',
  `CategoryId` int(10) NOT NULL DEFAULT '0',
  `StartTime` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `EntrantsInterval` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MaxEntrants` int(10) NOT NULL DEFAULT '0',
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  `Test` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ListConditions` text COLLATE utf8_unicode_ci,
  `TeamMembers` tinyint(3) DEFAULT '1',
  `Extra1` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Extra2` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Extra1Fee` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Extra2Fee` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OptimalTime` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsClasses`
--

LOCK TABLES `SuperEventsClasses` WRITE;
/*!40000 ALTER TABLE `SuperEventsClasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsClasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsClassesCategories`
--

DROP TABLE IF EXISTS `SuperEventsClassesCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsClassesCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsClassesCategories`
--

LOCK TABLES `SuperEventsClassesCategories` WRITE;
/*!40000 ALTER TABLE `SuperEventsClassesCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsClassesCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsClassesFields`
--

DROP TABLE IF EXISTS `SuperEventsClassesFields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsClassesFields` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClassId` int(10) unsigned NOT NULL DEFAULT '0',
  `RiderNameField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `RiderRegField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `HorseNameField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `HorseRegField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `EquinePremisesField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `OwnerField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `SireField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `DameField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `ClubField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `HorsePassportField` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsClassesFields`
--

LOCK TABLES `SuperEventsClassesFields` WRITE;
/*!40000 ALTER TABLE `SuperEventsClassesFields` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsClassesFields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsEntrants`
--

DROP TABLE IF EXISTS `SuperEventsEntrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsEntrants` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `OrderId` int(10) NOT NULL DEFAULT '0',
  `ClassId` int(10) NOT NULL DEFAULT '0',
  `Number` int(10) DEFAULT '0',
  `FirstName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `RiderReg` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HorseName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Owner` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Club` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `HorseReg` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `HorsePassport` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Sire` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Dame` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `EquinePremises` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `StartTime` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `FinishTime` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Faults` int(10) NOT NULL DEFAULT '0',
  `Points` decimal(10,2) DEFAULT '0.00',
  `Position` int(10) NOT NULL DEFAULT '0',
  `IpAddress` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Validated` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `RunningOrder` int(10) DEFAULT '0',
  `Withdrawal` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `TeamId` int(10) DEFAULT '0',
  `TeamCode` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `TeamStartTime` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `Terms` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsEntrants`
--

LOCK TABLES `SuperEventsEntrants` WRITE;
/*!40000 ALTER TABLE `SuperEventsEntrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsEntrants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsEntrantsResults`
--

DROP TABLE IF EXISTS `SuperEventsEntrantsResults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsEntrantsResults` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EntrantId` int(10) DEFAULT '0',
  `ResultType` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `StartTime` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FinishTime` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Total` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Fault` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Note` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Place` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Time1` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Time2` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Faults1` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Faults2` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Score` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Coll` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Percent` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TeamStartTime` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `TeamFinishTime` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  `TeamFaults` char(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsEntrantsResults`
--

LOCK TABLES `SuperEventsEntrantsResults` WRITE;
/*!40000 ALTER TABLE `SuperEventsEntrantsResults` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsEntrantsResults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuperEventsTypes`
--

DROP TABLE IF EXISTS `SuperEventsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuperEventsTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Display` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuperEventsTypes`
--

LOCK TABLES `SuperEventsTypes` WRITE;
/*!40000 ALTER TABLE `SuperEventsTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuperEventsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupershowRegistrations`
--

DROP TABLE IF EXISTS `SupershowRegistrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupershowRegistrations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `ShowName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ShowDate` date DEFAULT NULL,
  `ISAGrade` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LaunchDate` date DEFAULT NULL,
  `CatalogueDate` date DEFAULT NULL,
  `ResultsDate` date DEFAULT NULL,
  `PayoutsDate` date DEFAULT NULL,
  `Categories` tinyint(5) unsigned DEFAULT '0',
  `Classes` tinyint(5) unsigned DEFAULT '0',
  `TradeStands` tinyint(5) unsigned DEFAULT '0',
  `Entries` tinyint(5) unsigned DEFAULT '0',
  `Turnover` int(7) unsigned DEFAULT '0',
  `Attendees` int(7) unsigned DEFAULT '0',
  `Numbering` enum('','Sequential','Other','Qualifiers') COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Facebook` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Instagram` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LinkedIn` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Twitter` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `PaymentGateway` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Hosting` text COLLATE utf8_unicode_ci,
  `Registration` text COLLATE utf8_unicode_ci,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupershowRegistrations`
--

LOCK TABLES `SupershowRegistrations` WRITE;
/*!40000 ALTER TABLE `SupershowRegistrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `SupershowRegistrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Suppliers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT '0',
  `OrderId` int(10) DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `TaxNumber` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Code` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Website` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Email` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Phone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactFirst` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactLast` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactEmail` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ContactPhone` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DisplayPhone` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `DisplayEmail` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'Y',
  `MapsLat` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `MapsLong` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Facebook` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Twitter` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Instagram` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TikTok` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SnapChat` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LinkedIn` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `IpAddress` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CreatedOn` datetime DEFAULT CURRENT_TIMESTAMP,
  `ExpirationDate` datetime DEFAULT NULL,
  `Approved` tinyint(3) DEFAULT '1',
  `ApprovalDeadline` datetime DEFAULT NULL,
  `Display` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuppliersCategories`
--

DROP TABLE IF EXISTS `SuppliersCategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuppliersCategories` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuppliersCategories`
--

LOCK TABLES `SuppliersCategories` WRITE;
/*!40000 ALTER TABLE `SuppliersCategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuppliersCategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SuppliersCategoriesSelected`
--

DROP TABLE IF EXISTS `SuppliersCategoriesSelected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SuppliersCategoriesSelected` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SupplierId` int(10) DEFAULT '0',
  `CategoryId` int(10) DEFAULT '0',
  `IsFeatured` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SuppliersCategoriesSelected`
--

LOCK TABLES `SuppliersCategoriesSelected` WRITE;
/*!40000 ALTER TABLE `SuppliersCategoriesSelected` DISABLE KEYS */;
/*!40000 ALTER TABLE `SuppliersCategoriesSelected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supports`
--

DROP TABLE IF EXISTS `Supports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supports` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Type` tinyint(3) unsigned NOT NULL,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Status` tinyint(3) unsigned NOT NULL,
  `Web` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `UserId` int(10) unsigned NOT NULL,
  `SupporterId` int(10) unsigned NOT NULL,
  `Submitted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'default CURRENT_TIMESTAMP but not auto-update timestamp',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Support queries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supports`
--

LOCK TABLES `Supports` WRITE;
/*!40000 ALTER TABLE `Supports` DISABLE KEYS */;
/*!40000 ALTER TABLE `Supports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SystemEmails`
--

DROP TABLE IF EXISTS `SystemEmails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SystemEmails` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `Source` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ToField` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Cco` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Subject` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Content` text COLLATE utf8_unicode_ci,
  `EmailSent` enum('Y','N') COLLATE utf8_unicode_ci DEFAULT 'N',
  `EmailSentOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SystemEmails`
--

LOCK TABLES `SystemEmails` WRITE;
/*!40000 ALTER TABLE `SystemEmails` DISABLE KEYS */;
/*!40000 ALTER TABLE `SystemEmails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taxes`
--

DROP TABLE IF EXISTS `Taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Taxes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Value` decimal(10,2) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taxes`
--

LOCK TABLES `Taxes` WRITE;
/*!40000 ALTER TABLE `Taxes` DISABLE KEYS */;
INSERT INTO `Taxes` VALUES (1,'VAT Rate','',23.00,1),(2,'Service Tax Rate','',13.50,1),(3,'No VAT','',0.00,1);
/*!40000 ALTER TABLE `Taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teachers`
--

DROP TABLE IF EXISTS `Teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teachers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `FirstName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `School` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Position` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Approved` tinyint(2) NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teachers`
--

LOCK TABLES `Teachers` WRITE;
/*!40000 ALTER TABLE `Teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Testimonials`
--

DROP TABLE IF EXISTS `Testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Testimonials` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Role` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Company` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Video` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Testimonials`
--

LOCK TABLES `Testimonials` WRITE;
/*!40000 ALTER TABLE `Testimonials` DISABLE KEYS */;
INSERT INTO `Testimonials` VALUES (1,'Desmond Fennell','','Beech Lodge, Ballyhide , Co. Carlow,','geoff','<p>We&rsquo;ve been using Abbey machinery for the past 30 years. We invest in Abbey Diet Feeders, Slurry Tankers, Toppers and Fertiliser Spreaders because Abbey listen to our needs and match our requirements on farm; as an Irish Company they understand Irish Farmers needs and they have unrivalled attention to detail, with a strong resale value</p>\r\n',1,1,''),(2,'Richard Westlake','','Mayflower Farms, Maungaturoto, New Zealand','richard-westlake','<p>&quot;Since I got the feeder it has required little servicing, apart from a bit of oil and grease. Overall, it&rsquo;s a strong, reliable and easy wagon to use, a good weighing system and very consistent mixing and feeding out. I would definitely recommend the Abbey mixer wagon to other farmers. It is a smart investment&quot;</p>\r\n\r\n<p><strong>Extra 60kg milk solids per cow and very low maintenance requirements</strong></p>\r\n\r\n<p>Richard Westlake has a 600 cow dairy herd and he supplies his milk year-round to the dairy at Maungaturoto.</p>\r\n\r\n<p>He bought an Abbey VF1850, with two side elevators and now sees the Abbey Feeder as a &ldquo;crucial part of his production system. I don&rsquo;t know how we&rsquo;d do without one now&rdquo; said Richard.</p>\r\n\r\n<p>&ldquo;I went for the Abbey because I&rsquo;d used a lot of their machines, when I was working as a contractor in the UK and still had friends over there who recommended them.</p>\r\n\r\n<p>It is a great machine which evenly mixes whatever we put in and feeds consistently over the whole trough. We know the first cow on the feed pad gets exactly the same mix as the heifer down the other end. We noticed a big difference in our milking, with the small cows producing the same amount as the larger cows. Across the board, we got 60kg milk solids increase per-cow-per- year and this goes a long way to paying back our investment in the machine&rdquo;.</p>\r\n\r\n<p>The variable speed on the belts means they can feed out at different speeds on each side of the wagon for different stock, whether they are on the feed pad or calving pad. &ldquo;Having two elevators also gives us a bit of security. If we happen to whack one of them off a fence post, we&rsquo;ve always got the other one. Around 5 tonne of feed is mixed and fed from the wagon each day &ndash; generally a large round bale of hay, combined with 3 tonnes of maize silage, 1.2 tonne of palm kernel and 350 kg molasses, plus minerals&rdquo;.</p>\r\n\r\n<p>Richard usually tows the mixer wagon behind his 115 HP tractor, but says his 95 HP tractor also handles it with ease, even with a full load of maize.</p>\r\n\r\n<p>&ldquo;Since I got the feeder it has required little servicing, apart from a bit of oil and grease. Overall, it&rsquo;s a strong, reliable and easy wagon to use, a good weighing system and very consistent mixing and feeding out. I would definitely recommend the Abbey mixer wagon to other farmers. It is a smart investment&rdquo;, concludes Richard.</p>\r\n',2,1,'');
/*!40000 ALTER TABLE `Testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestimonialsProjectsPortfolio`
--

DROP TABLE IF EXISTS `TestimonialsProjectsPortfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestimonialsProjectsPortfolio` (
  `TestimonialId` int(10) unsigned NOT NULL,
  `ProjectId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TestimonialId`,`ProjectId`),
  KEY `ProjectId` (`ProjectId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestimonialsProjectsPortfolio`
--

LOCK TABLES `TestimonialsProjectsPortfolio` WRITE;
/*!40000 ALTER TABLE `TestimonialsProjectsPortfolio` DISABLE KEYS */;
/*!40000 ALTER TABLE `TestimonialsProjectsPortfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestimonialsStaff`
--

DROP TABLE IF EXISTS `TestimonialsStaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestimonialsStaff` (
  `TestimonialId` int(10) unsigned NOT NULL,
  `StaffId` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestimonialsStaff`
--

LOCK TABLES `TestimonialsStaff` WRITE;
/*!40000 ALTER TABLE `TestimonialsStaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `TestimonialsStaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TextBlocks`
--

DROP TABLE IF EXISTS `TextBlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TextBlocks` (
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TextBlocks`
--

LOCK TABLES `TextBlocks` WRITE;
/*!40000 ALTER TABLE `TextBlocks` DISABLE KEYS */;
INSERT INTO `TextBlocks` VALUES ('checkout-message',''),('deferred-payment-option',''),('deferred-payment-selected',''),('invoice-message',''),('invoice-message-final','');
/*!40000 ALTER TABLE `TextBlocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Themes`
--

DROP TABLE IF EXISTS `Themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Themes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `BodyBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BodyFontFamily` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ContentBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ContentColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H1Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H1FontFamily` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `H2Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H2FontFamily` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `H3Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H3FontFamily` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `H4Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H4FontFamily` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `H5Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H5FontFamily` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `H6Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H6FontFamily` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `H7Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `H7FontFamily` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `LinkColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BoldColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TopBarHeight` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TopBannerHeight` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Extra` text COLLATE utf8_unicode_ci NOT NULL,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  `BodyBgImage` int(11) NOT NULL,
  `ContentBgImage` int(11) NOT NULL,
  `ActiveMenu` int(3) NOT NULL,
  `ActiveFooter` int(3) NOT NULL,
  `ActiveGallery` int(3) NOT NULL,
  `ActiveGeneral` int(3) NOT NULL,
  `ActiveEvent` int(3) NOT NULL,
  `ActiveNews` int(3) NOT NULL,
  `ActiveProduct` int(3) NOT NULL,
  `ActiveChildren` int(3) NOT NULL,
  `ActiveBrand` int(3) NOT NULL,
  `ActiveTestimonials` int(3) NOT NULL,
  `ActiveClient` int(3) NOT NULL,
  `ActiveStaff` int(3) NOT NULL,
  `ActiveDocuments` int(3) NOT NULL,
  `ActiveLinks` int(3) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UniqueName` (`Name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Themes`
--

LOCK TABLES `Themes` WRITE;
/*!40000 ALTER TABLE `Themes` DISABLE KEYS */;
INSERT INTO `Themes` VALUES (1,'','weather','','','','','','','','','','','','','','','','','','','','','','','','',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `Themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesClasses`
--

DROP TABLE IF EXISTS `ThemesClasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesClasses` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `BgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderWidth` tinyint(2) DEFAULT NULL,
  `Padding` tinyint(2) DEFAULT NULL,
  `LinkColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ImgBorderColor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `SummaryColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TitleColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Extra` text COLLATE utf8_unicode_ci,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  `BgImage` int(11) NOT NULL,
  `ThemeId` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesClasses`
--

LOCK TABLES `ThemesClasses` WRITE;
/*!40000 ALTER TABLE `ThemesClasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesClasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesConfig`
--

DROP TABLE IF EXISTS `ThemesConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesConfig` (
  `ThemeId` int(10) DEFAULT NULL,
  `Name` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesConfig`
--

LOCK TABLES `ThemesConfig` WRITE;
/*!40000 ALTER TABLE `ThemesConfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesConfigImages`
--

DROP TABLE IF EXISTS `ThemesConfigImages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesConfigImages` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ThemeId` int(10) DEFAULT NULL,
  `Source` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `Item` int(10) unsigned DEFAULT NULL,
  `Target` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Caption` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `TitleText` text COLLATE utf8_unicode_ci,
  `AltText` text COLLATE utf8_unicode_ci,
  `Link` char(200) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `Position` int(10) unsigned DEFAULT NULL,
  `Display` tinyint(3) unsigned DEFAULT '1',
  `Size` int(10) unsigned DEFAULT NULL,
  `Width` int(10) unsigned DEFAULT NULL,
  `Height` int(10) unsigned DEFAULT NULL,
  `HtmlSize` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OriginalName` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `Mime` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` tinyint(3) unsigned DEFAULT NULL,
  `Front` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IndexSourceItem` (`Source`,`Item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesConfigImages`
--

LOCK TABLES `ThemesConfigImages` WRITE;
/*!40000 ALTER TABLE `ThemesConfigImages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesConfigImages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesFooter`
--

DROP TABLE IF EXISTS `ThemesFooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesFooter` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `BgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderWidth` tinyint(2) NOT NULL,
  `Padding` tinyint(2) NOT NULL,
  `LinkColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ImgBorderColor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `SummaryColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TitleColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Extra` text COLLATE utf8_unicode_ci,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  `BgImage` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesFooter`
--

LOCK TABLES `ThemesFooter` WRITE;
/*!40000 ALTER TABLE `ThemesFooter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesFooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesGalleries`
--

DROP TABLE IF EXISTS `ThemesGalleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesGalleries` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `CaptionBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `CaptionBgColorHover` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `CaptionOpacity` tinyint(3) unsigned NOT NULL,
  `CaptionOpacityHover` tinyint(3) unsigned NOT NULL,
  `CaptionPosition` char(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'image scroller only',
  `TitleFont` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `TitleFontWeight` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `TitleFontSize` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `TitleTextAlign` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TitleColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TitleColorHover` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `DescriptionFont` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DescriptionFontWeight` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `DescriptionFontSize` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `DescriptionTextAlign` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `DescriptionColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `DescriptionColorHover` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ScrollerButtonSize` tinyint(3) unsigned NOT NULL,
  `ScrollerButtonColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ScrollerButtonColorActive` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BoxplusTheme` char(12) COLLATE utf8_unicode_ci NOT NULL,
  `BoxplusCaptions` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `BoxplusThumbs` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `BoxplusTransitions` char(8) COLLATE utf8_unicode_ci NOT NULL,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesGalleries`
--

LOCK TABLES `ThemesGalleries` WRITE;
/*!40000 ALTER TABLE `ThemesGalleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesGalleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesIds`
--

DROP TABLE IF EXISTS `ThemesIds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesIds` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `BackgroundStyle` enum('solid','image') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `BgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderWidth` tinyint(2) DEFAULT NULL,
  `Padding` tinyint(2) DEFAULT NULL,
  `LinkColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ImgBorderColor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `SummaryColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TitleColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Extra` text COLLATE utf8_unicode_ci,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  `BgImage` int(11) NOT NULL,
  `ThemeId` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesIds`
--

LOCK TABLES `ThemesIds` WRITE;
/*!40000 ALTER TABLE `ThemesIds` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesIds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesItems`
--

DROP TABLE IF EXISTS `ThemesItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesItems` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `Type` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `TitleBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Color` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderWidth` tinyint(2) DEFAULT NULL,
  `Padding` tinyint(2) DEFAULT NULL,
  `LinkColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ImgBorderColor` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `SummaryColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `TitleColor` char(6) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `Extra` text COLLATE utf8_unicode_ci,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  `TitleBgImage` int(11) NOT NULL,
  `BodyBgImage` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesItems`
--

LOCK TABLES `ThemesItems` WRITE;
/*!40000 ALTER TABLE `ThemesItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThemesMenu`
--

DROP TABLE IF EXISTS `ThemesMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThemesMenu` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(250) COLLATE utf8_unicode_ci NOT NULL,
  `BgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `BorderWidth` tinyint(2) NOT NULL,
  `Width` int(11) NOT NULL DEFAULT '1004',
  `Padding` tinyint(2) NOT NULL,
  `BackgroundStyle` enum('solid','image','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `ArrowType` enum('dark','light') CHARACTER SET ucs2 COLLATE ucs2_unicode_ci NOT NULL DEFAULT 'dark',
  `LinkColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkPaddingVertical` tinyint(2) NOT NULL,
  `LinkPaddingHorizontal` tinyint(2) NOT NULL,
  `LinkBg` int(11) NOT NULL,
  `LinkBackgroundStyle` enum('solid','image','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `LinkHoverColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `LinkHoverBg` int(11) NOT NULL,
  `LinkHoverBackgroundStyle` enum('solid','image','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `ChildrenBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ChildrenColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ChildrenBg` int(11) NOT NULL,
  `ChildrenBackgroundStyle` enum('solid','image','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `ChildrenHoverBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ChildrenHoverColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `SeparatorColorLeft` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `SeparatorColorRight` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `ChildrenHoverBg` int(11) NOT NULL,
  `ChildrenHoverBackgroundStyle` enum('solid','image','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `GrandChildrenColor` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `GrandChildrenBg` int(11) NOT NULL,
  `GrandChildrenBackgroundStyle` enum('solid','image','none') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'solid',
  `Extra` text COLLATE utf8_unicode_ci,
  `GrandChildrenBgColor` char(6) COLLATE utf8_unicode_ci NOT NULL,
  `Advanced` text COLLATE utf8_unicode_ci NOT NULL,
  `BgImage` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThemesMenu`
--

LOCK TABLES `ThemesMenu` WRITE;
/*!40000 ALTER TABLE `ThemesMenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ThemesMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketBuyers`
--

DROP TABLE IF EXISTS `TicketBuyers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketBuyers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL DEFAULT '0',
  `EventId` int(10) unsigned NOT NULL DEFAULT '0',
  `FirstName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `LastName` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `NumberTickets` int(10) unsigned NOT NULL DEFAULT '0',
  `Amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `CouponCode` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `OrderId` int(10) unsigned NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketBuyers`
--

LOCK TABLES `TicketBuyers` WRITE;
/*!40000 ALTER TABLE `TicketBuyers` DISABLE KEYS */;
/*!40000 ALTER TABLE `TicketBuyers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketEvents`
--

DROP TABLE IF EXISTS `TicketEvents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketEvents` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `StartDate` datetime DEFAULT NULL,
  `FinishDate` datetime DEFAULT NULL,
  `Location` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Fax` char(25) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Street` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Town` char(30) COLLATE utf8_unicode_ci NOT NULL,
  `County` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Country` char(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Ireland',
  `Web` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8_unicode_ci,
  `Contact` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  `HandlingCost` decimal(10,2) DEFAULT '0.00',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketEvents`
--

LOCK TABLES `TicketEvents` WRITE;
/*!40000 ALTER TABLE `TicketEvents` DISABLE KEYS */;
/*!40000 ALTER TABLE `TicketEvents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketOptions`
--

DROP TABLE IF EXISTS `TicketOptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketOptions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventId` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Price` decimal(10,2) NOT NULL,
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  `Position` tinyint(3) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketOptions`
--

LOCK TABLES `TicketOptions` WRITE;
/*!40000 ALTER TABLE `TicketOptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `TicketOptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tickets`
--

DROP TABLE IF EXISTS `Tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tickets` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EventId` int(10) unsigned NOT NULL DEFAULT '0',
  `OptionId` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyerId` int(10) unsigned NOT NULL DEFAULT '0',
  `Token` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Validated` tinyint(3) NOT NULL DEFAULT '0',
  `ValidatedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tickets`
--

LOCK TABLES `Tickets` WRITE;
/*!40000 ALTER TABLE `Tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TilesProducts`
--

DROP TABLE IF EXISTS `TilesProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TilesProducts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `BrandId` int(10) unsigned NOT NULL DEFAULT '0',
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `TaxId` int(10) unsigned NOT NULL,
  `Summary` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Specifications` text COLLATE utf8_unicode_ci NOT NULL,
  `TilesInBox` int(8) NOT NULL,
  `TileLength` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `TileWidth` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `TileThickness` decimal(8,2) NOT NULL DEFAULT '0.00',
  `Weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Flagged` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `VAT` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `SpecialOfferActive` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpecialOfferPrice` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferBegins` datetime DEFAULT NULL,
  `SpecialOfferExpires` datetime DEFAULT NULL,
  `SpecialOfferContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `FeatureContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `SearchText` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `IsFeatured` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `IsExtra` tinyint(3) NOT NULL DEFAULT '0',
  `ExtraContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Spotlight` text COLLATE utf8_unicode_ci NOT NULL,
  `IsTest` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PurchaseEnabled` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `SloganId` int(11) NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `SampleTilePrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `BrandId` (`BrandId`),
  KEY `Name` (`Name`),
  KEY `TaxId` (`TaxId`),
  KEY `SloganId` (`SloganId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TilesProducts`
--

LOCK TABLES `TilesProducts` WRITE;
/*!40000 ALTER TABLE `TilesProducts` DISABLE KEYS */;
/*!40000 ALTER TABLE `TilesProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TilesProductsPages`
--

DROP TABLE IF EXISTS `TilesProductsPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TilesProductsPages` (
  `TileProductId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TileProductId`,`PageId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Event categories (JOIN TileProductId to PageId)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TilesProductsPages`
--

LOCK TABLES `TilesProductsPages` WRITE;
/*!40000 ALTER TABLE `TilesProductsPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `TilesProductsPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackageBookingHistory`
--

DROP TABLE IF EXISTS `TravelPackageBookingHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackageBookingHistory` (
  `NoteId` int(10) unsigned NOT NULL,
  `BookingId` int(10) unsigned NOT NULL,
  `History` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`NoteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Edits to Bookings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackageBookingHistory`
--

LOCK TABLES `TravelPackageBookingHistory` WRITE;
/*!40000 ALTER TABLE `TravelPackageBookingHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackageBookingHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackageBookingNames`
--

DROP TABLE IF EXISTS `TravelPackageBookingNames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackageBookingNames` (
  `TravelPackageBookedId` int(10) unsigned NOT NULL,
  `RoomId` int(10) unsigned NOT NULL,
  `PersonNumber` tinyint(4) NOT NULL,
  `PersonType` enum('Adult','Child') COLLATE utf8_unicode_ci NOT NULL,
  `FirstName` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SecondName` char(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Phone` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Nationality` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `BirthDate` date NOT NULL,
  `PickupLocationId` int(11) NOT NULL,
  `PickupLocation` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Insurance` enum('None','Basic','Plus') COLLATE utf8_unicode_ci DEFAULT NULL,
  `PickupPrice` decimal(10,2) NOT NULL,
  `InsurancePrice` decimal(10,2) NOT NULL,
  `TravelOut` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EventTicket` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TravelBack` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ExtraNightsBefore` tinyint(4) NOT NULL,
  `ExtraNightsAfter` tinyint(4) NOT NULL,
  `Status` enum('active','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `CustomPrice` decimal(10,2) NOT NULL,
  UNIQUE KEY `UniquePerson` (`TravelPackageBookedId`,`RoomId`,`PersonType`,`PersonNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Traveller details (for Travel module).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackageBookingNames`
--

LOCK TABLES `TravelPackageBookingNames` WRITE;
/*!40000 ALTER TABLE `TravelPackageBookingNames` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackageBookingNames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackageBookingNotes`
--

DROP TABLE IF EXISTS `TravelPackageBookingNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackageBookingNotes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BookingId` int(10) unsigned NOT NULL,
  `RoomId` int(10) unsigned NOT NULL DEFAULT '0',
  `PersonNumber` int(10) unsigned NOT NULL DEFAULT '0',
  `PersonType` enum('Adult','Child') COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserId` int(10) unsigned NOT NULL,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Content` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackageBookingNotes`
--

LOCK TABLES `TravelPackageBookingNotes` WRITE;
/*!40000 ALTER TABLE `TravelPackageBookingNotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackageBookingNotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackageNotes`
--

DROP TABLE IF EXISTS `TravelPackageNotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackageNotes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TravelPackageId` int(10) unsigned NOT NULL,
  `UserId` int(10) unsigned NOT NULL,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Content` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackageNotes`
--

LOCK TABLES `TravelPackageNotes` WRITE;
/*!40000 ALTER TABLE `TravelPackageNotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackageNotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackageRequests`
--

DROP TABLE IF EXISTS `TravelPackageRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackageRequests` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PackageId` int(10) unsigned NOT NULL,
  `PackageTitle` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(60) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Adults` int(3) unsigned NOT NULL,
  `Children` int(3) unsigned NOT NULL,
  `IpAddress` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `Question` text COLLATE utf8_unicode_ci NOT NULL,
  `AdditionalInfo` text COLLATE utf8_unicode_ci NOT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Travel Package enquiries';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackageRequests`
--

LOCK TABLES `TravelPackageRequests` WRITE;
/*!40000 ALTER TABLE `TravelPackageRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackageRequests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackages`
--

DROP TABLE IF EXISTS `TravelPackages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackages` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Stock` int(10) unsigned DEFAULT NULL,
  `Status` enum('open','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Location` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `TitleHighlights` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Highlights` text COLLATE utf8_unicode_ci NOT NULL,
  `HotelId` int(10) unsigned NOT NULL,
  `SloganId` int(10) unsigned NOT NULL,
  `DateDepart` date DEFAULT NULL,
  `DateEvent` date DEFAULT NULL,
  `DateReturn` date DEFAULT NULL,
  `PriceAdult` decimal(10,2) unsigned NOT NULL,
  `PriceChild` decimal(10,2) unsigned NOT NULL,
  `ChildAge` tinyint(3) unsigned NOT NULL DEFAULT '16',
  `ExtraNights` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ExtraNightAdult` decimal(10,2) unsigned NOT NULL,
  `ExtraNightChild` decimal(10,2) unsigned NOT NULL,
  `SingleSupplement` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferPriceAdult` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferPriceChild` decimal(10,2) unsigned NOT NULL,
  `InsuranceAdult` decimal(10,2) unsigned NOT NULL,
  `InsuranceChild` decimal(10,2) unsigned NOT NULL,
  `InsurancePlusAdult` decimal(10,2) unsigned NOT NULL,
  `InsurancePlusChild` decimal(10,2) unsigned NOT NULL,
  `TravelPrice` decimal(10,2) unsigned NOT NULL,
  `MinimumDeposit` decimal(10,2) DEFAULT NULL,
  `BalanceDue` date DEFAULT NULL,
  `SpecialOfferActive` tinyint(1) unsigned NOT NULL,
  `SpecialOfferContent` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Content` text COLLATE utf8_unicode_ci NOT NULL,
  `Itinerary` text COLLATE utf8_unicode_ci NOT NULL,
  `InsuranceText` text COLLATE utf8_unicode_ci NOT NULL,
  `InsurancePlusText` text COLLATE utf8_unicode_ci NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `IsFeatured` tinyint(3) unsigned NOT NULL,
  `MetaTitle` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaDescription` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `MetaKeywords` text COLLATE utf8_unicode_ci NOT NULL,
  `Code` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `Link` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Redirect` tinyint(4) NOT NULL DEFAULT '0',
  `OnlyEnquiry` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackages`
--

LOCK TABLES `TravelPackages` WRITE;
/*!40000 ALTER TABLE `TravelPackages` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesBooked`
--

DROP TABLE IF EXISTS `TravelPackagesBooked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesBooked` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` char(26) COLLATE utf8_unicode_ci NOT NULL,
  `TravelPackageId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `DateDepart` date NOT NULL,
  `DateEvent` date NOT NULL,
  `DateReturn` date NOT NULL,
  `Location` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Hotel` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Adult` tinyint(4) NOT NULL,
  `Child` tinyint(4) NOT NULL,
  `AdultPrice` decimal(10,2) NOT NULL,
  `ChildPrice` decimal(10,2) NOT NULL,
  `TravelPrice` decimal(10,2) NOT NULL,
  `ExtraNightPriceAdult` decimal(10,2) NOT NULL,
  `ExtraNightPriceChild` decimal(10,2) NOT NULL,
  `OverallPrice` decimal(10,2) NOT NULL,
  `AcceptTerms` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AcceptRules` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `Status` enum('valid','invalid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'valid',
  `CopiedFrom` int(11) unsigned NOT NULL,
  `ItinerarySent` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ItinerarySentOn` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `TravelPackageId` (`TravelPackageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesBooked`
--

LOCK TABLES `TravelPackagesBooked` WRITE;
/*!40000 ALTER TABLE `TravelPackagesBooked` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesBooked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesBookedRooms`
--

DROP TABLE IF EXISTS `TravelPackagesBookedRooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesBookedRooms` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TravelPackageBookedId` int(10) unsigned NOT NULL,
  `RoomTypeId` int(10) unsigned NOT NULL,
  `RoomType` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Adult` tinyint(4) NOT NULL,
  `Child` tinyint(4) NOT NULL,
  `SingleSupplement` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `TravelPackageId` (`TravelPackageBookedId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Hotel details (for Travel module).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesBookedRooms`
--

LOCK TABLES `TravelPackagesBookedRooms` WRITE;
/*!40000 ALTER TABLE `TravelPackagesBookedRooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesBookedRooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesElements`
--

DROP TABLE IF EXISTS `TravelPackagesElements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesElements` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesElements`
--

LOCK TABLES `TravelPackagesElements` WRITE;
/*!40000 ALTER TABLE `TravelPackagesElements` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesElements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesElementsSelected`
--

DROP TABLE IF EXISTS `TravelPackagesElementsSelected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesElementsSelected` (
  `TravelPackageId` int(10) unsigned NOT NULL,
  `ElementId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TravelPackageId`,`ElementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesElementsSelected`
--

LOCK TABLES `TravelPackagesElementsSelected` WRITE;
/*!40000 ALTER TABLE `TravelPackagesElementsSelected` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesElementsSelected` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesEnhancements`
--

DROP TABLE IF EXISTS `TravelPackagesEnhancements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesEnhancements` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available options for Travel Packages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesEnhancements`
--

LOCK TABLES `TravelPackagesEnhancements` WRITE;
/*!40000 ALTER TABLE `TravelPackagesEnhancements` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesEnhancements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesEnhancementsAvailable`
--

DROP TABLE IF EXISTS `TravelPackagesEnhancementsAvailable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesEnhancementsAvailable` (
  `TravelPackageId` int(10) unsigned NOT NULL,
  `EnhancementId` int(10) unsigned NOT NULL,
  `Stock` int(10) unsigned DEFAULT NULL,
  `Type` enum('Adult','Child','Booking','Person','Room') COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TravelPackageId`,`EnhancementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesEnhancementsAvailable`
--

LOCK TABLES `TravelPackagesEnhancementsAvailable` WRITE;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsAvailable` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsAvailable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesEnhancementsPurchasedBooking`
--

DROP TABLE IF EXISTS `TravelPackagesEnhancementsPurchasedBooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesEnhancementsPurchasedBooking` (
  `BookingId` int(10) unsigned NOT NULL,
  `EnhancementId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `SelectedEnhancement` (`EnhancementId`,`BookingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesEnhancementsPurchasedBooking`
--

LOCK TABLES `TravelPackagesEnhancementsPurchasedBooking` WRITE;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsPurchasedBooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsPurchasedBooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesEnhancementsPurchasedPerson`
--

DROP TABLE IF EXISTS `TravelPackagesEnhancementsPurchasedPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesEnhancementsPurchasedPerson` (
  `TravelPackageBookedId` int(10) unsigned NOT NULL,
  `RoomId` int(10) unsigned NOT NULL,
  `PersonType` enum('Adult','Child') COLLATE utf8_unicode_ci NOT NULL,
  `PersonNumber` tinyint(4) unsigned NOT NULL,
  `EnhancementId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `SelectedEnhancement` (`EnhancementId`,`TravelPackageBookedId`,`RoomId`,`PersonType`,`PersonNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesEnhancementsPurchasedPerson`
--

LOCK TABLES `TravelPackagesEnhancementsPurchasedPerson` WRITE;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsPurchasedPerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsPurchasedPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesEnhancementsPurchasedRoom`
--

DROP TABLE IF EXISTS `TravelPackagesEnhancementsPurchasedRoom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesEnhancementsPurchasedRoom` (
  `RoomId` int(10) unsigned NOT NULL,
  `EnhancementId` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  UNIQUE KEY `SelectedEnhancement` (`EnhancementId`,`RoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesEnhancementsPurchasedRoom`
--

LOCK TABLES `TravelPackagesEnhancementsPurchasedRoom` WRITE;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsPurchasedRoom` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesEnhancementsPurchasedRoom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesPages`
--

DROP TABLE IF EXISTS `TravelPackagesPages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesPages` (
  `TravelPackageId` int(10) unsigned NOT NULL,
  `PageId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TravelPackageId`,`PageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesPages`
--

LOCK TABLES `TravelPackagesPages` WRITE;
/*!40000 ALTER TABLE `TravelPackagesPages` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesPages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesPaymentRemindersSent`
--

DROP TABLE IF EXISTS `TravelPackagesPaymentRemindersSent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesPaymentRemindersSent` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `BookingId` int(10) unsigned NOT NULL,
  `Email` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Sent` datetime NOT NULL,
  `Sender` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesPaymentRemindersSent`
--

LOCK TABLES `TravelPackagesPaymentRemindersSent` WRITE;
/*!40000 ALTER TABLE `TravelPackagesPaymentRemindersSent` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesPaymentRemindersSent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesPickupLocations`
--

DROP TABLE IF EXISTS `TravelPackagesPickupLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesPickupLocations` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` int(10) unsigned NOT NULL,
  `Title` char(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Pickup Locations (for Travel module).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesPickupLocations`
--

LOCK TABLES `TravelPackagesPickupLocations` WRITE;
/*!40000 ALTER TABLE `TravelPackagesPickupLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesPickupLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesPickups`
--

DROP TABLE IF EXISTS `TravelPackagesPickups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesPickups` (
  `TravelPackageId` int(10) unsigned NOT NULL,
  `PickupId` int(10) unsigned NOT NULL,
  UNIQUE KEY `Unique` (`TravelPackageId`,`PickupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesPickups`
--

LOCK TABLES `TravelPackagesPickups` WRITE;
/*!40000 ALTER TABLE `TravelPackagesPickups` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesPickups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TravelPackagesPriceHistory`
--

DROP TABLE IF EXISTS `TravelPackagesPriceHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TravelPackagesPriceHistory` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `TravelPackageId` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `PriceAdult` decimal(10,2) unsigned NOT NULL,
  `PriceChild` decimal(10,2) unsigned NOT NULL,
  `TravelPrice` decimal(10,2) unsigned NOT NULL,
  `ExtraNightAdult` decimal(10,2) unsigned NOT NULL,
  `ExtraNightChild` decimal(10,2) unsigned NOT NULL,
  `SingleSupplement` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferPriceAdult` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferPriceChild` decimal(10,2) unsigned NOT NULL,
  `SpecialOfferActive` enum('Yes','No','Unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Unknown',
  `InsuranceAdult` decimal(10,2) unsigned NOT NULL,
  `InsuranceChild` decimal(10,2) unsigned NOT NULL,
  `InsurancePlusAdult` decimal(10,2) unsigned NOT NULL,
  `InsurancePlusChild` decimal(10,2) unsigned NOT NULL,
  `MinimumDeposit` decimal(10,2) unsigned DEFAULT NULL,
  `BalanceDue` date DEFAULT NULL,
  `Note` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TravelPackagesPriceHistory`
--

LOCK TABLES `TravelPackagesPriceHistory` WRITE;
/*!40000 ALTER TABLE `TravelPackagesPriceHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `TravelPackagesPriceHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnverifiedUserAccounts`
--

DROP TABLE IF EXISTS `UnverifiedUserAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnverifiedUserAccounts` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Email` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FirstName` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LastName` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Street` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Town` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `State` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Country` char(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Should be null so it doesn''t get a value when asking for the address is switched off.',
  `IpAddress` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `Company` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='Temporary store for new unvalidated accounts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnverifiedUserAccounts`
--

LOCK TABLES `UnverifiedUserAccounts` WRITE;
/*!40000 ALTER TABLE `UnverifiedUserAccounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `UnverifiedUserAccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UploadedPrescriptions`
--

DROP TABLE IF EXISTS `UploadedPrescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UploadedPrescriptions` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IpAddress` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address2` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressStreet` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressTown` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressCounty` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AddressCode` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Content` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UploadedPrescriptions`
--

LOCK TABLES `UploadedPrescriptions` WRITE;
/*!40000 ALTER TABLE `UploadedPrescriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `UploadedPrescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsageInformation`
--

DROP TABLE IF EXISTS `UsageInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsageInformation` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='Safety Helmet, Safety Boots, Safety Gloves, Ear Protection, Eye Protection, Dust Mask, Car';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsageInformation`
--

LOCK TABLES `UsageInformation` WRITE;
/*!40000 ALTER TABLE `UsageInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsageInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserCoupons`
--

DROP TABLE IF EXISTS `UserCoupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserCoupons` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `CouponId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserCoupons`
--

LOCK TABLES `UserCoupons` WRITE;
/*!40000 ALTER TABLE `UserCoupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserCoupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserStatus`
--

DROP TABLE IF EXISTS `UserStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserStatus` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Position` tinyint(4) unsigned DEFAULT '0',
  `Title` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Display` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserStatus`
--

LOCK TABLES `UserStatus` WRITE;
/*!40000 ALTER TABLE `UserStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Email` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Salt` char(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Password` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PasswordAt` int(10) unsigned DEFAULT NULL,
  `CreatedAt` int(10) unsigned DEFAULT NULL,
  `ModifiedAt` int(10) unsigned DEFAULT NULL,
  `LoggedAt` int(10) unsigned DEFAULT NULL,
  `Active` tinyint(3) unsigned DEFAULT '1',
  `LockedAt` int(10) unsigned NOT NULL,
  `Level` tinyint(3) unsigned DEFAULT '1',
  `ActivatedAt` int(10) unsigned DEFAULT '1',
  `UserUpdating` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `UpdateFlag` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `FromId` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='User log-in data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'support@dotser.ie',NULL,'$2y$11$1w2fPfvgX8uF.U5ggrjXheoOF76CGAI.hgyrRaJvF7bIvlQjef5qu',1592225903,NULL,NULL,NULL,1,0,255,1,'smi2tsipr9v0hlve4moth34do3','UPDATED BY USER','1'),(2,'Cormac.Cavanagh@abbeymachinery.com',NULL,'$2y$11$4AAIEb5Q1X/IQKYG/JI54OG83RGo/GBETbI9lWtLwgAsyFBsEegd.',1592902783,NULL,NULL,NULL,1,0,255,1,'1','UPDATED BY ADMIN','2'),(3,'jhicks@abbeymachinery.com',NULL,'$2y$11$yNt9t3Tol0FOGeQ.bLzfRuPUrHo4gHprlPRGbo1CBWrFhrOrK3uZm',1592903195,NULL,NULL,NULL,1,0,255,1,'1','UPDATED BY ADMIN','3'),(4,'marketing@abbeymachinery.com',NULL,'$2y$11$IwIS3s7n.nEPv.zh/jCKVehtQn.lNE0v3V.G0Nbpinult6dgzZb.K',1592903339,NULL,NULL,NULL,1,0,255,1,'1','UPDATED BY ADMIN','4'),(5,'loalivso88@gmail.com',NULL,'$2y$11$XYouX8IIf1L05SMs7zjfX.VJcgtGzokFuOeio4gXD6Lvxs8u55qWW',1598393675,1598393675,NULL,NULL,1,0,1,1,'9iek74co1ia6qgc3gan2gfvrt7','ON CREATE ACCOUNT','5'),(6,'maevetobin53@gmail.com',NULL,'$2y$11$O5giwv9s4ViIBGXV757p4err9QFZqBC9IAUlvfTjt1jLnuY99Lz5e',1599221853,1599221853,NULL,NULL,1,0,1,1,'jnr4qddrm1mnc6scp4gj1pndt1','ON CREATE ACCOUNT','6');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VatTypes`
--

DROP TABLE IF EXISTS `VatTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VatTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Value` decimal(10,2) unsigned NOT NULL,
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `CheckVat` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Countries` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VatTypes`
--

LOCK TABLES `VatTypes` WRITE;
/*!40000 ALTER TABLE `VatTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `VatTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VideoTypes`
--

DROP TABLE IF EXISTS `VideoTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VideoTypes` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED COMMENT='module/videotypes. For categorising videos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideoTypes`
--

LOCK TABLES `VideoTypes` WRITE;
/*!40000 ALTER TABLE `VideoTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `VideoTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Videos`
--

DROP TABLE IF EXISTS `Videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Videos` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Name` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `ActualVideoTitle` char(200) COLLATE utf8_unicode_ci NOT NULL,
  `Position` int(10) unsigned NOT NULL DEFAULT '0',
  `Display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Duration` int(10) unsigned NOT NULL DEFAULT '0',
  `Valid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Video` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Width` int(10) unsigned DEFAULT NULL,
  `Height` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Videos`
--

LOCK TABLES `Videos` WRITE;
/*!40000 ALTER TABLE `Videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VideosItems`
--

DROP TABLE IF EXISTS `VideosItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VideosItems` (
  `VideoId` int(10) unsigned NOT NULL,
  `Source` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `Item` int(10) unsigned NOT NULL,
  UNIQUE KEY `FullyUnique` (`VideoId`,`Source`,`Item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Join videos to other items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideosItems`
--

LOCK TABLES `VideosItems` WRITE;
/*!40000 ALTER TABLE `VideosItems` DISABLE KEYS */;
/*!40000 ALTER TABLE `VideosItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Walkers`
--

DROP TABLE IF EXISTS `Walkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Walkers` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL DEFAULT '0',
  `FirstName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `LastName` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `Address` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Street` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Town` char(150) COLLATE utf8_unicode_ci DEFAULT '',
  `County` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Mobile` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Route` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Size` char(100) COLLATE utf8_unicode_ci DEFAULT '',
  `Description` text COLLATE utf8_unicode_ci,
  `OrderId` int(10) NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IpAddress` char(20) COLLATE utf8_unicode_ci DEFAULT '',
  `Raised` int(10) NOT NULL DEFAULT '0',
  `WalkerNumber` char(30) COLLATE utf8_unicode_ci DEFAULT '',
  `Newsletter` tinyint(4) NOT NULL DEFAULT '0',
  `Ticket` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `ExtraWalkers` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  `Club` char(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Walkers`
--

LOCK TABLES `Walkers` WRITE;
/*!40000 ALTER TABLE `Walkers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Walkers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wishlists`
--

DROP TABLE IF EXISTS `Wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wishlists` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `ItemId` int(10) unsigned NOT NULL,
  `ItemType` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `Version` int(10) unsigned NOT NULL DEFAULT '0',
  `CreatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `SelectedProduct` (`UserId`,`ItemId`,`ItemType`,`Version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wishlists`
--

LOCK TABLES `Wishlists` WRITE;
/*!40000 ALTER TABLE `Wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `Wishlists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-26 22:55:55
