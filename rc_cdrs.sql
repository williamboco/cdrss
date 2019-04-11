-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2019 at 12:18 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rc_cdrs`
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
(1, 'Asthma', 'Swelling and inflammation inside the airways of the lungs.', 0, 'swelling and inflammation'),
(2, 'Dermatitis', 'Pattern of itchy skin rash consisting of tiny pink bumps', 0, 'Skin rash '),
(3, 'Drug Allergy', 'adverse drug reactions', 0, 'may differ'),
(4, 'urticaria ', 'Skin rash', 0, 'hives, nettlerash, welts'),
(5, 'Rhinitis', 'Inflammation of the lining of the nose', 0, 'runny nose itching, sneezing and nasal blockage');

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `ID` varchar(255) NOT NULL,
  `courseID` int(11) NOT NULL,
  `courseName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `complaintID` int(11) NOT NULL,
  `complaintName` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `symptoms` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`complaintID`, `complaintName`, `description`, `isDeleted`, `symptoms`) VALUES
(1, 'stomach ache', 'stabbing pain', 0, 'stabbing pain'),
(2, 'colds', 'colds', 0, 'runny nose'),
(3, 'fever', 'fever', 0, 'high temp'),
(4, 'stomach ache', 'diarrhea', 0, 'loose bowel'),
(5, 'sprain', 'sprain', 0, 'pain in area of weight bearing limb');

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
(1, 'Web Devt', 0),
(2, 'Software Engr', 0),
(3, 'MMA', 0),
(4, 'Finance Mangt', 0);

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
(1, 'Biogesic', 'Paracetamol', 'medicine', 0, 0, 50, 20, 'tablet', 'mg', 500, 100, 0, 0, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(2, 'Immodium', 'Loperamide', 'medicine', 0, 0, 30, 20, 'capsule', 'mg', 10, 30, 0, 0, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'admin', 'admin'),
(3, 'Advil', 'Ibuprofen', 'medicine', 0, 0, 30, 20, 'capsule', 'mg', 500, 30, 0, 0, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(4, 'Buscopan', 'Hyoscine-N-butylbromide', 'medicine', 0, 0, 30, 20, 'tablet', 'mg', 10, 30, 0, 0, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse'),
(5, 'Tempra', 'Paracetamol', 'medicine', 0, 0, 30, 20, 'tablet', 'mg', 500, 30, 0, 0, '2019-04-11 00:00:00', '2019-04-11 00:00:00', 'nurse', 'nurse');

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
  `supplyName` varchar(100) NOT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `datePassChanged` datetime NOT NULL,
  `role` varchar(50) NOT NULL,
  `dateEmployed` date NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateModified` datetime NOT NULL,
  `createdBy` varchar(50) NOT NULL,
  `modifiedBy` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

-- --------------------------------------------------------

--
-- Table structure for table `visit_complaint`
--

CREATE TABLE `visit_complaint` (
  `ID` int(11) NOT NULL,
  `visitID` int(11) NOT NULL,
  `complaintID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `complaintID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_person`
--
ALTER TABLE `contact_person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `password_change_request`
--
ALTER TABLE `password_change_request`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient_allergy`
--
ALTER TABLE `patient_allergy`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supply`
--
ALTER TABLE `supply`
  MODIFY `supplyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_complaint`
--
ALTER TABLE `visit_complaint`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visit_medicine`
--
ALTER TABLE `visit_medicine`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`);

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
