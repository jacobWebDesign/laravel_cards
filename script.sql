-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               8.0.30 - MySQL Community Server - GPL
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Zrzut struktury bazy danych cards_db
CREATE DATABASE IF NOT EXISTS `cards_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cards_db`;

-- Zrzut struktury tabela cards_db.cards
CREATE TABLE IF NOT EXISTS `cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `card_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pin` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_date` timestamp NOT NULL,
  `expiration_date` timestamp NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cards_card_number_unique` (`card_number`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli cards_db.cards: ~11 rows (około)
INSERT INTO `cards` (`id`, `card_number`, `pin`, `activation_date`, `expiration_date`, `balance`, `created_at`, `updated_at`) VALUES
	(5, '22441234123312341231', '1234', '2024-08-23 20:50:00', '2024-08-30 20:50:00', 1234.00, '2024-08-30 18:50:06', '2024-09-01 16:36:45'),
	(6, '12341234123412311232', '1234', '2024-08-23 20:50:00', '2024-08-30 20:50:00', 1234.00, '2024-08-30 18:50:50', '2024-09-01 16:09:56'),
	(7, '12341234123412341231', '1234', '2024-08-02 20:51:00', '2024-08-31 20:51:00', 123.00, '2024-08-30 18:51:26', '2024-08-30 18:51:26'),
	(9, '32141234123412341224', '1234', '2024-08-29 20:54:00', '2024-08-31 20:54:00', 1234.00, '2024-08-30 18:54:46', '2024-08-30 18:57:29'),
	(16, '43214321432143214321', '1234', '2024-08-22 20:59:00', '2024-08-31 20:59:00', 1234.00, '2024-08-30 18:59:39', '2024-08-30 18:59:39'),
	(17, '55556666444211113333', '1234', '2024-08-08 22:24:00', '2024-08-31 22:24:00', 200.00, '2024-08-30 20:25:41', '2024-08-30 20:25:41'),
	(18, '12345678912345678911', '5432', '2024-08-07 22:39:00', '2024-08-29 22:39:00', 200.00, '2024-08-30 20:39:16', '2024-08-30 20:39:16'),
	(19, '12341234123412341222', '1234', '2024-09-03 13:46:00', '2024-09-19 13:46:00', 120.00, '2024-09-01 11:46:15', '2024-09-01 11:46:15'),
	(20, '12341234123412344234', '1234', '2024-09-20 18:24:00', '2024-09-27 18:24:00', 1.00, '2024-09-01 16:25:00', '2024-09-01 16:25:00'),
	(21, '12341234123412341232', '1223', '2024-09-12 18:25:00', '2024-09-28 18:25:00', 400.00, '2024-09-01 16:25:32', '2024-09-01 16:25:32'),
	(22, '12341234123412341240', '4567', '2024-09-06 18:25:00', '2024-09-24 18:25:00', 1233.00, '2024-09-01 16:25:52', '2024-09-01 16:48:52');

-- Zrzut struktury tabela cards_db.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- Zrzucanie danych dla tabeli cards_db.failed_jobs: ~0 rows (około)

-- Zrzut struktury tabela cards_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli cards_db.migrations: ~5 rows (około)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2024_08_29_165320_create_cards_table', 1);

-- Zrzut struktury tabela cards_db.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli cards_db.password_reset_tokens: ~0 rows (około)

-- Zrzut struktury tabela cards_db.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
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

-- Zrzucanie danych dla tabeli cards_db.personal_access_tokens: ~0 rows (około)

-- Zrzut struktury tabela cards_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Zrzucanie danych dla tabeli cards_db.users: ~1 rows (około)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Jakub', 'jakkub522@gmail.com', NULL, '$2y$12$u5godDSsU0GnsB3DDjQiS.fIeslJ6yiGWTjESFyEsIUls5SU6IRUe', 'h8LYxaB5nEZ53NLPC71QIvgZFKQJqCtQmh9PxWa0DWq7AiN1aN7vmYRB3G21', '2024-08-29 15:40:58', '2024-08-29 15:40:58');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
