-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2019 at 04:06 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cdrs`
--

-- --------------------------------------------------------

--
-- Table structure for table `allergy`
--

CREATE TABLE `allergy` (
  `ID` int(11) NOT NULL,
  `allergyName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allergy`
--

INSERT INTO `allergy` (`ID`, `allergyName`, `description`, `isDeleted`) VALUES
(1, 'Asthma', 'Swelling and inflammation inside the airways of the lungs.', 0),
(2, 'Dermatitis', 'Pattern of itchy skin rash consisting of tiny pink bumps', 0),
(3, 'Drug Allergy', 'Adverse drug reactions', 0),
(4, 'Urticaria ', 'Skin rash', 0),
(5, 'Rhinitis', 'Inflammation of the lining of the nose', 0),
(6, 'Fishy', 'Itchy like a fishy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `ID` varchar(255) NOT NULL,
  `courseID` int(11) NOT NULL,
  `courseName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`ID`, `courseID`, `courseName`) VALUES
('123456789', 1, ''),
('201601062', 2, ''),
('21022018', 1, ''),
('2154632019', 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `ID` int(11) NOT NULL,
  `complaintName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`ID`, `complaintName`, `description`, `isDeleted`) VALUES
(1, 'Stomach ache', 'Stabbing pain', 0),
(2, 'Colds', 'Colds', 1),
(3, 'Forever', 'Fever', 0),
(4, 'Stomach ache', 'Diarrhea', 0),
(5, 'Sprain', 'Sprain', 0),
(6, 'Body Pain', 'Pain focused on a particular area of the body', 0),
(7, 'Sore Throat', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `contact_person`
--

CREATE TABLE `contact_person` (
  `ID` int(11) NOT NULL,
  `patientID` varchar(255) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_person`
--

INSERT INTO `contact_person` (`ID`, `patientID`, `fullName`, `contact`) VALUES
(15, '201601062', 'JL6idpNPdAyxUM8f+v5WPw==', 'T2LsejfrzGILtcQpK4/MRg=='),
(28, '123456789', 'EQS74wYpzmg5mA+mJbjZkg==', 'RAKTbf+JkI0JbCCKtTEY2A=='),
(36, '201601001', 'V0Q+cVhJpgC0Keq07dT1RQ==', 'oWa8nQyDIYWLmJVmx2xqBg=='),
(37, '2154632019', '05EdgfrvknWxqB+09PDVmA==', '99SHG7Rw3bObpfAb1foJaw=='),
(39, '21022018', 'U3Pueso8MvP3EvIwnZh07g==', 'xxhsxjYS5+sy6cGgwJKazw==');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `ID` int(11) NOT NULL,
  `courseName` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID`, `courseName`, `isDeleted`) VALUES
(1, 'Web Development', 0),
(2, 'Software Engineering', 0),
(3, 'Multimedia, Arts, and Design', 0),
(4, 'Finance Management', 0),
(5, 'Animation', 0),
(6, 'Game Development', 0),
(7, '&lt;script&gt;alert(&quot;Hacked!&quot;);&lt;/script&gt;', 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `departmentName` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`ID`, `departmentName`, `isDeleted`) VALUES
(1, 'Registrar', 0),
(2, 'HR', 0),
(3, 'Finance', 0),
(4, 'Academics', 0),
(5, 'Security', 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `ID` varchar(255) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `employeeType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`ID`, `departmentID`, `type`, `employeeType`) VALUES
('201601001', 3, 'fixed', '');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `eventID` int(11) NOT NULL,
  `eventDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `eventName` varchar(100) NOT NULL,
  `userID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`eventID`, `eventDate`, `eventName`, `userID`) VALUES
(1, '2019-04-29 01:22:36', 'Login', '201603007'),
(2, '2019-04-29 01:32:48', 'Login', '201603007'),
(3, '2019-04-29 01:48:38', 'Login', '1900007'),
(4, '2019-04-29 01:51:33', 'Login', '201603007'),
(5, '2019-04-29 01:59:22', 'Login', '201603007'),
(6, '2019-04-29 02:52:38', 'Login', '201601062'),
(7, '2019-04-29 02:53:50', 'Created patient profile', '201601062'),
(8, '2019-04-29 02:55:28', 'Created patient visit', '201601062'),
(9, '2019-04-29 03:00:22', 'Created patient visit', '201601062'),
(10, '2019-04-29 03:02:58', 'Deleted patient visit', '201601062'),
(11, '2019-04-29 03:02:58', 'Deleted patient visit', '201601062'),
(12, '2019-04-29 03:04:30', 'Login', '201603007'),
(13, '2019-04-29 03:04:58', 'Login', '201603007'),
(14, '2019-04-30 09:51:38', 'Login', '201603007'),
(15, '2019-04-30 23:50:51', 'Successfully logged in.', '201603007'),
(16, '2019-04-30 23:51:07', 'Successfully logged out.', '201603007'),
(17, '2019-05-01 06:55:36', 'Successfully logged in.', '201603007'),
(18, '2019-05-01 07:26:41', 'Successfully logged out.', '201603007'),
(19, '2019-05-01 09:26:54', 'Successfully logged in.', '201603007'),
(20, '2019-05-02 13:58:53', 'Successfully logged in.', '201603007'),
(21, '2019-05-02 14:19:12', 'Login', '201603007'),
(22, '2019-05-02 14:20:32', 'Login', '201601045'),
(23, '2019-05-02 14:20:48', 'Login', '201601062'),
(24, '2019-05-02 14:20:59', 'Login', '201603007'),
(25, '2019-05-02 14:32:39', 'Created a new user.', '201603007'),
(26, '2019-05-02 14:41:16', 'Updated status of user.', '201603007'),
(27, '2019-05-02 14:41:16', 'Updated status of user.', '201603007'),
(28, '2019-05-02 14:48:03', 'Updated patient profile.', '201603007'),
(29, '2019-05-02 14:48:11', 'Updated patient profile.', '201603007'),
(30, '2019-05-02 14:48:32', 'Updated patient profile.', '201603007'),
(31, '2019-05-02 14:55:39', 'Updated patient profile.', '201603007'),
(32, '2019-05-02 14:56:27', 'Updated patient profile.', '201603007'),
(33, '2019-05-02 15:00:44', 'Updated patient profile.', '201603007'),
(34, '2019-05-03 10:46:58', 'Successfully logged in.', '201603007'),
(35, '2019-05-03 10:47:28', 'Successfully logged out.', '201603007'),
(36, '2019-05-03 10:47:34', 'Successfully logged in.', '201603007'),
(37, '2019-05-03 11:28:34', 'Changed status of user.', '201603007'),
(38, '2019-05-03 11:28:42', 'Changed status of user.', '201603007'),
(39, '2019-05-03 11:43:21', 'Created a new user.', '201603007'),
(40, '2019-05-03 11:47:49', 'Created a new user.', '201603007'),
(41, '2019-05-03 12:05:23', 'Updated user profile.', '201603007'),
(42, '2019-05-03 12:05:28', 'Updated user profile.', '201603007'),
(43, '2019-05-03 12:18:49', 'Successfully logged out.', '201603007'),
(44, '2019-05-03 12:19:04', 'Successfully logged in.', '201601045'),
(45, '2019-05-03 12:19:09', 'Successfully logged out.', '201601045'),
(46, '2019-05-03 15:38:27', 'Successfully logged in.', '201603007'),
(47, '2019-05-03 15:38:49', 'Updated patient profile.', '201603007'),
(48, '2019-05-03 15:38:50', 'Updated patient profile.', '201603007'),
(49, '2019-05-03 15:39:03', 'Updated patient profile.', '201603007'),
(50, '2019-05-03 15:49:59', 'Stock of medicine adjusted.', '201603007'),
(51, '2019-05-03 15:50:26', 'Stock of medicine adjusted.', '201603007'),
(52, '2019-05-03 15:50:47', 'Stock of medicine adjusted.', '201603007'),
(53, '2019-05-03 15:51:08', 'Stock of medicine adjusted.', '201603007'),
(54, '2019-05-03 15:52:45', 'Created medicine.', '201603007'),
(55, '2019-05-03 16:28:20', 'Updated patient profile.', '201603007'),
(56, '2019-05-03 17:46:03', 'Successfully logged out.', '201603007'),
(57, '2019-05-03 17:51:11', 'Successfully logged in.', '201603007'),
(58, '2019-05-03 17:52:08', 'Updated patient visit record.', '201603007'),
(59, '2019-05-03 17:52:08', 'Updated patient visit record.', '201603007'),
(60, '2019-05-03 17:52:10', 'Updated patient visit record.', '201603007'),
(61, '2019-05-03 17:52:12', 'Updated patient visit record.', '201603007'),
(62, '2019-05-03 17:54:50', 'Updated patient profile.', '201603007'),
(63, '2019-05-03 17:55:09', 'Updated patient profile.', '201603007'),
(64, '2019-05-03 17:57:42', 'Updated patient profile.', '201603007'),
(65, '2019-05-03 17:58:07', 'Successfully logged out.', '201603007'),
(66, '2019-05-03 18:00:20', 'Successfully logged in.', '201603007'),
(67, '2019-05-03 18:01:57', 'Updated patient profile.', '201603007'),
(68, '2019-05-03 18:01:59', 'Updated patient profile.', '201603007'),
(69, '2019-05-03 18:02:04', 'Updated patient profile.', '201603007'),
(70, '2019-05-03 18:03:49', 'Created new patient profile.', '201603007'),
(71, '2019-05-03 18:17:47', 'Successfully logged out.', '201603007'),
(72, '2019-05-03 18:17:59', 'Successfully logged in.', '201601045'),
(73, '2019-05-03 18:18:03', 'Successfully logged out.', '201601045'),
(74, '2019-05-03 18:41:11', 'Successfully logged in.', '201603007'),
(75, '2019-05-03 18:42:08', 'Created a new user.', '201603007'),
(76, '2019-05-03 18:48:09', 'Successfully logged out.', '201603007'),
(77, '2019-05-05 03:55:04', 'Successfully logged in.', '201603007'),
(78, '2019-05-05 05:24:52', 'Stock of medicine adjusted.', '201603007'),
(79, '2019-05-05 05:25:07', 'Stock of medicine adjusted.', '201603007'),
(80, '2019-05-05 05:27:14', 'Stock of medicine adjusted.', '201603007'),
(81, '2019-05-05 05:58:22', 'Updated patient profile.', '201603007'),
(82, '2019-05-05 05:59:44', 'Changed status of user.', '201603007'),
(83, '2019-05-05 05:59:52', 'Changed status of user.', '201603007'),
(84, '2019-05-05 06:00:07', 'Updated user profile.', '201603007'),
(85, '2019-05-05 06:00:21', 'Changed password.', '201603007'),
(86, '2019-05-05 06:05:56', 'Updated user profile.', '201603007'),
(87, '2019-05-05 06:06:00', 'Successfully logged out.', '201603007'),
(88, '2019-05-05 06:06:08', 'Successfully logged in.', '201603007'),
(89, '2019-05-05 06:12:38', 'Created new patient profile.', '201603007'),
(90, '2019-05-05 06:14:11', 'Created new patient profile.', '201603007'),
(91, '2019-05-05 06:18:37', 'Deleted patient profile.', '201603007'),
(92, '2019-05-05 06:19:46', 'Created new patient profile.', '201603007'),
(93, '2019-05-05 06:22:37', 'Created new patient profile.', '201603007'),
(94, '2019-05-05 06:25:03', 'Created new patient profile.', '201603007'),
(95, '2019-05-05 06:28:01', 'Created new patient profile.', '201603007'),
(96, '2019-05-05 06:30:50', 'Updated patient profile.', '201603007'),
(97, '2019-05-05 06:36:31', 'Created new patient profile.', '201603007'),
(98, '2019-05-05 06:43:59', 'Successfully logged out.', '201603007'),
(99, '2019-05-05 06:44:14', 'Successfully logged in.', '201601045'),
(100, '2019-05-05 06:45:22', 'Successfully logged out.', '201601045'),
(101, '2019-05-05 06:49:33', 'Successfully logged in.', '201603007'),
(102, '2019-05-05 06:56:50', 'Successfully logged out.', '201603007'),
(103, '2019-05-05 08:39:14', 'Successfully logged in.', '201603007'),
(104, '2019-05-05 08:40:25', 'Created a new user.', '201603007'),
(105, '2019-05-05 08:40:41', 'Successfully logged out.', '201603007'),
(106, '2019-05-05 08:40:48', 'Successfully logged in.', '201603007'),
(107, '2019-05-05 08:42:58', 'Successfully logged out.', '201603007'),
(108, '2019-05-05 08:43:09', 'Successfully logged in.', '201603007'),
(109, '2019-05-05 08:43:23', 'Changed password.', '201603007'),
(110, '2019-05-05 08:44:21', 'Created a new user.', '201603007'),
(111, '2019-05-05 08:45:19', 'Created a new user.', '201603007'),
(112, '2019-05-05 22:39:06', 'Successfully logged out.', '201603007'),
(113, '2019-05-05 22:42:44', 'Successfully logged out.', '201603007'),
(114, '2019-05-05 22:42:54', 'Successfully logged in.', '201603007'),
(115, '2019-05-05 22:52:06', 'Successfully logged out.', '201603007'),
(116, '2019-05-05 22:59:24', 'Successfully logged in.', '201603007'),
(117, '2019-05-05 23:01:19', 'Changed password.', '201603007'),
(118, '2019-05-05 23:01:31', 'Changed password.', '201603007'),
(119, '2019-05-05 23:01:37', 'Successfully logged out.', '201603007'),
(120, '2019-05-05 23:01:41', 'Successfully logged in.', '201603007'),
(121, '2019-05-05 23:03:21', 'Successfully logged out.', '201603007'),
(122, '2019-05-05 23:04:55', 'Successfully logged in.', '201603007'),
(123, '2019-05-05 23:05:57', 'Created new patient profile.', '201603007'),
(124, '2019-05-05 23:20:13', 'Successfully logged out.', '201603007'),
(125, '2019-05-05 23:27:57', 'Successfully logged in.', '201603007'),
(126, '2019-05-05 23:28:24', 'Changed password.', '201603007'),
(127, '2019-05-05 23:28:30', 'Successfully logged out.', '201603007'),
(128, '2019-05-05 23:29:23', 'Successfully logged in.', '201603007'),
(129, '2019-05-05 23:37:47', 'Successfully logged out.', '201603007'),
(130, '2019-05-05 23:37:53', 'Successfully logged in.', '201603007'),
(131, '2019-05-05 23:54:37', 'Created new patient profile.', '201603007'),
(132, '2019-05-06 00:17:31', 'Successfully logged out.', '201603007'),
(133, '2019-05-06 01:16:20', 'Successfully logged in.', '201603007'),
(134, '2019-05-06 01:22:31', 'Successfully logged out.', '201603007');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `ID` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL,
  `genericName` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(1) NOT NULL,
  `isSupply` tinyint(1) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `thresholdQty` int(50) NOT NULL,
  `criticalQty` int(50) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `dosageQty` int(10) NOT NULL,
  `currentQty` int(10) NOT NULL,
  `newQty` int(10) NOT NULL,
  `updateQty` int(10) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `modifiedBy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`ID`, `brandName`, `genericName`, `type`, `status`, `isSupply`, `isDeleted`, `thresholdQty`, `criticalQty`, `dosage`, `dosageQty`, `currentQty`, `newQty`, `updateQty`, `dateCreated`, `dateModified`, `createdBy`, `modifiedBy`) VALUES
(1, 'Biogesic', 'Paracetamol', 'Capsule', 3, 0, 0, 50, 20, 'mg', 500, 280, 280, 90, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(2, 'Immodium', 'Loperamide', 'Capsule', 3, 0, 0, 30, 20, 'mg', 10, 50, 50, 30, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(3, 'Advil', 'Ibuprofen', 'Capsule', 1, 0, 0, 30, 20, 'mg', 500, 10, 10, 9, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(4, 'Buscopan', 'Hyoscine-N-butylbromide', 'Tablet', 1, 0, 0, 30, 20, 'mg', 10, 13, 13, 55, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(5, 'Tempra', 'Paracetamol', 'Tablet', 3, 0, 0, 30, 20, 'mg', 500, 50, 50, 20, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(6, 'Tylenol', 'Paracetamol', 'Tablet', 2, 0, 0, 200, 100, 'mg', 200, 130, 130, 90, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, '', 'Tissue', '', 3, 1, 0, 200, 100, 'box', 1, 1110, 1100, 1109, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 'Tiki Tiki', 'Vit C', 'Tablet', 2, 0, 0, 200, 100, 'mg', 250, 200, 200, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `password_change_request`
--

CREATE TABLE `password_change_request` (
  `ID` int(11) NOT NULL,
  `requestID` varchar(255) NOT NULL,
  `userID` varchar(255) NOT NULL,
  `requestDate` datetime NOT NULL,
  `isUsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `password_change_request`
--

INSERT INTO `password_change_request` (`ID`, `requestID`, `userID`, `requestDate`, `isUsed`) VALUES
(1, 'TDTy1Am6', '201603006', '2019-01-23 12:11:24', 0),
(2, 'zGhNdKZF', '201603009', '2019-03-21 22:38:07', 0),
(3, 'j4LWgLSle', '201803007', '2019-03-24 15:33:23', 0),
(23, 'HLaXksZfW', '201603007', '2019-03-27 20:49:13', 1),
(24, 'oTQfkXOL', '201603007', '2019-03-27 20:52:10', 0),
(25, 'SxdP7o90', '201603007', '2019-03-27 20:58:22', 1),
(26, 'l8bjoUfQ', '201603007', '2019-03-30 23:00:13', 0),
(27, 'fKpPAx62', '201603007', '2019-03-30 23:01:38', 0),
(28, 'yEzcQQ6i', '201603007', '2019-03-30 23:03:53', 0),
(29, '764Y3MgL', '201603007', '2019-03-30 23:07:27', 0),
(30, 'i1bxFOHF', '19-00004', '2019-03-30 23:17:22', 0),
(31, 'N71uPX9t', '15-00008', '2019-03-30 23:29:52', 0),
(32, 'IRR7gPWS', '15-00008', '2019-03-30 23:32:55', 0),
(33, 'XIHodfJX', '201603007', '0000-00-00 00:00:00', 0),
(36, 'uupqpdU7', '849846516651', '2019-04-07 20:36:33', 0),
(37, 'qFHjPmyj', '201603008', '2019-04-07 20:39:43', 0),
(38, 'Ugq6J9yD', '65486666', '2019-04-07 20:40:59', 0),
(39, 'dLgiTYHQ', '8789489984', '2019-04-08 07:10:30', 0),
(40, 'NWeXtHC3', '201603008', '2019-04-08 07:15:04', 0),
(41, 'jxT6IuGk', '201603009', '2019-04-08 07:15:45', 0),
(42, 'WAReFtlK', '201603001', '2019-04-08 07:19:35', 0),
(43, 'AMhucfgC', '201603002', '2019-04-08 07:21:39', 0),
(44, 'BusIS20X', '201602006', '2019-04-08 07:22:51', 0),
(45, 'XisepkUm', '201603007', '2019-04-08 14:26:07', 0),
(46, '3OuGsFNZ', '201603007', '2019-04-08 14:27:07', 0),
(47, '4kMAFXhG', '201603007', '2019-04-08 14:29:37', 0),
(48, '78uKpege', '201603007', '2019-04-08 16:17:47', 1),
(49, 'D0qF08KT', '201603007', '2019-04-08 16:20:05', 0),
(50, 'kQlxAryn', '201603007', '2019-04-09 17:15:03', 1),
(51, '3LTN1BWS', '201603007', '2019-04-09 17:18:03', 0),
(52, 'WJp840np', '201603007', '2019-04-09 17:21:14', 0),
(53, 'QIPgIsuq', '201603007', '2019-04-09 17:27:07', 1),
(54, 'B9ATF1pP', '201603007', '2019-04-09 17:34:29', 1),
(55, '3mJmGZHC', '201603007', '2019-04-09 17:36:31', 1),
(56, 'rHNaR2RT', '201603007', '2019-04-09 17:45:08', 1),
(57, 'adXzdD1g', '201603007', '2019-04-09 17:47:44', 1),
(58, 'NxpZHo9f', '201603007', '2019-04-09 17:56:29', 1),
(59, 'ecmkW39n', '20136548998', '2019-04-09 17:59:10', 0),
(60, 'xL8mN11N', '201603007', '2019-04-09 18:01:44', 1),
(61, 'ofK3JMin', '201603009', '2019-04-09 18:15:43', 0),
(62, 'wrNjOQbe', '201603009', '2019-04-09 18:17:08', 1),
(63, '5Rky3c8m', '201603007', '2019-04-09 18:20:58', 1),
(64, 't1rGR8GO', '201603007', '2019-04-09 18:29:14', 1),
(65, 'i9r6eNig', '201603007', '2019-04-09 18:46:12', 1),
(66, 'FuCtG0CD', '201603007', '2019-04-09 18:53:43', 1),
(67, 'hU9HYDTe', '123456789', '2019-04-09 20:37:46', 0),
(68, 'GP63XiDs', '201603007', '2019-04-09 20:40:33', 1),
(69, '2DWNP1n5', '201603007', '2019-04-09 20:48:52', 1),
(70, 'zuwXXywz', '201603007', '2019-04-09 20:56:37', 1),
(71, 'yTcutxgH', '123456789', '2019-04-09 20:59:39', 0),
(72, 'NzX7KXD8', '322165447979', '2019-04-09 21:01:26', 0),
(73, '2x3ngNTq', '201603009', '2019-04-09 21:07:06', 0),
(74, '5LQ58EL7', '201603009', '2019-04-09 21:09:31', 0),
(75, 'l5JWbosi', '201603007', '2019-04-09 21:23:54', 0),
(76, 'EKpXNLWs', '201603007', '2019-04-09 21:25:31', 0),
(77, 'hCFXlFMD', '201603007', '2019-04-09 21:26:43', 0),
(78, '2oMdBCW8', '201603007', '2019-04-09 21:28:57', 0),
(79, 'cOcfyWRL', '201603007', '2019-04-09 21:30:08', 0),
(80, 'atGmBxTs', '201603007', '2019-04-09 21:31:44', 0),
(81, 'rBlJwTdx', '201603007', '2019-04-09 21:34:04', 0),
(82, 'HS3OKDZy', '201603007', '2019-04-09 21:36:08', 0),
(83, 'jddE4PIk', '201603007', '2019-04-09 21:36:57', 0),
(84, '0QpZnA7D', '201603007', '2019-04-09 21:40:24', 0),
(85, 'KIn1YeAK', '201603007', '2019-04-09 21:41:16', 0),
(86, 'kiPt2Adi', '201603007', '2019-04-09 21:43:12', 0),
(87, 'xdAWRXib', '201603007', '2019-04-09 21:44:51', 0),
(88, 'cGRh7bFd', '201603007', '2019-04-09 21:45:54', 0),
(89, '5eaNNi3d', '201603007', '2019-04-11 21:49:45', 0),
(90, 'HrETtdmE', '201603007', '2019-04-11 21:50:59', 1),
(91, 'X57hlmkp', '1900007', '2019-04-19 23:13:22', 0),
(92, 'omcgY0Am', '32165487', '2019-04-22 08:41:34', 0),
(93, 'HRz2ROcf', '201603007', '2019-04-27 18:17:59', 1),
(94, 'UHhBMqOJ', '201603007', '2019-04-29 07:47:52', 0),
(95, 'BifbyaPO', '201603007', '2019-05-02 21:05:23', 0),
(96, 'xaTFdyS9', '65486666', '2019-05-02 22:32:34', 0),
(97, 'JddiJTtG', '201603007', '2019-05-03 18:32:17', 0),
(98, 'TXqjijaY', '201603007', '2019-05-03 18:33:34', 0),
(99, 'xgu8Ej5u', '65486666', '2019-05-03 18:33:39', 0),
(100, 'diPB4PQE', '201603007', '2019-05-03 18:36:42', 0),
(101, 'jBI6Gcxn', '65486666', '2019-05-03 18:36:46', 0),
(102, 'nkQi8GjZ', '201603007', '2019-05-03 18:38:37', 0),
(103, 'PrZEjDIe', '65486666', '2019-05-03 18:38:41', 0),
(104, 'n8Cyoiwd', '985413665244', '2019-05-03 19:43:16', 0),
(105, 'pIKEuOsX', '652144978', '2019-05-03 19:47:49', 0),
(106, 'E5eFqrjN', '201603007', '2019-05-03 23:26:31', 0),
(107, '06FkiJSU', '201603007', '2019-05-04 01:46:20', 0),
(108, 'mlI4Iawp', '201603007', '2019-05-04 01:58:11', 0),
(109, 'jGgpEKe4', '201601045', '2019-05-04 02:42:04', 0),
(110, 'gohjLteA', '201603007', '2019-05-05 16:40:21', 0),
(111, 'Sq33hKD8', '201601045', '2019-05-05 16:44:18', 0),
(112, 'enGntLlh', '0', '2019-05-05 16:45:16', 0),
(113, 'TF5amcog', '201603007', '2019-05-06 06:22:46', 0),
(114, 'Q1hDUY95', '201603007', '2019-05-06 06:23:22', 0),
(115, 'FWx0w5tM', '201603007', '2019-05-06 06:27:08', 1),
(116, '18cNb5b1', '201603007', '2019-05-06 06:39:14', 1),
(117, 'gb39U3R9', '201603007', '2019-05-06 06:52:14', 0),
(118, 'efQtoaMH', '201603007', '2019-05-06 07:03:25', 0),
(119, 'lXzMZGmW', '201603007', '2019-05-06 07:22:09', 0),
(120, 'yCxa3yfj', '201603007', '2019-05-06 07:23:17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ID` varchar(255) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `birthDate` date NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `contactNumber` int(25) NOT NULL,
  `contactPerson` varchar(70) NOT NULL,
  `contactPersonNumber` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `firstName`, `lastName`, `birthDate`, `gender`, `contact`, `isDeleted`, `createdBy`, `modifiedBy`, `dateCreated`, `dateModified`, `contactNumber`, `contactPerson`, `contactPersonNumber`) VALUES
('123456789', 'nttljvldo4lvJ/3aXk/tlg==', 'jPm06KABX+Ob6oGL0rqifA==', '1999-01-11', 'Male', '0', 0, 'nttljvldo4lvJ/3aXk/tlg==', '201603007', '2019-04-29 07:44:17', '2019-05-04 02:02:04', 0, '', 0),
('201601001', 'F5cRh4BlcygyI2EW+NFVVQ==', 'HHHOPk5Rhtk9Wb/Z7I/DtQ==', '2003-12-23', 'Male', 'T2Rp+36Pz4T/HTWst7hf/g==', 0, 'nttljvldo4lvJ/3aXk/tlg==', '201603007', '2019-04-22 14:32:05', '2019-05-05 14:30:50', 0, '', 0),
('201601062', '1OUN5Y5ODxGQHipbESWcgg==', 'U4y3pKtYlzcu6cDPVsGd0A==', '1990-05-11', 'Male', '0', 0, '1OUN5Y5ODxGQHipbESWcgg==', '1OUN5Y5ODxGQHipbESWcgg==', '2019-04-29 10:53:50', '2019-04-29 10:53:50', 0, '', 0),
('21022018', 'yKOvVUmHoD+ncsOgypq9Kg==', 'imb11B7U9ZpsOlUGsBDJDg==', '2018-02-21', 'Male', 'y1/ipGwdzrP4e5JuWXdePA==', 0, 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg==', '2019-05-06 07:54:37', '2019-05-06 07:54:37', 0, '', 0),
('2154632019', 'Suy79SdhR4pifaxjRKcfdQ==', 'Hri2G5HPI3iFM8GILKPHoQ==', '2015-05-15', 'Male', 'pLT5NNoD6FOAUPOe/zPMSQ==', 0, 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg==', '2019-05-05 14:36:31', '2019-05-05 14:36:31', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_allergy`
--

CREATE TABLE `patient_allergy` (
  `ID` int(11) NOT NULL,
  `patientID` varchar(255) NOT NULL,
  `allergyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_allergy`
--

INSERT INTO `patient_allergy` (`ID`, `patientID`, `allergyID`) VALUES
(26, '123456789', 3),
(34, '201601001', 1),
(37, '21022018', 3),
(35, '2154632019', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shs`
--

CREATE TABLE `shs` (
  `ID` varchar(255) NOT NULL,
  `trackID` int(11) NOT NULL,
  `trackName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE `track` (
  `ID` int(11) NOT NULL,
  `trackName` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`ID`, `trackName`, `isDeleted`) VALUES
(1, 'Software Development', 0),
(2, 'HUMSS', 0),
(3, 'Accounting', 0),
(4, 'Animation', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `datePassChanged` datetime NOT NULL,
  `role` varchar(50) NOT NULL,
  `dateEmployed` date NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `modifiedBy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `email`, `password`, `datePassChanged`, `role`, `dateEmployed`, `isActive`, `firstName`, `lastName`, `gender`, `contact`, `dateCreated`, `dateModified`, `createdBy`, `modifiedBy`) VALUES
('0', 'P8v09o9JVu94XKz3cDiSfjDj4S6kS/6vNvhU6JKOaz8=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'dVAxclgOA3VifnlTUZW1NQ==', '2019-05-01', 1, 'jsAuMJ7lkLf3WRBpYJ6bOw==', 'jsAuMJ7lkLf3WRBpYJ6bOw==', 'Male', '96523874', '2019-05-05 16:45:16', '2019-05-05 16:45:16', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201601045', 'yJ9R/zSi9nshquuYGdmDMxdNgPdExGjYLPNOjIE4+0Q=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'dVAxclgOA3VifnlTUZW1NQ==', '2016-07-14', 1, '8uLjJIxUZfURls/ujYAjuA==', 'Fz7tFuU7RTR4bHltuGrvcw==', 'Male', '963205874', '2019-05-05 16:44:18', '2019-05-05 16:44:18', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201601048', 'uv19Vj9iLs+Npf845EI2rfk2M+A+hpnEf6/FwwMcm6w=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2016-04-01', 1, '4ExITKp6kadxz/2oqddisQ==', 'TtvN3gr/YWdn/kgaBtLgMA==', 'Female', '123456789', '2019-04-11 21:56:30', '2019-04-11 21:56:30', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201601062', 'RKHmiQmUR8rfQsRNaMkYVVBOkP6APd4haaqME6tWraw=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2016-07-14', 1, '1OUN5Y5ODxGQHipbESWcgg==', 'Yt6NgTjbm4VLSK8S3Tp6zQ==', 'Female', '123456789', '2019-04-11 21:55:42', '2019-04-11 21:55:42', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201603007', 'yZFiJYAKq5oeC0Iya3rlcSS4UZvN6+wER6zkk96+dkw=', 'zuwBtmygSJNyZDzorYP7/g==', '2019-05-06 07:28:24', 'R3F57LtVGns08zxFybyhTA==', '2017-01-05', 1, 'nttljvldo4lvJ/3aXk/tlg==', 'jPm06KABX+Ob6oGL0rqifA==', 'Male', '09052834596', '2019-05-05 16:40:21', '2019-05-05 16:40:21', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg==');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `ID` int(11) NOT NULL,
  `patientID` varchar(255) NOT NULL,
  `visitDate` datetime NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`ID`, `patientID`, `visitDate`, `remarks`, `isDeleted`, `createdBy`, `modifiedBy`, `dateCreated`, `dateModified`) VALUES
(1, '201601001', '2019-04-28 16:30:00', 'Test', 0, '1900007', '1900007', '2019-04-28 16:30:39', '2019-04-28 16:30:39'),
(2, '123456789', '2019-04-29 08:33:00', 'test', 0, '1900007', '1900007', '2019-04-29 08:33:54', '2019-04-29 08:33:54'),
(3, '201601062', '2019-04-29 10:55:00', 'na', 1, '201601062', '201601062', '2019-04-29 10:55:28', '2019-04-29 10:55:28'),
(4, '201601062', '2019-04-29 11:00:00', 'hi', 1, '201601062', '201601062', '2019-04-29 11:00:22', '2019-04-29 11:00:22');

-- --------------------------------------------------------

--
-- Table structure for table `visit_complaint`
--

CREATE TABLE `visit_complaint` (
  `ID` int(11) NOT NULL,
  `visitID` int(11) NOT NULL,
  `complaintID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit_complaint`
--

INSERT INTO `visit_complaint` (`ID`, `visitID`, `complaintID`) VALUES
(1, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `visit_medicine`
--

CREATE TABLE `visit_medicine` (
  `ID` int(11) NOT NULL,
  `visitID` int(11) NOT NULL,
  `medicineID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `complaintID` int(50) NOT NULL,
  `medicineBrandName` varchar(100) NOT NULL,
  `form` varchar(50) NOT NULL,
  `dosage` int(11) NOT NULL,
  `dispensedDose` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit_medicine`
--

INSERT INTO `visit_medicine` (`ID`, `visitID`, `medicineID`, `quantity`, `complaintID`, `medicineBrandName`, `form`, `dosage`, `dispensedDose`) VALUES
(1, 1, 6, 0, 0, '', '', 0, 0),
(6, 2, 4, 6, 0, '', '', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allergy`
--
ALTER TABLE `allergy`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `unique_index` (`patientID`,`fullName`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`eventID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `password_change_request`
--
ALTER TABLE `password_change_request`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `modifiedBy` (`modifiedBy`),
  ADD KEY `createdBy` (`createdBy`);

--
-- Indexes for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD UNIQUE KEY `unique_index` (`patientID`,`allergyID`);

--
-- Indexes for table `shs`
--
ALTER TABLE `shs`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `patientID` (`patientID`);

--
-- Indexes for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `visitID` (`visitID`);

--
-- Indexes for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `visitID` (`visitID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergy`
--
ALTER TABLE `allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `password_change_request`
--
ALTER TABLE `password_change_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `college`
--
ALTER TABLE `college`
  ADD CONSTRAINT `college_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_person`
--
ALTER TABLE `contact_person`
  ADD CONSTRAINT `contact_person_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  ADD CONSTRAINT `patient_allergy_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `shs`
--
ALTER TABLE `shs`
  ADD CONSTRAINT `shs_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  ADD CONSTRAINT `visit_complaint_ibfk_1` FOREIGN KEY (`visitID`) REFERENCES `visit` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  ADD CONSTRAINT `visit_medicine_ibfk_1` FOREIGN KEY (`visitID`) REFERENCES `visit` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
