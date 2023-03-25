-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2023 at 01:45 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint(20) NOT NULL DEFAULT 2,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Jellysoft', '9988776655', 1, '2023-02-08-63e37f5cdfae2.png', 'jellysoftapp@gmail.com', NULL, '$2y$10$us9psklWWXCXInX7hZbT0uoG5P0yoJ63NVHJLSPUY94NHgxDl7g6i', 'MatgsMmTkJJKO1XyQQ4a0D122tyEeREAIft8FvzcCSSMHN8EKCAOqwh3B5zA', '2023-02-08 11:11:30', '2023-03-02 12:06:53', 1),
(2, 'lakshmi', '09994839839', 7, '2023-02-09-63e4d08724912.png', 'lakshmi@gmail.com', NULL, '$2y$10$vuGLVCrAEZ3Yl.ify0aax.2RbvEehx0X8c/z5edAHgfDywIaQBIxe', NULL, '2023-02-09 10:52:55', '2023-02-09 10:52:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'order manage', '[\"order_management\"]', 1, '2023-02-09 10:51:38', '2023-02-09 10:51:38'),
(8, 'Product control', '[\"product_management\"]', 1, '2023-02-09 10:52:02', '2023-02-09 10:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_amount` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 597.8, 0, NULL, '2023-03-11 06:39:24', 1698.50, 430.00, 0.00, 30.50),
(2, 1, 0, 0, '2023-02-08 11:11:30', '2023-02-08 11:11:30', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'M', '2023-02-09 09:13:23', '2023-02-09 09:49:28'),
(2, 'Pattern name:', '2023-02-09 09:49:07', '2023-02-10 06:03:04'),
(3, 'Size', '2023-02-09 09:50:08', '2023-02-10 04:23:18');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `photo`, `banner_type`, `published`, `created_at`, `updated_at`, `url`, `resource_type`, `resource_id`) VALUES
(2, '2023-02-09-63e4c8e300f9d.png', 'Main Banner', 1, '2023-02-09 10:20:19', '2023-02-09 10:20:37', 'http://jellysofthub.com/mano/ecommerce/', 'category', 1);

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'levi\'s', '2023-02-10-63e5dd183123f.png', 1, '2023-02-09 09:13:01', '2023-02-10 05:58:48'),
(2, 'Prisma', '2023-02-10-63e5dccc7563e.png', 1, '2023-02-09 09:47:57', '2023-02-10 05:57:32'),
(3, 'Twin Bird', '2023-02-09-63e4c61161afa.png', 1, '2023-02-09 09:48:08', '2023-02-09 10:08:17'),
(4, 'TECNO', '2023-02-10-63e5e374a64f9.png', 1, '2023-02-10 06:25:56', '2023-02-10 06:25:56');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '3', '2020-10-11 07:43:44', '2023-03-02 12:14:30'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"english\",\"code\":\"en\",\"status\":1}]', '2020-10-11 07:53:02', '2021-06-10 21:16:25'),
(3, 'mail_config', '{\"status\":\"1\",\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2023-03-11 10:01:49'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2023-01-10 05:51:56'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2023-01-10 05:51:56'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '9988776655', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Buy Master', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2023-03-03-6401b528073fb.png', NULL, '2023-03-03 08:51:52'),
(13, 'company_mobile_logo', '2023-03-03-6401b5281e55d.png', NULL, '2023-03-03 08:51:52'),
(14, 'terms_condition', '<p>terms and conditions</p>', NULL, '2021-06-11 01:51:36'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'buymaster@gmail.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#b65881\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2023-03-03 08:51:52'),
(19, 'company_footer_logo', '2023-03-03-6401b5282f66e.png', NULL, '2023-03-03 08:51:52'),
(20, 'company_copyright_text', 'CopyRight Jellysoft@2023', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store?hl=en_US&gl=US\"}', NULL, '2020-12-08 12:54:48'),
(23, 'company_fav_icon', '2023-03-03-6401b52840bdd.png', '2020-10-11 13:53:02', '2023-03-03 08:51:52'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'AAAAwW8Uyms:APA91bFifWIeBhu6Ac9TAljUfBgo6flKLtv2G3wXnK6Ux7Dpv1GkUdOXNx7JoNGExzZ6HWbZVCFyxZT40sDyNGWuqjG0m9qyOW0BscPJGZ9E40lZHWLtgiMo9RYJYJsa2chtnS2BG2Xz', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '15', NULL, '2023-02-10 09:33:21'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":\"1\",\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":null,\"client_secret\":null,\"status\":\"1\"},{\"login_medium\":\"facebook\",\"client_id\":null,\"client_secret\":null,\"status\":null}]', NULL, '2023-02-10 07:12:24'),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'IN', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'inhouse_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2023-01-10 05:51:56'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '10', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":null,\"color\":null,\"text_color\":null,\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2023-01-10 05:51:56'),
(70, 'refund_day_limit', '2', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, '2023-03-11 10:01:49'),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', '1/1 South Street , Anna nagar , Thoothukudi', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '1', NULL, NULL),
(77, 'loyalty_point_status', '1', NULL, NULL),
(78, 'wallet_add_refund', '1', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '10', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '10', NULL, NULL),
(81, 'loyalty_point_minimum_point', '5', NULL, NULL),
(82, 'minimum_order_limit', '1', NULL, NULL),
(83, 'product_brand', '1', NULL, NULL),
(84, 'digital_product', '1', NULL, NULL),
(85, 'delivery_boy_expected_delivery_date_message', '{\"status\":1,\"message\":null}', NULL, NULL),
(86, 'order_canceled', '{\"status\":1,\"message\":null}', NULL, NULL),
(87, 'refund-policy', '', NULL, NULL),
(88, 'return-policy', '', NULL, NULL),
(89, 'cancellation-policy', '', NULL, NULL),
(90, 'currency_symbol_position', 'left', '2023-02-08 11:15:21', '2023-02-08 10:50:31'),
(91, 'timezone', 'Asia/Calcutta', NULL, NULL),
(92, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(93, 'loader_gif', '2023-02-09-63e4d16c23058.png', NULL, NULL),
(94, 'delivery_country_restriction', '1', NULL, '2023-02-10 06:53:11'),
(95, 'delivery_zip_code_area_restriction', '0', NULL, '2023-02-10 07:07:00'),
(96, 'new_product_approval', '1', NULL, NULL),
(97, 'product_wise_shipping_cost_approval', '0', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `digital_product_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choices` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variations` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double NOT NULL DEFAULT 1,
  `tax` double NOT NULL DEFAULT 1,
  `discount` double NOT NULL DEFAULT 1,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, '2-ynHWl-1675935857', 2, 5.00, '2023-02-09 10:07:03', '2023-02-09 10:07:03'),
(7, '3-8Udcx-1676019885', 2, 5.00, '2023-02-10 11:47:00', '2023-02-10 11:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT 0,
  `priority` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(1, 'Fashion', 'fashion', '2023-03-04-6403363ca53fe.png', 0, 0, '2023-02-08 12:33:16', '2023-03-04 12:14:52', 0, 3),
(2, 'Mens', 'mens', NULL, 1, 1, '2023-02-08 12:34:13', '2023-02-10 05:55:05', 0, 0),
(4, 'Womens', 'womens', NULL, 1, 1, '2023-02-09 11:14:24', '2023-02-09 11:14:24', 0, NULL),
(5, 'Mobiles,Computers', 'mobilescomputers', '2023-03-04-640335bf5532d.png', 0, 0, '2023-02-10 05:53:41', '2023-03-04 12:12:47', 0, 2),
(6, 'Mobiles', 'mobiles', NULL, 5, 1, '2023-02-10 09:21:57', '2023-02-10 09:21:57', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 0.00, NULL, '2023-02-09 10:20:28', '2023-02-09 10:20:28'),
(2, 0, 5, 0.00, NULL, '2023-02-10 06:50:58', '2023-02-10 06:50:58'),
(3, 1, 1, 0.00, NULL, '2023-03-04 07:48:06', '2023-03-04 07:48:06'),
(4, 1, 5, 0.00, NULL, '2023-03-04 07:48:06', '2023-03-04 07:48:06'),
(5, 2, 1, 0.00, NULL, '2023-03-04 10:50:47', '2023-03-04 10:50:47'),
(6, 2, 5, 0.00, NULL, '2023-03-04 10:50:47', '2023-03-04 10:50:47');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT 0,
  `sent_by_admin` tinyint(1) DEFAULT NULL,
  `sent_by_delivery_man` tinyint(1) DEFAULT NULL,
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT 1,
  `seen_by_admin` tinyint(1) DEFAULT NULL,
  `seen_by_delivery_man` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `admin_id`, `delivery_man_id`, `message`, `sent_by_customer`, `sent_by_seller`, `sent_by_admin`, `sent_by_delivery_man`, `seen_by_customer`, `seen_by_seller`, `seen_by_admin`, `seen_by_delivery_man`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(1, 2, 1, NULL, NULL, 'hello', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-09 11:08:48', '2023-02-09 12:16:45', 1),
(2, 2, 1, NULL, NULL, 'HI hw r u', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-09 11:09:15', '2023-02-09 12:16:45', 1),
(3, 2, 1, NULL, NULL, 'hello', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-09 11:09:39', '2023-02-09 12:16:45', 1),
(4, 2, 1, NULL, NULL, 'hgkugkoiuk', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-09 11:09:50', '2023-02-09 12:16:45', 1),
(5, 2, 1, NULL, NULL, '88rt8', 0, 1, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-09 11:10:21', '2023-02-09 12:16:45', 1),
(6, 2, 1, NULL, NULL, 'lll', 1, 0, NULL, NULL, 1, 1, NULL, NULL, 1, '2023-02-09 11:10:34', '2023-02-09 12:16:45', 1),
(7, 2, NULL, NULL, 1, 'hlo', 1, 0, NULL, NULL, 0, 1, NULL, NULL, 1, '2023-02-10 04:42:56', '2023-02-10 04:42:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0,
  `feedback` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `coupon_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_bearer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inhouse',
  `seller_id` bigint(20) DEFAULT NULL COMMENT 'NULL=in-house, 0=all seller',
  `customer_id` bigint(20) DEFAULT NULL COMMENT '0 = all customer',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `added_by`, `coupon_type`, `coupon_bearer`, `seller_id`, `customer_id`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'admin', 'first_order', 'inhouse', NULL, 0, 'First Order', '38ypgsby9i', '2023-02-11', '2023-04-09', '200.00', '20.00', '20.00', 'percentage', 1, '2023-02-09 10:25:24', '2023-02-11 07:41:37', 0),
(2, 'seller', 'discount_on_purchase', 'seller', 2, 0, 'Purchase Offers', '5avj8niyth', '2023-02-10', '2023-02-18', '2000.00', '10.00', '10.00', 'percentage', 1, '2023-02-10 10:00:13', '2023-02-10 10:00:13', 2),
(3, 'admin', 'discount_on_purchase', 'inhouse', 0, 0, 'Purchase Discount', 'x47e4tma4m', '2023-02-11', '2023-02-28', '100.00', '50.00', '50.00', 'amount', 1, '2023-02-11 07:55:12', '2023-02-11 07:55:12', 3);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 0, NULL, '2023-03-03 08:50:22'),
(2, 'BDT', '৳', 'BDT', '84', 0, NULL, '2023-02-10 10:23:41'),
(3, 'Indian Rupi', '₹', 'INR', '60', 1, '2020-10-15 17:23:04', '2021-06-04 18:26:38'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2023-02-10 10:23:44'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2023-02-10 10:23:44'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 0, '2021-07-03 11:08:33', '2023-02-10 10:23:45'),
(7, 'Rand', 'R', 'ZAR', '14.26', 0, '2021-07-03 11:12:38', '2023-02-10 10:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT 0.00,
  `royality_points` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deal_of_the_days`
--

INSERT INTO `deal_of_the_days` (`id`, `title`, `product_id`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'new offer', 1, '2.00', 'percent', 1, '2023-02-09 10:28:24', '2023-02-09 10:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_notifications`
--

CREATE TABLE `deliveryman_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveryman_wallets`
--

CREATE TABLE `deliveryman_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `current_balance` decimal(50,2) NOT NULL DEFAULT 0.00,
  `cash_in_hand` decimal(50,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `total_withdraw` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deliveryman_wallets`
--

INSERT INTO `deliveryman_wallets` (`id`, `delivery_man_id`, `current_balance`, `cash_in_hand`, `pending_withdraw`, `total_withdraw`, `created_at`, `updated_at`) VALUES
(1, 1, '75.00', '7010.00', '0.00', '0.00', '2023-02-09 12:48:48', '2023-03-11 06:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_country_codes`
--

CREATE TABLE `delivery_country_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_country_codes`
--

INSERT INTO `delivery_country_codes` (`id`, `country_code`, `created_at`, `updated_at`) VALUES
(1, 'IN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `deliveryman_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_man_transactions`
--

CREATE TABLE `delivery_man_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_man_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `credit` decimal(50,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_man_transactions`
--

INSERT INTO `delivery_man_transactions` (`id`, `delivery_man_id`, `user_id`, `user_type`, `transaction_id`, `debit`, `credit`, `transaction_type`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'admin', '65f6e420-f664-45d7-b2f6-1f149d00361d', '0.00', '50.00', 'deliveryman_charge', '2023-02-09 12:48:51', '2023-02-09 12:48:51'),
(2, 1, 0, 'admin', '', '0.00', '905.00', 'cash_in_hand', '2023-02-10 12:47:24', '2023-02-10 12:47:24'),
(3, 1, 0, 'admin', 'fac8bbd1-b53b-42fc-aca6-229e49feca77', '0.00', '10.00', 'deliveryman_charge', '2023-03-11 05:51:15', '2023-03-11 05:51:15'),
(4, 1, 0, 'admin', '3967391a-bd47-4b16-ab52-1f97e841a6fc', '0.00', '15.00', 'deliveryman_charge', '2023-03-11 06:09:18', '2023-03-11 06:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `f_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_online` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `address`, `country_code`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `bank_name`, `branch`, `account_no`, `holder_name`, `is_active`, `is_online`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'Dani', 'M', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', '91', '09994839839', 'dani@gmail.com', '12345678', 'driving_license', '[\"2023-02-09-63e4b8d0f38aa.png\"]', '2023-02-09-63e4b8d100706.png', '$2y$10$YB3QNkTnQv0AV4dbbWTiXee3uIvuKS3RttRRXnK6VpeGrcr1mQ/Gy', NULL, NULL, NULL, NULL, 1, 1, '2023-02-09 09:11:45', '2023-02-09 09:11:45', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zip_codes`
--

CREATE TABLE `delivery_zip_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contacts`
--

CREATE TABLE `emergency_contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `deal_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flash_deals`
--

INSERT INTO `flash_deals` (`id`, `title`, `start_date`, `end_date`, `status`, `featured`, `background_color`, `text_color`, `banner`, `slug`, `created_at`, `updated_at`, `product_id`, `deal_type`) VALUES
(1, 'new offer', '2023-02-09', '2023-02-16', 1, 0, NULL, NULL, '2023-02-09-63e4ca977f449.png', 'new-offer', '2023-02-09 10:27:35', '2023-02-09 10:28:28', NULL, 'flash_deal');

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flash_deal_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ranking` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loyalty_point_transactions`
--

INSERT INTO `loyalty_point_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `balance`, `reference`, `transaction_type`, `created_at`, `updated_at`) VALUES
(1, 3, 'e7bcb4fd-c504-4b00-847d-7dd9c6cfb932', '0.000', '0.000', '0.000', '100007', 'order_place', '2023-02-10 09:01:40', '2023-02-10 09:01:40'),
(2, 3, '5cae132d-d8f9-4b05-86d5-e29416636089', '0.000', '0.000', '0.000', '100006', 'order_place', '2023-02-10 09:03:16', '2023-02-10 09:03:16'),
(3, 2, '5aeefbe0-634f-4190-8228-e1fbad0cf7ea', '0.000', '0.000', '0.000', '100005', 'order_place', '2023-02-10 09:46:13', '2023-02-10 09:46:13'),
(4, 2, '2ee34817-cf7a-4965-aeb7-8cef9a0f4f96', '0.000', '0.000', '0.000', '100010', 'order_place', '2023-02-11 05:59:44', '2023-02-11 05:59:44'),
(5, 4, 'abd7c54d-cf25-44ba-82cc-906cd451cc0c', '149.000', '0.000', '149.000', '100013', 'order_place', '2023-02-11 08:05:37', '2023-02-11 08:05:37'),
(6, 4, '6d2e346b-6740-4af6-a085-f992450ab5d8', '0.000', '14.000', '135.000', 'ef3ff951-7763-45f0-8f4e-dac4f2b8eb7d', 'point_to_wallet', '2023-02-11 08:05:59', '2023-02-11 08:05:59'),
(7, 4, 'e79691ae-a3fe-4b7e-8932-d8fd2d5ae29b', '0.000', '135.000', '0.000', '5bdc6f54-4ab7-4c93-824d-a1a905e9f9a0', 'point_to_wallet', '2023-02-11 08:06:51', '2023-02-11 08:06:51'),
(8, 4, 'ed18742f-4e0c-4615-9481-04fd86c4f149', '84.000', '0.000', '84.000', '100015', 'order_place', '2023-02-13 06:24:34', '2023-02-13 06:24:34'),
(9, 3, '0f1cd926-c126-4f49-88c6-aec7cc7ab424', '650.000', '0.000', '650.000', '100008', 'order_place', '2023-02-13 06:31:51', '2023-02-13 06:31:51'),
(10, 2, 'e3a0e5ba-f7ba-4844-b824-f2db4783f0d2', '20.000', '0.000', '20.000', '100016', 'order_place', '2023-03-11 05:51:15', '2023-03-11 05:51:15'),
(11, 2, '52ebdeb9-67a8-40d3-863a-bb2c9c8b8991', '20.000', '0.000', '40.000', '100017', 'order_place', '2023-03-11 06:09:18', '2023-03-11 06:09:18'),
(12, 2, 'a212e399-b7b9-44fe-bf03-3be565a6e1be', '20.000', '0.000', '60.000', '100020', 'order_place', '2023-03-11 06:39:23', '2023-03-11 06:39:23');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2022_04_15_235820_add_provider', 66),
(171, '2022_07_21_101659_add_code_to_products_table', 66),
(172, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(173, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(174, '2022_08_11_172839_add_product_type_and_digital_product_type_and_digital_file_ready_to_products', 67),
(175, '2022_08_11_173941_add_product_type_and_digital_product_type_and_digital_file_to_order_details', 67),
(176, '2022_08_20_094225_add_product_type_and_digital_product_type_and_digital_file_ready_to_carts_table', 67),
(177, '2022_10_04_160234_add_banking_columns_to_delivery_men_table', 68),
(178, '2022_10_04_161339_create_deliveryman_wallets_table', 68),
(179, '2022_10_04_184506_add_deliverymanid_column_to_withdraw_requests_table', 68),
(180, '2022_10_11_103011_add_deliverymans_columns_to_chattings_table', 68),
(181, '2022_10_11_144902_add_deliverman_id_cloumn_to_reviews_table', 68),
(182, '2022_10_17_114744_create_order_status_histories_table', 68),
(183, '2022_10_17_120840_create_order_expected_delivery_histories_table', 68),
(184, '2022_10_18_084245_add_deliveryman_charge_and_expected_delivery_date', 68),
(185, '2022_10_18_130938_create_delivery_zip_codes_table', 68),
(186, '2022_10_18_130956_create_delivery_country_codes_table', 68),
(187, '2022_10_20_164712_create_delivery_man_transactions_table', 68),
(188, '2022_10_27_145604_create_emergency_contacts_table', 68),
(189, '2022_10_29_182930_add_is_pause_cause_to_orders_table', 68),
(190, '2022_10_31_150604_add_address_phone_country_code_column_to_delivery_men_table', 68),
(191, '2022_11_05_185726_add_order_id_to_reviews_table', 68),
(192, '2022_11_07_190749_create_deliveryman_notifications_table', 68),
(193, '2022_11_08_132745_change_transaction_note_type_to_withdraw_requests_table', 68),
(194, '2022_11_10_193747_chenge_order_amount_seller_amount_admin_commission_delivery_charge_tax_toorder_transactions_table', 68),
(195, '2022_12_17_035723_few_field_add_to_coupons_table', 69),
(196, '2022_12_26_231606_add_coupon_discount_bearer_and_admin_commission_to_orders', 69),
(197, '2023_01_04_003034_alter_billing_addresses_change_zip', 69),
(198, '2023_01_05_121600_change_id_to_transactions_table', 69);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_count` int(11) NOT NULL DEFAULT 0,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `description`, `notification_count`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'new offer', 'new collections', 3, '2023-02-09-63e4cb07efc58.png', 1, '2023-02-09 10:29:27', '2023-02-11 08:01:10'),
(2, 'new', 'hi hlo hp', 1, '2023-02-11-63e74b3f4ae1e.png', 1, '2023-02-11 08:01:04', '2023-02-11 08:01:04'),
(3, 'purchase coupon', '548663hygugiy', 1, '2023-02-13-63e9bb6c21abf.png', 1, '2023-02-13 04:24:12', '2023-02-13 04:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT 0,
  `admin_commission` decimal(8,2) NOT NULL DEFAULT 0.00,
  `is_pause` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cause` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT 0,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_discount_bearer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inhouse',
  `shipping_method_id` bigint(20) NOT NULL DEFAULT 0,
  `shipping_cost` double(8,2) NOT NULL DEFAULT 0.00,
  `order_group_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seller_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `deliveryman_charge` double NOT NULL DEFAULT 0,
  `expected_delivery_date` date DEFAULT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_address_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT 0.00,
  `extra_discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `admin_commission`, `is_pause`, `cause`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `coupon_discount_bearer`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `deliveryman_charge`, `expected_delivery_date`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`) VALUES
(100001, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 905, '0.00', '0', NULL, '1', '2023-02-09 11:39:20', '2023-02-09 12:48:48', 0, NULL, '0', 'inhouse', 2, 5.00, '1234-1Y3Hd-1675942760', '746892', 1, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, 50, '2023-02-09', NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100002, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 633.3, '0.00', '0', NULL, '1', '2023-02-10 04:29:05', '2023-02-10 05:10:17', 0, NULL, '0', 'inhouse', 2, 5.00, '3556-VV8nG-1676003345', '826072', 1, 'admin', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100003, '0', 'customer', 'paid', 'delivered', 'cash', NULL, 669.5, '0.00', '0', NULL, NULL, '2023-02-10 05:07:14', '2023-02-10 05:07:14', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 0.00, NULL, 1, NULL, NULL, NULL, NULL),
(100004, '0', 'customer', 'paid', 'delivered', 'card', NULL, 641.7, '0.00', '0', NULL, NULL, '2023-02-10 05:08:37', '2023-02-10 05:08:37', 0, NULL, NULL, 'inhouse', 0, 0.00, 'def-order-group', '0', 1, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, 'POS', 10.00, 'percent', 1, NULL, NULL, NULL, NULL),
(100005, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 1225, '0.00', '0', NULL, '1', '2023-02-10 05:32:16', '2023-02-10 09:46:13', 0, NULL, '0', 'inhouse', 2, 5.00, '8902-J4QOW-1676007136', '323600', 1, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100006, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 740, '32.00', '0', NULL, '3', '2023-02-10 08:51:30', '2023-02-10 09:03:16', 0, NULL, '0', 'inhouse', 9, 100.00, '8894-rcQlz-1676019090', '630386', 1, 'seller', '{\"id\":3,\"customer_id\":3,\"contact_person_name\":\"jeyanthi\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T07:07:33.000000Z\",\"updated_at\":\"2023-02-10T07:07:33.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100007, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 1700, '80.00', '0', NULL, '3', '2023-02-10 09:00:36', '2023-02-10 09:01:40', 0, NULL, '0', 'inhouse', 9, 100.00, '1720-S2eT4-1676019636', '420441', 1, 'seller', '{\"id\":3,\"customer_id\":3,\"contact_person_name\":\"jeyanthi\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T07:07:33.000000Z\",\"updated_at\":\"2023-02-10T07:07:33.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 3, '{\"id\":3,\"customer_id\":3,\"contact_person_name\":\"jeyanthi\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T07:07:33.000000Z\",\"updated_at\":\"2023-02-10T07:07:33.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100008, '3', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 6505, '975.00', '0', NULL, '3', '2023-02-10 12:39:14', '2023-02-13 06:31:51', 0, NULL, '0', 'inhouse', 2, 5.00, '1611-rPzBk-1676032754', '149924', 2, 'seller', '{\"id\":3,\"customer_id\":3,\"contact_person_name\":\"jeyanthi\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T07:07:33.000000Z\",\"updated_at\":\"2023-02-10T07:07:33.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, 0, '2023-02-23', NULL, 3, '{\"id\":3,\"customer_id\":3,\"contact_person_name\":\"jeyanthi\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T07:07:33.000000Z\",\"updated_at\":\"2023-02-10T07:07:33.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100009, '2', 'customer', 'unpaid', 'processing', 'cash_on_delivery', '', 420, '48.00', '0', NULL, '2', '2023-02-11 05:39:06', '2023-02-13 04:30:55', 0, NULL, '0', 'inhouse', 9, 100.00, '5828-PWRTT-1676093946', '918517', 1, 'seller', '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', 1, 50, '2023-02-25', NULL, 2, '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100010, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 420, '48.00', '0', NULL, '2', '2023-02-11 05:57:15', '2023-02-11 05:59:44', 0, NULL, '0', 'inhouse', 9, 100.00, '8413-VzqIf-1676095035', '995670', 1, 'seller', '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', NULL, 0, NULL, NULL, 2, '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100011, '2', 'customer', 'paid', 'out_for_delivery', 'cash_on_delivery', '', 9100, '1.00', '0', NULL, '2', '2023-02-11 05:57:15', '2023-03-16 08:52:46', 0, NULL, '0', 'inhouse', 9, 100.00, '8413-VzqIf-1676095035', '430149', 2, 'seller', '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', NULL, 0, '2023-02-18', NULL, 2, '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100012, '2', 'customer', 'unpaid', 'canceled', 'cash_on_delivery', '', 940, '114.00', '0', NULL, '2', '2023-02-11 06:53:34', '2023-02-11 06:55:44', 0, NULL, '0', 'inhouse', 9, 100.00, '3962-S9Yvm-1676098414', '628765', 1, 'seller', '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', NULL, 0, '2023-02-14', NULL, 2, '{\"id\":2,\"customer_id\":2,\"contact_person_name\":\"Mukesh\",\"address_type\":\"office\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-10T05:02:18.000000Z\",\"updated_at\":\"2023-02-10T05:02:18.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":null,\"longitude\":null,\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100013, '4', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 1495, '210.00', '0', NULL, '4', '2023-02-11 08:05:09', '2023-02-11 08:05:34', 50, 'coupon_discount', 'x47e4tma4m', 'inhouse', 2, 5.00, '6908-lzSuN-1676102709', '334485', 1, 'seller', '{\"id\":4,\"customer_id\":4,\"contact_person_name\":\"Rosy\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-11T08:05:06.000000Z\",\"updated_at\":\"2023-02-11T08:05:06.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100014, '4', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 645, '96.00', '0', NULL, '4', '2023-02-13 04:45:15', '2023-02-13 04:45:31', 0, NULL, '0', 'inhouse', 2, 5.00, '9697-UIZLb-1676263515', '434071', 1, 'seller', '{\"id\":4,\"customer_id\":4,\"contact_person_name\":\"Rosy\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-11T08:05:06.000000Z\",\"updated_at\":\"2023-02-11T08:05:06.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 4, '{\"id\":4,\"customer_id\":4,\"contact_person_name\":\"Rosy\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-11T08:05:06.000000Z\",\"updated_at\":\"2023-02-11T08:05:06.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100015, '4', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 845, '114.00', '0', NULL, '4', '2023-02-13 06:19:47', '2023-02-13 06:24:34', 0, NULL, '0', 'inhouse', 2, 5.00, '8448-zv23m-1676269187', '956700', 1, 'seller', '{\"id\":4,\"customer_id\":4,\"contact_person_name\":\"Rosy\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-11T08:05:06.000000Z\",\"updated_at\":\"2023-02-11T08:05:06.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 4, '{\"id\":4,\"customer_id\":4,\"contact_person_name\":\"Rosy\",\"address_type\":\"permanent\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-11T08:05:06.000000Z\",\"updated_at\":\"2023-02-11T08:05:06.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'third_party_delivery', 'dani', '456123'),
(100016, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 205, '30.00', '0', NULL, '1', '2023-03-11 05:46:41', '2023-03-11 05:51:13', 0, NULL, '0', 'inhouse', 2, 5.00, '4213-HFG3k-1678513601', '310725', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, 10, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100017, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 300, '20.00', '0', NULL, '1', '2023-03-11 06:05:34', '2023-03-11 06:09:18', 0, NULL, '0', 'inhouse', 9, 100.00, '2248-J20vE-1678514734', '625802', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, 15, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100018, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:11:45', '2023-03-11 06:11:58', 0, NULL, '0', 'inhouse', 2, 5.00, '2456-fXaeL-1678515105', '566648', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100019, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:23:47', '2023-03-11 06:24:02', 0, NULL, '0', 'inhouse', 2, 5.00, '7338-C5yXq-1678515826', '625181', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100020, '2', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:31:08', '2023-03-11 06:39:57', 0, NULL, '0', 'inhouse', 2, 5.00, '7698-ButAu-1678516268', '163683', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 1, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', 'self_delivery', NULL, NULL),
(100021, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:42:56', '2023-03-11 06:43:21', 0, NULL, '0', 'inhouse', 2, 5.00, '4449-GDCze-1678516976', '814722', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100022, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:44:57', '2023-03-11 06:45:45', 0, NULL, '0', 'inhouse', 2, 5.00, '1031-xO1Kw-1678517097', '105148', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100023, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:47:37', '2023-03-11 06:48:05', 0, NULL, '0', 'inhouse', 2, 5.00, '2884-8CrtY-1678517257', '634019', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100024, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 06:49:44', '2023-03-11 06:50:14', 0, NULL, '0', 'inhouse', 2, 5.00, '1511-rBmR9-1678517384', '694771', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL),
(100025, '2', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 205, '20.00', '0', NULL, '1', '2023-03-11 07:22:50', '2023-03-11 07:22:50', 0, NULL, '0', 'inhouse', 2, 5.00, '8879-4c63T-1678519370', '384757', 3, 'seller', '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, 0, NULL, NULL, 1, '{\"id\":1,\"customer_id\":2,\"contact_person_name\":\"swathi\",\"address_type\":\"home\",\"address\":\"2nd Floor, Uthradam Building, Near MRF Tyres, Pana\",\"city\":\"Thiruvananthapuram\",\"zip\":\"695001\",\"phone\":\"09994839839\",\"created_at\":\"2023-02-09T11:39:09.000000Z\",\"updated_at\":\"2023-02-09T11:39:09.000000Z\",\"state\":null,\"country\":\"India\",\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `digital_file_after_sell` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `tax` double NOT NULL DEFAULT 0,
  `discount` double NOT NULL DEFAULT 0,
  `delivery_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT 1,
  `refund_request` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 3, 1, NULL, '{\"id\":3,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Kurties For Womens\",\"slug\":\"kurties-for-womens-7KFXKH\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4d63fcd922.png\\\",\\\"2023-02-09-63e4d63fce6cb.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4d63fce72e.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF1493\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"DeepPink\\\",\\\"price\\\":900,\\\"sku\\\":\\\"KFW-DeepPink\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":900,\"purchase_price\":800,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":5,\"minimum_order_qty\":1,\"details\":\"<p>Name&nbsp;:&nbsp;Women&#39;s Printed Full-Stitched Crepe Straight Kurti(Combo Pack Of 3)<\\/p>\\r\\n\\r\\n<p>Fabric&nbsp;:&nbsp;Crepe<\\/p>\\r\\n\\r\\n<p>Sleeve Length&nbsp;:&nbsp;Three-Quarter Sleeves<\\/p>\\r\\n\\r\\n<p>Pattern&nbsp;:&nbsp;Printed<\\/p>\\r\\n\\r\\n<p>Combo of&nbsp;:&nbsp;Combo of 3<\\/p>\\r\\n\\r\\n<p>Sizes&nbsp;:&nbsp;<\\/p>\\r\\n\\r\\n<p>S (Bust Size&nbsp;:&nbsp;36 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>M (Bust Size&nbsp;:&nbsp;38 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>L (Bust Size&nbsp;:&nbsp;40 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>XL (Bust Size&nbsp;:&nbsp;42 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>XXL (Bust Size&nbsp;:&nbsp;44 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Country of Origin&nbsp;:&nbsp;India<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T11:17:19.000000Z\",\"updated_at\":\"2023-02-09T11:17:39.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123458\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 900, 90, 90, 'delivered', 'unpaid', '2023-02-09 11:39:20', '2023-02-10 04:56:18', NULL, 'DeepPink', '{\"color\":\"DeepPink\"}', 'discount_on_product', 1, 4),
(2, 100002, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Shirt white color full hand\",\"slug\":\"shirt-white-color-full-hand-gvQmc3\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4bd4296500.png\\\",\\\"2023-02-09-63e4be67700af.png\\\",\\\"2023-02-09-63e4be6a95ab5.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4be6e3e206.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFFAF0\\\",\\\"#FFFFFF\\\",\\\"#F5F5F5\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\",\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"L\\\",\\\"options\\\":[\\\"L\\\",\\\"  L1\\\"]},{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"M\\\",\\\"options\\\":[\\\"M\\\",\\\"  m1\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"FloralWhite-L-M\\\",\\\"price\\\":610,\\\"sku\\\":\\\"Swcfh-FloralWhite-L-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L-m1\\\",\\\"price\\\":620,\\\"sku\\\":\\\"Swcfh-FloralWhite-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L1-M\\\",\\\"price\\\":630,\\\"sku\\\":\\\"Swcfh-FloralWhite-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L1-m1\\\",\\\"price\\\":640,\\\"sku\\\":\\\"Swcfh-FloralWhite-L1-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L-M\\\",\\\"price\\\":650,\\\"sku\\\":\\\"Swcfh-White-L-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L-m1\\\",\\\"price\\\":660,\\\"sku\\\":\\\"Swcfh-White-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L1-M\\\",\\\"price\\\":670,\\\"sku\\\":\\\"Swcfh-White-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L1-m1\\\",\\\"price\\\":680,\\\"sku\\\":\\\"Swcfh-White-L1-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L-M\\\",\\\"price\\\":690,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L-m1\\\",\\\"price\\\":691,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L1-M\\\",\\\"price\\\":692,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L1-m1\\\",\\\"price\\\":693,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L1-m1\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":600,\"purchase_price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":12,\"minimum_order_qty\":1,\"details\":\"<p>Name : Men Casual Shirt<\\/p>\\r\\n\\r\\n<p>Fabric : Cotton<\\/p>\\r\\n\\r\\n<p>Sleeve Length : Long Sleeves<\\/p>\\r\\n\\r\\n<p>Pattern : Solid<\\/p>\\r\\n\\r\\n<p>Net Quantity (N) : 1<\\/p>\\r\\n\\r\\n<p>Sizes :&nbsp;<\\/p>\\r\\n\\r\\n<p>M (Chest Size : 38 in, Length Size: 28 in)<\\/p>\\r\\n\\r\\n<p>L (Chest Siz<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T09:30:42.000000Z\",\"updated_at\":\"2023-02-09T10:17:38.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Today Fashion\",\"meta_description\":\"Name : Men Casual Shirt\\r\\n\\r\\nFabric : Cotton\\r\\n\\r\\nSleeve Length : Long Sleeves\\r\\n\\r\\nPattern : Solid\\r\\n\\r\\nNet Quantity (N) : 1\\r\\n\\r\\nSizes : \\r\\n\\r\\nM (Chest Size : 38 in, Length Size: 28 in)\\r\\n\\r\\nL (Chest Siz\",\"meta_image\":\"2023-02-09-63e4bd42975f2.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":40,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 610, 30.5, 12.2, 'delivered', 'unpaid', '2023-02-10 04:29:05', '2023-02-10 05:10:17', NULL, 'FloralWhite-L-M', '{\"color\":\"FloralWhite\",\"L\":\"L\",\"M\":\"M\"}', 'discount_on_product', 1, 0),
(3, 100003, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Shirt white color full hand\",\"slug\":\"shirt-white-color-full-hand-gvQmc3\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4bd4296500.png\\\",\\\"2023-02-09-63e4be67700af.png\\\",\\\"2023-02-09-63e4be6a95ab5.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4be6e3e206.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFFAF0\\\",\\\"#FFFFFF\\\",\\\"#F5F5F5\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\",\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"L\\\",\\\"options\\\":[\\\"L\\\",\\\"  L1\\\"]},{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"M\\\",\\\"options\\\":[\\\"M\\\",\\\"  m1\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"FloralWhite-L-M\\\",\\\"price\\\":610,\\\"sku\\\":\\\"Swcfh-FloralWhite-L-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"FloralWhite-L-m1\\\",\\\"price\\\":620,\\\"sku\\\":\\\"Swcfh-FloralWhite-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L1-M\\\",\\\"price\\\":630,\\\"sku\\\":\\\"Swcfh-FloralWhite-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L1-m1\\\",\\\"price\\\":640,\\\"sku\\\":\\\"Swcfh-FloralWhite-L1-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L-M\\\",\\\"price\\\":650,\\\"sku\\\":\\\"Swcfh-White-L-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L-m1\\\",\\\"price\\\":660,\\\"sku\\\":\\\"Swcfh-White-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L1-M\\\",\\\"price\\\":670,\\\"sku\\\":\\\"Swcfh-White-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L1-m1\\\",\\\"price\\\":680,\\\"sku\\\":\\\"Swcfh-White-L1-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L-M\\\",\\\"price\\\":690,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L-m1\\\",\\\"price\\\":691,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L1-M\\\",\\\"price\\\":692,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L1-m1\\\",\\\"price\\\":693,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L1-m1\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":600,\"purchase_price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":11,\"minimum_order_qty\":1,\"details\":\"<p>Name : Men Casual Shirt<\\/p>\\r\\n\\r\\n<p>Fabric : Cotton<\\/p>\\r\\n\\r\\n<p>Sleeve Length : Long Sleeves<\\/p>\\r\\n\\r\\n<p>Pattern : Solid<\\/p>\\r\\n\\r\\n<p>Net Quantity (N) : 1<\\/p>\\r\\n\\r\\n<p>Sizes :&nbsp;<\\/p>\\r\\n\\r\\n<p>M (Chest Size : 38 in, Length Size: 28 in)<\\/p>\\r\\n\\r\\n<p>L (Chest Siz<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T09:30:42.000000Z\",\"updated_at\":\"2023-02-10T04:29:05.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Today Fashion\",\"meta_description\":\"Name : Men Casual Shirt\\r\\n\\r\\nFabric : Cotton\\r\\n\\r\\nSleeve Length : Long Sleeves\\r\\n\\r\\nPattern : Solid\\r\\n\\r\\nNet Quantity (N) : 1\\r\\n\\r\\nSizes : \\r\\n\\r\\nM (Chest Size : 38 in, Length Size: 28 in)\\r\\n\\r\\nL (Chest Siz\",\"meta_image\":\"2023-02-09-63e4bd42975f2.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":40,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 650, 32.5, 13, 'delivered', 'paid', '2023-02-10 05:07:14', '2023-02-10 05:07:14', NULL, 'White-L-M', '{\"color\":\"White\",\"L\":\"L\",\"M\":\"M\"}', 'discount_on_product', 1, 0),
(4, 100004, 1, 1, NULL, '{\"id\":1,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"Shirt white color full hand\",\"slug\":\"shirt-white-color-full-hand-gvQmc3\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4bd4296500.png\\\",\\\"2023-02-09-63e4be67700af.png\\\",\\\"2023-02-09-63e4be6a95ab5.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4be6e3e206.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FFFAF0\\\",\\\"#FFFFFF\\\",\\\"#F5F5F5\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\",\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"L\\\",\\\"options\\\":[\\\"L\\\",\\\"  L1\\\"]},{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"M\\\",\\\"options\\\":[\\\"M\\\",\\\"  m1\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"FloralWhite-L-M\\\",\\\"price\\\":610,\\\"sku\\\":\\\"Swcfh-FloralWhite-L-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"FloralWhite-L-m1\\\",\\\"price\\\":620,\\\"sku\\\":\\\"Swcfh-FloralWhite-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L1-M\\\",\\\"price\\\":630,\\\"sku\\\":\\\"Swcfh-FloralWhite-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"FloralWhite-L1-m1\\\",\\\"price\\\":640,\\\"sku\\\":\\\"Swcfh-FloralWhite-L1-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L-M\\\",\\\"price\\\":650,\\\"sku\\\":\\\"Swcfh-White-L-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"White-L-m1\\\",\\\"price\\\":660,\\\"sku\\\":\\\"Swcfh-White-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L1-M\\\",\\\"price\\\":670,\\\"sku\\\":\\\"Swcfh-White-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"White-L1-m1\\\",\\\"price\\\":680,\\\"sku\\\":\\\"Swcfh-White-L1-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L-M\\\",\\\"price\\\":690,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L-m1\\\",\\\"price\\\":691,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L-m1\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L1-M\\\",\\\"price\\\":692,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L1-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"WhiteSmoke-L1-m1\\\",\\\"price\\\":693,\\\"sku\\\":\\\"Swcfh-WhiteSmoke-L1-m1\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":600,\"purchase_price\":400,\"tax\":5,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"percent\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<p>Name : Men Casual Shirt<\\/p>\\r\\n\\r\\n<p>Fabric : Cotton<\\/p>\\r\\n\\r\\n<p>Sleeve Length : Long Sleeves<\\/p>\\r\\n\\r\\n<p>Pattern : Solid<\\/p>\\r\\n\\r\\n<p>Net Quantity (N) : 1<\\/p>\\r\\n\\r\\n<p>Sizes :&nbsp;<\\/p>\\r\\n\\r\\n<p>M (Chest Size : 38 in, Length Size: 28 in)<\\/p>\\r\\n\\r\\n<p>L (Chest Siz<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T09:30:42.000000Z\",\"updated_at\":\"2023-02-10T05:07:14.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Today Fashion\",\"meta_description\":\"Name : Men Casual Shirt\\r\\n\\r\\nFabric : Cotton\\r\\n\\r\\nSleeve Length : Long Sleeves\\r\\n\\r\\nPattern : Solid\\r\\n\\r\\nNet Quantity (N) : 1\\r\\n\\r\\nSizes : \\r\\n\\r\\nM (Chest Size : 38 in, Length Size: 28 in)\\r\\n\\r\\nL (Chest Siz\",\"meta_image\":\"2023-02-09-63e4bd42975f2.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":40,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123456\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 690, 34.5, 13.8, 'delivered', 'paid', '2023-02-10 05:08:37', '2023-02-10 05:08:37', NULL, 'WhiteSmoke-L-M', '{\"color\":\"WhiteSmoke\",\"L\":\"L\",\"M\":\"M\"}', 'discount_on_product', 1, 0),
(5, 100005, 3, 1, NULL, '{\"id\":3,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Kurties For Womens\",\"slug\":\"kurties-for-womens-7KFXKH\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4d63fcd922.png\\\",\\\"2023-02-09-63e4d63fce6cb.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4d63fce72e.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF1493\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"DeepPink\\\",\\\"price\\\":900,\\\"sku\\\":\\\"KFW-DeepPink\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":900,\"purchase_price\":800,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":4,\"minimum_order_qty\":1,\"details\":\"<p>Name&nbsp;:&nbsp;Women&#39;s Printed Full-Stitched Crepe Straight Kurti(Combo Pack Of 3)<\\/p>\\r\\n\\r\\n<p>Fabric&nbsp;:&nbsp;Crepe<\\/p>\\r\\n\\r\\n<p>Sleeve Length&nbsp;:&nbsp;Three-Quarter Sleeves<\\/p>\\r\\n\\r\\n<p>Pattern&nbsp;:&nbsp;Printed<\\/p>\\r\\n\\r\\n<p>Combo of&nbsp;:&nbsp;Combo of 3<\\/p>\\r\\n\\r\\n<p>Sizes&nbsp;:&nbsp;<\\/p>\\r\\n\\r\\n<p>S (Bust Size&nbsp;:&nbsp;36 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>M (Bust Size&nbsp;:&nbsp;38 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>L (Bust Size&nbsp;:&nbsp;40 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>XL (Bust Size&nbsp;:&nbsp;42 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>XXL (Bust Size&nbsp;:&nbsp;44 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Country of Origin&nbsp;:&nbsp;India<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T11:17:19.000000Z\",\"updated_at\":\"2023-02-10T05:24:09.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123458\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":2,\"product_id\":3,\"customer_id\":2,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"good one\",\"attachment\":\"[\\\"2023-02-10-63e5c54024f52.png\\\"]\",\"rating\":4,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T04:17:04.000000Z\",\"updated_at\":\"2023-02-10T04:17:04.000000Z\"}]}', 1, 900, 90, 90, 'delivered', 'unpaid', '2023-02-10 05:32:16', '2023-02-10 09:46:13', NULL, 'DeepPink', '{\"color\":\"DeepPink\"}', 'discount_on_product', 1, 0),
(6, 100005, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"S\\\",\\\"M\\\",\\\"L\\\",\\\"XL\\\",\\\"XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":18,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-10T05:24:04.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 320, 0, 0, 'delivered', 'unpaid', '2023-02-10 05:32:16', '2023-02-10 09:46:13', NULL, 'Black-M', '{\"color\":\"Black\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(7, 100006, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"S\\\",\\\"M\\\",\\\"L\\\",\\\"XL\\\",\\\"XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":17,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-10T05:32:16.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 320, 0, 0, 'delivered', 'unpaid', '2023-02-10 08:51:30', '2023-02-10 11:45:58', NULL, 'Black-S', '{\"color\":\"Black\",\"Size\":\"S\"}', 'discount_on_product', 1, 4),
(8, 100006, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"S\\\",\\\"M\\\",\\\"L\\\",\\\"XL\\\",\\\"XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":16,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-10T08:51:30.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 320, 0, 0, 'delivered', 'unpaid', '2023-02-10 08:51:30', '2023-02-10 09:03:16', NULL, 'Black-L', '{\"color\":\"Black\",\"Size\":\"L\"}', 'discount_on_product', 1, 0),
(9, 100007, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"  S\\\",\\\"  M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":90,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-10T08:54:57.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 5, 320, 0, 0, 'delivered', 'unpaid', '2023-02-10 09:00:36', '2023-02-10 09:01:40', NULL, 'DeepSkyBlue-M', '{\"color\":\"DeepSkyBlue\",\"Size\":\"M\"}', 'discount_on_product', 1, 0),
(10, 100008, 8, 2, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Tecno Spark 9 (Sky Mirror, 4GB RAM,64GB Storage) | 7GB Expandable RAM | Helio G3\",\"slug\":\"tecno-spark-9-sky-mirror-4gb-ram64gb-storage-7gb-expandable-ram-helio-g3-tSPEv8\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"6\\\",\\\"position\\\":2}]\",\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e6119309056.png\\\",\\\"2023-02-10-63e61194a29b1.png\\\",\\\"2023-02-10-63e61197301be.png\\\",\\\"2023-02-10-63e61197a19e9.png\\\"]\",\"thumbnail\":\"2023-02-10-63e6119a27930.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"6+128GB STORAGE\\\",\\\"4+32GB STORAGE\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DeepSkyBlue-6+128GBSTORAGE\\\",\\\"price\\\":6500,\\\"sku\\\":\\\"-DeepSkyBlue-6+128GBSTORAGE\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DeepSkyBlue-4+32GBSTORAGE\\\",\\\"price\\\":9000,\\\"sku\\\":\\\"-DeepSkyBlue-4+32GBSTORAGE\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":6500,\"purchase_price\":5000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":2,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Upto 7GB larger RAM (4GB LPDDR4x + 3GB Virtual RAM) with the help of memory fusion technology | 37% improvement in apps switching | 64GB eMCP ROM | No support for Africa&#39;s frequency bands | Warranty In India Only<\\/li>\\r\\n\\t<li>90Hz Refresh Rate | 180Hz Touch Sampling Rate | 6.6&quot; HD+ Dot Notch display | 269PPI Pixel Density for richer colors<\\/li>\\r\\n\\t<li>13MP rear Dual Camera and Dual Flashlight | 8MP Selfie camera with front flash| Multiple AI modes like Portrait, HDR, Smile Shot, AI Scene Detection | Shoot Clear 1080P Time-lapse, Slow Motion, Video Bokeh videos<\\/li>\\r\\n\\t<li>MediaTek Helio G37 Gaming Processor | 64-bit 2.3GHz Max CPU Frequency | HiOS 8.6 based on Android 12 | DTS Powered Loud Speaker | Soplay 2.0 for Music composing<\\/li>\\r\\n\\t<li>5000mAh battery with up to 30 days long standby | 25 hours Video playback or 26 hours Calling or 133 hours music playback | Ultra Battery saver mode for extreme backup<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T09:42:52.000000Z\",\"updated_at\":\"2023-02-10T09:45:38.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"94751623\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 6500, 0, 0, 'delivered', 'unpaid', '2023-02-10 12:39:14', '2023-02-13 06:31:51', NULL, 'DeepSkyBlue-6+128GBSTORAGE', '{\"color\":\"DeepSkyBlue\",\"Size\":\"6+128GB STORAGE\"}', 'discount_on_product', 1, 0),
(11, 100009, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"  S\\\",\\\"  M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":85,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-10T09:45:39.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":3,\"product_id\":4,\"customer_id\":3,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"very nice product.....love it\",\"attachment\":\"[\\\"2023-02-10-63e62cb811d2f.png\\\"]\",\"rating\":1,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T11:38:33.000000Z\",\"updated_at\":\"2023-02-10T11:38:33.000000Z\"}]}', 1, 320, 0, 0, 'pending', 'unpaid', '2023-02-11 05:39:06', '2023-02-11 05:39:06', NULL, 'Black-XS', '{\"color\":\"Black\",\"Size\":\"XS\"}', 'discount_on_product', 1, 0),
(12, 100010, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"  S\\\",\\\"  M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":84,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-11T05:39:06.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":3,\"product_id\":4,\"customer_id\":3,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"very nice product.....love it\",\"attachment\":\"[\\\"2023-02-10-63e62cb811d2f.png\\\"]\",\"rating\":1,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T11:38:33.000000Z\",\"updated_at\":\"2023-02-10T11:38:33.000000Z\"}]}', 1, 320, 0, 0, 'delivered', 'unpaid', '2023-02-11 05:57:15', '2023-02-11 05:59:44', NULL, 'DarkGoldenrod-XS', '{\"color\":\"DarkGoldenrod\",\"Size\":\"XS\"}', 'discount_on_product', 1, 0);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `digital_file_after_sell`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(13, 100011, 8, 2, NULL, '{\"id\":8,\"added_by\":\"seller\",\"user_id\":2,\"name\":\"Tecno Spark 9 (Sky Mirror, 4GB RAM,64GB Storage) | 7GB Expandable RAM | Helio G3\",\"slug\":\"tecno-spark-9-sky-mirror-4gb-ram64gb-storage-7gb-expandable-ram-helio-g3-tSPEv8\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"5\\\",\\\"position\\\":1},{\\\"id\\\":\\\"6\\\",\\\"position\\\":2}]\",\"brand_id\":4,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e6119309056.png\\\",\\\"2023-02-10-63e61194a29b1.png\\\",\\\"2023-02-10-63e61197301be.png\\\",\\\"2023-02-10-63e61197a19e9.png\\\"]\",\"thumbnail\":\"2023-02-10-63e6119a27930.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"6+128GB STORAGE\\\",\\\"4+32GB STORAGE\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"DeepSkyBlue-6+128GBSTORAGE\\\",\\\"price\\\":6500,\\\"sku\\\":\\\"-DeepSkyBlue-6+128GBSTORAGE\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepSkyBlue-4+32GBSTORAGE\\\",\\\"price\\\":9000,\\\"sku\\\":\\\"-DeepSkyBlue-4+32GBSTORAGE\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":6500,\"purchase_price\":5000,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":1,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Upto 7GB larger RAM (4GB LPDDR4x + 3GB Virtual RAM) with the help of memory fusion technology | 37% improvement in apps switching | 64GB eMCP ROM | No support for Africa&#39;s frequency bands | Warranty In India Only<\\/li>\\r\\n\\t<li>90Hz Refresh Rate | 180Hz Touch Sampling Rate | 6.6&quot; HD+ Dot Notch display | 269PPI Pixel Density for richer colors<\\/li>\\r\\n\\t<li>13MP rear Dual Camera and Dual Flashlight | 8MP Selfie camera with front flash| Multiple AI modes like Portrait, HDR, Smile Shot, AI Scene Detection | Shoot Clear 1080P Time-lapse, Slow Motion, Video Bokeh videos<\\/li>\\r\\n\\t<li>MediaTek Helio G37 Gaming Processor | 64-bit 2.3GHz Max CPU Frequency | HiOS 8.6 based on Android 12 | DTS Powered Loud Speaker | Soplay 2.0 for Music composing<\\/li>\\r\\n\\t<li>5000mAh battery with up to 30 days long standby | 25 hours Video playback or 26 hours Calling or 133 hours music playback | Ultra Battery saver mode for extreme backup<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T09:42:52.000000Z\",\"updated_at\":\"2023-02-10T12:39:14.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"94751623\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 9000, 0, 0, 'pending', 'unpaid', '2023-02-11 05:57:15', '2023-02-11 05:57:15', NULL, 'DeepSkyBlue-4+32GBSTORAGE', '{\"color\":\"DeepSkyBlue\",\"Size\":\"4+32GB STORAGE\"}', 'discount_on_product', 1, 0),
(14, 100012, 2, 1, NULL, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Shirt white color full hand\",\"slug\":\"shirt-white-color-full-hand-BfYl86\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4d382b7dd6.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4d41c6964f.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"M\\\",\\\"options\\\":[\\\"g\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-g\\\",\\\"price\\\":800,\\\"sku\\\":\\\"Swcfh-AliceBlue-g\\\",\\\"qty\\\":2},{\\\"type\\\":\\\"Aqua-g\\\",\\\"price\\\":700,\\\"sku\\\":\\\"Swcfh-Aqua-g\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":700,\"purchase_price\":500,\"tax\":10,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":3,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T11:05:38.000000Z\",\"updated_at\":\"2023-02-10T09:45:40.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123987\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 80, 40, 'canceled', 'unpaid', '2023-02-11 06:53:34', '2023-02-11 06:53:54', NULL, 'AliceBlue-g', '{\"color\":\"AliceBlue\",\"M\":\"g\"}', 'discount_on_product', 0, 0),
(15, 100013, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"  S\\\",\\\"  M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":5}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":83,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-11T05:57:15.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":3,\"product_id\":4,\"customer_id\":3,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"very nice product.....love it\",\"attachment\":\"[\\\"2023-02-10-63e62cb811d2f.png\\\"]\",\"rating\":1,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T11:38:33.000000Z\",\"updated_at\":\"2023-02-10T11:38:33.000000Z\"}]}', 1, 320, 0, 0, 'delivered', 'unpaid', '2023-02-11 08:05:09', '2023-02-11 08:05:37', NULL, 'DeepSkyBlue-XXL', '{\"color\":\"DeepSkyBlue\",\"Size\":\"XXL\"}', 'discount_on_product', 1, 0),
(16, 100013, 3, 1, NULL, '{\"id\":3,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Kurties For Womens\",\"slug\":\"kurties-for-womens-7KFXKH\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":2,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4d63fcd922.png\\\",\\\"2023-02-09-63e4d63fce6cb.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4d63fce72e.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FF1493\\\"]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[{\\\"type\\\":\\\"DeepPink\\\",\\\"price\\\":900,\\\"sku\\\":\\\"KFW-DeepPink\\\",\\\"qty\\\":3}]\",\"published\":0,\"unit_price\":900,\"purchase_price\":800,\"tax\":10,\"tax_type\":\"percent\",\"discount\":10,\"discount_type\":\"percent\",\"current_stock\":3,\"minimum_order_qty\":1,\"details\":\"<p>Name&nbsp;:&nbsp;Women&#39;s Printed Full-Stitched Crepe Straight Kurti(Combo Pack Of 3)<\\/p>\\r\\n\\r\\n<p>Fabric&nbsp;:&nbsp;Crepe<\\/p>\\r\\n\\r\\n<p>Sleeve Length&nbsp;:&nbsp;Three-Quarter Sleeves<\\/p>\\r\\n\\r\\n<p>Pattern&nbsp;:&nbsp;Printed<\\/p>\\r\\n\\r\\n<p>Combo of&nbsp;:&nbsp;Combo of 3<\\/p>\\r\\n\\r\\n<p>Sizes&nbsp;:&nbsp;<\\/p>\\r\\n\\r\\n<p>S (Bust Size&nbsp;:&nbsp;36 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>M (Bust Size&nbsp;:&nbsp;38 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>L (Bust Size&nbsp;:&nbsp;40 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>XL (Bust Size&nbsp;:&nbsp;42 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>XXL (Bust Size&nbsp;:&nbsp;44 in, Size Length: 44 in)<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Country of Origin&nbsp;:&nbsp;India<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T11:17:19.000000Z\",\"updated_at\":\"2023-02-10T09:45:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123458\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":2,\"product_id\":3,\"customer_id\":2,\"delivery_man_id\":null,\"order_id\":null,\"comment\":null,\"attachment\":\"[\\\"2023-02-11-63e7425b42964.png\\\"]\",\"rating\":5,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T04:17:04.000000Z\",\"updated_at\":\"2023-02-11T07:23:08.000000Z\"}]}', 1, 900, 90, 90, 'delivered', 'unpaid', '2023-02-11 08:05:09', '2023-02-11 08:05:37', NULL, 'DeepPink', '{\"color\":\"DeepPink\"}', 'discount_on_product', 1, 0),
(17, 100013, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"  S\\\",\\\"  M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":82,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-11T08:05:09.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":3,\"product_id\":4,\"customer_id\":3,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"very nice product.....love it\",\"attachment\":\"[\\\"2023-02-10-63e62cb811d2f.png\\\"]\",\"rating\":1,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T11:38:33.000000Z\",\"updated_at\":\"2023-02-10T11:38:33.000000Z\"}]}', 1, 320, 0, 0, 'delivered', 'unpaid', '2023-02-11 08:05:09', '2023-02-11 08:05:37', NULL, 'Black-XS', '{\"color\":\"Black\",\"Size\":\"XS\"}', 'discount_on_product', 1, 0),
(18, 100014, 4, 1, NULL, '{\"id\":4,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"FUNDAY FASHION Women\'s Self-design Regular Jacket\",\"slug\":\"funday-fashion-womens-self-design-regular-jacket-rq3LPm\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2}]\",\"brand_id\":3,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-10-63e5d4a10bcd9.png\\\",\\\"2023-02-10-63e5d4a10d398.png\\\",\\\"2023-02-10-63e5d4a10d401.png\\\"]\",\"thumbnail\":\"2023-02-10-63e5d4a10d477.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#000000\\\",\\\"#B8860B\\\",\\\"#00BFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"3\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_3\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"XS\\\",\\\"  S\\\",\\\"  M\\\",\\\"  L\\\",\\\"  XL\\\",\\\"  XXL\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"Black-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XS\\\",\\\"qty\\\":3},{\\\"type\\\":\\\"Black-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"Black-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-Black-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XS\\\",\\\"qty\\\":4},{\\\"type\\\":\\\"DarkGoldenrod-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-M\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DarkGoldenrod-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DarkGoldenrod-XXL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XS\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XS\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-S\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-S\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-M\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-M\\\",\\\"qty\\\":0},{\\\"type\\\":\\\"DeepSkyBlue-L\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-L\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XL\\\",\\\"qty\\\":5},{\\\"type\\\":\\\"DeepSkyBlue-XXL\\\",\\\"price\\\":320,\\\"sku\\\":\\\"FFWSRJ-DeepSkyBlue-XXL\\\",\\\"qty\\\":4}]\",\"published\":0,\"unit_price\":320,\"purchase_price\":220,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":81,\"minimum_order_qty\":1,\"details\":\"<ul>\\r\\n\\t<li>Care Instructions: Machine Wash<\\/li>\\r\\n\\t<li>Fit Type: Regular<\\/li>\\r\\n\\t<li>Fit Type: Regular Fit; Size Details : S - 34 Chest\\/31 Waist , M - 36 Chest\\/33 Waist, L - 38 Chest\\/35 Waist , XL - 40 Chest\\/37 Waist<\\/li>\\r\\n\\t<li>Product Length varies from 18 to 19 inches based on size available from S to XL<\\/li>\\r\\n\\t<li>Occasion Type : Western Wear<\\/li>\\r\\n\\t<li>Easy to wear and versatile as casual wear, office wear, travel etc<\\/li>\\r\\n\\t<li>Age Range Description: Adult; Lining Description: Cotton<\\/li>\\r\\n<\\/ul>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-10T05:22:41.000000Z\",\"updated_at\":\"2023-02-11T08:05:09.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":30,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"78463684\",\"reviews_count\":1,\"translations\":[],\"reviews\":[{\"id\":3,\"product_id\":4,\"customer_id\":3,\"delivery_man_id\":null,\"order_id\":null,\"comment\":\"very nice product.....love it\",\"attachment\":\"[\\\"2023-02-10-63e62cb811d2f.png\\\"]\",\"rating\":1,\"status\":1,\"is_saved\":0,\"created_at\":\"2023-02-10T11:38:33.000000Z\",\"updated_at\":\"2023-02-10T11:38:33.000000Z\"}]}', 2, 320, 0, 0, 'pending', 'unpaid', '2023-02-13 04:45:15', '2023-02-13 04:45:15', NULL, 'Black-XS', '{\"color\":\"Black\",\"Size\":\"XS\"}', 'discount_on_product', 1, 0),
(19, 100015, 2, 1, NULL, '{\"id\":2,\"added_by\":\"seller\",\"user_id\":1,\"name\":\"Shirt white color full hand\",\"slug\":\"shirt-white-color-full-hand-BfYl86\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2},{\\\"id\\\":\\\"3\\\",\\\"position\\\":3}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-02-09-63e4d382b7dd6.png\\\"]\",\"thumbnail\":\"2023-02-09-63e4d41c6964f.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#F0F8FF\\\",\\\"#00FFFF\\\"]\",\"variant_product\":0,\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"M\\\",\\\"options\\\":[\\\"g\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AliceBlue-g\\\",\\\"price\\\":800,\\\"sku\\\":\\\"Swcfh-AliceBlue-g\\\",\\\"qty\\\":2},{\\\"type\\\":\\\"Aqua-g\\\",\\\"price\\\":700,\\\"sku\\\":\\\"Swcfh-Aqua-g\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":700,\"purchase_price\":500,\"tax\":10,\"tax_type\":\"percent\",\"discount\":5,\"discount_type\":\"percent\",\"current_stock\":3,\"minimum_order_qty\":1,\"details\":null,\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-02-09T11:05:38.000000Z\",\"updated_at\":\"2023-02-11T06:53:54.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"123987\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 800, 80, 40, 'delivered', 'unpaid', '2023-02-13 06:19:47', '2023-02-13 06:24:34', NULL, 'AliceBlue-g', '{\"color\":\"AliceBlue\",\"M\":\"g\"}', 'discount_on_product', 1, 0),
(20, 100016, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":15,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T05:42:06.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'delivered', 'unpaid', '2023-03-11 05:46:41', '2023-03-11 05:51:16', NULL, '', '[]', 'discount_on_product', 1, 0),
(21, 100017, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":14,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T05:46:41.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'delivered', 'unpaid', '2023-03-11 06:05:34', '2023-03-11 06:09:19', NULL, '', '[]', 'discount_on_product', 1, 0),
(22, 100018, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":13,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:05:34.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 06:11:45', '2023-03-11 06:11:45', NULL, '', '[]', 'discount_on_product', 1, 0),
(23, 100019, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":12,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:11:45.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 06:23:47', '2023-03-11 06:23:47', NULL, '', '[]', 'discount_on_product', 1, 0),
(24, 100020, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":11,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:23:47.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'delivered', 'unpaid', '2023-03-11 06:31:09', '2023-03-11 06:39:24', NULL, '', '[]', 'discount_on_product', 1, 0),
(25, 100021, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":10,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:35:02.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 06:42:56', '2023-03-11 06:42:56', NULL, '', '[]', 'discount_on_product', 1, 0),
(26, 100024, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:42:56.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 06:49:44', '2023-03-11 06:49:44', NULL, '', '[]', 'discount_on_product', 1, 0),
(27, 100025, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:49:44.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 06:51:09', '2023-03-11 06:51:09', NULL, '', '[]', 'discount_on_product', 1, 0),
(28, 100025, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:51:09.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 06:57:09', '2023-03-11 06:57:09', NULL, '', '[]', 'discount_on_product', 1, 0),
(29, 100025, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":6,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T06:57:09.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 07:21:00', '2023-03-11 07:21:00', NULL, '', '[]', 'discount_on_product', 1, 0),
(30, 100025, 10, 3, NULL, '{\"id\":10,\"added_by\":\"seller\",\"user_id\":3,\"name\":\"New Pen\",\"slug\":\"new-pen-dVR94g\",\"product_type\":\"physical\",\"category_ids\":\"[{\\\"id\\\":\\\"1\\\",\\\"position\\\":1},{\\\"id\\\":\\\"2\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"digital_product_type\":null,\"digital_file_ready\":null,\"images\":\"[\\\"2023-03-11-640c1457c52bb.png\\\"]\",\"thumbnail\":\"2023-03-11-640c1457c93ad.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":0,\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":200,\"purchase_price\":150,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":5,\"minimum_order_qty\":1,\"details\":\"<p>Good Quality<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2023-03-11T05:40:39.000000Z\",\"updated_at\":\"2023-03-11T07:21:00.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":null,\"meta_description\":null,\"meta_image\":\"def.png\",\"request_status\":1,\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"103936\",\"reviews_count\":0,\"translations\":[],\"reviews\":[]}', 1, 200, 0, 0, 'pending', 'unpaid', '2023-03-11 07:22:51', '2023-03-11 07:22:51', NULL, '', '[]', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_expected_delivery_histories`
--

CREATE TABLE `order_expected_delivery_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `cause` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_status_histories`
--

CREATE TABLE `order_status_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cause` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_histories`
--

INSERT INTO `order_status_histories` (`id`, `order_id`, `user_id`, `user_type`, `status`, `cause`, `created_at`, `updated_at`) VALUES
(1, 100001, 2, 'customer', 'pending', NULL, '2023-02-09 11:39:20', '2023-02-09 11:39:20'),
(2, 100001, 0, 'admin', 'confirmed', NULL, '2023-02-09 11:51:30', '2023-02-09 11:51:30'),
(3, 100001, 1, 'seller', 'processing', NULL, '2023-02-09 11:51:42', '2023-02-09 11:51:42'),
(4, 100001, 0, 'admin', 'delivered', NULL, '2023-02-09 12:48:51', '2023-02-09 12:48:51'),
(5, 100002, 2, 'customer', 'pending', NULL, '2023-02-10 04:29:05', '2023-02-10 04:29:05'),
(6, 100002, 0, 'admin', 'confirmed', NULL, '2023-02-10 04:32:14', '2023-02-10 04:32:14'),
(7, 100002, 0, 'admin', 'delivered', NULL, '2023-02-10 05:10:17', '2023-02-10 05:10:17'),
(8, 100005, 2, 'customer', 'pending', NULL, '2023-02-10 05:32:16', '2023-02-10 05:32:16'),
(9, 100005, 0, 'admin', 'processing', NULL, '2023-02-10 05:35:31', '2023-02-10 05:35:31'),
(10, 100006, 3, 'customer', 'pending', NULL, '2023-02-10 08:51:30', '2023-02-10 08:51:30'),
(11, 100007, 3, 'customer', 'pending', NULL, '2023-02-10 09:00:36', '2023-02-10 09:00:36'),
(12, 100007, 0, 'admin', 'processing', NULL, '2023-02-10 09:01:27', '2023-02-10 09:01:27'),
(13, 100007, 0, 'admin', 'delivered', NULL, '2023-02-10 09:01:40', '2023-02-10 09:01:40'),
(14, 100006, 1, 'seller', 'processing', NULL, '2023-02-10 09:02:16', '2023-02-10 09:02:16'),
(15, 100006, 0, 'admin', 'delivered', NULL, '2023-02-10 09:03:16', '2023-02-10 09:03:16'),
(16, 100005, 0, 'admin', 'delivered', NULL, '2023-02-10 09:46:13', '2023-02-10 09:46:13'),
(17, 100008, 3, 'customer', 'pending', NULL, '2023-02-10 12:39:14', '2023-02-10 12:39:14'),
(18, 100008, 0, 'admin', 'confirmed', NULL, '2023-02-10 12:40:24', '2023-02-10 12:40:24'),
(19, 100009, 2, 'customer', 'pending', NULL, '2023-02-11 05:39:06', '2023-02-11 05:39:06'),
(20, 100009, 0, 'admin', 'processing', NULL, '2023-02-11 05:39:45', '2023-02-11 05:39:45'),
(21, 100010, 2, 'customer', 'pending', NULL, '2023-02-11 05:57:15', '2023-02-11 05:57:15'),
(22, 100011, 2, 'customer', 'pending', NULL, '2023-02-11 05:57:15', '2023-02-11 05:57:15'),
(23, 100011, 2, 'seller', 'processing', NULL, '2023-02-11 05:58:53', '2023-02-11 05:58:53'),
(24, 100010, 1, 'seller', 'processing', NULL, '2023-02-11 05:59:10', '2023-02-11 05:59:10'),
(25, 100010, 0, 'admin', 'delivered', NULL, '2023-02-11 05:59:44', '2023-02-11 05:59:44'),
(26, 100012, 2, 'customer', 'pending', NULL, '2023-02-11 06:53:34', '2023-02-11 06:53:34'),
(27, 100013, 4, 'customer', 'pending', NULL, '2023-02-11 08:05:09', '2023-02-11 08:05:09'),
(28, 100013, 0, 'admin', 'delivered', NULL, '2023-02-11 08:05:37', '2023-02-11 08:05:37'),
(29, 100014, 4, 'customer', 'pending', NULL, '2023-02-13 04:45:15', '2023-02-13 04:45:15'),
(30, 100015, 4, 'customer', 'pending', NULL, '2023-02-13 06:19:47', '2023-02-13 06:19:47'),
(31, 100015, 1, 'seller', 'processing', NULL, '2023-02-13 06:20:33', '2023-02-13 06:20:33'),
(32, 100015, 0, 'admin', 'delivered', NULL, '2023-02-13 06:24:34', '2023-02-13 06:24:34'),
(33, 100008, 2, 'seller', 'delivered', NULL, '2023-02-13 06:31:51', '2023-02-13 06:31:51'),
(34, 100016, 2, 'customer', 'pending', NULL, '2023-03-11 05:46:41', '2023-03-11 05:46:41'),
(35, 100016, 3, 'seller', 'confirmed', NULL, '2023-03-11 05:48:03', '2023-03-11 05:48:03'),
(36, 100016, 3, 'seller', 'processing', NULL, '2023-03-11 05:48:20', '2023-03-11 05:48:20'),
(37, 100016, 0, 'admin', 'out_for_delivery', NULL, '2023-03-11 05:50:10', '2023-03-11 05:50:10'),
(38, 100016, 3, 'seller', 'confirmed', NULL, '2023-03-11 05:50:33', '2023-03-11 05:50:33'),
(39, 100016, 0, 'admin', 'delivered', NULL, '2023-03-11 05:51:15', '2023-03-11 05:51:15'),
(40, 100017, 2, 'customer', 'pending', NULL, '2023-03-11 06:05:34', '2023-03-11 06:05:34'),
(41, 100017, 3, 'seller', 'confirmed', NULL, '2023-03-11 06:08:41', '2023-03-11 06:08:41'),
(42, 100017, 0, 'admin', 'out_for_delivery', NULL, '2023-03-11 06:09:02', '2023-03-11 06:09:02'),
(43, 100017, 0, 'admin', 'delivered', NULL, '2023-03-11 06:09:18', '2023-03-11 06:09:18'),
(44, 100018, 2, 'customer', 'pending', NULL, '2023-03-11 06:11:45', '2023-03-11 06:11:45'),
(45, 100019, 2, 'customer', 'pending', NULL, '2023-03-11 06:23:47', '2023-03-11 06:23:47'),
(46, 100020, 2, 'customer', 'pending', NULL, '2023-03-11 06:31:09', '2023-03-11 06:31:09'),
(47, 100020, 0, 'admin', 'out_for_delivery', NULL, '2023-03-11 06:39:19', '2023-03-11 06:39:19'),
(48, 100020, 0, 'admin', 'delivered', NULL, '2023-03-11 06:39:24', '2023-03-11 06:39:24'),
(49, 100021, 2, 'customer', 'pending', NULL, '2023-03-11 06:42:56', '2023-03-11 06:42:56'),
(50, 100022, 2, 'customer', 'pending', NULL, '2023-03-11 06:44:58', '2023-03-11 06:44:58'),
(51, 100023, 2, 'customer', 'pending', NULL, '2023-03-11 06:47:38', '2023-03-11 06:47:38'),
(52, 100025, 2, 'customer', 'pending', NULL, '2023-03-11 06:51:09', '2023-03-11 06:51:09'),
(53, 100025, 2, 'customer', 'pending', NULL, '2023-03-11 07:21:00', '2023-03-11 07:21:00'),
(54, 100025, 2, 'customer', 'pending', NULL, '2023-03-11 07:22:51', '2023-03-11 07:22:51'),
(55, 100011, 0, 'admin', 'out_for_delivery', NULL, '2023-03-16 08:52:46', '2023-03-16 08:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `order_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `seller_amount` decimal(50,2) NOT NULL DEFAULT 0.00,
  `admin_commission` decimal(50,2) NOT NULL DEFAULT 0.00,
  `received_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` decimal(50,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(50,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `seller_is` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100001, '810.00', '810.00', '0.00', 'admin', 'disburse', '5.00', '90.00', '2023-02-09 12:48:51', '2023-02-09 12:48:51', 2, 'seller', 'admin', 'cash_on_delivery', '5181-A2H5G-1675946931', 1),
(1, 100002, '597.80', '597.80', '0.00', 'admin', 'disburse', '5.00', '30.50', '2023-02-10 05:10:17', '2023-02-10 05:10:17', 2, 'admin', 'admin', 'cash_on_delivery', '3397-cxygR-1676005817', 2),
(1, 100007, '1600.00', '1520.00', '80.00', 'admin', 'disburse', '100.00', '0.00', '2023-02-10 09:01:40', '2023-02-10 09:01:40', 3, 'seller', 'admin', 'cash_on_delivery', '9025-o77Tg-1676019700', 3),
(1, 100006, '640.00', '608.00', '32.00', 'admin', 'disburse', '100.00', '0.00', '2023-02-10 09:03:16', '2023-02-10 09:03:16', 3, 'seller', 'admin', 'cash_on_delivery', '9936-KNtC1-1676019796', 4),
(1, 100005, '1130.00', '960.50', '169.50', 'admin', 'disburse', '5.00', '90.00', '2023-02-10 09:46:13', '2023-02-10 09:46:13', 2, 'seller', 'admin', 'cash_on_delivery', '6040-m3XPD-1676022373', 5),
(1, 100010, '320.00', '272.00', '48.00', 'admin', 'disburse', '100.00', '0.00', '2023-02-11 05:59:44', '2023-02-11 05:59:44', 2, 'seller', 'admin', 'cash_on_delivery', '8341-CaOcw-1676095184', 6),
(1, 100013, '1400.00', '1190.00', '210.00', 'admin', 'disburse', '5.00', '90.00', '2023-02-11 08:05:37', '2023-02-11 08:05:37', 4, 'seller', 'admin', 'cash_on_delivery', '6482-HOaxe-1676102737', 7),
(1, 100015, '760.00', '646.00', '114.00', 'admin', 'disburse', '5.00', '80.00', '2023-02-13 06:24:34', '2023-02-13 06:24:34', 4, 'seller', 'admin', 'cash_on_delivery', '3231-8XJk6-1676269474', 8),
(2, 100008, '6500.00', '5525.00', '975.00', 'seller', 'disburse', '5.00', '0.00', '2023-02-13 06:31:51', '2023-02-13 06:31:51', 3, 'seller', 'seller', 'cash_on_delivery', '1910-AB8F8-1676269911', 9),
(3, 100016, '200.00', '170.00', '30.00', 'admin', 'disburse', '5.00', '0.00', '2023-03-11 05:51:15', '2023-03-11 05:51:15', 2, 'seller', 'admin', 'cash_on_delivery', '7373-aWWoV-1678513875', 10),
(3, 100017, '200.00', '180.00', '20.00', 'admin', 'disburse', '100.00', '0.00', '2023-03-11 06:09:19', '2023-03-11 06:09:19', 2, 'seller', 'admin', 'cash_on_delivery', '7195-b9G9G-1678514959', 11),
(3, 100020, '200.00', '180.00', '20.00', 'admin', 'disburse', '5.00', '0.00', '2023-03-11 06:39:24', '2023-03-11 06:39:24', 2, 'seller', 'admin', 'cash_on_delivery', '4351-9CwxR-1678516764', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` int(10) UNSIGNED NOT NULL,
  `pt_invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int(10) UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_first_six_digits` int(10) UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `added_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `category_ids` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `unit` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `refundable` tinyint(1) NOT NULL DEFAULT 1,
  `digital_product_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `digital_file_ready` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT 0,
  `attributes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `unit_price` double NOT NULL DEFAULT 0,
  `purchase_price` double NOT NULL DEFAULT 0,
  `tax` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `tax_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int(11) DEFAULT NULL,
  `minimum_order_qty` int(11) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `featured_status` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT 0,
  `denied_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `product_type`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `digital_product_type`, `digital_file_ready`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`) VALUES
(1, 'admin', 1, 'Shirt white color full hand', 'shirt-white-color-full-hand-gvQmc3', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2},{\"id\":\"3\",\"position\":3}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-02-09-63e4bd4296500.png\",\"2023-02-09-63e4be67700af.png\",\"2023-02-09-63e4be6a95ab5.png\"]', '2023-02-09-63e4be6e3e206.png', '1', NULL, 'youtube', NULL, '[\"#FFFAF0\",\"#FFFFFF\",\"#F5F5F5\"]', 0, '[\"3\",\"1\"]', '[{\"name\":\"choice_3\",\"title\":\"L\",\"options\":[\"L\",\"  L1\"]},{\"name\":\"choice_1\",\"title\":\"M\",\"options\":[\"M\",\"  m1\"]}]', '[{\"type\":\"FloralWhite-L-M\",\"price\":610,\"sku\":\"Swcfh-FloralWhite-L-M\",\"qty\":0},{\"type\":\"FloralWhite-L-m1\",\"price\":620,\"sku\":\"Swcfh-FloralWhite-L-m1\",\"qty\":1},{\"type\":\"FloralWhite-L1-M\",\"price\":630,\"sku\":\"Swcfh-FloralWhite-L1-M\",\"qty\":1},{\"type\":\"FloralWhite-L1-m1\",\"price\":640,\"sku\":\"Swcfh-FloralWhite-L1-m1\",\"qty\":1},{\"type\":\"White-L-M\",\"price\":650,\"sku\":\"Swcfh-White-L-M\",\"qty\":0},{\"type\":\"White-L-m1\",\"price\":660,\"sku\":\"Swcfh-White-L-m1\",\"qty\":1},{\"type\":\"White-L1-M\",\"price\":670,\"sku\":\"Swcfh-White-L1-M\",\"qty\":1},{\"type\":\"White-L1-m1\",\"price\":680,\"sku\":\"Swcfh-White-L1-m1\",\"qty\":1},{\"type\":\"WhiteSmoke-L-M\",\"price\":690,\"sku\":\"Swcfh-WhiteSmoke-L-M\",\"qty\":0},{\"type\":\"WhiteSmoke-L-m1\",\"price\":691,\"sku\":\"Swcfh-WhiteSmoke-L-m1\",\"qty\":1},{\"type\":\"WhiteSmoke-L1-M\",\"price\":692,\"sku\":\"Swcfh-WhiteSmoke-L1-M\",\"qty\":1},{\"type\":\"WhiteSmoke-L1-m1\",\"price\":693,\"sku\":\"Swcfh-WhiteSmoke-L1-m1\",\"qty\":1}]', 0, 600, 400, '5', 'percent', '2', 'percent', 9, 1, '<p>Name : Men Casual Shirt</p>\r\n\r\n<p>Fabric : Cotton</p>\r\n\r\n<p>Sleeve Length : Long Sleeves</p>\r\n\r\n<p>Pattern : Solid</p>\r\n\r\n<p>Net Quantity (N) : 1</p>\r\n\r\n<p>Sizes :&nbsp;</p>\r\n\r\n<p>M (Chest Size : 38 in, Length Size: 28 in)</p>\r\n\r\n<p>L (Chest Siz</p>', 0, NULL, '2023-02-09 09:30:42', '2023-02-10 09:11:07', 1, 1, 'Today Fashion', 'Name : Men Casual Shirt\r\n\r\nFabric : Cotton\r\n\r\nSleeve Length : Long Sleeves\r\n\r\nPattern : Solid\r\n\r\nNet Quantity (N) : 1\r\n\r\nSizes : \r\n\r\nM (Chest Size : 38 in, Length Size: 28 in)\r\n\r\nL (Chest Siz', '2023-02-09-63e4bd42975f2.png', 1, NULL, 40.00, 0, NULL, NULL, '123456'),
(3, 'seller', 1, 'Kurties For Womens', 'kurties-for-womens-7KFXKH', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', 2, 'pc', 1, 1, NULL, NULL, '[\"2023-02-09-63e4d63fcd922.png\",\"2023-02-09-63e4d63fce6cb.png\"]', '2023-02-09-63e4d63fce72e.png', '1', NULL, 'youtube', NULL, '[\"#FF1493\"]', 0, 'null', '[]', '[{\"type\":\"DeepPink\",\"price\":900,\"sku\":\"KFW-DeepPink\",\"qty\":2}]', 0, 900, 800, '10', 'percent', '10', 'percent', 2, 1, '<p>Name&nbsp;:&nbsp;Women&#39;s Printed Full-Stitched Crepe Straight Kurti(Combo Pack Of 3)</p>\r\n\r\n<p>Fabric&nbsp;:&nbsp;Crepe</p>\r\n\r\n<p>Sleeve Length&nbsp;:&nbsp;Three-Quarter Sleeves</p>\r\n\r\n<p>Pattern&nbsp;:&nbsp;Printed</p>\r\n\r\n<p>Combo of&nbsp;:&nbsp;Combo of 3</p>\r\n\r\n<p>Sizes&nbsp;:&nbsp;</p>\r\n\r\n<p>S (Bust Size&nbsp;:&nbsp;36 in, Size Length: 44 in)</p>\r\n\r\n<p>M (Bust Size&nbsp;:&nbsp;38 in, Size Length: 44 in)</p>\r\n\r\n<p>L (Bust Size&nbsp;:&nbsp;40 in, Size Length: 44 in)</p>\r\n\r\n<p>XL (Bust Size&nbsp;:&nbsp;42 in, Size Length: 44 in)</p>\r\n\r\n<p>XXL (Bust Size&nbsp;:&nbsp;44 in, Size Length: 44 in)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Country of Origin&nbsp;:&nbsp;India</p>', 0, NULL, '2023-02-09 11:17:19', '2023-02-11 08:05:09', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '123458'),
(4, 'seller', 1, 'FUNDAY FASHION Women\'s Self-design Regular Jacket', 'funday-fashion-womens-self-design-regular-jacket-rq3LPm', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-02-10-63e5d4a10bcd9.png\",\"2023-02-10-63e5d4a10d398.png\",\"2023-02-10-63e5d4a10d401.png\"]', '2023-02-10-63e5d4a10d477.png', '1', NULL, 'youtube', NULL, '[\"#000000\",\"#B8860B\",\"#00BFFF\"]', 0, '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Size\",\"options\":[\"XS\",\"  S\",\"  M\",\"  L\",\"  XL\",\"  XXL\"]}]', '[{\"type\":\"Black-XS\",\"price\":320,\"sku\":\"FFWSRJ-Black-XS\",\"qty\":1},{\"type\":\"Black-S\",\"price\":320,\"sku\":\"FFWSRJ-Black-S\",\"qty\":5},{\"type\":\"Black-M\",\"price\":320,\"sku\":\"FFWSRJ-Black-M\",\"qty\":5},{\"type\":\"Black-L\",\"price\":320,\"sku\":\"FFWSRJ-Black-L\",\"qty\":5},{\"type\":\"Black-XL\",\"price\":320,\"sku\":\"FFWSRJ-Black-XL\",\"qty\":5},{\"type\":\"Black-XXL\",\"price\":320,\"sku\":\"FFWSRJ-Black-XXL\",\"qty\":5},{\"type\":\"DarkGoldenrod-XS\",\"price\":320,\"sku\":\"FFWSRJ-DarkGoldenrod-XS\",\"qty\":4},{\"type\":\"DarkGoldenrod-S\",\"price\":320,\"sku\":\"FFWSRJ-DarkGoldenrod-S\",\"qty\":5},{\"type\":\"DarkGoldenrod-M\",\"price\":320,\"sku\":\"FFWSRJ-DarkGoldenrod-M\",\"qty\":5},{\"type\":\"DarkGoldenrod-L\",\"price\":320,\"sku\":\"FFWSRJ-DarkGoldenrod-L\",\"qty\":5},{\"type\":\"DarkGoldenrod-XL\",\"price\":320,\"sku\":\"FFWSRJ-DarkGoldenrod-XL\",\"qty\":5},{\"type\":\"DarkGoldenrod-XXL\",\"price\":320,\"sku\":\"FFWSRJ-DarkGoldenrod-XXL\",\"qty\":5},{\"type\":\"DeepSkyBlue-XS\",\"price\":320,\"sku\":\"FFWSRJ-DeepSkyBlue-XS\",\"qty\":5},{\"type\":\"DeepSkyBlue-S\",\"price\":320,\"sku\":\"FFWSRJ-DeepSkyBlue-S\",\"qty\":5},{\"type\":\"DeepSkyBlue-M\",\"price\":320,\"sku\":\"FFWSRJ-DeepSkyBlue-M\",\"qty\":0},{\"type\":\"DeepSkyBlue-L\",\"price\":320,\"sku\":\"FFWSRJ-DeepSkyBlue-L\",\"qty\":5},{\"type\":\"DeepSkyBlue-XL\",\"price\":320,\"sku\":\"FFWSRJ-DeepSkyBlue-XL\",\"qty\":5},{\"type\":\"DeepSkyBlue-XXL\",\"price\":320,\"sku\":\"FFWSRJ-DeepSkyBlue-XXL\",\"qty\":4}]', 0, 320, 220, '0', 'percent', '0', 'flat', 79, 1, '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Regular</li>\r\n	<li>Fit Type: Regular Fit; Size Details : S - 34 Chest/31 Waist , M - 36 Chest/33 Waist, L - 38 Chest/35 Waist , XL - 40 Chest/37 Waist</li>\r\n	<li>Product Length varies from 18 to 19 inches based on size available from S to XL</li>\r\n	<li>Occasion Type : Western Wear</li>\r\n	<li>Easy to wear and versatile as casual wear, office wear, travel etc</li>\r\n	<li>Age Range Description: Adult; Lining Description: Cotton</li>\r\n</ul>', 0, NULL, '2023-02-10 05:22:41', '2023-02-13 04:45:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 30.00, 0, NULL, NULL, '78463684'),
(5, 'seller', 1, 'Tecno Spark 9 (Sky Mirror, 4GB RAM,64GB Storage) | 7GB Expandable RAM | Helio G3', 'tecno-spark-9-sky-mirror-4gb-ram64gb-storage-7gb-expandable-ram-helio-g37-gaming-processor-hZ3sOD', 'physical', '[{\"id\":\"5\",\"position\":1}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-02-10-63e5e3e0e9ef1.png\",\"2023-02-10-63e5e3e0ead26.png\",\"2023-02-10-63e5e3e0eae54.png\",\"2023-02-10-63e5e3e0eaf3d.png\"]', '2023-02-10-63e5e3e0eafb3.png', '1', NULL, 'youtube', NULL, '[]', 0, '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Size\",\"options\":[\"4+64GB Storage\",\"6+128GB Storage\"]}]', '[{\"type\":\"4+64GBStorage\",\"price\":7000,\"sku\":\"TS9(M4RS|7ER|HGGP-4+64GBStorage\",\"qty\":3},{\"type\":\"6+128GBStorage\",\"price\":10000,\"sku\":\"TS9(M4RS|7ER|HGGP-6+128GBStorage\",\"qty\":1}]', 0, 7000, 6000, '0', 'percent', '0', 'flat', 4, 1, '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>Brand</td>\r\n			<td>Tecno</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model Name</td>\r\n			<td>Spark 9</td>\r\n		</tr>\r\n		<tr>\r\n			<td>OS</td>\r\n			<td>Android 12 HiOS 8.6</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Cellular Technology</td>\r\n			<td>4G,3G,2G</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Memory Storage Capacity</td>\r\n			<td>64 GB</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<hr />\r\n<h1>About this item</h1>\r\n\r\n<ul>\r\n	<li>Upto 7GB larger RAM (4GB LPDDR4x + 3GB Virtual RAM) with the help of memory fusion technology | 37% improvement in apps switching | 64GB eMCP ROM | No support for Africa&#39;s frequency bands | Warranty In India Only</li>\r\n	<li>90Hz Refresh Rate | 180Hz Touch Sampling Rate | 6.6&quot; HD+ Dot Notch display | 269PPI Pixel Density for richer colors</li>\r\n	<li>13MP rear Dual Camera and Dual Flashlight | 8MP Selfie camera with front flash| Multiple AI modes like Portrait, HDR, Smile Shot, AI Scene Detection | Shoot Clear 1080P Time-lapse, Slow Motion, Video Bokeh videos</li>\r\n	<li>MediaTek Helio G37 Gaming Processor | 64-bit 2.3GHz Max CPU Frequency | HiOS 8.6 based on Android 12 | DTS Powered Loud Speaker | Soplay 2.0 for Music composing</li>\r\n	<li>5000mAh battery with up to 30 days long standby | 25 hours Video playback or 26 hours Calling or 133 hours music playback | Ultra Battery saver mode for extreme backup</li>\r\n</ul>', 0, NULL, '2023-02-10 06:27:44', '2023-02-10 10:40:24', 1, 1, NULL, NULL, 'def.png', 1, NULL, 60.00, 0, NULL, NULL, '123456874'),
(6, 'admin', 1, 'FUNDAY FASHION Women\'s Self-design Regular Jacket', 'funday-fashion-womens-self-design-regular-jacket-9GVwQ0', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"4\",\"position\":2}]', 3, 'pc', 1, 1, NULL, NULL, '[\"2023-02-10-63e60a2660325.png\"]', '2023-02-10-63e60a2661a81.png', '1', NULL, 'youtube', NULL, '[\"#000000\"]', 0, '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Size\",\"options\":[\"XS\",\"S\",\"M\",\"L\",\"XL\",\"XXL\",\"XXXl\"]}]', '[{\"type\":\"Black-XS\",\"price\":390,\"sku\":\"FFWSRJ-Black-XS\",\"qty\":5},{\"type\":\"Black-S\",\"price\":390,\"sku\":\"FFWSRJ-Black-S\",\"qty\":1},{\"type\":\"Black-M\",\"price\":395,\"sku\":\"FFWSRJ-Black-M\",\"qty\":1},{\"type\":\"Black-L\",\"price\":395,\"sku\":\"FFWSRJ-Black-L\",\"qty\":1},{\"type\":\"Black-XL\",\"price\":400,\"sku\":\"FFWSRJ-Black-XL\",\"qty\":1},{\"type\":\"Black-XXL\",\"price\":400,\"sku\":\"FFWSRJ-Black-XXL\",\"qty\":1},{\"type\":\"Black-XXXl\",\"price\":400,\"sku\":\"FFWSRJ-Black-XXXl\",\"qty\":1}]', 0, 400, 250, '0', 'percent', '0', 'flat', 11, 1, '<ul>\r\n	<li>Care Instructions: Machine Wash</li>\r\n	<li>Fit Type: Regular</li>\r\n	<li>Fit Type: Regular Fit; Size Details : S - 34 Chest/31 Waist , M - 36 Chest/33 Waist, L - 38 Chest/35 Waist , XL - 40 Chest/37 Waist</li>\r\n	<li>Occasion Type : Western Wear</li>\r\n	<li>Easy to wear and versatile as casual wear, office wear, travel etc</li>\r\n</ul>', 0, NULL, '2023-02-10 09:11:02', '2023-02-10 09:11:17', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '89451263'),
(8, 'seller', 2, 'Tecno Spark 9 (Sky Mirror, 4GB RAM,64GB Storage) | 7GB Expandable RAM | Helio G3', 'tecno-spark-9-sky-mirror-4gb-ram64gb-storage-7gb-expandable-ram-helio-g3-tSPEv8', 'physical', '[{\"id\":\"5\",\"position\":1},{\"id\":\"6\",\"position\":2}]', 4, 'pc', 1, 1, NULL, NULL, '[\"2023-02-10-63e6119309056.png\",\"2023-02-10-63e61194a29b1.png\",\"2023-02-10-63e61197301be.png\",\"2023-02-10-63e61197a19e9.png\"]', '2023-02-10-63e6119a27930.png', '1', NULL, 'youtube', NULL, '[\"#00BFFF\"]', 0, '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Size\",\"options\":[\"6+128GB STORAGE\",\"4+32GB STORAGE\"]}]', '[{\"type\":\"DeepSkyBlue-6+128GBSTORAGE\",\"price\":6500,\"sku\":\"-DeepSkyBlue-6+128GBSTORAGE\",\"qty\":0},{\"type\":\"DeepSkyBlue-4+32GBSTORAGE\",\"price\":9000,\"sku\":\"-DeepSkyBlue-4+32GBSTORAGE\",\"qty\":0}]', 0, 6500, 5000, '0', 'percent', '0', 'flat', 0, 1, '<ul>\r\n	<li>Upto 7GB larger RAM (4GB LPDDR4x + 3GB Virtual RAM) with the help of memory fusion technology | 37% improvement in apps switching | 64GB eMCP ROM | No support for Africa&#39;s frequency bands | Warranty In India Only</li>\r\n	<li>90Hz Refresh Rate | 180Hz Touch Sampling Rate | 6.6&quot; HD+ Dot Notch display | 269PPI Pixel Density for richer colors</li>\r\n	<li>13MP rear Dual Camera and Dual Flashlight | 8MP Selfie camera with front flash| Multiple AI modes like Portrait, HDR, Smile Shot, AI Scene Detection | Shoot Clear 1080P Time-lapse, Slow Motion, Video Bokeh videos</li>\r\n	<li>MediaTek Helio G37 Gaming Processor | 64-bit 2.3GHz Max CPU Frequency | HiOS 8.6 based on Android 12 | DTS Powered Loud Speaker | Soplay 2.0 for Music composing</li>\r\n	<li>5000mAh battery with up to 30 days long standby | 25 hours Video playback or 26 hours Calling or 133 hours music playback | Ultra Battery saver mode for extreme backup</li>\r\n</ul>', 0, NULL, '2023-02-10 09:42:52', '2023-02-11 05:57:15', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '94751623'),
(9, 'admin', 1, 'Shirt white color full hand', 'shirt-white-color-full-hand-3gOXoQ', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-02-13-63e9ee257b9de.png\"]', '2023-02-13-63e9ee257d1aa.png', '1', NULL, 'youtube', NULL, '[\"#9966CC\"]', 0, '[\"3\"]', '[{\"name\":\"choice_3\",\"title\":\"Size\",\"options\":[\"s\"]}]', '[{\"type\":\"Amethyst-s\",\"price\":600,\"sku\":\"Swcfh-Amethyst-s\",\"qty\":3}]', 0, 600, 300, '0', 'percent', '0', 'flat', 3, 1, '<p>Shirt white color full hand</p>', 0, NULL, '2023-02-13 08:00:37', '2023-03-02 12:09:14', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '4552001'),
(10, 'seller', 3, 'New Pen', 'new-pen-dVR94g', 'physical', '[{\"id\":\"1\",\"position\":1},{\"id\":\"2\",\"position\":2}]', 1, 'pc', 1, 1, NULL, NULL, '[\"2023-03-11-640c1457c52bb.png\"]', '2023-03-11-640c1457c93ad.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 200, 150, '0', 'percent', '0', 'flat', 4, 1, '<p>Good Quality</p>', 0, NULL, '2023-03-11 05:40:39', '2023-03-11 07:22:51', 1, 1, NULL, NULL, 'def.png', 1, NULL, 0.00, 0, NULL, NULL, '103936');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `variant` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_details_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `refund_reason` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_note` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_info` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund_requests`
--

INSERT INTO `refund_requests` (`id`, `order_details_id`, `customer_id`, `status`, `amount`, `product_id`, `order_id`, `refund_reason`, `images`, `created_at`, `updated_at`, `approved_note`, `rejected_note`, `payment_info`, `change_by`) VALUES
(1, 1, 2, 'refunded', 900.00, 3, 100001, 'This color is i dont like it.So i want to purchase another color', NULL, '2023-02-10 04:16:41', '2023-02-10 04:56:18', 'pkay approved', NULL, 'okay', 'admin'),
(2, 7, 3, 'refunded', 320.00, 4, 100006, 'Wrongly ordered I want to purchase the one item. You don\'t have a cancel order in this website. So please kindly refund it', NULL, '2023-02-10 11:38:02', '2023-02-10 11:45:58', 'Okay Aproved', NULL, 'wallet amount use to next order...Thank you', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `refund_request_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund_statuses`
--

INSERT INTO `refund_statuses` (`id`, `refund_request_id`, `change_by`, `change_by_id`, `status`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 'seller', 1, 'approved', 'pkay approved', '2023-02-10 04:52:42', '2023-02-10 04:52:42'),
(2, 1, 'admin', 1, 'refunded', 'okay', '2023-02-10 04:56:18', '2023-02-10 04:56:18'),
(3, 2, 'admin', 1, 'approved', 'Okay Aproved', '2023-02-10 11:43:05', '2023-02-10 11:43:05'),
(4, 2, 'admin', 1, 'refunded', 'wallet amount use to next order...Thank you', '2023-02-10 11:45:58', '2023-02-10 11:45:58');

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `refund_transactions`
--

INSERT INTO `refund_transactions` (`id`, `order_id`, `payment_for`, `payer_id`, `payment_receiver_id`, `paid_by`, `paid_to`, `payment_method`, `payment_status`, `amount`, `transaction_type`, `order_details_id`, `created_at`, `updated_at`, `refund_id`) VALUES
(1, 100001, 'Refund Request', 1, 2, 'seller', 'customer', 'digitally_paid', 'paid', 900.00, 'Refund', 1, '2023-02-10 04:56:18', '2023-02-10 04:56:18', 1),
(2, 100006, 'Refund Request', 1, 3, 'seller', 'customer', 'customer_wallet', 'paid', 320.00, 'Refund', 7, '2023-02-10 11:45:58', '2023-02-10 11:45:58', 2);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_saved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `delivery_man_id`, `order_id`, `comment`, `attachment`, `rating`, `status`, `is_saved`, `created_at`, `updated_at`) VALUES
(1, 0, 2, 1, 100001, 'good', NULL, 4, 1, 0, '2023-02-10 04:14:39', '2023-02-10 04:14:39'),
(2, 3, 2, NULL, NULL, NULL, '[\"2023-02-11-63e7425b42964.png\"]', 5, 1, 0, '2023-02-10 04:17:04', '2023-02-11 07:23:08'),
(3, 4, 3, NULL, NULL, 'very nice product.....love it', '[\"2023-02-10-63e62cb811d2f.png\"]', 1, 1, 0, '2023-02-10 11:38:33', '2023-02-10 11:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `f_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `phone`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`) VALUES
(1, 'seller', '1', '09994839839', '2023-02-09-63e4b811ebb75.png', 'seller1@gmail.com', '$2y$10$P.RGvFUMtfkLxixfUhujhOQiHZeghPkZPu/N7qxnZleRTBczCM70C', 'approved', 'Eo1kbL0Ggc9nQExBHFriR4uaphQT9IbIN6WfsPfA06k7xTS0dKkHYo0kXO46', '2023-02-09 09:08:41', '2023-02-10 10:39:05', 'HDFC', 'Tuticorin', '123456789', 'Seller1', '5MELIbF34bY8jbqYckH51gkbZyWt86MNdCVsMUDN1LDMJ1foVlDUYjDRJnuKPZxeLLCavyL6apvEaGsg', 15.00, NULL, 'fx4QWLIySAyfaOtqUQ1I-f:APA91bE1xNYx15F-o8wMKlxjiznxjX8RubOcWkdBjlNcXdkwHzAFBou3oCu6l802PPLTgc90fFDJKPtG95QZHGLGV-pRpO7-uC9h49ymd7YdQA6wNmrn8Jz-idNHjan50HULyj1gAZlR', 0),
(2, 'seller', '2', '8945126374', '2023-02-10-63e5df1fe4cc2.png', 'seller2@gmail.com', '$2y$10$RJuQKOhM20MJBWTdXyIWd.WWWB7.CyVH9KlB5pHUQr1HHKNIptBMa', 'approved', 'KwLNIyjTYgcz8CDM7h6aBzwATI4yMe5KdVTHrGSDTeganpPeXOLkttf2q3fy', '2023-02-10 06:07:27', '2023-03-06 04:55:30', NULL, NULL, NULL, NULL, 'yVCRH2O54lAcg7MMe2R7lfXbGjHbCwAgz6KhDik394Gb29pY9p', 15.00, NULL, 'dsHGMiMRTluLFVxSBLANpJ:APA91bFpOzK_lI1jc9Hzh6CrrXm5G3y4ibHL2KSO4LEhl2Q8rggWtlsBGNd7MvZLBthwgoF3JJ0_R59NbFLX4lgGgCEQwB8HEiR4xIkSAvEBA1mnfOj8TfnJQ8yfJi821GDZlJZ85ivP', 0),
(3, 'Mano', 'Thilak', '1234567890', '2023-03-11-640c136eaafe8.png', 'mano@gmail.com', '$2y$10$sT/QkqvZob8tGmnmDglC..xv/IL1dd1JPxTrJ4SzxRgZ9MFWuU3wK', 'approved', NULL, '2023-03-11 05:36:47', '2023-03-11 07:59:40', 'TMB', 'Tuty', '12356478', 'MANO', NULL, 10.00, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT 0,
  `withdrawn` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT 0.00,
  `pending_withdraw` double(8,2) NOT NULL DEFAULT 0.00,
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT 0.00,
  `collected_cash` double(8,2) NOT NULL DEFAULT 0.00,
  `total_tax_collected` double(8,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 4460.5, '2023-02-09 09:08:43', '2023-02-13 06:24:34', 653.50, 0.00, 5.00, 845.00, 350.00),
(2, 2, 0, 0, '2023-02-10 06:07:27', '2023-02-13 06:31:51', 975.00, 0.00, 5.00, 6505.00, 0.00),
(3, 3, 430, 100, '2023-03-11 05:36:47', '2023-03-11 08:01:25', 70.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '2', 'swathi', 'home', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', 'Thiruvananthapuram', '695001', '09994839839', '2023-02-09 11:39:09', '2023-02-09 11:39:09', NULL, 'India', '', '', 0),
(2, '2', 'Mukesh', 'office', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', 'Thiruvananthapuram', '695001', '09994839839', '2023-02-10 05:02:18', '2023-02-10 05:02:18', NULL, 'India', NULL, NULL, 0),
(3, '3', 'jeyanthi', 'permanent', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', 'Thiruvananthapuram', '695001', '09994839839', '2023-02-10 07:07:33', '2023-02-10 07:07:33', NULL, 'India', '', '', 0),
(4, '4', 'Rosy', 'permanent', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', 'Thiruvananthapuram', '695001', '09994839839', '2023-02-11 08:05:06', '2023-02-11 08:05:06', NULL, 'India', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Company Vehicle', '5.00', '2 Week', 1, '2021-05-25 20:57:04', '2021-05-25 20:57:04'),
(9, 1, 'admin', 'Today', '100.00', '1 Day', 1, '2023-02-10 06:52:27', '2023-02-10 06:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`) VALUES
(1, 1, 'Aaradhana', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', '09994839839', '2023-02-09-63e4b819d82c2.png', '2023-02-09 09:08:43', '2023-02-10 10:09:12', '2023-02-09-63e4b81a115a5.png'),
(2, 2, 'Levis', '2nd Floor, Uthradam Building, Near MRF Tyres, Pana', '8945126374', '2023-02-10-63e5df1fefdb7.png', '2023-02-10 06:07:27', '2023-02-10 06:07:27', '2023-02-10-63e5df1fefe79.png'),
(3, 3, 'Mano', 'Tuty', '1234567890', '2023-03-11-640c136f68096.png', '2023-03-11 05:36:47', '2023-03-11 05:36:47', '2023-03-11-640c136f6886c.png');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', '#', 'fa fa-twitter', 0, 1, '2020-12-31 21:18:03', '2023-03-04 12:08:14'),
(2, 'linkedin', '#', 'fa fa-linkedin', 0, 1, '2021-02-27 16:23:01', '2023-03-04 12:08:10'),
(3, 'google-plus', 'https://dev.6amtech.com/', 'fa fa-google-plus-square', 0, 1, '2021-02-27 16:23:30', '2023-03-03 09:01:50'),
(4, 'pinterest', 'https://dev.6amtech.com/', 'fa fa-pinterest', 0, 1, '2021-02-27 16:24:14', '2023-03-03 09:02:12'),
(5, 'instagram', '#', 'fa fa-instagram', 0, 1, '2021-02-27 16:24:36', '2023-03-04 12:08:08'),
(6, 'facebook', '#', 'fa fa-facebook', 0, 1, '2021-02-27 19:19:42', '2023-03-04 12:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `subject` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `customer_id`, `subject`, `type`, `priority`, `description`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'worst', 'Complaint', 'Urgent', 'not satisfied', NULL, 'open', '2023-02-11 07:30:12', '2023-02-11 07:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `customer_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_ticket_convs`
--

INSERT INTO `support_ticket_convs` (`id`, `support_ticket_id`, `admin_id`, `customer_message`, `admin_message`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 'okay done', 0, '2023-02-11 07:30:38', '2023-02-11 07:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_for` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint(20) DEFAULT NULL,
  `payment_receiver_id` bigint(20) DEFAULT NULL,
  `paid_by` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `order_id`, `payment_for`, `payer_id`, `payment_receiver_id`, `paid_by`, `paid_to`, `payment_method`, `payment_status`, `created_at`, `updated_at`, `amount`, `transaction_type`, `order_details_id`) VALUES
(1, 100013, 'coupon_discount', 1, 1, 'admin', 'seller', NULL, 'disburse', '2023-02-11 08:05:37', '2023-02-11 08:05:37', 50.00, 'expense', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `payment_card_last_four` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_fawry_token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_medium` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT 0,
  `temporary_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`) VALUES
(0, 'walking customer', 'walking', 'customer', '000000000000', 'def.png', 'walking@customer.com', NULL, '', NULL, NULL, '2022-02-03 03:46:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(2, NULL, 'swathi', 'M', '9988774455', '2023-02-10-63e5ca7c31c2a.png', 'swathi@gmail.com', NULL, '$2y$10$N/4SB8oGFJqnLIIunkcf7uYTQVbYsRLUlBb1qiRbNL.ZV/XmV4Zem', 'hnE1kAJQPDjhNFTild32zk02tU3CvlDRuQyYiL8undxC4clw2n1EgzOCgAld', '2023-02-09 09:42:53', '2023-03-11 06:39:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 60.00),
(3, NULL, 'Jeyanthi', 'G', '9994839839', 'def.png', 'Jeyanthi@gmail.com', NULL, '$2y$10$BMuJyTHD23SGEwMPrIuKQOiZnytTVCdJ2jWdPN.h9oK2bHjwKbYSC', NULL, '2023-02-10 05:39:35', '2023-02-13 06:31:51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 320.00, 650.00),
(4, NULL, 'rosy', 'm', '9988554411', 'def.png', 'rosy@gmail.com', NULL, '$2y$10$xQIDAD6XnmJQ1XR5gJpvyeBJWR88y3uUVruNEUL6d0MPIIjLRKHO2', '1DDSaaUEoPPlkfOtr6vqmW60K5UDnHr4vv6ReqM2Oj6ieMvlmVtv8Yi7dpvB', '2023-02-11 07:34:57', '2023-02-13 06:24:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 14.90, 84.00),
(5, NULL, 'Mano', 'Thilak', '8973609501', 'def.png', 'mailtomanok@gmail.com', NULL, '$2y$10$KgZ.JxZSFFUrR5XlpExUhusoRYDLFIPVIvVrsA5ReijyFGAARz4Lm', NULL, '2023-03-06 10:04:20', '2023-03-06 10:04:20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL),
(6, NULL, 'Customer', '3', '9393939393', 'def.png', 'customer3@gmail.com', NULL, '$2y$10$dKY1p2cuZyTVLXBZRloFUeNX/4n.tNhZ2eOT5B4bFkXM0dv0V08xi', NULL, '2023-03-06 12:06:27', '2023-03-06 12:06:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `debit` decimal(24,3) NOT NULL DEFAULT 0.000,
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT 0.000,
  `balance` decimal(24,3) NOT NULL DEFAULT 0.000,
  `transaction_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallet_transactions`
--

INSERT INTO `wallet_transactions` (`id`, `user_id`, `transaction_id`, `credit`, `debit`, `admin_bonus`, `balance`, `transaction_type`, `reference`, `created_at`, `updated_at`) VALUES
(1, 3, 'a0b6fc15-ada7-4bfa-bb4e-64c1576146a7', '320.000', '0.000', '0.000', '320.000', 'order_refund', 'order_refund', '2023-02-10 11:45:58', '2023-02-10 11:45:58'),
(2, 4, 'ef3ff951-7763-45f0-8f4e-dac4f2b8eb7d', '1.400', '0.000', '0.000', '1.400', 'loyalty_point', 'point_to_wallet', '2023-02-11 08:05:59', '2023-02-11 08:05:59'),
(3, 4, '5bdc6f54-4ab7-4c93-824d-a1a905e9f9a0', '13.500', '0.000', '0.000', '14.900', 'loyalty_point', 'point_to_wallet', '2023-02-11 08:06:51', '2023-02-11 08:06:51');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2023-02-09 09:54:23', '2023-02-09 09:54:23'),
(2, 2, 3, '2023-02-09 11:37:42', '2023-02-09 11:37:42'),
(3, 2, 4, '2023-02-10 05:25:14', '2023-02-10 05:25:14'),
(4, 3, 4, '2023-02-10 09:06:39', '2023-02-10 09:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) DEFAULT NULL,
  `delivery_man_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_requests`
--

INSERT INTO `withdraw_requests` (`id`, `seller_id`, `delivery_man_id`, `admin_id`, `amount`, `transaction_note`, `approved`, `created_at`, `updated_at`, `checked`) VALUES
(1, 1, NULL, NULL, '2000', 'okay proceed', 1, '2023-02-11 05:51:25', '2023-02-11 05:54:41', 1),
(2, 1, NULL, NULL, '2460.5', NULL, 1, '2023-02-13 04:15:39', '2023-03-11 08:38:24', 1),
(3, 3, NULL, NULL, '100', NULL, 1, '2023-03-11 07:59:51', '2023-03-17 05:12:42', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deliveryman_notifications`
--
ALTER TABLE `deliveryman_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliveryman_wallets`
--
ALTER TABLE `deliveryman_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_country_codes`
--
ALTER TABLE `delivery_country_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_man_transactions`
--
ALTER TABLE `delivery_man_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `delivery_zip_codes`
--
ALTER TABLE `delivery_zip_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emergency_contacts`
--
ALTER TABLE `emergency_contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100026;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_expected_delivery_histories`
--
ALTER TABLE `order_expected_delivery_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status_histories`
--
ALTER TABLE `order_status_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
