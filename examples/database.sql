-- Host: localhost
-- Generation Time: Aug 29, 2013 at 09:57 AM
-- Server version: 5.0.77
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ftpmysql`
--

-- --------------------------------------------------------

--
-- Table structure for table `ftplog`
--

CREATE TABLE IF NOT EXISTS `ftplog` (
  `id` int(11) NOT NULL auto_increment,
  `timestamp` datetime NOT NULL,
  `transfertime` varchar(10) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `pid` int(11) NOT NULL,
  `size` varchar(15) NOT NULL,
  `command` varchar(40) NOT NULL,
  `options` text NOT NULL,
  `filename` text NOT NULL,
  `username` varchar(16) NOT NULL,
  `returncode` int(11) NOT NULL,
  `protocol` varchar(4) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `timestamp` (`timestamp`),
  KEY `username` (`username`),
  KEY `protocol` (`protocol`),
  KEY `command` (`command`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=96728577 ;

-- --------------------------------------------------------

--
-- Table structure for table `ftp_group`
--

CREATE TABLE IF NOT EXISTS `ftp_group` (
  `groupname` varchar(16) NOT NULL default '',
  `gid` int(7) NOT NULL default '65534',
  `members` varchar(16) NOT NULL default '',
  KEY `groupname` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='ProFTP group table';

-- --------------------------------------------------------

--
-- Table structure for table `ftp_users`
--

CREATE TABLE IF NOT EXISTS `ftp_users` (
  `id` int(11) NOT NULL auto_increment,
  `customer` int(11) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `realname` varchar(32) NOT NULL default '',
  `shell` varchar(20) NOT NULL default '/sbin/nologin',
  `passwd` varchar(255) NOT NULL,
  `active` char(1) NOT NULL default 'Y',
  `uid` int(11) NOT NULL default '101',
  `gid` int(11) NOT NULL default '65534',
  `home` varchar(255) NOT NULL default '/home/catchall',
  `lastchange` varchar(50) NOT NULL default '',
  `deleted` varchar(1) NOT NULL default 'N',
  `delchange` datetime NOT NULL,
  `ftp` varchar(10) NOT NULL default 'true',
  `sftp` varchar(10) NOT NULL default 'true',
  `ftps` varchar(10) NOT NULL default 'true',
  `migrated` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=556 ;

-- --------------------------------------------------------

--
-- Table structure for table `sftp_hostkeys`
--

CREATE TABLE IF NOT EXISTS `sftp_hostkeys` (
  `host` varchar(255) NOT NULL,
  `sshkey` varchar(255) NOT NULL,
  KEY `sftphostkeys_idx` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sftp_userkeys`
--

CREATE TABLE IF NOT EXISTS `sftp_userkeys` (
  `id` int(11) NOT NULL auto_increment,
  `customer` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sshkey` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `sftpuserkeys_idx` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=87 ;


-- --------------------------------------------------------

--
-- Table structure for table `ftp_quotalimits`
--
REATE TABLE `ftp_quotalimits` (
`name` VARCHAR(30) DEFAULT NULL,
`quota_type` enum('user','group','class','all') NOT NULL DEFAULT 'user',
`par_session` enum('false','true') NOT NULL DEFAULT 'false',
`limit_type` enum('soft','hard') NOT NULL DEFAULT 'soft',
`bytes_up_limit` FLOAT NOT NULL DEFAULT '0',
`bytes_down_limit` FLOAT NOT NULL DEFAULT '0',
`bytes_transfer_limit` FLOAT NOT NULL DEFAULT '0',
`files_up_limit` INT(10) UNSIGNED NOT NULL DEFAULT '0',
`files_down_limit` INT(10) UNSIGNED NOT NULL DEFAULT '0',
`files_transfer_limit` INT(10) UNSIGNED NOT NULL DEFAULT '0'
) Engine=InnoDB COMMENT='Table des quotas ProFTPD';


-- --------------------------------------------------------

--
-- Table structure for table `ftp_quotatotal`
--


CREATE TABLE `ftp_quotatotal` (
`name` VARCHAR(30) NOT NULL DEFAULT '',
`quota_type` enum('user','group','class','all') NOT NULL DEFAULT 'user',
`bytes_up_total` FLOAT NOT NULL DEFAULT '0',
`bytes_down_total` FLOAT NOT NULL DEFAULT '0',
`bytes_transfer_total` FLOAT NOT NULL DEFAULT '0',
`files_up_total` INT(10) UNSIGNED NOT NULL DEFAULT '0',
`files_down_total` INT(10) UNSIGNED NOT NULL DEFAULT '0',
`files_transfer_total` INT(10) UNSIGNED NOT NULL DEFAULT '0'
) Engine=InnoDB COMMENT='Table des compteurs des quotas ProFTPD';




INSERT INTO `ftp_user` ( `id`, `userid`, `passwd`, `uid`, `gid`, `homedir`, `shell`, `count`, `accessed` , `modified`, `LoginAllowed` ) VALUES
 ('', 'test', ENCRYPT('gallis1780','33','33', '/var/www/','/bin/false', '', '', '', 'true' );
