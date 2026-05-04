-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2026 at 06:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wmsu_documents`
--

-- --------------------------------------------------------

--
-- Table structure for table `document_files`
--

CREATE TABLE `document_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `document_type` enum('memorandum_order','special_order','travel_order') NOT NULL,
  `document_id` int(10) UNSIGNED NOT NULL,
  `original_name` varchar(255) NOT NULL,
  `stored_name` varchar(255) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `file_size` int(10) UNSIGNED DEFAULT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `ocr_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_files`
--

INSERT INTO `document_files` (`id`, `document_type`, `document_id`, `original_name`, `stored_name`, `file_path`, `mime_type`, `file_size`, `uploaded_at`, `ocr_text`) VALUES
(8, 'special_order', 2, '686483316_122182646240470993_7865671668863214793_n.jpg', 'cf13241c288c2fe1bbeeaa311248f31c.jpg', 'uploads/documents/cf13241c288c2fe1bbeeaa311248f31c.jpg', 'image/jpeg', 69482, '2026-04-30 15:56:57', NULL),
(10, 'travel_order', 2, '596810085_25557492853845413_2827551230665253012_n.jpg', '0004a15954ae9a0f41a7436148bcaa57.jpg', 'uploads/documents/0004a15954ae9a0f41a7436148bcaa57.jpg', 'image/jpeg', 29629, '2026-04-30 16:05:18', NULL),
(11, 'special_order', 3, 'wmsu_background.jpg', 'b6a29b56f8077e5281d620c16d6e5b56.jpg', 'uploads/documents/b6a29b56f8077e5281d620c16d6e5b56.jpg', 'image/jpeg', 142995, '2026-05-02 12:15:38', NULL),
(12, 'special_order', 5, 'wmsu_background.jpg', '0940bbaeeb7389d871998ebe5b96f75f.jpg', 'uploads/documents/0940bbaeeb7389d871998ebe5b96f75f.jpg', 'image/jpeg', 142995, '2026-05-02 12:18:03', NULL),
(13, 'special_order', 7, 'logo.png', '7defc32a83fadef6414c054d98447ff3.png', 'uploads/documents/7defc32a83fadef6414c054d98447ff3.png', 'image/png', 17670, '2026-05-03 03:36:33', NULL),
(14, 'special_order', 8, 'logo.png', '2adc82e83261770419000aba5e82e9f4.png', 'uploads/documents/2adc82e83261770419000aba5e82e9f4.png', 'image/png', 17670, '2026-05-03 04:14:59', NULL),
(15, 'special_order', 10, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', '38ee1621ace03db62b73379aa8efc360.jpg', 'uploads/documents/38ee1621ace03db62b73379aa8efc360.jpg', 'image/jpeg', 26990, '2026-05-03 09:52:02', NULL),
(16, 'special_order', 11, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', 'fef6c83ffad66e6b141a172c8f6882a0.jpg', 'uploads/documents/fef6c83ffad66e6b141a172c8f6882a0.jpg', 'image/jpeg', 26990, '2026-05-03 10:02:58', '“6 MAKE TEXT\r\nSTAND OUT FROM\r\n\"). BACKGROUNDS” ~*~'),
(17, 'special_order', 12, 'Schedule-March-17-24-20260316234205.pdf', 'e5fdf3333ebf3d1d1edfd377255e6352.pdf', 'uploads/documents/e5fdf3333ebf3d1d1edfd377255e6352.pdf', 'application/pdf', 75116, '2026-05-03 10:08:55', NULL),
(18, 'special_order', 14, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', 'f2a93a8cda894c1d20e4d03b9e432dce.jpg', 'uploads/documents/f2a93a8cda894c1d20e4d03b9e432dce.jpg', 'image/jpeg', 26990, '2026-05-03 10:41:12', '“6 MAKE TEXT\r\nSTAND OUT FROM\r\n\"). BACKGROUNDS” ~*~'),
(31, 'special_order', 30, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', '12882f868b1a6e5569d3694479e3230d.jpg', 'uploads/documents/12882f868b1a6e5569d3694479e3230d.jpg', 'image/jpeg', 26990, '2026-05-03 12:12:03', NULL),
(32, 'special_order', 31, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', '62084210327ccd3cae790d24abf1c43b.jpg', 'uploads/documents/62084210327ccd3cae790d24abf1c43b.jpg', 'image/jpeg', 26990, '2026-05-03 12:13:07', NULL),
(33, 'special_order', 32, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', '6e8148193c24ac96f1f82bc91dc682a6.jpg', 'uploads/documents/6e8148193c24ac96f1f82bc91dc682a6.jpg', 'image/jpeg', 26990, '2026-05-03 12:35:53', NULL),
(34, 'special_order', 33, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', 'ad172158b6ca6e8cd2a152855e547dc0.jpg', 'uploads/documents/ad172158b6ca6e8cd2a152855e547dc0.jpg', 'image/jpeg', 38153, '2026-05-03 12:41:19', 'MAKE TEXT\r\nSTAND OUT FROM\r\nBACKGROUNDS ??'),
(35, 'special_order', 34, 'Schedule-March-17-24-20260316234205.pdf', 'a2578f75f571d004e8ed4be947c6e43e.pdf', 'uploads/documents/a2578f75f571d004e8ed4be947c6e43e.pdf', 'application/pdf', 75116, '2026-05-03 12:42:04', NULL),
(36, 'special_order', 35, 'Schedule-March-17-24-20260316234205.pdf', '18d6aae5acb560b4f47691edc677af8e.pdf', 'uploads/documents/18d6aae5acb560b4f47691edc677af8e.pdf', 'application/pdf', 75116, '2026-05-04 10:42:53', NULL),
(37, 'special_order', 36, 'Schedule-March-17-24-20260316234205.pdf', 'f8a9386c5dedc2464e5b3928b5f3f544.pdf', 'uploads/documents/f8a9386c5dedc2464e5b3928b5f3f544.pdf', 'application/pdf', 75116, '2026-05-04 10:44:25', NULL),
(38, 'special_order', 37, 'Schedule-March-17-24-20260316234205.pdf', '119d2a27902dec7373939bfd6fe76c82.pdf', 'uploads/documents/119d2a27902dec7373939bfd6fe76c82.pdf', 'application/pdf', 75116, '2026-05-04 10:56:11', NULL),
(39, 'special_order', 38, 'Schedule-March-17-24-20260316234205.pdf', '04f1d54e7381a55de15a84fd98cda743.pdf', 'uploads/documents/04f1d54e7381a55de15a84fd98cda743.pdf', 'application/pdf', 75116, '2026-05-04 10:59:13', NULL),
(40, 'special_order', 39, 'FR-09_PROGRESS_REPORT_FORM (1).docx', 'c460861c2781a71144f486e94c3e4d37.docx', 'uploads/documents/c460861c2781a71144f486e94c3e4d37.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1149283, '2026-05-04 11:15:13', NULL),
(41, 'travel_order', 3, 'FR-09_PROGRESS_REPORT_FORM (1).docx', '2d145666ac2dc4b5b9803f8af11efad1.docx', 'uploads/documents/2d145666ac2dc4b5b9803f8af11efad1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 1149283, '2026-05-04 11:35:32', NULL),
(42, '', 6, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', '738ee1ed27c2cb3fea6785c56fb11764.jpg', 'uploads/documents/738ee1ed27c2cb3fea6785c56fb11764.jpg', 'image/jpeg', 38153, '2026-05-04 12:53:20', NULL),
(43, 'special_order', 40, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', '3134c50603b9e8b358395556de1403f5.jpg', 'uploads/documents/3134c50603b9e8b358395556de1403f5.jpg', 'image/jpeg', 38153, '2026-05-04 13:22:48', 'MAKE TEXT\r\nSTAND OUT FROM\r\nBACKGROUNDS ??'),
(44, '', 7, 'How-to-Make-Text-Stand-Out-And-More-Readable.jpg', 'ff655ce689b7ecc93021ea257906ee74.jpg', 'uploads/documents/ff655ce689b7ecc93021ea257906ee74.jpg', 'image/jpeg', 38153, '2026-05-04 13:23:50', NULL),
(45, '', 8, 'FR-09_PROGRESS_REPORT_FORM.docx', '9474a17d3ca489cd06ffbbf39058e30b.docx', 'uploads/documents/9474a17d3ca489cd06ffbbf39058e30b.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 436464, '2026-05-04 13:26:03', NULL),
(46, 'special_order', 41, 'FR-09_PROGRESS_REPORT_FORM.docx', 'a15d1a02b885d3d4274e67e7864c64fb.docx', 'uploads/documents/a15d1a02b885d3d4274e67e7864c64fb.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 436464, '2026-05-04 13:27:40', NULL),
(47, '', 9, 'FR-09_PROGRESS_REPORT_FORM.docx', 'a46a7614eb8840032e3c8178a74e12a1.docx', 'uploads/documents/a46a7614eb8840032e3c8178a74e12a1.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 436464, '2026-05-04 13:28:16', NULL),
(48, 'special_order', 42, 'FR-015_FINAL_REPORT_FORM.docx', 'a396202d70138d6f259cbe76c974dc4a.docx', 'uploads/documents/a396202d70138d6f259cbe76c974dc4a.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 483270, '2026-05-04 13:31:10', NULL),
(49, 'memorandum_order', 10, 'FR-015_FINAL_REPORT_FORM.docx', 'd2f312702b3da5cd6b4b7230d8aa67ac.docx', 'uploads/documents/d2f312702b3da5cd6b4b7230d8aa67ac.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 483270, '2026-05-04 14:25:18', NULL),
(50, 'memorandum_order', 11, 'Schedule-March-17-24-20260316234205.pdf', 'a20eb029ae1664038e488ecbeced3bdc.pdf', 'uploads/documents/a20eb029ae1664038e488ecbeced3bdc.pdf', 'application/pdf', 75116, '2026-05-04 14:32:56', NULL),
(51, 'special_order', 43, 'Schedule-March-17-24-20260316234205.pdf', '8a59a9459e84c902bf6154607fd87414.pdf', 'uploads/documents/8a59a9459e84c902bf6154607fd87414.pdf', 'application/pdf', 75116, '2026-05-04 14:41:01', NULL),
(52, 'memorandum_order', 12, 'Schedule-March-17-24-20260316234205.pdf', 'a03a8525ec77cb9705a9ab1b8c4a2532.pdf', 'uploads/documents/a03a8525ec77cb9705a9ab1b8c4a2532.pdf', 'application/pdf', 75116, '2026-05-04 14:52:56', NULL),
(53, 'memorandum_order', 13, 'WMSU_Special_Order_123_softcopy.pdf', 'e43ca515657435308f5325e812464d23.pdf', 'uploads/documents/e43ca515657435308f5325e812464d23.pdf', 'application/pdf', 9157, '2026-05-04 14:54:22', NULL),
(54, 'memorandum_order', 14, 'WMSU_Special_Order_123_softcopy.pdf', '4c60e69c1e7f54f791b0ba8dfcf1243d.pdf', 'uploads/documents/4c60e69c1e7f54f791b0ba8dfcf1243d.pdf', 'application/pdf', 9157, '2026-05-04 14:56:19', NULL),
(55, 'memorandum_order', 15, 'WMSU_Special_Order_123_softcopy.pdf', 'e548f3e0e6b1da324d974c7eef3ca73c.pdf', 'uploads/documents/e548f3e0e6b1da324d974c7eef3ca73c.pdf', 'application/pdf', 9157, '2026-05-04 14:59:53', NULL),
(56, 'memorandum_order', 16, 'Schedule-March-17-24-20260316234205.pdf', '73c6a5238d23edc96170f8b2c721e12b.pdf', 'uploads/documents/73c6a5238d23edc96170f8b2c721e12b.pdf', 'application/pdf', 75116, '2026-05-04 15:12:20', NULL),
(57, 'travel_order', 4, 'Schedule-March-17-24-20260316234205.pdf', '3fbaa9e0c2c846ffc5fcdb482a8616b8.pdf', 'uploads/documents/3fbaa9e0c2c846ffc5fcdb482a8616b8.pdf', 'application/pdf', 75116, '2026-05-04 15:38:25', NULL),
(58, 'travel_order', 6, 'Schedule-March-17-24-20260316234205.pdf', 'ccbe2e1849e26ba40cf7b8c4000804df.pdf', 'uploads/documents/ccbe2e1849e26ba40cf7b8c4000804df.pdf', 'application/pdf', 75116, '2026-05-04 15:41:26', NULL),
(59, 'travel_order', 7, 'Schedule-March-17-24-20260316234205.pdf', 'ec8c2355e6aee67b2d6f2254a5a45c15.pdf', 'uploads/documents/ec8c2355e6aee67b2d6f2254a5a45c15.pdf', 'application/pdf', 75116, '2026-05-04 15:43:33', NULL),
(60, 'special_order', 44, 'Schedule-March-17-24-20260316234205.pdf', '8e67c5a2ee4fab00fac3006f34b33f56.pdf', 'uploads/documents/8e67c5a2ee4fab00fac3006f34b33f56.pdf', 'application/pdf', 75116, '2026-05-04 15:46:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `document_history`
--

CREATE TABLE `document_history` (
  `id` int(11) NOT NULL,
  `document_type` enum('Travel Order','Memorandum Order','Special Order') NOT NULL,
  `document_id` int(11) NOT NULL,
  `document_number` varchar(50) NOT NULL,
  `action` enum('Created','Updated','Released','Received','Cancelled') NOT NULL,
  `action_by` int(11) DEFAULT NULL COMMENT 'User ID',
  `action_details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_history`
--

INSERT INTO `document_history` (`id`, `document_type`, `document_id`, `document_number`, `action`, `action_by`, `action_details`, `created_at`) VALUES
(8, 'Memorandum Order', 5, 'MO-2026-001', 'Released', NULL, 'Document released to recipients', '2026-04-30 15:43:21'),
(9, 'Special Order', 2, 'S0-001', 'Released', NULL, 'Document released to recipients', '2026-04-30 15:56:57'),
(10, 'Special Order', 2, 'S0-001', 'Received', NULL, 'Document received by sl201101795@wmsu.edu.ph with feedback: alright', '2026-04-30 15:57:19'),
(12, 'Travel Order', 2, 'IO-2026-001', 'Released', NULL, 'Document released to recipients', '2026-04-30 16:05:18'),
(13, 'Special Order', 3, '123', 'Released', 7, 'Document released to recipients', '2026-05-02 12:15:38'),
(14, 'Special Order', 3, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-02 12:16:44'),
(15, 'Special Order', 5, '124', 'Released', 6, 'Document released to recipients', '2026-05-02 12:18:03'),
(16, 'Special Order', 7, '123', 'Released', 7, 'Document released to recipients', '2026-05-03 03:36:33'),
(17, 'Special Order', 7, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 03:38:25'),
(18, 'Special Order', 8, '123', 'Released', 7, 'Document released to recipients', '2026-05-03 04:14:59'),
(19, 'Special Order', 8, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 05:53:46'),
(20, 'Special Order', 10, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 09:52:02'),
(21, 'Special Order', 10, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 09:58:54'),
(22, 'Special Order', 11, '123', 'Released', 7, 'Document released to recipients', '2026-05-03 10:02:58'),
(23, 'Special Order', 12, '321', 'Released', 6, 'Document released to recipients', '2026-05-03 10:08:55'),
(24, 'Special Order', 12, '321', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 10:10:11'),
(25, 'Special Order', 11, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 10:10:35'),
(26, 'Special Order', 14, '123', 'Released', 7, 'Document released to recipients', '2026-05-03 10:41:12'),
(27, 'Special Order', 14, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 10:42:02'),
(28, 'Special Order', 15, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 10:48:12'),
(29, 'Special Order', 15, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 10:48:33'),
(30, 'Special Order', 16, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 10:51:48'),
(31, 'Special Order', 16, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 10:52:14'),
(32, 'Special Order', 17, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 10:53:57'),
(33, 'Special Order', 17, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 10:54:10'),
(34, 'Special Order', 18, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:08:13'),
(35, 'Special Order', 18, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:08:24'),
(36, 'Special Order', 19, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:11:21'),
(37, 'Special Order', 19, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:11:35'),
(38, 'Special Order', 20, '321', 'Released', 6, 'Document released to recipients', '2026-05-03 11:15:58'),
(39, 'Special Order', 20, '321', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:16:14'),
(40, 'Special Order', 22, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:25:24'),
(41, 'Special Order', 22, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:25:40'),
(42, 'Special Order', 24, '123321', 'Released', 6, 'Document released to recipients', '2026-05-03 11:35:14'),
(43, 'Special Order', 24, '123321', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:35:23'),
(44, 'Special Order', 25, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:37:00'),
(45, 'Special Order', 25, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:37:35'),
(46, 'Special Order', 27, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:39:00'),
(47, 'Special Order', 27, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:39:41'),
(48, 'Special Order', 28, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:40:57'),
(49, 'Special Order', 28, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:41:13'),
(50, 'Special Order', 29, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 11:47:17'),
(51, 'Special Order', 29, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 11:47:28'),
(52, 'Special Order', 30, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 12:12:03'),
(53, 'Special Order', 30, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 12:12:27'),
(54, 'Special Order', 31, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 12:13:07'),
(55, 'Special Order', 31, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 12:13:24'),
(56, 'Special Order', 32, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 12:35:53'),
(57, 'Special Order', 32, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 12:36:17'),
(58, 'Special Order', 33, '123', 'Released', 6, 'Document released to recipients', '2026-05-03 12:41:19'),
(59, 'Special Order', 33, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 12:41:40'),
(60, 'Special Order', 34, '122', 'Released', 6, 'Document released to recipients', '2026-05-03 12:42:04'),
(61, 'Special Order', 34, '122', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-03 12:42:25'),
(62, 'Special Order', 35, '6745546', 'Released', 6, 'Document released to recipients', '2026-05-04 10:42:53'),
(63, 'Special Order', 35, '6745546', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 10:43:49'),
(64, 'Special Order', 36, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 10:44:25'),
(65, 'Special Order', 36, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 10:44:41'),
(66, 'Special Order', 37, '122', 'Released', 6, 'Document released to recipients', '2026-05-04 10:56:11'),
(67, 'Special Order', 38, '1111', 'Released', 6, 'Document released to recipients', '2026-05-04 10:59:13'),
(68, 'Special Order', 38, '1111', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 10:59:29'),
(69, 'Special Order', 39, '546', 'Released', 6, 'Document released to recipients', '2026-05-04 11:15:13'),
(70, 'Special Order', 39, '546', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 11:15:35'),
(71, 'Travel Order', 3, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 11:35:32'),
(72, 'Travel Order', 3, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 11:36:59'),
(73, 'Special Order', 37, '122', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 11:37:08'),
(74, 'Memorandum Order', 6, '7687', 'Released', 6, 'Document released to recipients', '2026-05-04 12:53:20'),
(75, '', 6, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 12:53:37'),
(76, 'Special Order', 40, '888', 'Released', 6, 'Document released to recipients', '2026-05-04 13:22:48'),
(77, 'Special Order', 40, '888', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 13:23:06'),
(78, 'Memorandum Order', 7, '8889', 'Released', 6, 'Document released to recipients', '2026-05-04 13:23:50'),
(79, '', 7, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 13:24:15'),
(80, 'Memorandum Order', 8, '76567', 'Released', 6, 'Document released to recipients', '2026-05-04 13:26:03'),
(81, '', 8, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 13:26:20'),
(82, 'Special Order', 41, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 13:27:40'),
(83, 'Special Order', 41, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 13:27:57'),
(84, 'Memorandum Order', 9, '321', 'Released', 6, 'Document released to recipients', '2026-05-04 13:28:16'),
(85, '', 9, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 13:28:34'),
(86, 'Special Order', 42, '543', 'Released', 6, 'Document released to recipients', '2026-05-04 13:31:10'),
(87, 'Special Order', 42, '543', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 13:37:13'),
(88, 'Memorandum Order', 10, '5345', 'Released', 6, 'Document released to recipients', '2026-05-04 14:25:18'),
(89, '', 10, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 14:25:43'),
(90, 'Memorandum Order', 11, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 14:32:56'),
(91, '', 11, '', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 14:33:30'),
(92, 'Special Order', 43, '321', 'Released', 6, 'Document released to recipients', '2026-05-04 14:41:01'),
(93, 'Special Order', 43, '321', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 14:41:13'),
(94, 'Memorandum Order', 12, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 14:52:56'),
(95, 'Memorandum Order', 12, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 14:53:52'),
(96, 'Memorandum Order', 13, '231', 'Released', 6, 'Document released to recipients', '2026-05-04 14:54:22'),
(97, 'Memorandum Order', 13, '231', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 14:54:38'),
(98, 'Memorandum Order', 14, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 14:56:19'),
(99, 'Memorandum Order', 14, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 14:57:05'),
(100, 'Memorandum Order', 14, '123', 'Received', 7, 'Document received by admin@wmsu.edu.ph', '2026-05-04 14:58:20'),
(101, 'Memorandum Order', 15, '123', 'Released', 7, 'Document released to recipients', '2026-05-04 14:59:53'),
(102, 'Memorandum Order', 15, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 15:11:37'),
(103, 'Memorandum Order', 16, 'asd', 'Released', 6, 'Document released to recipients', '2026-05-04 15:12:20'),
(104, 'Memorandum Order', 16, 'asd', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 15:12:53'),
(105, 'Memorandum Order', 16, '', 'Received', NULL, 'Document received by sl201101795@wmsu.edu.ph', '2026-05-04 15:18:13'),
(106, 'Travel Order', 4, '123', 'Released', 7, 'Document released to recipients', '2026-05-04 15:38:25'),
(107, 'Travel Order', 4, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 15:39:52'),
(108, 'Travel Order', 6, '432', 'Released', 6, 'Document released to recipients', '2026-05-04 15:41:26'),
(109, 'Travel Order', 6, '432', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 15:42:12'),
(110, 'Travel Order', 6, '432', 'Received', 7, 'Document received by admin@wmsu.edu.ph', '2026-05-04 15:42:24'),
(111, 'Travel Order', 7, '123', 'Released', 6, 'Document released to recipients', '2026-05-04 15:43:33'),
(112, 'Travel Order', 7, '123', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 15:43:47'),
(113, 'Special Order', 44, 'asd', 'Released', 6, 'Document released to recipients', '2026-05-04 15:46:52'),
(114, 'Special Order', 44, 'asd', 'Received', 6, 'Document received by eh202204534@wmsu.edu.ph', '2026-05-04 15:57:16');

-- --------------------------------------------------------

--
-- Table structure for table `document_recipients`
--

CREATE TABLE `document_recipients` (
  `id` int(11) NOT NULL,
  `document_type` enum('Travel Order','Memorandum Order','Special Order') NOT NULL,
  `document_id` int(11) NOT NULL COMMENT 'ID from respective table',
  `recipient_id` int(11) NOT NULL COMMENT 'References recipient_groups.id',
  `recipient_email` varchar(255) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `status` enum('Pending','Sent','Received','Failed') DEFAULT 'Pending',
  `token` varchar(64) DEFAULT NULL,
  `released_at` timestamp NULL DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT 0,
  `confirmation_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memorandum_orders`
--

CREATE TABLE `memorandum_orders` (
  `id` int(11) NOT NULL,
  `mo_number` varchar(50) NOT NULL COMMENT 'M.O. Number',
  `document_year` int(11) NOT NULL,
  `document_month` varchar(20) NOT NULL,
  `concerned_faculty` varchar(255) NOT NULL,
  `college_dept` varchar(100) DEFAULT NULL COMMENT 'College/Department',
  `subject` text NOT NULL,
  `date_issued` date NOT NULL,
  `destination_duration` text DEFAULT NULL,
  `effectivity_start` date DEFAULT NULL,
  `effectivity_end` date DEFAULT NULL,
  `rf` varchar(100) DEFAULT NULL COMMENT 'Reference Field',
  `source` varchar(100) DEFAULT NULL COMMENT 'Pres-MCO, etc.',
  `no_partly` varchar(50) DEFAULT NULL COMMENT 'No. Partly',
  `remarks` text DEFAULT NULL,
  `document_file` varchar(255) DEFAULT NULL COMMENT 'Scanned document path',
  `sender_email` varchar(255) NOT NULL,
  `status` enum('Draft','Released','Received','Cancelled') DEFAULT 'Draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_type` enum('Document Released','Confirmation Received','System Alert') NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `document_type` enum('Travel Order','Memorandum Order','Special Order') DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `notification_type`, `title`, `message`, `document_type`, `document_id`, `is_read`, `read_at`, `created_at`) VALUES
(11, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Special Order', 3, 0, NULL, '2026-05-02 12:15:44'),
(12, 7, 'Document Released', 'Document Released: Special Order', 'Document 124 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 5, 0, NULL, '2026-05-02 12:18:09'),
(13, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Special Order', 7, 0, NULL, '2026-05-03 03:36:39'),
(14, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Special Order', 8, 0, NULL, '2026-05-03 04:15:04'),
(15, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 10, 0, NULL, '2026-05-03 09:52:08'),
(16, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Special Order', 11, 0, NULL, '2026-05-03 10:03:04'),
(17, 6, 'Document Released', 'Document Released: Special Order', 'Document 321 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 12, 0, NULL, '2026-05-03 10:09:00'),
(18, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Special Order', 14, 0, NULL, '2026-05-03 10:41:17'),
(19, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 15, 0, NULL, '2026-05-03 10:48:17'),
(20, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 16, 0, NULL, '2026-05-03 10:51:54'),
(21, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 17, 0, NULL, '2026-05-03 10:54:03'),
(22, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 18, 0, NULL, '2026-05-03 11:08:18'),
(23, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 19, 0, NULL, '2026-05-03 11:11:27'),
(24, 6, 'Document Released', 'Document Released: Special Order', 'Document 321 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 20, 0, NULL, '2026-05-03 11:16:04'),
(25, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 22, 0, NULL, '2026-05-03 11:25:30'),
(26, 6, 'Document Released', 'Document Released: Special Order', 'Document 123321 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 24, 0, NULL, '2026-05-03 11:35:19'),
(27, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 25, 0, NULL, '2026-05-03 11:37:06'),
(28, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 27, 0, NULL, '2026-05-03 11:39:05'),
(29, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 28, 0, NULL, '2026-05-03 11:41:02'),
(30, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 29, 0, NULL, '2026-05-03 11:47:24'),
(31, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 30, 0, NULL, '2026-05-03 12:12:08'),
(32, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 31, 0, NULL, '2026-05-03 12:13:13'),
(33, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 32, 0, NULL, '2026-05-03 12:36:00'),
(34, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 33, 0, NULL, '2026-05-03 12:41:25'),
(35, 6, 'Document Released', 'Document Released: Special Order', 'Document 122 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 34, 0, NULL, '2026-05-03 12:42:10'),
(36, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 36, 0, NULL, '2026-05-04 10:44:32'),
(37, 6, 'Document Released', 'Document Released: Special Order', 'Document 122 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 37, 0, NULL, '2026-05-04 10:56:17'),
(38, 6, 'Document Released', 'Document Released: Special Order', 'Document 1111 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 38, 0, NULL, '2026-05-04 10:59:19'),
(39, 6, 'Document Released', 'Document Released: Special Order', 'Document 546 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 39, 0, NULL, '2026-05-04 11:15:27'),
(40, 6, 'Document Released', 'Document Released: Travel Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Travel Order', 3, 0, NULL, '2026-05-04 11:35:46'),
(41, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 7687 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 6, 0, NULL, '2026-05-04 12:53:25'),
(42, 6, 'Document Released', 'Document Released: Special Order', 'Document 888 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 40, 0, NULL, '2026-05-04 13:22:55'),
(43, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 8889 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 7, 0, NULL, '2026-05-04 13:23:56'),
(44, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 76567 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 8, 0, NULL, '2026-05-04 13:26:12'),
(45, 6, 'Document Released', 'Document Released: Special Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 41, 0, NULL, '2026-05-04 13:27:48'),
(46, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 321 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 9, 0, NULL, '2026-05-04 13:28:25'),
(47, 6, 'Document Released', 'Document Released: Special Order', 'Document 543 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 42, 0, NULL, '2026-05-04 13:31:19'),
(48, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 5345 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 10, 0, NULL, '2026-05-04 14:25:35'),
(49, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 11, 0, NULL, '2026-05-04 14:33:05'),
(50, 6, 'Document Released', 'Document Released: Special Order', 'Document 321 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 43, 0, NULL, '2026-05-04 14:41:07'),
(51, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 231 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 13, 0, NULL, '2026-05-04 14:54:27'),
(52, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 14, 0, NULL, '2026-05-04 14:56:25'),
(53, 7, 'Document Released', 'Document Released: Memorandum Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 14, 0, NULL, '2026-05-04 14:56:30'),
(54, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Memorandum Order', 15, 0, NULL, '2026-05-04 14:59:59'),
(55, 6, 'Document Released', 'Document Released: Memorandum Order', 'Document asd has been released to you by eh202204534@wmsu.edu.ph', 'Memorandum Order', 16, 0, NULL, '2026-05-04 15:12:27'),
(57, 6, 'Document Released', 'Document Released: Travel Order', 'Document 123 has been released to you by admin@wmsu.edu.ph', 'Travel Order', 4, 0, NULL, '2026-05-04 15:38:35'),
(58, 6, 'Document Released', 'Document Released: Travel Order', 'Document 432 has been released to you by eh202204534@wmsu.edu.ph', 'Travel Order', 6, 0, NULL, '2026-05-04 15:41:32'),
(59, 7, 'Document Released', 'Document Released: Travel Order', 'Document 432 has been released to you by eh202204534@wmsu.edu.ph', 'Travel Order', 6, 0, NULL, '2026-05-04 15:41:38'),
(60, 6, 'Document Released', 'Document Released: Travel Order', 'Document 123 has been released to you by eh202204534@wmsu.edu.ph', 'Travel Order', 7, 0, NULL, '2026-05-04 15:43:39'),
(61, 6, 'Document Released', 'Document Released: Special Order', 'Document asd has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 44, 0, NULL, '2026-05-04 15:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `receivers`
--

CREATE TABLE `receivers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` varchar(100) NOT NULL,
  `role` enum('FACULTY','STAFF','STUDENT','ADMIN') NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receivers`
--

INSERT INTO `receivers` (`id`, `name`, `department`, `role`, `email`, `created_at`) VALUES
(1, 'MARK CRUZ', 'BSIT', 'FACULTY', NULL, '2026-03-23 11:39:34'),
(2, 'ANNA REYES', 'COE', 'STAFF', NULL, '2026-03-23 11:39:34'),
(3, 'JOSE SANTOS', 'CCS', 'FACULTY', NULL, '2026-03-23 11:39:34'),
(4, 'MARIA DELA CRUZ', 'CTE', 'ADMIN', NULL, '2026-03-23 11:39:34'),
(5, 'PEDRO GARCIA', 'COL', 'STUDENT', NULL, '2026-03-23 11:39:34'),
(6, 'Jason A. Catadman', 'IT DEPARTMENT', 'FACULTY', 'jasonacatadman@wmsu.edu.ph', '2026-03-23 11:44:46'),
(9, 'Jolouis Sardani', 'N/A', 'STAFF', 'eh202204534@wmsu.edu.ph', '2026-05-01 06:07:50'),
(10, 'admin', 'N/A', 'ADMIN', 'admin@wmsu.edu.ph', '2026-05-01 06:09:10');

-- --------------------------------------------------------

--
-- Table structure for table `recipient_groups`
--

CREATE TABLE `recipient_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `college` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `category` enum('Executive','Academic','Admin','Faculty','Staff','Student') DEFAULT 'Staff',
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipient_groups`
--

INSERT INTO `recipient_groups` (`id`, `group_name`, `email`, `department`, `college`, `position`, `category`, `active`, `created_at`, `updated_at`) VALUES
(1, 'University President', 'president@wmsu.edu.ph', 'Executive Office', '', 'President', 'Executive', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(2, 'Vice President - Academic Affairs', 'vp.academic@wmsu.edu.ph', 'Academic Affairs', '', 'Vice President', 'Executive', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(3, 'Vice President - Administration', 'vp.admin@wmsu.edu.ph', 'Administration', '', 'Vice President', 'Executive', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(4, 'Dean - College of Computing Studies', 'dean.ccs@wmsu.edu.ph', 'Academic', 'CCS', 'Dean', 'Academic', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(5, 'Dean - College of Engineering', 'dean.engineering@wmsu.edu.ph', 'Academic', 'Engineering', 'Dean', 'Academic', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(6, 'Dean - College of Arts and Sciences', 'dean.cas@wmsu.edu.ph', 'Academic', 'CAS', 'Dean', 'Academic', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(7, 'Registrar Office', 'registrar@wmsu.edu.ph', 'Registrar', '', 'University Registrar', 'Admin', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(8, 'Human Resources', 'hr@wmsu.edu.ph', 'Human Resources', '', 'HR Director', 'Admin', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(9, 'Finance Office', 'finance@wmsu.edu.ph', 'Finance', '', 'Finance Officer', 'Admin', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(10, 'Budget Office', 'budget@wmsu.edu.ph', 'Budget', '', 'Budget Officer', 'Admin', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(11, 'Faculty Head - IT Department', 'faculty.it@wmsu.edu.ph', 'IT Department', 'CCS', 'Department Head', 'Faculty', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(12, 'Faculty Head - CS Department', 'faculty.cs@wmsu.edu.ph', 'CS Department', 'CCS', 'Department Head', 'Faculty', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(13, 'Student Affairs Office', 'student.affairs@wmsu.edu.ph', 'Student Affairs', '', 'Director', 'Staff', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(14, 'Library Services', 'library@wmsu.edu.ph', 'Library', '', 'Chief Librarian', 'Staff', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33'),
(15, 'Admission Office', 'admission@wmsu.edu.ph', 'Admission', '', 'Admission Officer', 'Staff', 1, '2026-03-17 23:15:33', '2026-03-17 23:15:33');

-- --------------------------------------------------------

--
-- Table structure for table `special_orders`
--

CREATE TABLE `special_orders` (
  `id` int(11) NOT NULL,
  `so_number` varchar(50) NOT NULL COMMENT 'S.O.# Number',
  `document_year` int(11) NOT NULL,
  `document_month` varchar(20) NOT NULL,
  `concerned_faculty` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `date_issued` date NOT NULL,
  `effectivity` text DEFAULT NULL COMMENT 'Effective immediately, specific date, etc.',
  `effectivity_date` date DEFAULT NULL,
  `source_signatory` varchar(100) DEFAULT NULL COMMENT 'Pres-MCO, etc.',
  `remarks` text DEFAULT NULL,
  `document_file` varchar(255) DEFAULT NULL COMMENT 'Scanned document path',
  `sender_email` varchar(255) NOT NULL,
  `status` enum('Draft','Released','Received','Cancelled') DEFAULT 'Draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `setting_key`, `setting_value`, `description`, `updated_at`, `updated_by`) VALUES
(1, 'site_name', 'WMSU Document Release System', 'System name', '2026-03-17 23:15:33', NULL),
(2, 'smtp_host', 'smtp.gmail.com', 'Email SMTP host', '2026-03-17 23:15:33', NULL),
(3, 'smtp_port', '587', 'Email SMTP port', '2026-03-17 23:15:33', NULL),
(4, 'sender_email', 'noreply@wmsu.edu.ph', 'System sender email', '2026-03-17 23:15:33', NULL),
(5, 'max_file_size', '10485760', 'Max upload size in bytes (10MB)', '2026-03-17 23:15:33', NULL),
(6, 'allowed_extensions', 'pdf,jpg,jpeg,png', 'Allowed file extensions', '2026-03-17 23:15:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `travel_orders`
--

CREATE TABLE `travel_orders` (
  `id` int(11) NOT NULL,
  `io_number` varchar(50) NOT NULL COMMENT 'I.O. Number',
  `document_year` int(11) NOT NULL,
  `document_month` varchar(20) NOT NULL,
  `employee_name` varchar(255) NOT NULL COMMENT 'Employee/Admin/Officials/Head and Employee',
  `office` varchar(100) DEFAULT NULL COMMENT 'Office/Department',
  `subject` text NOT NULL,
  `date_issued` date NOT NULL,
  `duration_and_destination` text DEFAULT NULL COMMENT 'Duration and Destination',
  `travel_start_date` date DEFAULT NULL,
  `travel_end_date` date DEFAULT NULL,
  `destination` varchar(255) DEFAULT NULL,
  `fund_assistance` decimal(10,2) DEFAULT 0.00,
  `source` varchar(100) DEFAULT NULL COMMENT 'Pres-MCO, Budget, etc.',
  `no_partly` varchar(50) DEFAULT NULL COMMENT 'No. Partly',
  `remarks` text DEFAULT NULL,
  `document_file` varchar(255) DEFAULT NULL COMMENT 'Scanned document path',
  `sender_email` varchar(255) NOT NULL,
  `status` enum('Draft','Released','Received','Cancelled') DEFAULT 'Draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `role` enum('Admin','Staff','Faculty','Employee') DEFAULT 'Staff',
  `department` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `full_name`, `role`, `department`, `position`, `is_active`, `created_at`, `updated_at`, `last_login`) VALUES
(6, 'JO', 'eh202204534@wmsu.edu.ph', '$2y$10$mJEb0N3K2SGIRYmnMBFg8OUK8roG/lw9dMZwlrWKsrFqwre70yF/a', 'Jolouis Sardani', 'Staff', '', '', 1, '2026-05-01 06:07:50', '2026-05-04 15:42:40', '2026-05-04 23:42:40'),
(7, 'admin@wmsu.edu.ph', 'admin@wmsu.edu.ph', '$2y$10$zWQa6KYdpazF2GemqSnWiuJo28YMaOobjk3HXRaO4RHQyiWVt5h0q', 'admin', 'Admin', '', '', 1, '2026-05-01 06:09:10', '2026-05-04 15:42:21', '2026-05-04 23:42:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `document_files`
--
ALTER TABLE `document_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_history`
--
ALTER TABLE `document_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_document` (`document_type`,`document_id`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `action_by` (`action_by`);

--
-- Indexes for table `document_recipients`
--
ALTER TABLE `document_recipients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `confirmation_token` (`confirmation_token`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_document` (`document_type`,`document_id`),
  ADD KEY `idx_recipient` (`recipient_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_confirmation` (`confirmation_token`),
  ADD KEY `idx_document_lookup` (`document_type`,`document_id`,`status`);

--
-- Indexes for table `memorandum_orders`
--
ALTER TABLE `memorandum_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mo_number` (`mo_number`),
  ADD KEY `idx_mo_number` (`mo_number`),
  ADD KEY `idx_date_issued` (`date_issued`),
  ADD KEY `idx_concerned_faculty` (`concerned_faculty`(100)),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_year_month` (`document_year`,`document_month`),
  ADD KEY `created_by` (`created_by`);
ALTER TABLE `memorandum_orders` ADD FULLTEXT KEY `ft_search` (`subject`,`concerned_faculty`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_read` (`is_read`);

--
-- Indexes for table `receivers`
--
ALTER TABLE `receivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipient_groups`
--
ALTER TABLE `recipient_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_department` (`department`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `special_orders`
--
ALTER TABLE `special_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `so_number` (`so_number`),
  ADD KEY `idx_so_number` (`so_number`),
  ADD KEY `idx_date_issued` (`date_issued`),
  ADD KEY `idx_concerned_faculty` (`concerned_faculty`(100)),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_year_month` (`document_year`,`document_month`),
  ADD KEY `created_by` (`created_by`);
ALTER TABLE `special_orders` ADD FULLTEXT KEY `ft_search` (`subject`,`concerned_faculty`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `travel_orders`
--
ALTER TABLE `travel_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `io_number` (`io_number`),
  ADD KEY `idx_io_number` (`io_number`),
  ADD KEY `idx_date_issued` (`date_issued`),
  ADD KEY `idx_employee` (`employee_name`(100)),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_year_month` (`document_year`,`document_month`),
  ADD KEY `created_by` (`created_by`);
ALTER TABLE `travel_orders` ADD FULLTEXT KEY `ft_search` (`subject`,`employee_name`,`destination`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `document_files`
--
ALTER TABLE `document_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `document_history`
--
ALTER TABLE `document_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `document_recipients`
--
ALTER TABLE `document_recipients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `memorandum_orders`
--
ALTER TABLE `memorandum_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `recipient_groups`
--
ALTER TABLE `recipient_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `special_orders`
--
ALTER TABLE `special_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `travel_orders`
--
ALTER TABLE `travel_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `document_history`
--
ALTER TABLE `document_history`
  ADD CONSTRAINT `document_history_ibfk_1` FOREIGN KEY (`action_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `memorandum_orders`
--
ALTER TABLE `memorandum_orders`
  ADD CONSTRAINT `memorandum_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `special_orders`
--
ALTER TABLE `special_orders`
  ADD CONSTRAINT `special_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD CONSTRAINT `system_settings_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `travel_orders`
--
ALTER TABLE `travel_orders`
  ADD CONSTRAINT `travel_orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
