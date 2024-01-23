-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB-1:10.4.32+maria~ubu2004-log

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gjqtobplfknbsoqqsmoagrunmueqrvabfvst` (`ownerId`),
  CONSTRAINT `fk_gjqtobplfknbsoqqsmoagrunmueqrvabfvst` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kkxkfufsffalyqtylzxklwjojazbcuytbnqw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_stthftvxhpdagdxuiroohbeyqsnjjxxxmdyx` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_awlvmgmtqehqvyffbtjwcpfecnahvyqdakcr` (`dateRead`),
  KEY `fk_wyokhsjcawwrobdromjqkytkzkcqufltnddd` (`pluginId`),
  CONSTRAINT `fk_eioublmudxvzlphghpylfgzuqztaqsrgnhbt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wyokhsjcawwrobdromjqkytkzkcqufltnddd` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ekhdbcvpjetycmfoerbzjdhnnaedyjdndjgy` (`sessionId`,`volumeId`),
  KEY `idx_rojqqyxsestiqqvfnyhkqilkehcppfmzllss` (`volumeId`),
  CONSTRAINT `fk_pbbalygunykfnqvsahqqzsngaxcdstjxjqmt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytjjkqdkrvurndcmdisjttogdfhaxsqlxqjf` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kqigeskciguevbzgfxjoqpvimgjbzrpiqfil` (`filename`,`folderId`),
  KEY `idx_azkwbexmwkqjgarveearhvxzzromlbbnzybg` (`folderId`),
  KEY `idx_vnsgqaiownldzoqtvuvjxejgoltftlqltisd` (`volumeId`),
  KEY `fk_urrezrxitczrwolmdgobcwifrqqbomlgezht` (`uploaderId`),
  CONSTRAINT `fk_guluenoaupruupwbhyxuzixyygsgtwqkmeam` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfmycgebnafybyhvutwacqhicykjrpmtpqif` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_urrezrxitczrwolmdgobcwifrqqbomlgezht` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wgdiusexwxdctgvhorornsptoegcqekgovoq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ymfbcuikwbuzyohurelxdhrqkjrykowbffrb` (`groupId`),
  KEY `fk_sijirtkxipomwgbukouokbjoxqjimossrbil` (`parentId`),
  CONSTRAINT `fk_qgffdvzbdexftgizqcuywracwbpowdkoffpm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sijirtkxipomwgbukouokbjoxqjimossrbil` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tbcsscsxawltjpvfltetmzxetzciipsgphff` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rcdvupscxhgdupfvionqgndgrqnbyltufdur` (`name`),
  KEY `idx_jeulrfxohvsyyyyrwrnkatzujvjywaulldzj` (`handle`),
  KEY `idx_zchfzgvwzqxlhavtziyyihresrenzkjduqax` (`structureId`),
  KEY `idx_ytwtgnlynpiyrhlvtjyycfuivdqljahkaegz` (`fieldLayoutId`),
  KEY `idx_dgoyihrjybezrqactlkdcnmsvlnvswqotiaw` (`dateDeleted`),
  CONSTRAINT `fk_mbbutbuchiaxyajmlkywhvqawhlwygmdxpvk` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xlqzpqwuqcqpkqtxvzzvxqvjdkuqcbruylwf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_blqgyjhujtdkxbgbwaddpvfevmgzrsoxtgps` (`groupId`,`siteId`),
  KEY `idx_qiuoufqdxpnoioguzorahnnfayzbjhpgfdzb` (`siteId`),
  CONSTRAINT `fk_dxzglqmotjvrwsgrfwttnyirfvxghghruevv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zjgpsbbowpwsngfasoellcqgeiimuepsqgft` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ooetmwjgxorpbjmaalsmffmzhtenrsxwrvis` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_wqeizjakufasytinohvpccwufsfzdhdnojee` (`siteId`),
  KEY `fk_ihxpgiglqxvjrvxcdjywtgajkddteigbvbei` (`userId`),
  CONSTRAINT `fk_ihxpgiglqxvjrvxcdjywtgajkddteigbvbei` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_wqeizjakufasytinohvpccwufsfzdhdnojee` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ybyuyyqsbetgisgidycalgboobhqribqzawv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_hucrlyylkzyotwqtmzvvajplmqrcuofawids` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dyxmougznkktjrvlwhrwjowtfnkgzgdqsxvf` (`siteId`),
  KEY `fk_zndjxgevgrhcyyuepdfcdomaeduapznsoskg` (`fieldId`),
  KEY `fk_pjzktpqlcoeiimnrrepmptgbqviinhozkfnf` (`userId`),
  CONSTRAINT `fk_aelifnaojkasedsisrpwinylnwrjsgsrbovp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_dyxmougznkktjrvlwhrwjowtfnkgzgdqsxvf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pjzktpqlcoeiimnrrepmptgbqviinhozkfnf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_zndjxgevgrhcyyuepdfcdomaeduapznsoskg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (1,1,1,'2024-01-23 00:27:20',0,6);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zamevljurwfosximuyxusrtgnozoqredapes` (`elementId`,`siteId`),
  KEY `idx_mhszhvzhleogluscepiyfbbayqlgzidkdtiy` (`siteId`),
  KEY `idx_ofeilqoegzlghlpvplhlnwfkuwsdvnrctfvs` (`title`),
  CONSTRAINT `fk_qloatkvjkotydemzxfmsdxhhbktxdimuyqte` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xqbigrbjahsqfrqqlbselxrkyskmflxfonaa` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,'Homepage','2024-01-23 00:25:37','2024-01-23 00:27:20','bcd22dcc-bbb9-46f9-a870-3473d98d1f0c'),(2,2,1,'Homepage','2024-01-23 00:25:37','2024-01-23 00:25:37','fe41b47c-04ff-406c-90ca-3a202d52e9a8'),(3,3,1,'Homepage','2024-01-23 00:25:37','2024-01-23 00:25:37','9e9a1f39-1465-4c58-9c2a-5ca4f03278f2'),(4,4,1,'Homepage','2024-01-23 00:25:37','2024-01-23 00:25:37','382c36e9-0e83-45d6-a8b3-d34e58f27c79'),(5,5,1,'Homepage','2024-01-23 00:25:37','2024-01-23 00:25:37','44a24bda-6a36-4fe5-b52d-a9e549ae0980'),(6,6,1,NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37','f4509c6d-3124-4c19-8e8a-a1017d5a523a'),(8,10,1,'Homepage','2024-01-23 00:27:20','2024-01-23 00:27:20','6b211722-d160-4aaf-91a6-0c2af4a27c90');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_rriduiseojshbeftlcecvzfzlhxpdqmchixl` (`userId`),
  CONSTRAINT `fk_rriduiseojshbeftlcecvzfzlhxpdqmchixl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iiihvfeguzxgiemjfbtrxouuobkqhhgawgjk` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_dgzuwacnhcxshxuwxhwwafvozyxkrwxaoiht` (`creatorId`,`provisional`),
  KEY `idx_giuuvqxhdlgbpeugtrivhncwkdracleyzqct` (`saved`),
  KEY `fk_nvqtjayaulumluozreazgawtyymwxrqexyeq` (`canonicalId`),
  CONSTRAINT `fk_jnmrpyccuxvxsmbcggrknarqcchytakuijcx` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nvqtjayaulumluozreazgawtyymwxrqexyeq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_cxdczyzpyjnwxlbhfnfxqdwmcrxxktizlivj` (`elementId`,`timestamp`,`userId`),
  KEY `fk_srlnzkgiqogtjolopwlykwqplgsmumzqvkej` (`userId`),
  KEY `fk_kgwvzmzotauyvfypvqlheyxdktignwmnftho` (`siteId`),
  KEY `fk_epdggwdqrzlkhmaorhamyrebpsdhzkxavmur` (`draftId`),
  CONSTRAINT `fk_epdggwdqrzlkhmaorhamyrebpsdhzkxavmur` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kgwvzmzotauyvfypvqlheyxdktignwmnftho` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_srlnzkgiqogtjolopwlykwqplgsmumzqvkej` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xkaieqslebaubxmzicwvrgxhlislplvhqyfv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES (1,6,1,NULL,'edit','2024-01-23 00:27:10'),(1,6,1,NULL,'save','2024-01-23 00:27:20');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ychckbycnbdcowtuzavucxolahctxxbyjfhu` (`dateDeleted`),
  KEY `idx_lratleqqiuyzcooktcwbhvdvfsfvavjfrono` (`fieldLayoutId`),
  KEY `idx_xuoryqlpzrevrsjtnaosxopvenmeaysgkpjg` (`type`),
  KEY `idx_dgseawrifiogpweyqikstmsqdhrumolupjhz` (`enabled`),
  KEY `idx_wfbnhjelggxiinleahekoqikqyxddgnwzzxt` (`canonicalId`),
  KEY `idx_peccdtzwdlbknymhkdamvjpgciclfojddljf` (`archived`,`dateCreated`),
  KEY `idx_gknbpinduowcjrgpawfwkynovwdtvkioknyc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_tnoalyruczpbivlcwqdrfaijoupffhmzjqah` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_metveryjqxnccrqtzygmszyzhamozidspkey` (`draftId`),
  KEY `fk_wrgmwblqixbyjwsvaxuddbmeqfmmwsivdnrq` (`revisionId`),
  CONSTRAINT `fk_fzwezwgmhnjsvpaingkodxwjyiknnldlzvqt` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_metveryjqxnccrqtzygmszyzhamozidspkey` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rrrgcvnmcqjlxsyvkxwdtzktsucloffjqong` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wrgmwblqixbyjwsvaxuddbmeqfmmwsivdnrq` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-01-23 00:25:37','2024-01-23 00:27:20',NULL,NULL,'d20759c6-fb32-4787-92d9-905f790d361f'),(2,1,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,NULL,'b68c1661-c343-489c-b475-da4c21444cc8'),(3,1,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,NULL,'32855fdc-e669-4a78-b927-b1c998a7068c'),(4,1,NULL,3,1,'craft\\elements\\Entry',1,0,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,NULL,'b4441ace-2d23-4207-abf0-dbb634afbfe5'),(5,1,NULL,4,1,'craft\\elements\\Entry',1,0,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,NULL,'bfeb199e-0d0e-43a7-bc2f-6acae015fa64'),(6,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,NULL,'3d9967a7-f8f8-417e-8cac-159ec98e2d0a'),(9,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2024-01-23 00:27:20','2024-01-23 00:27:20',NULL,NULL,'9fc307be-b8a7-4bf0-a963-1844eb563d34'),(10,1,NULL,5,1,'craft\\elements\\Entry',1,0,'2024-01-23 00:27:20','2024-01-23 00:27:20',NULL,NULL,'5d7a56e8-a5e7-4d43-b9fc-9cdf58937434'),(11,9,NULL,6,2,'craft\\elements\\MatrixBlock',1,0,'2024-01-23 00:27:20','2024-01-23 00:27:20',NULL,NULL,'5a4b4dba-7e9e-451e-adac-4aaad6472d7b');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xptugsfjfhngkixopnqppaumxajlznhamymx` (`elementId`,`siteId`),
  KEY `idx_npwtykcpmtxkxrifasyrochgnwrfsfiuljrh` (`siteId`),
  KEY `idx_yuyxlzuvnxtwkniyjzpatclklwzyngyxjpum` (`slug`,`siteId`),
  KEY `idx_soyrtycapzfeuegavbyacuhwgapwaajsnqmr` (`enabled`),
  KEY `idx_jdtmxlxsdvbvojlybajfjcslqwfngufepiav` (`uri`,`siteId`),
  CONSTRAINT `fk_pppiacsipvypxualdzpptqxcbknbhciqtuxh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prsgybxglzadzecmdjtbupfgvbsopspqpbsl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,'homepage','__home__',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','f9bf9413-3073-4cab-b414-b755302eb4ca'),(2,2,1,'homepage','__home__',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','f6a0f477-bfd1-4af4-9a1e-cdc2a9c40247'),(3,3,1,'homepage','__home__',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','232beb4c-6b93-4f68-bb25-a2e6f741b906'),(4,4,1,'homepage','__home__',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','7242c0d9-dfb8-4ac3-a803-e8d0cefadee5'),(5,5,1,'homepage','__home__',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','5d266b9b-e0d6-4fde-ba42-82e5562cea1a'),(6,6,1,NULL,NULL,1,'2024-01-23 00:25:37','2024-01-23 00:25:37','78e34d0d-df64-4e48-aa94-165d61a2cc93'),(9,9,1,NULL,NULL,1,'2024-01-23 00:27:20','2024-01-23 00:27:20','06eb61f2-9929-4082-a758-55e02822764c'),(10,10,1,'homepage','__home__',1,'2024-01-23 00:27:20','2024-01-23 00:27:20','2149457c-8844-4c6d-be3c-e97a689f1576'),(11,11,1,NULL,NULL,1,'2024-01-23 00:27:20','2024-01-23 00:27:20','1c7fc9d5-fe4a-441c-af35-d3f31539d929');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sneewutnpyfarvwtxqybbivxhbyelmrlmjth` (`postDate`),
  KEY `idx_tvizxskzhdatecqeuqskklsozkbggqryvcmo` (`expiryDate`),
  KEY `idx_rrfsaohleyecjfwnehasxxbwiamcdaxiwsyj` (`authorId`),
  KEY `idx_nsimecqpivukdgxzppacddtqvzfpkjajrtdo` (`sectionId`),
  KEY `idx_yufshbnklmpdmbumtpljmjhxxwhojwuxtfqm` (`typeId`),
  KEY `fk_khvesbrnnikvlkyfjidnfgoiqscuisbqbkdb` (`parentId`),
  CONSTRAINT `fk_djevoalhgblctjbhxnuljtqvtucflnzbepdu` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ftojxdkxyaxtehxcizetyjbytrworsqjwmcy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_khvesbrnnikvlkyfjidnfgoiqscuisbqbkdb` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_orvchxyytadirmbsnrxdmggktmzhpxszxkya` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rfqaxyuymqmjiujuvykzvmqetzaxmbdoract` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,1,NULL,1,NULL,'2024-01-23 00:25:00',NULL,NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37'),(2,1,NULL,1,NULL,'2024-01-23 00:25:00',NULL,NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37'),(3,1,NULL,1,NULL,'2024-01-23 00:25:00',NULL,NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37'),(4,1,NULL,1,NULL,'2024-01-23 00:25:00',NULL,NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37'),(5,1,NULL,1,NULL,'2024-01-23 00:25:00',NULL,NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37'),(10,1,NULL,1,NULL,'2024-01-23 00:25:00',NULL,NULL,'2024-01-23 00:27:20','2024-01-23 00:27:20');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tmcnebwcestynvllsukvrxqzlfsrlkjrdnnl` (`name`,`sectionId`),
  KEY `idx_jmkafkhfsbihfgvoopyavpgsajshvfmkxmyq` (`handle`,`sectionId`),
  KEY `idx_vjvqgircvijvpuknwtddkoqnbjpmdeeppsnk` (`sectionId`),
  KEY `idx_cwkgboqrygxkvioqkktlupjwuulfgbrjwwat` (`fieldLayoutId`),
  KEY `idx_dmrswborpnvzdiyknzzrnwdjrrlvovpktfcu` (`dateDeleted`),
  CONSTRAINT `fk_uzcjbaxvcgbzeckemvsakeftyetcylcrngoi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zbgzstjalqyadvejqbbgzycoqzaqowriewim` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Homepage','homepage',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,'c4a9f311-2f6c-4ab4-b53d-401d62db2f1e');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tufhykxjltgummivyplmglarqufseilxwzdq` (`name`),
  KEY `idx_gvkjccxykszdchmdjeovrenovnagyzqgvvul` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2024-01-23 00:25:36','2024-01-23 00:25:36',NULL,'82722786-54b3-49e2-8e7b-d1e280e90288');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ugyerumqpxkzuosvwtvpvhoqdmiisqmdyybi` (`layoutId`,`fieldId`),
  KEY `idx_iqxjzkdqzpxlshmsivmqejopkxcwdrqznyek` (`sortOrder`),
  KEY `idx_xwgpjhwvpczehhifnhfymxmeupgbqydzfjwk` (`tabId`),
  KEY `idx_fdghsjptikeyusiobatmdcquyysiytkcnqjq` (`fieldId`),
  CONSTRAINT `fk_hbwtyywjzgbwvvoncuzaccvdnseexwqmtmxt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mipwhkjxbnpaguqezzmbytbhjmefhawgkptf` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nvhjlgqdybdcyhrxjrzzvlrbgvlwxuhxaqjb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (6,1,6,1,0,1,'2024-01-23 00:25:37','2024-01-23 00:25:37','083390d5-c2ea-40dc-a6cb-d61b37e1cd57'),(8,2,8,2,0,0,'2024-01-23 00:25:37','2024-01-23 00:25:37','7ab5b940-58f7-4e6b-952a-7eec73320c62');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aqpfcwkswrqocuuxsertsjvgluqcynihpcxf` (`dateDeleted`),
  KEY `idx_lmlbxmgilnadsiinlncduhcnuikrfdtssqqf` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,'55b472ee-d23c-417e-acbb-e24158eb9cf3'),(2,'craft\\elements\\MatrixBlock','2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,'2873fe42-dfef-433e-9bb0-b666b7aaf538');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jgcsrylqvjuowanfucagcfaimywdmspnuuuz` (`sortOrder`),
  KEY `idx_lwpunmphjvcbcuwxqfuvrbqegmnrizcwzpbb` (`layoutId`),
  CONSTRAINT `fk_eefeunevmofybrppnijdqjprrkeltjaujxvf` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (6,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"3a85e216-c039-460f-8e3e-6016da1a2d3a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"186ef2da-dcc8-4048-a88f-4aae49ed3226\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"90619285-e728-461d-aabd-7bf789279798\"}]',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','2e3f2bf4-b42b-4250-a5ad-dbe3aece952c'),(8,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5be7e43c-0428-46da-b59d-5434c760f4af\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7d7e9761-3bb2-420c-b2ed-4261b167287f\"}]',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','b9dfde4a-3b1a-4795-8fc6-192a762cb985');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jzmhwqwkwxyzdygwgduaqqpgwygpjckbccbp` (`handle`,`context`),
  KEY `idx_vmahbpeiwdcxiuixdfgpwlcqbvaytbchwxtv` (`groupId`),
  KEY `idx_iphxuuqucitaesenmpqcnodyumsduplobaee` (`context`),
  CONSTRAINT `fk_bgtwwrbhmfrqjvenaernmahbgtgwyexgfwet` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,1,'Modules','coreModules','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_coremodules}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2024-01-23 00:25:36','2024-01-23 00:25:36','90619285-e728-461d-aabd-7bf789279798'),(2,NULL,'Example Module','exampleModule','matrixBlockType:dfbf0d7a-bb6e-489c-bb35-3f40a63521fd','tbvmpfur','I am an example module',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-01-23 00:25:37','2024-01-23 00:25:37','7d7e9761-3bb2-420c-b2ed-4261b167287f');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jvdxglmnogcplhdqgykceptwjmeustjrbdhc` (`name`),
  KEY `idx_zsqxapornmbbtsmmczvloppeyryvztvsvgjv` (`handle`),
  KEY `idx_biofkzkqlcleodhpobikwmpmalklkvxhztrg` (`fieldLayoutId`),
  KEY `idx_wajrupmczudxcjynnxtnsjtnzmnhgeflggxk` (`sortOrder`),
  CONSTRAINT `fk_jwlqmkrntqhjcamnzqnitidknitdgkahhnzw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zewdjfuvshknmulfmdnmpgsjctfyddgicjqj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jhlfwapwmkhcohmhggclqgqmbqcgopbpdljk` (`accessToken`),
  UNIQUE KEY `idx_zjsqaxsfldmivvoyibrqfwihixwocpjxhjhf` (`name`),
  KEY `fk_fiulfgxmsvfjqktzttlaczpesloykhyjexyg` (`schemaId`),
  CONSTRAINT `fk_fiulfgxmsvfjqktzttlaczpesloykhyjexyg` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rncnwmhhafrdvvopfdtuilocvzwzfigdqnue` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_majqduckmhocphhymqsmaunjiskzgtzpyrac` (`name`),
  KEY `idx_xqzvvzofncecgujkdzodkvejjdeuduwydetj` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'4.5.6.1','4.5.3.0',0,'psdrvevoxfxb','3@ytutxiajam','2024-01-23 00:25:35','2024-01-23 00:25:38','2d50bcaa-9457-4b0a-8db0-15a0155cd5ca');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_youjxphdcrkuruuosxigwjrnamczwliudape` (`primaryOwnerId`),
  KEY `idx_jgznflnrnoerblkswplushvdaoclrehrlvwe` (`fieldId`),
  KEY `idx_avswsjppauuqcuiwcsjlzykbjkxdgnredfjn` (`typeId`),
  CONSTRAINT `fk_uugzqzezergkkkedalojqsuqsvxgnnamikcr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wxwjykwiodqkkshfrlbjokjrkpxumhtihuum` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xbpmellkhqbphfjobcspmaqksobypzouaanl` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xovhieqanxeogygwkhqfqnoqcetgmxcrbgcf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (9,1,1,1,NULL,'2024-01-23 00:27:20','2024-01-23 00:27:20'),(11,10,1,1,NULL,'2024-01-23 00:27:20','2024-01-23 00:27:20');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_umpqpbnjekioplkjgmcwdxijbyfjsfpukrul` (`ownerId`),
  CONSTRAINT `fk_lzvzyfcpsoidfgsjhvzqbwmqclhusvptwqpi` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umpqpbnjekioplkjgmcwdxijbyfjsfpukrul` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
INSERT INTO `matrixblocks_owners` VALUES (9,1,1),(11,10,1);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kcjcvmikgjyyidrfsbapnxubczcgwmpjrafw` (`name`,`fieldId`),
  KEY `idx_hpvlayvqelsuthwinflcmmdjbvfbotbcywja` (`handle`,`fieldId`),
  KEY `idx_vlkqykixeqbaprlqcpnncgifjlkbtcijewmx` (`fieldId`),
  KEY `idx_gbritvejnjvizrhjyhenhissiaesdmtdqtrg` (`fieldLayoutId`),
  CONSTRAINT `fk_shacohszislyehclyktagfmnfebmsimqofbu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tfkqlhuvrxjfpmgwkrbxnpjakyvbveloyult` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,1,2,'Example','example',1,'2024-01-23 00:25:37','2024-01-23 00:25:37','dfbf0d7a-bb6e-489c-bb35-3f40a63521fd');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_coremodules`
--

DROP TABLE IF EXISTS `matrixcontent_coremodules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_coremodules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_example_exampleModule_tbvmpfur` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ormhmuvobyceyeeohlxmjkawvwvtnxflgvpo` (`elementId`,`siteId`),
  KEY `fk_wcbwvuvbdmrspbburtgqwodoajoihoyquzdo` (`siteId`),
  CONSTRAINT `fk_sfhjvbxpjyflqxetqvuhuddinpfmlmjnbagv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wcbwvuvbdmrspbburtgqwodoajoihoyquzdo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_coremodules`
--

LOCK TABLES `matrixcontent_coremodules` WRITE;
/*!40000 ALTER TABLE `matrixcontent_coremodules` DISABLE KEYS */;
INSERT INTO `matrixcontent_coremodules` VALUES (2,9,1,'2024-01-23 00:27:20','2024-01-23 00:27:20','b39d9f0d-a6d4-4f94-a2af-db6bedc60911',NULL),(3,11,1,'2024-01-23 00:27:20','2024-01-23 00:27:20','f8130d3d-0f6a-4811-b720-4b5dfe60e775',NULL);
/*!40000 ALTER TABLE `matrixcontent_coremodules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_emoekfqknhrdscjuoabfffzlbczpzkmyogth` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'plugin:servd-asset-storage','m201026_093810_update_servd_settings','2024-01-23 00:25:36','2024-01-23 00:25:36','2024-01-23 00:25:36','831ee806-3fb9-428b-a2a4-7ec275f68e42'),(2,'plugin:servd-asset-storage','m201230_183610_copy_optimise_prefix','2024-01-23 00:25:36','2024-01-23 00:25:36','2024-01-23 00:25:36','467fae12-fb57-4d71-adde-444f7b24dc3a'),(3,'plugin:servd-asset-storage','m220119_204628_update_fs_configs','2024-01-23 00:25:36','2024-01-23 00:25:36','2024-01-23 00:25:36','1cb93f9c-f851-4439-8f50-5fa129b3d88e'),(4,'craft','Install','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','8c5774a6-0c42-4bbe-ac5b-8aada658dd41'),(5,'craft','m210121_145800_asset_indexing_changes','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','cce86a36-238a-4b07-8d42-816ce4b56ac8'),(6,'craft','m210624_222934_drop_deprecated_tables','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','6a0bdd4d-b30c-4a57-93f2-a316078de620'),(7,'craft','m210724_180756_rename_source_cols','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','71d9c7e6-981b-40ca-b28a-e42a6bc44e42'),(8,'craft','m210809_124211_remove_superfluous_uids','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','0a9cb0ab-24aa-4691-a352-27a13adfb267'),(9,'craft','m210817_014201_universal_users','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','fa7cd017-272f-461b-a45d-990a1a1eb904'),(10,'craft','m210904_132612_store_element_source_settings_in_project_config','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','21194b19-5999-498e-93c1-04d8ff5781e7'),(11,'craft','m211115_135500_image_transformers','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','e5a1d2d9-8ada-45e6-b845-670a9465812f'),(12,'craft','m211201_131000_filesystems','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','b251be50-7e06-47a1-88f6-cbc2d6311fb6'),(13,'craft','m220103_043103_tab_conditions','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','cf2e7e29-916c-40ec-8b7d-0e7ddb8bcfd1'),(14,'craft','m220104_003433_asset_alt_text','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','2003cf9f-2ae7-4988-a370-f75bee0f847b'),(15,'craft','m220123_213619_update_permissions','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','6f17e5f0-46aa-4818-828c-2628267a2e4e'),(16,'craft','m220126_003432_addresses','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','c8de2b9f-c6e9-4ad6-971c-37b5498c414a'),(17,'craft','m220209_095604_add_indexes','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','8a0e15c9-8530-443f-9b70-77ccded42a06'),(18,'craft','m220213_015220_matrixblocks_owners_table','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','79c26a38-6dcb-4a5a-b387-8729e1810442'),(19,'craft','m220214_000000_truncate_sessions','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','9adf471c-5b50-4762-89cb-e399be425ad5'),(20,'craft','m220222_122159_full_names','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','1ef7a1d3-11bc-4f6b-8163-bdf3a9488236'),(21,'craft','m220223_180559_nullable_address_owner','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','0342bdab-805a-442c-9039-0a3d4251a2c3'),(22,'craft','m220225_165000_transform_filesystems','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','1d33010c-75ed-44f5-9d9c-767d7e2b2eb7'),(23,'craft','m220309_152006_rename_field_layout_elements','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','5877eae4-46df-453f-9e58-d474ca555b55'),(24,'craft','m220314_211928_field_layout_element_uids','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','6f3e41ce-23db-46b0-9f0a-2e50ec84c54f'),(25,'craft','m220316_123800_transform_fs_subpath','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','3b570a6c-e621-4710-8dd9-f3b92882275e'),(26,'craft','m220317_174250_release_all_jobs','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','86cd393d-4d26-4247-9d49-a034828a08d3'),(27,'craft','m220330_150000_add_site_gql_schema_components','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','cd40abf3-af1e-4d77-a1ef-4e4ca878f08b'),(28,'craft','m220413_024536_site_enabled_string','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','8580d2cf-4eb6-458e-810f-f403f0087d49'),(29,'craft','m221027_160703_add_image_transform_fill','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','3311863a-ead6-4a9f-8254-1842cca747e0'),(30,'craft','m221028_130548_add_canonical_id_index','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','d84d1374-048a-4ea5-8a5c-dc64da81bec5'),(31,'craft','m221118_003031_drop_element_fks','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','c3c4ae2f-1f6b-4f19-a128-20ff61efc812'),(32,'craft','m230131_120713_asset_indexing_session_new_options','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','c7b4efd6-432a-4843-9fb8-80336e15091e'),(33,'craft','m230226_013114_drop_plugin_license_columns','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','13066b7c-3505-4cb9-a608-4cdf5b71da46'),(34,'craft','m230531_123004_add_entry_type_show_status_field','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','a3894423-4723-4eb4-bcf8-bd1bb63a501f'),(35,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','c0b36204-011b-48c6-ba4b-cefe3f364a0a'),(36,'craft','m230710_162700_element_activity','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','e185f990-68ae-476d-8de7-a8aa0e997497'),(37,'craft','m230820_162023_fix_cache_id_type','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','a0345199-03ae-41aa-ab05-3a4d5c48893e'),(38,'craft','m230826_094050_fix_session_id_type','2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:25:38','7b13f443-f5cf-410f-b42a-3a6cc6cccd1a');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mstkqnaqblnmibthyqkciuixnyvcdeiysvqi` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'servd-asset-storage','3.5.0','3.0.0','2024-01-23 00:25:36','2024-01-23 00:25:36','2024-01-23 00:25:36','2b096ee0-b5e6-4a59-99ea-153c681674a5'),(2,'twigpack','4.0.0-beta.4','1.0.0','2024-01-23 00:25:36','2024-01-23 00:25:36','2024-01-23 00:25:36','02099456-03a7-4776-a563-cadfe2acb703');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1702841415'),('email.fromEmail','\"creative@raraavis.design\"'),('email.fromName','\"Tecumseh Boilerplate\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elementCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.autocomplete','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.autocorrect','true'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.class','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.disabled','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.elementCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.id','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.instructions','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.label','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.max','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.min','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.name','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.orientation','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.placeholder','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.readonly','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.requirable','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.size','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.step','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.tip','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.title','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.uid','\"3a85e216-c039-460f-8e3e-6016da1a2d3a\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.userCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.warning','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.width','100'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.elementCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.fieldUid','\"90619285-e728-461d-aabd-7bf789279798\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.instructions','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.label','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.required','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.tip','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.uid','\"186ef2da-dcc8-4048-a88f-4aae49ed3226\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.userCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.warning','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.width','100'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.name','\"Content\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.uid','\"2e3f2bf4-b42b-4250-a5ad-dbe3aece952c\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.userCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.handle','\"homepage\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.hasTitleField','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.name','\"Homepage\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.section','\"7aa67058-a1f3-46ad-8a6b-4cc480137301\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.showStatusField','true'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.slugTranslationKeyFormat','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.slugTranslationMethod','\"site\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.sortOrder','1'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.titleFormat','\"{section.name|raw}\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.titleTranslationKeyFormat','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.titleTranslationMethod','\"site\"'),('fieldGroups.82722786-54b3-49e2-8e7b-d1e280e90288.name','\"Common\"'),('fields.90619285-e728-461d-aabd-7bf789279798.columnSuffix','null'),('fields.90619285-e728-461d-aabd-7bf789279798.contentColumnType','\"string\"'),('fields.90619285-e728-461d-aabd-7bf789279798.fieldGroup','\"82722786-54b3-49e2-8e7b-d1e280e90288\"'),('fields.90619285-e728-461d-aabd-7bf789279798.handle','\"coreModules\"'),('fields.90619285-e728-461d-aabd-7bf789279798.instructions','null'),('fields.90619285-e728-461d-aabd-7bf789279798.name','\"Modules\"'),('fields.90619285-e728-461d-aabd-7bf789279798.searchable','false'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.contentTable','\"{{%matrixcontent_coremodules}}\"'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.maxBlocks','null'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.minBlocks','null'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.propagationKeyFormat','null'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.propagationMethod','\"all\"'),('fields.90619285-e728-461d-aabd-7bf789279798.translationKeyFormat','null'),('fields.90619285-e728-461d-aabd-7bf789279798.translationMethod','\"site\"'),('fields.90619285-e728-461d-aabd-7bf789279798.type','\"craft\\\\fields\\\\Matrix\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.field','\"90619285-e728-461d-aabd-7bf789279798\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elementCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.fieldUid','\"7d7e9761-3bb2-420c-b2ed-4261b167287f\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.label','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.required','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.tip','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.uid','\"5be7e43c-0428-46da-b59d-5434c760f4af\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.warning','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.width','100'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.name','\"Content\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.uid','\"b9dfde4a-3b1a-4795-8fc6-192a762cb985\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.userCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.columnSuffix','\"tbvmpfur\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.contentColumnType','\"text\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.fieldGroup','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.handle','\"exampleModule\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.instructions','\"I am an example module\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.name','\"Example Module\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.searchable','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.byteLimit','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.charLimit','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.code','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.columnType','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.initialRows','4'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.multiline','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.placeholder','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.uiMode','\"normal\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.translationKeyFormat','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.translationMethod','\"none\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.handle','\"example\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.name','\"Example\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.sortOrder','1'),('meta.__names__.0d3b124c-a22c-492b-905d-244d625e5e84','\"Tecumseh Boilerplate\"'),('meta.__names__.7aa67058-a1f3-46ad-8a6b-4cc480137301','\"Homepage\"'),('meta.__names__.7d7e9761-3bb2-420c-b2ed-4261b167287f','\"Example Module\"'),('meta.__names__.82722786-54b3-49e2-8e7b-d1e280e90288','\"Common\"'),('meta.__names__.8878a560-e842-40bc-a612-27fcdf9fb770','\"TecumsehBoilerplate\"'),('meta.__names__.90619285-e728-461d-aabd-7bf789279798','\"Modules\"'),('meta.__names__.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e','\"Homepage\"'),('meta.__names__.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd','\"Example\"'),('plugins.servd-asset-storage.edition','\"standard\"'),('plugins.servd-asset-storage.enabled','true'),('plugins.servd-asset-storage.schemaVersion','\"3.0.0\"'),('plugins.twigpack.edition','\"standard\"'),('plugins.twigpack.enabled','true'),('plugins.twigpack.schemaVersion','\"1.0.0\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.defaultPlacement','\"end\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.enableVersioning','true'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.handle','\"homepage\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.name','\"Homepage\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.propagationMethod','\"all\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.enabledByDefault','true'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.hasUrls','true'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.template','null'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.uriFormat','\"__home__\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.type','\"single\"'),('siteGroups.0d3b124c-a22c-492b-905d-244d625e5e84.name','\"Tecumseh Boilerplate\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.enabled','true'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.handle','\"default\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.hasUrls','true'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.language','\"en-US\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.name','\"TecumsehBoilerplate\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.primary','true'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.siteGroup','\"0d3b124c-a22c-492b-905d-244d625e5e84\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Tecumseh Boilerplate\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mcghjnwlouhyolznylbcxwaxmvuneffuzdcn` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_znhsiawcpjiqvkgcjflkizadmetxgtklzouc` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lzddlijsolzrjqvldhdgcrvvnsgumwsibasd` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_jcexuuodlozgmnlbeffxjcewexhfgptpoqgq` (`sourceId`),
  KEY `idx_rhlslzditwsnkgfsywzfejyhhvauosstsmuf` (`targetId`),
  KEY `idx_txunznourutopabjbtaiidmlkfoyjhvapqxg` (`sourceSiteId`),
  CONSTRAINT `fk_ggtguegfjzgaaiqvpnvccrtmucqoabtwxmpx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_psqadyzfljqcfsuyflcsrurrufoxtnogolja` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zfmfdpiyvpvomlvjyaqyvqkffrnhqwzbhoci` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('15c6b027','@craft/web/assets/xregexp/dist'),('17a267e3','@craft/web/assets/craftsupport/dist'),('1e7e0d27','@craft/web/assets/picturefill/dist'),('2225d7f9','@craft/web/assets/jquerypayment/dist'),('2276089b','@craft/web/assets/jquerytouchevents/dist'),('27b2d54e','@craft/web/assets/velocity/dist'),('28b75aa7','@craft/web/assets/feed/dist'),('51f47c6c','@craft/web/assets/dashboard/dist'),('60173a8c','@craft/web/assets/fileupload/dist'),('716b63d9','@craft/web/assets/elementresizedetector/dist'),('748b7c31','@bower/jquery/dist'),('7e6cec27','@craft/web/assets/jqueryui/dist'),('8eb4d384','@craft/web/assets/recententries/dist'),('964146dd','@craft/web/assets/axios/dist'),('a12d5011','@craft/web/assets/tailwindreset/dist'),('a638ea33','@craft/web/assets/selectize/dist'),('aa70487b','@craft/web/assets/cp/dist'),('b00e91ea','@craft/web/assets/updateswidget/dist'),('b0456e32','@craft/web/assets/d3/dist'),('bb246785','@craft/web/assets/iframeresizer/dist'),('c81ad198','@craft/web/assets/garnish/dist'),('e0a8e68f','@craft/web/assets/fabric/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zemtottvwneahgihybfrijrlnjkjpjrxxmcg` (`canonicalId`,`num`),
  KEY `fk_yostmhtckbfysxdzcmjczzepxxsfzdawzdke` (`creatorId`),
  CONSTRAINT `fk_alxdpckhlmoihlnosbereqbnxksriawnrkpe` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yostmhtckbfysxdzcmjczzepxxsfzdawzdke` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,1,NULL,1,NULL),(2,1,NULL,2,NULL),(3,1,NULL,3,NULL),(4,1,NULL,4,NULL),(5,1,6,5,'Applied “Draft 1”'),(6,9,6,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_zzizaohyholbxqfpqtkrlkhveudqmzcvhkcd` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'slug',0,1,' homepage '),(1,'title',0,1,' homepage '),(6,'email',0,1,' creative raraavis design '),(6,'firstname',0,1,''),(6,'fullname',0,1,''),(6,'lastname',0,1,''),(6,'slug',0,1,''),(6,'username',0,1,' raraadmin '),(9,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_srfrpifgypyfpqundstsursflfpvecbkqeoi` (`handle`),
  KEY `idx_omxvhnatibmyrqypyjnnrhahfffdyagnokwi` (`name`),
  KEY `idx_xrtxivbawqsxnztomljogdxanptokeobcjbv` (`structureId`),
  KEY `idx_klmaxacouqbjdmxphfhpdwrxfgctvyaaehrt` (`dateDeleted`),
  CONSTRAINT `fk_qmcxuagwiwccgwixfebkgokieqvjmqnuddgc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all','end',NULL,'2024-01-23 00:25:37','2024-01-23 00:25:37',NULL,'7aa67058-a1f3-46ad-8a6b-4cc480137301');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mourjogkfsfoolcwdvsvilweyydniublqciu` (`sectionId`,`siteId`),
  KEY `idx_jucaslipqvysxxeipnkunsbtpkybjnhnbavh` (`siteId`),
  CONSTRAINT `fk_qqsovrgdzbkxegqmukhuhygvehlddkixwuqh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rbdqssmnfjcmrcoltsnugicbxcsecqanuphg` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__',NULL,1,'2024-01-23 00:25:37','2024-01-23 00:25:37','93964bc3-5c64-47e8-a5ed-a8ce6965f6b7');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pkmhsqobimzbjjbiqgymmnzzbfxfgoorwvgg` (`uid`),
  KEY `idx_vhjiytkkekdvbvmazncamwkeqcsnpodjpstt` (`token`),
  KEY `idx_iwcerkvdfhcqgkfwytgqakqoidqqkrkdtqwi` (`dateUpdated`),
  KEY `idx_bzndcchnpbylkmuguufowglrgiscwsxdnqer` (`userId`),
  CONSTRAINT `fk_bhjfqkvkfvzsvkllwsjiysogszszbgbqfszl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,6,'zo4nhRvZfWc26G-BmdJrXoB3VhJwCoGtvblTY0_rCtpJct8mmfubmYp1SrV68VNRsB-nVYzgs4uL2NKZGJIVifpvR811urCFrwbA','2024-01-23 00:27:02','2024-01-23 00:27:21','5837f767-df06-448b-b4c8-766bb99557f4');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vsukoghxcvffluqekfqkwqsydazooknpuzxj` (`userId`,`message`),
  CONSTRAINT `fk_bwootybfqrtedsmsqkwbvbwhdethxfppckso` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qhgioaefbgovivmhhqgqbmbwcauzhfloybjc` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Tecumseh Boilerplate','2024-01-23 00:25:35','2024-01-23 00:25:35',NULL,'0d3b124c-a22c-492b-905d-244d625e5e84');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mgjlwebdfckygjduhhxvkbwdaevrrokyirih` (`dateDeleted`),
  KEY `idx_anecoiugtmyzsjudbmzalcetbasmnucmknft` (`handle`),
  KEY `idx_thfdwtfjnqmifrkrtrykxhoparbushntuqzk` (`sortOrder`),
  KEY `fk_xnxkoiuiuogayuxzxqypqgdeqkaeandjlowm` (`groupId`),
  CONSTRAINT `fk_xnxkoiuiuogayuxzxqypqgdeqkaeandjlowm` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'1','TecumsehBoilerplate','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-01-23 00:25:35','2024-01-23 00:25:37',NULL,'8878a560-e842-40bc-a612-27fcdf9fb770');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tjzphrimbdfwahintgvqygakunkqjyvdeges` (`structureId`,`elementId`),
  KEY `idx_khkbnmyoymsxhrpmyguuczdkdjhojzfjyfeg` (`root`),
  KEY `idx_cmwybrdwmllgthxxqxgbhlhzgrljazounsip` (`lft`),
  KEY `idx_jwfqsejbdpglsebmnrwspaiqxsencokwphnd` (`rgt`),
  KEY `idx_yxyqwushroworbvnkrydbawmpdzcabvkawud` (`level`),
  KEY `idx_obuayrezqabvctxbkzxmgrmqzmyjgjgtqxjo` (`elementId`),
  CONSTRAINT `fk_nnpqmevguylijbldyldsjgvvadkiibkwvxhp` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ybnwnyyntcyzcfhxdptfrebteyjcsiqsxrvj` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ylclevbhmeyutiseommbqngkixklyubpcabx` (`key`,`language`),
  KEY `idx_hhfympjpqdsoapujwktcgiugdkkgaldrnzuh` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iqfxsffhmxwmfplvazfdzobtxgeomfrvahtu` (`name`),
  KEY `idx_wxnvnikrdmkpzgbjslekncyojahbdzqlxpxu` (`handle`),
  KEY `idx_lsnomzbxfmmwppvrpzwfvacqmmxufcrvqtlk` (`dateDeleted`),
  KEY `fk_gqgdgmnnbiuzvutvsivkidpmmusdxsaoaxum` (`fieldLayoutId`),
  CONSTRAINT `fk_gqgdgmnnbiuzvutvsivkidpmmusdxsaoaxum` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tftakethtssmzfmwgwrsuxxfsjwllfpgsipr` (`groupId`),
  CONSTRAINT `fk_gycjujjazpqqsjlcjxktjiwcrdnyeyhtwjgn` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_htjrzjdhxewxjjwuhpmgbxnlnoqkgemydplc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rvyebjhhglgcmaenkxvsmqpqbdgogjpxpqvl` (`token`),
  KEY `idx_icljzovwrhbfukaxlhdkqhfzghxrnamqnkod` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ldqihoshjlsfyhpautcsjdzvphrvjrxhjgem` (`handle`),
  KEY `idx_gplwayxeyhfqacnxnpyfbqvrguwpnqgbnhlu` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mlpgiplzdyvustmzuovqmblyngjvnndzqlbt` (`groupId`,`userId`),
  KEY `idx_wnjhyzbovteexwareqwzuagsjvjdysgstpkx` (`userId`),
  CONSTRAINT `fk_cflorwkmcaikpevkhjqpnnqpspodhencpnpf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ebqfnzdkheiqryychfzebqcmhmeyhbkdbaqa` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_guzlclvceuxjuofmvdtdsqmywwmfgjyikxob` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ivbjbdolbucmfzqaljuhivwqrvhsxixjhkyx` (`permissionId`,`groupId`),
  KEY `idx_iwveiposllelpcvukfrxvkuzcmnpglukbyjy` (`groupId`),
  CONSTRAINT `fk_mwkojklgugfhdozduekwtdpshbdkfcozdhdq` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ymttbxmeunylawnxvmmcunqvkybygyodncjf` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qfcnxfyknbssxmdckvezrkqeytuucryjfiyw` (`permissionId`,`userId`),
  KEY `idx_mmbglbicrwnvdvbdexjgqppuvhgtggqrrisa` (`userId`),
  CONSTRAINT `fk_deotorhcgmhzxqjqacskkaeitjygiowfqizi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tsactldaupjeuwirqoasupwgxrpvfrtsupbt` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_oachrkdbcaievhzewarejwxhcuxccepwigeq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (6,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_txjfyyfdxfblxevxeeuzgnlaymuzddybicin` (`active`),
  KEY `idx_zzgrixstifekbcnwskwdeiazglaifhexiplf` (`locked`),
  KEY `idx_asbjrachubebsuelxyctjdzcuvjepqceyuyb` (`pending`),
  KEY `idx_vmelkmkmsvhlddpdjqfrcqwywrbcpehykvqd` (`suspended`),
  KEY `idx_gcghqthrolifnihnacqwvjytkhhmvsdqugvi` (`verificationCode`),
  KEY `idx_hwagljgqtubdutjfdasybezkjydpnjrmqsxv` (`email`),
  KEY `idx_kxlirsunrqwmuokydpnkmdddtnctcsgcaatb` (`username`),
  KEY `fk_hlirbqndhhnwzbzboqgfpuzyztimvltariue` (`photoId`),
  CONSTRAINT `fk_bkdeqpeztccscqeocpsmgdbiomcpxxhmexbn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hlirbqndhhnwzbzboqgfpuzyztimvltariue` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,NULL,1,0,0,0,1,'RaraAdmin',NULL,NULL,NULL,'creative@raraavis.design','$2y$13$N0vw7rDZ5x9IMGkmumLMbugRNMP7A/Badj.rkMsyzZgBZ9Hke4YRS','2024-01-23 00:27:02',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-01-23 00:25:38','2024-01-23 00:25:38','2024-01-23 00:27:02');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ativoltbnjvivlxeisxojyzpllpsbhdmhwml` (`name`,`parentId`,`volumeId`),
  KEY `idx_snnpjflzzvwkpktxdzlzqvyvtacomtczfgtx` (`parentId`),
  KEY `idx_hmvojslsjvxpxkliqegeatmbqfxhhakhbxor` (`volumeId`),
  CONSTRAINT `fk_dffnaaspmardjjyivhuhebzjsetvvaqxsujt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thtyoqrifqillrnewmhwhnifhozcxxkjqkba` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wjztzrimcizxajfysbeuszysinidmtrlavej` (`name`),
  KEY `idx_nvlylrnviteomsorvfkneeiutxfwbnzhjeah` (`handle`),
  KEY `idx_ngohgovsmdilsehkofwnnoizgasitxhedvng` (`fieldLayoutId`),
  KEY `idx_fxhtpfexttksvxbuapvkxkihvudivlwarplp` (`dateDeleted`),
  CONSTRAINT `fk_ssfmzgndxiwcpoieylpnydntegyadsgxecet` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ovjoqyloaujmjppmmfnfoejmmurkzsdzevnu` (`userId`),
  CONSTRAINT `fk_suhdazlgcuuvkrtnwryqrihjqywmacowbkxi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,6,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-01-23 00:27:02','2024-01-23 00:27:02','ab33e8ae-cb1a-4b4e-8147-ca0091dc3ed0'),(2,6,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-01-23 00:27:02','2024-01-23 00:27:02','8e4ae84c-d2c7-4139-8d3f-28615c0a799e'),(3,6,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-01-23 00:27:02','2024-01-23 00:27:02','5447a015-3852-4630-a1ff-3e67ae9874f5'),(4,6,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-01-23 00:27:02','2024-01-23 00:27:02','4c680f9f-f2a6-4d37-9122-34bdd8b7f207');
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

-- Dump completed on 2024-01-23  0:28:25
