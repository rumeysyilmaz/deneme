-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                10.2.31-MariaDB - mariadb.org binary distribution
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- music için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `music` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `music`;

-- tablo yapısı dökülüyor music.category
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.favoritelist
CREATE TABLE IF NOT EXISTS `favoritelist` (
  `favoritelist_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `song_id` int(11) unsigned NOT NULL DEFAULT 0,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`favoritelist_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `song_id` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.nostalgy
CREATE TABLE IF NOT EXISTS `nostalgy` (
  `nostalgy_id` int(10) unsigned NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `song_id` int(10) unsigned NOT NULL DEFAULT 0,
  `singer_id` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`nostalgy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.singer
CREATE TABLE IF NOT EXISTS `singer` (
  `singer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`singer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.song
CREATE TABLE IF NOT EXISTS `song` (
  `song_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `singer_id` int(11) unsigned NOT NULL DEFAULT 0,
  `song_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `song_tag` varchar(100) COLLATE utf8_unicode_ci DEFAULT '0',
  `song_length` int(11) unsigned DEFAULT NULL,
  `song_path` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`song_id`),
  KEY `singer_id` (`singer_id`),
  CONSTRAINT `singer_id` FOREIGN KEY (`singer_id`) REFERENCES `singer` (`singer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.song_country
CREATE TABLE IF NOT EXISTS `song_country` (
  `song_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `song_country` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.song_language
CREATE TABLE IF NOT EXISTS `song_language` (
  `song_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `song_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `song_language` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`song_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor music.user_information
CREATE TABLE IF NOT EXISTS `user_information` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fist_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `password` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Veri çıktısı seçilmemişti

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
