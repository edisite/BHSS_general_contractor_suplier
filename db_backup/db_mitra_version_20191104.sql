/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.35-MariaDB : Database - kstok_mitra3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `admin_groups` */

DROP TABLE IF EXISTS `admin_groups`;

CREATE TABLE `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `admin_groups` */

insert  into `admin_groups`(`id`,`name`,`description`) values (1,'webmaster','Webmaster'),(2,'admin','Administrator'),(3,'manager','Manager'),(4,'staff','Staff'),(5,'funder','Funder');

/*Table structure for table `admin_login_attempts` */

DROP TABLE IF EXISTS `admin_login_attempts`;

CREATE TABLE `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `admin_login_attempts` */

/*Table structure for table `admin_users` */

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users` */

insert  into `admin_users`(`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`) values (1,'127.0.0.1','webmaster','$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES',NULL,NULL,NULL,NULL,NULL,NULL,1451900190,1572509529,1,'Edi ','Supriyanto'),(2,'127.0.0.1','admin','$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW',NULL,NULL,NULL,NULL,NULL,NULL,1451900228,1465489580,1,'Admin',''),(3,'127.0.0.1','manager','$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa',NULL,NULL,NULL,NULL,NULL,NULL,1451900430,1465489585,1,'Manager',''),(4,'127.0.0.1','staff','$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6',NULL,NULL,NULL,NULL,NULL,NULL,1451900439,1465489590,1,'Staff',''),(5,'::1','edisite','$2y$08$7nz5Vb89V05/P3Bc2/9vD.hKdQM9qQkX9Y9Ax1BRMErEutKtSCXS.',NULL,NULL,NULL,NULL,NULL,NULL,1568445475,NULL,1,'Edi','Developer');

/*Table structure for table `admin_users_groups` */

DROP TABLE IF EXISTS `admin_users_groups`;

CREATE TABLE `admin_users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `admin_users_groups` */

insert  into `admin_users_groups`(`id`,`user_id`,`group_id`) values (1,1,1),(2,2,2),(3,3,3),(4,4,4);

/*Table structure for table `api_access` */

DROP TABLE IF EXISTS `api_access`;

CREATE TABLE `api_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `api_access` */

/*Table structure for table `api_keys` */

DROP TABLE IF EXISTS `api_keys`;

CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `api_keys` */

insert  into `api_keys`(`id`,`user_id`,`key`,`level`,`ignore_limits`,`is_private_key`,`ip_addresses`,`date_created`) values (1,0,'anonymous',1,1,0,NULL,1463388382);

/*Table structure for table `api_limits` */

DROP TABLE IF EXISTS `api_limits`;

CREATE TABLE `api_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `api_limits` */

/*Table structure for table `api_logs` */

DROP TABLE IF EXISTS `api_logs`;

CREATE TABLE `api_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `api_logs` */

/*Table structure for table `m_acc_type` */

DROP TABLE IF EXISTS `m_acc_type`;

CREATE TABLE `m_acc_type` (
  `acc_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_type_name` char(30) DEFAULT NULL,
  `acc_type_description` varchar(200) DEFAULT NULL,
  `acc_type_create_by` char(30) DEFAULT NULL,
  `acc_type_create_date` datetime DEFAULT NULL,
  `acc_type_update_by` char(30) DEFAULT NULL,
  `acc_type_update_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`acc_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `m_acc_type` */

insert  into `m_acc_type`(`acc_type_id`,`acc_type_name`,`acc_type_description`,`acc_type_create_by`,`acc_type_create_date`,`acc_type_update_by`,`acc_type_update_Date`) values (1,'Jurnal umum','jurnal umum','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(2,'jurnal pembelian','jurnal pembelian','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(3,'jurnal penjualan','jurnal penjualan','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(4,'jurnal Penerimaan kas','jurnal Penerimaan kas','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(5,'jurnal pengeluaran kas','jurnal pengeluaran kas','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(6,'jurnal penyesuaian','jurnal penyesuaian','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(7,'jurnal penutup','jurnal penutup','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11'),(8,'jurnal pembalik','jurnal pembalik','Admin','2019-10-29 15:43:11','Admin','2019-10-29 15:43:11');

/*Table structure for table `m_bidang` */

DROP TABLE IF EXISTS `m_bidang`;

CREATE TABLE `m_bidang` (
  `bidang_id` int(11) NOT NULL AUTO_INCREMENT,
  `bidang_nama` varchar(255) DEFAULT NULL,
  `bidang_status_aktif` enum('ACTIVE','INACTIVE') DEFAULT NULL,
  `bidang_create_date` datetime DEFAULT NULL,
  `bidang_create_by` varchar(255) DEFAULT NULL,
  `bidang_update_date` datetime DEFAULT NULL,
  `bidang_update_by` varchar(255) DEFAULT NULL,
  `bidang_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`bidang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `m_bidang` */

insert  into `m_bidang`(`bidang_id`,`bidang_nama`,`bidang_status_aktif`,`bidang_create_date`,`bidang_create_by`,`bidang_update_date`,`bidang_update_by`,`bidang_revised`) values (1,'PERDAGANGAN','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-26 18:40:29','Admin',0),(2,'JASA','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(3,'MANUFAKTUR','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(4,'DEVELOPER','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(5,'KONTRAKTOR','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(6,'PERTANIAN','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(7,'PERKEBUNAN','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(8,'PETERNAKAN','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(9,'PERIKANAN','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0),(10,'TEKNOLOGI INFORMASI','ACTIVE','2019-10-10 18:57:53','Admin','2019-10-10 18:57:53','Admin',0);

/*Table structure for table `m_coa` */

DROP TABLE IF EXISTS `m_coa`;

CREATE TABLE `m_coa` (
  `COA` char(10) DEFAULT NULL,
  `COANAMA` char(100) DEFAULT NULL,
  `LEVEL` char(5) DEFAULT NULL,
  `INDUK` char(10) DEFAULT NULL,
  `DORK` char(5) DEFAULT NULL,
  `GORD` char(5) DEFAULT NULL,
  `TIPE` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_coa` */

/*Table structure for table `m_daftar_bank` */

DROP TABLE IF EXISTS `m_daftar_bank`;

CREATE TABLE `m_daftar_bank` (
  `kode_bank` char(3) NOT NULL,
  `nama_bank` char(30) DEFAULT NULL,
  `biaya_adm` decimal(18,2) DEFAULT '0.00',
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_bank` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `keterangan` text,
  PRIMARY KEY (`kode_bank`),
  UNIQUE KEY `kode_bank` (`kode_bank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `m_daftar_bank` */

insert  into `m_daftar_bank`(`kode_bank`,`nama_bank`,`biaya_adm`,`date_create`,`status_bank`,`keterangan`) values ('001','Bank Permata','7000.00','2018-11-26 00:00:00','ACTIVE',''),('002','Bank Rakyat Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',NULL),('008','BANK MANDIRI','7000.00','2018-11-26 00:00:00','ACTIVE',''),('009','Bank Negara Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('011','Bank Danamon','7000.00','2018-11-26 00:00:00','ACTIVE',NULL),('014','Bank Central Asia','7000.00','2018-11-27 13:23:50','ACTIVE',NULL),('016','Bank Maybank Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('019','Bank Panin','7000.00','2018-11-26 00:00:00','ACTIVE',''),('022','Bank CIMB Niaga','7000.00','2018-11-26 00:00:00','ACTIVE',''),('023','Bank UOB Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('028','Bank OCBC NISP','7000.00','2018-11-26 00:00:00','ACTIVE',''),('031','Citibank','7000.00','2018-11-26 00:00:00','ACTIVE',NULL),('041','Bank HSBC','7000.00','2018-11-26 00:00:00','ACTIVE',''),('046','Bank DBS','7000.00','2018-11-26 00:00:00','ACTIVE',''),('050','Standard Chartered Bank','7000.00','2018-11-26 00:00:00','ACTIVE',''),('054','Bank Capital','7000.00','2018-11-26 00:00:00','ACTIVE',''),('061','ANZ Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('069','Bank Of China','7000.00','2018-11-26 00:00:00','ACTIVE',''),('087','Bank Ekonomi Raharja','7000.00','2018-11-26 00:00:00','ACTIVE',''),('089','Rabobank','7000.00','2018-11-26 00:00:00','ACTIVE',''),('095','Bank Jtrust Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('097','Bank Mayapada Internasional','7000.00','2018-11-26 00:00:00','ACTIVE',''),('106','BMT El Sejahtera','7000.00','2018-11-26 00:00:00','ACTIVE',''),('110','Bank Jabar','7000.00','2018-11-26 00:00:00','ACTIVE',''),('111','Bank DKI','7000.00','2018-11-26 00:00:00','ACTIVE',''),('112','BPD DIY','7000.00','2018-11-26 00:00:00','ACTIVE',''),('113','Bank Jateng','7000.00','2018-11-26 00:00:00','ACTIVE',''),('114','Bank Jatim','7000.00','2018-11-26 00:00:00','ACTIVE',''),('115','Bank BPD Jambi','7000.00','2018-11-26 00:00:00','ACTIVE',''),('116','BPD Aceh','7000.00','2018-11-26 00:00:00','ACTIVE',''),('117','Bank Sumatera Utara','7000.00','2018-11-26 00:00:00','ACTIVE',''),('118','Bank Nagari','7000.00','2018-11-26 00:00:00','ACTIVE',''),('119','Bank RIAUKEPRI','7000.00','2018-11-26 00:00:00','ACTIVE',''),('120','Bank Sumsel Babel','7000.00','2018-11-26 00:00:00','ACTIVE',''),('121','Bank Lampung','7000.00','2018-11-26 00:00:00','ACTIVE',''),('122','BPD Kalimantan Selatan','7000.00','2018-11-26 00:00:00','ACTIVE',''),('123','BPD Kalimantan Barat','7000.00','2018-11-26 00:00:00','ACTIVE',''),('124','BPD Kalimantan Timur','7000.00','2018-11-26 00:00:00','ACTIVE',''),('125','BPD Kalimantan Tengah','7000.00','2018-11-26 00:00:00','ACTIVE',''),('126','BANK SULSELBAR','7000.00','2018-11-26 00:00:00','ACTIVE',''),('127','BPD Sulawesi Utara','7000.00','2018-11-26 00:00:00','ACTIVE',''),('128','Bank Nusa Tenggara Barat','7000.00','2018-11-26 00:00:00','ACTIVE',''),('129','BPD Bali','7000.00','2018-11-26 00:00:00','ACTIVE',''),('130','Bank Nusa Tenggara Timur','7000.00','2018-11-26 00:00:00','ACTIVE',''),('131','Bank Maluku','7000.00','2018-11-26 00:00:00','ACTIVE',''),('132','Bank Papua','7000.00','2018-11-26 00:00:00','ACTIVE',''),('133','Bank Bengkulu','7000.00','2018-11-26 00:00:00','ACTIVE',''),('134','Bank Sulteng','7000.00','2018-11-26 00:00:00','ACTIVE',''),('135','BPD Sulawesi Tenggara','7000.00','2018-11-26 00:00:00','ACTIVE',''),('145','Bank Nusantara Parahyangan','7000.00','2018-11-26 00:00:00','ACTIVE',''),('146','Bank Of India Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('147','Bank Muamalat Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('151','Bank Mestika','7000.00','2018-11-26 00:00:00','ACTIVE',''),('153','BANK SINARMAS','7000.00','2018-11-26 00:00:00','ACTIVE',''),('161','Bank Ganesha','7000.00','2018-11-26 00:00:00','ACTIVE',''),('164','BANK ICBC','7000.00','2018-11-26 00:00:00','ACTIVE',''),('167','Bank QNB Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('200','BANK TABUNGAN NEGARA (BTN)','7000.00','2018-11-26 00:00:00','ACTIVE',''),('212','Bank Woori Saudara','7000.00','2018-11-26 00:00:00','ACTIVE',''),('213','BTPN','7000.00','2018-11-26 00:00:00','ACTIVE',''),('422','BRI Syariah','7000.00','2018-11-26 00:00:00','ACTIVE',''),('425','Bank Jabar Banten Syariah','7000.00','2018-11-26 00:00:00','ACTIVE',''),('426','Bank Mega','7000.00','2018-11-26 00:00:00','ACTIVE',''),('441','Bank Bukopin','7000.00','2018-11-26 00:00:00','ACTIVE',''),('451','Bank Syariah Mandiri','7000.00','2018-11-26 00:00:00','ACTIVE',''),('484','BANK KEB HANA','7000.00','2018-11-26 00:00:00','ACTIVE',''),('485','MNC BANK','7000.00','2018-11-26 00:00:00','ACTIVE',''),('490','Bank Yudha Bhakti','7000.00','2018-11-26 00:00:00','ACTIVE',''),('503','BANK NATIONALNOBU','7000.00','2018-11-26 00:00:00','ACTIVE',''),('506','Bank Mega Syariah','7000.00','2018-11-26 00:00:00','ACTIVE',''),('513','Bank Ina Perdana','7000.00','2018-11-26 00:00:00','ACTIVE',''),('517','Bank Panin Syariah','7000.00','2018-11-26 00:00:00','ACTIVE',''),('526','BANK DINAR','7000.00','2018-11-26 00:00:00','ACTIVE',''),('535','BANK KESEJAHTERAAN EKONOMI','7000.00','2018-11-26 00:00:00','ACTIVE',''),('542','Bank Artos Indonesia','7000.00','2018-11-26 00:00:00','ACTIVE',''),('547','BANK BTPN SYARIAH','7000.00','2018-11-26 00:00:00','ACTIVE',''),('553','Bank Mayora','7000.00','2018-11-26 00:00:00','ACTIVE',''),('555','Bank Index','7000.00','2018-11-26 00:00:00','ACTIVE',''),('558','Bank Pembangunan Banten','7000.00','2018-11-26 00:00:00','ACTIVE',''),('564','BANK MANTAP','7000.00','2018-11-26 00:00:00','ACTIVE',''),('600','BPR/LSB','7000.00','2018-11-26 00:00:00','ACTIVE',''),('688','BPR KS','7000.00','2018-11-26 00:00:00','ACTIVE',''),('699','BPR EKA','7000.00','2018-11-26 00:00:00','ACTIVE',''),('789','INDOSAT (DOMPETKU)','7000.00','2018-11-26 00:00:00','ACTIVE',''),('911','TELKOMSEL (TCASH)','7000.00','2018-11-26 00:00:00','ACTIVE',''),('950','Bank Commonwealth','7000.00','2018-11-26 00:00:00','ACTIVE',''),('987','ATMB PLUS','7000.00','2018-11-26 00:00:00','ACTIVE','');

/*Table structure for table `m_gudang` */

DROP TABLE IF EXISTS `m_gudang`;

CREATE TABLE `m_gudang` (
  `gudang_id` int(255) NOT NULL AUTO_INCREMENT,
  `gudang_nama` varchar(255) NOT NULL,
  `gudang_alamat` text NOT NULL,
  `gudang_kota` varchar(255) NOT NULL,
  `gudang_telepon` varchar(255) NOT NULL,
  `gudang_fax` varchar(255) DEFAULT NULL,
  `gudang_email` varchar(255) DEFAULT NULL,
  `gudang_status_aktif` enum('ACTIVE','INACTIVE') NOT NULL,
  `gudang_create_date` datetime NOT NULL,
  `gudang_create_by` varchar(255) NOT NULL,
  `gudang_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `gudang_update_by` varchar(255) DEFAULT NULL,
  `gudang_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`gudang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `m_gudang` */

insert  into `m_gudang`(`gudang_id`,`gudang_nama`,`gudang_alamat`,`gudang_kota`,`gudang_telepon`,`gudang_fax`,`gudang_email`,`gudang_status_aktif`,`gudang_create_date`,`gudang_create_by`,`gudang_update_date`,`gudang_update_by`,`gudang_revised`) values (1,'Gudang Bekasi 1','<p>\n	Perum Permata Hijau</p>\n','','',NULL,NULL,'ACTIVE','2019-10-17 19:22:25','Admin','2019-10-17 19:22:28','Admin',NULL),(2,'Gudang Bogor 1','<p>\n	Jl. Bogor Raya</p>\n','Bogor','',NULL,NULL,'ACTIVE','2019-10-17 19:23:31','Admin','2019-10-17 19:23:43','Admin',NULL);

/*Table structure for table `m_id_generator` */

DROP TABLE IF EXISTS `m_id_generator`;

CREATE TABLE `m_id_generator` (
  `NEXT_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`NEXT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;

/*Data for the table `m_id_generator` */

insert  into `m_id_generator`(`NEXT_ID`) values (96);

/*Table structure for table `m_id_generator_date` */

DROP TABLE IF EXISTS `m_id_generator_date`;

CREATE TABLE `m_id_generator_date` (
  `dtm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dtm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_id_generator_date` */

insert  into `m_id_generator_date`(`dtm`) values ('2019-10-23 15:19:56');

/*Table structure for table `m_karyawan` */

DROP TABLE IF EXISTS `m_karyawan`;

CREATE TABLE `m_karyawan` (
  `karyawan_id` int(11) NOT NULL AUTO_INCREMENT,
  `karyawan_nip` varchar(255) NOT NULL,
  `karyawan_nama` varchar(255) NOT NULL,
  `karyawan_alamat` text,
  `karyawan_telepon` varchar(255) DEFAULT NULL,
  `karyawan_status_aktif` enum('ACTIVE','INACTIVE','','') NOT NULL,
  `karyawan_create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `karyawan_create_by` varchar(255) NOT NULL,
  `karyawan_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `karyawan_update_by` varchar(255) DEFAULT NULL,
  `karyawan_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`karyawan_id`),
  UNIQUE KEY `karyawan_nip` (`karyawan_nip`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `m_karyawan` */

insert  into `m_karyawan`(`karyawan_id`,`karyawan_nip`,`karyawan_nama`,`karyawan_alamat`,`karyawan_telepon`,`karyawan_status_aktif`,`karyawan_create_date`,`karyawan_create_by`,`karyawan_update_date`,`karyawan_update_by`,`karyawan_revised`) values (1,'20190100001','Surya Putra','<p>\n	Bekasi</p>\n','081300009999','ACTIVE','2019-10-17 19:04:06','Admin','2019-10-17 19:04:09','Admin',NULL),(2,'20190100002','Widya Ayu','<p>\n	Jl. Bekasi Raya 4</p>\n','081300009998','ACTIVE','2019-10-17 19:14:18','Admin','2019-10-17 19:14:23','Admin',NULL);

/*Table structure for table `m_pelanggan` */

DROP TABLE IF EXISTS `m_pelanggan`;

CREATE TABLE `m_pelanggan` (
  `pel_id` int(11) NOT NULL AUTO_INCREMENT,
  `pel_kode` char(20) DEFAULT NULL,
  `pel_nama` char(50) DEFAULT NULL,
  `pel_kategori` enum('CASH','PERUSAHAAN','DISTRIBUTOR','AGEN','MARKETPLACE','SOCIALMEDIA','WHATSAPP','CABANG') DEFAULT NULL,
  `pel_alamat` mediumtext,
  `pel_kota` char(30) DEFAULT NULL,
  `pel_provinsi` char(30) DEFAULT NULL,
  `pel_telp` char(50) DEFAULT NULL,
  `pel_email` char(50) DEFAULT NULL,
  `pel_pic` char(100) DEFAULT NULL,
  `pel_pajak` char(50) DEFAULT NULL,
  `pel_create_date` datetime DEFAULT NULL,
  `pel_create_by` char(50) DEFAULT NULL,
  PRIMARY KEY (`pel_id`),
  KEY `pel_telp` (`pel_telp`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `m_pelanggan` */

insert  into `m_pelanggan`(`pel_id`,`pel_kode`,`pel_nama`,`pel_kategori`,`pel_alamat`,`pel_kota`,`pel_provinsi`,`pel_telp`,`pel_email`,`pel_pic`,`pel_pajak`,`pel_create_date`,`pel_create_by`) values (1,'PL19100001','Samsul','MARKETPLACE','<p>\n	JL. Tebet Utara No. 10</p>\n<p>\n	Jakarta Selatan</p>\n','Jakarta','Jakarta','08130000001','samsul@gmail.com',NULL,NULL,'2019-10-10 23:36:49','Admin'),(2,'PLG019010000','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 05:33:39','webmaster'),(3,'PLG019010000','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 05:33:49','webmaster'),(4,'PLG019010000','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 05:34:28','webmaster'),(5,'PLG019010000','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 05:34:54','webmaster'),(6,'PLG019010000','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 05:35:01','webmaster'),(7,'PLG019010000','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 05:35:57','webmaster'),(8,'PLG01901000001','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:04:51','webmaster'),(9,'PLG01901000002','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:37:56','webmaster'),(10,'PLG01901000003','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:38:29','webmaster'),(11,'PLG01901000004','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:40:37','webmaster'),(12,'PLG01901000005','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:42:07','webmaster'),(13,'PLG01901000006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:42:08','webmaster'),(14,'PLG01901000007','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:43:23','webmaster'),(15,'PLG01901000008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:24','webmaster'),(16,'PLG01901000009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:25','webmaster'),(17,'PLG01901000010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:26','webmaster'),(18,'PLG01901000011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:27','webmaster'),(19,'PLG01901000012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:28','webmaster'),(20,'PLG01901000013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:29','webmaster'),(21,'PLG01901000014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:30','webmaster'),(22,'PLG01901000015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:31','webmaster'),(23,'PLG01901000016',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:32','webmaster'),(24,'PLG01901000017',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:33','webmaster'),(25,'PLG01901000018',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:34','webmaster'),(26,'PLG01901000019',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:35','webmaster'),(27,'PLG01901000020',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:36','webmaster'),(28,'PLG01901000021',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:37','webmaster'),(29,'PLG01901000022',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:38','webmaster'),(30,'PLG01901000023',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:39','webmaster'),(31,'PLG01901000024',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:41','webmaster'),(32,'PLG01901000025',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:42','webmaster'),(33,'PLG01901000026',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:43','webmaster'),(34,'PLG01901000027',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:43:59','webmaster'),(35,'PLG01901000028',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:00','webmaster'),(36,'PLG01901000029',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:01','webmaster'),(37,'PLG01901000030',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:03','webmaster'),(38,'PLG01901000031',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:04','webmaster'),(39,'PLG01901000032',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:05','webmaster'),(40,'PLG01901000033',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:06','webmaster'),(41,'PLG01901000034',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:07','webmaster'),(42,'PLG01901000035',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:08','webmaster'),(43,'PLG01901000036',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:09','webmaster'),(44,'PLG01901000037',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:10','webmaster'),(45,'PLG01901000038',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:12','webmaster'),(46,'PLG01901000039',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:13','webmaster'),(47,'PLG01901000040',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:14','webmaster'),(48,'PLG01901000041',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:15','webmaster'),(49,'PLG01901000042',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:16','webmaster'),(50,'PLG01901000043',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:18','webmaster'),(51,'PLG01901000044',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:19','webmaster'),(52,'PLG01901000045',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:20','webmaster'),(53,'PLG01901000046',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:21','webmaster'),(54,'PLG01901000047',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:27','webmaster'),(55,'PLG01901000048',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-26 06:44:42','webmaster'),(56,'PLG01901000049','0','PERUSAHAAN','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 06:46:14','webmaster'),(57,'PLG01901000050','0','','0',NULL,NULL,'0',NULL,NULL,NULL,'2019-10-26 07:45:11','webmaster'),(58,'PLG01901000051','Edi','DISTRIBUTOR','tes',NULL,NULL,'0813',NULL,NULL,NULL,'2019-10-26 11:30:46','webmaster');

/*Table structure for table `m_periode` */

DROP TABLE IF EXISTS `m_periode`;

CREATE TABLE `m_periode` (
  `periode_id` int(11) NOT NULL AUTO_INCREMENT,
  `periode_nama` varchar(255) DEFAULT NULL,
  `periode_status_aktif` char(1) DEFAULT NULL,
  `periode_create_date` datetime DEFAULT NULL,
  `periode_create_by` varchar(255) DEFAULT NULL,
  `periode_update_date` datetime DEFAULT NULL,
  `periode_update_by` varchar(255) DEFAULT NULL,
  `periode_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`periode_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `m_periode` */

insert  into `m_periode`(`periode_id`,`periode_nama`,`periode_status_aktif`,`periode_create_date`,`periode_create_by`,`periode_update_date`,`periode_update_by`,`periode_revised`) values (1,'Meter1','y','2017-02-16 16:10:43','developer','2017-02-16 16:10:43',NULL,0),(2,'Kilogram','y','2017-02-16 16:11:12','developer','2017-02-16 16:11:12',NULL,0);

/*Table structure for table `m_perkiraan` */

DROP TABLE IF EXISTS `m_perkiraan`;

CREATE TABLE `m_perkiraan` (
  `KODE_PERK` char(20) NOT NULL DEFAULT '',
  `NAMA_PERK` char(50) DEFAULT NULL,
  `KODE_INDUK` char(20) DEFAULT NULL,
  `LEVEL_PERK` int(11) DEFAULT '0',
  `G_OR_D` char(1) DEFAULT 'D',
  `SALDO_AWAL` decimal(15,2) DEFAULT '0.00',
  `SALDO_DEBET` decimal(15,2) DEFAULT '0.00',
  `SALDO_KREDIT` decimal(15,2) DEFAULT '0.00',
  `SALDO_AKHIR` decimal(15,2) DEFAULT '0.00',
  `IS_BANK` char(1) DEFAULT 'F',
  `D_OR_K` char(1) DEFAULT NULL,
  `JUST_A_TRIGGER` char(1) DEFAULT '0',
  `TYPE_PERK` enum('ASET','KEWAJIBAN','EKUITAS','PENGHASILAN','BEBAN') DEFAULT NULL,
  `CASHFLOW_TANGGAL` year(4) DEFAULT NULL,
  `CASHFLOW_01` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_02` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_03` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_04` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_05` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_06` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_07` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_08` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_09` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_10` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_11` decimal(15,2) DEFAULT '0.00',
  `CASHFLOW_12` decimal(15,2) DEFAULT '0.00',
  `RENCANA_TANGGAL` year(4) DEFAULT NULL,
  `RENCANA_01` decimal(18,2) DEFAULT '0.00',
  `RENCANA_02` decimal(18,2) DEFAULT '0.00',
  `RENCANA_03` decimal(18,2) DEFAULT '0.00',
  `RENCANA_04` decimal(18,2) DEFAULT '0.00',
  `RENCANA_05` decimal(18,2) DEFAULT '0.00',
  `RENCANA_06` decimal(18,2) DEFAULT '0.00',
  `RENCANA_07` decimal(18,2) DEFAULT '0.00',
  `RENCANA_08` decimal(18,2) DEFAULT '0.00',
  `RENCANA_09` decimal(18,2) DEFAULT '0.00',
  `RENCANA_10` decimal(18,2) DEFAULT '0.00',
  `RENCANA_11` decimal(18,2) DEFAULT '0.00',
  `RENCANA_12` decimal(18,2) DEFAULT '0.00',
  `RINCIAN_TANGGAL` year(4) DEFAULT NULL,
  `RINCIAN_01` decimal(18,2) NOT NULL,
  `RINCIAN_02` decimal(18,2) NOT NULL,
  `RINCIAN_03` decimal(18,2) NOT NULL,
  `RINCIAN_04` decimal(18,2) NOT NULL,
  `RINCIAN_05` decimal(18,2) NOT NULL,
  `RINCIAN_06` decimal(18,2) NOT NULL,
  `RINCIAN_07` decimal(18,2) NOT NULL,
  `RINCIAN_08` decimal(18,2) NOT NULL,
  `RINCIAN_09` decimal(18,2) NOT NULL,
  `RINCIAN_10` decimal(18,2) NOT NULL,
  `RINCIAN_11` decimal(18,2) NOT NULL,
  `RINCIAN_12` decimal(18,2) NOT NULL,
  `KODE_ALTERNATIF` char(20) DEFAULT NULL,
  `KODE_KONSOLIDASI` char(20) DEFAULT NULL,
  `ID_PERK` int(11) NOT NULL,
  `ID_INDUK` int(11) NOT NULL,
  `CABANG_ID` char(2) DEFAULT NULL,
  PRIMARY KEY (`KODE_PERK`),
  KEY `CABANG_ID` (`CABANG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_perkiraan` */

insert  into `m_perkiraan`(`KODE_PERK`,`NAMA_PERK`,`KODE_INDUK`,`LEVEL_PERK`,`G_OR_D`,`SALDO_AWAL`,`SALDO_DEBET`,`SALDO_KREDIT`,`SALDO_AKHIR`,`IS_BANK`,`D_OR_K`,`JUST_A_TRIGGER`,`TYPE_PERK`,`CASHFLOW_TANGGAL`,`CASHFLOW_01`,`CASHFLOW_02`,`CASHFLOW_03`,`CASHFLOW_04`,`CASHFLOW_05`,`CASHFLOW_06`,`CASHFLOW_07`,`CASHFLOW_08`,`CASHFLOW_09`,`CASHFLOW_10`,`CASHFLOW_11`,`CASHFLOW_12`,`RENCANA_TANGGAL`,`RENCANA_01`,`RENCANA_02`,`RENCANA_03`,`RENCANA_04`,`RENCANA_05`,`RENCANA_06`,`RENCANA_07`,`RENCANA_08`,`RENCANA_09`,`RENCANA_10`,`RENCANA_11`,`RENCANA_12`,`RINCIAN_TANGGAL`,`RINCIAN_01`,`RINCIAN_02`,`RINCIAN_03`,`RINCIAN_04`,`RINCIAN_05`,`RINCIAN_06`,`RINCIAN_07`,`RINCIAN_08`,`RINCIAN_09`,`RINCIAN_10`,`RINCIAN_11`,`RINCIAN_12`,`KODE_ALTERNATIF`,`KODE_KONSOLIDASI`,`ID_PERK`,`ID_INDUK`,`CABANG_ID`) values ('10','AKTIVA','0',0,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('10.00.00','ASET LANCAR','10',1,'G','5613624072.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('11.00.00','KAS DAN BANK','10.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',2019,'8000000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('11.01.00','Kas / Bank','11.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('11.02.00','Kas Kecil','11.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('12.00.00','INVESTASI JANGKA PENDEK','10.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('12.01.00','Deposito','12.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('12.02.00','INVESTASI PADA EFEK','12.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.00.00','PIUTANG USAHA','10.00.00',2,'D','5144841805.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.00','PIUTANG REKENING AIR','13.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.10','Piutang Rekening Air Kelompok Pelanggan I','13.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.20','Piutang Rekening Air Kelompok Pelanggan II','13.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.30','Piutang Rekening Air Kelompok Pelanggan III','13.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.40','Piutang Rekening Air Kelompok Pelanggan IV','13.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.50','\"Piutang Rekening Kelompok Pelanggan','13.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.01.60','Piutang Rekening Lainnya','13.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.02.00','PIUTANG REKENING NON AIR','13.00.00',2,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.02.10','Piutang Rekening Sambungan Baru','13.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.02.20','Piutang Sambungan Baru Yang Diangsur','13.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.02.30','Piutang Sewa Instalasi','13.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.02.40','Piutang Denda','13.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.02.90','Piutang Rekening Non Air Lainnya','13.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.03.00','PIUTANG KEMITRAAN','13.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.04.00','PIUTANG REKENING AIR LIMBAH','13.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.09.00','AKUMULASI PENYISIHAN PIUTANG USAHA','13.00.00',2,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.09.10','Akumulasi Penyisihan Piutang Rekening Air','13.09.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.09.20','Akumulasi Penyisihan Piutang Rekening Non Air','13.09.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.09.30','Akumulasi Penyisihan Piutang Kemitraan','13.09.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('13.09.40','Akumulasi Penyisihan Piutang Rekening Air Limbah','13.09.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('14.00.00','PIUTANG NON USAHA','12.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('15.00.00','PERSEDIAAN','12.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('16.00.00','PEMBAYARAN DIMUKA','12.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('30.00.00','ASET TIDAK LANCAR','10',1,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.00.00','ASET TETAP','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.01.00','TANAH DAN PENYEMPURNAAN TANAH','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.02.00','INSTALASI SUMBER AIR','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.03.00','INSTALASI POMPA','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.04.00','INSTALASI PENGOLAHAN AIR','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.05.00','INSTALASI TRANSMISI DAN DISTRIBUSI','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.06.00','BANGUNAN GEDUNG','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.07.00','PERALATAN DAN PERLENGKAPAN','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.08.00','KENDARAAN / ALAT PENGANGKUTAN','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.09.00','INVENTARIS / PERABOT KANTOR','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.10.00','AKUMULASI PENYUSUTAN','31.00.00',3,'G','462757211.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('31.20.00','AKUMULASI PENURUNAN NILAI ASET TETAP','31.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('32.00.00','INVESTASI JANGKA PANJANG','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('32.01.00','DEPOSITO BERJANGKA LEBIH DARI 1 TAHUN','32.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('32.02.00','PENYERTAAN PADA ENTITAS ANAK','32.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('32.03.00','PENANAMAN DALAM ASSET BERWUJUD','32.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('33.00.00','ASET TETAP LEASING','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('33.01.90','Akumulasi Penyusutan','33.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('33.02.00','Akumulasi Penurunan Nilai','33.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('34.00.00','PROPERTI INVESTASI','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('34.01.00','Tanah','34.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('34.02.00','Gedung/Bangunan','34.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('34.09.00','Akumulasi Penyusutan Properti Investasi','34.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('34.10.00','Akumulasi Penurunan Nilai','34.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('35.00.00','ASET TAK BERWUJUD','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('35.01.00','Trade mark','35.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('35.02.00','Akumulasi Amortisasi Trade mark','35.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('35.03.00','Goodwill','35.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('35.04.00','Akumulasi Amortisasi Goodwill','35.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('36.00.00','REKENING ANTAR KANTOR','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('36.01.00','Rekening Antar Kantor','36.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.00.00','ASSET TETAP DALAM PENYELESAIAN','30.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.01.00','Penyempurnaan Tanah','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.02.00','Instalasi Sumber Air','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.03.00','Instalasi Pompa','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.04.00','Instalasi Pengolahan Air','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.05.00','Instalasi Transmisi','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.06.00','Instalasi Distribusi','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('37.07.00','Bangunan/Gedung','37.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('39.00.00','ASET LAIN-LAIN','30.00.00',2,'G','500000000.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('39.01.00','Dana Untuk Pembayaran Utang Jangka Panjang','39.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','ASET',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50','PASIVA','0',0,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.00.00','KEWAJIBAN JANGKA PENDEK','50',1,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.01.00','Utang Usaha','50.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.01.10','Voucher Yang Masih Harus Dihayar','50.01.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.01.20','Beban Usaha Yang masih harus dibayar','50.01.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.02.00','Utang Non Usaha','50.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.00','Beban Yang Masih Harus Dibayar','50.00.00',2,'G','567605226.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.10','Bunga Pinjaman Yang Masih Harus Dibayar','50.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.20','Premi Asuransi (Non Imbalan Kerja) Yang Masih Haru','50.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.30','Sewa Yang Masih Harus Dibayar','50.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.40','Rekening Listrik Yang Masih Harus Dibayar','50.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.50','Rekening Telepon Yang Masih Harus Dibayar','50.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.03.90','Beban Yang Masih Harus Dibayar Lainnya','50.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.04.00','Pendapatan Diterima Dimuka','50.00.00',2,'G','1866264553.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.05.00','Utang Jangka Pendek','50.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.05.10','Kredit Bank Jangka Pendek','50.05.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.05.90','Utang Jangka Pendek Lainnya','50.05.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.00','Utang Pajak','50.00.00',2,'G','612585171.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.10','Utang PPh Pasal 21','50.06.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.20','Utang PPh Pasal 23','50.06.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.30','Utang PPh Pasal 25','50.06.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.40','Utang PPh Pasal 29','50.06.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.50','PPN Masukan Yang Ditahan','50.06.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.06.90','Pajak Yang Masih Harus Dibayar Lainnya','50.06.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.07.00','Utang Jangka Panjang Jatuh Tempo','50.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.07.10','Utang Jangka Panjang Jatuh Tempo Dalam Negeri','50.07.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.07.20','Utang Jangka Panjang Jatuh Tempo Luar - Negeri','50.07.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.07.80','Utang Leasing Jatuh Tempo','50.07.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.08.00','Utang Bunga','50.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.08.10','Utang Bunga - Pinjaman Dalam Negeri','50.08.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.08.20','Utang Bunga - Pinjaman Luar Negeri','50.08.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.08.80','Utang Bunga - Leasing','50.08.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.09.00','Utang Imbalan Kerja','50.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.09.10','Utang Iuran Pensiun','50.09.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.09.20','Utang Pesangon Pemutusan Kerja','50.09.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.09.30','Utang Jasa Pengabdian Direktur/Badan Pengawas','50.09.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.09.50','Utang Dana Imbalan Kerja','50.09.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.10.00','Jaminan Masa Pemeliharaan','50.00.00',2,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.11.00','Utang Jangka Pendek Lainnya','50.00.00',2,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.11.10','Uang Muka Pemasangan Air Dari Langganan','50.11.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.11.20','Titipan Retribusi Kebersihan','50.11.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('50.11.90','Rupa-rupa Utang Jangka Pendek Lainnya','50.11.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('60.00.00','KEWAJIBAN JANGKA PANJANG DAN LAIN-LAIN','50',1,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.00.00','KEWAJIBAN JANGKA PANJANG','60.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.01.00','Utang Kepada Pemerintah','61.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.02.00','Utang Komersil','61.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.03.00','Utang Leasing','61.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.04.00','Utang Imbalan Kerja','61.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.05.00','Utang Jasa Pengabdian','61.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('61.06.00','Bunga Masa Tenggang','61.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('62.00.00','KEWAJIBAN LAIN-LAIN','60.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('62.01.00','Pendapatan Yang Ditangguhkan','62.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('62.02.00','Rupa-rupa Utang Lainnya','62.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('62.03.00','Cadangan Dana','62.00.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','KEWAJIBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.00.00','EKUITAS','50',1,'G','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.01.00','KEKAYAAN  PEMDA YANG DIPISAHKAN','70.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.01.10','Kekayaan Asal Anggaran Belanja Daerah','70.01.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.01.20','Kekayaan Asal Dana Pembangunan Daerah','70.01.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.02.00','MODAL HIBAH','70.00.00',2,'G','1688332554.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.03.00','BANTUAN PEMERINTAH YANG BELUM DITETAPKAN STATUSNYA','70.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.03.10','BPYBDS Pemerintah Pusat','70.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.03.20','BPYBDS Pemerintah Daerah','70.03.00',3,'D','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.04.00','LABA DITAHAN/(AKUMULASI KERUGIAN)','70.00.00',2,'G','7845898691.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('70.05.00','LABA (RUGI) TAHUN BERJALAN','70.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','EKUITAS',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('80.00.00','PENDAPATAN','50',1,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('81.00.00','PENDAPATAN OPERASIONAL','80.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',2019,'6000000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('81.01.00','PENDAPATAN PENJUALAN AIR','81.00.00',3,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'148143260.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('81.02.00','PENDAPATAN NON AIR','81.00.00',3,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('81.03.00','PENDAPATAN KEMITRAAN','81.00.00',3,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('81.20.00','PENDAPATAN AIR LIMBAH','81.00.00',3,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('88.00.00','PENDAPATAN NON OPERASIONAL','80.00.00',2,'G','0.00','0.00','0.00','0.00','F','K','0','PENGHASILAN',2019,'2000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'8000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('90.00.00','BEBAN OPERASIONAL','10',1,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',2019,'1000000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('91.00.00','BEBAN SUMBER AIR','90.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'20000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('91.01.00','BEBAN OPERASIONAL SUMBER AIR','91.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('91.02.00','BEBAN PEMELIHARAAN SUMBER AIR','91.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('91.03.00','BEBAN AIR BAKU','91.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('91.09.00','BEBAN PENYUSUTAN SUMBER AIR','91.00.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('92.00.00','BEBAN PENGOLAHAN AIR','90.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('92.01.00','BEBAN OPERASIONAL PENGOLAHAN AIR','92.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('92.02.00','BEBAN PEMELIHARAAN PENGOLAHAN AIR','92.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('92.03.00','BEBAN PENGADAAN AIR CURAH','92.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('92.09.00','BEBAN PENYUSUTAN PENGOLAHAN AIR','92.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('93.00.00','BEBAN TRANSMISI DAN DISTRIBUSI','90.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('93.01.00','BEBAN OPERASIONAL TRANSMISI DAN DISTRIBUSI','93.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('93.02.00','BEBAN PEMELIHARAAN TRANSMISI DAN DISTRIBUSI','93.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('93.09.00','BEBAN PENYUSUTAN TRANSMISI DAN DISTRIBUSI','93.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('94.00.00','BEBAN KEMITRAAN','90.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('95.00.00','BEBAN AIR LIMBAH','90.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.00.00','BEBAN UMUM DAN ADMINISTRASI','50',1,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00','30000000.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.01.00','BEBAN PEGAWAI  UMUM DAN ADMINISTRASI','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.02.00','BEBAN KANTOR','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.03.00','BEBAN HUBUNGAN LANGGANAN','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.04.00','BEBAN PENELITIAN DAN PENGEMBANGAN','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.05.00','BEBAN KEUANGAN','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.06.00','BEBAN PEMELIHARAAN','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.00','RUPA - RUPA BEBAN UMUM','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.20','Beban Penghapusan Piutang','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.30','Beban Badan Pengawas','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.40','Beban Perjalanan Dinas','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.50','Beban Jasa Profesional','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.60','Beban Sewa','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.70','Beban Asuransi / Keamanan','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.80','Beban Pajak Pemda / Perijinan','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.07.90','Rupa - Rupa Beban Umum Lainnya','96.07.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.09.00','BEBAN PENYUSUTAN DAN AMORTISASI UMUM','96.00.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.09.30','Beban Penyusutan Kendaraan/Alat Pengangkutan','96.09.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.09.40','Beban Penyusutan Inventaris','96.09.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('96.09.50','Beban Penyusutan Properti Investasi','96.09.00',3,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.00.00','BEBAN NON OPERASIONAL','10',1,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',2019,'20000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'3000000.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.00','Beban Kerugian Penurunan Nilai','98.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.11','Beban Kerugian Penyisihan Piutang Usaha','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.12','Beban Kerugian Penyisihan Piutang Non Usaha','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.13','Beban Kerugian Penurunan Nilai Surat berharga','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.14','Beban Kerugian Penurunan Nilai Persediaan','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.15','Beban Kerugian Penurunan Nilai Aset Tetap','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.16','Beban Kerugian Penurunan Nilai Property Investasi','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.01.17','Beban Kerugian Penurunan Nilai Aset Leasing','98.01.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',2019,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.02.00','Beban Non usaha lainnya','98.00.00',2,'G','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.02.10','Beban Bank','98.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.02.20','Kerugian Penjualan Persediaan Barang Usang','98.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.02.30','Kerugian Transaksi Valuta Asing','98.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.02.40','Kerugian Penghapusan Aset Tetap','98.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1'),('98.02.90','Rupa-Rupa Beban Non Operasional','98.02.00',3,'D','0.00','0.00','0.00','0.00','F','D','0','BEBAN',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,'0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00',NULL,NULL,0,0,'1');

/*Table structure for table `m_produk` */

DROP TABLE IF EXISTS `m_produk`;

CREATE TABLE `m_produk` (
  `produk_id` int(11) NOT NULL AUTO_INCREMENT,
  `mitra_project_kode` char(10) DEFAULT NULL,
  `mitra_id` int(11) DEFAULT NULL,
  `supp_id` int(11) DEFAULT NULL,
  `m_jenis_barang_id` int(11) NOT NULL,
  `produk_kode` varchar(255) NOT NULL,
  `produk_nomor` varchar(255) DEFAULT NULL,
  `produk_nama` varchar(255) NOT NULL,
  `m_satuan_id` int(11) DEFAULT NULL,
  `produk_minimum_stok` int(11) NOT NULL DEFAULT '0',
  `produk_status_aktif` char(1) NOT NULL,
  `produk_create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `produk_create_by` varchar(255) NOT NULL,
  `produk_update_date` datetime DEFAULT NULL,
  `produk_update_by` varchar(255) DEFAULT NULL,
  `produk_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`produk_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1769461 DEFAULT CHARSET=utf8;

/*Data for the table `m_produk` */

insert  into `m_produk`(`produk_id`,`mitra_project_kode`,`mitra_id`,`supp_id`,`m_jenis_barang_id`,`produk_kode`,`produk_nomor`,`produk_nama`,`m_satuan_id`,`produk_minimum_stok`,`produk_status_aktif`,`produk_create_date`,`produk_create_by`,`produk_update_date`,`produk_update_by`,`produk_revised`) values (1769445,'PRJ_190005',NULL,NULL,1,'BRG0001','NOBRG0001','Botol Plastik',2,1,'y','2019-09-26 16:01:16','edisite01@gmail.com','2019-09-26 16:01:16',NULL,0),(1769446,'PRJ_190005',NULL,NULL,1,'BRG0002','NOBRG0002','Botol Plastik',2,1,'y','2019-09-26 16:02:44','edisite01@gmail.com','2019-09-26 16:02:44',NULL,0),(1769447,'PRJ_190005',NULL,NULL,1,'BRG0003','NOBRG0003','Botol Plastik',2,1,'y','2019-09-26 16:07:15','edisite01@gmail.com','2019-09-26 16:07:15',NULL,0),(1769448,'PRJ_190005',NULL,NULL,1,'BRG0004','NOBRG0004','Botol Plastik',2,1,'y','2019-09-26 16:10:05','edisite01@gmail.com','2019-09-26 16:10:05',NULL,0),(1769449,'PRJ_190005',NULL,NULL,1,'BRG0005','NOBRG0005','Botol Plastik',2,1,'y','2019-09-26 16:10:26','edisite01@gmail.com','2019-09-26 16:10:26',NULL,0),(1769450,'PRJ_190005',NULL,NULL,1,'BRG0006','NOBRG0006','Botol Plastik',2,1,'y','2019-09-26 16:12:24','edisite01@gmail.com','2019-09-26 16:12:24',NULL,0),(1769451,'PRJ_190005',NULL,NULL,1,'BRG0007','NOBRG0007','A',2,1,'y','2019-09-26 16:21:05','edisite01@gmail.com','2019-09-26 16:21:05',NULL,0),(1769452,'PRJ_190005',NULL,NULL,1,'BRG0008','NOBRG0008','Botol Plastik',2,1,'y','2019-09-27 05:03:55','edisite01@gmail.com','2019-09-27 05:03:55',NULL,0),(1769453,'PRJ_190005',NULL,NULL,1,'BRG0009','NOBRG0009','Botol Plastik',2,1,'y','2019-09-27 05:06:08','edisite01@gmail.com','2019-09-27 05:06:08',NULL,0),(1769454,'PRJ_190005',NULL,NULL,1,'BRG0010','NOBRG0010','Botol Plastik',2,1,'y','2019-09-27 05:06:47','edisite01@gmail.com','2019-09-27 05:06:47',NULL,0),(1769455,'PRJ_190005',NULL,NULL,1,'BRG0011','NOBRG0011','Botol Plastik',2,1,'y','2019-09-27 05:06:54','edisite01@gmail.com','2019-09-27 05:06:54',NULL,0),(1769456,'PRJ_190005',NULL,NULL,1,'BRG0012','NOBRG0012','Botol Plastik',2,1,'y','2019-09-27 05:07:03','edisite01@gmail.com','2019-09-27 05:07:03',NULL,0),(1769457,'PRJ_190005',NULL,NULL,1,'BRG0013','NOBRG0013','Pembangunan Rumah 2 LT',2,1,'y','2019-10-01 15:28:13','edisite01@gmail.com','2019-10-01 15:28:13',NULL,0),(1769458,'PRJ_190005',NULL,NULL,1,'BRG0014','NOBRG0014','Botol Plastik',2,1,'y','2019-10-04 17:46:39','edisite01@gmail.com','2019-10-04 17:46:39',NULL,0),(1769459,'PRJ_190005',NULL,1,1,'BRG0015','NOBRG0015','Pembangunan Rumah 2 LT',2,1,'y','2019-10-04 18:36:31','edisite01@gmail.com','2019-10-04 18:36:31',NULL,0),(1769460,'PRJ_190005',2,1,1,'BRG0016','NOBRG0016','Pembangunan Rumah 2 LT',2,1,'y','2019-10-04 18:39:40','edisite01@gmail.com','2019-10-04 18:39:40',NULL,0);

/*Table structure for table `m_produk_kategori` */

DROP TABLE IF EXISTS `m_produk_kategori`;

CREATE TABLE `m_produk_kategori` (
  `kategori_id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_nama` varchar(255) DEFAULT NULL,
  `m_kategori_gudang_id` int(11) DEFAULT NULL,
  `kategori_status_aktif` enum('ACTIVE','INACTIVE') DEFAULT NULL,
  `kategori_create_date` datetime DEFAULT NULL,
  `kategori_create_by` varchar(255) DEFAULT NULL,
  `kategori_update_date` datetime DEFAULT NULL,
  `kategori_update_by` varchar(255) DEFAULT NULL,
  `kategori_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `m_produk_kategori` */

insert  into `m_produk_kategori`(`kategori_id`,`kategori_nama`,`m_kategori_gudang_id`,`kategori_status_aktif`,`kategori_create_date`,`kategori_create_by`,`kategori_update_date`,`kategori_update_by`,`kategori_revised`) values (1,'Jenis Barang 1',1,'ACTIVE','2017-02-15 18:06:09','developer','2019-10-13 12:27:03',NULL,0);

/*Table structure for table `m_provinces` */

DROP TABLE IF EXISTS `m_provinces`;

CREATE TABLE `m_provinces` (
  `provinces_id` char(2) NOT NULL,
  `provinces_nama` varchar(255) NOT NULL,
  `provinces_status_aktif` enum('ACTIVE','INACTIVE') NOT NULL,
  `provinces_create_date` datetime NOT NULL,
  `provinces_create_by` char(50) NOT NULL,
  `provinces_update_date` datetime NOT NULL,
  `provinces_update_by` char(50) NOT NULL,
  PRIMARY KEY (`provinces_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `m_provinces` */

insert  into `m_provinces`(`provinces_id`,`provinces_nama`,`provinces_status_aktif`,`provinces_create_date`,`provinces_create_by`,`provinces_update_date`,`provinces_update_by`) values ('11','ACEH','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('12','SUMATERA UTARA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('13','SUMATERA BARAT','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('14','RIAU','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('15','JAMBI','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('16','SUMATERA SELATAN','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('17','BENGKULU','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('18','LAMPUNG','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('19','KEPULAUAN BANGKA BELITUNG','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('21','KEPULAUAN RIAU','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('31','DKI JAKARTA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('32','JAWA BARAT','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('33','JAWA TENGAH','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('34','DI YOGYAKARTA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('35','JAWA TIMUR','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('36','BANTEN','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('51','BALI','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('52','NUSA TENGGARA BARAT','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('53','NUSA TENGGARA TIMUR','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('61','KALIMANTAN BARAT','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('62','KALIMANTAN TENGAH','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('63','KALIMANTAN SELATAN','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('64','KALIMANTAN TIMUR','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('65','KALIMANTAN UTARA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('71','SULAWESI UTARA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('72','SULAWESI TENGAH','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('73','SULAWESI SELATAN','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('74','SULAWESI TENGGARA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('75','GORONTALO','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('76','SULAWESI BARAT','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('81','MALUKU','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('82','MALUKU UTARA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('91','PAPUA BARAT','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN'),('94','PAPUA','ACTIVE','2019-10-10 19:13:46','ADMIN','2019-10-10 19:13:46','ADMIN');

/*Table structure for table `m_regencies` */

DROP TABLE IF EXISTS `m_regencies`;

CREATE TABLE `m_regencies` (
  `regenci_id` char(4) NOT NULL,
  `province_id` char(2) NOT NULL,
  `regenci_name` varchar(255) NOT NULL,
  `regenci_status_aktif` enum('ACTIVE','ACTIVE') DEFAULT NULL,
  `regenci_create_date` datetime DEFAULT NULL,
  `regenci_create_by` char(50) DEFAULT NULL,
  `regenci_update_date` datetime DEFAULT NULL,
  `regenci_update_by` char(50) DEFAULT NULL,
  PRIMARY KEY (`regenci_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `m_regencies` */

insert  into `m_regencies`(`regenci_id`,`province_id`,`regenci_name`,`regenci_status_aktif`,`regenci_create_date`,`regenci_create_by`,`regenci_update_date`,`regenci_update_by`) values ('1101','11','KABUPATEN SIMEULUE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1102','11','KABUPATEN ACEH SINGKIL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1103','11','KABUPATEN ACEH SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1104','11','KABUPATEN ACEH TENGGARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1105','11','KABUPATEN ACEH TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1106','11','KABUPATEN ACEH TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1107','11','KABUPATEN ACEH BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1108','11','KABUPATEN ACEH BESAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1109','11','KABUPATEN PIDIE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1110','11','KABUPATEN BIREUEN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1111','11','KABUPATEN ACEH UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1112','11','KABUPATEN ACEH BARAT DAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1113','11','KABUPATEN GAYO LUES','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1114','11','KABUPATEN ACEH TAMIANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1115','11','KABUPATEN NAGAN RAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1116','11','KABUPATEN ACEH JAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1117','11','KABUPATEN BENER MERIAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1118','11','KABUPATEN PIDIE JAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1171','11','KOTA BANDA ACEH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1172','11','KOTA SABANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1173','11','KOTA LANGSA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1174','11','KOTA LHOKSEUMAWE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1175','11','KOTA SUBULUSSALAM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1201','12','KABUPATEN NIAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1202','12','KABUPATEN MANDAILING NATAL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1203','12','KABUPATEN TAPANULI SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1204','12','KABUPATEN TAPANULI TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1205','12','KABUPATEN TAPANULI UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1206','12','KABUPATEN TOBA SAMOSIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1207','12','KABUPATEN LABUHAN BATU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1208','12','KABUPATEN ASAHAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1209','12','KABUPATEN SIMALUNGUN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1210','12','KABUPATEN DAIRI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1211','12','KABUPATEN KARO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1212','12','KABUPATEN DELI SERDANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1213','12','KABUPATEN LANGKAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1214','12','KABUPATEN NIAS SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1215','12','KABUPATEN HUMBANG HASUNDUTAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1216','12','KABUPATEN PAKPAK BHARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1217','12','KABUPATEN SAMOSIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1218','12','KABUPATEN SERDANG BEDAGAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1219','12','KABUPATEN BATU BARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1220','12','KABUPATEN PADANG LAWAS UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1221','12','KABUPATEN PADANG LAWAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1222','12','KABUPATEN LABUHAN BATU SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1223','12','KABUPATEN LABUHAN BATU UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1224','12','KABUPATEN NIAS UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1225','12','KABUPATEN NIAS BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1271','12','KOTA SIBOLGA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1272','12','KOTA TANJUNG BALAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1273','12','KOTA PEMATANG SIANTAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1274','12','KOTA TEBING TINGGI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1275','12','KOTA MEDAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1276','12','KOTA BINJAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1277','12','KOTA PADANGSIDIMPUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1278','12','KOTA GUNUNGSITOLI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1301','13','KABUPATEN KEPULAUAN MENTAWAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1302','13','KABUPATEN PESISIR SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1303','13','KABUPATEN SOLOK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1304','13','KABUPATEN SIJUNJUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1305','13','KABUPATEN TANAH DATAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1306','13','KABUPATEN PADANG PARIAMAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1307','13','KABUPATEN AGAM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1308','13','KABUPATEN LIMA PULUH KOTA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1309','13','KABUPATEN PASAMAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1310','13','KABUPATEN SOLOK SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1311','13','KABUPATEN DHARMASRAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1312','13','KABUPATEN PASAMAN BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1371','13','KOTA PADANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1372','13','KOTA SOLOK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1373','13','KOTA SAWAH LUNTO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1374','13','KOTA PADANG PANJANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1375','13','KOTA BUKITTINGGI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1376','13','KOTA PAYAKUMBUH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1377','13','KOTA PARIAMAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1401','14','KABUPATEN KUANTAN SINGINGI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1402','14','KABUPATEN INDRAGIRI HULU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1403','14','KABUPATEN INDRAGIRI HILIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1404','14','KABUPATEN PELALAWAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1405','14','KABUPATEN S I A K','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1406','14','KABUPATEN KAMPAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1407','14','KABUPATEN ROKAN HULU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1408','14','KABUPATEN BENGKALIS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1409','14','KABUPATEN ROKAN HILIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1410','14','KABUPATEN KEPULAUAN MERANTI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1471','14','KOTA PEKANBARU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1473','14','KOTA D U M A I','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1501','15','KABUPATEN KERINCI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1502','15','KABUPATEN MERANGIN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1503','15','KABUPATEN SAROLANGUN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1504','15','KABUPATEN BATANG HARI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1505','15','KABUPATEN MUARO JAMBI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1506','15','KABUPATEN TANJUNG JABUNG TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1507','15','KABUPATEN TANJUNG JABUNG BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1508','15','KABUPATEN TEBO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1509','15','KABUPATEN BUNGO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1571','15','KOTA JAMBI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1572','15','KOTA SUNGAI PENUH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1601','16','KABUPATEN OGAN KOMERING ULU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1602','16','KABUPATEN OGAN KOMERING ILIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1603','16','KABUPATEN MUARA ENIM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1604','16','KABUPATEN LAHAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1605','16','KABUPATEN MUSI RAWAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1606','16','KABUPATEN MUSI BANYUASIN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1607','16','KABUPATEN BANYU ASIN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1608','16','KABUPATEN OGAN KOMERING ULU SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1609','16','KABUPATEN OGAN KOMERING ULU TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1610','16','KABUPATEN OGAN ILIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1611','16','KABUPATEN EMPAT LAWANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1612','16','KABUPATEN PENUKAL ABAB LEMATANG ILIR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1613','16','KABUPATEN MUSI RAWAS UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1671','16','KOTA PALEMBANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1672','16','KOTA PRABUMULIH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1673','16','KOTA PAGAR ALAM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1674','16','KOTA LUBUKLINGGAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1701','17','KABUPATEN BENGKULU SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1702','17','KABUPATEN REJANG LEBONG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1703','17','KABUPATEN BENGKULU UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1704','17','KABUPATEN KAUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1705','17','KABUPATEN SELUMA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1706','17','KABUPATEN MUKOMUKO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1707','17','KABUPATEN LEBONG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1708','17','KABUPATEN KEPAHIANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1709','17','KABUPATEN BENGKULU TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1771','17','KOTA BENGKULU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1801','18','KABUPATEN LAMPUNG BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1802','18','KABUPATEN TANGGAMUS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1803','18','KABUPATEN LAMPUNG SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1804','18','KABUPATEN LAMPUNG TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1805','18','KABUPATEN LAMPUNG TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1806','18','KABUPATEN LAMPUNG UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1807','18','KABUPATEN WAY KANAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1808','18','KABUPATEN TULANGBAWANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1809','18','KABUPATEN PESAWARAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1810','18','KABUPATEN PRINGSEWU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1811','18','KABUPATEN MESUJI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1812','18','KABUPATEN TULANG BAWANG BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1813','18','KABUPATEN PESISIR BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1871','18','KOTA BANDAR LAMPUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1872','18','KOTA METRO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1901','19','KABUPATEN BANGKA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1902','19','KABUPATEN BELITUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1903','19','KABUPATEN BANGKA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1904','19','KABUPATEN BANGKA TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1905','19','KABUPATEN BANGKA SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1906','19','KABUPATEN BELITUNG TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('1971','19','KOTA PANGKAL PINANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2101','21','KABUPATEN KARIMUN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2102','21','KABUPATEN BINTAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2103','21','KABUPATEN NATUNA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2104','21','KABUPATEN LINGGA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2105','21','KABUPATEN KEPULAUAN ANAMBAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2171','21','KOTA B A T A M','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('2172','21','KOTA TANJUNG PINANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3101','31','KABUPATEN KEPULAUAN SERIBU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3171','31','KOTA JAKARTA SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3172','31','KOTA JAKARTA TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3173','31','KOTA JAKARTA PUSAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3174','31','KOTA JAKARTA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3175','31','KOTA JAKARTA UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3201','32','KABUPATEN BOGOR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3202','32','KABUPATEN SUKABUMI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3203','32','KABUPATEN CIANJUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3204','32','KABUPATEN BANDUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3205','32','KABUPATEN GARUT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3206','32','KABUPATEN TASIKMALAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3207','32','KABUPATEN CIAMIS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3208','32','KABUPATEN KUNINGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3209','32','KABUPATEN CIREBON','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3210','32','KABUPATEN MAJALENGKA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3211','32','KABUPATEN SUMEDANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3212','32','KABUPATEN INDRAMAYU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3213','32','KABUPATEN SUBANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3214','32','KABUPATEN PURWAKARTA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3215','32','KABUPATEN KARAWANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3216','32','KABUPATEN BEKASI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3217','32','KABUPATEN BANDUNG BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3218','32','KABUPATEN PANGANDARAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3271','32','KOTA BOGOR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3272','32','KOTA SUKABUMI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3273','32','KOTA BANDUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3274','32','KOTA CIREBON','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3275','32','KOTA BEKASI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3276','32','KOTA DEPOK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3277','32','KOTA CIMAHI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3278','32','KOTA TASIKMALAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3279','32','KOTA BANJAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3301','33','KABUPATEN CILACAP','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3302','33','KABUPATEN BANYUMAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3303','33','KABUPATEN PURBALINGGA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3304','33','KABUPATEN BANJARNEGARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3305','33','KABUPATEN KEBUMEN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3306','33','KABUPATEN PURWOREJO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3307','33','KABUPATEN WONOSOBO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3308','33','KABUPATEN MAGELANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3309','33','KABUPATEN BOYOLALI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3310','33','KABUPATEN KLATEN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3311','33','KABUPATEN SUKOHARJO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3312','33','KABUPATEN WONOGIRI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3313','33','KABUPATEN KARANGANYAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3314','33','KABUPATEN SRAGEN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3315','33','KABUPATEN GROBOGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3316','33','KABUPATEN BLORA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3317','33','KABUPATEN REMBANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3318','33','KABUPATEN PATI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3319','33','KABUPATEN KUDUS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3320','33','KABUPATEN JEPARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3321','33','KABUPATEN DEMAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3322','33','KABUPATEN SEMARANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3323','33','KABUPATEN TEMANGGUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3324','33','KABUPATEN KENDAL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3325','33','KABUPATEN BATANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3326','33','KABUPATEN PEKALONGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3327','33','KABUPATEN PEMALANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3328','33','KABUPATEN TEGAL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3329','33','KABUPATEN BREBES','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3371','33','KOTA MAGELANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3372','33','KOTA SURAKARTA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3373','33','KOTA SALATIGA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3374','33','KOTA SEMARANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3375','33','KOTA PEKALONGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3376','33','KOTA TEGAL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3401','34','KABUPATEN KULON PROGO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3402','34','KABUPATEN BANTUL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3403','34','KABUPATEN GUNUNG KIDUL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3404','34','KABUPATEN SLEMAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3471','34','KOTA YOGYAKARTA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3501','35','KABUPATEN PACITAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3502','35','KABUPATEN PONOROGO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3503','35','KABUPATEN TRENGGALEK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3504','35','KABUPATEN TULUNGAGUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3505','35','KABUPATEN BLITAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3506','35','KABUPATEN KEDIRI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3507','35','KABUPATEN MALANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3508','35','KABUPATEN LUMAJANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3509','35','KABUPATEN JEMBER','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3510','35','KABUPATEN BANYUWANGI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3511','35','KABUPATEN BONDOWOSO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3512','35','KABUPATEN SITUBONDO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3513','35','KABUPATEN PROBOLINGGO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3514','35','KABUPATEN PASURUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3515','35','KABUPATEN SIDOARJO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3516','35','KABUPATEN MOJOKERTO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3517','35','KABUPATEN JOMBANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3518','35','KABUPATEN NGANJUK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3519','35','KABUPATEN MADIUN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3520','35','KABUPATEN MAGETAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3521','35','KABUPATEN NGAWI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3522','35','KABUPATEN BOJONEGORO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3523','35','KABUPATEN TUBAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3524','35','KABUPATEN LAMONGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3525','35','KABUPATEN GRESIK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3526','35','KABUPATEN BANGKALAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3527','35','KABUPATEN SAMPANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3528','35','KABUPATEN PAMEKASAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3529','35','KABUPATEN SUMENEP','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3571','35','KOTA KEDIRI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3572','35','KOTA BLITAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3573','35','KOTA MALANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3574','35','KOTA PROBOLINGGO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3575','35','KOTA PASURUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3576','35','KOTA MOJOKERTO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3577','35','KOTA MADIUN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3578','35','KOTA SURABAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3579','35','KOTA BATU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3601','36','KABUPATEN PANDEGLANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3602','36','KABUPATEN LEBAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3603','36','KABUPATEN TANGERANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3604','36','KABUPATEN SERANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3671','36','KOTA TANGERANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3672','36','KOTA CILEGON','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3673','36','KOTA SERANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('3674','36','KOTA TANGERANG SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5101','51','KABUPATEN JEMBRANA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5102','51','KABUPATEN TABANAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5103','51','KABUPATEN BADUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5104','51','KABUPATEN GIANYAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5105','51','KABUPATEN KLUNGKUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5106','51','KABUPATEN BANGLI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5107','51','KABUPATEN KARANG ASEM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5108','51','KABUPATEN BULELENG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5171','51','KOTA DENPASAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5201','52','KABUPATEN LOMBOK BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5202','52','KABUPATEN LOMBOK TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5203','52','KABUPATEN LOMBOK TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5204','52','KABUPATEN SUMBAWA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5205','52','KABUPATEN DOMPU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5206','52','KABUPATEN BIMA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5207','52','KABUPATEN SUMBAWA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5208','52','KABUPATEN LOMBOK UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5271','52','KOTA MATARAM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5272','52','KOTA BIMA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5301','53','KABUPATEN SUMBA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5302','53','KABUPATEN SUMBA TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5303','53','KABUPATEN KUPANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5304','53','KABUPATEN TIMOR TENGAH SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5305','53','KABUPATEN TIMOR TENGAH UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5306','53','KABUPATEN BELU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5307','53','KABUPATEN ALOR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5308','53','KABUPATEN LEMBATA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5309','53','KABUPATEN FLORES TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5310','53','KABUPATEN SIKKA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5311','53','KABUPATEN ENDE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5312','53','KABUPATEN NGADA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5313','53','KABUPATEN MANGGARAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5314','53','KABUPATEN ROTE NDAO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5315','53','KABUPATEN MANGGARAI BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5316','53','KABUPATEN SUMBA TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5317','53','KABUPATEN SUMBA BARAT DAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5318','53','KABUPATEN NAGEKEO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5319','53','KABUPATEN MANGGARAI TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5320','53','KABUPATEN SABU RAIJUA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5321','53','KABUPATEN MALAKA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('5371','53','KOTA KUPANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6101','61','KABUPATEN SAMBAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6102','61','KABUPATEN BENGKAYANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6103','61','KABUPATEN LANDAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6104','61','KABUPATEN MEMPAWAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6105','61','KABUPATEN SANGGAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6106','61','KABUPATEN KETAPANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6107','61','KABUPATEN SINTANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6108','61','KABUPATEN KAPUAS HULU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6109','61','KABUPATEN SEKADAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6110','61','KABUPATEN MELAWI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6111','61','KABUPATEN KAYONG UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6112','61','KABUPATEN KUBU RAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6171','61','KOTA PONTIANAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6172','61','KOTA SINGKAWANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6201','62','KABUPATEN KOTAWARINGIN BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6202','62','KABUPATEN KOTAWARINGIN TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6203','62','KABUPATEN KAPUAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6204','62','KABUPATEN BARITO SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6205','62','KABUPATEN BARITO UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6206','62','KABUPATEN SUKAMARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6207','62','KABUPATEN LAMANDAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6208','62','KABUPATEN SERUYAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6209','62','KABUPATEN KATINGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6210','62','KABUPATEN PULANG PISAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6211','62','KABUPATEN GUNUNG MAS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6212','62','KABUPATEN BARITO TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6213','62','KABUPATEN MURUNG RAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6271','62','KOTA PALANGKA RAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6301','63','KABUPATEN TANAH LAUT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6302','63','KABUPATEN KOTA BARU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6303','63','KABUPATEN BANJAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6304','63','KABUPATEN BARITO KUALA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6305','63','KABUPATEN TAPIN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6306','63','KABUPATEN HULU SUNGAI SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6307','63','KABUPATEN HULU SUNGAI TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6308','63','KABUPATEN HULU SUNGAI UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6309','63','KABUPATEN TABALONG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6310','63','KABUPATEN TANAH BUMBU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6311','63','KABUPATEN BALANGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6371','63','KOTA BANJARMASIN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6372','63','KOTA BANJAR BARU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6401','64','KABUPATEN PASER','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6402','64','KABUPATEN KUTAI BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6403','64','KABUPATEN KUTAI KARTANEGARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6404','64','KABUPATEN KUTAI TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6405','64','KABUPATEN BERAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6409','64','KABUPATEN PENAJAM PASER UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6411','64','KABUPATEN MAHAKAM HULU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6471','64','KOTA BALIKPAPAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6472','64','KOTA SAMARINDA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6474','64','KOTA BONTANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6501','65','KABUPATEN MALINAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6502','65','KABUPATEN BULUNGAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6503','65','KABUPATEN TANA TIDUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6504','65','KABUPATEN NUNUKAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('6571','65','KOTA TARAKAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7101','71','KABUPATEN BOLAANG MONGONDOW','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7102','71','KABUPATEN MINAHASA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7103','71','KABUPATEN KEPULAUAN SANGIHE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7104','71','KABUPATEN KEPULAUAN TALAUD','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7105','71','KABUPATEN MINAHASA SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7106','71','KABUPATEN MINAHASA UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7107','71','KABUPATEN BOLAANG MONGONDOW UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7108','71','KABUPATEN SIAU TAGULANDANG BIARO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7109','71','KABUPATEN MINAHASA TENGGARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7110','71','KABUPATEN BOLAANG MONGONDOW SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7111','71','KABUPATEN BOLAANG MONGONDOW TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7171','71','KOTA MANADO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7172','71','KOTA BITUNG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7173','71','KOTA TOMOHON','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7174','71','KOTA KOTAMOBAGU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7201','72','KABUPATEN BANGGAI KEPULAUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7202','72','KABUPATEN BANGGAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7203','72','KABUPATEN MOROWALI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7204','72','KABUPATEN POSO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7205','72','KABUPATEN DONGGALA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7206','72','KABUPATEN TOLI-TOLI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7207','72','KABUPATEN BUOL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7208','72','KABUPATEN PARIGI MOUTONG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7209','72','KABUPATEN TOJO UNA-UNA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7210','72','KABUPATEN SIGI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7211','72','KABUPATEN BANGGAI LAUT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7212','72','KABUPATEN MOROWALI UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7271','72','KOTA PALU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7301','73','KABUPATEN KEPULAUAN SELAYAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7302','73','KABUPATEN BULUKUMBA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7303','73','KABUPATEN BANTAENG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7304','73','KABUPATEN JENEPONTO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7305','73','KABUPATEN TAKALAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7306','73','KABUPATEN GOWA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7307','73','KABUPATEN SINJAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7308','73','KABUPATEN MAROS','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7309','73','KABUPATEN PANGKAJENE DAN KEPULAUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7310','73','KABUPATEN BARRU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7311','73','KABUPATEN BONE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7312','73','KABUPATEN SOPPENG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7313','73','KABUPATEN WAJO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7314','73','KABUPATEN SIDENRENG RAPPANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7315','73','KABUPATEN PINRANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7316','73','KABUPATEN ENREKANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7317','73','KABUPATEN LUWU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7318','73','KABUPATEN TANA TORAJA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7322','73','KABUPATEN LUWU UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7325','73','KABUPATEN LUWU TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7326','73','KABUPATEN TORAJA UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7371','73','KOTA MAKASSAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7372','73','KOTA PAREPARE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7373','73','KOTA PALOPO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7401','74','KABUPATEN BUTON','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7402','74','KABUPATEN MUNA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7403','74','KABUPATEN KONAWE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7404','74','KABUPATEN KOLAKA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7405','74','KABUPATEN KONAWE SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7406','74','KABUPATEN BOMBANA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7407','74','KABUPATEN WAKATOBI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7408','74','KABUPATEN KOLAKA UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7409','74','KABUPATEN BUTON UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7410','74','KABUPATEN KONAWE UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7411','74','KABUPATEN KOLAKA TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7412','74','KABUPATEN KONAWE KEPULAUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7413','74','KABUPATEN MUNA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7414','74','KABUPATEN BUTON TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7415','74','KABUPATEN BUTON SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7471','74','KOTA KENDARI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7472','74','KOTA BAUBAU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7501','75','KABUPATEN BOALEMO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7502','75','KABUPATEN GORONTALO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7503','75','KABUPATEN POHUWATO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7504','75','KABUPATEN BONE BOLANGO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7505','75','KABUPATEN GORONTALO UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7571','75','KOTA GORONTALO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7601','76','KABUPATEN MAJENE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7602','76','KABUPATEN POLEWALI MANDAR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7603','76','KABUPATEN MAMASA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7604','76','KABUPATEN MAMUJU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7605','76','KABUPATEN MAMUJU UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('7606','76','KABUPATEN MAMUJU TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8101','81','KABUPATEN MALUKU TENGGARA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8102','81','KABUPATEN MALUKU TENGGARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8103','81','KABUPATEN MALUKU TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8104','81','KABUPATEN BURU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8105','81','KABUPATEN KEPULAUAN ARU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8106','81','KABUPATEN SERAM BAGIAN BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8107','81','KABUPATEN SERAM BAGIAN TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8108','81','KABUPATEN MALUKU BARAT DAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8109','81','KABUPATEN BURU SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8171','81','KOTA AMBON','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8172','81','KOTA TUAL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8201','82','KABUPATEN HALMAHERA BARAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8202','82','KABUPATEN HALMAHERA TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8203','82','KABUPATEN KEPULAUAN SULA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8204','82','KABUPATEN HALMAHERA SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8205','82','KABUPATEN HALMAHERA UTARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8206','82','KABUPATEN HALMAHERA TIMUR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8207','82','KABUPATEN PULAU MOROTAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8208','82','KABUPATEN PULAU TALIABU','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8271','82','KOTA TERNATE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('8272','82','KOTA TIDORE KEPULAUAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9101','91','KABUPATEN FAKFAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9102','91','KABUPATEN KAIMANA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9103','91','KABUPATEN TELUK WONDAMA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9104','91','KABUPATEN TELUK BINTUNI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9105','91','KABUPATEN MANOKWARI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9106','91','KABUPATEN SORONG SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9107','91','KABUPATEN SORONG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9108','91','KABUPATEN RAJA AMPAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9109','91','KABUPATEN TAMBRAUW','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9110','91','KABUPATEN MAYBRAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9111','91','KABUPATEN MANOKWARI SELATAN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9112','91','KABUPATEN PEGUNUNGAN ARFAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9171','91','KOTA SORONG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9401','94','KABUPATEN MERAUKE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9402','94','KABUPATEN JAYAWIJAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9403','94','KABUPATEN JAYAPURA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9404','94','KABUPATEN NABIRE','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9408','94','KABUPATEN KEPULAUAN YAPEN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9409','94','KABUPATEN BIAK NUMFOR','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9410','94','KABUPATEN PANIAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9411','94','KABUPATEN PUNCAK JAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9412','94','KABUPATEN MIMIKA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9413','94','KABUPATEN BOVEN DIGOEL','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9414','94','KABUPATEN MAPPI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9415','94','KABUPATEN ASMAT','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9416','94','KABUPATEN YAHUKIMO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9417','94','KABUPATEN PEGUNUNGAN BINTANG','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9418','94','KABUPATEN TOLIKARA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9419','94','KABUPATEN SARMI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9420','94','KABUPATEN KEEROM','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9426','94','KABUPATEN WAROPEN','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9427','94','KABUPATEN SUPIORI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9428','94','KABUPATEN MAMBERAMO RAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9429','94','KABUPATEN NDUGA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9430','94','KABUPATEN LANNY JAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9431','94','KABUPATEN MAMBERAMO TENGAH','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9432','94','KABUPATEN YALIMO','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9433','94','KABUPATEN PUNCAK','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9434','94','KABUPATEN DOGIYAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9435','94','KABUPATEN INTAN JAYA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9436','94','KABUPATEN DEIYAI','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN'),('9471','94','KOTA JAYAPURA','ACTIVE','2019-10-14 12:18:05','ADMIN','2019-10-14 12:18:05','ADMIN');

/*Table structure for table `m_satuan` */

DROP TABLE IF EXISTS `m_satuan`;

CREATE TABLE `m_satuan` (
  `satuan_id` int(11) NOT NULL AUTO_INCREMENT,
  `satuan_nama` varchar(255) DEFAULT NULL,
  `satuan_status_aktif` enum('ACTIVE','INACTIVE') DEFAULT NULL,
  `satuan_create_date` datetime DEFAULT NULL,
  `satuan_create_by` varchar(255) DEFAULT NULL,
  `satuan_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `satuan_update_by` varchar(255) DEFAULT NULL,
  `satuan_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`satuan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `m_satuan` */

insert  into `m_satuan`(`satuan_id`,`satuan_nama`,`satuan_status_aktif`,`satuan_create_date`,`satuan_create_by`,`satuan_update_date`,`satuan_update_by`,`satuan_revised`) values (1,'Meter','ACTIVE','2017-02-16 16:10:43','developer','2017-02-16 16:10:43',NULL,0),(2,'Kilogram','ACTIVE','2017-02-16 16:11:12','developer','2017-02-16 16:11:12',NULL,0),(3,'Pcs','ACTIVE','2019-10-17 20:36:05','Admin','2019-10-17 20:36:08','Admin',NULL);

/*Table structure for table `mitra_groups` */

DROP TABLE IF EXISTS `mitra_groups`;

CREATE TABLE `mitra_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `mitra_groups` */

insert  into `mitra_groups`(`id`,`name`,`description`) values (1,'manager','Manager'),(2,'penjualan','Penjualan'),(3,'pembelian','Pembelian'),(4,'gudang','Gudang'),(5,'keuangan','Keuangan');

/*Table structure for table `mitra_project` */

DROP TABLE IF EXISTS `mitra_project`;

CREATE TABLE `mitra_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_mitra_id` int(11) DEFAULT NULL,
  `project_kode` char(12) DEFAULT NULL,
  `project_nama` char(100) DEFAULT NULL,
  `project_detail` varchar(500) DEFAULT NULL,
  `project_nilai` decimal(18,2) DEFAULT NULL,
  `project_lampiran` varchar(400) DEFAULT NULL,
  `project_aktifasi` enum('AKTIVE','INACTIVE') DEFAULT NULL,
  `project_create_date` datetime DEFAULT NULL,
  `project_create_by` char(40) DEFAULT NULL,
  `project_update_date` datetime DEFAULT NULL,
  `project_update_by` char(40) DEFAULT NULL,
  `project_status` char(5) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `mitra_project` */

insert  into `mitra_project`(`project_id`,`project_mitra_id`,`project_kode`,`project_nama`,`project_detail`,`project_nilai`,`project_lampiran`,`project_aktifasi`,`project_create_date`,`project_create_by`,`project_update_date`,`project_update_by`,`project_status`) values (1,2,'PRJ_190001','Bottol kemasan 200ml','Kami menyediakan berbagai macam produk botol plastik, botol kaca, botol pipet, jar/toples plastik dengan kualitas yang baik dan harga yang kompetitif.',NULL,NULL,'AKTIVE','2019-10-01 16:12:30','edisite01@gmail.com',NULL,NULL,'3_1'),(2,2,'PRJ_190002','Bottol kemasan 200ml','Kami menyediakan berbagai macam produk botol plastik, botol kaca, botol pipet, jar/toples plastik dengan kualitas yang baik dan harga yang kompetitif.',NULL,NULL,'AKTIVE','2019-10-01 16:12:35','edisite01@gmail.com',NULL,NULL,'3_1'),(3,2,'PRJ_190003','Bottol kemasan 200ml','Kami menyediakan berbagai macam produk botol plastik, botol kaca, botol pipet, jar/toples plastik dengan kualitas yang baik dan harga yang kompetitif.',NULL,NULL,'AKTIVE','2019-10-01 16:13:02','edisite01@gmail.com',NULL,NULL,'3_1'),(4,2,'PRJ_190004','Bottol kemasan 400ml','Kami menyediakan berbagai macam produk botol plastik, botol kaca, botol pipet, jar/toples plastik dengan kualitas yang baik dan harga yang kompetitif.',NULL,NULL,'AKTIVE','2019-10-02 09:02:45','edisite01@gmail.com',NULL,NULL,'3_1'),(5,2,'PRJ_190005','Bottol kemasan 200ml','Kami menyediakan berbagai macam produk botol plastik, botol kaca, botol pipet, jar/toples plastik dengan kualitas yang baik dan harga yang kompetitif.',NULL,NULL,'AKTIVE','2019-10-03 10:26:43','edisite01@gmail.com',NULL,NULL,'2_1'),(6,NULL,'P_190001','Bottol kemasan 200ml tes','tes',NULL,NULL,NULL,'2019-10-09 17:32:23','webmaster',NULL,NULL,'0');

/*Table structure for table `mitra_project_log` */

DROP TABLE IF EXISTS `mitra_project_log`;

CREATE TABLE `mitra_project_log` (
  `mp_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_mitra_id` int(11) DEFAULT NULL,
  `mp_project_kode` char(20) DEFAULT NULL,
  `mp_datetime` datetime DEFAULT NULL,
  `mp_status` char(5) DEFAULT NULL,
  `mp_message` varchar(100) DEFAULT NULL,
  `mp_createby` varchar(50) DEFAULT NULL,
  `mp_desc` mediumtext,
  PRIMARY KEY (`mp_log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `mitra_project_log` */

insert  into `mitra_project_log`(`mp_log_id`,`mp_mitra_id`,`mp_project_kode`,`mp_datetime`,`mp_status`,`mp_message`,`mp_createby`,`mp_desc`) values (1,2,'PRJ_190005','2019-10-03 10:26:43','1_1','Mitra Open Project','edisite01@gmail.com','Mitra mulai project baru'),(2,2,'PRJ_190005','2019-10-03 15:31:32','1_2','Mitra Submit Project','edisite01@gmail.com',NULL),(3,2,'PRJ_190005','2019-10-03 16:32:13','2_1','Kilostok review project','Administrator',NULL),(4,2,NULL,'2019-10-03 13:36:36','1_2','Mitra Submit Project','edisite01@gmail.com',''),(5,2,'PRJ_190001','2019-10-03 13:37:03','1_2','Mitra Submit Project','edisite01@gmail.com',''),(6,2,'PRJ_190001','2019-10-03 13:37:11','1_2','Mitra Submit Project','edisite01@gmail.com',''),(7,2,'PRJ_190001','2019-10-03 13:37:31','1_2','Mitra Submit Project','edisite01@gmail.com',''),(8,2,'PRJ_190001','2019-10-03 13:37:36','1_2','Mitra Submit Project','edisite01@gmail.com',''),(9,2,'PRJ_190001','2019-10-03 13:38:27','1_2','Mitra Submit Project','edisite01@gmail.com',''),(10,2,'<?: echo $project_id','2019-10-03 13:45:52','1_2','Mitra Submit Project','edisite01@gmail.com',''),(11,2,'<?: echo $project_id','2019-10-03 13:46:04','1_2','Mitra Submit Project','edisite01@gmail.com',''),(12,2,'5,2','2019-10-03 13:49:07','1_2','Mitra Submit Project','edisite01@gmail.com',''),(13,2,'PRJ_190005','2019-10-03 14:05:14','1_2','Mitra Submit Project','edisite01@gmail.com',''),(14,2,'PRJ_190005','2019-10-03 14:05:44','1_2','Mitra Submit Project','edisite01@gmail.com',''),(15,2,'PRJ_190005','2019-10-03 14:11:16','1_2','Mitra Submit Project','edisite01@gmail.com',''),(16,2,'PRJ_190005','2019-10-03 14:11:40','1_2','Mitra Submit Project','edisite01@gmail.com',''),(17,2,'PRJ_190005','2019-10-04 05:11:09','1_2','Mitra Submit Project','edisite01@gmail.com',''),(18,2,'PRJ_190005','2019-10-04 17:26:12','1_2','Mitra Submit Project','edisite01@gmail.com',''),(19,2,'PRJ_190005','2019-10-05 10:13:28','1_2','Mitra Submit Project','edisite01@gmail.com',''),(20,NULL,'P_190001','2019-10-09 17:32:23','1_1','Mitra Open Project','webmaster','Mitra mulai membuat project baru');

/*Table structure for table `mitra_rab` */

DROP TABLE IF EXISTS `mitra_rab`;

CREATE TABLE `mitra_rab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mitra_project_kode` char(20) DEFAULT NULL,
  `rab_id` char(20) DEFAULT NULL,
  `rab_nama` char(50) DEFAULT NULL,
  `rab_induk` char(20) DEFAULT NULL,
  `rab_saldo_awal` decimal(18,0) NOT NULL,
  `rab_saldo_akhir` decimal(18,0) NOT NULL,
  `rab_create_by` varchar(50) DEFAULT NULL,
  `rab_create_date` datetime DEFAULT NULL,
  `rab_update_by` varchar(50) DEFAULT NULL,
  `rab_update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mitra_id` (`mitra_project_kode`,`rab_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `mitra_rab` */

insert  into `mitra_rab`(`id`,`mitra_project_kode`,`rab_id`,`rab_nama`,`rab_induk`,`rab_saldo_awal`,`rab_saldo_akhir`,`rab_create_by`,`rab_create_date`,`rab_update_by`,`rab_update_date`) values (1,'PRJ_190005','111','RAB','0','336700000','200000000',NULL,NULL,NULL,NULL),(2,'PRJ_190005','1111','Pembelian Produk','111','200000000','80000000',NULL,NULL,NULL,NULL),(3,'PRJ_190005','1112','Biaya Ekspedisi','111','30000000','1000000',NULL,NULL,NULL,NULL),(4,'PRJ_190005','1113','Biaya Pegawai','111','98700000','89900000',NULL,NULL,NULL,NULL),(5,'PRJ_190005','1114','Biaya Lain-lain','111','8000000','8000000',NULL,NULL,NULL,NULL),(25,'PRJ_190005','11111','1aaaaa','1112','44444','0','webmaster','2019-10-08 19:38:10',NULL,NULL),(26,'PRJ_190001','11111','1aaaaa','1111','44444','0','webmaster','2019-10-09 08:09:22',NULL,NULL);

/*Table structure for table `mitra_supplier` */

DROP TABLE IF EXISTS `mitra_supplier`;

CREATE TABLE `mitra_supplier` (
  `supp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mitra_id` int(11) NOT NULL,
  `supp_kode` char(12) NOT NULL,
  `supp_nama` char(100) NOT NULL,
  `supp_bidang` char(20) NOT NULL,
  `supp_alamat` mediumtext NOT NULL,
  `supp_kota` char(4) NOT NULL,
  `supp_provinsi` char(3) NOT NULL,
  `supp_telp` char(18) NOT NULL,
  `supp_email` char(100) NOT NULL,
  `supp_pic` char(50) NOT NULL,
  `supp_npwp_nama` char(50) NOT NULL,
  `supp_npwp_nomor` char(50) NOT NULL,
  `supp_create_date` datetime NOT NULL,
  `supp_create_by` char(20) NOT NULL,
  `supp_update_date` datetime DEFAULT NULL,
  `supp_update_by` char(20) DEFAULT NULL,
  PRIMARY KEY (`supp_id`),
  UNIQUE KEY `supp_kode` (`supp_kode`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `mitra_supplier` */

insert  into `mitra_supplier`(`supp_id`,`mitra_id`,`supp_kode`,`supp_nama`,`supp_bidang`,`supp_alamat`,`supp_kota`,`supp_provinsi`,`supp_telp`,`supp_email`,`supp_pic`,`supp_npwp_nama`,`supp_npwp_nomor`,`supp_create_date`,`supp_create_by`,`supp_update_date`,`supp_update_by`) values (1,2,'IRM','INDORAMA','1','<p>\n	Jl. Pangkalan 2</p>\n','3171','31','081311119999','indo@gmail.com','Eko','PT. Indorama','08908765811612313','2019-10-11 13:44:30','developer','2019-10-11 13:44:35','developer');

/*Table structure for table `t_gudang_out` */

DROP TABLE IF EXISTS `t_gudang_out`;

CREATE TABLE `t_gudang_out` (
  `gout_id` int(11) NOT NULL AUTO_INCREMENT,
  `gout_kode` varchar(15) DEFAULT NULL,
  `gout_tgl` date DEFAULT NULL,
  `pel_id` int(11) DEFAULT NULL,
  `jual_id` int(11) DEFAULT NULL,
  `project_id` char(20) DEFAULT NULL,
  `gout_kodereff` varchar(50) DEFAULT NULL,
  `gout_pembuat` varchar(30) DEFAULT NULL,
  `gout_pengirim` varchar(30) DEFAULT NULL,
  `gout_pemeriksa` varchar(30) DEFAULT NULL,
  `gout_lampiran` varchar(150) DEFAULT NULL,
  `gout_notes` varchar(500) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(30) NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(30) DEFAULT NULL,
  PRIMARY KEY (`gout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `t_gudang_out` */

insert  into `t_gudang_out`(`gout_id`,`gout_kode`,`gout_tgl`,`pel_id`,`jual_id`,`project_id`,`gout_kodereff`,`gout_pembuat`,`gout_pengirim`,`gout_pemeriksa`,`gout_lampiran`,`gout_notes`,`create_date`,`create_by`,`update_date`,`update_by`) values (1,'OT/SBK/19010001','2019-10-26',56,1,'PRJ_190005','','Admin','Admin','Admin',NULL,NULL,NULL,'Admin',NULL,NULL);

/*Table structure for table `t_gudang_out_det` */

DROP TABLE IF EXISTS `t_gudang_out_det`;

CREATE TABLE `t_gudang_out_det` (
  `goutdt_id` int(11) NOT NULL AUTO_INCREMENT,
  `gout_id` int(11) DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `gout_qty` int(11) DEFAULT NULL,
  `satuan_id` int(11) DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`goutdt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `t_gudang_out_det` */

insert  into `t_gudang_out_det`(`goutdt_id`,`gout_id`,`m_barang_id`,`gout_qty`,`satuan_id`,`create_by`,`create_date`,`update_by`,`update_date`) values (1,1,1769445,7,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` char(10) DEFAULT NULL,
  `order_nomor` varchar(255) DEFAULT NULL,
  `order_tanggal` datetime DEFAULT NULL,
  `order_referensi_id` int(11) DEFAULT NULL,
  `mitra_id` int(255) DEFAULT NULL,
  `order_type` char(1) DEFAULT '0' COMMENT '0 : purchase order, 1 : work order',
  `m_supplier_id` int(11) DEFAULT NULL,
  `order_nama_dikirim` varchar(255) DEFAULT NULL,
  `order_alamat_dikirim` varchar(255) DEFAULT NULL,
  `order_hp_fax` varchar(255) DEFAULT NULL,
  `order_subtotal` decimal(18,2) DEFAULT NULL,
  `order_diskon_persen` int(11) DEFAULT NULL,
  `order_diskon_nominal` decimal(18,2) DEFAULT NULL,
  `order_tax_nominal` decimal(18,2) DEFAULT NULL,
  `order_tax_persen` int(11) DEFAULT NULL,
  `order_other_cost` decimal(18,2) DEFAULT NULL,
  `order_ppn` int(11) DEFAULT NULL COMMENT 'diisi nominal presentase',
  `order_total` decimal(18,2) DEFAULT NULL,
  `order_tanggal_kirim` datetime DEFAULT NULL,
  `order_pembayaran` int(255) DEFAULT NULL,
  `order_status` int(255) DEFAULT NULL,
  `order_status_date` datetime DEFAULT NULL,
  `order_printed` int(255) DEFAULT NULL,
  `order_created_date` datetime NOT NULL,
  `order_created_by` varchar(255) NOT NULL,
  `order_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `order_update_by` varchar(0) DEFAULT NULL,
  `order_revised` int(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`order_id`,`project_id`,`order_nomor`,`order_tanggal`,`order_referensi_id`,`mitra_id`,`order_type`,`m_supplier_id`,`order_nama_dikirim`,`order_alamat_dikirim`,`order_hp_fax`,`order_subtotal`,`order_diskon_persen`,`order_diskon_nominal`,`order_tax_nominal`,`order_tax_persen`,`order_other_cost`,`order_ppn`,`order_total`,`order_tanggal_kirim`,`order_pembayaran`,`order_status`,`order_status_date`,`order_printed`,`order_created_date`,`order_created_by`,`order_update_date`,`order_update_by`,`order_revised`) values (18,'1','PO01901000001','2019-10-17 00:00:00',1,NULL,'0',1,'Sumarni',NULL,NULL,'90000000.00',5,'4500000.00','6300000.00',7,'0.00',NULL,'79200000.00',NULL,NULL,1,NULL,NULL,'2019-10-17 18:14:53','webmaster',NULL,NULL,NULL),(19,'1','PO01901000002','2019-10-17 00:00:00',1,NULL,'0',1,'Sumarni',NULL,NULL,'90000000.00',5,'4500000.00','6300000.00',7,'0.00',NULL,'79200000.00',NULL,NULL,1,NULL,NULL,'2019-10-17 18:17:07','webmaster',NULL,NULL,NULL),(20,'1','PO01901000003','2019-10-18 00:00:00',1,NULL,'0',1,'Herman',NULL,NULL,'90000.00',5,'4500.00','5400.00',6,'9.00',NULL,'71100.00',NULL,NULL,6,'2019-10-19 05:53:32',NULL,'2019-10-18 02:34:46','webmaster','2019-10-19 10:53:32',NULL,NULL),(21,'1','PO01901000004','2019-10-18 00:00:00',1,NULL,'0',1,'Sumarni',NULL,NULL,'3600000.00',35,'1260000.00','180000.00',5,'20.00',NULL,'2140000.00',NULL,NULL,6,'2019-10-19 06:06:22',NULL,'2019-10-18 15:44:07','webmaster','2019-10-19 11:06:22',NULL,NULL),(22,'1','PO01901000005','2019-10-19 00:00:00',9,NULL,'0',1,'Sumarni',NULL,NULL,'120000.00',0,'0.00','0.00',0,'0.00',NULL,'120000.00',NULL,NULL,7,'2019-10-19 11:22:39',NULL,'2019-10-19 08:29:58','webmaster','2019-10-19 16:22:39',NULL,NULL),(23,'1','PO01901000006','2019-10-19 00:00:00',9,NULL,'0',1,'Salesname',NULL,NULL,'90000.00',10,'9000.00','0.00',0,'0.00',NULL,'81000.00',NULL,NULL,1,NULL,NULL,'2019-10-19 08:59:49','webmaster',NULL,NULL,NULL),(24,'1','PO01901000007','2019-10-19 00:00:00',9,NULL,'0',1,'Salesname',NULL,NULL,'9000.00',0,'0.00','0.00',0,'0.00',NULL,'9000.00',NULL,NULL,1,NULL,NULL,'2019-10-19 09:00:56','webmaster',NULL,NULL,NULL),(25,'1','PO01901000008','2019-10-19 00:00:00',9,NULL,'0',1,'Salesname',NULL,NULL,'9000.00',0,'0.00','0.00',0,'0.00',NULL,'9000.00',NULL,NULL,1,NULL,NULL,'2019-10-19 09:01:21','webmaster',NULL,NULL,NULL),(15,NULL,'PO01910000001','2019-10-17 00:00:00',NULL,NULL,'0',1,'Rusdiana Indriani',NULL,NULL,'800000.00',5,'40000.00','56000.00',7,'0.00',NULL,'704000.00',NULL,NULL,1,NULL,NULL,'2019-10-17 16:43:14','webmaster',NULL,NULL,NULL),(16,NULL,'PO01910000002','2019-10-17 00:00:00',0,NULL,'0',1,'Rusdiana Indriani',NULL,NULL,'800000.00',5,'40000.00','56000.00',7,'0.00',NULL,'704000.00',NULL,NULL,1,NULL,NULL,'2019-10-17 16:43:36','webmaster',NULL,NULL,NULL),(17,NULL,'PO01910000003','2019-10-17 00:00:00',0,NULL,'0',1,'Rusdiana Indriani',NULL,NULL,'800000.00',5,'40000.00','56000.00',7,'0.00',NULL,'704000.00',NULL,NULL,1,NULL,NULL,'2019-10-17 16:47:30','webmaster',NULL,NULL,NULL),(26,'1','PO01901000009','2019-10-19 00:00:00',9,NULL,'0',1,'Salesname',NULL,NULL,'9000.00',0,'0.00','0.00',0,'10.00',NULL,'8990.00',NULL,NULL,1,NULL,NULL,'2019-10-19 09:02:12','webmaster',NULL,NULL,NULL),(27,'1','PO01901000010','2019-10-19 00:00:00',9,NULL,'0',1,'Salesname',NULL,NULL,'9000.00',0,'0.00','0.00',0,'10.00',NULL,'8990.00',NULL,NULL,7,'2019-10-19 11:53:08',NULL,'2019-10-19 09:03:34','webmaster','2019-10-19 16:53:08',NULL,NULL),(28,'1','PO01901000011','2019-10-19 00:00:00',9,NULL,'0',1,'Salesname',NULL,NULL,'100.00',0,'0.00','0.00',0,'0.00',NULL,'100.00',NULL,NULL,7,'2019-10-19 10:59:17',NULL,'2019-10-19 09:04:08','webmaster','2019-10-19 15:59:17',NULL,NULL),(29,'1','PO01901000012','2019-10-19 00:00:00',11,NULL,'0',1,'Salesname',NULL,NULL,'2000000.00',10,'200000.00','200000.00',10,'0.00',NULL,'1600000.00',NULL,NULL,6,'2019-10-19 12:24:19',NULL,'2019-10-19 12:12:35','webmaster','2019-10-19 17:24:19',NULL,NULL);

/*Table structure for table `t_orderdet` */

DROP TABLE IF EXISTS `t_orderdet`;

CREATE TABLE `t_orderdet` (
  `orderdet_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_order_id` int(11) DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `orderdet_qty` int(11) DEFAULT NULL,
  `orderdet_qty_realisasi` int(11) DEFAULT '0',
  `orderdet_status` int(11) DEFAULT '0' COMMENT '0 Belum Realisasi, 1 Realisasi',
  `orderdet_harga_satuan` int(255) DEFAULT NULL,
  `orderdet_total` int(255) DEFAULT NULL,
  `orderdet_created_date` datetime NOT NULL,
  `orderdet_created_by` varchar(255) NOT NULL,
  `orderdet_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `orderdet_update_by` varchar(0) DEFAULT NULL,
  `orderdet_revised` int(255) DEFAULT NULL,
  PRIMARY KEY (`orderdet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `t_orderdet` */

insert  into `t_orderdet`(`orderdet_id`,`t_order_id`,`m_barang_id`,`orderdet_qty`,`orderdet_qty_realisasi`,`orderdet_status`,`orderdet_harga_satuan`,`orderdet_total`,`orderdet_created_date`,`orderdet_created_by`,`orderdet_update_date`,`orderdet_update_by`,`orderdet_revised`) values (9,21,1769445,10,140,1,30,300000,'2019-10-18 15:44:07','webmaster','2019-10-19 06:06:22','',7),(8,20,1769447,10,330,0,5,50000,'2019-10-18 02:34:46','webmaster','2019-10-19 05:53:32','',9),(7,20,1769446,10,0,0,3,30000,'2019-10-18 02:34:46','webmaster','2019-10-18 02:34:46',NULL,0),(6,20,1769445,10,0,0,1,10000,'2019-10-18 02:34:46','webmaster','2019-10-18 02:34:46',NULL,0),(5,19,1769445,10,0,0,9,90000000,'2019-10-17 18:17:07','webmaster','2019-10-17 18:17:07',NULL,0),(10,21,1769446,10,60,0,30,300000,'2019-10-18 15:44:07','webmaster','2019-10-19 06:06:22','',3),(11,21,1769447,10,60,0,300,3000000,'2019-10-18 15:44:07','webmaster','2019-10-19 06:06:22','',3),(12,22,1769445,10,10,1,6,60000,'2019-10-19 08:29:58','webmaster','2019-10-19 11:22:39','',1),(13,22,1769445,10,10,1,90,0,'2019-10-19 08:29:59','webmaster','2019-10-19 11:22:39','',1),(14,23,1769445,10,0,0,9,90000,'2019-10-19 08:59:49','webmaster','2019-10-19 08:59:49',NULL,0),(15,24,1769445,10,0,0,900,9000,'2019-10-19 09:00:56','webmaster','2019-10-19 09:00:56',NULL,0),(16,25,1769445,10,0,0,900,9000,'2019-10-19 09:01:21','webmaster','2019-10-19 09:01:21',NULL,0),(17,26,1769445,10,0,0,900,9000,'2019-10-19 09:02:12','webmaster','2019-10-19 09:02:12',NULL,0),(18,27,1769445,10,20,1,900,9000,'2019-10-19 09:03:34','webmaster','2019-10-19 11:53:08','',2),(19,28,1769445,10,10,1,10,100,'2019-10-19 09:04:08','webmaster','2019-10-19 10:59:17','',1),(20,29,1769445,10,60,1,100,1000000,'2019-10-19 12:12:35','webmaster','2019-10-19 12:24:19','',2),(21,29,1769446,10,10,0,100,1000000,'2019-10-19 12:12:35','webmaster','2019-10-19 12:24:19','',2);

/*Table structure for table `t_orderlog` */

DROP TABLE IF EXISTS `t_orderlog`;

CREATE TABLE `t_orderlog` (
  `orderlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `referensi_id` int(11) DEFAULT NULL,
  `orderlog_status_dari` int(11) DEFAULT NULL,
  `orderlog_status_ke` int(11) DEFAULT NULL,
  `orderlog_status_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `orderlog_status_update_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderlog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_orderlog` */

insert  into `t_orderlog`(`orderlog_id`,`referensi_id`,`orderlog_status_dari`,`orderlog_status_ke`,`orderlog_status_update_date`,`orderlog_status_update_by`) values (1,1,1,2,'2017-02-27 09:56:04','developer'),(2,1,2,3,'2017-02-27 09:56:59','developer'),(3,8,3,3,'2017-03-01 10:17:15','developer'),(4,8,3,3,'2017-03-01 10:30:59','developer'),(5,1,3,3,'2017-03-02 16:09:56','developer'),(6,1,-1,3,'2017-03-11 16:10:46','developer'),(7,1,3,-1,'2017-03-11 16:11:27','developer'),(8,1,-1,6,'2017-03-11 16:28:09','developer'),(9,1,6,2,'2017-03-11 16:31:53','developer');

/*Table structure for table `t_penerimaan_barang` */

DROP TABLE IF EXISTS `t_penerimaan_barang`;

CREATE TABLE `t_penerimaan_barang` (
  `penerimaan_barang_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_mitra_id` int(11) DEFAULT NULL,
  `penerimaan_barang_nomor` varchar(255) DEFAULT NULL,
  `penerimaan_barang_tanggal` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `penerimaan_barang_jenis` int(1) DEFAULT '0' COMMENT '0 BPB, 1 BPBJ',
  `penerimaan_barang_sj` varchar(255) DEFAULT NULL,
  `t_order_id` int(11) DEFAULT NULL,
  `penerimaan_barang_tanggal_terima` varchar(255) DEFAULT NULL,
  `penerimaan_barang_subtotal` float DEFAULT '0',
  `penerimaan_barang_ppn` float DEFAULT '0',
  `penerimaan_barang_total` float DEFAULT '0',
  `penerimaan_barang_status` varchar(255) DEFAULT NULL,
  `penerimaan_barang_status_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `penerimaan_barang_pemeriksa` varchar(255) DEFAULT NULL,
  `penerimaan_barang_penyetuju` varchar(255) DEFAULT NULL,
  `m_gudang_id` int(11) DEFAULT NULL,
  `penerimaan_barang_catatan` varchar(255) DEFAULT NULL,
  `penerimaan_barang_printed` varchar(255) DEFAULT NULL,
  `penerimaan_barang_created_date` datetime NOT NULL,
  `penerimaan_barang_created_by` varchar(255) NOT NULL,
  `penerimaan_barang_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `penerimaan_barang_update_by` varchar(0) DEFAULT NULL,
  `penerimaan_barang_revised` int(255) DEFAULT NULL,
  `project_id` char(10) DEFAULT NULL,
  PRIMARY KEY (`penerimaan_barang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `t_penerimaan_barang` */

insert  into `t_penerimaan_barang`(`penerimaan_barang_id`,`m_mitra_id`,`penerimaan_barang_nomor`,`penerimaan_barang_tanggal`,`penerimaan_barang_jenis`,`penerimaan_barang_sj`,`t_order_id`,`penerimaan_barang_tanggal_terima`,`penerimaan_barang_subtotal`,`penerimaan_barang_ppn`,`penerimaan_barang_total`,`penerimaan_barang_status`,`penerimaan_barang_status_date`,`penerimaan_barang_pemeriksa`,`penerimaan_barang_penyetuju`,`m_gudang_id`,`penerimaan_barang_catatan`,`penerimaan_barang_printed`,`penerimaan_barang_created_date`,`penerimaan_barang_created_by`,`penerimaan_barang_update_date`,`penerimaan_barang_update_by`,`penerimaan_barang_revised`,`project_id`) values (1,1,'BPB20170200001','2017-02-27 10:18:14',0,NULL,1,'2017-02-27',40325000,0,40325000,'3','2017-02-27 10:18:14','7','9',2,'-',NULL,'2017-02-27 10:02:11','developer','2017-02-27 10:18:14','',7,NULL),(4,1,'BPBJ20170300001','2017-03-01 16:40:13',1,'SJ0312124',8,'2017-03-04',1398500,10,1538350,'3','2017-03-01 16:40:13','7','9',1,'-',NULL,'2017-03-01 16:34:00','developer','2017-03-01 16:40:14','',2,NULL),(5,NULL,'PB01901000001','2019-10-18 00:00:00',0,'',21,'2019-10-18',0,0,0,'1','2019-10-18 20:21:22','1',NULL,1,'tes',NULL,'2019-10-18 20:21:22','webmaster','2019-10-18 20:21:22',NULL,0,NULL),(6,NULL,'PB01901000001','2019-10-18 00:00:00',0,'',21,'2019-10-18',0,0,0,'1','2019-10-18 20:21:48','1',NULL,1,'tes',NULL,'2019-10-18 20:21:48','webmaster','2019-10-18 20:21:48',NULL,0,NULL),(7,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',21,'2019-10-19',0,0,0,'1','2019-10-19 05:23:42','1',NULL,1,'tes',NULL,'2019-10-19 05:23:42','webmaster','2019-10-19 05:23:42',NULL,0,NULL),(8,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',21,'2019-10-19',0,0,0,'1','2019-10-19 05:24:50','1',NULL,1,'tes',NULL,'2019-10-19 05:24:50','webmaster','2019-10-19 05:24:50',NULL,0,NULL),(9,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',21,'2019-10-19',0,0,0,'1','2019-10-19 05:26:01','1',NULL,1,'tes',NULL,'2019-10-19 05:26:01','webmaster','2019-10-19 05:26:01',NULL,0,NULL),(10,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',21,'2019-10-19',0,0,0,'1','2019-10-19 05:26:28','1',NULL,1,'tes',NULL,'2019-10-19 05:26:28','webmaster','2019-10-19 05:26:28',NULL,0,NULL),(11,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:26:53','1',NULL,1,'ete',NULL,'2019-10-19 05:26:53','webmaster','2019-10-19 05:26:53',NULL,0,NULL),(12,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:27:28','2',NULL,1,'tes',NULL,'2019-10-19 05:27:28','webmaster','2019-10-19 05:27:28',NULL,0,NULL),(13,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:29:33','2',NULL,1,'tes',NULL,'2019-10-19 05:29:33','webmaster','2019-10-19 05:29:33',NULL,0,NULL),(14,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:31:31','2',NULL,1,'tes',NULL,'2019-10-19 05:31:31','webmaster','2019-10-19 05:31:31',NULL,0,NULL),(15,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:32:32','2',NULL,1,'tes',NULL,'2019-10-19 05:32:32','webmaster','2019-10-19 05:32:32',NULL,0,NULL),(16,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:35:32','2',NULL,1,'tes',NULL,'2019-10-19 05:35:32','webmaster','2019-10-19 05:35:32',NULL,0,NULL),(17,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:36:16','2',NULL,1,'tes',NULL,'2019-10-19 05:36:16','webmaster','2019-10-19 05:36:16',NULL,0,NULL),(18,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',20,'2019-10-19',0,0,0,'1','2019-10-19 05:48:25','1',NULL,2,'tes',NULL,'2019-10-19 05:48:25','webmaster','2019-10-19 05:48:25',NULL,0,NULL),(19,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',20,'2019-10-19',0,0,0,'1','2019-10-19 05:53:32','1',NULL,1,'',NULL,'2019-10-19 05:53:32','webmaster','2019-10-19 05:53:32',NULL,0,NULL),(20,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',21,'2019-10-19',0,0,0,'1','2019-10-19 05:54:04','1',NULL,1,'tes',NULL,'2019-10-19 05:54:04','webmaster','2019-10-19 05:54:04',NULL,0,NULL),(21,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',21,'2019-10-19',0,0,0,'1','2019-10-19 06:04:55','1',NULL,1,'t',NULL,'2019-10-19 06:04:55','webmaster','2019-10-19 06:04:55',NULL,0,NULL),(22,NULL,'PB01901000001','2019-10-19 00:00:00',0,'SJ000001',21,'2019-10-19',0,0,0,'1','2019-10-19 06:05:38','1',NULL,1,'tes',NULL,'2019-10-19 06:05:38','webmaster','2019-10-19 06:05:38',NULL,0,NULL),(23,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',21,'2019-10-19',0,0,0,'1','2019-10-19 06:06:22','1',NULL,1,'tes',NULL,'2019-10-19 06:06:22','webmaster','2019-10-19 06:06:22',NULL,0,NULL),(24,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',28,'2019-10-19',0,0,0,'1','2019-10-19 10:59:17','1',NULL,1,'tes',NULL,'2019-10-19 10:59:17','webmaster','2019-10-19 10:59:17',NULL,0,NULL),(25,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',27,'2019-10-19',0,0,0,'1','2019-10-19 11:17:41','1',NULL,1,'tes',NULL,'2019-10-19 11:17:41','webmaster','2019-10-19 11:17:41',NULL,0,NULL),(26,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',22,'2019-10-19',0,0,0,'1','2019-10-19 11:22:39','1',NULL,1,'tes',NULL,'2019-10-19 11:22:39','webmaster','2019-10-19 11:22:39',NULL,0,NULL),(27,NULL,'PB01901000001','2019-10-19 00:00:00',0,'',29,'2019-10-19',0,0,0,'1','2019-10-19 12:23:39','1',NULL,1,'',NULL,'2019-10-19 12:23:39','webmaster','2019-10-19 12:23:39',NULL,0,NULL);

/*Table structure for table `t_penerimaan_barangdet` */

DROP TABLE IF EXISTS `t_penerimaan_barangdet`;

CREATE TABLE `t_penerimaan_barangdet` (
  `penerimaan_barangdet_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_penerimaan_barang_id` int(11) DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `penerimaan_barangdet_qty` int(11) DEFAULT NULL,
  `penerimaan_barangdet_qty_retur` int(11) DEFAULT '0',
  `penerimaan_barangdet_verifikasi` int(11) DEFAULT '0' COMMENT '0 Tidak, 1 Verifikasi',
  `penerimaan_barangdet_harga_satuan` int(255) DEFAULT NULL,
  `penerimaan_barangdet_potongan` int(255) DEFAULT NULL,
  `penerimaan_barangdet_total` int(255) DEFAULT NULL,
  `penerimaan_barangdet_keterangan` varchar(255) DEFAULT NULL,
  `penerimaan_barangdet_status` int(255) DEFAULT NULL,
  `penerimaan_barangdet_status_date` datetime DEFAULT NULL,
  `penerimaan_barangdet_created_date` datetime NOT NULL,
  `penerimaan_barangdet_created_by` varchar(255) NOT NULL,
  `penerimaan_barangdet_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `penerimaan_barangdet_update_by` varchar(0) DEFAULT NULL,
  `penerimaan_barangdet_revised` int(255) DEFAULT NULL,
  PRIMARY KEY (`penerimaan_barangdet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Data for the table `t_penerimaan_barangdet` */

insert  into `t_penerimaan_barangdet`(`penerimaan_barangdet_id`,`t_penerimaan_barang_id`,`m_barang_id`,`penerimaan_barangdet_qty`,`penerimaan_barangdet_qty_retur`,`penerimaan_barangdet_verifikasi`,`penerimaan_barangdet_harga_satuan`,`penerimaan_barangdet_potongan`,`penerimaan_barangdet_total`,`penerimaan_barangdet_keterangan`,`penerimaan_barangdet_status`,`penerimaan_barangdet_status_date`,`penerimaan_barangdet_created_date`,`penerimaan_barangdet_created_by`,`penerimaan_barangdet_update_date`,`penerimaan_barangdet_update_by`,`penerimaan_barangdet_revised`) values (1,1,1,150,150,1,130000,0,19500000,'-',1,'2017-02-27 10:02:11','2017-02-27 10:02:11','developer','2017-03-11 12:10:24','',5),(2,1,2,155,155,1,135000,100000,20825000,'-',1,'2017-02-27 10:02:11','2017-02-27 10:02:11','developer','2017-03-11 12:10:24','',5),(8,4,2,50,0,1,10000,1000,499000,'-',1,'2017-03-01 16:34:01','2017-03-01 16:34:01','developer','2017-03-01 16:40:14','',1),(7,4,1,100,0,1,9000,500,899500,'-',1,'2017-03-01 16:34:00','2017-03-01 16:34:00','developer','2017-03-01 16:40:14','',1),(9,5,1769445,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:29:29','webmaster',NULL,NULL,NULL),(10,5,1769446,80,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:29:29','webmaster',NULL,NULL,NULL),(11,6,1769445,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:32:57','webmaster',NULL,NULL,NULL),(12,6,1769446,80,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:32:57','webmaster',NULL,NULL,NULL),(13,7,1769445,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:42:32','webmaster',NULL,NULL,NULL),(14,7,1769446,80,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:42:32','webmaster',NULL,NULL,NULL),(15,8,1769445,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:43:50','webmaster',NULL,NULL,NULL),(16,8,1769446,80,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:43:50','webmaster',NULL,NULL,NULL),(17,9,1769445,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:44:05','webmaster',NULL,NULL,NULL),(18,9,1769446,80,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:44:05','webmaster',NULL,NULL,NULL),(19,10,1769445,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:44:25','webmaster',NULL,NULL,NULL),(20,10,1769446,80,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:44:25','webmaster',NULL,NULL,NULL),(21,11,1769445,60,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:45:12','webmaster',NULL,NULL,NULL),(22,11,1769446,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:45:12','webmaster',NULL,NULL,NULL),(23,12,1769445,60,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:47:21','webmaster',NULL,NULL,NULL),(24,12,1769446,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:47:21','webmaster',NULL,NULL,NULL),(25,15,1769445,60,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:52:32','webmaster',NULL,NULL,NULL),(26,15,1769446,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:52:32','webmaster',NULL,NULL,NULL),(27,16,1769445,60,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:56:05','webmaster',NULL,NULL,NULL),(28,16,1769446,70,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 09:56:05','webmaster',NULL,NULL,NULL),(29,17,1769445,90,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 10:08:01','webmaster',NULL,NULL,NULL),(30,17,1769446,90,0,0,NULL,NULL,NULL,NULL,NULL,NULL,'2019-10-14 10:08:01','webmaster',NULL,NULL,NULL),(31,6,1769445,6,0,0,NULL,NULL,NULL,NULL,1,'2019-10-18 20:21:48','2019-10-18 20:21:48','webmaster','2019-10-18 20:21:48',NULL,0),(32,7,1769445,30,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:23:42','2019-10-19 05:23:42','webmaster','2019-10-19 05:23:42',NULL,0),(33,8,1769445,30,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:24:50','2019-10-19 05:24:50','webmaster','2019-10-19 05:24:50',NULL,0),(34,9,1769445,30,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:26:01','2019-10-19 05:26:01','webmaster','2019-10-19 05:26:01',NULL,0),(35,10,1769445,30,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:26:28','2019-10-19 05:26:28','webmaster','2019-10-19 05:26:28',NULL,0),(36,11,1769447,50,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:26:53','2019-10-19 05:26:53','webmaster','2019-10-19 05:26:53',NULL,0),(37,12,1769447,60,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:27:28','2019-10-19 05:27:28','webmaster','2019-10-19 05:27:28',NULL,0),(38,13,1769447,60,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:29:33','2019-10-19 05:29:33','webmaster','2019-10-19 05:29:33',NULL,0),(39,14,1769447,60,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:31:31','2019-10-19 05:31:31','webmaster','2019-10-19 05:31:31',NULL,0),(40,15,1769447,60,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:32:32','2019-10-19 05:32:32','webmaster','2019-10-19 05:32:32',NULL,0),(41,16,1769447,60,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:35:32','2019-10-19 05:35:32','webmaster','2019-10-19 05:35:32',NULL,0),(42,17,1769447,60,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:36:16','2019-10-19 05:36:16','webmaster','2019-10-19 05:36:16',NULL,0),(43,18,1769447,30,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:48:25','2019-10-19 05:48:25','webmaster','2019-10-19 05:48:25',NULL,0),(44,19,1769447,0,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:53:32','2019-10-19 05:53:32','webmaster','2019-10-19 05:53:32',NULL,0),(45,20,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 05:54:04','2019-10-19 05:54:04','webmaster','2019-10-19 05:54:04',NULL,0),(46,21,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:04:55','2019-10-19 06:04:55','webmaster','2019-10-19 06:04:55',NULL,0),(47,21,1769446,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:04:55','2019-10-19 06:04:55','webmaster','2019-10-19 06:04:55',NULL,0),(48,21,1769447,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:04:55','2019-10-19 06:04:55','webmaster','2019-10-19 06:04:55',NULL,0),(49,22,1769445,50,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:05:38','2019-10-19 06:05:38','webmaster','2019-10-19 06:05:38',NULL,0),(50,22,1769446,50,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:05:38','2019-10-19 06:05:38','webmaster','2019-10-19 06:05:38',NULL,0),(51,22,1769447,50,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:05:38','2019-10-19 06:05:38','webmaster','2019-10-19 06:05:38',NULL,0),(52,23,1769445,70,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:06:22','2019-10-19 06:06:22','webmaster','2019-10-19 06:06:22',NULL,0),(53,23,1769446,0,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:06:22','2019-10-19 06:06:22','webmaster','2019-10-19 06:06:22',NULL,0),(54,23,1769447,0,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 06:06:22','2019-10-19 06:06:22','webmaster','2019-10-19 06:06:22',NULL,0),(55,24,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 10:59:17','2019-10-19 10:59:17','webmaster','2019-10-19 10:59:17',NULL,0),(56,25,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 11:17:41','2019-10-19 11:17:41','webmaster','2019-10-19 11:17:41',NULL,0),(57,26,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 11:22:39','2019-10-19 11:22:39','webmaster','2019-10-19 11:22:39',NULL,0),(58,26,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 11:22:39','2019-10-19 11:22:39','webmaster','2019-10-19 11:22:39',NULL,0),(59,25,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 11:51:31','2019-10-19 11:51:31','webmaster','2019-10-19 11:51:31',NULL,0),(60,25,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 11:53:08','2019-10-19 11:53:08','webmaster','2019-10-19 11:53:08',NULL,0),(61,27,1769445,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 12:23:39','2019-10-19 12:23:39','webmaster','2019-10-19 12:23:39',NULL,0),(62,27,1769446,10,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 12:23:39','2019-10-19 12:23:39','webmaster','2019-10-19 12:23:39',NULL,0),(63,27,1769445,50,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 12:24:19','2019-10-19 12:24:19','webmaster','2019-10-19 12:24:19',NULL,0),(64,27,1769446,0,0,0,NULL,NULL,NULL,NULL,1,'2019-10-19 12:24:19','2019-10-19 12:24:19','webmaster','2019-10-19 12:24:19',NULL,0);

/*Table structure for table `t_penerimaan_baranglog` */

DROP TABLE IF EXISTS `t_penerimaan_baranglog`;

CREATE TABLE `t_penerimaan_baranglog` (
  `penerimaan_baranglog_id` int(11) NOT NULL AUTO_INCREMENT,
  `referensi_id` int(11) DEFAULT NULL,
  `penerimaan_baranglog_status_dari` int(11) DEFAULT NULL,
  `penerimaan_baranglog_status_ke` int(11) DEFAULT NULL,
  `penerimaan_baranglog_status_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `penerimaan_baranglog_status_update_by` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`penerimaan_baranglog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_penerimaan_baranglog` */

insert  into `t_penerimaan_baranglog`(`penerimaan_baranglog_id`,`referensi_id`,`penerimaan_baranglog_status_dari`,`penerimaan_baranglog_status_ke`,`penerimaan_baranglog_status_update_date`,`penerimaan_baranglog_status_update_by`) values (1,1,1,2,'2017-02-27 10:05:20','developer'),(2,3,1,2,'2017-03-01 15:52:42','developer'),(3,4,1,2,'2017-03-01 16:39:44','developer');

/*Table structure for table `t_penjualan` */

DROP TABLE IF EXISTS `t_penjualan`;

CREATE TABLE `t_penjualan` (
  `jual_id` int(11) NOT NULL AUTO_INCREMENT,
  `mitra_id` int(11) DEFAULT NULL,
  `project_id` char(30) DEFAULT NULL,
  `pel_id` int(11) DEFAULT NULL,
  `jual_kode` varchar(25) DEFAULT NULL,
  `jual_kodereff` varchar(50) DEFAULT NULL,
  `jual_tgl` date DEFAULT NULL,
  `jual_detail` varchar(500) DEFAULT NULL,
  `jual_pembayaran` varchar(100) DEFAULT NULL,
  `jual_pengiriman` varchar(100) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `jual_dibuat` varchar(20) DEFAULT NULL,
  `jual_notes` varchar(1000) DEFAULT NULL,
  `jual_subtotal` decimal(18,2) DEFAULT NULL,
  `jual_diskon` decimal(18,2) DEFAULT NULL,
  `jual_pajak` decimal(18,2) DEFAULT NULL,
  `jual_biaya` decimal(18,2) DEFAULT NULL,
  `jual_total` decimal(18,2) DEFAULT NULL,
  `jual_dibayar` decimal(18,2) DEFAULT NULL,
  `jual_sisabayar` decimal(18,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  PRIMARY KEY (`jual_id`),
  UNIQUE KEY `jual_id` (`jual_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `t_penjualan` */

insert  into `t_penjualan`(`jual_id`,`mitra_id`,`project_id`,`pel_id`,`jual_kode`,`jual_kodereff`,`jual_tgl`,`jual_detail`,`jual_pembayaran`,`jual_pengiriman`,`status_id`,`jual_dibuat`,`jual_notes`,`jual_subtotal`,`jual_diskon`,`jual_pajak`,`jual_biaya`,`jual_total`,`jual_dibayar`,`jual_sisabayar`,`create_date`,`create_by`,`update_date`,`update_by`) values (1,0,'PRJ_190005',56,'SO/000/01901000001','0','2019-10-26','',NULL,'0',2,'webmaster','0','630000.00','0.00','0.00','0.00','630000.00','0.00','630000.00','2019-10-26 06:46:14','webmaster',NULL,NULL),(2,0,'PRJ_190005',57,'SO/000/01901000001','0','2019-10-26','',NULL,'0',2,'webmaster','0','2000.00','0.00','0.00','0.00','2000.00','0.00','2000.00','2019-10-26 07:45:11','webmaster',NULL,NULL),(3,0,'PRJ_190005',58,'SO/000/01901000001','0000','2019-10-26','',NULL,'aaaaa',2,'webmaster','tes','1000000.00','100000.00','90000.00','10.00','1000000.00','20.00','980000.00','2019-10-26 11:30:46','webmaster',NULL,NULL);

/*Table structure for table `t_penjualan_det` */

DROP TABLE IF EXISTS `t_penjualan_det`;

CREATE TABLE `t_penjualan_det` (
  `jualdt_id` int(11) NOT NULL AUTO_INCREMENT,
  `jual_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `jual_harga` decimal(18,2) DEFAULT NULL,
  `jual_qty` decimal(18,0) DEFAULT NULL,
  `jual_jumlah` decimal(18,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  PRIMARY KEY (`jualdt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `t_penjualan_det` */

insert  into `t_penjualan_det`(`jualdt_id`,`jual_id`,`prod_id`,`jual_harga`,`jual_qty`,`jual_jumlah`,`create_date`,`create_by`,`update_date`,`update_by`) values (1,1,1769445,'90.00','7','630000.00','2019-10-26 06:46:14','webmaster',NULL,NULL),(2,2,1769445,'500.00','4','2000.00','2019-10-26 07:45:11','webmaster',NULL,NULL),(3,3,1769448,'100.00','10','1000000.00','2019-10-26 11:30:46','webmaster',NULL,NULL);

/*Table structure for table `t_penjualan_status` */

DROP TABLE IF EXISTS `t_penjualan_status`;

CREATE TABLE `t_penjualan_status` (
  `statusjual_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` char(15) DEFAULT NULL,
  `status_desciptions` varchar(100) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  PRIMARY KEY (`statusjual_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `t_penjualan_status` */

insert  into `t_penjualan_status`(`statusjual_id`,`status_name`,`status_desciptions`,`create_date`,`create_by`,`update_date`,`update_by`) values (1,'PENDING','PENDING','2019-10-26 07:39:43','developer','2019-10-26 07:39:43','developer'),(2,'PROCESS','PROCESS','2019-10-26 07:39:44','developer','2019-10-26 07:39:44','developer'),(3,'COMPLEATE','COMPLEATE','2019-10-26 07:39:45','developer','2019-10-26 07:39:45','developer'),(4,'FINISH','FINISH','2019-10-26 07:39:47','developer','2019-10-26 07:39:47','developer');

/*Table structure for table `t_permintaan_pembelian` */

DROP TABLE IF EXISTS `t_permintaan_pembelian`;

CREATE TABLE `t_permintaan_pembelian` (
  `permintaan_pembelian_id` int(11) NOT NULL AUTO_INCREMENT,
  `permintaan_pembelian_nomor` varchar(255) NOT NULL,
  `t_permintaan_jasa` int(11) DEFAULT NULL,
  `permintaan_pembelian_tanggal` datetime NOT NULL,
  `permintaan_pembelian_tanggal_dibutuhkan` datetime NOT NULL,
  `permintaan_pembelian_type` int(11) DEFAULT NULL COMMENT '0 SPP Barang, 1 SPP Jasa',
  `permintaan_pembelian_jenis` int(255) NOT NULL,
  `m_gudang_id_permintaan` int(11) DEFAULT NULL,
  `permintaan_pembelian_status` int(255) NOT NULL,
  `permintaan_pembelian_status_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `permintaan_pembelian_penerima` varchar(255) DEFAULT NULL,
  `permintaan_pembelian_penyetuju` varchar(255) DEFAULT NULL,
  `permintaan_pembelian_pembuat` varchar(255) DEFAULT NULL,
  `permintaan_pembelian_printed` int(255) DEFAULT NULL,
  `permintaan_pembelian_alasan` mediumtext,
  `permintaan_pembelian_catatan` mediumtext,
  `permintaan_pembelian_created_date` datetime NOT NULL,
  `permintaan_pembelian_created_by` varchar(255) NOT NULL,
  `permintaan_pembelian_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `permintaan_pembelian_update_by` varchar(0) DEFAULT NULL,
  `permintaan_pembelian_revised` int(255) DEFAULT NULL,
  PRIMARY KEY (`permintaan_pembelian_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `t_permintaan_pembelian` */

insert  into `t_permintaan_pembelian`(`permintaan_pembelian_id`,`permintaan_pembelian_nomor`,`t_permintaan_jasa`,`permintaan_pembelian_tanggal`,`permintaan_pembelian_tanggal_dibutuhkan`,`permintaan_pembelian_type`,`permintaan_pembelian_jenis`,`m_gudang_id_permintaan`,`permintaan_pembelian_status`,`permintaan_pembelian_status_date`,`permintaan_pembelian_penerima`,`permintaan_pembelian_penyetuju`,`permintaan_pembelian_pembuat`,`permintaan_pembelian_printed`,`permintaan_pembelian_alasan`,`permintaan_pembelian_catatan`,`permintaan_pembelian_created_date`,`permintaan_pembelian_created_by`,`permintaan_pembelian_update_date`,`permintaan_pembelian_update_by`,`permintaan_pembelian_revised`) values (1,'SPP2019101437410',NULL,'2019-10-14 00:00:00','2019-10-14 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'Barang yang bagus ya',NULL,'2019-10-14 13:02:37','webmaster',NULL,NULL,NULL),(2,'SPP2019101451649',NULL,'2019-10-14 00:00:00','2019-10-14 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'',NULL,'2019-10-14 13:45:18','webmaster',NULL,NULL,NULL),(3,'SPP2019101539705',NULL,'2019-10-15 00:00:00','2019-10-15 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'',NULL,'2019-10-15 09:40:15','webmaster',NULL,NULL,NULL),(4,'SPP2019101789152',NULL,'2019-10-17 00:00:00','2019-10-17 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'tess',NULL,'2019-10-17 15:15:33','webmaster',NULL,NULL,NULL),(5,'SPP01901000001',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,'tes',NULL,'2019-10-19 06:41:40','webmaster',NULL,NULL,NULL),(6,'SPP01901000001',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'tes',NULL,'2019-10-19 06:43:05','webmaster',NULL,NULL,NULL),(7,'SPP01901000001',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'',NULL,'2019-10-19 06:44:10','webmaster',NULL,NULL,NULL),(8,'SPP01901000001',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'tes',NULL,'2019-10-19 06:46:29','webmaster',NULL,NULL,NULL),(9,'SPP01901000002',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'',NULL,'2019-10-19 06:59:13','webmaster',NULL,NULL,NULL),(10,'SPP01901000003',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'tesss',NULL,'2019-10-19 10:41:50','webmaster',NULL,NULL,NULL),(11,'SPP01901000004',NULL,'2019-10-19 00:00:00','2019-10-19 00:00:00',NULL,0,NULL,1,NULL,NULL,NULL,NULL,NULL,'tess',NULL,'2019-10-19 12:03:15','webmaster',NULL,NULL,NULL);

/*Table structure for table `t_permintaan_pembeliandet` */

DROP TABLE IF EXISTS `t_permintaan_pembeliandet`;

CREATE TABLE `t_permintaan_pembeliandet` (
  `permintaan_pembeliandet_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_permintaan_pembelian_id` int(11) DEFAULT NULL,
  `project_kode` char(10) DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `permintaan_pembeliandet_qty` int(11) DEFAULT NULL,
  `permintaan_pembeliandet_qty_realisasi` int(11) DEFAULT NULL,
  `permintaan_pembeliandet_status` int(1) DEFAULT '0' COMMENT '0 Belum Ditawarkan, 1 Ditawarkan, 2 Selesai',
  `permintaan_pembeliandet_create_date` datetime DEFAULT NULL,
  `permintaan_pembeliandet_create_by` varchar(255) DEFAULT NULL,
  `permintaan_pembeliandet_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `permintaan_pembeliandet_update_by` varchar(255) DEFAULT NULL,
  `permintaan_pembeliandet_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`permintaan_pembeliandet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_permintaan_pembeliandet` */

insert  into `t_permintaan_pembeliandet`(`permintaan_pembeliandet_id`,`t_permintaan_pembelian_id`,`project_kode`,`m_barang_id`,`permintaan_pembeliandet_qty`,`permintaan_pembeliandet_qty_realisasi`,`permintaan_pembeliandet_status`,`permintaan_pembeliandet_create_date`,`permintaan_pembeliandet_create_by`,`permintaan_pembeliandet_update_date`,`permintaan_pembeliandet_update_by`,`permintaan_pembeliandet_revised`) values (1,1,'PRJ_190005',1769445,10,NULL,0,'2019-10-14 13:02:37','webmaster',NULL,NULL,NULL),(2,1,'PRJ_190005',1769446,20,NULL,0,'2019-10-14 13:02:37','webmaster',NULL,NULL,NULL),(3,1,'PRJ_190005',1769447,30,NULL,0,'2019-10-14 13:02:37','webmaster',NULL,NULL,NULL),(4,2,'PRJ_190005',1769459,20,NULL,0,'2019-10-14 13:45:18','webmaster',NULL,NULL,NULL),(5,2,'PRJ_190005',1769460,4,NULL,0,'2019-10-14 13:45:18','webmaster',NULL,NULL,NULL),(6,3,'PRJ_190005',1769445,580,NULL,0,'2019-10-15 09:40:15','webmaster',NULL,NULL,NULL),(7,4,'PRJ_190005',1769445,100,NULL,0,'2019-10-17 15:15:33','webmaster',NULL,NULL,NULL),(8,4,'PRJ_190005',1769447,200,NULL,0,'2019-10-17 15:15:33','webmaster',NULL,NULL,NULL),(9,5,'PRJ_190005',1769445,90,NULL,0,'2019-10-19 06:41:40','webmaster',NULL,NULL,NULL),(10,5,'PRJ_190005',1769446,10,NULL,0,'2019-10-19 06:41:40','webmaster',NULL,NULL,NULL),(11,6,'PRJ_190005',1769448,80,NULL,0,'2019-10-19 06:43:05','webmaster',NULL,NULL,NULL),(12,7,'PRJ_190005',1769447,60,NULL,0,'2019-10-19 06:44:10','webmaster',NULL,NULL,NULL),(13,8,'PRJ_190005',1769448,10,NULL,0,'2019-10-19 06:46:29','webmaster',NULL,NULL,NULL),(14,9,'PRJ_190005',1769445,0,10,3,'2019-10-19 06:59:13','webmaster','2019-10-19 09:04:08','webmaster',NULL),(15,10,'PRJ_190005',1769458,80,NULL,0,'2019-10-19 10:41:50','webmaster',NULL,NULL,NULL),(16,11,'PRJ_190005',1769445,10,10,3,'2019-10-19 12:03:15','webmaster','2019-10-19 12:12:35','webmaster',NULL),(17,11,'PRJ_190005',1769446,20,NULL,0,'2019-10-19 12:03:15','webmaster',NULL,NULL,NULL);

/*Table structure for table `t_permintaan_pembelianlog` */

DROP TABLE IF EXISTS `t_permintaan_pembelianlog`;

CREATE TABLE `t_permintaan_pembelianlog` (
  `permintaan_pembelianlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `referensi_id` int(11) DEFAULT NULL,
  `permintaan_pembelianlog_status_dari` int(11) DEFAULT NULL,
  `permintaan_pembelianlog_status_ke` int(11) DEFAULT NULL,
  `permintaan_pembelianlog_status_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `permintaan_pembelianlog_status_update_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`permintaan_pembelianlog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_permintaan_pembelianlog` */

/*Table structure for table `t_stok_gudang` */

DROP TABLE IF EXISTS `t_stok_gudang`;

CREATE TABLE `t_stok_gudang` (
  `stok_gudang_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_gudang_id` int(11) DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `stok_gudang_jumlah` int(11) DEFAULT NULL,
  `stok_gudang_created_date` varchar(255) DEFAULT NULL,
  `stok_gudang_created_by` varchar(255) DEFAULT NULL,
  `stok_gudang_update_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `stok_gudang_update_by` varchar(255) DEFAULT NULL,
  `stok_gudang_revised` int(11) DEFAULT NULL,
  PRIMARY KEY (`stok_gudang_id`),
  KEY `stok_gudang` (`m_gudang_id`),
  KEY `stok_barang` (`m_barang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `t_stok_gudang` */

insert  into `t_stok_gudang`(`stok_gudang_id`,`m_gudang_id`,`m_barang_id`,`stok_gudang_jumlah`,`stok_gudang_created_date`,`stok_gudang_created_by`,`stok_gudang_update_date`,`stok_gudang_update_by`,`stok_gudang_revised`) values (1,1,1769445,76,'2019-10-19 11:51:31','webmaster','2019-10-26 07:45:11',NULL,4),(2,1,1769446,10,'2019-10-19 12:23:39','webmaster',NULL,NULL,0),(3,1,1769446,0,'2019-10-19 12:24:19','webmaster',NULL,NULL,0);

/*Table structure for table `t_transaksi_detail` */

DROP TABLE IF EXISTS `t_transaksi_detail`;

CREATE TABLE `t_transaksi_detail` (
  `TRANS_ID` bigint(11) NOT NULL DEFAULT '0',
  `MASTER_ID` bigint(11) DEFAULT NULL,
  `KODE_PERK` char(20) DEFAULT NULL,
  `DEBET` decimal(18,2) DEFAULT NULL,
  `KREDIT` decimal(18,2) DEFAULT NULL,
  `KETERANGAN` char(110) DEFAULT NULL,
  PRIMARY KEY (`TRANS_ID`),
  KEY `MASTER_ID` (`MASTER_ID`,`KODE_PERK`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_transaksi_detail` */

insert  into `t_transaksi_detail`(`TRANS_ID`,`MASTER_ID`,`KODE_PERK`,`DEBET`,`KREDIT`,`KETERANGAN`) values (2191000085,1191000084,'10.00.00','20.00','0.00',NULL),(2191000086,1191000084,'35.01.00','0.00','20.00',NULL),(2191000088,1191000087,'10.00.00','20.00','0.00',NULL),(2191000089,1191000087,'35.01.00','0.00','20.00',NULL),(2191000091,1191000090,'10.00.00','20.00','0.00',NULL),(2191000092,1191000090,'35.01.00','0.00','20.00',NULL),(2191000095,1191000094,'34.09.00','0.00','40000.00',NULL),(2191000096,1191000094,'11.00.00','40000.00','0.00',NULL);

/*Table structure for table `t_transaksi_jurnal_detail` */

DROP TABLE IF EXISTS `t_transaksi_jurnal_detail`;

CREATE TABLE `t_transaksi_jurnal_detail` (
  `TRANS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MASTER_ID` int(11) DEFAULT NULL,
  `KODE_PERK` char(20) DEFAULT NULL,
  `DEBET` decimal(20,2) DEFAULT NULL,
  `KREDIT` decimal(20,2) DEFAULT NULL,
  `KETERANGAN` char(110) DEFAULT NULL,
  PRIMARY KEY (`TRANS_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_transaksi_jurnal_detail` */

/*Table structure for table `t_transaksi_jurnal_master` */

DROP TABLE IF EXISTS `t_transaksi_jurnal_master`;

CREATE TABLE `t_transaksi_jurnal_master` (
  `TRANS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MITRAID` char(10) DEFAULT NULL,
  `PROJECTKODE` char(10) DEFAULT NULL,
  `acc_type_id` int(11) DEFAULT NULL,
  `KODE_JURNAL` char(3) DEFAULT NULL,
  `NO_BUKTI` char(20) DEFAULT NULL,
  `TGL_TRANS` date DEFAULT NULL,
  `URAIAN` char(110) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `CABANG_ID` int(11) DEFAULT NULL,
  `DTM_INSERT` datetime DEFAULT NULL,
  `STS` char(20) DEFAULT NULL,
  `RES` mediumtext,
  PRIMARY KEY (`TRANS_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_transaksi_jurnal_master` */

/*Table structure for table `t_transaksi_master` */

DROP TABLE IF EXISTS `t_transaksi_master`;

CREATE TABLE `t_transaksi_master` (
  `TRANS_ID` int(11) NOT NULL,
  `MITRAID` char(10) NOT NULL,
  `PROJECTKODE` char(10) NOT NULL,
  `KODE_JURNAL` char(3) DEFAULT NULL,
  `NO_BUKTI` char(20) DEFAULT NULL,
  `TGL_TRANS` date DEFAULT NULL,
  `URAIAN` char(110) DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `CABANG_ID` int(11) DEFAULT NULL,
  `DTM_INSERT` datetime DEFAULT NULL,
  `DTM_POSTING` datetime DEFAULT NULL,
  `USER_POSTING` int(11) DEFAULT NULL,
  `acc_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`TRANS_ID`),
  KEY `TGL_TRANS` (`TGL_TRANS`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_transaksi_master` */

insert  into `t_transaksi_master`(`TRANS_ID`,`MITRAID`,`PROJECTKODE`,`KODE_JURNAL`,`NO_BUKTI`,`TGL_TRANS`,`URAIAN`,`USERID`,`CABANG_ID`,`DTM_INSERT`,`DTM_POSTING`,`USER_POSTING`,`acc_type_id`) values (1191000084,'','PRJ_190005',NULL,'BKT0002','2019-10-29','Promo indosat',1,NULL,'2019-10-29 18:31:30','2019-10-30 13:09:14',1,1),(1191000087,'','PRJ_190005',NULL,'BKT0002','2019-10-29','Promo indosat',1,NULL,'2019-10-29 18:31:30','2019-10-30 13:20:40',1,1),(1191000090,'','PRJ_190005',NULL,'BKT0002','2019-10-29','Promo indosat',1,NULL,'2019-10-29 18:31:30','2019-10-30 13:26:03',1,1),(1191000094,'','PRJ_190005',NULL,'B0000001','2019-10-30','Uraian Tes',1,NULL,'2019-10-30 14:02:25','2019-10-30 16:25:46',1,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`ip_address`,`username`,`password`,`salt`,`email`,`activation_code`,`forgotten_password_code`,`forgotten_password_time`,`remember_code`,`created_on`,`last_login`,`active`,`first_name`,`last_name`) values (1,'127.0.0.1','webmaster','$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES',NULL,NULL,NULL,NULL,NULL,NULL,1451900190,1568122297,1,'Edi ','Supriyanto'),(2,'127.0.0.1','admin','$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW',NULL,NULL,NULL,NULL,NULL,NULL,1451900228,1465489580,1,'Admin',''),(3,'127.0.0.1','manager','$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa',NULL,NULL,NULL,NULL,NULL,NULL,1451900430,1465489585,1,'Manager',''),(4,'127.0.0.1','staff','$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6',NULL,NULL,NULL,NULL,NULL,NULL,1451900439,1465489590,1,'Staff','');

/* Function  structure for function  `get_next_id` */

/*!50003 DROP FUNCTION IF EXISTS `get_next_id` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_id`() RETURNS int(11)
BEGIN
		DECLARE i INT;
	   DELETE FROM m_id_generator;
	   INSERT INTO m_id_generator (NEXT_ID) VALUES (NULL);
	   SELECT next_id INTO i FROM m_id_generator;
	   RETURN i;
    END */$$
DELIMITER ;

/*Table structure for table `v_bukubesar` */

DROP TABLE IF EXISTS `v_bukubesar`;

/*!50001 DROP VIEW IF EXISTS `v_bukubesar` */;
/*!50001 DROP TABLE IF EXISTS `v_bukubesar` */;

/*!50001 CREATE TABLE `v_bukubesar` (
  `JURNALID` int(11) NOT NULL,
  `PROJECTKODE` char(10) CHARACTER SET utf8 NOT NULL,
  `KODE_JURNAL` char(3) CHARACTER SET utf8 DEFAULT NULL,
  `NO_BUKTI` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `TGL_JURNAL` date DEFAULT NULL,
  `URAIAN` char(110) CHARACTER SET utf8 DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `CABANG_ID` int(11) DEFAULT NULL,
  `DTM_INSERT` datetime DEFAULT NULL,
  `MASTERID` bigint(11) DEFAULT NULL,
  `KODE_COA` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `DEBET` decimal(18,2) DEFAULT NULL,
  `KREDIT` decimal(18,2) DEFAULT NULL,
  `NAMA_COA` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_gudang_out` */

DROP TABLE IF EXISTS `v_gudang_out`;

/*!50001 DROP VIEW IF EXISTS `v_gudang_out` */;
/*!50001 DROP TABLE IF EXISTS `v_gudang_out` */;

/*!50001 CREATE TABLE `v_gudang_out` (
  `gout_kode` varchar(15) DEFAULT NULL,
  `gout_kodereff` varchar(50) DEFAULT NULL,
  `gout_tgl` date DEFAULT NULL,
  `jual_id` int(11) NOT NULL,
  `mitra_id` int(11) DEFAULT NULL,
  `project_id` char(30) DEFAULT NULL,
  `pel_id` int(11) DEFAULT NULL,
  `jual_kode` varchar(25) DEFAULT NULL,
  `jual_kodereff` varchar(50) DEFAULT NULL,
  `jual_tgl` date DEFAULT NULL,
  `jual_detail` varchar(500) DEFAULT NULL,
  `jual_pembayaran` varchar(100) DEFAULT NULL,
  `jual_pengiriman` varchar(100) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `jual_dibuat` varchar(20) DEFAULT NULL,
  `jual_notes` varchar(1000) DEFAULT NULL,
  `jual_subtotal` decimal(18,2) DEFAULT NULL,
  `jual_diskon` decimal(18,2) DEFAULT NULL,
  `jual_pajak` decimal(18,2) DEFAULT NULL,
  `jual_biaya` decimal(18,2) DEFAULT NULL,
  `jual_total` decimal(18,2) DEFAULT NULL,
  `jual_dibayar` decimal(18,2) DEFAULT NULL,
  `jual_sisabayar` decimal(18,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  `status_name` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_jurnal_posting` */

DROP TABLE IF EXISTS `v_jurnal_posting`;

/*!50001 DROP VIEW IF EXISTS `v_jurnal_posting` */;
/*!50001 DROP TABLE IF EXISTS `v_jurnal_posting` */;

/*!50001 CREATE TABLE `v_jurnal_posting` (
  `TRANS_ID` int(11) NOT NULL,
  `MITRAID` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `PROJECTKODE` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `acc_type_id` int(11) DEFAULT NULL,
  `KODE_JURNAL` char(3) CHARACTER SET utf8 DEFAULT NULL,
  `NO_BUKTI` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `TGL_TRANS` date DEFAULT NULL,
  `URAIAN` char(110) CHARACTER SET utf8 DEFAULT NULL,
  `USERID` int(11) DEFAULT NULL,
  `CABANG_ID` int(11) DEFAULT NULL,
  `DTM_INSERT` datetime DEFAULT NULL,
  `STS` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `RES` mediumtext CHARACTER SET utf8,
  `TRANSDET_ID` int(11) NOT NULL,
  `MASTER_ID` int(11) DEFAULT NULL,
  `KODE_PERK` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `DEBET` decimal(20,2) DEFAULT NULL,
  `KREDIT` decimal(20,2) DEFAULT NULL,
  `KETERANGAN` char(110) CHARACTER SET utf8 DEFAULT NULL,
  `acc_type_name` char(30) DEFAULT NULL,
  `UPLOADED` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_order` */

DROP TABLE IF EXISTS `v_order`;

/*!50001 DROP VIEW IF EXISTS `v_order` */;
/*!50001 DROP TABLE IF EXISTS `v_order` */;

/*!50001 CREATE TABLE `v_order` (
  `order_id` int(11) NOT NULL,
  `order_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_type` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 : purchase order, 1 : work order',
  `order_jenis_nama` varchar(2) CHARACTER SET utf8 DEFAULT NULL,
  `order_tanggal` datetime DEFAULT NULL,
  `supp_id` int(11) NOT NULL,
  `supp_nama` char(100) CHARACTER SET utf8 NOT NULL,
  `order_nama_dikirim` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_alamat_dikirim` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_hp_fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_subtotal` decimal(18,2) DEFAULT NULL,
  `order_ppn` int(11) DEFAULT NULL COMMENT 'diisi nominal presentase',
  `order_total` decimal(18,2) DEFAULT NULL,
  `order_tanggal_kirim` datetime DEFAULT NULL,
  `order_pembayaran` int(255) DEFAULT NULL,
  `order_pembayaran_nama` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `order_status` int(255) DEFAULT NULL,
  `order_status_nama` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `order_status_date` datetime DEFAULT NULL,
  `order_printed` int(255) DEFAULT NULL,
  `order_created_date` datetime NOT NULL,
  `order_created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `order_update_date` datetime DEFAULT NULL,
  `order_update_by` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `order_revised` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_order_barang` */

DROP TABLE IF EXISTS `v_order_barang`;

/*!50001 DROP VIEW IF EXISTS `v_order_barang` */;
/*!50001 DROP TABLE IF EXISTS `v_order_barang` */;

/*!50001 CREATE TABLE `v_order_barang` (
  `order_id` int(11) NOT NULL,
  `project_id` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `order_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_tanggal` datetime DEFAULT NULL,
  `order_referensi_id` int(11) DEFAULT NULL,
  `mitra_id` int(255) DEFAULT NULL,
  `order_type` char(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '0 : purchase order, 1 : work order',
  `m_supplier_id` int(11) DEFAULT NULL,
  `order_nama_dikirim` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_alamat_dikirim` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_hp_fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `order_subtotal` decimal(18,2) DEFAULT NULL,
  `order_diskon_persen` int(11) DEFAULT NULL,
  `order_diskon_nominal` decimal(18,2) DEFAULT NULL,
  `order_tax_nominal` decimal(18,2) DEFAULT NULL,
  `order_tax_persen` int(11) DEFAULT NULL,
  `order_other_cost` decimal(18,2) DEFAULT NULL,
  `order_ppn` int(11) DEFAULT NULL COMMENT 'diisi nominal presentase',
  `order_total` decimal(18,2) DEFAULT NULL,
  `order_tanggal_kirim` datetime DEFAULT NULL,
  `order_pembayaran` int(255) DEFAULT NULL,
  `order_status` int(255) DEFAULT NULL,
  `order_status_date` datetime DEFAULT NULL,
  `order_printed` int(255) DEFAULT NULL,
  `order_created_date` datetime NOT NULL,
  `order_created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `order_update_date` datetime DEFAULT NULL,
  `order_update_by` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `order_revised` int(255) DEFAULT NULL,
  `orderdet_id` int(11) NOT NULL,
  `t_order_id` int(11) DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `orderdet_qty` int(11) DEFAULT NULL,
  `orderdet_qty_realisasi` int(11) DEFAULT NULL,
  `orderdet_status` int(11) DEFAULT NULL COMMENT '0 Belum Realisasi, 1 Realisasi',
  `orderdet_harga_satuan` int(255) DEFAULT NULL,
  `orderdet_total` int(255) DEFAULT NULL,
  `orderdet_created_date` datetime NOT NULL,
  `orderdet_created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `orderdet_update_date` datetime DEFAULT NULL,
  `orderdet_update_by` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `orderdet_revised` int(255) DEFAULT NULL,
  `produk_nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_kode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `m_satuan_id` int(11) DEFAULT NULL,
  `project_kode` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `project_nama` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `satuan_id` int(11) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_penerimaan_barang` */

DROP TABLE IF EXISTS `v_penerimaan_barang`;

/*!50001 DROP VIEW IF EXISTS `v_penerimaan_barang` */;
/*!50001 DROP TABLE IF EXISTS `v_penerimaan_barang` */;

/*!50001 CREATE TABLE `v_penerimaan_barang` (
  `penerimaan_barang_id` int(11) NOT NULL,
  `penerimaan_barang_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_tanggal` datetime DEFAULT NULL,
  `project_id` varchar(4) CHARACTER SET utf8 NOT NULL,
  `project_nama` varchar(11) CHARACTER SET utf8 NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_tanggal_terima` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_status_nama` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_status_date` datetime DEFAULT NULL,
  `penerimaan_barang_printed` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_created_date` datetime NOT NULL,
  `penerimaan_barang_created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `penerimaan_barang_update_date` datetime DEFAULT NULL,
  `penerimaan_barang_update_by` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `penerimaan_barang_revised` int(255) DEFAULT NULL,
  `t_order_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_permintaan_pembelian` */

DROP TABLE IF EXISTS `v_permintaan_pembelian`;

/*!50001 DROP VIEW IF EXISTS `v_permintaan_pembelian` */;
/*!50001 DROP TABLE IF EXISTS `v_permintaan_pembelian` */;

/*!50001 CREATE TABLE `v_permintaan_pembelian` (
  `permintaan_pembelian_id` int(11) NOT NULL,
  `permintaan_pembelian_nomor` varchar(255) CHARACTER SET utf8 NOT NULL,
  `permintaan_pembelian_tanggal` datetime NOT NULL,
  `permintaan_pembelian_tanggal_dibutuhkan` datetime NOT NULL,
  `permintaan_pembelian_jenis` int(255) NOT NULL,
  `permintaan_pembelian_jenis_nama` varchar(7) CHARACTER SET utf8 NOT NULL,
  `gudang_id_permintaan` int(255) DEFAULT NULL,
  `gudang_nama_permintaan` varchar(255) CHARACTER SET utf8,
  `permintaan_pembelian_status` int(255) NOT NULL,
  `permintaan_pembelian_status_nama` varchar(13) CHARACTER SET utf8 NOT NULL,
  `permintaan_pembelian_status_date` datetime DEFAULT NULL,
  `permintaan_pembelian_penerima` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_penyetuju` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_pembuat` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_printed` int(255) DEFAULT NULL,
  `permintaan_pembelian_created_date` datetime NOT NULL,
  `permintaan_pembelian_created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `permintaan_pembelian_update_date` datetime DEFAULT NULL,
  `permintaan_pembelian_update_by` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_revised` int(255) DEFAULT NULL,
  `permintaan_pembelian_catatan` mediumtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_permintaan_pembelian_produk` */

DROP TABLE IF EXISTS `v_permintaan_pembelian_produk`;

/*!50001 DROP VIEW IF EXISTS `v_permintaan_pembelian_produk` */;
/*!50001 DROP TABLE IF EXISTS `v_permintaan_pembelian_produk` */;

/*!50001 CREATE TABLE `v_permintaan_pembelian_produk` (
  `permintaan_pembelian_id` int(11) NOT NULL,
  `permintaan_pembelian_nomor` varchar(255) CHARACTER SET utf8 NOT NULL,
  `t_permintaan_jasa` int(11) DEFAULT NULL,
  `permintaan_pembelian_tanggal` datetime NOT NULL,
  `permintaan_pembelian_tanggal_dibutuhkan` datetime NOT NULL,
  `permintaan_pembelian_type` int(11) DEFAULT NULL COMMENT '0 SPP Barang, 1 SPP Jasa',
  `permintaan_pembelian_jenis` int(255) NOT NULL,
  `m_gudang_id_permintaan` int(11) DEFAULT NULL,
  `permintaan_pembelian_status` int(255) NOT NULL,
  `permintaan_pembelian_status_date` datetime DEFAULT NULL,
  `permintaan_pembelian_penerima` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_penyetuju` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_pembuat` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_printed` int(255) DEFAULT NULL,
  `permintaan_pembelian_alasan` mediumtext CHARACTER SET utf8,
  `permintaan_pembelian_catatan` mediumtext CHARACTER SET utf8,
  `permintaan_pembelian_created_date` datetime NOT NULL,
  `permintaan_pembelian_created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `permintaan_pembelian_update_date` datetime DEFAULT NULL,
  `permintaan_pembelian_update_by` varchar(0) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembelian_revised` int(255) DEFAULT NULL,
  `permintaan_pembeliandet_id` int(11) NOT NULL,
  `t_permintaan_pembelian_id` int(11) DEFAULT NULL,
  `project_kode` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `m_barang_id` int(11) DEFAULT NULL,
  `permintaan_pembeliandet_qty` int(11) DEFAULT NULL,
  `permintaan_pembeliandet_qty_realisasi` int(11) DEFAULT NULL,
  `permintaan_pembeliandet_status` int(1) DEFAULT NULL COMMENT '0 Belum Ditawarkan, 1 Ditawarkan, 2 Selesai',
  `permintaan_pembeliandet_create_date` datetime DEFAULT NULL,
  `permintaan_pembeliandet_create_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembeliandet_update_date` datetime DEFAULT NULL,
  `permintaan_pembeliandet_update_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permintaan_pembeliandet_revised` int(11) DEFAULT NULL,
  `produk_id` int(11) NOT NULL,
  `mitra_project_kode` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `mitra_id` int(11) DEFAULT NULL,
  `supp_id` int(11) DEFAULT NULL,
  `m_jenis_barang_id` int(11) NOT NULL,
  `produk_kode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `produk_nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `m_satuan_id` int(11) DEFAULT NULL,
  `produk_minimum_stok` int(11) NOT NULL,
  `produk_status_aktif` char(1) CHARACTER SET utf8 NOT NULL,
  `produk_create_date` datetime NOT NULL,
  `produk_create_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_update_date` datetime DEFAULT NULL,
  `produk_update_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `produk_revised` int(11) DEFAULT NULL,
  `satuan_id` int(11) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `satuan_status_aktif` enum('ACTIVE','INACTIVE') CHARACTER SET utf8 DEFAULT NULL,
  `satuan_create_date` datetime DEFAULT NULL,
  `satuan_create_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `satuan_update_date` datetime DEFAULT NULL,
  `satuan_update_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `satuan_revised` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_produk` */

DROP TABLE IF EXISTS `v_produk`;

/*!50001 DROP VIEW IF EXISTS `v_produk` */;
/*!50001 DROP TABLE IF EXISTS `v_produk` */;

/*!50001 CREATE TABLE `v_produk` (
  `mitra_project_kode` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `produk_id` int(11) NOT NULL,
  `m_jenis_barang_id` int(11) NOT NULL,
  `produk_kode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `produk_nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `m_satuan_id` int(11) DEFAULT NULL,
  `produk_minimum_stok` int(11) NOT NULL,
  `produk_status_aktif` char(1) CHARACTER SET utf8 NOT NULL,
  `produk_create_date` datetime NOT NULL,
  `produk_create_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_update_date` datetime DEFAULT NULL,
  `produk_update_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `produk_revised` int(11) DEFAULT NULL,
  `kategori_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `satuan_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_rab` */

DROP TABLE IF EXISTS `v_rab`;

/*!50001 DROP VIEW IF EXISTS `v_rab` */;
/*!50001 DROP TABLE IF EXISTS `v_rab` */;

/*!50001 CREATE TABLE `v_rab` (
  `id` int(11) NOT NULL,
  `mitra_project_kode` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `rab_id` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `rab_nama` char(50) CHARACTER SET utf8 DEFAULT NULL,
  `rab_induk` char(20) CHARACTER SET utf8 DEFAULT NULL,
  `rab_saldo_awal` decimal(18,0) NOT NULL,
  `rab_saldo_akhir` decimal(18,0) NOT NULL,
  `rab_create_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `rab_create_date` datetime DEFAULT NULL,
  `rab_update_by` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `rab_update_date` datetime DEFAULT NULL,
  `project_id` int(11) NOT NULL,
  `project_mitra_id` int(11) DEFAULT NULL,
  `project_kode` char(12) CHARACTER SET utf8 DEFAULT NULL,
  `project_nama` char(100) CHARACTER SET utf8 DEFAULT NULL,
  `project_detail` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `project_nilai` decimal(18,2) DEFAULT NULL,
  `project_lampiran` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `project_aktifasi` enum('AKTIVE','INACTIVE') CHARACTER SET utf8 DEFAULT NULL,
  `project_create_date` datetime DEFAULT NULL,
  `project_create_by` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `project_update_date` datetime DEFAULT NULL,
  `project_update_by` char(40) CHARACTER SET utf8 DEFAULT NULL,
  `project_status` char(5) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_report_penjualan` */

DROP TABLE IF EXISTS `v_report_penjualan`;

/*!50001 DROP VIEW IF EXISTS `v_report_penjualan` */;
/*!50001 DROP TABLE IF EXISTS `v_report_penjualan` */;

/*!50001 CREATE TABLE `v_report_penjualan` (
  `jual_id` int(11) NOT NULL,
  `mitra_id` int(11) DEFAULT NULL,
  `project_id` char(30) DEFAULT NULL,
  `pel_id` int(11) DEFAULT NULL,
  `jual_kode` varchar(25) DEFAULT NULL,
  `jual_kodereff` varchar(50) DEFAULT NULL,
  `jual_tgl` date DEFAULT NULL,
  `jual_detail` varchar(500) DEFAULT NULL,
  `jual_pembayaran` varchar(100) DEFAULT NULL,
  `jual_pengiriman` varchar(100) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `jual_dibuat` varchar(20) DEFAULT NULL,
  `jual_notes` varchar(1000) DEFAULT NULL,
  `jual_subtotal` decimal(18,2) DEFAULT NULL,
  `jual_diskon` decimal(18,2) DEFAULT NULL,
  `jual_pajak` decimal(18,2) DEFAULT NULL,
  `jual_biaya` decimal(18,2) DEFAULT NULL,
  `jual_total` decimal(18,2) DEFAULT NULL,
  `jual_dibayar` decimal(18,2) DEFAULT NULL,
  `jual_sisabayar` decimal(18,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  `status_name` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_report_penjualan_produk_detail` */

DROP TABLE IF EXISTS `v_report_penjualan_produk_detail`;

/*!50001 DROP VIEW IF EXISTS `v_report_penjualan_produk_detail` */;
/*!50001 DROP TABLE IF EXISTS `v_report_penjualan_produk_detail` */;

/*!50001 CREATE TABLE `v_report_penjualan_produk_detail` (
  `jualdt_id` int(11) NOT NULL,
  `jual_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `jual_harga` decimal(18,2) DEFAULT NULL,
  `jual_qty` decimal(18,0) DEFAULT NULL,
  `jual_jumlah` decimal(18,2) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` char(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` char(20) DEFAULT NULL,
  `produk_id` int(11) NOT NULL,
  `mitra_project_kode` char(10) CHARACTER SET utf8 DEFAULT NULL,
  `mitra_id` int(11) DEFAULT NULL,
  `supp_id` int(11) DEFAULT NULL,
  `m_jenis_barang_id` int(11) NOT NULL,
  `produk_kode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_nomor` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `produk_nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `m_satuan_id` int(11) DEFAULT NULL,
  `produk_minimum_stok` int(11) NOT NULL,
  `produk_status_aktif` char(1) CHARACTER SET utf8 NOT NULL,
  `produk_create_date` datetime NOT NULL,
  `produk_create_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `produk_update_date` datetime DEFAULT NULL,
  `produk_update_by` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `produk_revised` int(11) DEFAULT NULL,
  `jual_tgl` date DEFAULT NULL,
  `project_id` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_stok_gudang` */

DROP TABLE IF EXISTS `v_stok_gudang`;

/*!50001 DROP VIEW IF EXISTS `v_stok_gudang` */;
/*!50001 DROP TABLE IF EXISTS `v_stok_gudang` */;

/*!50001 CREATE TABLE `v_stok_gudang` (
  `barang_id` int(11) NOT NULL,
  `jenis_barang_id` int(11) NOT NULL,
  `jenis_barang_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `barang_kode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `barang_nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `barang_status_aktif` char(1) CHARACTER SET utf8 NOT NULL,
  `satuan_id` int(11) NOT NULL,
  `satuan_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `stok_minimum` int(11) NOT NULL,
  `stok_gudang` int(11) DEFAULT NULL,
  `gudang_id` int(255) NOT NULL,
  `gudang_nama` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mitra_project_kode` char(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*Table structure for table `v_supplier` */

DROP TABLE IF EXISTS `v_supplier`;

/*!50001 DROP VIEW IF EXISTS `v_supplier` */;
/*!50001 DROP TABLE IF EXISTS `v_supplier` */;

/*!50001 CREATE TABLE `v_supplier` (
  `supp_id` int(11) NOT NULL,
  `mitra_id` int(11) NOT NULL,
  `supp_kode` char(12) CHARACTER SET utf8 NOT NULL,
  `supp_nama` char(100) CHARACTER SET utf8 NOT NULL,
  `supp_bidang` char(20) CHARACTER SET utf8 NOT NULL,
  `supp_alamat` mediumtext CHARACTER SET utf8 NOT NULL,
  `supp_kota` char(4) CHARACTER SET utf8 NOT NULL,
  `supp_provinsi` char(3) CHARACTER SET utf8 NOT NULL,
  `supp_telp` char(18) CHARACTER SET utf8 NOT NULL,
  `supp_email` char(100) CHARACTER SET utf8 NOT NULL,
  `supp_pic` char(50) CHARACTER SET utf8 NOT NULL,
  `supp_npwp_nama` char(50) CHARACTER SET utf8 NOT NULL,
  `supp_npwp_nomor` char(50) CHARACTER SET utf8 NOT NULL,
  `bidang_nama` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `regenci_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `provinces_nama` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 */;

/*View structure for view v_bukubesar */

/*!50001 DROP TABLE IF EXISTS `v_bukubesar` */;
/*!50001 DROP VIEW IF EXISTS `v_bukubesar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bukubesar` AS select `a`.`TRANS_ID` AS `JURNALID`,`a`.`PROJECTKODE` AS `PROJECTKODE`,`a`.`KODE_JURNAL` AS `KODE_JURNAL`,`a`.`NO_BUKTI` AS `NO_BUKTI`,`a`.`TGL_TRANS` AS `TGL_JURNAL`,`a`.`URAIAN` AS `URAIAN`,`a`.`USERID` AS `USERID`,`a`.`CABANG_ID` AS `CABANG_ID`,`a`.`DTM_INSERT` AS `DTM_INSERT`,`b`.`MASTER_ID` AS `MASTERID`,`b`.`KODE_PERK` AS `KODE_COA`,`b`.`DEBET` AS `DEBET`,`b`.`KREDIT` AS `KREDIT`,`c`.`NAMA_PERK` AS `NAMA_COA` from ((`t_transaksi_master` `a` join `t_transaksi_detail` `b`) join `m_perkiraan` `c`) where ((`a`.`TRANS_ID` = `b`.`MASTER_ID`) and (`b`.`KODE_PERK` = `c`.`KODE_PERK`)) */;

/*View structure for view v_gudang_out */

/*!50001 DROP TABLE IF EXISTS `v_gudang_out` */;
/*!50001 DROP VIEW IF EXISTS `v_gudang_out` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_gudang_out` AS (select `t_gudang_out`.`gout_kode` AS `gout_kode`,`t_gudang_out`.`gout_kodereff` AS `gout_kodereff`,`t_gudang_out`.`gout_tgl` AS `gout_tgl`,`t_penjualan`.`jual_id` AS `jual_id`,`t_penjualan`.`mitra_id` AS `mitra_id`,`t_penjualan`.`project_id` AS `project_id`,`t_penjualan`.`pel_id` AS `pel_id`,`t_penjualan`.`jual_kode` AS `jual_kode`,`t_penjualan`.`jual_kodereff` AS `jual_kodereff`,`t_penjualan`.`jual_tgl` AS `jual_tgl`,`t_penjualan`.`jual_detail` AS `jual_detail`,`t_penjualan`.`jual_pembayaran` AS `jual_pembayaran`,`t_penjualan`.`jual_pengiriman` AS `jual_pengiriman`,`t_penjualan`.`status_id` AS `status_id`,`t_penjualan`.`jual_dibuat` AS `jual_dibuat`,`t_penjualan`.`jual_notes` AS `jual_notes`,`t_penjualan`.`jual_subtotal` AS `jual_subtotal`,`t_penjualan`.`jual_diskon` AS `jual_diskon`,`t_penjualan`.`jual_pajak` AS `jual_pajak`,`t_penjualan`.`jual_biaya` AS `jual_biaya`,`t_penjualan`.`jual_total` AS `jual_total`,`t_penjualan`.`jual_dibayar` AS `jual_dibayar`,`t_penjualan`.`jual_sisabayar` AS `jual_sisabayar`,`t_penjualan`.`create_date` AS `create_date`,`t_penjualan`.`create_by` AS `create_by`,`t_penjualan`.`update_date` AS `update_date`,`t_penjualan`.`update_by` AS `update_by`,`t_penjualan_status`.`status_name` AS `status_name` from ((`t_gudang_out` join `t_penjualan`) join `t_penjualan_status`) where ((`t_gudang_out`.`jual_id` = `t_penjualan`.`jual_id`) and (`t_penjualan_status`.`statusjual_id` = `t_penjualan`.`status_id`))) */;

/*View structure for view v_jurnal_posting */

/*!50001 DROP TABLE IF EXISTS `v_jurnal_posting` */;
/*!50001 DROP VIEW IF EXISTS `v_jurnal_posting` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_jurnal_posting` AS (select `a`.`TRANS_ID` AS `TRANS_ID`,`a`.`MITRAID` AS `MITRAID`,`a`.`PROJECTKODE` AS `PROJECTKODE`,`a`.`acc_type_id` AS `acc_type_id`,`a`.`KODE_JURNAL` AS `KODE_JURNAL`,`a`.`NO_BUKTI` AS `NO_BUKTI`,`a`.`TGL_TRANS` AS `TGL_TRANS`,`a`.`URAIAN` AS `URAIAN`,`a`.`USERID` AS `USERID`,`a`.`CABANG_ID` AS `CABANG_ID`,`a`.`DTM_INSERT` AS `DTM_INSERT`,`a`.`STS` AS `STS`,`a`.`RES` AS `RES`,`b`.`TRANS_ID` AS `TRANSDET_ID`,`b`.`MASTER_ID` AS `MASTER_ID`,`b`.`KODE_PERK` AS `KODE_PERK`,`b`.`DEBET` AS `DEBET`,`b`.`KREDIT` AS `KREDIT`,`b`.`KETERANGAN` AS `KETERANGAN`,`c`.`acc_type_name` AS `acc_type_name`,concat(`d`.`first_name`,'',`d`.`last_name`) AS `UPLOADED` from (((`t_transaksi_jurnal_master` `a` join `t_transaksi_jurnal_detail` `b` on((`b`.`MASTER_ID` = `a`.`TRANS_ID`))) join `m_acc_type` `c` on((`c`.`acc_type_id` = `a`.`acc_type_id`))) join `admin_users` `d` on((`d`.`id` = `a`.`USERID`)))) */;

/*View structure for view v_order */

/*!50001 DROP TABLE IF EXISTS `v_order` */;
/*!50001 DROP VIEW IF EXISTS `v_order` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order` AS (select `a`.`order_id` AS `order_id`,`a`.`order_nomor` AS `order_nomor`,`a`.`order_type` AS `order_type`,if((`a`.`order_type` = 0),'PO','PO') AS `order_jenis_nama`,`a`.`order_tanggal` AS `order_tanggal`,`d`.`supp_id` AS `supp_id`,`d`.`supp_nama` AS `supp_nama`,`a`.`order_nama_dikirim` AS `order_nama_dikirim`,`a`.`order_alamat_dikirim` AS `order_alamat_dikirim`,`a`.`order_hp_fax` AS `order_hp_fax`,`a`.`order_subtotal` AS `order_subtotal`,`a`.`order_ppn` AS `order_ppn`,`a`.`order_total` AS `order_total`,`a`.`order_tanggal_kirim` AS `order_tanggal_kirim`,`a`.`order_pembayaran` AS `order_pembayaran`,if((`a`.`order_pembayaran` = 1),'Tunai','Kredit') AS `order_pembayaran_nama`,`a`.`order_status` AS `order_status`,if((`a`.`order_status` = 1),'PO Baru',if((`a`.`order_status` = 2),'PO Proses ','PO Selesai')) AS `order_status_nama`,`a`.`order_status_date` AS `order_status_date`,`a`.`order_printed` AS `order_printed`,`a`.`order_created_date` AS `order_created_date`,`a`.`order_created_by` AS `order_created_by`,`a`.`order_update_date` AS `order_update_date`,`a`.`order_update_by` AS `order_update_by`,`a`.`order_revised` AS `order_revised` from (`t_order` `a` join `mitra_supplier` `d` on((`d`.`supp_id` = `a`.`m_supplier_id`)))) */;

/*View structure for view v_order_barang */

/*!50001 DROP TABLE IF EXISTS `v_order_barang` */;
/*!50001 DROP VIEW IF EXISTS `v_order_barang` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_order_barang` AS (select `a`.`order_id` AS `order_id`,`a`.`project_id` AS `project_id`,`a`.`order_nomor` AS `order_nomor`,`a`.`order_tanggal` AS `order_tanggal`,`a`.`order_referensi_id` AS `order_referensi_id`,`a`.`mitra_id` AS `mitra_id`,`a`.`order_type` AS `order_type`,`a`.`m_supplier_id` AS `m_supplier_id`,`a`.`order_nama_dikirim` AS `order_nama_dikirim`,`a`.`order_alamat_dikirim` AS `order_alamat_dikirim`,`a`.`order_hp_fax` AS `order_hp_fax`,`a`.`order_subtotal` AS `order_subtotal`,`a`.`order_diskon_persen` AS `order_diskon_persen`,`a`.`order_diskon_nominal` AS `order_diskon_nominal`,`a`.`order_tax_nominal` AS `order_tax_nominal`,`a`.`order_tax_persen` AS `order_tax_persen`,`a`.`order_other_cost` AS `order_other_cost`,`a`.`order_ppn` AS `order_ppn`,`a`.`order_total` AS `order_total`,`a`.`order_tanggal_kirim` AS `order_tanggal_kirim`,`a`.`order_pembayaran` AS `order_pembayaran`,`a`.`order_status` AS `order_status`,`a`.`order_status_date` AS `order_status_date`,`a`.`order_printed` AS `order_printed`,`a`.`order_created_date` AS `order_created_date`,`a`.`order_created_by` AS `order_created_by`,`a`.`order_update_date` AS `order_update_date`,`a`.`order_update_by` AS `order_update_by`,`a`.`order_revised` AS `order_revised`,`b`.`orderdet_id` AS `orderdet_id`,`b`.`t_order_id` AS `t_order_id`,`b`.`m_barang_id` AS `m_barang_id`,`b`.`orderdet_qty` AS `orderdet_qty`,`b`.`orderdet_qty_realisasi` AS `orderdet_qty_realisasi`,`b`.`orderdet_status` AS `orderdet_status`,`b`.`orderdet_harga_satuan` AS `orderdet_harga_satuan`,`b`.`orderdet_total` AS `orderdet_total`,`b`.`orderdet_created_date` AS `orderdet_created_date`,`b`.`orderdet_created_by` AS `orderdet_created_by`,`b`.`orderdet_update_date` AS `orderdet_update_date`,`b`.`orderdet_update_by` AS `orderdet_update_by`,`b`.`orderdet_revised` AS `orderdet_revised`,`c`.`produk_nama` AS `produk_nama`,`c`.`produk_kode` AS `produk_kode`,`c`.`m_satuan_id` AS `m_satuan_id`,`d`.`project_kode` AS `project_kode`,`d`.`project_nama` AS `project_nama`,`e`.`satuan_id` AS `satuan_id`,`e`.`satuan_nama` AS `satuan_nama` from ((((`t_order` `a` join `t_orderdet` `b`) join `m_produk` `c`) join `mitra_project` `d`) join `m_satuan` `e`) where ((`a`.`order_id` = `b`.`t_order_id`) and (`b`.`m_barang_id` = `c`.`produk_id`) and (`a`.`project_id` = `d`.`project_id`) and (`c`.`m_satuan_id` = `e`.`satuan_id`))) */;

/*View structure for view v_penerimaan_barang */

/*!50001 DROP TABLE IF EXISTS `v_penerimaan_barang` */;
/*!50001 DROP VIEW IF EXISTS `v_penerimaan_barang` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penerimaan_barang` AS (select `a`.`penerimaan_barang_id` AS `penerimaan_barang_id`,`a`.`penerimaan_barang_nomor` AS `penerimaan_barang_nomor`,`a`.`penerimaan_barang_tanggal` AS `penerimaan_barang_tanggal`,'0000' AS `project_id`,'NAMAPROJECT' AS `project_nama`,`c`.`order_id` AS `order_id`,`c`.`order_nomor` AS `order_nomor`,`a`.`penerimaan_barang_tanggal_terima` AS `penerimaan_barang_tanggal_terima`,`a`.`penerimaan_barang_status` AS `penerimaan_barang_status`,if((`a`.`penerimaan_barang_status` = 1),'BPB Baru',if((`a`.`penerimaan_barang_status` = 2),'BPB Berjalan','BPB Selesai')) AS `penerimaan_barang_status_nama`,`a`.`penerimaan_barang_status_date` AS `penerimaan_barang_status_date`,`a`.`penerimaan_barang_printed` AS `penerimaan_barang_printed`,`a`.`penerimaan_barang_created_date` AS `penerimaan_barang_created_date`,`a`.`penerimaan_barang_created_by` AS `penerimaan_barang_created_by`,`a`.`penerimaan_barang_update_date` AS `penerimaan_barang_update_date`,`a`.`penerimaan_barang_update_by` AS `penerimaan_barang_update_by`,`a`.`penerimaan_barang_revised` AS `penerimaan_barang_revised`,`a`.`t_order_id` AS `t_order_id` from (`t_penerimaan_barang` `a` join `t_order` `c` on((`c`.`order_id` = `a`.`t_order_id`)))) */;

/*View structure for view v_permintaan_pembelian */

/*!50001 DROP TABLE IF EXISTS `v_permintaan_pembelian` */;
/*!50001 DROP VIEW IF EXISTS `v_permintaan_pembelian` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_permintaan_pembelian` AS (select `a`.`permintaan_pembelian_id` AS `permintaan_pembelian_id`,`a`.`permintaan_pembelian_nomor` AS `permintaan_pembelian_nomor`,`a`.`permintaan_pembelian_tanggal` AS `permintaan_pembelian_tanggal`,`a`.`permintaan_pembelian_tanggal_dibutuhkan` AS `permintaan_pembelian_tanggal_dibutuhkan`,`a`.`permintaan_pembelian_jenis` AS `permintaan_pembelian_jenis`,if((`a`.`permintaan_pembelian_jenis` = 1),'Penting','Biasa') AS `permintaan_pembelian_jenis_nama`,`c`.`gudang_id` AS `gudang_id_permintaan`,`c`.`gudang_nama` AS `gudang_nama_permintaan`,`a`.`permintaan_pembelian_status` AS `permintaan_pembelian_status`,if((`a`.`permintaan_pembelian_status` = 1),'SPP Baru',if((`a`.`permintaan_pembelian_status` = 2),'SPP Proses PO','SPP Selesai')) AS `permintaan_pembelian_status_nama`,`a`.`permintaan_pembelian_status_date` AS `permintaan_pembelian_status_date`,`a`.`permintaan_pembelian_penerima` AS `permintaan_pembelian_penerima`,`a`.`permintaan_pembelian_penyetuju` AS `permintaan_pembelian_penyetuju`,`a`.`permintaan_pembelian_pembuat` AS `permintaan_pembelian_pembuat`,`a`.`permintaan_pembelian_printed` AS `permintaan_pembelian_printed`,`a`.`permintaan_pembelian_created_date` AS `permintaan_pembelian_created_date`,`a`.`permintaan_pembelian_created_by` AS `permintaan_pembelian_created_by`,`a`.`permintaan_pembelian_update_date` AS `permintaan_pembelian_update_date`,`a`.`permintaan_pembelian_update_by` AS `permintaan_pembelian_update_by`,`a`.`permintaan_pembelian_revised` AS `permintaan_pembelian_revised`,`a`.`permintaan_pembelian_catatan` AS `permintaan_pembelian_catatan` from (`t_permintaan_pembelian` `a` left join `m_gudang` `c` on((`c`.`gudang_id` = `a`.`m_gudang_id_permintaan`)))) */;

/*View structure for view v_permintaan_pembelian_produk */

/*!50001 DROP TABLE IF EXISTS `v_permintaan_pembelian_produk` */;
/*!50001 DROP VIEW IF EXISTS `v_permintaan_pembelian_produk` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_permintaan_pembelian_produk` AS (select `a`.`permintaan_pembelian_id` AS `permintaan_pembelian_id`,`a`.`permintaan_pembelian_nomor` AS `permintaan_pembelian_nomor`,`a`.`t_permintaan_jasa` AS `t_permintaan_jasa`,`a`.`permintaan_pembelian_tanggal` AS `permintaan_pembelian_tanggal`,`a`.`permintaan_pembelian_tanggal_dibutuhkan` AS `permintaan_pembelian_tanggal_dibutuhkan`,`a`.`permintaan_pembelian_type` AS `permintaan_pembelian_type`,`a`.`permintaan_pembelian_jenis` AS `permintaan_pembelian_jenis`,`a`.`m_gudang_id_permintaan` AS `m_gudang_id_permintaan`,`a`.`permintaan_pembelian_status` AS `permintaan_pembelian_status`,`a`.`permintaan_pembelian_status_date` AS `permintaan_pembelian_status_date`,`a`.`permintaan_pembelian_penerima` AS `permintaan_pembelian_penerima`,`a`.`permintaan_pembelian_penyetuju` AS `permintaan_pembelian_penyetuju`,`a`.`permintaan_pembelian_pembuat` AS `permintaan_pembelian_pembuat`,`a`.`permintaan_pembelian_printed` AS `permintaan_pembelian_printed`,`a`.`permintaan_pembelian_alasan` AS `permintaan_pembelian_alasan`,`a`.`permintaan_pembelian_catatan` AS `permintaan_pembelian_catatan`,`a`.`permintaan_pembelian_created_date` AS `permintaan_pembelian_created_date`,`a`.`permintaan_pembelian_created_by` AS `permintaan_pembelian_created_by`,`a`.`permintaan_pembelian_update_date` AS `permintaan_pembelian_update_date`,`a`.`permintaan_pembelian_update_by` AS `permintaan_pembelian_update_by`,`a`.`permintaan_pembelian_revised` AS `permintaan_pembelian_revised`,`b`.`permintaan_pembeliandet_id` AS `permintaan_pembeliandet_id`,`b`.`t_permintaan_pembelian_id` AS `t_permintaan_pembelian_id`,`b`.`project_kode` AS `project_kode`,`b`.`m_barang_id` AS `m_barang_id`,`b`.`permintaan_pembeliandet_qty` AS `permintaan_pembeliandet_qty`,`b`.`permintaan_pembeliandet_qty_realisasi` AS `permintaan_pembeliandet_qty_realisasi`,`b`.`permintaan_pembeliandet_status` AS `permintaan_pembeliandet_status`,`b`.`permintaan_pembeliandet_create_date` AS `permintaan_pembeliandet_create_date`,`b`.`permintaan_pembeliandet_create_by` AS `permintaan_pembeliandet_create_by`,`b`.`permintaan_pembeliandet_update_date` AS `permintaan_pembeliandet_update_date`,`b`.`permintaan_pembeliandet_update_by` AS `permintaan_pembeliandet_update_by`,`b`.`permintaan_pembeliandet_revised` AS `permintaan_pembeliandet_revised`,`c`.`produk_id` AS `produk_id`,`c`.`mitra_project_kode` AS `mitra_project_kode`,`c`.`mitra_id` AS `mitra_id`,`c`.`supp_id` AS `supp_id`,`c`.`m_jenis_barang_id` AS `m_jenis_barang_id`,`c`.`produk_kode` AS `produk_kode`,`c`.`produk_nomor` AS `produk_nomor`,`c`.`produk_nama` AS `produk_nama`,`c`.`m_satuan_id` AS `m_satuan_id`,`c`.`produk_minimum_stok` AS `produk_minimum_stok`,`c`.`produk_status_aktif` AS `produk_status_aktif`,`c`.`produk_create_date` AS `produk_create_date`,`c`.`produk_create_by` AS `produk_create_by`,`c`.`produk_update_date` AS `produk_update_date`,`c`.`produk_update_by` AS `produk_update_by`,`c`.`produk_revised` AS `produk_revised`,`d`.`satuan_id` AS `satuan_id`,`d`.`satuan_nama` AS `satuan_nama`,`d`.`satuan_status_aktif` AS `satuan_status_aktif`,`d`.`satuan_create_date` AS `satuan_create_date`,`d`.`satuan_create_by` AS `satuan_create_by`,`d`.`satuan_update_date` AS `satuan_update_date`,`d`.`satuan_update_by` AS `satuan_update_by`,`d`.`satuan_revised` AS `satuan_revised` from (((`t_permintaan_pembelian` `a` join `t_permintaan_pembeliandet` `b`) join `m_produk` `c`) join `m_satuan` `d`) where ((`a`.`permintaan_pembelian_id` = `b`.`t_permintaan_pembelian_id`) and (`b`.`m_barang_id` = `c`.`produk_id`) and (`c`.`m_satuan_id` = `d`.`satuan_id`))) */;

/*View structure for view v_produk */

/*!50001 DROP TABLE IF EXISTS `v_produk` */;
/*!50001 DROP VIEW IF EXISTS `v_produk` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_produk` AS (select `a`.`mitra_project_kode` AS `mitra_project_kode`,`a`.`produk_id` AS `produk_id`,`a`.`m_jenis_barang_id` AS `m_jenis_barang_id`,`a`.`produk_kode` AS `produk_kode`,`a`.`produk_nomor` AS `produk_nomor`,`a`.`produk_nama` AS `produk_nama`,`a`.`m_satuan_id` AS `m_satuan_id`,`a`.`produk_minimum_stok` AS `produk_minimum_stok`,`a`.`produk_status_aktif` AS `produk_status_aktif`,`a`.`produk_create_date` AS `produk_create_date`,`a`.`produk_create_by` AS `produk_create_by`,`a`.`produk_update_date` AS `produk_update_date`,`a`.`produk_update_by` AS `produk_update_by`,`a`.`produk_revised` AS `produk_revised`,`b`.`kategori_nama` AS `kategori_nama`,`c`.`satuan_nama` AS `satuan_nama` from ((`m_produk` `a` left join `m_produk_kategori` `b` on((`a`.`m_jenis_barang_id` = `b`.`kategori_id`))) left join `m_satuan` `c` on((`a`.`m_satuan_id` = `c`.`satuan_id`)))) */;

/*View structure for view v_rab */

/*!50001 DROP TABLE IF EXISTS `v_rab` */;
/*!50001 DROP VIEW IF EXISTS `v_rab` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rab` AS (select `a`.`id` AS `id`,`a`.`mitra_project_kode` AS `mitra_project_kode`,`a`.`rab_id` AS `rab_id`,`a`.`rab_nama` AS `rab_nama`,`a`.`rab_induk` AS `rab_induk`,`a`.`rab_saldo_awal` AS `rab_saldo_awal`,`a`.`rab_saldo_akhir` AS `rab_saldo_akhir`,`a`.`rab_create_by` AS `rab_create_by`,`a`.`rab_create_date` AS `rab_create_date`,`a`.`rab_update_by` AS `rab_update_by`,`a`.`rab_update_date` AS `rab_update_date`,`b`.`project_id` AS `project_id`,`b`.`project_mitra_id` AS `project_mitra_id`,`b`.`project_kode` AS `project_kode`,`b`.`project_nama` AS `project_nama`,`b`.`project_detail` AS `project_detail`,`b`.`project_nilai` AS `project_nilai`,`b`.`project_lampiran` AS `project_lampiran`,`b`.`project_aktifasi` AS `project_aktifasi`,`b`.`project_create_date` AS `project_create_date`,`b`.`project_create_by` AS `project_create_by`,`b`.`project_update_date` AS `project_update_date`,`b`.`project_update_by` AS `project_update_by`,`b`.`project_status` AS `project_status` from (`mitra_rab` `a` join `mitra_project` `b`) where (`a`.`mitra_project_kode` = `b`.`project_kode`)) */;

/*View structure for view v_report_penjualan */

/*!50001 DROP TABLE IF EXISTS `v_report_penjualan` */;
/*!50001 DROP VIEW IF EXISTS `v_report_penjualan` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_report_penjualan` AS (select `t_penjualan`.`jual_id` AS `jual_id`,`t_penjualan`.`mitra_id` AS `mitra_id`,`t_penjualan`.`project_id` AS `project_id`,`t_penjualan`.`pel_id` AS `pel_id`,`t_penjualan`.`jual_kode` AS `jual_kode`,`t_penjualan`.`jual_kodereff` AS `jual_kodereff`,`t_penjualan`.`jual_tgl` AS `jual_tgl`,`t_penjualan`.`jual_detail` AS `jual_detail`,`t_penjualan`.`jual_pembayaran` AS `jual_pembayaran`,`t_penjualan`.`jual_pengiriman` AS `jual_pengiriman`,`t_penjualan`.`status_id` AS `status_id`,`t_penjualan`.`jual_dibuat` AS `jual_dibuat`,`t_penjualan`.`jual_notes` AS `jual_notes`,`t_penjualan`.`jual_subtotal` AS `jual_subtotal`,`t_penjualan`.`jual_diskon` AS `jual_diskon`,`t_penjualan`.`jual_pajak` AS `jual_pajak`,`t_penjualan`.`jual_biaya` AS `jual_biaya`,`t_penjualan`.`jual_total` AS `jual_total`,`t_penjualan`.`jual_dibayar` AS `jual_dibayar`,`t_penjualan`.`jual_sisabayar` AS `jual_sisabayar`,`t_penjualan`.`create_date` AS `create_date`,`t_penjualan`.`create_by` AS `create_by`,`t_penjualan`.`update_date` AS `update_date`,`t_penjualan`.`update_by` AS `update_by`,`t_penjualan_status`.`status_name` AS `status_name` from (`t_penjualan` join `t_penjualan_status` on((`t_penjualan_status`.`statusjual_id` = `t_penjualan`.`status_id`)))) */;

/*View structure for view v_report_penjualan_produk_detail */

/*!50001 DROP TABLE IF EXISTS `v_report_penjualan_produk_detail` */;
/*!50001 DROP VIEW IF EXISTS `v_report_penjualan_produk_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_report_penjualan_produk_detail` AS (select `b`.`jualdt_id` AS `jualdt_id`,`b`.`jual_id` AS `jual_id`,`b`.`prod_id` AS `prod_id`,`b`.`jual_harga` AS `jual_harga`,`b`.`jual_qty` AS `jual_qty`,`b`.`jual_jumlah` AS `jual_jumlah`,`b`.`create_date` AS `create_date`,`b`.`create_by` AS `create_by`,`b`.`update_date` AS `update_date`,`b`.`update_by` AS `update_by`,`c`.`produk_id` AS `produk_id`,`c`.`mitra_project_kode` AS `mitra_project_kode`,`c`.`mitra_id` AS `mitra_id`,`c`.`supp_id` AS `supp_id`,`c`.`m_jenis_barang_id` AS `m_jenis_barang_id`,`c`.`produk_kode` AS `produk_kode`,`c`.`produk_nomor` AS `produk_nomor`,`c`.`produk_nama` AS `produk_nama`,`c`.`m_satuan_id` AS `m_satuan_id`,`c`.`produk_minimum_stok` AS `produk_minimum_stok`,`c`.`produk_status_aktif` AS `produk_status_aktif`,`c`.`produk_create_date` AS `produk_create_date`,`c`.`produk_create_by` AS `produk_create_by`,`c`.`produk_update_date` AS `produk_update_date`,`c`.`produk_update_by` AS `produk_update_by`,`c`.`produk_revised` AS `produk_revised`,`a`.`jual_tgl` AS `jual_tgl`,`a`.`project_id` AS `project_id` from ((`t_penjualan` `a` join `t_penjualan_det` `b`) join `m_produk` `c`) where ((`a`.`jual_id` = `b`.`jual_id`) and (`b`.`prod_id` = `c`.`produk_id`))) */;

/*View structure for view v_stok_gudang */

/*!50001 DROP TABLE IF EXISTS `v_stok_gudang` */;
/*!50001 DROP VIEW IF EXISTS `v_stok_gudang` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stok_gudang` AS (select `a`.`produk_id` AS `barang_id`,`b`.`kategori_id` AS `jenis_barang_id`,`b`.`kategori_nama` AS `jenis_barang_nama`,`a`.`produk_kode` AS `barang_kode`,`a`.`produk_nama` AS `barang_nama`,`a`.`produk_status_aktif` AS `barang_status_aktif`,`c`.`satuan_id` AS `satuan_id`,`c`.`satuan_nama` AS `satuan_nama`,`a`.`produk_minimum_stok` AS `stok_minimum`,`d`.`stok_gudang_jumlah` AS `stok_gudang`,`e`.`gudang_id` AS `gudang_id`,`e`.`gudang_nama` AS `gudang_nama`,`a`.`mitra_project_kode` AS `mitra_project_kode` from ((((`m_produk` `a` join `m_produk_kategori` `b` on((`b`.`kategori_id` = `a`.`m_jenis_barang_id`))) join `m_satuan` `c` on((`c`.`satuan_id` = `a`.`m_satuan_id`))) join `t_stok_gudang` `d` on((`d`.`m_barang_id` = `a`.`produk_id`))) join `m_gudang` `e` on((`e`.`gudang_id` = `d`.`m_gudang_id`)))) */;

/*View structure for view v_supplier */

/*!50001 DROP TABLE IF EXISTS `v_supplier` */;
/*!50001 DROP VIEW IF EXISTS `v_supplier` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_supplier` AS (select `a`.`supp_id` AS `supp_id`,`a`.`mitra_id` AS `mitra_id`,`a`.`supp_kode` AS `supp_kode`,`a`.`supp_nama` AS `supp_nama`,`a`.`supp_bidang` AS `supp_bidang`,`a`.`supp_alamat` AS `supp_alamat`,`a`.`supp_kota` AS `supp_kota`,`a`.`supp_provinsi` AS `supp_provinsi`,`a`.`supp_telp` AS `supp_telp`,`a`.`supp_email` AS `supp_email`,`a`.`supp_pic` AS `supp_pic`,`a`.`supp_npwp_nama` AS `supp_npwp_nama`,`a`.`supp_npwp_nomor` AS `supp_npwp_nomor`,`b`.`bidang_nama` AS `bidang_nama`,`c`.`regenci_name` AS `regenci_name`,`d`.`provinces_nama` AS `provinces_nama` from (((`mitra_supplier` `a` join `m_bidang` `b`) join `m_regencies` `c`) join `m_provinces` `d`) where ((`a`.`supp_bidang` = `b`.`bidang_id`) and (`a`.`supp_kota` = `c`.`regenci_id`) and (`a`.`supp_provinsi` = `d`.`provinces_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
