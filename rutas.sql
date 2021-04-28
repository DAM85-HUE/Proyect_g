-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-04-2021 a las 18:06:41
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rutas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` decimal(11,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_name_unique` (`name`),
  KEY `articles_category_id_foreign` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id`, `code`, `name`, `sale_price`, `stock`, `description`, `active`, `category_id`, `created_at`, `updated_at`) VALUES
(1, '10001', 'tenis adidas', '150000.00', 2, 'tenis ultralivianos', 1, 6, '2021-04-19 00:59:44', '2021-04-19 00:59:44'),
(2, '654545452121.0', 'Tv smart', '20000000.00', 55, 'televisor 45\" led', 1, 5, '2021-04-19 01:04:17', '2021-04-19 01:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Connelly, Friesen and Armstrong', 'Optimized exuding extranet', 1, '2021-04-19 00:09:18', '2021-04-19 00:09:18'),
(2, 'Wisozk, Jacobi and Kutch', 'Down-sized encompassing securedline', 1, '2021-04-19 00:09:18', '2021-04-19 00:09:18'),
(3, 'Greenholt Ltd', 'Total value-added forecast', 1, '2021-04-19 00:09:18', '2021-04-19 00:09:18'),
(4, 'Halvorson-Osinski', 'Phased eco-centric parallelism', 1, '2021-04-19 00:09:18', '2021-04-19 00:09:18'),
(5, 'Kris, Jenkins and Cummerata', 'Assimilated disintermediate framework', 1, '2021-04-19 00:09:18', '2021-04-19 00:09:18'),
(6, 'zapatos deportivos', 'tenis uso deportivo', 1, '2021-04-19 00:58:41', '2021-04-19 00:58:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incomes`
--

DROP TABLE IF EXISTS `incomes`;
CREATE TABLE IF NOT EXISTS `incomes` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `provider_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ticket_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_serie` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `incomes_provider_id_foreign` (`provider_id`),
  KEY `incomes_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `income_details`
--

DROP TABLE IF EXISTS `income_details`;
CREATE TABLE IF NOT EXISTS `income_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `income_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `income_details_income_id_foreign` (`income_id`),
  KEY `income_details_article_id_foreign` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(25, '2014_10_12_100000_create_password_resets_table', 1),
(26, '2019_03_14_131529_create_categories_table', 1),
(27, '2019_03_15_161446_create_articles_table', 1),
(28, '2019_03_18_160443_create_persons_table', 1),
(29, '2019_03_18_181516_create_providers_table', 1),
(30, '2019_03_18_194727_create_roles_table', 1),
(31, '2019_03_19_194802_create_users_table', 1),
(32, '2019_04_12_144052_create_incomes_table', 1),
(33, '2019_04_12_144138_create_income_details_table', 1),
(34, '2019_05_21_153006_create_sales_table', 1),
(35, '2019_05_21_160507_create_sale_details_table', 1),
(36, '2019_05_25_113527_create_notifications_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` int(10) UNSIGNED NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_id_notifiable_type_index` (`notifiable_id`,`notifiable_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `persons_document_number_unique` (`document_number`),
  UNIQUE KEY `persons_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persons`
--

INSERT INTO `persons` (`id`, `name`, `document_type`, `document_number`, `address`, `phone_number`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Fredy gil', 'CI', '93239463', 'ibague las ferias', '3115201459', 'fredy@gmail.com', '2021-04-19 00:17:30', '2021-04-19 00:17:30'),
(2, 'jirson', 'PASS', '123456', 'jkhgjkhfghjk', '56465465', 'jirson@gmail.com', '2021-04-19 00:51:35', '2021-04-19 00:51:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

DROP TABLE IF EXISTS `providers`;
CREATE TABLE IF NOT EXISTS `providers` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `providers_id_foreign` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rolename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_rolename_unique` (`rolename`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `rolename`, `description`, `active`) VALUES
(1, 'admin', 'Administrador del sistema', 1),
(2, 'seller', 'Area: Ventas, Vendedor', 1),
(3, 'warehouser', 'Area: Compras, Almacén', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ticket_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_serie` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_number` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sales_client_id_foreign` (`client_id`),
  KEY `sales_user_id_foreign` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale_details`
--

DROP TABLE IF EXISTS `sale_details`;
CREATE TABLE IF NOT EXISTS `sale_details` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL,
  `discount` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_details_sale_id_foreign` (`sale_id`),
  KEY `sale_details_article_id_foreign` (`article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `id_role` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_id_foreign` (`id`),
  KEY `users_id_role_foreign` (`id_role`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `active`, `id_role`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'admin@admin', '$2a$05$bCUA90ykKZ2Ir8SLBe5Lgexvyc3yG6U8yqLCUXRd25LOHb8ybCzmS', 1, 1, 'RhpGVde36lBIoDVHwIWH6lcLYCn4iZ0fYUT5FPwPJj7Qs8r8p745YGAgtjr8', '2021-04-18 05:00:00', '2021-04-18 05:00:00'),
(1, 'fredy.com', '$2y$10$dOSDf8Gd/K35YHN3mVl4s.0vnNa/Vccm7Q2Hf5Y/YUNrSldS0EBo6', 1, 2, 'xmoYz0rmt4G9kFL4bg0tT552oEkgXBhqqkPPo4NN3oj0icLXuDkUjxhBzKAc', '2021-04-19 00:17:30', '2021-04-19 00:17:30'),
(2, 'jirson.com', '$2y$10$82J7HObYgMfMNOyEhawF2uzb5VhyqBWLGwbzSkUQT75kr8doyePEG', 1, 3, 'RhpGVde36lBIoDVHwIWH6lcLYCn4iZ0fYUT5FPwPJj7Qs8r8p745YGAgtjr8', '2021-04-19 00:51:36', '2021-04-19 00:51:36');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
