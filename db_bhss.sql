-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 06, 2021 at 03:36 AM
-- Server version: 5.6.37
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bhss`
--
CREATE DATABASE IF NOT EXISTS `db_bhss` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_bhss`;

DELIMITER $$
--
-- Functions
--
DROP FUNCTION IF EXISTS `get_next_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_next_id`() RETURNS int(11)
BEGIN
	   DECLARE i INT;
	   DELETE FROM po_id_generator;
	   INSERT INTO po_id_generator (NEXT_ID) VALUES (NULL);
	   SELECT next_id INTO i FROM po_id_generator;
	   RETURN i;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_groups`
--

DROP TABLE IF EXISTS `admin_groups`;
CREATE TABLE IF NOT EXISTS `admin_groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_groups`
--

INSERT INTO `admin_groups` (`id`, `name`, `description`) VALUES
(1, 'webmaster', 'Webmaster'),
(2, 'admin', 'Administrator'),
(3, 'manager', 'Manager'),
(4, 'staff', 'Staff'),
(5, 'funder', 'Funder');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_attempts`
--

DROP TABLE IF EXISTS `admin_login_attempts`;
CREATE TABLE IF NOT EXISTS `admin_login_attempts` (
  `id` int(11) unsigned NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE IF NOT EXISTS `admin_users` (
  `id` int(11) unsigned NOT NULL,
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
  `last_name` varchar(50) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`) VALUES
(1, '127.0.0.1', 'webmaster', '$2y$08$/X5gzWjesYi78GqeAv5tA.dVGBVP7C1e1PzqnYCVe5s1qhlDIPPES', NULL, NULL, NULL, NULL, NULL, NULL, 1451900190, 1620068192, 1, 'Edi ', 'Supriyanto'),
(2, '127.0.0.1', 'admin', '$2y$08$7Bkco6JXtC3Hu6g9ngLZDuHsFLvT7cyAxiz1FzxlX5vwccvRT7nKW', NULL, NULL, NULL, NULL, NULL, NULL, 1451900228, 1606497444, 1, 'Admin', ''),
(3, '127.0.0.1', 'manager', '$2y$08$snzIJdFXvg/rSHe0SndIAuvZyjktkjUxBXkrrGdkPy1K6r5r/dMLa', NULL, NULL, NULL, NULL, NULL, NULL, 1451900430, 1465489585, 1, 'Manager', ''),
(4, '127.0.0.1', 'staff', '$2y$08$NigAXjN23CRKllqe3KmjYuWXD5iSRPY812SijlhGeKfkrMKde9da6', NULL, NULL, NULL, NULL, NULL, NULL, 1451900439, 1465489590, 1, 'Staff', ''),
(5, '::1', 'edisite', '$2y$08$7nz5Vb89V05/P3Bc2/9vD.hKdQM9qQkX9Y9Ax1BRMErEutKtSCXS.', NULL, NULL, NULL, NULL, NULL, NULL, 1568445475, NULL, 1, 'Edi', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `admin_users_groups`
--

DROP TABLE IF EXISTS `admin_users_groups`;
CREATE TABLE IF NOT EXISTS `admin_users_groups` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_users_groups`
--

INSERT INTO `admin_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `api_access`
--

DROP TABLE IF EXISTS `api_access`;
CREATE TABLE IF NOT EXISTS `api_access` (
  `id` int(11) unsigned NOT NULL,
  `key` varchar(40) NOT NULL DEFAULT '',
  `controller` varchar(50) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
CREATE TABLE IF NOT EXISTS `api_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT '0',
  `is_private_key` tinyint(1) NOT NULL DEFAULT '0',
  `ip_addresses` text,
  `date_created` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `api_keys`
--

INSERT INTO `api_keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 0, 'anonymous', 1, 1, 0, NULL, 1463388382);

-- --------------------------------------------------------

--
-- Table structure for table `api_limits`
--

DROP TABLE IF EXISTS `api_limits`;
CREATE TABLE IF NOT EXISTS `api_limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `api_logs`
--

DROP TABLE IF EXISTS `api_logs`;
CREATE TABLE IF NOT EXISTS `api_logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'member', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_produk`
--

DROP TABLE IF EXISTS `m_produk`;
CREATE TABLE IF NOT EXISTS `m_produk` (
  `produk_id` int(11) NOT NULL,
  `produk_nama` varchar(255) NOT NULL,
  `product_harga` decimal(18,2) DEFAULT NULL,
  `m_kategori_id` int(11) DEFAULT NULL,
  `produk_stok` int(11) NOT NULL,
  `produk_status_aktif` char(1) NOT NULL,
  `produk_create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `produk_create_by` varchar(255) NOT NULL,
  `produk_update_date` datetime DEFAULT NULL,
  `produk_update_by` varchar(255) DEFAULT NULL,
  `produk_revised` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_produk`
--

INSERT INTO `m_produk` (`produk_id`, `produk_nama`, `product_harga`, `m_kategori_id`, `produk_stok`, `produk_status_aktif`, `produk_create_date`, `produk_create_by`, `produk_update_date`, `produk_update_by`, `produk_revised`) VALUES
(1, 'TOYOTA HILUX  DOUBLE CABING 2.4  G (4x4) M/T DIESEL', '21000000.00', 1, 2, '1', '0000-00-00 00:00:00', 'admin', NULL, 'admin', NULL),
(2, 'BBM SOLAR INDUSTRY', '10300.00', 2, 8, '1', '0000-00-00 00:00:00', 'ADMIN', NULL, 'ADMIN', NULL),
(3, 'KAPOR POWDER ACTIVE', '80000.00', 3, 50, '1', '0000-00-00 00:00:00', 'admin', NULL, 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m_produk_kategori`
--

DROP TABLE IF EXISTS `m_produk_kategori`;
CREATE TABLE IF NOT EXISTS `m_produk_kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(255) DEFAULT NULL,
  `kategori_create_date` datetime DEFAULT NULL,
  `kategori_create_by` varchar(255) DEFAULT NULL,
  `kategori_update_date` datetime DEFAULT NULL,
  `kategori_update_by` varchar(255) DEFAULT NULL,
  `kategori_revised` int(11) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m_produk_kategori`
--

INSERT INTO `m_produk_kategori` (`kategori_id`, `kategori_nama`, `kategori_create_date`, `kategori_create_by`, `kategori_update_date`, `kategori_update_by`, `kategori_revised`) VALUES
(1, 'JASA PENGADAAN KENDARAAN TAMBANG', NULL, NULL, NULL, NULL, NULL),
(2, 'JASA PENGADAAN BAHAN BAKAR MINYAK', NULL, NULL, NULL, NULL, NULL),
(3, 'PRODUSEN DAN SUPPLIER KAPUR', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pesan_pelanggan`
--

DROP TABLE IF EXISTS `pesan_pelanggan`;
CREATE TABLE IF NOT EXISTS `pesan_pelanggan` (
  `id` int(11) NOT NULL,
  `tanggal_pesan` datetime NOT NULL,
  `subjek_pesan` char(160) NOT NULL,
  `pesan` text NOT NULL,
  `nama_pengirim` char(30) NOT NULL,
  `email_pengirim` char(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan_pelanggan`
--

INSERT INTO `pesan_pelanggan` (`id`, `tanggal_pesan`, `subjek_pesan`, `pesan`, `nama_pengirim`, `email_pengirim`) VALUES
(3, '2020-11-25 07:50:42', 'Hotel Reservation Detail', 'ess', 'Edi S', 'edisite01@gmail.com'),
(10, '2020-11-29 01:09:44', 'Hotel Reservation Detail', 'tess', 'Edi S', 'edisite01@gmail.com'),
(11, '2020-11-29 01:13:44', 'Hotel Reservation Detail', 'tess', 'Edi S', 'edisite01@gmail.com'),
(12, '2020-11-29 01:13:59', 'Hotel Reservation Detail', 'ts', 'Edi S', 'edisite01@gmail.com'),
(13, '2020-11-29 01:14:14', 'Pesan Admin', 'Cek', 'Jerio Madre', 'jeriomadre@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `po_id_generator`
--

DROP TABLE IF EXISTS `po_id_generator`;
CREATE TABLE IF NOT EXISTS `po_id_generator` (
  `NEXT_ID` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_id_generator`
--

INSERT INTO `po_id_generator` (`NEXT_ID`) VALUES
(33);

-- --------------------------------------------------------

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
CREATE TABLE IF NOT EXISTS `t_order` (
  `order_id` int(11) NOT NULL,
  `order_userid` int(11) NOT NULL,
  `order_nomor_po` varchar(255) DEFAULT NULL,
  `order_tanggal` date DEFAULT NULL,
  `order_nama_dikirim` varchar(255) DEFAULT NULL,
  `order_alamat_dikirim` varchar(255) DEFAULT NULL,
  `m_produk_kategori_id` int(11) DEFAULT NULL,
  `m_produk_id` int(11) DEFAULT NULL,
  `order_harga` decimal(18,2) DEFAULT NULL,
  `order_qty_unit` int(11) DEFAULT NULL,
  `order_lama_sewa` int(11) DEFAULT NULL,
  `order_subtotal` decimal(18,2) DEFAULT NULL,
  `order_total` decimal(18,2) DEFAULT NULL,
  `order_keterangan` char(50) DEFAULT NULL,
  `order_tanggal_kirim` datetime DEFAULT NULL,
  `order_status` enum('1','2','3') DEFAULT '1',
  `order_status_date` datetime DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_order`
--

INSERT INTO `t_order` (`order_id`, `order_userid`, `order_nomor_po`, `order_tanggal`, `order_nama_dikirim`, `order_alamat_dikirim`, `m_produk_kategori_id`, `m_produk_id`, `order_harga`, `order_qty_unit`, `order_lama_sewa`, `order_subtotal`, `order_total`, `order_keterangan`, `order_tanggal_kirim`, `order_status`, `order_status_date`) VALUES
(19, 7, '0025/HILUX/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 1, 1, '21000000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '2', '2020-11-29 02:16:43'),
(18, 7, '0024/SOLAR/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 2, 2, '10300.00', 2, 0, '20600.00', '20600.00', '-', '0000-00-00 00:00:00', '1', NULL),
(5, 7, '0010/SOLAR/PO/PTBHSS/2020', '2020-11-24', NULL, NULL, 2, 2, '10300.00', 0, 0, '0.00', '0.00', 'tesss', '0000-00-00 00:00:00', '1', NULL),
(6, 7, '0011/KAPUR/PO/PTBHSS/2020', '2020-11-24', NULL, NULL, 3, 3, '80000.00', 24, 0, '1920000.00', '1920000.00', 'tesss', '0000-00-00 00:00:00', '2', '2020-11-29 01:15:47'),
(7, 7, '0013/KAPUR/PO/PTBHSS/2020', '2020-11-25', NULL, NULL, 3, 3, '80000.00', 34, 0, '2720000.00', '2720000.00', '-', '0000-00-00 00:00:00', '2', '2020-11-29 00:52:55'),
(8, 8, '0014/HILUX/PO/PTBHSS/2020', '2020-11-25', NULL, NULL, 1, 1, '21000000.00', 1, 2, '42000000.00', '42000000.00', '-', '0000-00-00 00:00:00', '1', NULL),
(17, 7, '0023/KAPUR/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 3, 3, '80000.00', 1, 0, '80000.00', '80000.00', '', '0000-00-00 00:00:00', '1', NULL),
(14, 7, '0020/SOLAR/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 2, 2, '10300.00', 1, 0, '10300.00', '10300.00', '', '0000-00-00 00:00:00', '1', NULL),
(15, 7, '0021/SOLAR/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 2, 2, '10300.00', 1, 0, '10300.00', '10300.00', '', '0000-00-00 00:00:00', '1', NULL),
(16, 7, '0022/SOLAR/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 2, 2, '10300.00', 1, 0, '10300.00', '10300.00', '', '0000-00-00 00:00:00', '1', NULL),
(20, 7, '0026/HILUX/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 1, 1, '21000000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '2', '2020-11-29 02:21:24'),
(21, 7, '0027/HILUX/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 1, 1, '21000000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '2', '2020-11-29 02:29:12'),
(22, 7, '0028/HILUX/PO/PTBHSS/2020', '2020-11-29', NULL, NULL, 1, 1, '21000000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '1', NULL),
(23, 7, '0029/HILUX/PO/PTBHSS/2020', '2020-12-15', NULL, NULL, 1, 1, '21000000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '1', NULL),
(24, 7, '0030/HILUX/PO/PTBHSS/2020', '2020-12-15', NULL, NULL, 1, 1, '21000000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '1', NULL),
(25, 7, '0031/SOLAR/PO/PTBHSS/2021', '2021-03-14', NULL, NULL, 2, 2, '10300.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '1', NULL),
(26, 9, '0032/HILUX/PO/PTBHSS/2021', '2021-03-16', NULL, NULL, 1, 1, '21000000.00', 1, 1, '21000000.00', '21000000.00', '-', '0000-00-00 00:00:00', '2', '2021-03-16 12:36:29'),
(27, 9, '0033/KAPUR/PO/PTBHSS/2021', '2021-03-16', NULL, NULL, 3, 3, '80000.00', 0, 0, '0.00', '0.00', '', '0000-00-00 00:00:00', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL,
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
  `company_name` varchar(50) DEFAULT NULL,
  `category` enum('individu','perusahaan') DEFAULT NULL,
  `handphone` char(20) DEFAULT NULL,
  `address` text
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company_name`, `category`, `handphone`, `address`) VALUES
(1, '::1', 'eriko', '$2y$08$UqNFuu1WkmkRi6CWCKChZukeB96VEXgn2icvnUm6CtGIWQpuFUzya', NULL, 'eriko@gmail.com', NULL, NULL, NULL, '51Hico3R89BZCZMs6CPle.', 1602689926, 1603004517, 1, 'Eriko', 'Jeen', NULL, NULL, NULL, NULL),
(2, '::1', NULL, '$2y$08$TiK9XmafGs0FYrWkI22tcuQQ/obsJnfAhAhkuexcvwMWAjDhrjq7e', NULL, '', NULL, NULL, NULL, NULL, 1602998392, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(3, '::1', NULL, '$2y$08$gaQ.gUV5fnGXQx9zsWrAtOejkQeM/As6xo60FFofri7CsGfeBeere', NULL, '', NULL, NULL, NULL, NULL, 1602998522, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4, '::1', NULL, '$2y$08$nC2NkQHmJRrG0JYWcOG5keQfovaOpNNPPzhUOP/zCfxgJHksPzgxK', NULL, '', NULL, NULL, NULL, NULL, 1602998553, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '::1', NULL, '$2y$08$4BFy0T6u5BQ1.4ZyoFsqDOjtg0WAuJrijqlnOwY94araAAzfpo0dq', NULL, '', NULL, NULL, NULL, NULL, 1603003164, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(6, '::1', 'gmail.com', '$2y$08$rGWZAZYnUW1vkLGKmn5jT.Nl7RZxovTq82ICAwwSgpvXOoNwIpbq6', NULL, 'joko@gmail.com', NULL, NULL, NULL, NULL, 1603004410, NULL, 1, NULL, NULL, 'PT.Tambang Perkasa', 'perusahaan', '081389898933', 'Jl. Tebet H/10 Jakarta Pusat, DKI Jakarta, Indonesia 88723'),
(7, '::1', 'joko01', '$2y$08$VWLe3T.iROKFJ1j3snbzIOICJowsA1CGVKj3P6YGOT/yrxR9Kxxo2', NULL, 'joko01@gmail.com', NULL, NULL, NULL, 'xBofq5ja.RVkwOWGG7N4Ze', 1603004571, 1620068140, 1, 'Joko Wijoyo     ', NULL, 'PT.Tambang Perkasa', 'individu', '081389898933', '<p>\r\n	Jl. Tebet H/10 Jakarta Pusat,<br />\r\n	DKI Jakarta, Indonesia 88723</p>\r\n'),
(8, '182.1.177.115', 'jeriomadre', '$2y$08$xp25pJ1GQD4J5bQI3bIoyu7d/c0qhF/tAcPXUUZvkaWLvM2AgZCHe', NULL, 'jeriomadre@gmail.com', NULL, NULL, NULL, NULL, 1606296516, 1606296540, 1, 'Jerio Madre ', NULL, 'PT.Tambang Perkasa', 'perusahaan', '085340701452', '<p>\n	Jl. Tebet H/10 Jakarta Pusat, DKI Jakarta, Indonesia 88723</p>\n'),
(9, '182.1.177.43', 'madrejerio', '$2y$08$5CI6XIZZWR5XYwRmjews.e5o.ptZMuZEnO7.8mst07c30E8UwtYjy', NULL, 'madrejerio@gmail.com', NULL, NULL, NULL, NULL, 1606456817, 1615872859, 1, 'Jerio Madre', NULL, 'PT.Tambang Perkasa', 'perusahaan', '081389898933', 'Jl. Tebet H/10 Jakarta Pusat, DKI Jakarta, Indonesia 88723'),
(10, '36.75.40.235', 'mjerio', '$2y$08$diplVwPdTDMdb1aIzB9hQ.Lxe5S5hRqkGEDUWBS8XvpPJQXRDdoLC', NULL, 'mjerio@ymail.com', NULL, NULL, NULL, NULL, 1608569301, 1608569336, 1, 'Jerio', NULL, 'PT. Jerio Maju', 'perusahaan', '085340701452', 'Jl. P. Bandar');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 3, 1),
(3, 4, 1),
(4, 5, 1),
(5, 6, 1),
(6, 7, 1),
(7, 8, 1),
(8, 9, 1),
(9, 10, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_groups`
--
ALTER TABLE `admin_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_access`
--
ALTER TABLE `api_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_keys`
--
ALTER TABLE `api_keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_limits`
--
ALTER TABLE `api_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_logs`
--
ALTER TABLE `api_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_produk`
--
ALTER TABLE `m_produk`
  ADD PRIMARY KEY (`produk_id`);

--
-- Indexes for table `m_produk_kategori`
--
ALTER TABLE `m_produk_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `pesan_pelanggan`
--
ALTER TABLE `pesan_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `po_id_generator`
--
ALTER TABLE `po_id_generator`
  ADD PRIMARY KEY (`NEXT_ID`);

--
-- Indexes for table `t_order`
--
ALTER TABLE `t_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_groups`
--
ALTER TABLE `admin_groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `admin_users_groups`
--
ALTER TABLE `admin_users_groups`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `api_access`
--
ALTER TABLE `api_access`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_keys`
--
ALTER TABLE `api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `api_limits`
--
ALTER TABLE `api_limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_logs`
--
ALTER TABLE `api_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `m_produk`
--
ALTER TABLE `m_produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `m_produk_kategori`
--
ALTER TABLE `m_produk_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pesan_pelanggan`
--
ALTER TABLE `pesan_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `po_id_generator`
--
ALTER TABLE `po_id_generator`
  MODIFY `NEXT_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `t_order`
--
ALTER TABLE `t_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
