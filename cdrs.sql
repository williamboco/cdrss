-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2019 at 03:57 PM
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
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `symptoms` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allergy`
--

INSERT INTO `allergy` (`ID`, `allergyName`, `description`, `isDeleted`, `symptoms`) VALUES
(1, 'Secret', '', 0, '');

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
('201603007', 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaintID` int(11) NOT NULL,
  `complaintName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `symptoms` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaintID`, `complaintName`, `description`, `isDeleted`, `symptoms`) VALUES
(1, 'hotdog', 'tender juicy', 1, ''),
(2, 'Headache', 'Naiistress ', 0, '');

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
(1, '201603007', 'Olivia Mesa Boco', '09392846763');

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
(1, 'Web Development', 0);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `ID` int(11) NOT NULL,
  `departmentName` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `eventType` int(11) NOT NULL,
  `userID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `ID` int(11) NOT NULL,
  `brandName` varchar(255) NOT NULL,
  `genericName` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `isSupply` tinyint(1) NOT NULL,
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `thresholdQty` int(50) NOT NULL,
  `criticalQty` int(50) NOT NULL,
  `form` varchar(50) NOT NULL,
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

INSERT INTO `medicine` (`ID`, `brandName`, `genericName`, `type`, `isSupply`, `isDeleted`, `thresholdQty`, `criticalQty`, `form`, `dosage`, `dosageQty`, `currentQty`, `newQty`, `updateQty`, `dateCreated`, `dateModified`, `createdBy`, `modifiedBy`) VALUES
(1, 'Paracetamol', 'Biogesic', 'Tablet', 0, 0, 88, 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(11, 'Antibacterial', 'Doxitar', 'Tablet', 0, 0, 88, 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(13, '', 'Bandage', '', 1, 0, 88, 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(28, '', 'Hehehe', '', 1, 0, 93, 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(32, '', 'Band-Aid', '', 1, 0, 0, 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(34, 'Advil', 'Advil', 'Tablet', 0, 0, 0, 0, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

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
(90, 'HrETtdmE', '201603007', '2019-04-11 21:50:59', 1);

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
  `contactNumber` int(25) NOT NULL,
  `contactPerson` varchar(70) NOT NULL,
  `contactPersonNumber` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ID`, `firstName`, `lastName`, `birthDate`, `gender`, `contact`, `isDeleted`, `createdBy`, `modifiedBy`, `dateCreated`, `dateModified`, `contactNumber`, `contactPerson`, `contactPersonNumber`) VALUES
('201603007', 'William', 'Boco', '1999-01-11', 'Male', '09052834596', 0, '201603007', '201603007', '2019-01-21 11:15:45', '2019-01-21 11:15:45', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `patient_allergy`
--

CREATE TABLE `patient_allergy` (
  `ID` int(11) NOT NULL,
  `patientID` varchar(255) NOT NULL,
  `allergyID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `supply`
--

CREATE TABLE `supply` (
  `supplyID` int(11) NOT NULL,
  `supplyName` varchar(50) NOT NULL,
  `currentQty` int(50) NOT NULL,
  `newQty` int(50) NOT NULL,
  `updateQty` int(50) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `modifiedBy` varchar(50) NOT NULL,
  `thresholdQty` int(50) NOT NULL,
  `criticalQty` int(50) NOT NULL
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
(1, 'Software Development', 0);

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
('201601048', 'uv19Vj9iLs+Npf845EI2rfk2M+A+hpnEf6/FwwMcm6w=', 'zuwBtmygSJNyZDzorYP7/g==', '0000-00-00 00:00:00', 'R3F57LtVGns08zxFybyhTA==', '2016-04-01', 1, '4ExITKp6kadxz/2oqddisQ==', 'TtvN3gr/YWdn/kgaBtLgMA==', 'Female', '123456789', '2019-04-11 21:56:30', '2019-04-11 21:56:30', 'nttljvldo4lvJ/3aXk/tlg==', 'nttljvldo4lvJ/3aXk/tlg=='),
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
(1, '201603007', '2019-01-21 11:16:00', '', 0, '201603007', '201603007', '2019-01-21 11:16:42', '2019-01-21 11:16:42', '0', '0');

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
(1, 1, 2);

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
(1, 1, 1, 1, 0, '', '', 0, 0);

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
  ADD PRIMARY KEY (`complaintID`),
  ADD UNIQUE KEY `ID` (`complaintID`);

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
-- Indexes for table `supply`
--
ALTER TABLE `supply`
  ADD PRIMARY KEY (`supplyID`),
  ADD KEY `supplyID` (`supplyID`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaintID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `eventID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `password_change_request`
--
ALTER TABLE `password_change_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
