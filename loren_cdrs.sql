-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2019 at 04:16 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

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
(6, 'Fishy', 'Itchy like a fishy', 0),
(7, '  ', '', 1),
(8, 'Fishy', '', 0),
(9, 'Fishy', '', 0);

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
('09876543222', 3, ''),
('10231231', 5, ''),
('109238198', 2, ''),
('120938', 2, ''),
('12314123', 2, ''),
('12345', 2, ''),
('1234567', 2, ''),
('12345678', 2, ''),
('1234567890', 2, ''),
('1239102938', 2, ''),
('12920309', 6, ''),
('1293120', 6, ''),
('1923091203', 3, ''),
('1998000', 4, ''),
('201601001', 1, ''),
('201601049', 5, ''),
('21301923891', 2, ''),
('21309823', 4, ''),
('5439012', 2, ''),
('90238091', 5, ''),
('91283012380', 3, ''),
('913809123', 2, ''),
('928301', 2, ''),
('92839238', 5, ''),
('9999900000', 3, '');

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
(1, '91283012380', 'Bang Chan', '12312093802'),
(2, '12301928301', 'Pepper Potts', '1231293801'),
(3, '12398102', 'Nanay Mashing', '292909382'),
(7, '120938', 'Changbin', '');

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
('09120938109238', 2, 'fixed', ''),
('09183018309', 3, 'casual', ''),
('09238019238', 2, 'casual', ''),
('10201021', 3, 'fixed', ''),
('12039', 3, 'casual', ''),
('120390193', 3, 'casual', ''),
('123', 3, 'fixed', ''),
('1230123', 2, 'casual', ''),
('1239120', 3, 'fixed', ''),
('1291291029', 3, 'fixed', ''),
('129309283', 1, 'fixed', ''),
('1930189230', 3, 'casual', ''),
('193213', 2, 'casual', ''),
('199017271', 5, 'fixed', ''),
('201601050', 4, 'fixed', ''),
('912380912', 1, 'fixed', ''),
('92380198', 4, 'fixed', ''),
('98098098', 1, 'fixed', ''),
('999999', 2, 'casual', '');

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
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13);

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
(306, '2019-05-13 13:51:20', 'Created patient visit', '201601048');

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
(1, 'Biogesic', 'Paracetamol', 'Capsule', 3, 0, 0, 50, 20, 'mg', 500, 185, 400, 4, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(2, 'Immodium', 'Loperamide', 'Capsule', 3, 0, 0, 30, 20, 'mg', 10, 90, 650, 1, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(3, 'Advil', 'Ibuprofen', 'Capsule', 3, 0, 0, 70, 50, 'mg', 500, 143, 440, 1, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(4, 'Buscopan', 'Hyoscine-N-butylbromide', 'Tablet', 3, 0, 0, 30, 20, 'mg', 10, 640, 100, 1, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(5, 'Tempra', 'Paracetamol', 'Tablet', 0, 0, 0, 30, 20, 'mg', 500, 0, 0, 2, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(6, 'Tylenol', 'Paracetamol', 'Tablet', 3, 0, 0, 200, 100, 'mg', 200, 218, 20, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, '', 'Tissue', '', 2, 1, 0, 200, 100, 'box', 1, 200, 202, 200, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 'Lagnat', 'Good', 'Tablet', 3, 0, 0, 0, 0, 'mg', 90, 430, 0, 430, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(9, 'Biotin', 'Biotin ', 'Capsule', 1, 0, 0, 2000, 1000, 'mg', 100, 400, 0, 400, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(10, 'Vicks', 'Vaporub', 'Ointment', 1, 0, 0, 500, 250, 'g', 1, 97, 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(11, 'Diatabs', 'Loperamide', 'Eye Drop', 2, 0, 0, 200, 100, 'mg', 500, 200, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(12, 'Ceelin', 'Vitamin C', 'Eye Drop', 1, 0, 0, 500, 250, 'mg', 500, 100, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

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
(2, 'Jy4SR8Tr', '201601048', '2019-05-09 17:15:07', 0);

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
('09876543', 'Timmy', 'Horton', '1999-09-09', 'Male', '', 0, 'Rachel', 'Rachel', '2019-05-07 16:35:12', '2019-05-07 16:35:12', 0, '', 0),
('102381923', 'Sebastian', 'Stan', '1983-08-23', 'Male', '', 0, 'Rachel', 'Rachel', '2019-05-07 16:44:49', '2019-05-07 16:44:49', 0, '', 0),
('10289301', 'Hyunjin', 'Hwang', '2000-03-20', 'Male', '92301928', 0, 'Rachel', 'Rachel', '2019-05-07 17:12:33', '2019-05-07 17:12:33', 0, '', 0),
('11', 'Mela', 'Coz', '0000-00-00', 'Male', '01920912091209', 0, '201601062', '201601062', '2019-05-10 20:26:04', '2019-05-10 20:26:04', 0, '', 0),
('12', 'Loran', 'Gomgom', '0000-00-00', 'Female', '12380198312', 0, '201601062', '201601062', '2019-05-11 14:20:44', '2019-05-11 14:20:44', 0, '', 0),
('120938', 'Christopher', 'Bang', '1997-10-07', 'Male', '7779990', 0, '', '201601048', '0000-00-00 00:00:00', '2019-05-13 18:58:50', 0, '', 0),
('12301928301', 'Twinkle', 'Star', '2003-03-12', 'Female', '12391029381920', 0, 'Rachel', 'Rachel', '2019-05-07 18:26:24', '2019-05-07 18:26:24', 0, '', 0),
('123102389802', 'Tony', 'Stark', '1998-06-15', 'Male', '', 0, 'Loren', 'Loren', '2019-05-07 16:48:01', '2019-05-07 16:48:01', 0, '', 0),
('1234567890', 'Gusgus', 'Manolo', '1982-04-14', 'Male', '7779990', 0, 'Rachel', '201601048', '2019-05-07 16:32:53', '2019-05-13 15:50:38', 0, '', 0),
('1239102938', 'Woojin', 'Kim', '1998-02-21', 'Male', '8131837', 0, 'Rachel', 'Rachel', '2019-05-07 17:39:14', '2019-05-07 17:39:14', 0, '', 0),
('12391802', 'Lou', 'Bee', '2000-07-25', 'Female', '12381092380', 0, 'Loren', 'Loren', '2019-05-09 16:41:28', '2019-05-09 16:41:28', 0, '', 0),
('12398102', 'Junjun', 'Bernardo', '1955-08-27', 'Male', '123125343435', 0, 'Rachel', 'Rachel', '2019-05-08 00:48:20', '2019-05-08 00:48:20', 0, '', 0),
('12920309', 'Louie', 'Chichipong', '2012-12-29', 'Male', '', 0, '', '201601048', '0000-00-00 00:00:00', '2019-05-13 18:52:47', 0, '', 0),
('1293120', 'Minho', 'Lee', '1998-10-27', 'Male', '', 0, 'Rachel', 'Rachel', '2019-05-07 16:42:14', '2019-05-07 16:42:14', 0, '', 0),
('13', 'Lois', 'Hyatt', '0000-00-00', 'Female', '230138120', 0, '201601062', '201601062', '2019-05-13 10:44:54', '2019-05-13 10:44:54', 0, '', 0),
('1923091203', 'Jeongin', 'Yang', '2002-02-09', 'Male', '91380912', 0, 'Rachel', 'Rachel', '2019-05-07 18:24:01', '2019-05-07 18:24:01', 0, '', 0),
('1930192309', 'Jisung', 'Han', '2000-09-14', 'Female', '12391312938', 0, 'Rachel', 'Rachel', '2019-05-07 17:22:22', '2019-05-07 17:22:22', 0, '', 0),
('201601049', 'Julian', 'Casablancas', '2000-12-12', 'Male', '', 0, 'Loren', 'Loren', '2019-05-06 18:13:09', '2019-05-06 18:13:09', 0, '', 0),
('201601050', 'Felix', 'Lee', '2000-09-15', 'Male', '', 0, 'Rachel', 'Rachel', '2019-05-07 16:38:56', '2019-05-07 16:38:56', 0, '', 0),
('5439012', 'Sherlock', 'Holmeys', '2014-09-29', 'Male', '', 0, 'Loren', '201601048', '2019-05-07 00:57:50', '2019-05-13 09:00:55', 0, '', 0),
('912039810293', 'Chris', 'Evan', '1980-06-13', 'Male', '', 0, 'Rachel', 'Rachel', '2019-05-07 16:45:51', '2019-05-07 16:45:51', 0, '', 0),
('91283012380', 'Seungmin', 'Kim', '2001-09-22', 'Male', '293091238098', 0, 'Rachel', 'Rachel', '2019-05-07 18:18:20', '2019-05-07 18:18:20', 0, '', 0),
('913809103', 'Changbin ', 'Kim', '2006-07-26', 'Female', '123123552342', 0, 'Rachel', 'Rachel', '2019-05-07 18:03:00', '2019-05-07 18:03:00', 0, '', 0),
('913809123', 'Eunwoo', 'Cha', '1997-03-30', 'Male', '1239108923', 0, '201601048', '201601048', '2019-05-13 01:28:16', '2019-05-13 01:28:16', 0, '', 0),
('928301', 'Trisha', 'Floreza', '2002-02-22', 'Female', '', 0, 'Rachel', 'Rachel', '2019-05-07 16:37:13', '2019-05-07 16:37:13', 0, '', 0),
('92839238', 'Bena', 'Calder', '1997-04-26', 'Female', '12380123', 0, 'Rachel', 'Rachel', '2019-05-07 17:28:06', '2019-05-07 17:28:06', 0, '', 0);

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
(10, '120938', 9),
(3, '12301928301', 4),
(7, '12391802', 2),
(4, '12398102', 1),
(1, '1923091203', 3),
(2, '1923091203', 4),
(8, '913809123', 1);

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
('1001010101', 3, ''),
('1020203', 3, ''),
('102381923', 2, ''),
('102389102380', 3, ''),
('10289301', 2, ''),
('120931', 3, ''),
('12301928301', 2, ''),
('123102389802', 4, ''),
('123456', 1, ''),
('12390129', 2, ''),
('12391802', 1, ''),
('12398102', 3, ''),
('1309122019201', 2, ''),
('16381638', 3, ''),
('190319', 2, ''),
('1930192309', 2, ''),
('19380918', 3, ''),
('201501029', 3, ''),
('233322232312', 3, ''),
('87000', 2, ''),
('90123182', 4, ''),
('912039810293', 2, ''),
('9123091823', 2, ''),
('913809103', 2, ''),
('98098090', 2, ''),
('9876543', 4, '');

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
('201601045', 'yJ9R/zSi9nshquuYGdmDMxdNgPdExGjYLPNOjIE4+0Q=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2016-07-14', 1, '8uLjJIxUZfURls/ujYAjuA==', 'Fz7tFuU7RTR4bHltuGrvcw==', 'Female', '123456789', '2019-04-11 21:54:47', '2019-04-11 21:54:47', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201601048', 'uv19Vj9iLs+Npf845EI2rfk2M+A+hpnEf6/FwwMcm6w=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'dVAxclgOA3VifnlTUZW1NQ==', '2017-12-31', 1, '4ExITKp6kadxz/2oqddisQ==', 'TtvN3gr/YWdn/kgaBtLgMA==', 'Female', '09175651824', '2019-04-16 23:37:05', '2019-04-16 23:37:05', '1OUN5Y5ODxGQHipbESWcgg==', '1OUN5Y5ODxGQHipbESWcgg=='),
('201601062', 'RKHmiQmUR8rfQsRNaMkYVVBOkP6APd4haaqME6tWraw=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2016-07-14', 1, '1OUN5Y5ODxGQHipbESWcgg==', 'Yt6NgTjbm4VLSK8S3Tp6zQ==', 'Female', '123456789', '2019-04-11 21:55:42', '2019-04-11 21:55:42', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
('201603007', 'yZFiJYAKq5oeC0Iya3rlcSS4UZvN6+wER6zkk96+dkw=', 'r7uZnrc0nD4VJ0f5S6yqAg==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2017-01-05', 1, 'nttljvldo4lvJ/3aXk/tlg==', 'jPm06KABX+Ob6oGL0rqifA==', 'Male', '6460742', '2019-04-09 18:20:49', '2019-04-09 18:20:49', '1V4M1LsK/+03H/Nol+QP8g==', '1V4M1LsK/+03H/Nol+QP8g==');

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
(1, '1239102938', '2019-05-13 19:26:00', '', 0, '201601048', '201601048', '2019-05-13 19:26:22', '2019-05-13 19:26:22', '', ''),
(2, '1293120', '2019-05-13 19:27:00', '', 0, '201601048', '201601048', '2019-05-13 19:27:22', '2019-05-13 19:27:22', '', ''),
(3, '913809103', '2019-05-13 21:25:00', 'Test', 0, '201601048', '201601048', '2019-05-13 21:25:32', '2019-05-13 21:50:21', '', ''),
(4, '10289301', '2019-05-13 21:48:00', '', 0, '201601048', '201601048', '2019-05-13 21:49:02', '2019-05-13 21:49:02', '', ''),
(5, '12391802', '2019-05-13 21:50:00', '', 0, '201601048', '201601048', '2019-05-13 21:51:19', '2019-05-13 21:51:19', '', ''),
(6, '120938', '2019-05-13 22:07:00', '', 0, '201601048', '201601048', '2019-05-13 22:07:54', '2019-05-13 22:07:54', '', '');

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
(94, 1, 6),
(95, 2, 7),
(97, 4, 3),
(98, 4, 1),
(99, 3, 3),
(100, 5, 5),
(101, 6, 3);

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
(105, 1, 6, 4, '', 1, '', 0, 0),
(107, 2, 7, 5, '', 2, '', 0, 0),
(111, 4, 1, 1, '', 4, '', 0, 0),
(113, 3, 3, 3, '', 1, '', 0, 0),
(115, 5, 5, 10, '', 2, '', 0, 0),
(118, 6, 3, 2, '', 1, '', 0, 0),
(119, 6, 3, 5, '', 2, '', 0, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;
--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `password_change_request`
--
ALTER TABLE `password_change_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
