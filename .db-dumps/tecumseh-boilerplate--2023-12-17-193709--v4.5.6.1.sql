-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB-1:10.4.32+maria~ubu2004-log

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
  KEY `fk_jnvokkzivvydhpudsrtmiijliquugqwpgkix` (`ownerId`),
  CONSTRAINT `fk_jnvokkzivvydhpudsrtmiijliquugqwpgkix` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kltwxuuwvcfhtbrcniosfajcirlklufppyia` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_oijojzjnaetoxlflddczipncgrdknmdmfxqe` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_mknlvtykpnyxrpmzlymlcdzhsnxiudruommv` (`dateRead`),
  KEY `fk_ijliizautshpifpdsnkxhywkkqfebghxkwii` (`pluginId`),
  CONSTRAINT `fk_ijliizautshpifpdsnkxhywkkqfebghxkwii` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ttwplknscbwngamoaeivvetchlgwphlpqxog` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_qopussnxfulegwazpavjmvvituhcwkekpfdu` (`sessionId`,`volumeId`),
  KEY `idx_qwvqppjvgxpnumlqrgwqyuwpqfqlyribxmwq` (`volumeId`),
  CONSTRAINT `fk_kufnhogkxzkacmwybsbbacxvfzynglmkgnra` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ytbyocnysanikviibcejoizmyjelvihpunuv` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_upeatuzigpfneysqgvhwpwjggludybpumfbq` (`filename`,`folderId`),
  KEY `idx_kgnckxzmskurjrfuatnulbnwqivqbjcbjbes` (`folderId`),
  KEY `idx_ubnktxicubinpiglyktfqbquwtpjznbgowto` (`volumeId`),
  KEY `fk_ayxgyjpghjqlwrldkrqczlhzgyaiawismhqv` (`uploaderId`),
  CONSTRAINT `fk_ayxgyjpghjqlwrldkrqczlhzgyaiawismhqv` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_iegxbabdmtvngmrxizgdnhyqlindmnkdxbxw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_votyjbnholcfjkgfxjgsauxlijhohopuuidx` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zlppmgfdcijupsjkowxravjebaeoiobfhttg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_ggtiabzxmnrlxhytjkgexpktingriivtnhsj` (`groupId`),
  KEY `fk_nywewouafjlormkejnnjrbqchsolnvewfzpb` (`parentId`),
  CONSTRAINT `fk_azfrqboaxqdewcjhubcotlefqbgckbztnpda` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_buzipmyquysgexrmdvqtuvhdssuqnbjomkhu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nywewouafjlormkejnnjrbqchsolnvewfzpb` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_wvrotipycrnkolpdxteibphfbgeufkpwbphk` (`name`),
  KEY `idx_abqddwcnkvzienutdrpscylipzgrdnhqmqaa` (`handle`),
  KEY `idx_ayprgocvyiyrmnqbzuvhmrwjvfactslflqzg` (`structureId`),
  KEY `idx_yfxsnhswqgjrzgzzsvswkkrsukxcavzbbucn` (`fieldLayoutId`),
  KEY `idx_xibljchifzxvbyqdwqxqorrvsrdapdsmeplr` (`dateDeleted`),
  CONSTRAINT `fk_dgvbqzcgussdipblrwizbqpznejgxidivwgs` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uzucqrvmeppygtwvyxjviebqjuqvrzkematp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_dbkpflnmuouhasyhduurnbthfyuhexcdjzxx` (`groupId`,`siteId`),
  KEY `idx_ugdmichnowusimyfpphbtjmhauhycfyokyts` (`siteId`),
  CONSTRAINT `fk_xgovzqlexuipbdikmsieqrmfkfbxctpofkvm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ylzpozddsaaumwzswlautgycecygvnrkbmig` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_tmljhlidponvgqdcpcpxxwfkiqqkpojvumtf` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_wostplbzrikmzmzjlgsmfxecvwsbqahsrtnd` (`siteId`),
  KEY `fk_hfhdklxmwxvmeechplnelgfrucxfemgbgcoj` (`userId`),
  CONSTRAINT `fk_hfhdklxmwxvmeechplnelgfrucxfemgbgcoj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_lkvjusgbkbbvwerdtzubpaonbqbglpbmxomm` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wostplbzrikmzmzjlgsmfxecvwsbqahsrtnd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_hwmukgoivmnkdtuzkalimzrsvjsoadghjkyr` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_fzsljzklufnmkbrwwmntobwriasvllrvsxsf` (`siteId`),
  KEY `fk_tcvpbbdnijzankonsouryqvbzjatxcrqiifs` (`fieldId`),
  KEY `fk_cljepjlgrcuijkyodvkejuaylkoqmdduxeqr` (`userId`),
  CONSTRAINT `fk_cljepjlgrcuijkyodvkejuaylkoqmdduxeqr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_fzsljzklufnmkbrwwmntobwriasvllrvsxsf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hfdpysistniapnokovrgswjaqybopasfnetp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tcvpbbdnijzankonsouryqvbzjatxcrqiifs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_jrfohqectvirnfwbmcbllutcvvkhyotxwbcw` (`elementId`,`siteId`),
  KEY `idx_ytpytroccaljelsjalwtirxqgfgtdkglmbld` (`siteId`),
  KEY `idx_mnkvvstdwerjgqvcianawrymwhanetrwwped` (`title`),
  CONSTRAINT `fk_qoiqmkonvjwxaoozgejhjbwvvttkgfvhcreu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rvkrgpzxcsxgqewpdcthxxwentwwvathctwy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `fk_axfufxpuiqwlsxcjswoqppuyqytrdkiwxnyi` (`userId`),
  CONSTRAINT `fk_axfufxpuiqwlsxcjswoqppuyqytrdkiwxnyi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_rihypcjxyskdqjvixqusldtnxjqhabomgqsj` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_hvmwcnqyjaqtmhkpkdrlvzjsdyzzsrvinxci` (`creatorId`,`provisional`),
  KEY `idx_upbmxotwbuqrszhckczhnydghauglljkrgbq` (`saved`),
  KEY `fk_eguosvrpjehstfegheeesjvhudgvarcyvyhg` (`canonicalId`),
  CONSTRAINT `fk_eguosvrpjehstfegheeesjvhudgvarcyvyhg` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vccuchxfbiwyjibylmavcrwhxgoypagdewzg` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_sjjuvcoaqpdwbdvtiowpfhbufeipigxkcypf` (`elementId`,`timestamp`,`userId`),
  KEY `fk_gsfzwejqhkdtardoxauinkmfqqzzorzecgic` (`userId`),
  KEY `fk_imrcknsrzdxfmuqodnqmnclnhdlnksxbnidx` (`siteId`),
  KEY `fk_meitcudrzrtqhliatgbowwnbgfjrrnmiwiet` (`draftId`),
  CONSTRAINT `fk_gsfzwejqhkdtardoxauinkmfqqzzorzecgic` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_imrcknsrzdxfmuqodnqmnclnhdlnksxbnidx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kgfpilenmoqwoayqdpxebhcmdjqegtpuotku` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_meitcudrzrtqhliatgbowwnbgfjrrnmiwiet` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_bbuyrsqsyjzasqsyjuixwelghggihnvwbgvf` (`dateDeleted`),
  KEY `idx_xodxofmdlcugbtietgmetirrgspnddemewly` (`fieldLayoutId`),
  KEY `idx_xjxzwekdmvszsndrhziehasptqwjjkplukan` (`type`),
  KEY `idx_nqaedtlzybpsylbqgxzkiuadfhwuucnchnfo` (`enabled`),
  KEY `idx_iuiktedboayekhtbvrwugfjczitkegvsmcmm` (`canonicalId`),
  KEY `idx_rniqnmolajwodqgnlxqrayvayeibuuiuocjl` (`archived`,`dateCreated`),
  KEY `idx_jztzpttrjiaybhspbosxmyemazdatjzwdfhr` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_wgomqzgmovdoolfikpzklnipcgjymssnwpqw` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_tlgaxafxkaarbevgdotsnvrrqvtwrwwegoue` (`draftId`),
  KEY `fk_gfezphhmquptdvfoplrtplbbumhlzuvscbdi` (`revisionId`),
  CONSTRAINT `fk_gfezphhmquptdvfoplrtplbbumhlzuvscbdi` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ortvqxmbdgdcmgfxpoqervuurljwfvjsxxmi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pzssfmvudymhwuqkmnccmyopncpbvnmteoem` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tlgaxafxkaarbevgdotsnvrrqvtwrwwegoue` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_vweqowytyldebtzosgwrgfasuaqabdeqrpsv` (`elementId`,`siteId`),
  KEY `idx_nangufmpdrzokwvhoevawxndoebavsgwkmst` (`siteId`),
  KEY `idx_vxqhdlcsibqircthbsqnjqvmesbzvyfnqhro` (`slug`,`siteId`),
  KEY `idx_athcivjwnjckzxatjhoraoztimlndwdrlntx` (`enabled`),
  KEY `idx_mcblpnqypzhddzxccxbjilhsgatxxhwxafke` (`uri`,`siteId`),
  CONSTRAINT `fk_bakotbzetrasggtyvhergipnyeemunruyqyt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gxxwhehgauchgwxbmeukhbkpwhxrvhusqvst` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_uxglvqmauqxdrcqathrtukzzftmbuzpqjkwb` (`postDate`),
  KEY `idx_gemraeiibpvcmgxvitkpiddcmgueyszjqgoo` (`expiryDate`),
  KEY `idx_pzoftedrrxthtrzotictycafxwtmdwadbpgn` (`authorId`),
  KEY `idx_bozuyhibufvgjgxbubzlvgaaxzqwcvnjlkum` (`sectionId`),
  KEY `idx_dgkqxpehrtddkorkvnfutwgngqhreqsippwu` (`typeId`),
  KEY `fk_ovtyqhydpsrhyczankqfqaopvbkqwlworgvv` (`parentId`),
  CONSTRAINT `fk_kphnigyhinsldzolzbahzwtdoxsgnteoxecv` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nzdztnzhpvsvzkencdnmgghjecjqugylhwrd` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ovtyqhydpsrhyczankqfqaopvbkqwlworgvv` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pidivlurmsxihfsskodusrihbtawewgqtstc` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vymxvjetjvlybvfnltxnuihfbgcbobjfbzpl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_sqwykuhswrbdqwtamndnakaufwlfhrultcmw` (`name`,`sectionId`),
  KEY `idx_ebvamwkfwvhzlzfskxlzradotbmkpqncaqis` (`handle`,`sectionId`),
  KEY `idx_ocadnfkmbxuqsppazwbhvadlsemwrdvzjyjd` (`sectionId`),
  KEY `idx_xnbmddhyjayidlfechlekxkjqrddihxjbupj` (`fieldLayoutId`),
  KEY `idx_looplvdpioupgmajikoimozoqikvluvterit` (`dateDeleted`),
  CONSTRAINT `fk_orrpefkdzfuwaomzbwejsgncidzlpomzakip` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_udgfgkrzdjuescsixsccfeehlrujtsjnjzrj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_pcrxlhaxmogypvdnslayekwvciahmmdchzqz` (`name`),
  KEY `idx_dlkqjamomukwawwtlkhchktwnyyvxesjxduk` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_ojbjsfwmixmjdopijakqvqegrssuxlpsxcyd` (`layoutId`,`fieldId`),
  KEY `idx_eencbtbpwyzprkekahkesvscvzuhfbhvyrbe` (`sortOrder`),
  KEY `idx_hlasbvrtdhrpxvonlqofjmtpnzrdpsfzonhv` (`tabId`),
  KEY `idx_aeanbeodgoyppczggwewgixsxdgfyjmqqozl` (`fieldId`),
  CONSTRAINT `fk_azhebqbaulkmmowjzhvecgtrzpbkxdxsntlu` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mqyvcarrtwahacdnqyslgumtcpuxbtdptddw` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qekammvlzkrvbnpkclbvrlhejqolijhbotmx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_xqhaangksvsldwrenpfautgepthqnlmizptf` (`dateDeleted`),
  KEY `idx_ajczgkbnroirdngokrkeapvkobzodsuepolg` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_ywljayerfqyawgqkuxtcwhhdkaeihdesdhvx` (`sortOrder`),
  KEY `idx_ocnljvmdgyrrvyfupefzsmricgnzmbswozdr` (`layoutId`),
  CONSTRAINT `fk_cnreosytahnthakusvpiohxfkiqhbxtuwkcs` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_xnablsnyexppgzhvzbtracyleuhzadeuzhnh` (`handle`,`context`),
  KEY `idx_apmwcqdcxnhsehotcmpeklfdmzeptvyrocey` (`groupId`),
  KEY `idx_ksyspvbpxpkfhuwyuwbxiqsittoptrrglpvo` (`context`),
  CONSTRAINT `fk_sjirknqpktmadywposnlpkkyigknbynsnlru` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_pzmzomjgstkgjvcabagvynsdtnfaldxnuybh` (`name`),
  KEY `idx_fghrdgfvecscstkutgopzlogktmoartzkrje` (`handle`),
  KEY `idx_vfkgpzlwdunlwtsvktqblksjaqgfvfmhekoz` (`fieldLayoutId`),
  KEY `idx_novzbemowfxxhqkpgtemdodwqdvrrxjcgmpc` (`sortOrder`),
  CONSTRAINT `fk_eqlssvulzuxpqtylkkhlxwlncufvfzqpcndz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kahrbfmtyzfcjxsnwgovjvyknwqqbnmhuqmf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_uvzmxtbwusgwgzhqqmtcqkgsyzyeabdvfqrl` (`accessToken`),
  UNIQUE KEY `idx_ritpqgivgiguvgvqmbjepucjkfiquypcxfan` (`name`),
  KEY `fk_zqgnyxsloglwspusmxiabrblipqpufotroor` (`schemaId`),
  CONSTRAINT `fk_zqgnyxsloglwspusmxiabrblipqpufotroor` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_vcoauzrlglpxqoqhnfnegltgfgjdwdixnaty` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_gdsndtmhhdmaybkmwpdkfjjcinvredtiajec` (`name`),
  KEY `idx_pvlnrhyzqspsigqqfwznfbnodxohtkwkgxsh` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_upooziowycznrujhssqqmkmvhlvipqgqpfoq` (`primaryOwnerId`),
  KEY `idx_cwixzwuhigqrvyxgtaibrdxvxyqwguaywrkq` (`fieldId`),
  KEY `idx_nmklrulqphpobxyiflysisguoocuemvljanb` (`typeId`),
  CONSTRAINT `fk_fmqmesjfjyqkmnxrhenyacyvjikmwpvongqg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lfkpvppfqayjiydhxnorwqltrwkejsnjpbeo` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_otpypaayjdhdiahbpoqgskinamkndjlumqhb` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdajwsxibypgnqzeujcaielfdkyvqotexzrp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `fk_vowgbalgbkyjhmfmyotxyfbxiowsswsitpkx` (`ownerId`),
  CONSTRAINT `fk_szsbzokonwmnvwkdbxtaxbbsnkxpbnwfucun` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vowgbalgbkyjhmfmyotxyfbxiowsswsitpkx` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_ftetluegnwbpaubdiqagjdxurcmnxfiwugbm` (`name`,`fieldId`),
  KEY `idx_pmghkxxsywdoyqrwaxvyduksmhzllqeflppg` (`handle`,`fieldId`),
  KEY `idx_whmmjsloltuklvczhotnfopxmaouczbvwdox` (`fieldId`),
  KEY `idx_bfunibhndbbdikyutrvtwjvglldiuvupvxta` (`fieldLayoutId`),
  CONSTRAINT `fk_iqfecgtpcfcolbsnjscvuaztsytpdjefghsp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_whdfhhytmiyaqbpwhbtuxugmgbxzbfdqfmwi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_nboybtzoktefiioloicgifsgmhtxjkoiwycb` (`elementId`,`siteId`),
  KEY `fk_ihstfmexpisxupvmoglouiemcorgwrddntca` (`siteId`),
  CONSTRAINT `fk_ihstfmexpisxupvmoglouiemcorgwrddntca` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jjxuvzdhydxwbxmodbolfeqolapjsphmgrrf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_hmxvnlhgziswkpggykeoxitthuxbeslbvcqm` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_uolxwumsmyugisqstxbcwvoycjvfuvijzabl` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_gkjdycgqbgwnjlgdrgpftzpgsezggawbvanp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_vrsgdzpgulljtwxncayknkbchjyzfgtsdojb` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_qenneeqrysqunijhgyezajtiqsrfynvujeob` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_wmmbqxmcryjflqkecuxfnlithbgeciqllbts` (`sourceId`),
  KEY `idx_lloyewtvxmhcgjemngqxbyzreatzkeuujdor` (`targetId`),
  KEY `idx_hraxphbejujsyworuovgxfbjhbuwxwffnhct` (`sourceSiteId`),
  CONSTRAINT `fk_ejbzguovvgphyhzkxntmhnchamdlrgxslvrn` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qcuacfmrvrqzzkzplplmkjepqpcqzydmhcmv` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rilvzbldshfvlcmnvbpmzongfbaqnyjiflvv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_mtaawdtyfnrtfrlnudszmqypqhqjmizvuhrq` (`canonicalId`,`num`),
  KEY `fk_zcpcsxgtokfcwjwlygmkiadnsgouxhiybqbx` (`creatorId`),
  CONSTRAINT `fk_qndkhdkvwmnuxctawlmlxjqjdcdjcotxakcx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zcpcsxgtokfcwjwlygmkiadnsgouxhiybqbx` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  FULLTEXT KEY `idx_hfrzgyvsvlxkdzcfcjpcuvxdksyjokwuwtqv` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_kurxgynwdwzffnozgvmibnzrllinssrfbxlk` (`handle`),
  KEY `idx_lpazvmbcxdsszapausmpqgfzmimdbacrzxjy` (`name`),
  KEY `idx_tveasqefgxxarigxmbrcurglazlqluwcvams` (`structureId`),
  KEY `idx_eycoxdogkfsbnxpxgixrbeavsntffdyfwdid` (`dateDeleted`),
  CONSTRAINT `fk_znpjcktuytsmcybwspsaueiuiapddxstjldf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_wlgacgkgwxgoneedkyhrvdlieifppfvbvtxf` (`sectionId`,`siteId`),
  KEY `idx_vsnfupsaupmkgmqbyyoxdtljorbkmdlezazx` (`siteId`),
  CONSTRAINT `fk_gqvefsislmbamiyralpuhxlgpsrntdydoeix` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_krzxehblzddjocazfttkorquqavfhkysrqiw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_wnpfanfbgqmjmsscffslnmkknbtroivglrvi` (`uid`),
  KEY `idx_fisffzsrixfihpmxlhqhadzhseooeoozwpju` (`token`),
  KEY `idx_ztfiftqjicnbolsexnoqslzwhvzaqsjkfyxh` (`dateUpdated`),
  KEY `idx_okojaxkpfjsdkbozftirycbpscrmmzyyqrtx` (`userId`),
  CONSTRAINT `fk_cwwzslzqhttapnqqnmjmllhhkxhxwgvxbdst` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_ubxeqgblhprpqlifkwdaxmrwjighxnfeqawz` (`userId`,`message`),
  CONSTRAINT `fk_tzbbkuscyghruskihcgsxbzyxvbvpfccdbjx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_sgmddyoudyvbvoovhuwbfartydhavlqnvxzu` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_mfxzouxbmflkrtkajccveumeikebavfwpgfa` (`dateDeleted`),
  KEY `idx_xntvtvxcwexhcykbiofecponcqjowpwqxlvg` (`handle`),
  KEY `idx_tcvfcozbvodonpdyuhpfelptdzwugnuwfgfy` (`sortOrder`),
  KEY `fk_njxxozxrfokfonylcstmvqsmgjuxdkyvryzs` (`groupId`),
  CONSTRAINT `fk_njxxozxrfokfonylcstmvqsmgjuxdkyvryzs` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_tybmxqwwdlrnrwabtfxypigboygscsdfnjgm` (`structureId`,`elementId`),
  KEY `idx_cqjezkbfflrvhwqczmdbeeabwfozxtpykdvu` (`root`),
  KEY `idx_tvyaboehqpgtqulclkhjxukoyrwglqlveteb` (`lft`),
  KEY `idx_vsixvcwdrmczlmszoautocqivvzswwzvalxu` (`rgt`),
  KEY `idx_shnmhcsjgodlrkrcipqrlougsrywqqqmldvm` (`level`),
  KEY `idx_rpquevqxsukwrehnglueadfaozqfpprnoxqj` (`elementId`),
  CONSTRAINT `fk_cgevghpvwqunkbzuqojosthpxhscycwflbkr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_faiormgarfsejbfvqzngdddrzwueaiqtoqvk` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_greirdamqhzrieiidbkczgoadfwosihljzhp` (`key`,`language`),
  KEY `idx_uzamjmpqzumhabbocuhunlxjrqncnadxmoos` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_iplcrqkzcmutmwcrhaqkhibfqyjtajgfgrmj` (`name`),
  KEY `idx_bbegnxwxbekehopukgtvljozjauwpbspvxsf` (`handle`),
  KEY `idx_kftxyanmibdjbtybqayveivaqgrhhxmpffdv` (`dateDeleted`),
  KEY `fk_dxllcpqtoxukyyztslexbqdsmdwurfbtxbfj` (`fieldLayoutId`),
  CONSTRAINT `fk_dxllcpqtoxukyyztslexbqdsmdwurfbtxbfj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_oopvcnoajyrzaisebwrdauqlgxxvzwvhlfjw` (`groupId`),
  CONSTRAINT `fk_aacgxndwfsfveswlnpipbztcsthhweslqmck` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ochiihbeduoqgsflouhjcytpmtqlxnyocwfp` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_gpkzrhbgzuhflgpvhntszpwcunexkbkawxsq` (`token`),
  KEY `idx_wnnfsaduumpgoaxbyxkpgiiwhwfpzqyixzqo` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_mtizndffxmeggdxpalkaajrretqsfymoaecd` (`handle`),
  KEY `idx_yarevhlxvddgpeupbessrettefqwdbfszlob` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_tnfxiupqabiaqrqpyxluihoeexrtuquhnucv` (`groupId`,`userId`),
  KEY `idx_ibylvnilorrgfugtbhczuaagsabzlyrcypsz` (`userId`),
  CONSTRAINT `fk_inktyxttnlwqydbnbvzoyiwjbaeimlfbeoga` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lntzsasdlzajxqfvhnctugmevdarvcllkdvq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_zdpkaljjbjpqzejsrrxwzrryauzvztxytxbl` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_aumhtngqkdenooiublbrnlfphcvqnxvqlrfs` (`permissionId`,`groupId`),
  KEY `idx_oycovijrnxzbqbqiydjlmfhbikqidmdybbxh` (`groupId`),
  CONSTRAINT `fk_mlanujgevwbiscmliwgebntcelkanwpteyob` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pcicsvrqemcummxgvvyjauiqspwluremjiko` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_fnwmqygraealndswbamhfhpmawjfqmmzdoln` (`permissionId`,`userId`),
  KEY `idx_sqflxvmkipfvbidhibmbqqizgliarmhcoapk` (`userId`),
  CONSTRAINT `fk_kknwqavlrnavrjeuodylxhvhzsjqscowwelf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwcnfysgfdltkifkxpzuvwunmjumdckvpqot` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `fk_haqzdazqxbwvhiuhtljjlpcqnkojyxpsziiz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_yhhwrdljafshuytetgbbllbscvvyigiarjxb` (`active`),
  KEY `idx_tfpjfcvmnqvkcgxpskknodddaiikmuytnnlt` (`locked`),
  KEY `idx_klzjrlhjncvtjawjvjrlmtldbozllvhkmnwk` (`pending`),
  KEY `idx_ejmmlxnykhofzerbotdhzujkofzbqbsbwkuk` (`suspended`),
  KEY `idx_emjmhljkhqnbdqabwnjtuhiyztgtwdlwlvih` (`verificationCode`),
  KEY `idx_ifkbkmkomqjljclqumbvkjnitwwpzpkkhsnn` (`email`),
  KEY `idx_krjadfcrnirpqafgokqjlesucoynithkeiwq` (`username`),
  KEY `fk_vnaksosgrsiezaolqdtdxqpdbxmfdnqyoseq` (`photoId`),
  CONSTRAINT `fk_gcykvmoqranltusthoduzdsehjweepwkaepa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vnaksosgrsiezaolqdtdxqpdbxmfdnqyoseq` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `idx_bheromsdhtlkdjwlycfxefqwitzpmzrgvuvt` (`name`,`parentId`,`volumeId`),
  KEY `idx_vuyzvkfjodjzgsqzswdafqbvthrvuhlllbfv` (`parentId`),
  KEY `idx_jfvnzdmhbzzlladmtaeeurvmholmsvkophbs` (`volumeId`),
  CONSTRAINT `fk_ibtedognooslybimphdwttggfgazypdlywwz` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdrlzulnifklfntxlqpfjjamaqanhyshcpjg` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_yiougokgqpvmraewlyzvzilqwsrqyfsdicqa` (`name`),
  KEY `idx_nrrblrcrwmibzyeptfkzwwmoafzleueyrccg` (`handle`),
  KEY `idx_fgblfgzcnfpfudpmkbmasposzdfqwjmgbkfz` (`fieldLayoutId`),
  KEY `idx_uznoxendrcvedtetovivzyusvzzzxpouhxcv` (`dateDeleted`),
  CONSTRAINT `fk_kzkhcipiiwcuvlvqykcreyxsofdrnaogisjf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  KEY `idx_ggpsfitiqyzrihcmqhcnffkinpiosqwkfztd` (`userId`),
  CONSTRAINT `fk_envbpvfluyvzrkhjvifhbbucvzftcvfmoegm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 19:37:09
-- MariaDB dump 10.19  Distrib 10.5.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB-1:10.4.32+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2023-12-17 19:29:12',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-12-17 19:03:13','2023-12-17 19:03:13','dffd0a72-623e-4316-9dd3-5d10bbdabd32'),(2,2,1,'Homepage','2023-12-17 19:28:36','2023-12-17 19:29:12','d6ca2df7-b49f-4b68-add6-b80756061b34'),(3,3,1,'Homepage','2023-12-17 19:28:36','2023-12-17 19:28:36','10aad563-7afb-4299-902a-b5d0d0fcb417'),(4,4,1,'Homepage','2023-12-17 19:28:36','2023-12-17 19:28:36','4a6fdbfc-4ea9-4ffe-9123-b7aa920980d2'),(5,5,1,'Homepage','2023-12-17 19:29:01','2023-12-17 19:29:01','cd7eaec0-62af-46e7-b275-b71b77b35962'),(7,9,1,'Homepage','2023-12-17 19:29:12','2023-12-17 19:29:12','9e37d240-477b-491b-bbe0-79f05f86fa76');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (2,1,1,NULL,'edit','2023-12-17 19:29:09'),(2,1,1,NULL,'save','2023-12-17 19:29:12');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-12-17 19:03:13','2023-12-17 19:03:13',NULL,NULL,'908dca04-05e0-4085-93ed-9ad7fde8f7a4'),(2,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-12-17 19:28:36','2023-12-17 19:29:12',NULL,NULL,'f0395a47-e130-409c-a41f-37bd01b0bb8f'),(3,2,NULL,1,2,'craft\\elements\\Entry',1,0,'2023-12-17 19:28:36','2023-12-17 19:28:36',NULL,NULL,'cb04ff6d-5450-4865-a8d0-926ceec1f108'),(4,2,NULL,2,2,'craft\\elements\\Entry',1,0,'2023-12-17 19:28:36','2023-12-17 19:28:36',NULL,NULL,'f8841589-c98b-4a57-bfca-89761d15270a'),(5,2,NULL,3,2,'craft\\elements\\Entry',1,0,'2023-12-17 19:29:01','2023-12-17 19:29:01',NULL,NULL,'b2bc4e4d-c6f5-4955-b015-c5eb7b6f6903'),(8,NULL,NULL,NULL,1,'craft\\elements\\MatrixBlock',1,0,'2023-12-17 19:29:12','2023-12-17 19:29:12',NULL,NULL,'a0913df3-d867-4908-8088-62b8fbbd55fd'),(9,2,NULL,4,2,'craft\\elements\\Entry',1,0,'2023-12-17 19:29:12','2023-12-17 19:29:12',NULL,NULL,'846bf9fc-6aa7-4007-973b-0916c9af841a'),(10,8,NULL,5,1,'craft\\elements\\MatrixBlock',1,0,'2023-12-17 19:29:12','2023-12-17 19:29:12',NULL,NULL,'7f4051b0-d38f-46ae-adab-620d9135b061');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-12-17 19:03:13','2023-12-17 19:03:13','954680f6-7c78-454c-9da8-8dad972f6aa3'),(2,2,1,'homepage','__home__',1,'2023-12-17 19:28:36','2023-12-17 19:28:36','6d0ce606-1b69-4ac1-8d27-6ea6cf8aea3b'),(3,3,1,'homepage','__home__',1,'2023-12-17 19:28:36','2023-12-17 19:28:36','2ce9bcaa-8d1a-4639-ba59-0c5ebee33c59'),(4,4,1,'homepage','__home__',1,'2023-12-17 19:28:36','2023-12-17 19:28:36','016f281b-393a-4343-9d8f-883d1747a057'),(5,5,1,'homepage','__home__',1,'2023-12-17 19:29:01','2023-12-17 19:29:01','d3bc1176-95c1-447a-ae90-c3eb5f7ce6a6'),(8,8,1,NULL,NULL,1,'2023-12-17 19:29:12','2023-12-17 19:29:12','96e2acce-94cb-4d54-87da-0bc9e9d4c3cf'),(9,9,1,'homepage','__home__',1,'2023-12-17 19:29:12','2023-12-17 19:29:12','7ea75b7a-2f82-4f48-8be4-6d2ce034f249'),(10,10,1,NULL,NULL,1,'2023-12-17 19:29:12','2023-12-17 19:29:12','b41b3fc9-b2fa-418a-a0e5-00befe0a30bf');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2023-12-17 19:28:00',NULL,NULL,'2023-12-17 19:28:36','2023-12-17 19:28:36'),(3,1,NULL,1,NULL,'2023-12-17 19:28:00',NULL,NULL,'2023-12-17 19:28:36','2023-12-17 19:28:36'),(4,1,NULL,1,NULL,'2023-12-17 19:28:00',NULL,NULL,'2023-12-17 19:28:36','2023-12-17 19:28:36'),(5,1,NULL,1,NULL,'2023-12-17 19:28:00',NULL,NULL,'2023-12-17 19:29:01','2023-12-17 19:29:01'),(9,1,NULL,1,NULL,'2023-12-17 19:28:00',NULL,NULL,'2023-12-17 19:29:12','2023-12-17 19:29:12');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,2,'Homepage','homepage',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-12-17 19:28:36','2023-12-17 19:28:36',NULL,'c4a9f311-2f6c-4ab4-b53d-401d62db2f1e');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-12-17 19:03:13','2023-12-17 19:03:13',NULL,'82722786-54b3-49e2-8e7b-d1e280e90288');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,1,1,2,0,0,'2023-12-17 19:27:12','2023-12-17 19:27:12','b077b4ea-4825-4008-b6ef-8d8552c2f401'),(2,2,3,1,0,1,'2023-12-17 19:29:01','2023-12-17 19:29:01','5417a5f5-9dc6-4fd1-ac41-4a1a8f40457b');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\MatrixBlock','2023-12-17 19:27:12','2023-12-17 19:27:12',NULL,'2873fe42-dfef-433e-9bb0-b666b7aaf538'),(2,'craft\\elements\\Entry','2023-12-17 19:28:36','2023-12-17 19:28:36',NULL,'55b472ee-d23c-417e-acbb-e24158eb9cf3');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5be7e43c-0428-46da-b59d-5434c760f4af\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7d7e9761-3bb2-420c-b2ed-4261b167287f\"}]',1,'2023-12-17 19:27:12','2023-12-17 19:27:12','b9dfde4a-3b1a-4795-8fc6-192a762cb985'),(3,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"3a85e216-c039-460f-8e3e-6016da1a2d3a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"186ef2da-dcc8-4048-a88f-4aae49ed3226\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"90619285-e728-461d-aabd-7bf789279798\"}]',1,'2023-12-17 19:29:01','2023-12-17 19:29:01','2e3f2bf4-b42b-4250-a5ad-dbe3aece952c');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Modules','coreModules','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_coremodules}}\",\"maxBlocks\":null,\"minBlocks\":null,\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-12-17 19:27:11','2023-12-17 19:30:15','90619285-e728-461d-aabd-7bf789279798'),(2,NULL,'Example Module','exampleModule','matrixBlockType:dfbf0d7a-bb6e-489c-bb35-3f40a63521fd','tbvmpfur','I am an example module',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-12-17 19:27:12','2023-12-17 19:27:12','7d7e9761-3bb2-420c-b2ed-4261b167287f');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.5.6.1','4.5.3.0',0,'aetljvznafrq','3@xrzyijkdwe','2023-12-17 19:03:12','2023-12-17 19:30:15','0b0757d3-6dc2-418b-9e01-3fe8d3705546');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (8,2,1,1,NULL,'2023-12-17 19:29:12','2023-12-17 19:29:12'),(10,9,1,1,NULL,'2023-12-17 19:29:12','2023-12-17 19:29:12');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks_owners` VALUES (8,2,1),(10,9,1);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,1,1,'Example','example',1,'2023-12-17 19:27:12','2023-12-17 19:27:12','dfbf0d7a-bb6e-489c-bb35-3f40a63521fd');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_coremodules`
--

LOCK TABLES `matrixcontent_coremodules` WRITE;
/*!40000 ALTER TABLE `matrixcontent_coremodules` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_coremodules` VALUES (2,8,1,'2023-12-17 19:29:12','2023-12-17 19:29:12','9ce02422-0eaa-4512-91d8-f44705783c29',NULL),(3,10,1,'2023-12-17 19:29:12','2023-12-17 19:29:12','f93ef454-e8ef-4c60-aa38-31571b169112',NULL);
/*!40000 ALTER TABLE `matrixcontent_coremodules` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'plugin:servd-asset-storage','m201026_093810_update_servd_settings','2023-12-17 19:03:13','2023-12-17 19:03:13','2023-12-17 19:03:13','d727497e-1eb2-430b-a61c-78a2d1c9afc3'),(2,'plugin:servd-asset-storage','m201230_183610_copy_optimise_prefix','2023-12-17 19:03:13','2023-12-17 19:03:13','2023-12-17 19:03:13','eddfc693-0658-48d0-ac3d-59b881b84fd2'),(3,'plugin:servd-asset-storage','m220119_204628_update_fs_configs','2023-12-17 19:03:13','2023-12-17 19:03:13','2023-12-17 19:03:13','2e352d95-0bc7-4c32-b1e5-da56baddaea5'),(4,'craft','Install','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','df09bcce-3de2-4302-b17d-c33204350d82'),(5,'craft','m210121_145800_asset_indexing_changes','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','219f9375-b53b-4527-8b77-d8006a3295a0'),(6,'craft','m210624_222934_drop_deprecated_tables','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','fe1e6552-37c8-4c69-8561-0abe8b415051'),(7,'craft','m210724_180756_rename_source_cols','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','85f8815d-2ce1-44c0-9469-21d3b812ed20'),(8,'craft','m210809_124211_remove_superfluous_uids','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','dcb0c497-56ae-4b0e-9a9b-dc533d09c0f8'),(9,'craft','m210817_014201_universal_users','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','fbba5633-a26f-4b05-a553-cc1d91803e6e'),(10,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','6e5d2805-4171-4e43-be01-67a000900f62'),(11,'craft','m211115_135500_image_transformers','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','9467f0eb-5e70-4022-a33b-348c7dd78990'),(12,'craft','m211201_131000_filesystems','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','d7b1d19f-a5fa-4b63-a7ed-0302356faf4f'),(13,'craft','m220103_043103_tab_conditions','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','855203b3-81d8-4974-bb2c-9834ed4b2bf9'),(14,'craft','m220104_003433_asset_alt_text','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','1f45910d-8fe3-4198-9c6b-bac822a081ba'),(15,'craft','m220123_213619_update_permissions','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','617aac9b-2b97-4389-931b-990ced66531b'),(16,'craft','m220126_003432_addresses','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','dc24a8ab-21f5-4a95-bb51-a2886b65ffd3'),(17,'craft','m220209_095604_add_indexes','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','a81e8cbe-faa8-4583-b3d5-4e18e75b6b42'),(18,'craft','m220213_015220_matrixblocks_owners_table','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','059dbc46-1eb6-41f2-9ec5-48a00c3c64ec'),(19,'craft','m220214_000000_truncate_sessions','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','1eab1d36-56fe-4483-8fce-4355aea25854'),(20,'craft','m220222_122159_full_names','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','3e35c345-1937-4c95-b46e-d2f331d276e9'),(21,'craft','m220223_180559_nullable_address_owner','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','affadc9f-cb31-49fb-ac0f-572f409342cc'),(22,'craft','m220225_165000_transform_filesystems','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','0f3d7eb9-a5de-4fbf-9043-9c74e8c6eeea'),(23,'craft','m220309_152006_rename_field_layout_elements','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','11f91e98-19b3-4a25-9ab6-06ac9d643132'),(24,'craft','m220314_211928_field_layout_element_uids','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','c8d1b99a-2221-4e93-bdc6-e2bef64abceb'),(25,'craft','m220316_123800_transform_fs_subpath','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','ce19bd49-0415-48b8-b9f4-2a038a07b42a'),(26,'craft','m220317_174250_release_all_jobs','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','1290c5d6-d903-4bc9-8a6a-fd98083888f3'),(27,'craft','m220330_150000_add_site_gql_schema_components','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','3aeaad0b-96b7-4d41-80bf-7923d7940f4a'),(28,'craft','m220413_024536_site_enabled_string','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','f48b05d6-5da6-4387-9d36-f89e8b00324a'),(29,'craft','m221027_160703_add_image_transform_fill','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','83895d08-5515-4c89-8fd1-c3c3e8bf3477'),(30,'craft','m221028_130548_add_canonical_id_index','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','98592a3c-ca19-47a2-b1c5-83632a672248'),(31,'craft','m221118_003031_drop_element_fks','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','8a152468-3cfa-4f3c-9ff5-2e6c1a8f54b6'),(32,'craft','m230131_120713_asset_indexing_session_new_options','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','0d52c716-8d6b-45c6-85da-8f6232f987e9'),(33,'craft','m230226_013114_drop_plugin_license_columns','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','26cb0df7-21bf-40c7-ace9-b01ca729334e'),(34,'craft','m230531_123004_add_entry_type_show_status_field','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','e843f46f-3d54-4de6-aa53-68af76b59a25'),(35,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','29b50a96-3906-4e46-9802-b49e2fb4f9ac'),(36,'craft','m230710_162700_element_activity','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','2683844d-cc1d-483f-8131-ece0a16ba760'),(37,'craft','m230820_162023_fix_cache_id_type','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','5fc67fac-4611-4dc9-9521-66025980ab83'),(38,'craft','m230826_094050_fix_session_id_type','2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:03:14','2e3d5691-d065-4c9d-ae0a-08125549b559');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'servd-asset-storage','3.5.0','3.0.0','2023-12-17 19:03:13','2023-12-17 19:03:13','2023-12-17 19:03:13','4b672af7-f456-4aa4-97f3-5078a28c06ff'),(2,'twigpack','4.0.0-beta.4','1.0.0','2023-12-17 19:03:13','2023-12-17 19:03:13','2023-12-17 19:03:13','b34547eb-b001-4fb8-bb24-b163b7b530ba');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1702841415'),('email.fromEmail','\"creative@raraavis.design\"'),('email.fromName','\"Tecumseh Boilerplate\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elementCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.autocapitalize','true'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.autocomplete','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.autocorrect','true'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.class','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.disabled','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.elementCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.id','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.instructions','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.label','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.max','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.min','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.name','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.orientation','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.placeholder','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.readonly','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.requirable','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.size','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.step','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.tip','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.title','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.uid','\"3a85e216-c039-460f-8e3e-6016da1a2d3a\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.userCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.warning','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.0.width','100'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.elementCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.fieldUid','\"90619285-e728-461d-aabd-7bf789279798\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.instructions','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.label','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.required','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.tip','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.uid','\"186ef2da-dcc8-4048-a88f-4aae49ed3226\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.userCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.warning','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.elements.1.width','100'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.name','\"Content\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.uid','\"2e3f2bf4-b42b-4250-a5ad-dbe3aece952c\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.fieldLayouts.55b472ee-d23c-417e-acbb-e24158eb9cf3.tabs.0.userCondition','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.handle','\"homepage\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.hasTitleField','false'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.name','\"Homepage\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.section','\"7aa67058-a1f3-46ad-8a6b-4cc480137301\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.showStatusField','true'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.slugTranslationKeyFormat','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.slugTranslationMethod','\"site\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.sortOrder','1'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.titleFormat','\"{section.name|raw}\"'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.titleTranslationKeyFormat','null'),('entryTypes.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e.titleTranslationMethod','\"site\"'),('fieldGroups.82722786-54b3-49e2-8e7b-d1e280e90288.name','\"Common\"'),('fields.90619285-e728-461d-aabd-7bf789279798.columnSuffix','null'),('fields.90619285-e728-461d-aabd-7bf789279798.contentColumnType','\"string\"'),('fields.90619285-e728-461d-aabd-7bf789279798.fieldGroup','\"82722786-54b3-49e2-8e7b-d1e280e90288\"'),('fields.90619285-e728-461d-aabd-7bf789279798.handle','\"coreModules\"'),('fields.90619285-e728-461d-aabd-7bf789279798.instructions','null'),('fields.90619285-e728-461d-aabd-7bf789279798.name','\"Modules\"'),('fields.90619285-e728-461d-aabd-7bf789279798.searchable','false'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.contentTable','\"{{%matrixcontent_coremodules}}\"'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.maxBlocks','null'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.minBlocks','null'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.propagationKeyFormat','null'),('fields.90619285-e728-461d-aabd-7bf789279798.settings.propagationMethod','\"all\"'),('fields.90619285-e728-461d-aabd-7bf789279798.translationKeyFormat','null'),('fields.90619285-e728-461d-aabd-7bf789279798.translationMethod','\"site\"'),('fields.90619285-e728-461d-aabd-7bf789279798.type','\"craft\\\\fields\\\\Matrix\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.field','\"90619285-e728-461d-aabd-7bf789279798\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elementCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.fieldUid','\"7d7e9761-3bb2-420c-b2ed-4261b167287f\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.label','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.required','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.tip','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.uid','\"5be7e43c-0428-46da-b59d-5434c760f4af\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.warning','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.elements.0.width','100'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.name','\"Content\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.uid','\"b9dfde4a-3b1a-4795-8fc6-192a762cb985\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fieldLayouts.2873fe42-dfef-433e-9bb0-b666b7aaf538.tabs.0.userCondition','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.columnSuffix','\"tbvmpfur\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.contentColumnType','\"text\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.fieldGroup','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.handle','\"exampleModule\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.instructions','\"I am an example module\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.name','\"Example Module\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.searchable','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.byteLimit','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.charLimit','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.code','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.columnType','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.initialRows','4'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.multiline','false'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.placeholder','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.settings.uiMode','\"normal\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.translationKeyFormat','null'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.translationMethod','\"none\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.fields.7d7e9761-3bb2-420c-b2ed-4261b167287f.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.handle','\"example\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.name','\"Example\"'),('matrixBlockTypes.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd.sortOrder','1'),('meta.__names__.0d3b124c-a22c-492b-905d-244d625e5e84','\"Tecumseh Boilerplate\"'),('meta.__names__.7aa67058-a1f3-46ad-8a6b-4cc480137301','\"Homepage\"'),('meta.__names__.7d7e9761-3bb2-420c-b2ed-4261b167287f','\"Example Module\"'),('meta.__names__.82722786-54b3-49e2-8e7b-d1e280e90288','\"Common\"'),('meta.__names__.8878a560-e842-40bc-a612-27fcdf9fb770','\"TecumsehBoilerplate\"'),('meta.__names__.90619285-e728-461d-aabd-7bf789279798','\"Modules\"'),('meta.__names__.c4a9f311-2f6c-4ab4-b53d-401d62db2f1e','\"Homepage\"'),('meta.__names__.dfbf0d7a-bb6e-489c-bb35-3f40a63521fd','\"Example\"'),('plugins.servd-asset-storage.edition','\"standard\"'),('plugins.servd-asset-storage.enabled','true'),('plugins.servd-asset-storage.schemaVersion','\"3.0.0\"'),('plugins.twigpack.edition','\"standard\"'),('plugins.twigpack.enabled','true'),('plugins.twigpack.schemaVersion','\"1.0.0\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.defaultPlacement','\"end\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.enableVersioning','true'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.handle','\"homepage\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.name','\"Homepage\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.propagationMethod','\"all\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.enabledByDefault','true'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.hasUrls','true'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.template','null'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.siteSettings.8878a560-e842-40bc-a612-27fcdf9fb770.uriFormat','\"__home__\"'),('sections.7aa67058-a1f3-46ad-8a6b-4cc480137301.type','\"single\"'),('siteGroups.0d3b124c-a22c-492b-905d-244d625e5e84.name','\"Tecumseh Boilerplate\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.enabled','true'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.handle','\"default\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.hasUrls','true'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.language','\"en-US\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.name','\"TecumsehBoilerplate\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.primary','true'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.siteGroup','\"0d3b124c-a22c-492b-905d-244d625e5e84\"'),('sites.8878a560-e842-40bc-a612-27fcdf9fb770.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Tecumseh Boilerplate\"'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,'Applied “Draft 1”'),(5,8,1,1,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' creative raraavis design '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' raraadmin '),(2,'slug',0,1,' homepage '),(2,'title',0,1,' homepage '),(8,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all','end',NULL,'2023-12-17 19:28:36','2023-12-17 19:28:36',NULL,'7aa67058-a1f3-46ad-8a6b-4cc480137301');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__',NULL,1,'2023-12-17 19:28:36','2023-12-17 19:28:36','8760e3c5-7007-4033-86d0-d0abd0adf4cc');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Tecumseh Boilerplate','2023-12-17 19:03:12','2023-12-17 19:03:12',NULL,'0d3b124c-a22c-492b-905d-244d625e5e84');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','TecumsehBoilerplate','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-12-17 19:03:12','2023-12-17 19:03:13',NULL,'8878a560-e842-40bc-a612-27fcdf9fb770');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'RaraAdmin',NULL,NULL,NULL,'creative@raraavis.design','$2y$13$WpmvvA6ir2fKF5m1lzAicOkeQkEiu06jKPW59f/ZTXk60KflAh1fi','2023-12-17 19:19:13',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-12-17 19:03:14','2023-12-17 19:03:14','2023-12-17 19:19:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-12-17 19:19:13','2023-12-17 19:19:13','1ac4440c-2ceb-4af4-8b3c-5b0818f6137f'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-12-17 19:19:13','2023-12-17 19:19:13','43d2927d-7a01-422f-86f7-5410c8966132'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-12-17 19:19:13','2023-12-17 19:19:13','b82109e3-54d0-45fd-96af-084c0e4cbba3'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-12-17 19:19:13','2023-12-17 19:19:13','9671018d-c9ec-4030-a4da-c5ac0511a21a');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-17 19:37:10
