-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2026 at 03:21 PM
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
  `document_type` enum('memorandum','special_order','travel_order') NOT NULL,
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
(12, 'special_order', 5, 'wmsu_background.jpg', '0940bbaeeb7389d871998ebe5b96f75f.jpg', 'uploads/documents/0940bbaeeb7389d871998ebe5b96f75f.jpg', 'image/jpeg', 142995, '2026-05-02 12:18:03', NULL);

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
(15, 'Special Order', 5, '124', 'Released', 6, 'Document released to recipients', '2026-05-02 12:18:03');

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
(12, 7, 'Document Released', 'Document Released: Special Order', 'Document 124 has been released to you by eh202204534@wmsu.edu.ph', 'Special Order', 5, 0, NULL, '2026-05-02 12:18:09');

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
(9, 'Jolouis Sardani', 'N/A', 'ADMIN', 'eh202204534@wmsu.edu.ph', '2026-05-01 06:07:50'),
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

--
-- Dumping data for table `special_orders`
--

INSERT INTO `special_orders` (`id`, `so_number`, `document_year`, `document_month`, `concerned_faculty`, `subject`, `date_issued`, `effectivity`, `effectivity_date`, `source_signatory`, `remarks`, `document_file`, `sender_email`, `status`, `created_at`, `updated_at`, `created_by`, `deleted_at`) VALUES
(2, 'S0-001', 2026, 'April', 'John Mchales Backbone', 'this is how you do it', '2026-04-30', 'Effective Immediately', NULL, 'unsa mani oi', 'wews', 'uploads/documents/cf13241c288c2fe1bbeeaa311248f31c.jpg', 'sl201101795@wmsu.edu.ph', 'Released', '2026-04-30 15:56:57', '2026-04-30 15:56:57', NULL, NULL),
(3, '123', 2026, 'May', 'asd', 'asd', '2026-05-02', 'asd', NULL, 'asd', 'asd', 'uploads/documents/b6a29b56f8077e5281d620c16d6e5b56.jpg', 'admin@wmsu.edu.ph', 'Released', '2026-05-02 12:15:38', '2026-05-02 12:17:08', 7, '2026-05-02 20:17:08');

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

--
-- Dumping data for table `travel_orders`
--

INSERT INTO `travel_orders` (`id`, `io_number`, `document_year`, `document_month`, `employee_name`, `office`, `subject`, `date_issued`, `duration_and_destination`, `travel_start_date`, `travel_end_date`, `destination`, `fund_assistance`, `source`, `no_partly`, `remarks`, `document_file`, `sender_email`, `status`, `created_at`, `updated_at`, `created_by`, `deleted_at`) VALUES
(2, 'IO-2026-001', 2026, 'April', 'Aaron Flores', 'IT Department', 'Bisaya', '2026-04-30', NULL, '2026-05-04', '2026-05-08', 'Pagadian', 0.00, 'unsa mani oi ', NULL, 'Sardani Muslim', 'uploads/documents/0004a15954ae9a0f41a7436148bcaa57.jpg', 'sl201101795@wmsu.edu.ph', 'Released', '2026-04-30 16:05:18', '2026-04-30 16:05:18', NULL, NULL);

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
(6, 'JO', 'eh202204534@wmsu.edu.ph', '$2y$10$mJEb0N3K2SGIRYmnMBFg8OUK8roG/lw9dMZwlrWKsrFqwre70yF/a', 'Jolouis Sardani', 'Admin', '', '', 1, '2026-05-01 06:07:50', '2026-05-02 12:17:22', '2026-05-02 20:17:22'),
(7, 'admin@wmsu.edu.ph', 'admin@wmsu.edu.ph', '$2y$10$zWQa6KYdpazF2GemqSnWiuJo28YMaOobjk3HXRaO4RHQyiWVt5h0q', 'admin', 'Admin', '', '', 1, '2026-05-01 06:09:10', '2026-05-02 12:16:50', '2026-05-02 20:16:50');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `document_history`
--
ALTER TABLE `document_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `document_recipients`
--
ALTER TABLE `document_recipients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `memorandum_orders`
--
ALTER TABLE `memorandum_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `receivers`
--
ALTER TABLE `receivers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recipient_groups`
--
ALTER TABLE `recipient_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `special_orders`
--
ALTER TABLE `special_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `travel_orders`
--
ALTER TABLE `travel_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `document_history`
--
ALTER TABLE `document_history`
  ADD CONSTRAINT `document_history_ibfk_1` FOREIGN KEY (`action_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `document_recipients`
--
ALTER TABLE `document_recipients`
  ADD CONSTRAINT `document_recipients_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `recipient_groups` (`id`) ON DELETE CASCADE;

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
