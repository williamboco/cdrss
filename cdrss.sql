-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2019 at 11:14 AM
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
-- Database: `cdrss`
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
(6, 'Food Allergy', 'vomiting', 0),
(7, 'Food Poisoning', 'vomiting', 0),
(190, 'Drug Allergy', '', 1),
(191, 'Dermatitis', '', 1),
(192, 'Test Allergy', '', 1),
(193, 'Paint', '', 0),
(194, 'Drug Allergy', '', 0);

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
('', 1, ''),
('201601007', 1, ''),
('201601062', 3, ''),
('201603007', 1, ''),
('5156484', 2, ''),
('5466545165', 1, ''),
('556498798', 3, ''),
('65486666', 1, ''),
('98745522', 1, '');

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
(3, 'Fever', 'High temp', 1),
(4, 'Headache', 'Pain in general head area', 0),
(5, 'Sprain', 'Sprain', 0),
(6, 'Body Pain', 'Pain focused on a particular area of the body', 0),
(7, 'Sore Throat', 'Pain when Swallowing ', 0),
(8, 'Diarrhea', 'Loose stool', 0);

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
(2, '201601061', 'maroul ragpala', '9875643'),
(3, '201601061', 'marissa ragpala', '9865432'),
(6, '201901062', 'mia cervantes', '9875643'),
(7, '201901062', 'aaron montenegro', '8965432'),
(127, '201601045', 'cait sawyer', '8975432'),
(128, '201601045', 'nico sawyer', '8976543'),
(129, '201601045', 'paul sawyer', '7865431'),
(130, '123', 'rachel casis', '09876542156'),
(131, 'SHS2569874', 'Polo', '265413398'),
(132, '98745522', 'William', '1654878979'),
(133, '201603007', 'Olivia Mesa Boco', '09392846763'),
(134, '201601007', 'Ralph po', '546546');

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
(7, 'Marketing', 0),
(8, 'Psychology', 0),
(9, 'Interior', 1),
(10, 'Interior Design', 0),
(11, 'ffwfewe', 1),
(12, 'Accountancy', 0);

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
(5, 'Security', 0),
(6, 'Janitorial', 0),
(7, 'Administrator', 0);

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
('201601045', 4, 'casual', ''),
('201601048', 3, 'fixed', ''),
('201601061', 2, 'fixed', '');

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`ID`) VALUES
(1),
(2),
(3),
(4),
(5);

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
(1, '2019-05-03 18:00:56', 'Successfully logged out.', '201601048'),
(2, '2019-05-03 18:36:28', 'Successfully logged in.', '201601048'),
(3, '2019-05-03 18:37:28', 'Created new patient profile.', '201601048'),
(4, '2019-05-03 18:38:24', 'Created new patient profile.', '201601048'),
(5, '2019-05-03 18:42:59', 'Created new patient profile.', '201601048'),
(6, '2019-05-03 18:51:36', 'Created new patient profile.', '201601048'),
(7, '2019-05-03 18:55:26', 'Created new patient profile.', '201601048'),
(8, '2019-05-03 18:57:35', 'Deleted patient profile.', '201601048'),
(9, '2019-05-03 18:58:56', 'Deleted patient profile.', '201601048'),
(10, '2019-05-03 18:58:56', 'Deleted patient profile.', '201601048'),
(11, '2019-05-03 18:58:57', 'Deleted patient profile.', '201601048'),
(12, '2019-05-03 18:58:57', 'Deleted patient profile.', '201601048'),
(13, '2019-05-03 18:58:57', 'Deleted patient profile.', '201601048'),
(14, '2019-05-03 18:58:57', 'Deleted patient profile.', '201601048'),
(15, '2019-05-03 18:58:57', 'Deleted patient profile.', '201601048'),
(16, '2019-05-03 18:58:58', 'Deleted patient profile.', '201601048'),
(17, '2019-05-03 18:58:58', 'Deleted patient profile.', '201601048'),
(18, '2019-05-03 18:58:58', 'Deleted patient profile.', '201601048'),
(19, '2019-05-03 18:59:33', 'Created new patient profile.', '201601048'),
(20, '2019-05-03 19:01:00', 'Created new patient profile.', '201601048'),
(21, '2019-05-03 19:02:41', 'Created new patient profile.', '201601048'),
(22, '2019-05-03 19:07:27', 'Created new patient profile.', '201601048'),
(23, '2019-05-03 19:08:06', 'Created new patient profile.', '201601048'),
(24, '2019-05-03 19:09:15', 'Created new patient profile.', '201601048'),
(25, '2019-05-03 19:09:32', 'Successfully logged out.', '201601048'),
(26, '2019-05-03 19:09:51', 'Successfully logged in.', '201601048'),
(27, '2019-05-03 19:10:29', 'Created new patient profile.', '201601048'),
(28, '2019-05-03 19:13:39', 'Created new patient profile.', '201601048'),
(29, '2019-05-03 19:15:49', 'Created new patient profile.', '201601048'),
(30, '2019-05-03 19:38:29', 'Created new patient profile.', '201601048'),
(31, '2019-05-03 19:39:44', 'Deleted patient profile.', '201601048'),
(32, '2019-05-03 19:39:44', 'Deleted patient profile.', '201601048'),
(33, '2019-05-03 19:39:44', 'Deleted patient profile.', '201601048'),
(34, '2019-05-03 19:39:44', 'Deleted patient profile.', '201601048'),
(35, '2019-05-03 19:39:45', 'Deleted patient profile.', '201601048'),
(36, '2019-05-03 19:39:45', 'Deleted patient profile.', '201601048'),
(37, '2019-05-03 19:39:45', 'Deleted patient profile.', '201601048'),
(38, '2019-05-03 19:39:45', 'Deleted patient profile.', '201601048'),
(39, '2019-05-03 19:39:46', 'Deleted patient profile.', '201601048'),
(40, '2019-05-03 19:39:46', 'Deleted patient profile.', '201601048'),
(41, '2019-05-03 19:40:48', 'Created new patient profile.', '201601048'),
(42, '2019-05-03 19:48:41', 'Created new patient profile.', '201601048'),
(43, '2019-05-03 19:51:14', 'Created new patient profile.', '201601048'),
(44, '2019-05-03 19:57:01', 'Created new patient profile.', '201601048'),
(45, '2019-05-03 19:57:39', 'Created new patient profile.', '201601048'),
(46, '2019-05-03 20:14:04', 'Deleted patient profile.', '201601048'),
(47, '2019-05-03 20:14:04', 'Deleted patient profile.', '201601048'),
(48, '2019-05-03 20:14:04', 'Deleted patient profile.', '201601048'),
(49, '2019-05-03 20:14:04', 'Deleted patient profile.', '201601048'),
(50, '2019-05-03 20:14:04', 'Deleted patient profile.', '201601048'),
(51, '2019-05-03 20:16:47', 'Created new patient profile.', '201601048'),
(52, '2019-05-03 20:17:55', 'Created new patient profile.', '201601048'),
(53, '2019-05-03 20:19:08', 'Created new patient profile.', '201601048'),
(54, '2019-05-03 20:19:42', 'Created new patient profile.', '201601048'),
(55, '2019-05-03 20:19:59', 'Successfully logged out.', '201601048'),
(56, '2019-05-03 20:20:09', 'Successfully logged in.', '201601062'),
(57, '2019-05-03 20:20:54', 'Created new patient profile.', '201601062'),
(58, '2019-05-03 20:26:02', 'Created new patient profile.', '201601062'),
(59, '2019-05-03 20:26:42', 'Created new patient profile.', '201601062'),
(60, '2019-05-05 11:23:46', 'Created new patient profile.', '201601062'),
(61, '2019-05-05 11:25:28', 'Created new patient profile.', '201601062'),
(62, '2019-05-05 11:25:34', 'Created new patient profile.', '201601062'),
(63, '2019-05-05 11:26:19', 'Created new patient profile.', '201601062'),
(64, '2019-05-05 11:28:21', 'Successfully logged out.', '201601062'),
(65, '2019-05-05 11:28:33', 'Successfully logged in.', '201601062'),
(66, '2019-05-05 11:29:03', 'Created new patient profile.', '201601062'),
(67, '2019-05-05 11:33:12', 'Created medicine.', '201601062'),
(68, '2019-05-05 12:00:57', 'Created medicine.', '201601062'),
(69, '2019-05-05 12:04:13', 'Created medicine.', '201601062'),
(70, '2019-05-05 12:50:27', 'Successfully logged out.', '201601062'),
(71, '2019-05-05 12:50:58', 'Successfully logged in.', '201601062'),
(72, '2019-05-05 12:53:06', 'Created new patient profile.', '201601062'),
(73, '2019-05-05 12:54:48', 'Created new patient profile.', '201601062'),
(74, '2019-05-05 12:58:32', 'Created new patient profile.', '201601062'),
(75, '2019-05-05 12:59:36', 'Created new patient profile.', '201601062'),
(76, '2019-05-05 12:59:58', 'Successfully logged out.', '201601062'),
(77, '2019-05-05 13:00:11', 'Successfully logged in.', '201601048'),
(78, '2019-05-05 13:00:32', 'Deleted patient profile.', '201601048'),
(79, '2019-05-05 13:00:32', 'Deleted patient profile.', '201601048'),
(80, '2019-05-05 13:00:33', 'Deleted patient profile.', '201601048'),
(81, '2019-05-05 13:00:33', 'Deleted patient profile.', '201601048'),
(82, '2019-05-05 13:00:46', 'Deleted patient profile.', '201601048'),
(83, '2019-05-05 13:00:46', 'Deleted patient profile.', '201601048'),
(84, '2019-05-05 13:00:46', 'Deleted patient profile.', '201601048'),
(85, '2019-05-05 13:01:00', 'Deleted patient profile.', '201601048'),
(86, '2019-05-05 13:01:31', 'Created new patient profile.', '201601048'),
(87, '2019-05-05 13:04:16', 'Created new patient profile.', '201601048'),
(88, '2019-05-05 14:52:37', 'Created new patient profile.', '201601048'),
(89, '2019-05-05 14:52:50', 'Created new patient profile.', '201601048'),
(90, '2019-05-05 14:53:44', 'Created new patient profile.', '201601048'),
(91, '2019-05-06 09:15:24', 'Successfully logged out.', '201601048'),
(92, '2019-05-06 09:19:00', 'Successfully logged in.', '201601048'),
(93, '2019-05-06 10:01:10', 'Created new patient profile.', '201601048'),
(94, '2019-05-06 10:13:09', 'Created new patient profile.', '201601048'),
(95, '2019-05-06 11:01:06', 'Updated patient visit record.', '201601048'),
(96, '2019-05-06 15:54:36', 'Created patient visit', '201601048'),
(97, '2019-05-06 16:02:12', 'Created patient visit', '201601048'),
(98, '2019-05-06 16:06:55', 'Stock of medicine adjusted.', '201601048'),
(99, '2019-05-06 16:16:32', 'Created patient visit', '201601048'),
(100, '2019-05-06 16:19:40', 'Created patient visit', '201601048'),
(101, '2019-05-06 16:26:03', 'Created patient visit', '201601048'),
(102, '2019-05-06 16:32:11', 'Created patient visit', '201601048'),
(103, '2019-05-06 16:33:30', 'Created patient visit', '201601048'),
(104, '2019-05-06 16:38:31', 'Created patient visit', '201601048'),
(105, '2019-05-06 16:40:43', 'Created patient visit', '201601048'),
(106, '2019-05-06 16:42:12', 'Created patient visit', '201601048'),
(107, '2019-05-06 16:43:43', 'Created patient visit', '201601048'),
(108, '2019-05-06 16:45:21', 'Created patient visit', '201601048'),
(109, '2019-05-06 16:57:51', 'Created new patient profile.', '201601048'),
(110, '2019-05-06 17:10:29', 'Successfully logged out.', '201601048'),
(111, '2019-05-06 17:10:42', 'Successfully logged in.', '201601062'),
(112, '2019-05-07 07:35:19', 'Successfully logged out.', '201601062'),
(113, '2019-05-07 07:36:14', 'Successfully logged in.', '201601062'),
(114, '2019-05-07 08:32:54', 'Created new patient profile.', '201601062'),
(115, '2019-05-07 08:35:12', 'Created new patient profile.', '201601062'),
(116, '2019-05-07 08:37:13', 'Created new patient profile.', '201601062'),
(117, '2019-05-07 08:38:57', 'Created new patient profile.', '201601062'),
(118, '2019-05-07 08:42:15', 'Created new patient profile.', '201601062'),
(119, '2019-05-07 08:44:50', 'Created new patient profile.', '201601062'),
(120, '2019-05-07 08:45:51', 'Created new patient profile.', '201601062'),
(121, '2019-05-07 08:46:52', 'Successfully logged out.', '201601062'),
(122, '2019-05-07 08:47:08', 'Successfully logged in.', '201601048'),
(123, '2019-05-07 08:48:01', 'Created new patient profile.', '201601048'),
(124, '2019-05-07 09:02:14', 'Created new patient profile.', '201601048'),
(125, '2019-05-07 09:03:40', 'Successfully logged out.', '201601048'),
(126, '2019-05-07 09:03:48', 'Successfully logged in.', '201601062'),
(127, '2019-05-07 09:09:47', 'Created new patient profile.', '201601062'),
(128, '2019-05-07 09:12:34', 'Created new patient profile.', '201601062'),
(129, '2019-05-07 09:22:23', 'Created new patient profile.', '201601062'),
(130, '2019-05-07 09:28:06', 'Created new patient profile.', '201601062'),
(131, '2019-05-07 09:39:14', 'Created new patient profile.', '201601062'),
(132, '2019-05-07 10:03:00', 'Created new patient profile.', '201601062'),
(133, '2019-05-07 10:18:21', 'Created new patient profile.', '201601062'),
(134, '2019-05-07 10:24:01', 'Created new patient profile.', '201601062'),
(135, '2019-05-07 10:26:24', 'Created new patient profile.', '201601062'),
(136, '2019-05-07 10:59:36', 'Created patient visit', '201601062'),
(137, '2019-05-07 11:06:45', 'Created patient visit', '201601062'),
(138, '2019-05-07 11:20:20', 'Created patient visit', '201601062'),
(139, '2019-05-07 11:20:56', 'Created patient visit', '201601062'),
(140, '2019-05-07 11:22:34', 'Created patient visit', '201601062'),
(141, '2019-05-07 11:24:53', 'Updated patient visit record.', '201601062'),
(142, '2019-05-07 16:09:13', 'Created patient visit', '201601062'),
(143, '2019-05-07 16:21:51', 'Created patient visit', '201601062'),
(144, '2019-05-07 16:34:31', 'Created patient visit', '201601062'),
(145, '2019-05-07 16:44:37', 'Created patient visit', '201601062'),
(146, '2019-05-07 16:48:22', 'Created new patient profile.', '201601062'),
(147, '2019-05-07 16:51:28', 'Created patient visit', '201601062'),
(148, '2019-05-07 16:55:41', 'Created patient visit', '201601062'),
(149, '2019-05-07 16:57:18', 'Created patient visit', '201601062'),
(150, '2019-05-07 16:58:36', 'Created patient visit', '201601062'),
(151, '2019-05-07 17:03:08', 'Created patient visit', '201601062'),
(152, '2019-05-07 17:04:57', 'Created patient visit', '201601062'),
(153, '2019-05-07 17:07:36', 'Created patient visit', '201601062'),
(154, '2019-05-07 17:08:59', 'Created patient visit', '201601062'),
(155, '2019-05-07 17:10:06', 'Created patient visit', '201601062'),
(156, '2019-05-07 17:14:52', 'Created patient visit', '201601062'),
(157, '2019-05-07 17:24:03', 'Created patient visit', '201601062'),
(158, '2019-05-07 17:24:26', 'Created patient visit', '201601062'),
(159, '2019-05-07 17:28:32', 'Updated patient profile.', '201601062'),
(160, '2019-05-07 17:28:35', 'Updated patient profile.', '201601062'),
(161, '2019-05-07 19:33:50', 'Created patient visit', '201601062'),
(162, '2019-05-07 19:37:52', 'Stock of medicine adjusted.', '201601062'),
(163, '2019-05-07 19:38:17', 'Stock of medicine adjusted.', '201601062'),
(164, '2019-05-07 19:38:27', 'Stock of medicine adjusted.', '201601062'),
(165, '2019-05-07 19:38:45', 'Stock of medicine adjusted.', '201601062'),
(166, '2019-05-07 19:39:00', 'Stock of medicine adjusted.', '201601062'),
(167, '2019-05-07 19:39:14', 'Stock of medicine adjusted.', '201601062'),
(168, '2019-05-07 19:40:18', 'Created patient visit', '201601062'),
(169, '2019-05-07 19:42:13', 'Created patient visit', '201601062'),
(170, '2019-05-07 19:43:19', 'Created patient visit', '201601062'),
(171, '2019-05-08 08:32:39', 'Created patient visit', '201601062'),
(172, '2019-05-08 09:53:44', 'Successfully logged out.', '201601062'),
(173, '2019-05-08 09:54:09', 'Successfully logged in.', '201601048'),
(174, '2019-05-08 10:03:15', 'Updated patient visit record.', '201601048'),
(175, '2019-05-08 10:07:02', 'Updated patient visit record.', '201601048'),
(176, '2019-05-08 10:08:19', 'Updated patient visit record.', '201601048'),
(177, '2019-05-08 10:12:31', 'Updated patient visit record.', '201601048'),
(178, '2019-05-08 10:12:57', 'Updated patient visit record.', '201601048'),
(179, '2019-05-08 10:13:25', 'Updated patient visit record.', '201601048'),
(180, '2019-05-08 10:14:22', 'Updated patient visit record.', '201601048'),
(181, '2019-05-08 10:14:30', 'Updated patient visit record.', '201601048'),
(182, '2019-05-08 10:16:12', 'Updated patient visit record.', '201601048'),
(183, '2019-05-08 10:21:25', 'Updated patient visit record.', '201601048'),
(184, '2019-05-08 10:23:25', 'Updated patient visit record.', '201601048'),
(185, '2019-05-08 10:37:35', 'Updated patient visit record.', '201601048'),
(186, '2019-05-08 10:37:46', 'Updated patient visit record.', '201601048'),
(187, '2019-05-08 11:33:58', 'Created patient visit', '201601048'),
(188, '2019-05-08 12:30:21', 'Successfully logged out.', '201601048'),
(189, '2019-05-08 12:30:46', 'Successfully logged in.', '201601062'),
(190, '2019-05-09 04:58:56', 'Created medicine.', '201601062'),
(191, '2019-05-09 05:06:19', 'Created medicine.', '201601062'),
(192, '2019-05-09 05:14:31', 'Created allergy.', '201601062'),
(193, '2019-05-09 05:14:40', 'Deleted data record.', '201601062'),
(194, '2019-05-09 05:15:57', 'Created patient visit', '201601062'),
(195, '2019-05-09 06:49:35', 'Created patient visit', '201601062'),
(196, '2019-05-09 07:34:33', 'Created patient visit', '201601062'),
(197, '2019-05-09 07:43:27', 'Successfully logged out.', '201601062'),
(198, '2019-05-09 07:44:59', 'Successfully logged in.', '201601048'),
(199, '2019-05-09 07:50:06', 'Created patient visit', '201601048'),
(200, '2019-05-09 08:26:25', 'Created patient visit', '201601048'),
(201, '2019-05-09 08:27:20', 'Successfully logged out.', '201601048'),
(202, '2019-05-09 08:39:31', 'Successfully logged in.', '201601048'),
(203, '2019-05-09 08:41:29', 'Created new patient profile.', '201601048'),
(204, '2019-05-09 09:14:32', 'Successfully logged out.', '201601048'),
(205, '2019-05-09 09:20:43', 'Successfully logged in.', '201601048'),
(206, '2019-05-09 09:32:18', 'Created patient visit', '201601048'),
(207, '2019-05-09 09:33:28', 'Created patient visit', '201601048'),
(208, '2019-05-09 10:32:55', 'Successfully logged out.', '201601048'),
(209, '2019-05-09 10:33:54', 'Successfully logged in.', '201601062'),
(210, '2019-05-10 10:38:47', 'Successfully logged out.', '201601062'),
(211, '2019-05-10 10:39:06', 'Successfully logged in.', '201601048'),
(212, '2019-05-10 10:39:21', 'Successfully logged out.', '201601048'),
(213, '2019-05-10 10:39:28', 'Successfully logged in.', '201601062'),
(214, '2019-05-10 10:43:48', 'Created patient visit', '201601062'),
(215, '2019-05-10 12:26:05', 'Created patient visit', '201601062'),
(216, '2019-05-11 06:19:57', 'Created patient visit', '201601062'),
(217, '2019-05-11 06:20:45', 'Created patient visit', '201601062'),
(218, '2019-05-11 12:17:41', 'Updated medicine.', '201601062'),
(219, '2019-05-11 12:39:19', 'Stock of medicine adjusted.', '201601062'),
(220, '2019-05-11 12:39:30', 'Stock of medicine adjusted.', '201601062'),
(221, '2019-05-11 12:39:53', 'Updated medicine.', '201601062'),
(222, '2019-05-11 12:40:09', 'Updated medicine.', '201601062'),
(223, '2019-05-11 12:40:25', 'Stock of medicine adjusted.', '201601062'),
(224, '2019-05-11 12:40:49', 'Updated medicine.', '201601062'),
(225, '2019-05-11 12:47:49', 'Updated medicine.', '201601062'),
(226, '2019-05-11 12:49:14', 'Updated medicine.', '201601062'),
(227, '2019-05-12 05:41:11', 'Successfully logged out.', '201601062'),
(228, '2019-05-12 05:41:46', 'Successfully logged in.', '201601048'),
(229, '2019-05-12 05:41:46', 'Successfully logged in.', '201601048'),
(230, '2019-05-12 13:05:12', 'Successfully logged out.', '201601048'),
(231, '2019-05-12 13:05:22', 'Successfully logged in.', '201601048'),
(232, '2019-05-12 13:08:39', 'Successfully logged out.', '201601048'),
(233, '2019-05-12 13:09:05', 'Successfully logged in.', '201601062'),
(234, '2019-05-12 13:11:40', 'Successfully logged out.', '201601062'),
(235, '2019-05-12 13:11:47', 'Successfully logged in.', '201601048'),
(236, '2019-05-12 13:14:01', 'Successfully logged out.', '201601048'),
(237, '2019-05-12 13:14:30', 'Successfully logged in.', '201601048'),
(238, '2019-05-12 13:15:01', 'Successfully logged out.', '201601048'),
(239, '2019-05-12 13:15:09', 'Successfully logged in.', '201601062'),
(240, '2019-05-12 14:16:54', 'Successfully logged out.', '201601062'),
(241, '2019-05-12 14:17:07', 'Successfully logged in.', '201601048'),
(242, '2019-05-12 14:55:08', 'Successfully logged in.', '201601048'),
(243, '2019-05-12 17:19:53', 'Successfully logged in.', '201601062'),
(244, '2019-05-12 17:20:11', 'Successfully logged out.', '201601062'),
(245, '2019-05-12 17:20:28', 'Successfully logged in.', '201601048'),
(246, '2019-05-12 17:28:16', 'Created new patient profile.', '201601048'),
(247, '2019-05-12 17:37:05', 'Successfully logged out.', '201601048'),
(248, '2019-05-12 17:37:53', 'Successfully logged in.', '201601062'),
(249, '2019-05-12 22:52:17', 'Successfully logged in.', '201601048'),
(250, '2019-05-13 00:37:54', 'Updated patient profile.', '201601048'),
(251, '2019-05-13 00:39:31', 'Updated patient profile.', '201601048'),
(252, '2019-05-13 00:40:24', 'Updated patient profile.', '201601048'),
(253, '2019-05-13 00:41:16', 'Updated patient profile.', '201601048'),
(254, '2019-05-13 00:41:55', 'Updated patient profile.', '201601048'),
(255, '2019-05-13 00:43:22', 'Successfully logged out.', '201601048'),
(256, '2019-05-13 00:43:37', 'Successfully logged in.', '201601048'),
(257, '2019-05-13 00:43:56', 'Updated patient profile.', '201601048'),
(258, '2019-05-13 00:44:30', 'Updated patient profile.', '201601048'),
(259, '2019-05-13 00:57:58', 'Updated patient profile.', '201601048'),
(260, '2019-05-13 00:58:44', 'Updated patient profile.', '201601048'),
(261, '2019-05-13 01:00:00', 'Updated patient profile.', '201601048'),
(262, '2019-05-13 01:00:55', 'Updated patient profile.', '201601048'),
(263, '2019-05-13 01:56:35', 'Successfully logged out.', '201601048'),
(264, '2019-05-13 01:56:56', 'Successfully logged in.', '201601048'),
(265, '2019-05-13 02:43:02', 'Successfully logged in.', '201601062'),
(266, '2019-05-13 02:43:49', 'Created patient visit', '201601062'),
(267, '2019-05-13 02:44:55', 'Created patient visit', '201601062'),
(268, '2019-05-13 03:31:17', 'Created patient visit', '201601062'),
(269, '2019-05-13 04:24:58', 'Successfully logged in.', '201601048'),
(270, '2019-05-13 04:32:17', 'Successfully logged in.', '201601048'),
(271, '2019-05-13 04:59:36', 'Successfully logged in.', '201601048'),
(272, '2019-05-13 05:28:31', 'Created patient visit', '201601048'),
(273, '2019-05-13 05:34:22', 'Created patient visit', '201601048'),
(274, '2019-05-13 05:40:59', 'Created patient visit', '201601048'),
(275, '2019-05-13 06:00:22', 'Created patient visit', '201601048'),
(276, '2019-05-13 06:03:44', 'Created patient visit', '201601048'),
(277, '2019-05-13 06:05:36', 'Created patient visit', '201601048'),
(278, '2019-05-13 06:07:02', 'Deleted patient visit record.', '201601048'),
(279, '2019-05-13 06:07:02', 'Deleted patient visit record.', '201601048'),
(280, '2019-05-13 06:07:02', 'Deleted patient visit record.', '201601048'),
(281, '2019-05-13 06:07:02', 'Deleted patient visit record.', '201601048'),
(282, '2019-05-13 06:07:02', 'Deleted patient visit record.', '201601048'),
(283, '2019-05-13 06:07:02', 'Deleted patient visit record.', '201601048'),
(284, '2019-05-13 06:07:22', 'Created patient visit', '201601048'),
(285, '2019-05-13 06:10:04', 'Created patient visit', '201601048'),
(286, '2019-05-13 06:12:24', 'Created patient visit', '201601048'),
(287, '2019-05-13 06:13:05', 'Created patient visit', '201601048'),
(288, '2019-05-13 06:19:21', 'Deleted patient visit record.', '201601048'),
(289, '2019-05-13 06:19:21', 'Deleted patient visit record.', '201601048'),
(290, '2019-05-13 06:19:21', 'Deleted patient visit record.', '201601048'),
(291, '2019-05-13 06:19:21', 'Deleted patient visit record.', '201601048'),
(292, '2019-05-13 06:58:26', 'Successfully logged out.', '201601048'),
(293, '2019-05-13 06:58:35', 'Successfully logged in.', '201601048'),
(294, '2019-05-13 07:09:14', 'Created patient visit', '201601048'),
(295, '2019-05-13 07:45:30', 'Updated patient profile.', '201601048'),
(296, '2019-05-13 07:50:38', 'Updated patient profile.', '201601048'),
(297, '2019-05-13 10:52:48', 'Updated patient profile.', '201601048'),
(298, '2019-05-13 10:55:38', 'Updated patient profile.', '201601048'),
(299, '2019-05-13 10:58:52', 'Updated patient profile.', '201601048'),
(300, '2019-05-13 11:23:21', 'Created patient visit', '201601048'),
(301, '2019-05-13 11:26:22', 'Created patient visit', '201601048'),
(302, '2019-05-13 11:27:23', 'Created patient visit', '201601048'),
(303, '2019-05-13 13:25:33', 'Created patient visit', '201601048'),
(304, '2019-05-13 13:49:03', 'Created patient visit', '201601048'),
(305, '2019-05-13 13:50:22', 'Updated patient visit record.', '201601048'),
(306, '2019-05-13 13:51:20', 'Created patient visit', '201601048'),
(307, '2019-05-14 02:09:01', 'Updated patient visit record.', '201601062'),
(308, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(309, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(310, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(311, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(312, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(313, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(314, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(315, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(316, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(317, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(318, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(319, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(320, '2019-05-14 02:09:22', 'Deleted patient profile.', '201601062'),
(321, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(322, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(323, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(324, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(325, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(326, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(327, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(328, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(329, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(330, '2019-05-14 02:09:23', 'Deleted patient profile.', '201601062'),
(331, '2019-05-14 02:09:24', 'Deleted patient profile.', '201601062'),
(332, '2019-05-14 02:09:24', 'Deleted patient profile.', '201601062'),
(333, '2019-05-14 02:09:24', 'Deleted patient profile.', '201601062'),
(334, '2019-05-14 02:13:13', 'Created new patient profile.', '201601062'),
(335, '2019-05-14 02:13:37', 'Updated patient profile.', '201601062'),
(336, '2019-05-14 02:13:39', 'Updated patient profile.', '201601062'),
(337, '2019-05-14 02:13:40', 'Updated patient profile.', '201601062'),
(338, '2019-05-14 02:13:40', 'Updated patient profile.', '201601062'),
(339, '2019-05-14 02:13:43', 'Updated patient profile.', '201601062'),
(340, '2019-05-14 02:13:44', 'Updated patient profile.', '201601062'),
(341, '2019-05-14 02:13:44', 'Updated patient profile.', '201601062'),
(342, '2019-05-14 02:13:45', 'Updated patient profile.', '201601062'),
(343, '2019-05-14 02:13:46', 'Updated patient profile.', '201601062'),
(344, '2019-05-14 02:13:46', 'Updated patient profile.', '201601062'),
(345, '2019-05-14 02:13:47', 'Updated patient profile.', '201601062'),
(346, '2019-05-14 02:13:48', 'Updated patient profile.', '201601062'),
(347, '2019-05-14 02:14:09', 'Updated patient profile.', '201601062'),
(348, '2019-05-14 02:14:10', 'Updated patient profile.', '201601062'),
(349, '2019-05-14 02:14:11', 'Updated patient profile.', '201601062'),
(350, '2019-05-14 02:17:18', 'Created new patient profile.', '201601062'),
(351, '2019-05-14 02:18:06', 'Created new patient profile.', '201601062'),
(352, '2019-05-14 02:18:55', 'Created patient visit', '201601062'),
(353, '2019-05-14 02:25:11', 'Successfully logged in.', '201601062'),
(354, '2019-05-14 02:26:37', 'Updated patient profile.', '201601062'),
(355, '2019-05-14 02:26:39', 'Updated patient profile.', '201601062'),
(356, '2019-05-14 02:26:40', 'Updated patient profile.', '201601062'),
(357, '2019-05-14 02:26:40', 'Updated patient profile.', '201601062'),
(358, '2019-05-14 02:26:41', 'Updated patient profile.', '201601062'),
(359, '2019-05-14 02:26:41', 'Updated patient profile.', '201601062'),
(360, '2019-05-14 02:31:35', 'Updated complaint', '201601062'),
(361, '2019-05-14 02:31:53', 'Updated complaint', '201601062'),
(362, '2019-05-14 02:32:13', 'Updated complaint', '201601062'),
(363, '2019-05-14 02:32:44', 'Stock of medicine adjusted.', '201601062'),
(364, '2019-05-14 02:35:25', 'Created patient visit', '201601062'),
(365, '2019-05-14 02:36:32', 'Updated complaint', '201601062'),
(366, '2019-05-14 02:49:05', 'Successfully logged out.', '201601062'),
(367, '2019-05-14 02:49:25', 'Successfully logged in.', '201601062'),
(368, '2019-05-14 02:50:34', 'Created new patient profile.', '201601062'),
(369, '2019-05-14 02:52:16', 'Created new patient profile.', '201601062'),
(370, '2019-05-14 03:01:09', 'Created new patient profile.', '201601062'),
(371, '2019-05-14 03:02:56', 'Created new patient profile.', '201601062'),
(372, '2019-05-14 03:04:33', 'Created patient visit', '201601062'),
(373, '2019-05-14 03:10:57', 'Created patient visit', '201601062'),
(374, '2019-05-14 03:19:42', 'Created allergy.', '201601062'),
(375, '2019-05-14 03:19:55', 'Created allergy.', '201601062'),
(376, '2019-05-14 03:20:51', 'Updated allergy', '201601062'),
(377, '2019-05-14 03:24:07', 'Created new patient profile.', '201601062'),
(378, '2019-05-14 03:25:54', 'Created course.', '201601062'),
(379, '2019-05-14 03:27:19', 'Created track.', '201601062'),
(380, '2019-05-14 03:27:39', 'Created department.', '201601062'),
(381, '2019-05-14 03:29:29', 'Created complaint.', '201601062'),
(382, '2019-05-14 03:46:21', 'Updated patient profile.', '201601062'),
(383, '2019-05-14 03:46:22', 'Updated patient profile.', '201601062'),
(384, '2019-05-14 03:46:34', 'Updated patient profile.', '201601062'),
(385, '2019-05-14 03:46:35', 'Updated patient profile.', '201601062'),
(386, '2019-05-14 03:46:35', 'Updated patient profile.', '201601062'),
(387, '2019-05-14 03:46:36', 'Updated patient profile.', '201601062'),
(388, '2019-05-14 03:46:37', 'Updated patient profile.', '201601062'),
(389, '2019-05-14 03:46:37', 'Updated patient profile.', '201601062'),
(390, '2019-05-14 03:46:39', 'Updated patient profile.', '201601062'),
(391, '2019-05-14 03:55:19', 'Stock of medicine adjusted.', '201601062'),
(392, '2019-05-14 03:58:47', 'Stock of medicine adjusted.', '201601062'),
(393, '2019-05-14 03:58:58', 'Created patient visit', '201601062'),
(394, '2019-05-14 04:00:14', 'Created patient visit', '201601062'),
(395, '2019-05-14 04:03:58', 'Updated patient visit record.', '201601062'),
(396, '2019-05-14 04:05:32', 'Created patient visit', '201601062'),
(397, '2019-05-14 04:06:22', 'Updated patient visit record.', '201601062'),
(398, '2019-05-14 04:07:04', 'Created patient visit', '201601062'),
(399, '2019-05-14 04:13:38', 'Created patient visit', '201601062'),
(400, '2019-05-14 04:18:02', 'Created patient visit', '201601062'),
(401, '2019-05-14 04:38:07', 'Updated patient profile.', '201601062'),
(402, '2019-05-14 04:38:07', 'Updated patient profile.', '201601062'),
(403, '2019-05-14 04:38:08', 'Updated patient profile.', '201601062'),
(404, '2019-05-14 05:08:32', 'Updated patient profile.', '201601062'),
(405, '2019-05-14 05:08:33', 'Updated patient profile.', '201601062'),
(406, '2019-05-14 05:35:16', 'Updated patient profile.', '201601062'),
(407, '2019-05-14 05:35:53', 'Updated patient profile.', '201601062'),
(408, '2019-05-14 05:35:55', 'Updated patient profile.', '201601062'),
(409, '2019-05-14 05:35:56', 'Updated patient profile.', '201601062'),
(410, '2019-05-14 05:35:58', 'Updated patient profile.', '201601062'),
(411, '2019-05-14 05:36:00', 'Updated patient profile.', '201601062'),
(412, '2019-05-14 05:36:03', 'Updated patient profile.', '201601062'),
(413, '2019-05-14 05:36:04', 'Updated patient profile.', '201601062'),
(414, '2019-05-14 05:36:06', 'Updated patient profile.', '201601062'),
(415, '2019-05-14 05:36:06', 'Updated patient profile.', '201601062'),
(416, '2019-05-14 05:36:08', 'Updated patient profile.', '201601062'),
(417, '2019-05-14 05:36:09', 'Updated patient profile.', '201601062'),
(418, '2019-05-14 05:36:10', 'Updated patient profile.', '201601062'),
(419, '2019-05-14 05:36:11', 'Updated patient profile.', '201601062'),
(420, '2019-05-14 05:36:12', 'Updated patient profile.', '201601062'),
(421, '2019-05-14 05:36:13', 'Updated patient profile.', '201601062'),
(422, '2019-05-14 05:36:14', 'Updated patient profile.', '201601062'),
(423, '2019-05-14 05:36:16', 'Updated patient profile.', '201601062'),
(424, '2019-05-14 05:36:19', 'Updated patient profile.', '201601062'),
(425, '2019-05-14 05:36:21', 'Updated patient profile.', '201601062'),
(426, '2019-05-14 05:36:22', 'Updated patient profile.', '201601062'),
(427, '2019-05-14 05:36:23', 'Updated patient profile.', '201601062'),
(428, '2019-05-14 05:36:24', 'Updated patient profile.', '201601062'),
(429, '2019-05-14 05:36:47', 'Updated patient profile.', '201601062'),
(430, '2019-05-14 05:36:48', 'Updated patient profile.', '201601062'),
(431, '2019-05-14 05:36:49', 'Updated patient profile.', '201601062'),
(432, '2019-05-14 05:36:52', 'Updated patient profile.', '201601062'),
(433, '2019-05-14 05:36:53', 'Updated patient profile.', '201601062'),
(434, '2019-05-14 05:36:54', 'Updated patient profile.', '201601062'),
(435, '2019-05-14 05:45:26', 'Updated patient profile.', '201601062'),
(436, '2019-05-14 05:45:27', 'Updated patient profile.', '201601062'),
(437, '2019-05-14 05:45:28', 'Updated patient profile.', '201601062'),
(438, '2019-05-14 05:45:29', 'Updated patient profile.', '201601062'),
(439, '2019-05-14 05:45:29', 'Updated patient profile.', '201601062'),
(440, '2019-05-14 05:45:31', 'Updated patient profile.', '201601062'),
(441, '2019-05-14 05:45:31', 'Updated patient profile.', '201601062'),
(442, '2019-05-14 05:48:45', 'Updated patient profile.', '201601062'),
(443, '2019-05-14 05:48:47', 'Updated patient profile.', '201601062'),
(444, '2019-05-14 05:48:48', 'Updated patient profile.', '201601062'),
(445, '2019-05-14 05:48:49', 'Updated patient profile.', '201601062'),
(446, '2019-05-14 05:48:49', 'Updated patient profile.', '201601062'),
(447, '2019-05-14 05:48:51', 'Updated patient profile.', '201601062'),
(448, '2019-05-14 05:48:53', 'Updated patient profile.', '201601062'),
(449, '2019-05-14 05:58:55', 'Successfully logged in.', '201601062'),
(450, '2019-05-14 07:12:35', 'Created patient visit', '201601062'),
(451, '2019-05-14 07:16:38', 'Updated patient profile.', '201601062'),
(452, '2019-05-14 07:24:47', 'Created patient visit', '201601062'),
(453, '2019-05-14 07:25:52', 'Created patient visit', '201601062'),
(454, '2019-05-14 07:59:53', 'Created new patient profile.', '201601062'),
(455, '2019-05-14 08:02:35', 'Created medicine.', '201601062'),
(456, '2019-05-14 08:05:47', 'Created medicine.', '201601062'),
(457, '2019-05-14 22:07:45', 'Successfully logged in.', '201601062'),
(458, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(459, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(460, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(461, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(462, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(463, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(464, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(465, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(466, '2019-05-14 22:08:55', 'Deleted data record.', '201601062'),
(467, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(468, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(469, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(470, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(471, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(472, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(473, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(474, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(475, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(476, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(477, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(478, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(479, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(480, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(481, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(482, '2019-05-14 22:08:56', 'Deleted data record.', '201601062'),
(483, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(484, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(485, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(486, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(487, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(488, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(489, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(490, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(491, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(492, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(493, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(494, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(495, '2019-05-14 22:08:57', 'Deleted data record.', '201601062'),
(496, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(497, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(498, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(499, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(500, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(501, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(502, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(503, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(504, '2019-05-14 22:08:58', 'Deleted data record.', '201601062'),
(505, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(506, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(507, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(508, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(509, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(510, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(511, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(512, '2019-05-14 22:08:59', 'Deleted data record.', '201601062'),
(513, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(514, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(515, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(516, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(517, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(518, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(519, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(520, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(521, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(522, '2019-05-14 22:09:00', 'Deleted data record.', '201601062'),
(523, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(524, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(525, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(526, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(527, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(528, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(529, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(530, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(531, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(532, '2019-05-14 22:09:01', 'Deleted data record.', '201601062'),
(533, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(534, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(535, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(536, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(537, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(538, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(539, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(540, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(541, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(542, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(543, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(544, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(545, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(546, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(547, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(548, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(549, '2019-05-14 22:09:02', 'Deleted data record.', '201601062'),
(550, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(551, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(552, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(553, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(554, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(555, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(556, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(557, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(558, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(559, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(560, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(561, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(562, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(563, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(564, '2019-05-14 22:09:03', 'Deleted data record.', '201601062'),
(565, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(566, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(567, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(568, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(569, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(570, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(571, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(572, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(573, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(574, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(575, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(576, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(577, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(578, '2019-05-14 22:09:04', 'Deleted data record.', '201601062'),
(579, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(580, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(581, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(582, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(583, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(584, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(585, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(586, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(587, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(588, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(589, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(590, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(591, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(592, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(593, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(594, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(595, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(596, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(597, '2019-05-14 22:09:05', 'Deleted data record.', '201601062'),
(598, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(599, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(600, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(601, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(602, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(603, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(604, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(605, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(606, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(607, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(608, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(609, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(610, '2019-05-14 22:09:06', 'Deleted data record.', '201601062'),
(611, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(612, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(613, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(614, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(615, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(616, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(617, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(618, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(619, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(620, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(621, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(622, '2019-05-14 22:09:07', 'Deleted data record.', '201601062'),
(623, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(624, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(625, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(626, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(627, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(628, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(629, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(630, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(631, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(632, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(633, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(634, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(635, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(636, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(637, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(638, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(639, '2019-05-14 22:09:08', 'Deleted data record.', '201601062'),
(640, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(641, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(642, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(643, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(644, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(645, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(646, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(647, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(648, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(649, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(650, '2019-05-14 22:09:09', 'Deleted data record.', '201601062'),
(651, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(652, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(653, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(654, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(655, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(656, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(657, '2019-05-14 22:09:10', 'Deleted data record.', '201601062'),
(658, '2019-05-14 22:21:10', 'Successfully logged in.', '201603007'),
(659, '2019-05-14 22:21:39', 'Deleted patient profile.', '201603007'),
(660, '2019-05-14 22:31:44', 'Created new patient profile.', '201603007'),
(661, '2019-05-14 22:33:52', 'Successfully logged out.', '201603007'),
(662, '2019-05-14 22:34:06', 'Successfully reset a password', '201603007'),
(663, '2019-05-14 22:35:13', 'Successfully logged out.', '201603007'),
(664, '2019-05-14 22:35:26', 'Successfully logged in.', '201603007'),
(665, '2019-05-14 22:35:54', 'Successfully logged out.', '201603007'),
(666, '2019-05-14 22:36:10', 'Successfully reset a password', '201603007'),
(667, '2019-05-14 22:36:31', 'Successfully logged in.', '201603007'),
(668, '2019-05-14 22:37:48', 'Created patient visit', '201603007'),
(669, '2019-05-14 22:38:08', 'Updated patient visit record.', '201603007'),
(670, '2019-05-14 22:39:44', 'Updated patient profile.', '201603007'),
(671, '2019-05-14 22:40:23', 'Updated allergy', '201603007'),
(672, '2019-05-14 22:40:45', 'Deleted data record.', '201603007'),
(673, '2019-05-14 22:40:45', 'Deleted data record.', '201603007'),
(674, '2019-05-14 22:41:21', 'Created allergy.', '201603007'),
(675, '2019-05-14 22:41:40', 'Updated allergy', '201603007'),
(676, '2019-05-14 22:42:18', 'Deleted data record.', '201603007'),
(677, '2019-05-14 22:43:29', 'Created patient visit', '201603007'),
(678, '2019-05-14 22:44:44', 'Stock of medicine adjusted.', '201603007'),
(679, '2019-05-14 22:47:10', 'Updated medicine.', '201603007'),
(680, '2019-05-14 22:47:38', 'Updated medicine.', '201603007'),
(681, '2019-05-14 22:53:38', 'Updated medicine.', '201603007'),
(682, '2019-05-14 22:54:32', 'Updated medicine.', '201603007'),
(683, '2019-05-14 22:57:45', 'Created medicine.', '201603007'),
(684, '2019-05-14 23:09:45', 'Successfully logged in.', '201603007'),
(685, '2019-05-14 23:15:19', 'Created new patient profile.', '201603007'),
(686, '2019-05-14 23:16:19', 'Successfully logged out.', '201603007'),
(687, '2019-05-14 23:16:51', 'Successfully logged in.', '201603007'),
(688, '2019-05-14 23:17:27', 'Successfully logged out.', '201603007'),
(689, '2019-05-14 23:17:37', 'Successfully reset a password', '201603007'),
(690, '2019-05-14 23:19:26', 'Successfully logged out.', '201603007'),
(691, '2019-05-14 23:19:34', 'Successfully logged in.', '201603007'),
(692, '2019-05-14 23:20:06', 'Successfully logged out.', '201603007'),
(693, '2019-05-14 23:20:37', 'Successfully logged in.', '201603007'),
(694, '2019-05-14 23:21:14', 'Successfully logged out.', '201603007'),
(695, '2019-05-14 23:21:21', 'Successfully logged in.', '201601048'),
(696, '2019-05-14 23:21:25', 'Successfully logged out.', '201601048'),
(697, '2019-05-14 23:21:29', 'Successfully logged in.', '201603007'),
(698, '2019-05-14 23:21:39', 'Successfully logged out.', '201603007'),
(699, '2019-05-14 23:21:48', 'Successfully logged in.', '201601048'),
(700, '2019-05-14 23:22:02', 'Successfully logged out.', '201601048'),
(701, '2019-05-14 23:22:11', 'Successfully logged in.', '201603007'),
(702, '2019-05-15 01:25:32', 'Successfully logged in.', '201603007'),
(703, '2019-05-15 01:26:16', 'Created new patient profile.', '201603007'),
(704, '2019-05-15 01:28:36', 'Created new patient profile.', '201603007'),
(705, '2019-05-15 01:29:05', 'Created patient visit', '201603007'),
(706, '2019-05-15 01:29:12', 'Successfully logged out.', '201603007'),
(707, '2019-05-15 01:29:15', 'Successfully logged in.', '201603007'),
(708, '2019-05-15 01:32:06', 'Successfully logged in.', '201603007'),
(709, '2019-05-15 01:36:41', 'Successfully logged out.', '201603007'),
(710, '2019-05-15 01:36:49', 'Successfully logged in.', '201601048'),
(711, '2019-05-15 01:37:25', 'Created new patient profile.', '201601048'),
(712, '2019-05-15 01:38:36', 'Deleted patient profile.', '201601048'),
(713, '2019-05-15 01:39:44', 'Successfully logged out.', '201601048'),
(714, '2019-05-15 01:40:10', 'Successfully logged in.', '201603007'),
(715, '2019-05-15 01:40:34', 'Created allergy.', '201603007'),
(716, '2019-05-15 01:44:55', 'Successfully logged out.', '201603007'),
(717, '2019-05-15 01:45:01', 'Successfully logged in.', '201601048'),
(718, '2019-05-15 01:46:51', 'Successfully logged in.', '201603007'),
(719, '2019-05-15 01:51:13', 'Successfully logged in.', '201603007'),
(720, '2019-05-15 01:52:42', 'Successfully logged in.', '201603007'),
(721, '2019-05-15 02:04:17', 'Successfully logged in.', '201603007'),
(722, '2019-05-15 02:09:18', 'Successfully logged in.', '201603007'),
(723, '2019-05-15 02:09:49', 'Successfully logged out.', '201603007'),
(724, '2019-05-15 02:10:00', 'Successfully logged in.', '201601048'),
(725, '2019-05-15 02:14:04', 'Successfully logged out.', '201601048'),
(726, '2019-05-15 02:14:11', 'Successfully logged in.', '201603007'),
(727, '2019-05-15 02:21:32', 'Successfully logged in.', '201603007'),
(728, '2019-05-15 02:22:26', 'Successfully logged in.', '201603007'),
(729, '2019-05-15 02:25:09', 'Successfully logged in.', '201603007'),
(730, '2019-05-15 02:26:08', 'Successfully logged in.', '201603007'),
(731, '2019-05-15 02:29:04', 'Successfully logged in.', '201603007'),
(732, '2019-05-15 02:30:47', 'Successfully logged in.', '201603007'),
(733, '2019-05-15 02:31:55', 'Successfully logged in.', '201603007'),
(734, '2019-05-15 02:33:45', 'Successfully logged in.', '201603007'),
(735, '2019-05-15 02:34:38', 'Successfully logged in.', '201603007'),
(736, '2019-05-15 02:56:12', 'Created complaint.', '201603007'),
(737, '2019-05-15 02:56:26', 'Created course.', '201603007'),
(738, '2019-05-15 02:56:34', 'Created track.', '201603007');
INSERT INTO `logs` (`eventID`, `eventDate`, `eventName`, `userID`) VALUES
(739, '2019-05-15 02:56:43', 'Created department.', '201603007'),
(740, '2019-05-15 02:56:55', 'Created department.', '201603007'),
(741, '2019-05-15 02:57:03', 'Created allergy.', '201603007'),
(742, '2019-05-15 02:57:16', 'Created complaint.', '201603007'),
(743, '2019-05-15 03:03:46', 'Updated patient profile.', '201603007'),
(744, '2019-05-15 03:17:27', 'Successfully logged out.', '201603007'),
(745, '2019-05-15 03:17:52', 'Successfully logged in.', '201603007'),
(746, '2019-05-15 03:19:22', 'Created new patient profile.', '201603007'),
(747, '2019-05-15 03:20:24', 'Created patient visit', '201603007'),
(748, '2019-05-15 03:21:17', 'Created patient visit', '201603007'),
(749, '2019-05-15 03:21:56', 'Created patient visit', '201603007'),
(750, '2019-05-15 03:22:46', 'Created course.', '201603007'),
(751, '2019-05-15 03:24:14', 'Stock of medicine adjusted.', '201603007'),
(752, '2019-05-15 03:25:05', 'Created medicine.', '201603007'),
(753, '2019-05-15 03:25:52', 'Updated medicine.', '201603007'),
(754, '2019-05-15 03:26:14', 'Stock of medicine adjusted.', '201603007'),
(755, '2019-05-15 03:26:29', 'Stock of medicine adjusted.', '201603007'),
(756, '2019-05-15 03:26:40', 'Stock of medicine adjusted.', '201603007'),
(757, '2019-05-15 03:28:39', 'Changed status of user.', '201603007'),
(758, '2019-05-15 03:33:34', 'Created patient visit', '201603007'),
(759, '2019-05-15 03:34:11', 'Deleted data record.', '201603007'),
(760, '2019-05-15 03:35:44', 'Created complaint.', '201603007'),
(761, '2019-05-15 04:16:39', 'Successfully logged out.', '201603007'),
(762, '2019-05-15 12:55:50', 'Successfully logged in.', '201603007'),
(763, '2019-05-15 13:07:22', 'Successfully logged out.', '201603007'),
(764, '2019-05-15 13:25:13', 'Successfully logged in.', '201603007'),
(765, '2019-05-15 13:28:34', 'Updated patient profile.', '201603007'),
(766, '2019-05-15 13:31:54', 'Successfully logged in.', '201603007'),
(767, '2019-05-15 13:39:06', 'Successfully logged out.', '201603007'),
(768, '2019-05-16 03:17:10', 'Successfully logged in.', '201603007'),
(769, '2019-05-16 03:18:12', 'Stock of medicine adjusted.', '201603007'),
(770, '2019-05-16 03:18:28', 'Successfully logged out.', '201603007'),
(771, '2019-05-17 11:46:18', 'Successfully logged in.', '201603007'),
(772, '2019-05-17 11:48:14', 'Created new patient profile.', '201603007'),
(773, '2019-05-17 12:12:37', 'Successfully logged out.', '201603007'),
(774, '2019-05-19 22:31:13', 'Successfully logged in.', '201603007'),
(775, '2019-05-19 22:31:28', 'Successfully logged out.', '201603007'),
(776, '2019-05-19 22:31:32', 'Successfully logged in.', '201603007'),
(777, '2019-05-19 22:31:38', 'Successfully logged out.', '201603007'),
(778, '2019-05-19 22:32:15', 'Successfully logged in.', '201601048'),
(779, '2019-05-19 22:33:13', 'Successfully logged out.', '201601048'),
(780, '2019-05-19 22:33:32', 'Successfully logged in.', '201601062'),
(781, '2019-05-19 22:36:27', 'Created a new user.', '201601062'),
(782, '2019-05-19 22:36:35', 'Successfully logged out.', '201601062'),
(783, '2019-05-19 22:36:56', 'Successfully logged in.', '201603007'),
(784, '2019-05-19 23:33:57', 'Successfully logged out.', '201603007'),
(785, '2019-05-19 23:34:08', 'Successfully logged in.', '201601048'),
(786, '2019-05-19 23:34:23', 'Successfully logged out.', '201601048'),
(787, '2019-05-19 23:34:31', 'Successfully logged in.', '201603007'),
(788, '2019-05-19 23:45:11', 'Successfully logged in.', '201603007'),
(789, '2019-05-19 23:45:53', 'Changed status of user.', '201603007'),
(790, '2019-05-19 23:49:41', 'Successfully logged out.', '201603007'),
(791, '2019-05-19 23:49:57', 'Successfully logged in.', '201601045'),
(792, '2019-05-19 23:50:47', 'Successfully logged out.', '201601045'),
(793, '2019-05-19 23:50:53', 'Successfully logged in.', '201601048'),
(794, '2019-05-19 23:51:00', 'Successfully logged out.', '201601048'),
(795, '2019-05-19 23:51:08', 'Successfully logged in.', '201603007'),
(796, '2019-05-20 00:06:36', 'Successfully logged out.', '201603007'),
(797, '2019-05-20 00:06:48', 'Successfully logged in.', '201601045'),
(798, '2019-05-20 00:09:01', 'Successfully logged in.', '201601045'),
(799, '2019-05-20 00:11:47', 'Successfully logged out.', '201601045'),
(800, '2019-05-20 00:12:14', 'Successfully logged in.', '201601045'),
(801, '2019-05-20 00:21:11', 'Successfully logged in.', '201601045'),
(802, '2019-05-20 00:22:11', 'Successfully logged in.', '201601045'),
(803, '2019-05-20 00:23:43', 'Successfully logged in.', '201601045'),
(804, '2019-05-20 00:24:05', 'Successfully logged out.', '201601045'),
(805, '2019-05-20 00:24:11', 'Successfully logged in.', '201603007'),
(806, '2019-05-20 00:24:52', 'Successfully logged out.', '201603007'),
(807, '2019-05-20 00:33:31', 'Successfully logged in.', '201603007'),
(808, '2019-05-20 00:34:46', 'Created a new user.', '201603007'),
(809, '2019-05-20 00:41:46', 'Successfully logged in.', '201603007'),
(810, '2019-05-20 00:44:17', 'Successfully logged in.', '201603007'),
(811, '2019-05-20 00:45:24', 'Successfully logged in.', '201603007'),
(812, '2019-05-20 00:53:06', 'Successfully logged in.', '201603007'),
(813, '2019-05-20 00:58:24', 'Successfully logged in.', '201603007'),
(814, '2019-05-20 01:00:38', 'Successfully logged in.', '201603007'),
(815, '2019-05-20 01:04:17', 'Successfully logged in.', '201603007'),
(816, '2019-05-20 01:06:29', 'Successfully logged in.', '201603007'),
(817, '2019-05-20 01:11:54', 'Successfully logged in.', '201603007'),
(818, '2019-05-20 01:17:51', 'Changed status of user.', '201603007'),
(819, '2019-05-20 01:17:59', 'Changed status of user.', '201603007'),
(820, '2019-05-20 01:32:36', 'Successfully logged out.', '201603007'),
(821, '2019-05-20 01:32:43', 'Successfully logged in.', '201601048'),
(822, '2019-05-20 01:32:57', 'Successfully logged out.', '201601048'),
(823, '2019-05-20 01:33:36', 'Successfully logged in.', '201601062'),
(824, '2019-05-20 01:33:54', 'Successfully logged out.', '201601062'),
(825, '2019-05-20 01:34:08', 'Successfully logged in.', '201603007'),
(826, '2019-05-20 01:35:10', 'Successfully logged out.', '201603007'),
(827, '2019-05-20 01:35:23', 'Successfully logged in.', '201601062'),
(828, '2019-05-20 01:40:05', 'Successfully logged out.', '201601062'),
(829, '2019-05-20 01:40:13', 'Successfully logged in.', '201601048'),
(830, '2019-05-20 01:45:42', 'Successfully logged out.', '201601048'),
(831, '2019-05-20 01:46:10', 'Successfully logged in.', '201603007'),
(832, '2019-05-20 01:46:18', 'Successfully logged out.', '201603007'),
(833, '2019-05-20 01:46:25', 'Successfully logged in.', '201601048'),
(834, '2019-05-20 01:46:53', 'Successfully logged out.', '201601048'),
(835, '2019-05-20 01:47:08', 'Successfully logged in.', '201601048'),
(836, '2019-05-20 01:47:17', 'Successfully logged out.', '201601048'),
(837, '2019-05-20 01:47:59', 'Successfully logged in.', '201603007'),
(838, '2019-05-20 01:48:10', 'Successfully logged out.', '201603007'),
(839, '2019-05-20 01:49:13', 'Successfully logged in.', '201601062'),
(840, '2019-05-20 01:50:29', 'Successfully logged in.', '201601048'),
(841, '2019-05-20 01:51:21', 'Successfully logged out.', '201601048'),
(842, '2019-05-20 01:55:41', 'Successfully logged in.', '201601048'),
(843, '2019-05-20 02:02:15', 'Successfully logged in.', '201603007'),
(844, '2019-05-20 02:03:01', 'Successfully logged out.', '201603007'),
(845, '2019-05-20 02:03:15', 'Successfully logged in.', '201601048'),
(846, '2019-05-20 02:19:25', 'Successfully logged out.', '201601048'),
(847, '2019-05-20 02:19:39', 'Successfully logged in.', '201601062'),
(848, '2019-05-20 02:20:19', 'Successfully logged out.', '201601062'),
(849, '2019-05-20 02:20:27', 'Successfully logged in.', '201603007'),
(850, '2019-05-20 02:25:56', 'Successfully logged out.', '201603007'),
(851, '2019-05-20 11:24:18', 'Successfully logged in.', '201603007'),
(852, '2019-05-20 11:24:28', 'Successfully logged out.', '201603007'),
(853, '2019-05-20 11:24:39', 'Successfully logged in.', '201601045'),
(854, '2019-05-20 11:25:36', 'Created patient visit', '201601045'),
(855, '2019-05-20 11:25:54', 'Updated patient visit record.', '201601045'),
(856, '2019-05-20 11:30:41', 'Successfully logged out.', '201601045'),
(857, '2019-05-20 11:30:53', 'Successfully logged in.', '201601048'),
(858, '2019-05-20 11:32:03', 'Deleted patient profile.', '201601048'),
(859, '2019-05-20 11:32:28', 'Updated patient profile.', '201601048'),
(860, '2019-05-20 11:32:49', 'Successfully logged out.', '201601048'),
(861, '2019-05-21 03:03:18', 'Successfully logged in.', '201601045'),
(862, '2019-05-21 03:07:43', 'Created patient visit', '201601045'),
(863, '2019-05-21 03:13:51', 'Stock of medicine adjusted.', '201601045'),
(864, '2019-05-21 03:14:52', 'Stock of medicine adjusted.', '201601045'),
(865, '2019-05-21 03:25:11', 'Successfully logged out.', '201601045'),
(866, '2019-05-21 03:25:41', 'Successfully logged in.', '201603007'),
(867, '2019-05-21 03:26:46', 'Successfully logged out.', '201603007'),
(868, '2019-05-21 03:27:18', 'Successfully logged in.', '201601045'),
(869, '2019-05-21 12:04:59', 'Successfully logged in.', '201601045'),
(870, '2019-05-21 12:14:05', 'Stock of medicine adjusted.', '201601045'),
(871, '2019-05-21 12:18:43', 'Created patient visit', '201601045'),
(872, '2019-05-23 06:27:56', 'Successfully logged in.', '201601045'),
(873, '2019-05-23 06:32:01', 'Created medicine.', '201601045'),
(874, '2019-05-23 06:34:37', 'Created medicine.', '201601045'),
(875, '2019-05-23 06:35:13', 'Created medicine.', '201601045'),
(876, '2019-05-23 06:37:41', 'Successfully logged in.', '201601045'),
(877, '2019-05-23 06:42:40', 'Created medicine.', '201601045'),
(878, '2019-05-23 06:43:42', 'Created medicine.', '201601045'),
(879, '2019-05-23 06:45:47', 'Created medicine.', '201601045'),
(880, '2019-05-23 06:46:47', 'Created medicine.', '201601045'),
(881, '2019-05-23 06:47:15', 'Created medicine.', '201601045'),
(882, '2019-05-23 06:50:30', 'Created medicine.', '201601045'),
(883, '2019-05-23 06:50:58', 'Created medicine.', '201601045'),
(884, '2019-05-23 06:51:23', 'Created medicine.', '201601045'),
(885, '2019-05-23 06:53:50', 'Successfully logged in.', '201601045'),
(886, '2019-05-23 06:53:51', 'Successfully logged in.', '201601045'),
(887, '2019-05-23 06:53:51', 'Successfully logged in.', '201601045'),
(888, '2019-05-23 06:53:57', 'Successfully logged out.', '201601045'),
(889, '2019-05-23 06:54:07', 'Successfully logged in.', '201601048'),
(890, '2019-05-23 06:56:39', 'Successfully logged out.', '201601048'),
(891, '2019-05-23 08:12:29', 'Successfully logged in.', '201601048'),
(892, '2019-05-23 08:14:21', 'Created medicine.', '201601048'),
(893, '2019-05-23 08:15:44', 'Created medicine.', '201601048'),
(894, '2019-05-23 08:17:08', 'Created medicine.', '201601048'),
(895, '2019-05-23 08:26:42', 'Updated medicine.', '201601048'),
(896, '2019-05-23 08:26:55', 'Updated medicine.', '201601048'),
(897, '2019-05-23 08:29:10', 'Updated medicine.', '201601048'),
(898, '2019-05-23 08:29:45', 'Updated medicine.', '201601048'),
(899, '2019-05-24 08:19:04', 'Successfully logged in.', '201601045'),
(900, '2019-05-24 08:21:07', 'Created course.', '201601045'),
(901, '2019-05-24 08:21:25', 'Created course.', '201601045'),
(902, '2019-05-24 08:21:31', 'Deleted data record.', '201601045'),
(903, '2019-05-24 08:21:36', 'Deleted data record.', '201601045'),
(904, '2019-05-24 08:28:02', 'Successfully logged out.', '201601045'),
(905, '2019-05-24 08:29:05', 'Successfully logged in.', '201601048'),
(906, '2019-05-24 08:29:19', 'Successfully logged out.', '201601048'),
(907, '2019-05-24 08:29:40', 'Successfully reset a password', '201603007'),
(908, '2019-05-24 08:34:30', 'Successfully logged in.', '201601045'),
(909, '2019-05-24 08:36:25', 'Created a new user.', '201601045'),
(910, '2019-05-24 08:36:55', 'Successfully logged out.', '201601045'),
(911, '2019-05-24 08:47:26', 'Successfully logged out.', '201603007'),
(912, '2019-05-24 08:49:59', 'Successfully logged in.', '201603007'),
(913, '2019-05-24 08:56:50', 'Successfully logged out.', '201603007'),
(914, '2019-05-24 08:56:59', 'Successfully reset a password', '201603007'),
(915, '2019-05-24 09:00:41', 'Successfully logged in.', '201603007'),
(916, '2019-05-24 09:00:49', 'Successfully logged out.', '201603007'),
(917, '2019-05-24 09:01:40', 'Created a new user.', '6541233'),
(918, '2019-05-24 09:03:14', 'Successfully logged in.', '201603007'),
(919, '2019-05-24 09:03:14', 'Successfully logged in.', '6541233'),
(920, '2019-05-24 09:03:42', 'Successfully logged out.', '6541233'),
(921, '2019-05-24 09:04:13', 'Successfully logged in.', '201603007'),
(922, '2019-05-24 09:04:13', 'Successfully logged in.', '6541233'),
(923, '2019-05-24 09:04:53', 'Successfully logged out.', '6541233'),
(924, '2019-05-24 09:05:27', 'Successfully logged in.', '6541233'),
(925, '2019-05-24 09:06:19', 'Successfully logged out.', '6541233'),
(926, '2019-05-24 10:09:54', 'Successfully logged in.', '201601048'),
(927, '2019-05-24 10:10:01', 'Successfully logged out.', '201601048'),
(928, '2019-05-24 10:10:18', 'Successfully logged in.', '201601045'),
(929, '2019-05-24 10:11:48', 'Created a new user.', '201601045'),
(930, '2019-05-24 10:15:27', 'Successfully logged in.', '201603007'),
(931, '2019-05-24 10:17:26', 'Successfully logged in.', '201603007'),
(932, '2019-05-24 10:18:00', 'Successfully logged out.', '201603007'),
(933, '2019-05-24 10:30:58', 'Successfully logged in.', '201603007'),
(934, '2019-05-25 16:09:05', 'Successfully logged in.', '201603007'),
(935, '2019-05-25 16:09:51', 'Successfully logged out.', '201603007'),
(936, '2019-05-25 16:10:44', 'Successfully logged in.', '201601045'),
(937, '2019-05-25 16:10:55', 'Created course.', '201601045'),
(938, '2019-05-25 16:11:09', 'Deleted data record.', '201601045'),
(939, '2019-05-25 16:11:25', 'Created course.', '201601045'),
(940, '2019-05-25 16:11:32', 'Created track.', '201601045'),
(941, '2019-05-25 16:11:38', 'Deleted data record.', '201601045'),
(942, '2019-05-25 16:12:16', 'Successfully logged out.', '201601045'),
(943, '2019-05-25 16:13:02', 'Successfully reset a password', '201603007'),
(944, '2019-05-25 16:14:14', 'Created a new user.', '1236498'),
(945, '2019-05-25 16:14:54', 'Successfully logged in.', '1236498'),
(946, '2019-05-25 16:16:50', 'Successfully logged out.', '1236498'),
(947, '2019-05-25 16:16:57', 'Successfully logged in.', '201601045'),
(948, '2019-05-25 16:17:25', 'Successfully logged out.', '201601045'),
(949, '2019-05-25 16:18:07', 'Successfully logged in.', '201603007'),
(950, '2019-05-25 16:18:33', 'Successfully logged out.', '201603007'),
(951, '2019-05-25 16:18:47', 'Successfully logged in.', '1236498'),
(952, '2019-05-25 16:20:01', 'Created a new user.', '1236498'),
(953, '2019-05-25 16:20:06', 'Successfully logged out.', '1236498'),
(954, '2019-05-25 16:20:30', 'Successfully logged in.', '201903009'),
(955, '2019-05-25 16:20:47', 'Successfully logged out.', '201903009'),
(956, '2019-05-26 13:58:16', 'Successfully logged in.', '201603007'),
(957, '2019-05-26 14:02:55', 'Successfully logged in.', '201603007'),
(958, '2019-05-26 14:04:34', 'Successfully logged in.', '201603007'),
(959, '2019-05-26 14:05:11', 'Successfully logged out.', '201603007'),
(960, '2019-05-26 14:05:19', 'Successfully logged in.', '201601048'),
(961, '2019-05-26 14:05:23', 'Successfully logged out.', '201601048'),
(962, '2019-05-26 14:06:53', 'Successfully logged in.', '201603007'),
(963, '2019-05-26 14:12:43', 'Successfully logged in.', '201603007'),
(964, '2019-05-26 14:14:01', 'Changed status of user.', '201603007'),
(965, '2019-05-26 14:14:07', 'Changed status of user.', '201603007'),
(966, '2019-05-26 14:14:14', 'Changed status of user.', '201603007'),
(967, '2019-05-26 14:19:45', 'Successfully logged out.', '201603007'),
(968, '2019-05-26 14:21:06', 'Successfully logged in.', '201603007'),
(969, '2019-05-26 14:22:58', 'Successfully logged in.', '201603007'),
(970, '2019-05-26 14:48:20', 'Successfully logged out.', '201603007'),
(971, '2019-05-26 14:51:26', 'Successfully logged in.', '201603007'),
(972, '2019-05-26 14:54:15', 'Successfully logged in.', '201603007'),
(973, '2019-05-26 14:57:09', 'Successfully logged in.', '201603007'),
(974, '2019-05-26 15:29:54', 'Successfully logged out.', '201603007'),
(975, '2019-05-26 15:30:10', 'Successfully logged in.', '201601045'),
(976, '2019-05-26 15:30:23', 'Successfully logged out.', '201601045'),
(977, '2019-05-26 15:43:04', 'Successfully logged in.', '201603007'),
(978, '2019-05-26 15:45:51', 'Successfully logged out.', '201603007'),
(979, '2019-05-26 15:46:07', 'Successfully logged in.', '201603007'),
(980, '2019-05-26 15:47:30', 'Successfully logged out.', '201603007'),
(981, '2019-05-26 15:47:35', 'Successfully logged in.', '201603007'),
(982, '2019-05-26 15:47:40', 'Successfully logged out.', '201603007'),
(983, '2019-05-26 15:47:43', 'Successfully logged in.', '201603007'),
(984, '2019-05-26 15:47:46', 'Successfully logged out.', '201603007'),
(985, '2019-05-26 15:47:53', 'Successfully logged in.', '201601045'),
(986, '2019-05-26 15:47:56', 'Successfully logged out.', '201601045'),
(987, '2019-05-26 15:48:05', 'Successfully logged in.', '201601048'),
(988, '2019-05-26 15:48:11', 'Successfully logged out.', '201601048'),
(989, '2019-05-26 15:53:16', 'Successfully logged in.', '201601045'),
(990, '2019-05-26 15:53:46', 'Successfully logged out.', '201601045'),
(991, '2019-05-26 15:53:57', 'Successfully logged in.', '201603007'),
(992, '2019-05-26 15:54:07', 'Successfully logged out.', '201603007'),
(993, '2019-05-26 15:54:21', 'Successfully logged in.', '201903009'),
(994, '2019-05-26 16:04:09', 'Successfully logged in.', '201601045'),
(995, '2019-05-26 16:04:16', 'Successfully logged out.', '201601045'),
(996, '2019-05-26 16:04:22', 'Successfully logged in.', '201601048'),
(997, '2019-05-26 16:05:02', 'Successfully logged out.', '201601048'),
(998, '2019-05-26 16:05:32', 'Successfully logged in.', '201903009'),
(999, '2019-05-26 16:08:35', 'Successfully logged in.', '201601048'),
(1000, '2019-05-26 16:11:32', 'Successfully logged out.', '201601048'),
(1001, '2019-05-26 16:11:42', 'Successfully logged in.', '201601045'),
(1002, '2019-05-26 16:11:48', 'Successfully logged out.', '201601045'),
(1003, '2019-05-26 16:12:06', 'Successfully logged in.', '201903009'),
(1004, '2019-05-26 16:16:55', 'Successfully logged in.', '201903009'),
(1005, '2019-05-26 16:17:31', 'Successfully logged in.', '1236498'),
(1006, '2019-05-26 16:17:37', 'Successfully logged out.', '1236498'),
(1007, '2019-05-26 16:18:33', 'Successfully logged in.', '201603007'),
(1008, '2019-05-26 16:19:48', 'Successfully logged out.', '201603007'),
(1009, '2019-05-26 16:20:22', 'Successfully logged in.', '201603007'),
(1010, '2019-05-26 16:20:38', 'Successfully logged out.', '201603007'),
(1011, '2019-05-26 16:20:46', 'Successfully logged in.', '201903009'),
(1012, '2019-05-26 16:25:40', 'Successfully logged in.', '201603007'),
(1013, '2019-05-26 16:25:45', 'Successfully logged out.', '201603007'),
(1014, '2019-05-26 22:20:28', 'Successfully logged in.', '201603007'),
(1015, '2019-05-26 22:20:45', 'Successfully logged out.', '201603007'),
(1016, '2019-05-26 22:20:52', 'Successfully logged in.', '201903009'),
(1017, '2019-05-26 22:21:39', 'Successfully logged in.', '201601048'),
(1018, '2019-05-26 22:23:50', 'Successfully logged out.', '201601048'),
(1019, '2019-05-26 22:25:47', 'Successfully logged in.', '201601045'),
(1020, '2019-05-26 22:25:59', 'Successfully logged out.', '201601045'),
(1021, '2019-05-26 22:28:13', 'Successfully logged in.', '201601048'),
(1022, '2019-05-26 22:30:11', 'Stock of medicine adjusted.', '201601048'),
(1023, '2019-05-26 22:32:48', 'Successfully logged in.', '201903009'),
(1024, '2019-05-26 22:36:40', 'Successfully logged in.', '201903009'),
(1025, '2019-05-26 22:38:18', 'Successfully logged in.', '201903009'),
(1026, '2019-05-26 22:42:57', 'Successfully logged in.', '201903009'),
(1027, '2019-05-26 22:46:52', 'Successfully logged in.', '201903009'),
(1028, '2019-05-26 23:06:43', 'Successfully logged in.', '201903009'),
(1029, '2019-05-26 23:10:54', 'Successfully logged in.', '201903009'),
(1030, '2019-05-26 23:11:26', 'Successfully logged in.', '201603007'),
(1031, '2019-05-26 23:13:49', 'Successfully logged out.', '201603007'),
(1032, '2019-05-26 23:14:05', 'Successfully logged in.', '1236498'),
(1033, '2019-05-26 23:14:18', 'Successfully logged out.', '1236498'),
(1034, '2019-05-26 23:15:03', 'Successfully logged in.', '201601048'),
(1035, '2019-05-26 23:15:11', 'Successfully logged out.', '201601048'),
(1036, '2019-05-26 23:15:19', 'Successfully logged in.', '201601048'),
(1037, '2019-05-26 23:15:40', 'Successfully logged in.', '201601048'),
(1038, '2019-05-26 23:16:17', 'Successfully logged out.', '201601048'),
(1039, '2019-05-26 23:17:42', 'Successfully logged in.', '201903009'),
(1040, '2019-05-26 23:20:44', 'Successfully logged in.', '201903009'),
(1041, '2019-05-26 23:22:03', 'Successfully logged in.', '201903009'),
(1042, '2019-05-26 23:25:23', 'Successfully logged in.', '201903009'),
(1043, '2019-05-26 23:38:29', 'Successfully logged in.', '201903009'),
(1044, '2019-05-26 23:38:39', 'Successfully logged out.', '201903009'),
(1045, '2019-05-26 23:38:45', 'Successfully logged in.', '201603007'),
(1046, '2019-05-26 23:41:58', 'Successfully logged out.', '201603007'),
(1047, '2019-05-26 23:57:02', 'Successfully logged in.', '201903009'),
(1048, '2019-05-26 23:57:09', 'Successfully logged out.', '201903009'),
(1049, '2019-05-26 23:57:14', 'Successfully logged in.', '201603007'),
(1050, '2019-05-26 23:57:35', 'Successfully logged out.', '201603007'),
(1051, '2019-05-26 23:58:16', 'Successfully logged in.', '1236498'),
(1052, '2019-05-26 23:59:21', 'Successfully logged out.', '1236498'),
(1053, '2019-05-26 23:59:25', 'Successfully logged in.', '201603007'),
(1054, '2019-05-26 23:59:44', 'Successfully logged out.', '201603007'),
(1055, '2019-05-26 23:59:52', 'Successfully logged in.', '201903009'),
(1056, '2019-05-27 00:00:25', 'Successfully logged out.', '201903009'),
(1057, '2019-05-27 00:00:30', 'Successfully logged in.', '201603007'),
(1058, '2019-05-27 00:02:37', 'Successfully logged out.', '201603007'),
(1059, '2019-05-27 00:02:49', 'Successfully logged in.', '1236498'),
(1060, '2019-05-27 00:03:30', 'Successfully logged out.', '1236498'),
(1061, '2019-05-27 00:03:35', 'Successfully logged in.', '201603007'),
(1062, '2019-05-27 00:05:39', 'Successfully logged out.', '201603007'),
(1063, '2019-05-27 00:05:53', 'Successfully logged in.', '201601045'),
(1064, '2019-05-27 00:05:59', 'Successfully logged out.', '201601045'),
(1065, '2019-05-27 00:06:10', 'Successfully logged in.', '201601048'),
(1066, '2019-05-27 00:07:16', 'Successfully logged out.', '201601048'),
(1067, '2019-05-27 00:07:38', 'Successfully logged in.', '1236498'),
(1068, '2019-05-27 00:08:04', 'Successfully logged out.', '1236498'),
(1069, '2019-05-27 00:08:14', 'Successfully logged in.', '201903009'),
(1070, '2019-05-27 00:08:37', 'Successfully logged out.', '201903009'),
(1071, '2019-05-27 00:08:43', 'Successfully logged in.', '201601048'),
(1072, '2019-05-27 00:11:11', 'Successfully logged out.', '201601048'),
(1073, '2019-05-27 00:12:02', 'Successfully logged in.', '1236498'),
(1074, '2019-05-27 00:25:15', 'Successfully logged out.', '1236498'),
(1075, '2019-05-27 00:51:18', 'Successfully reset a password', '201603007'),
(1076, '2019-05-27 00:52:25', 'Successfully logged in.', '201903009'),
(1077, '2019-05-27 00:53:21', 'Successfully logged out.', '201903009'),
(1078, '2019-05-27 00:53:28', 'Successfully logged in.', '201601048'),
(1079, '2019-05-27 00:56:08', 'Successfully logged out.', '201601048'),
(1080, '2019-05-27 00:56:24', 'Successfully reset a password', '201603007'),
(1081, '2019-05-27 00:57:18', 'Successfully logged in.', '201601048'),
(1082, '2019-05-27 00:59:22', 'Successfully logged out.', '201601048'),
(1083, '2019-05-27 01:01:29', 'Successfully logged in.', '201601048'),
(1084, '2019-05-27 01:03:07', 'Successfully logged out.', '201601048'),
(1085, '2019-05-27 01:08:42', 'Successfully logged in.', '201603007'),
(1086, '2019-05-27 01:10:21', 'Successfully logged in.', '201603007'),
(1087, '2019-05-27 01:11:11', 'Successfully logged out.', '201603007'),
(1088, '2019-05-27 01:11:21', 'Successfully logged in.', '201601048'),
(1089, '2019-05-27 01:12:27', 'Successfully logged out.', '201601048'),
(1090, '2019-05-27 01:12:35', 'Successfully logged in.', '201601048'),
(1091, '2019-05-27 01:13:34', 'Successfully logged out.', '201601048'),
(1092, '2019-05-27 01:15:29', 'Successfully reset a password', '201603007'),
(1093, '2019-05-27 01:17:25', 'Successfully reset a password', '201603007'),
(1094, '2019-05-27 01:19:20', 'Successfully reset a password', '201603007'),
(1095, '2019-05-27 01:19:39', 'Successfully reset a password', '201603007'),
(1096, '2019-05-27 01:21:00', 'Successfully reset a password', '201603007'),
(1097, '2019-05-27 01:21:51', 'Successfully reset a password', '201603007'),
(1098, '2019-05-27 01:22:43', 'Successfully reset a password', '201603007'),
(1099, '2019-05-27 01:30:09', 'Successfully reset a password', '201603007'),
(1100, '2019-05-27 01:31:01', 'Successfully reset a password', '201603007'),
(1101, '2019-05-27 01:32:23', 'Successfully reset a password', '201603007'),
(1102, '2019-05-27 01:33:32', 'Successfully reset a password', '201603007'),
(1103, '2019-05-27 01:34:49', 'Successfully reset a password', '201603007'),
(1104, '2019-05-27 01:38:57', 'Successfully reset a password', '201603007'),
(1105, '2019-05-27 01:54:43', 'Successfully reset a password', '201603007'),
(1106, '2019-05-27 01:56:18', 'Successfully reset a password', '201603007'),
(1107, '2019-05-27 01:58:13', 'Successfully reset a password', '201603007'),
(1108, '2019-05-27 01:59:01', 'Successfully reset a password', '201603007'),
(1109, '2019-05-27 01:59:41', 'Successfully reset a password', '201603007'),
(1110, '2019-05-27 02:00:37', 'Successfully reset a password', '201603007'),
(1111, '2019-05-27 02:03:22', 'Successfully reset a password', '201603007'),
(1112, '2019-05-27 02:04:35', 'Successfully reset a password', '201603007'),
(1113, '2019-05-27 02:07:17', 'Successfully reset a password', '201603007'),
(1114, '2019-05-27 02:07:43', 'Successfully reset a password', '201603007'),
(1115, '2019-05-27 02:08:21', 'Successfully reset a password', '201603007'),
(1116, '2019-05-27 02:09:34', 'Successfully reset a password', '201603007'),
(1117, '2019-05-27 02:10:44', 'Successfully reset a password', '201603007'),
(1118, '2019-05-27 02:11:33', 'Successfully reset a password', '201603007'),
(1119, '2019-05-27 02:11:38', 'Successfully reset a password', '201603007'),
(1120, '2019-05-27 02:17:04', 'Successfully logged in.', '201603007'),
(1121, '2019-05-27 02:37:07', 'Successfully logged out.', '201603007'),
(1122, '2019-05-27 02:37:22', 'Successfully reset a password', '201603007'),
(1123, '2019-05-27 02:40:06', 'Successfully reset a password', '201603007'),
(1124, '2019-05-27 02:41:46', 'Successfully reset a password', '201603007'),
(1125, '2019-05-27 02:43:04', 'Successfully reset a password', '201603007'),
(1126, '2019-05-27 02:44:05', 'Successfully logged in.', '201603007'),
(1127, '2019-05-27 02:44:24', 'Successfully logged out.', '201603007'),
(1128, '2019-05-27 02:45:21', 'Successfully reset a password', '201603007'),
(1129, '2019-05-27 02:45:52', 'Successfully reset a password', '201603007'),
(1130, '2019-05-27 02:46:23', 'Successfully reset a password', '201603007'),
(1131, '2019-05-27 02:48:39', 'Successfully reset a password', '201603007'),
(1132, '2019-05-27 02:49:15', 'Successfully reset a password', '201603007'),
(1133, '2019-05-27 02:50:05', 'Successfully reset a password', '201603007'),
(1134, '2019-05-27 02:52:58', 'Successfully reset a password', '201603007'),
(1135, '2019-05-27 02:54:40', 'Successfully logged in.', '201601048'),
(1136, '2019-05-27 02:55:05', 'Successfully logged out.', '201601048'),
(1137, '2019-05-27 02:55:14', 'Successfully logged in.', '1236498'),
(1138, '2019-05-27 02:57:41', 'Successfully logged out.', '1236498'),
(1139, '2019-05-27 03:12:19', 'Successfully logged in.', '1236498'),
(1140, '2019-05-27 03:20:58', 'Successfully logged in.', '201603007'),
(1141, '2019-05-27 03:21:38', 'Successfully logged out.', '201603007'),
(1142, '2019-05-27 03:21:50', 'Successfully logged in.', '1236498'),
(1143, '2019-05-27 03:23:20', 'Successfully logged out.', '1236498'),
(1144, '2019-05-27 03:23:56', 'Successfully logged in.', '201603007'),
(1145, '2019-05-27 03:24:01', 'Successfully logged out.', '201603007'),
(1146, '2019-05-27 03:24:08', 'Successfully logged in.', '201601048'),
(1147, '2019-05-27 03:26:49', 'Successfully logged out.', '201601048'),
(1148, '2019-05-27 03:26:57', 'Successfully logged in.', '1236498'),
(1149, '2019-05-27 03:27:38', 'Successfully logged out.', '1236498'),
(1150, '2019-05-27 03:27:44', 'Successfully logged in.', '201601048'),
(1151, '2019-05-27 03:27:47', 'Successfully logged out.', '201601048'),
(1152, '2019-05-27 03:28:00', 'Successfully logged in.', '201903009'),
(1153, '2019-05-27 03:28:04', 'Successfully logged out.', '201903009'),
(1154, '2019-05-27 03:30:44', 'Successfully logged in.', '201603007'),
(1155, '2019-05-27 03:30:47', 'Successfully logged out.', '201603007'),
(1156, '2019-05-27 03:31:24', 'Successfully logged in.', '201903009'),
(1157, '2019-05-27 03:32:30', 'Successfully logged out.', '201903009'),
(1158, '2019-05-27 03:32:58', 'Successfully logged in.', '201903009'),
(1159, '2019-05-27 03:33:20', 'Successfully logged out.', '201903009'),
(1160, '2019-05-27 03:33:25', 'Successfully logged in.', '201603007'),
(1161, '2019-05-27 03:35:13', 'Successfully logged in.', '201603007'),
(1162, '2019-05-27 03:35:17', 'Successfully logged out.', '201603007'),
(1163, '2019-05-27 03:35:24', 'Successfully logged in.', '201601048'),
(1164, '2019-05-27 03:35:30', 'Successfully logged out.', '201601048'),
(1165, '2019-05-27 03:35:36', 'Successfully logged in.', '201903009'),
(1166, '2019-05-27 03:35:58', 'Successfully logged out.', '201903009'),
(1167, '2019-05-27 03:37:52', 'Successfully logged in.', '1236498'),
(1168, '2019-05-27 03:38:06', 'Successfully logged out.', '1236498'),
(1169, '2019-05-27 04:26:38', 'Successfully logged in.', '201603007'),
(1170, '2019-05-27 04:26:44', 'Successfully logged out.', '201603007'),
(1171, '2019-05-27 04:27:00', 'Successfully logged in.', '201903009'),
(1172, '2019-05-27 04:27:04', 'Successfully logged out.', '201903009'),
(1173, '2019-05-27 04:27:43', 'Successfully logged in.', '1236498'),
(1174, '2019-05-27 04:27:58', 'Successfully logged out.', '1236498'),
(1175, '2019-05-27 04:28:12', 'Successfully logged in.', '201603007'),
(1176, '2019-05-27 04:28:38', 'Successfully logged out.', '201603007'),
(1177, '2019-05-27 04:28:44', 'Successfully logged in.', '201601048'),
(1178, '2019-05-27 04:29:16', 'Successfully logged out.', '201601048'),
(1179, '2019-05-27 04:29:23', 'Successfully logged in.', '201903009'),
(1180, '2019-05-27 04:29:50', 'Successfully logged out.', '201903009'),
(1181, '2019-05-27 04:30:04', 'Successfully logged in.', '1236498'),
(1182, '2019-05-27 04:31:10', 'Successfully logged out.', '1236498'),
(1183, '2019-05-27 04:32:22', 'Successfully logged in.', '201903009'),
(1184, '2019-05-27 04:33:57', 'Successfully logged in.', '201903009'),
(1185, '2019-05-27 04:35:06', 'Successfully logged in.', '201601048'),
(1186, '2019-05-27 04:35:11', 'Successfully logged out.', '201601048'),
(1187, '2019-05-27 04:35:16', 'Successfully logged in.', '201903009'),
(1188, '2019-05-27 04:37:01', 'Successfully logged out.', '201903009'),
(1189, '2019-05-27 04:37:54', 'Successfully logged in.', '201903009'),
(1190, '2019-05-27 04:39:17', 'Successfully logged in.', '201903009'),
(1191, '2019-05-27 04:39:48', 'Successfully logged in.', '201903009'),
(1192, '2019-05-27 04:43:17', 'Successfully logged out.', '201903009'),
(1193, '2019-05-27 04:43:31', 'Successfully logged in.', '201903009'),
(1194, '2019-05-27 04:43:54', 'Successfully logged out.', '201903009'),
(1195, '2019-05-27 04:44:06', 'Successfully logged in.', '201603007'),
(1196, '2019-05-27 04:44:24', 'Successfully logged out.', '201603007'),
(1197, '2019-05-27 04:44:35', 'Successfully logged in.', '1236498'),
(1198, '2019-05-27 04:44:45', 'Successfully logged out.', '1236498'),
(1199, '2019-05-27 05:10:10', 'Successfully logged in.', '201603007'),
(1200, '2019-05-27 05:12:28', 'Successfully logged in.', '201603007'),
(1201, '2019-05-27 05:12:58', 'Successfully logged out.', '201603007'),
(1202, '2019-05-27 05:13:03', 'Successfully logged in.', '201603007'),
(1203, '2019-05-27 05:14:15', 'Changed status of user.', '201603007'),
(1204, '2019-05-27 05:15:07', 'Successfully logged out.', '201603007'),
(1205, '2019-05-27 05:15:17', 'Successfully logged in.', '201903009'),
(1206, '2019-05-27 05:15:31', 'Changed status of user.', '201903009'),
(1207, '2019-05-27 05:15:37', 'Changed status of user.', '201903009'),
(1208, '2019-05-27 05:15:42', 'Changed status of user.', '201903009'),
(1209, '2019-05-27 05:17:04', 'Created new patient profile.', '201903009'),
(1210, '2019-05-27 05:20:09', 'Successfully logged out.', '201903009'),
(1211, '2019-05-27 05:20:16', 'Successfully logged in.', '201601048'),
(1212, '2019-05-27 05:21:21', 'Successfully logged out.', '201601048'),
(1213, '2019-05-27 05:21:40', 'Successfully logged in.', '201903009'),
(1214, '2019-05-27 05:25:52', 'Successfully logged out.', '201903009'),
(1215, '2019-05-27 05:25:58', 'Successfully logged in.', '201603007'),
(1216, '2019-05-27 05:26:25', 'Successfully logged out.', '201603007'),
(1217, '2019-05-27 06:01:19', 'Successfully logged in.', '201903009'),
(1218, '2019-05-27 07:02:22', 'Successfully logged out.', '201903009'),
(1219, '2019-05-27 07:02:31', 'Successfully logged in.', '1236498'),
(1220, '2019-05-27 07:03:27', 'Changed status of user.', '1236498'),
(1221, '2019-05-27 07:03:37', 'Changed status of user.', '1236498'),
(1222, '2019-05-27 07:03:47', 'Changed status of user.', '1236498'),
(1223, '2019-05-27 07:03:58', 'Changed status of user.', '1236498'),
(1224, '2019-05-27 07:04:03', 'Changed status of user.', '1236498'),
(1225, '2019-05-27 07:04:11', 'Changed status of user.', '1236498'),
(1226, '2019-05-27 07:05:37', 'Created a new user.', '1236498'),
(1227, '2019-05-27 07:06:01', 'Changed status of user.', '1236498'),
(1228, '2019-05-27 07:06:44', 'Changed password.', '1236498'),
(1229, '2019-05-27 07:06:51', 'Successfully logged out.', '1236498'),
(1230, '2019-05-27 07:10:05', 'Created a new user.', '9586321'),
(1231, '2019-05-27 07:10:22', 'Successfully logged in.', '9586321'),
(1232, '2019-05-27 07:10:27', 'Successfully logged out.', '9586321'),
(1233, '2019-05-27 07:10:41', 'Successfully logged in.', '9586321'),
(1234, '2019-05-27 07:11:05', 'Changed status of user.', '9586321'),
(1235, '2019-05-27 07:14:24', 'Changed status of user.', '9586321'),
(1236, '2019-05-27 07:15:21', 'Changed status of user.', '9586321'),
(1237, '2019-05-27 07:47:03', 'Successfully logged out.', '9586321'),
(1238, '2019-05-27 07:47:12', 'Successfully logged in.', '201603007'),
(1239, '2019-05-27 07:58:39', 'Successfully logged out.', '201603007'),
(1240, '2019-05-27 07:59:07', 'Successfully logged in.', '9586321'),
(1241, '2019-05-27 07:59:20', 'Changed status of user.', '9586321'),
(1242, '2019-05-27 08:16:01', 'Changed status of user.', '9586321'),
(1243, '2019-05-27 08:17:00', 'Successfully logged out.', '9586321'),
(1244, '2019-05-27 08:19:04', 'Successfully logged in.', '987846544'),
(1245, '2019-05-27 08:19:14', 'Successfully logged out.', '987846544'),
(1246, '2019-05-27 08:20:00', 'Successfully logged in.', '9586321'),
(1247, '2019-05-27 08:21:35', 'Successfully logged out.', '9586321'),
(1248, '2019-05-27 08:21:48', 'Successfully logged in.', '9586321'),
(1249, '2019-05-27 08:22:34', 'Created a new user.', '9586321'),
(1250, '2019-05-27 08:22:55', 'Changed status of user.', '9586321'),
(1251, '2019-05-29 00:09:44', 'Created a new user.', '9999999'),
(1252, '2019-05-29 00:10:07', 'Successfully logged in.', '9999999'),
(1253, '2019-05-29 00:10:15', 'Changed status of user.', '9999999'),
(1254, '2019-05-29 00:10:23', 'Changed status of user.', '9999999'),
(1255, '2019-05-29 00:10:30', 'Changed status of user.', '9999999'),
(1256, '2019-05-29 00:10:41', 'Changed status of user.', '9999999'),
(1257, '2019-05-29 00:10:55', 'Changed status of user.', '9999999'),
(1258, '2019-05-29 00:11:01', 'Successfully logged out.', '9999999'),
(1259, '2019-05-29 00:12:39', 'Created a new user.', '999999'),
(1260, '2019-05-29 00:13:32', 'Successfully logged in.', '999999'),
(1261, '2019-05-29 00:13:39', 'Changed status of user.', '999999'),
(1262, '2019-05-29 00:13:51', 'Changed status of user.', '999999'),
(1263, '2019-05-29 00:14:09', 'Successfully logged out.', '999999'),
(1264, '2019-05-29 00:17:24', 'Created a new user.', '212121'),
(1265, '2019-05-29 00:19:41', 'Created a new user.', '121212'),
(1266, '2019-05-29 00:22:35', 'Successfully logged in.', '201603007'),
(1267, '2019-05-29 00:23:38', 'Successfully logged out.', '201603007'),
(1268, '2019-05-29 00:23:43', 'Successfully logged in.', '201601048'),
(1269, '2019-05-29 00:29:51', 'Successfully logged out.', '201601048'),
(1270, '2019-05-29 00:30:15', 'Successfully logged in.', '201603007'),
(1271, '2019-05-29 00:31:31', 'Created patient visit', '201601048'),
(1272, '2019-05-29 00:33:06', 'Successfully logged out.', '201601048'),
(1273, '2019-05-29 08:49:11', 'Successfully reset a password', '201603007'),
(1274, '2019-05-29 09:01:36', 'Successfully logged in.', '201603007'),
(1275, '2019-05-29 09:01:52', 'Changed status of user.', '201603007'),
(1276, '2019-05-29 09:01:58', 'Successfully logged out.', '201603007'),
(1277, '2019-05-29 09:02:08', 'Successfully logged in.', '121212'),
(1278, '2019-05-29 09:02:15', 'Changed status of user.', '121212'),
(1279, '2019-05-29 09:02:21', 'Changed status of user.', '121212'),
(1280, '2019-05-29 09:02:27', 'Changed status of user.', '121212'),
(1281, '2019-05-29 09:02:37', 'Changed status of user.', '121212'),
(1282, '2019-05-29 09:02:44', 'Changed status of user.', '121212'),
(1283, '2019-05-29 09:02:56', 'Successfully logged out.', '121212'),
(1284, '2019-05-29 09:03:04', 'Successfully logged in.', '201601048'),
(1285, '2019-05-29 09:03:32', 'Changed password.', '201601048'),
(1286, '2019-05-29 09:03:49', 'Changed password.', '201601048'),
(1287, '2019-05-29 09:03:56', 'Successfully logged out.', '201601048'),
(1288, '2019-05-29 09:04:03', 'Successfully logged in.', '201601045'),
(1289, '2019-05-29 09:04:26', 'Changed status of user.', '201601045'),
(1290, '2019-05-29 09:04:46', 'Successfully logged out.', '201601045'),
(1291, '2019-05-29 09:04:55', 'Successfully logged in.', '201903009'),
(1292, '2019-05-29 09:05:07', 'Changed status of user.', '201903009'),
(1293, '2019-05-29 09:05:23', 'Changed status of user.', '201903009'),
(1294, '2019-05-29 09:05:30', 'Successfully logged out.', '201903009'),
(1295, '2019-05-29 09:05:58', 'Successfully logged in.', '201603007'),
(1296, '2019-05-29 09:08:24', 'Successfully logged in.', '201603007'),
(1297, '2019-05-29 09:08:36', 'Changed status of user.', '201603007'),
(1298, '2019-05-29 09:11:15', 'Successfully logged in.', '201603007'),
(1299, '2019-05-29 09:11:25', 'Changed status of user.', '201603007'),
(1300, '2019-05-29 09:15:37', 'Successfully logged in.', '201603007'),
(1301, '2019-05-29 09:15:48', 'Changed status of user.', '201603007'),
(1302, '2019-05-29 09:16:45', 'Successfully logged in.', '201603007'),
(1303, '2019-05-29 09:16:54', 'Changed status of user.', '201603007'),
(1304, '2019-05-29 09:22:33', 'Successfully logged in.', '201603007'),
(1305, '2019-05-29 09:22:43', 'Changed status of user.', '201603007'),
(1306, '2019-05-29 09:22:57', 'Changed status of user.', '201603007'),
(1307, '2019-05-29 09:24:03', 'Successfully logged in.', '201603007'),
(1308, '2019-05-29 09:24:10', 'Changed status of user.', '201603007'),
(1309, '2019-05-29 09:25:22', 'Successfully logged in.', '201603007'),
(1310, '2019-05-29 09:25:31', 'Changed status of user.', '201603007'),
(1311, '2019-05-29 10:20:36', 'Successfully logged in.', '201603007'),
(1312, '2019-05-29 10:30:01', 'Successfully logged in.', '201603007'),
(1313, '2019-05-29 10:30:08', 'Changed status of user.', '201603007'),
(1314, '2019-05-29 10:33:57', 'Changed status of user.', '201603007'),
(1315, '2019-05-29 10:34:03', 'Changed status of user.', '201603007'),
(1316, '2019-05-29 10:34:08', 'Changed status of user.', '201603007'),
(1317, '2019-05-29 10:34:12', 'Successfully logged out.', '201603007'),
(1318, '2019-05-29 10:34:19', 'Successfully logged in.', '201903009'),
(1319, '2019-05-29 10:34:28', 'Changed status of user.', '201903009'),
(1320, '2019-05-29 10:36:16', 'Successfully logged in.', '201903009'),
(1321, '2019-05-29 10:36:23', 'Changed status of user.', '201903009'),
(1322, '2019-05-29 10:37:50', 'Successfully logged in.', '201603007'),
(1323, '2019-05-29 10:37:58', 'Changed status of user.', '201603007'),
(1324, '2019-05-29 10:38:04', 'Changed status of user.', '201603007'),
(1325, '2019-05-29 10:38:07', 'Successfully logged out.', '201603007'),
(1326, '2019-05-29 10:40:25', 'Successfully logged in.', '201903009'),
(1327, '2019-05-29 10:40:33', 'Changed status of user.', '201903009'),
(1328, '2019-05-29 10:40:37', 'Changed status of user.', '201903009'),
(1329, '2019-05-29 10:40:43', 'Changed status of user.', '201903009'),
(1330, '2019-05-29 10:40:48', 'Changed status of user.', '201903009'),
(1331, '2019-05-29 10:41:14', 'Successfully logged out.', '201903009'),
(1332, '2019-05-29 10:41:21', 'Successfully logged in.', '201603007'),
(1333, '2019-05-29 10:41:35', 'Changed status of user.', '201603007'),
(1334, '2019-05-29 10:41:42', 'Changed status of user.', '201603007'),
(1335, '2019-05-29 10:41:47', 'Successfully logged out.', '201603007'),
(1336, '2019-05-29 10:41:53', 'Successfully logged in.', '121212'),
(1337, '2019-05-29 10:42:53', 'Successfully logged in.', '121212'),
(1338, '2019-05-29 10:42:57', 'Changed status of user.', '121212'),
(1339, '2019-05-29 10:43:04', 'Changed status of user.', '121212'),
(1340, '2019-05-29 10:45:10', 'Successfully logged in.', '121212'),
(1341, '2019-05-29 10:47:57', 'Successfully logged in.', '201603007'),
(1342, '2019-05-29 10:48:06', 'Changed status of user.', '201603007'),
(1343, '2019-05-29 10:48:10', 'Changed status of user.', '201603007'),
(1344, '2019-05-29 10:48:14', 'Successfully logged out.', '201603007'),
(1345, '2019-05-29 10:48:29', 'Successfully logged in.', '201903009'),
(1346, '2019-05-29 10:48:37', 'Changed status of user.', '201903009'),
(1347, '2019-05-29 10:48:44', 'Changed status of user.', '201903009'),
(1348, '2019-05-29 10:48:50', 'Changed status of user.', '201903009'),
(1349, '2019-05-29 10:48:54', 'Changed status of user.', '201903009'),
(1350, '2019-05-29 10:48:59', 'Successfully logged out.', '201903009'),
(1351, '2019-05-29 10:49:33', 'Successfully logged in.', '121212'),
(1352, '2019-05-29 10:49:37', 'Changed status of user.', '121212'),
(1353, '2019-05-29 10:49:42', 'Changed status of user.', '121212'),
(1354, '2019-05-29 10:51:10', 'Successfully logged out.', '121212'),
(1355, '2019-05-29 10:52:24', 'Successfully logged in.', '201903009'),
(1356, '2019-05-29 10:52:30', 'Successfully logged out.', '201903009'),
(1357, '2019-05-29 10:52:37', 'Successfully logged in.', '121212'),
(1358, '2019-05-29 10:52:41', 'Changed status of user.', '121212'),
(1359, '2019-05-29 10:52:46', 'Changed status of user.', '121212'),
(1360, '2019-05-29 10:52:49', 'Successfully logged out.', '121212'),
(1361, '2019-05-29 10:55:11', 'Successfully logged in.', '201903009'),
(1362, '2019-05-29 10:55:21', 'Changed status of user.', '201903009'),
(1363, '2019-05-29 10:55:27', 'Changed status of user.', '201903009'),
(1364, '2019-05-29 10:55:33', 'Changed status of user.', '201903009'),
(1365, '2019-05-29 10:55:46', 'Changed status of user.', '201903009'),
(1366, '2019-05-29 10:56:06', 'Successfully logged out.', '201903009'),
(1367, '2019-05-29 10:56:16', 'Successfully logged in.', '121212'),
(1368, '2019-05-29 10:56:22', 'Changed status of user.', '121212'),
(1369, '2019-05-29 10:56:26', 'Changed status of user.', '121212'),
(1370, '2019-05-29 10:56:31', 'Changed status of user.', '121212'),
(1371, '2019-05-29 10:56:36', 'Changed status of user.', '121212'),
(1372, '2019-05-29 10:56:56', 'Successfully logged out.', '121212'),
(1373, '2019-05-29 13:19:53', 'Successfully logged in.', '201903009'),
(1374, '2019-05-29 13:20:18', 'Created course.', '201903009'),
(1375, '2019-05-29 13:20:54', 'Created patient visit', '201903009'),
(1376, '2019-05-29 13:25:56', 'Successfully logged out.', '201903009'),
(1377, '2019-05-29 13:26:15', 'Successfully logged in.', '201601048'),
(1378, '2019-05-29 13:26:45', 'Successfully logged out.', '201601048'),
(1379, '2019-05-29 13:26:50', 'Successfully logged in.', '201903009'),
(1380, '2019-05-29 13:29:12', 'Successfully logged out.', '201903009'),
(1381, '2019-05-29 13:29:31', 'Successfully logged in.', '201601048'),
(1382, '2019-05-29 13:32:22', 'Created medicine.', '201601048'),
(1383, '2019-05-29 13:33:24', 'Successfully logged out.', '201601048'),
(1384, '2019-05-29 13:33:32', 'Successfully logged in.', '121212'),
(1385, '2019-05-29 13:33:56', 'Changed status of user.', '121212'),
(1386, '2019-05-29 13:34:00', 'Changed status of user.', '121212'),
(1387, '2019-05-29 13:34:03', 'Successfully logged out.', '121212'),
(1388, '2019-05-29 13:35:33', 'Successfully logged in.', '201603007'),
(1389, '2019-05-29 13:35:45', 'Changed status of user.', '201603007'),
(1390, '2019-05-29 13:35:51', 'Changed status of user.', '201603007'),
(1391, '2019-05-29 13:35:55', 'Changed status of user.', '201603007'),
(1392, '2019-05-29 13:36:00', 'Changed status of user.', '201603007'),
(1393, '2019-05-29 13:38:59', 'Successfully logged out.', '201603007'),
(1394, '2019-05-29 23:39:08', 'Created a new user.', '888888888'),
(1395, '2019-05-29 23:39:18', 'Successfully logged in.', '888888888'),
(1396, '2019-05-29 23:39:27', 'Changed status of user.', '888888888'),
(1397, '2019-05-29 23:39:36', 'Changed status of user.', '888888888'),
(1398, '2019-05-29 23:39:40', 'Successfully logged out.', '888888888'),
(1399, '2019-05-30 13:14:25', 'Successfully logged in.', '201603007'),
(1400, '2019-05-30 13:15:19', 'Successfully logged out.', '201603007'),
(1401, '2019-05-31 15:55:35', 'Successfully logged in.', '201603007'),
(1402, '2019-05-31 15:56:12', 'Successfully logged out.', '201603007');

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
(1, 'Biogesic', 'Paracetamol', 'Capsule', 3, 0, 0, 50, 20, 'mg', 500, 172, 400, 1, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(2, 'Immodium', 'Loperamide', 'Capsule', 3, 0, 0, 30, 20, 'mg', 10, 83, 650, 1, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(3, 'Advil', 'Ibuprofen', 'Capsule', 3, 0, 0, 70, 50, 'mg', 500, 173, 287, 5, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(4, 'Buscopan', 'Hyoscine-N-butylbromide', 'Tablet', 0, 0, 0, 30, 20, 'mg', 10, 0, 100, 639, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(5, 'Tempra', 'Paracetamol', 'Tablet', 3, 0, 0, 30, 20, 'mg', 500, 88, 0, 1, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(6, 'Tylenol', 'Paracetamol', 'Tablet', 3, 0, 0, 200, 100, 'mg', 200, 215, 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, '', 'Tissue', '', 2, 1, 0, 200, 100, 'box', 1, 200, 202, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 'Lagnat', 'Good', 'Tablet', 3, 0, 0, 5, 4, 'mg', 90, 430, 0, 430, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(9, 'Biotin', 'Biotin ', 'Capsule', 1, 0, 0, 2000, 1000, 'mg', 100, 400, 0, 400, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(10, 'Vicks', 'Vaporub', 'Ointment', 1, 0, 0, 500, 250, 'g', 1, 97, 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(11, 'Diatabs', 'Loperamide', 'Eye Drop', 2, 0, 0, 200, 100, 'mg', 500, 200, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(12, 'Ceelin', 'Vitamin C', 'Eye Drop', 1, 0, 0, 500, 250, 'mg', 500, 100, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(13, 'Medicol', 'Ibuprofen', 'Capsule', 3, 0, 0, 250, 50, 'mg', 500, 400, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(14, 'Test', 'Test', 'Tablet', 3, 0, 0, 200, 100, 'l', 50, 400, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(15, 'Dolfenal', 'Mefenamic', 'Tablet', 1, 0, 0, 30, 5, 'mg', 500, 5, 0, 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(19, 'Dox', 'Anti', 'Tablet', 3, 0, 0, 50, 25, 'mg', 10, 200, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(21, '', 'Polo', '', 3, 1, 0, 100, 50, 'piece', 2, 200, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(22, '', 'Ralph', '', 3, 1, 0, 50, 25, 'piece', 2, 100, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(23, '', 'Aid Band', '', 3, 1, 0, 54, 28, 'piece', 2, 100, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(24, '', 'Pads', '', 3, 1, 0, 175, 75, 'piece', 2, 250, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(25, '', 'Nyork', '', 3, 1, 0, 100, 50, 'piece', 11, 200, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

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
(1, 'CqiK4DyS', '201601048', '2019-05-09 16:27:59', 0),
(2, 'Jy4SR8Tr', '201601048', '2019-05-09 17:15:07', 0),
(3, 'I4mTjnmX', '201603007', '2019-05-15 06:34:02', 1),
(4, 'I3YNTuyS', '201603007', '2019-05-15 06:36:06', 0),
(5, 'cU2Tejob', '201603007', '2019-05-15 07:17:32', 1),
(6, 'yZmzWka8', '201603007', '2019-05-20 06:36:23', 0),
(7, '5H3D1EAh', '201603985665', '2019-05-20 08:34:40', 0),
(8, 'p0XoHWHk', '201603007', '2019-05-24 16:29:33', 0),
(9, 'snjjqbsm', '201603007', '2019-05-24 16:36:19', 1),
(10, 'bJPNBSnd', '201603007', '2019-05-24 16:56:56', 0),
(11, 'KdncqP1c', '201603007', '2019-05-24 18:11:41', 1),
(12, 'e5LoZxgl', '201603007', '2019-05-26 00:12:56', 0),
(13, 'jSrFo6ZW', '201903009', '2019-05-26 00:19:56', 0),
(14, 'z63WTNBm', '201603007', '2019-05-27 08:51:14', 0),
(15, 'dihDeXXT', '201603007', '2019-05-27 08:56:21', 0),
(16, '8rKTAm4o', '201603007', '2019-05-27 09:15:26', 0),
(17, 'WE7NhM89', '201603007', '2019-05-27 09:17:21', 0),
(18, 'h4LnQzKH', '201603007', '2019-05-27 09:19:16', 0),
(19, 'mjWqbrTF', '201603007', '2019-05-27 09:19:33', 0),
(20, 'zYt3TX6u', '201603007', '2019-05-27 09:20:53', 0),
(21, 'M5lsSRsd', '201603007', '2019-05-27 09:21:48', 0),
(22, 'EgxQJNuu', '201603007', '2019-05-27 09:22:36', 0),
(23, 'eJiA6AQK', '201603007', '2019-05-27 09:30:06', 0),
(24, 'YdxEUEbs', '201603007', '2019-05-27 09:30:58', 0),
(25, 'yKtTncon', '201603007', '2019-05-27 09:32:19', 0),
(26, 'kxlDZjey', '201603007', '2019-05-27 09:33:28', 0),
(27, 'yM5qyUdG', '201603007', '2019-05-27 09:34:45', 0),
(28, 'WPpdQiqW', '201603007', '2019-05-27 09:38:53', 0),
(29, '1JmOJb6U', '201603007', '2019-05-27 09:54:40', 0),
(30, '72JZptGO', '201603007', '2019-05-27 09:56:12', 0),
(31, 'gCbH4wug', '201603007', '2019-05-27 09:58:09', 0),
(32, 'SMkbFwHc', '201603007', '2019-05-27 09:58:55', 0),
(33, 'LZqzLzM8', '201603007', '2019-05-27 09:59:35', 0),
(34, 'LdmqmK7l', '201603007', '2019-05-27 10:00:33', 0),
(35, 'bxnHhfxZ', '201603007', '2019-05-27 10:03:17', 0),
(36, 'ru3T5XF1', '201603007', '2019-05-27 10:04:20', 0),
(37, 'Q6JoykTA', '201603007', '2019-05-27 10:07:11', 0),
(38, 'M8Mc6IIC', '201603007', '2019-05-27 10:07:40', 0),
(39, 'pbiZ3Iik', '201603007', '2019-05-27 10:08:18', 0),
(40, 'CTWhsO1e', '201603007', '2019-05-27 10:09:31', 0),
(41, 'sONTHYjJ', '201603007', '2019-05-27 10:10:41', 0),
(42, 'etozg20d', '201603007', '2019-05-27 10:11:30', 0),
(43, '9teQGogJ', '201603007', '2019-05-27 10:11:35', 0),
(44, 't6bymATu', '201603007', '2019-05-27 10:37:18', 0),
(45, 'g0zPLue9', '201603007', '2019-05-27 10:40:03', 0),
(46, '2OYIHqqw', '201603007', '2019-05-27 10:41:43', 0),
(47, 'N3c3i0cl', '201603007', '2019-05-27 10:42:59', 0),
(48, 'ZK2n0zJl', '201603007', '2019-05-27 10:45:17', 0),
(49, 'Eo2gL7XX', '201603007', '2019-05-27 10:45:49', 0),
(50, '98xM77m7', '201603007', '2019-05-27 10:46:20', 0),
(51, 'NO01kHle', '201603007', '2019-05-27 10:48:35', 0),
(52, '3TAYC5F1', '201603007', '2019-05-27 10:49:12', 0),
(53, 'pSKymDE1', '201603007', '2019-05-27 10:49:57', 0),
(54, 'dX7FxZux', '201603007', '2019-05-27 10:52:36', 0),
(55, 'mURGHBxz', '987846544', '2019-05-27 15:05:29', 0),
(56, 'ch0APCrf', '5555555', '2019-05-27 16:22:30', 0),
(57, 'nXuEkKT2', '201603007', '2019-05-29 16:49:06', 0);

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
  `contact` varchar(25) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `createdBy` varchar(255) NOT NULL,
  `modifiedBy` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `contactNumber` int(20) NOT NULL,
  `contactPerson` varchar(100) NOT NULL,
  `contactPersonNumber` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `firstName`, `lastName`, `birthDate`, `gender`, `contact`, `isDeleted`, `createdBy`, `modifiedBy`, `dateCreated`, `dateModified`, `contactNumber`, `contactPerson`, `contactPersonNumber`) VALUES
('', 'Marc', 'Deligero', '2018-11-11', 'Male', '1548987', 1, '201603007', '201603007', '2019-05-15 11:19:22', '2019-05-15 21:28:34', 0, '', 0),
('1', 'Patricia ', 'Heart', '0000-00-00', 'Female', '9087654', 0, '201601062', '201601062', '2019-05-14 11:04:32', '2019-05-14 11:04:32', 0, '', 0),
('123abc', 'Paul', 'Cayetano', '1999-11-07', 'Male', '9875643', 1, '201601062', '201601062', '2019-05-14 15:59:52', '2019-05-14 15:59:52', 0, '', 0),
('2', 'Paulo', 'Latrell', '0000-00-00', 'Male', '9875643', 0, '201601062', '201601062', '2019-05-14 11:10:56', '2019-05-14 11:10:56', 0, '', 0),
('201601007', 'Po', 'Rel', '2018-02-11', 'Male', '5465151651', 0, '201903009', '201903009', '2019-05-27 13:17:04', '2019-05-27 13:17:04', 0, '', 0),
('201601045', 'tom', 'sawyer', '1998-12-07', 'Male', '6780954', 0, '201601062', '201601062', '2019-05-14 11:24:06', '2019-05-14 15:16:38', 0, '', 0),
('201601048', 'loren', 'florez', '1996-07-08', 'Female', '8907654', 0, '201601062', '201601048', '2019-05-14 11:01:08', '2019-05-20 19:32:28', 0, '', 0),
('201601061', 'maru', 'ragpala', '1994-06-19', 'Male', '9875643', 0, '201601062', '201601062', '2019-05-14 10:52:16', '2019-05-14 10:52:16', 0, '', 0),
('201601062', 'rachel', 'casis', '1990-11-05', 'Female', '8462786', 0, '201601062', '201603007', '2019-05-14 10:50:33', '2019-05-15 06:39:44', 0, '', 0),
('201603007', 'William', 'Boco', '1999-01-11', 'Male', '09052834596', 0, '201603007', '201603007', '2019-05-17 19:48:14', '2019-05-17 19:48:14', 0, '', 0),
('201901062', 'Arrianne', 'Montenegro', '1998-09-18', 'Female', '9875643', 0, '201601062', '201601062', '2019-05-14 11:02:55', '2019-05-14 11:02:55', 0, '', 0),
('3', 'Christoff', 'Padilla', '0000-00-00', 'Male', '9876543', 0, '201601062', '201601062', '2019-05-14 15:12:35', '2019-05-14 15:12:35', 0, '', 0),
('4', 'Ralph', 'Lauren', '0000-00-00', 'Male', '4878979', 0, '201603007', '201603007', '2019-05-15 11:21:56', '2019-05-15 11:21:56', 0, '', 0),
('5', 'Olivia', 'Boco', '0000-00-00', 'Female', '978464654', 0, '201903009', '201903009', '2019-05-29 21:20:54', '2019-05-29 21:20:54', 0, '', 0);

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
(203, '', 194),
(197, '123', 1),
(198, '123', 3),
(204, '201601007', 1),
(6, '201601061', 1),
(5, '201601061', 2),
(4, '201601061', 4),
(200, '201601062', 190),
(201, '201601062', 191),
(11, '201901062', 6),
(202, '98745522', 3),
(199, 'SHS2569874', 2);

-- --------------------------------------------------------

--
-- Table structure for table `shs`
--

CREATE TABLE `shs` (
  `ID` varchar(255) NOT NULL,
  `trackID` int(11) NOT NULL,
  `trackName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shs`
--

INSERT INTO `shs` (`ID`, `trackID`, `trackName`) VALUES
('123', 3, ''),
('201901062', 3, ''),
('SHS2569874', 2, '');

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
(4, 'Animation', 0),
(5, 'Social Science', 0),
(6, 'wefewfwf', 1);

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
('121212', '0mOarl5Oml+w1jBRfGXLZ9bXl9Bx1C5fEX9XQ8eRBoE=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'c1jRB145QDL4GAwD6rju1w==', '2018-11-11', 1, 'nttljvldo4lvJ/3aXk/tlg==', 'jPm06KABX+Ob6oGL0rqifA==', 'Male', '5184899', '2019-05-29 08:19:33', '2019-05-29 08:19:33', '', ''),
('201601045', 'yJ9R/zSi9nshquuYGdmDMxdNgPdExGjYLPNOjIE4+0Q=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2016-07-14', 1, '8uLjJIxUZfURls/ujYAjuA==', 'Fz7tFuU7RTR4bHltuGrvcw==', 'Female', '123456789', '2019-04-11 21:54:47', '2019-04-11 21:54:47', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201601048', 'uv19Vj9iLs+Npf845EI2rfk2M+A+hpnEf6/FwwMcm6w=', 'zuwBtmygSJNyZDzorYP7/g==', '2019-05-29 17:03:49', 'dVAxclgOA3VifnlTUZW1NQ==', '2017-12-31', 1, '4ExITKp6kadxz/2oqddisQ==', 'TtvN3gr/YWdn/kgaBtLgMA==', 'Female', '09175651824', '2019-04-16 23:37:05', '2019-04-16 23:37:05', '1OUN5Y5ODxGQHipbESWcgg==', '1OUN5Y5ODxGQHipbESWcgg=='),
('201603007', 'yZFiJYAKq5oeC0Iya3rlcSS4UZvN6+wER6zkk96+dkw=', 'OFbuLLpAq8VSPNSoEbTK/A==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2018-11-11', 1, 'p7F9WlIGtlfhdQhfqbEbZw==', 'A1nL8LQRolaV7padrDzI5Q==', 'Male', '2098745131654', '2019-05-24 18:11:41', '2019-05-24 18:11:41', '8uLjJIxUZfURls/ujYAjuA==', '8uLjJIxUZfURls/ujYAjuA=='),
('201903009', 'cCM2jgu3XeRpoChgfGoDN5RDjBrqZOTIMGDe275AuHY=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'oMbIiudaPoFgzl0t4BDrqw==', '2019-02-11', 1, '9esqAnrea1TY2Bme/YnGgw==', 'jPm06KABX+Ob6oGL0rqifA==', 'Male', '1564897987', '2019-05-26 00:19:56', '2019-05-26 00:19:56', 'HYwRwyzFybgEWP2mfKxKtg==', 'HYwRwyzFybgEWP2mfKxKtg=='),
('888888888', 'llgcanLN/jSKmcrTWePgrUBwZ++E9MYrYmvLrIAy+r0=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'c1jRB145QDL4GAwD6rju1w==', '2018-10-30', 1, 'unBoSr79L6vt11+NYzkAjw==', '79E1oogcHoxd/XMf7oG14Q==', 'Male', '154788978', '2019-05-30 07:39:02', '2019-05-30 07:39:02', '', '');

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
  `dateModified` datetime NOT NULL,
  `patientFirstName` varchar(50) NOT NULL,
  `patientLastName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`ID`, `patientID`, `visitDate`, `remarks`, `isDeleted`, `createdBy`, `modifiedBy`, `dateCreated`, `dateModified`, `patientFirstName`, `patientLastName`) VALUES
(1, '1', '2019-05-14 11:03:00', 'test remark for a guest', 0, '201601062', '201601062', '2019-05-14 11:04:32', '2019-05-14 12:06:22', '', ''),
(2, '2', '2019-05-14 11:09:00', 'test remark for male guest', 0, '201601062', '201601062', '2019-05-14 11:10:57', '2019-05-14 12:03:57', '', ''),
(3, '201601062', '2019-05-14 11:57:00', 'test remark for student', 0, '201601062', '201601062', '2019-05-14 11:58:58', '2019-05-14 11:58:58', '', ''),
(4, '201601061', '2019-05-11 11:59:00', 'na', 0, '201601062', '201601062', '2019-05-14 12:00:13', '2019-05-14 12:00:13', '', ''),
(5, '2', '2019-05-06 12:05:00', 'this is for a previous date', 0, '201601062', '201601062', '2019-05-14 12:05:32', '2019-05-14 12:05:32', '', ''),
(6, '201901062', '2019-04-14 12:06:00', 'Earlier date', 0, '201601062', '201601062', '2019-05-14 12:07:04', '2019-05-14 12:07:04', '', ''),
(7, '201601045', '2019-04-14 12:12:00', 'Earlier date #2', 0, '201601062', '201601062', '2019-05-14 12:13:37', '2019-05-14 12:13:37', '', ''),
(8, '201901062', '2019-04-14 12:17:00', 'Old visit', 0, '201601062', '201601062', '2019-05-14 12:18:02', '2019-05-14 12:18:02', '', ''),
(9, '3', '2019-05-14 15:12:00', 'Test', 0, '201601062', '201601062', '2019-05-14 15:12:35', '2019-05-14 15:12:35', '', ''),
(10, '201601048', '2019-05-14 15:24:00', 'test', 0, '201601062', '201601062', '2019-05-14 15:24:47', '2019-05-14 15:24:47', '', ''),
(11, '201601045', '2019-05-14 15:25:00', 'testing', 0, '201601062', '201601062', '2019-05-14 15:25:52', '2019-05-14 15:25:52', '', ''),
(12, '98745522', '2019-05-15 11:19:00', 'test', 0, '201603007', '201603007', '2019-05-15 11:20:24', '2019-05-15 11:20:24', '', ''),
(13, '98745522', '2019-05-15 11:20:00', 'test', 0, '201603007', '201603007', '2019-05-15 11:21:17', '2019-05-15 11:21:17', '', ''),
(14, '4', '2019-05-15 11:21:00', 'test', 0, '201603007', '201603007', '2019-05-15 11:21:56', '2019-05-15 11:21:56', '', ''),
(15, '98745522', '2019-05-15 11:33:00', 'test', 0, '201603007', '201603007', '2019-05-15 11:33:34', '2019-05-15 11:33:34', '', ''),
(16, '201603007', '2019-05-20 19:25:00', 'ahehe', 0, '201601045', '201601045', '2019-05-20 19:25:36', '2019-05-20 19:25:54', '', ''),
(17, '201603007', '2019-05-21 11:07:00', 'test', 0, '201601045', '201601045', '2019-05-21 11:07:43', '2019-05-21 11:07:43', '', ''),
(18, '201603007', '2019-05-21 11:12:00', 'test', 0, '201601045', '201601045', '2019-05-21 11:13:03', '2019-05-21 11:13:03', '', ''),
(19, '201603007', '2019-05-21 20:17:00', 'test', 0, '201601045', '201601045', '2019-05-21 20:18:43', '2019-05-21 20:18:43', '', ''),
(20, '201603007', '2019-05-29 08:31:00', '', 0, '201601048', '201601048', '2019-05-29 08:31:31', '2019-05-29 08:31:31', '', ''),
(21, '5', '2019-05-29 21:20:00', 'test', 0, '201903009', '201903009', '2019-05-29 21:20:54', '2019-05-29 21:20:54', '', '');

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
(8, 3, 1),
(9, 3, 5),
(10, 4, 1),
(11, 4, 4),
(12, 2, 3),
(13, 2, 5),
(14, 2, 4),
(15, 2, 6),
(16, 5, 1),
(17, 1, 3),
(18, 1, 4),
(19, 6, 3),
(20, 7, 3),
(21, 8, 3),
(22, 9, 1),
(23, 10, 4),
(24, 10, 7),
(25, 11, 3),
(27, 12, 4),
(28, 12, 3),
(29, 13, 4),
(30, 13, 3),
(31, 14, 4),
(32, 12, 1),
(33, 13, 1),
(34, 14, 4),
(35, 15, 3),
(37, 16, 1),
(38, 17, 1),
(39, 18, 1),
(40, 19, 4),
(41, 19, 1),
(42, 20, 4),
(43, 21, 4);

-- --------------------------------------------------------

--
-- Table structure for table `visit_medicine`
--

CREATE TABLE `visit_medicine` (
  `ID` int(11) NOT NULL,
  `visitID` int(11) NOT NULL,
  `complaintID` int(50) NOT NULL,
  `medicineID` int(11) NOT NULL,
  `medicineBrandName` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `form` varchar(50) NOT NULL,
  `dosage` int(11) NOT NULL,
  `dispensedDose` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visit_medicine`
--

INSERT INTO `visit_medicine` (`ID`, `visitID`, `complaintID`, `medicineID`, `medicineBrandName`, `quantity`, `form`, `dosage`, `dispensedDose`) VALUES
(1, 1, 5, 6, '', 1, '', 0, 0),
(2, 1, 5, 5, '', 1, '', 0, 0),
(3, 1, 5, 3, '', 1, '', 0, 0),
(4, 2, 6, 6, '', 1, '', 0, 0),
(5, 2, 6, 4, '', 1, '', 0, 0),
(6, 2, 6, 3, '', 1, '', 0, 0),
(7, 3, 5, 2, '', 1, '', 0, 0),
(8, 3, 5, 3, '', 1, '', 0, 0),
(9, 4, 4, 3, '', 1, '', 0, 0),
(10, 4, 4, 1, '', 1, '', 0, 0),
(11, 5, 1, 2, '', 1, '', 0, 0),
(12, 6, 3, 1, '', 1, '', 0, 0),
(13, 7, 3, 1, '', 1, '', 0, 0),
(14, 8, 3, 6, '', 1, '', 0, 0),
(15, 9, 1, 2, '', 1, '', 0, 0),
(16, 10, 7, 3, '', 1, '', 0, 0),
(17, 11, 3, 2, '', 1, '', 0, 0),
(18, 12, 4, 1, '', 1, '', 0, 0),
(19, 13, 3, 1, '', 2, '', 0, 0),
(20, 13, 3, 3, '', 4, '', 0, 0),
(21, 14, 4, 1, '', 1, '', 0, 0),
(22, 12, 1, 2, '', 1, '', 0, 0),
(23, 13, 1, 2, '', 1, '', 0, 0),
(24, 14, 4, 1, '', 1, '', 0, 0),
(25, 15, 3, 1, '', 1, '', 0, 0),
(26, 16, 1, 2, '', 1, '', 0, 0),
(27, 17, 1, 1, '', 1, '', 0, 0),
(28, 18, 1, 1, '', 300, '', 0, 0),
(29, 19, 1, 1, '', 300, '', 0, 0),
(30, 19, 1, 3, '', 200, '', 0, 0),
(31, 20, 4, 1, '', 1, '', 0, 0),
(32, 21, 4, 1, '', 1, '', 0, 0);

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
  ADD KEY `userID` (`userID`),
  ADD KEY `eventID` (`eventID`);

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
  ADD KEY `visitID` (`visitID`),
  ADD KEY `complaintID` (`complaintID`);

--
-- Indexes for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`),
  ADD KEY `complaintID` (`complaintID`,`medicineID`),
  ADD KEY `visitID` (`visitID`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allergy`
--
ALTER TABLE `allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1403;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `password_change_request`
--
ALTER TABLE `password_change_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
