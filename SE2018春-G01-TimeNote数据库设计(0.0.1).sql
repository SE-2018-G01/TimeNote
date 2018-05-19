/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : timenote

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2018-05-06 14:43:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for appealinformation
-- ----------------------------
DROP TABLE IF EXISTS `appealinformation`;
CREATE TABLE `appealinformation` (
  `AppealId` varchar(20) NOT NULL,
  `AppealDeclare` varchar(200) NOT NULL,
  `UserId` varchar(20) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `AppealEmail` varchar(200) NOT NULL,
  `AppealStatus` varchar(200) NOT NULL,
  `DealTime` datetime DEFAULT NULL,
  `UserManagerId` varchar(20) NOT NULL,
  PRIMARY KEY (`AppealId`),
  KEY `usermanagerId_idx` (`UserManagerId`),
  KEY `UerId_idx` (`UserId`),
  CONSTRAINT `fx_userid` FOREIGN KEY (`UserId`) REFERENCES `userinformation` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usermanagerId` FOREIGN KEY (`UserManagerId`) REFERENCES `usermanagerinformation` (`UserManagerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of appealinformation
-- ----------------------------

-- ----------------------------
-- Table structure for dremindinformation
-- ----------------------------
DROP TABLE IF EXISTS `dremindinformation`;
CREATE TABLE `dremindinformation` (
  `DRemindId` varchar(20) NOT NULL,
  `DRemindModel` varchar(200) NOT NULL,
  `DRemindRepeat` varchar(20) NOT NULL,
  `DRemindDate` datetime NOT NULL,
  `UserId` varchar(20) NOT NULL,
  PRIMARY KEY (`DRemindId`),
  KEY `usrid_idx` (`UserId`),
  CONSTRAINT `usrid` FOREIGN KEY (`UserId`) REFERENCES `userinformation` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dremindinformation
-- ----------------------------

-- ----------------------------
-- Table structure for eventinformation
-- ----------------------------
DROP TABLE IF EXISTS `eventinformation`;
CREATE TABLE `eventinformation` (
  `EventId` varchar(20) NOT NULL,
  `EventName` varchar(50) NOT NULL,
  `EventNote` varchar(200) DEFAULT NULL,
  `EventPriority` int(11) NOT NULL DEFAULT '1',
  `UserId` varchar(20) NOT NULL,
  `ListId` varchar(20) NOT NULL,
  `DRemindId` varchar(20) NOT NULL,
  `EventDate` datetime DEFAULT NULL,
  `EventFinishDate` datetime DEFAULT NULL,
  PRIMARY KEY (`EventId`),
  KEY `UserId_idx` (`UserId`),
  KEY `ListId_idx` (`ListId`),
  KEY `DRemindId_idx1` (`DRemindId`),
  CONSTRAINT `ListId` FOREIGN KEY (`ListId`) REFERENCES `listiformation` (`ListId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `UserId` FOREIGN KEY (`UserId`) REFERENCES `userinformation` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fx_DRemindId` FOREIGN KEY (`DRemindId`) REFERENCES `dremindinformation` (`DRemindId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eventinformation
-- ----------------------------

-- ----------------------------
-- Table structure for listiformation
-- ----------------------------
DROP TABLE IF EXISTS `listiformation`;
CREATE TABLE `listiformation` (
  `ListId` varchar(20) NOT NULL,
  `UserId` varchar(20) NOT NULL,
  `ListName` varchar(50) NOT NULL,
  `CreatDate` datetime NOT NULL,
  `BackgroundColor` varchar(10) NOT NULL,
  PRIMARY KEY (`ListId`),
  KEY `Uerid_idx` (`UserId`),
  CONSTRAINT `Uerid` FOREIGN KEY (`UserId`) REFERENCES `userinformation` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listiformation
-- ----------------------------

-- ----------------------------
-- Table structure for pomotimer
-- ----------------------------
DROP TABLE IF EXISTS `pomotimer`;
CREATE TABLE `pomotimer` (
  `PomoId` int(11) NOT NULL,
  `PomoDuration` int(11) NOT NULL,
  `ShortBreakDuration` int(11) NOT NULL,
  `LongBreakDuration` int(11) NOT NULL,
  `LongBreakEvery` int(11) NOT NULL,
  PRIMARY KEY (`PomoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pomotimer
-- ----------------------------

-- ----------------------------
-- Table structure for userinformation
-- ----------------------------
DROP TABLE IF EXISTS `userinformation`;
CREATE TABLE `userinformation` (
  `UserId` varchar(20) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `UserPassword` varchar(20) NOT NULL,
  `UserEmail` varchar(50) DEFAULT NULL,
  `DRemindId` varchar(20) NOT NULL,
  `CreatDate` datetime NOT NULL,
  `StopDate` datetime DEFAULT NULL,
  `StopUserId` varchar(20) DEFAULT NULL,
  `UserCalendar` tinyint(4) NOT NULL DEFAULT '0',
  `UserTypeface` varchar(10) NOT NULL DEFAULT '“大”',
  `PomoId` int(11) NOT NULL,
  `Achievement` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserId`),
  KEY `ListId_idx` (`DRemindId`),
  KEY `StopUserId_idx` (`StopUserId`),
  KEY `PomoId_idx` (`PomoId`),
  CONSTRAINT `DRemindId` FOREIGN KEY (`DRemindId`) REFERENCES `dremindinformation` (`DRemindId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PomoId` FOREIGN KEY (`PomoId`) REFERENCES `pomotimer` (`PomoId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `StopUserId` FOREIGN KEY (`StopUserId`) REFERENCES `usermanagerinformation` (`UserManagerId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinformation
-- ----------------------------

-- ----------------------------
-- Table structure for usermanagerinformation
-- ----------------------------
DROP TABLE IF EXISTS `usermanagerinformation`;
CREATE TABLE `usermanagerinformation` (
  `UserManagerId` varchar(20) NOT NULL,
  `UserManagerName` varchar(50) NOT NULL,
  `UserManagerPassword` varchar(20) NOT NULL,
  `CreatDate` datetime NOT NULL,
  PRIMARY KEY (`UserManagerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usermanagerinformation
-- ----------------------------
