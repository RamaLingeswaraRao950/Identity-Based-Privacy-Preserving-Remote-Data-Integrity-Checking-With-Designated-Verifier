create database identitybpp;

use identitybpp;

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for attacker
-- ----------------------------
DROP TABLE IF EXISTS `attacker`;
CREATE TABLE `attacker` (
  `id` int(11) NOT NULL auto_increment,
  `user` text,
  `fname` text,
  `sk` text,
  `dt` text,
  `attacktype` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auditresults
-- ----------------------------
DROP TABLE IF EXISTS `auditresults`;
CREATE TABLE `auditresults` (
  `fname` text,
  `bname` text,
  `ownername` text,
  `audittype` text,
  `dt` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for backupcloudserver
-- ----------------------------
DROP TABLE IF EXISTS `backupcloudserver`;
CREATE TABLE `backupcloudserver` (
  `id` int(11) NOT NULL auto_increment,
  `fname` text,
  `ownername` text,
  `cname` text,
  `ct1` text,
  `mac1` text,
  `ct2` text,
  `mac2` text,
  `ct3` text,
  `mac3` text,
  `ct4` text,
  `mac4` text,
  `sk` text,
  `dt` text,
  `fsize` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cloud
-- ----------------------------
DROP TABLE IF EXISTS `cloud`;
CREATE TABLE `cloud` (
  `name` text,
  `pass` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for cloudserver
-- ----------------------------
DROP TABLE IF EXISTS `cloudserver`;
CREATE TABLE `cloudserver` (
  `id` int(11) NOT NULL auto_increment,
  `fname` text,
  `ownername` text,
  `cname` text,
  `ct1` text,
  `mac1` text,
  `ct2` text,
  `mac2` text,
  `ct3` text,
  `mac3` text,
  `ct4` text,
  `mac4` text,
  `sk` text,
  `dt` text,
  `fsize` text,
  `status` text,
  `rank` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for downer
-- ----------------------------
DROP TABLE IF EXISTS `downer`;
CREATE TABLE `downer` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `pass` text,
  `email` text,
  `mobile` text,
  `addr` text,
  `dob` text,
  `gender` text,
  `pin` text,
  `location` text,
  `imagess` longblob,
  `status` text,
  `dgroup` text,
  `dcerid` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for kgc
-- ----------------------------
DROP TABLE IF EXISTS `kgc`;
CREATE TABLE `kgc` (
  `name` text,
  `pass` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `fname` text,
  `tdelay` text,
  `tpt` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `pass` text,
  `email` text,
  `mobile` text,
  `addr` text,
  `dob` text,
  `gender` text,
  `pin` text,
  `location` text,
  `imagess` longblob,
  `status` text,
  `hos` text,
  `dpt` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for verifier
-- ----------------------------
DROP TABLE IF EXISTS `verifier`;
CREATE TABLE `verifier` (
  `name` text,
  `pass` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for verifierresults
-- ----------------------------
DROP TABLE IF EXISTS `verifierresults`;
CREATE TABLE `verifierresults` (
  `fname` text,
  `bname` text,
  `ownername` text,
  `vresponse` text,
  `dt` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `cloud` VALUES ('CSP', 'CSP');
INSERT INTO `kgc` VALUES ('KGC', 'KGC');
INSERT INTO `verifier` VALUES ('Verifier', 'Verifier');