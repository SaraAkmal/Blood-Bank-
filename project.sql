-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2020 at 02:04 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `bloodbank`
--

CREATE TABLE `bloodbank` (
  `BBank_no` int(11) NOT NULL,
  `BB_name` varchar(50) DEFAULT NULL,
  `Bm_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bloodbank`
--

INSERT INTO `bloodbank` (`BBank_no`, `BB_name`, `Bm_ID`) VALUES
(1, 'masr elkheer', 123456);

-- --------------------------------------------------------

--
-- Table structure for table `blood_recpient`
--

CREATE TABLE `blood_recpient` (
  `H_ID` int(11) DEFAULT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `R_ID` int(11) NOT NULL,
  `Rreg_Date` date DEFAULT NULL,
  `RB_grp` char(3) DEFAULT NULL,
  `RB_Quantity` char(10) DEFAULT NULL,
  `SSN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_recpient`
--

INSERT INTO `blood_recpient` (`H_ID`, `Order_ID`, `R_ID`, `Rreg_Date`, `RB_grp`, `RB_Quantity`, `SSN`) VALUES
(1, 1, 1, '2019-02-12', 'B+', '3', 4030),
(2, 2, 2, '2019-03-12', 'O', '3', 4031),
(1, 2, 3, '2018-02-12', 'A', '7', 4050),
(2, 1, 4, '2019-04-15', 'A+', '3', 4006);

-- --------------------------------------------------------

--
-- Table structure for table `blood_sample`
--

CREATE TABLE `blood_sample` (
  `BBank_no` int(11) DEFAULT NULL,
  `Sample_no` int(11) NOT NULL,
  `dID` int(11) DEFAULT NULL,
  `drecog_id` int(11) DEFAULT NULL,
  `Tech_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_sample`
--

INSERT INTO `blood_sample` (`BBank_no`, `Sample_no`, `dID`, `drecog_id`, `Tech_ID`) VALUES
(1, 1, 1, 1, 1),
(1, 2, 2, 2, 1),
(1, 3, 3, 3, 1),
(1, 4, 3, 3, 1),
(1, 5, 4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `disease_recognizer`
--

CREATE TABLE `disease_recognizer` (
  `drecog_id` int(11) NOT NULL,
  `RedbloodCell_count` char(10) DEFAULT NULL,
  `WhitebloodCell_count` char(10) DEFAULT NULL,
  `bloodborne_disease` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `disease_recognizer`
--

INSERT INTO `disease_recognizer` (`drecog_id`, `RedbloodCell_count`, `WhitebloodCell_count`, `bloodborne_disease`) VALUES
(1, 'low', 'normal', 0),
(2, 'normal', 'high', 1),
(3, 'normal', 'normal', 0),
(4, 'normal', 'low', 1);

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `dis_Name` char(50) DEFAULT NULL,
  `dis_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`dis_Name`, `dis_ID`) VALUES
('nasr city', 1),
('maadi', 2),
('new york', 3),
('shrute far', 4),
('lake view', 5);

-- --------------------------------------------------------

--
-- Table structure for table `donner`
--

CREATE TABLE `donner` (
  `SSN` int(11) NOT NULL,
  `reg_Date` date DEFAULT NULL,
  `rs_ID` int(11) DEFAULT NULL,
  `dis_ID` int(11) DEFAULT NULL,
  `dID` int(11) DEFAULT NULL,
  `Db_group` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donner`
--

INSERT INTO `donner` (`SSN`, `reg_Date`, `rs_ID`, `dis_ID`, `dID`, `Db_group`) VALUES
(4003, '2020-04-28', 1, 1, 1, 'A'),
(4004, '2019-02-12', 1, 2, 2, 'B+'),
(4005, '0000-00-00', 1, 3, 4, 'O'),
(4008, '2019-03-09', 1, 1, 3, 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL,
  `Salary` int(11) DEFAULT NULL,
  `job_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SSN`, `Salary`, `job_type`) VALUES
(4007, 3000, 'worker'),
(4009, 5000, 'Manager'),
(4010, 3000, 'worker');

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `H_ID` int(11) NOT NULL,
  `dis_ID` int(11) DEFAULT NULL,
  `H_Name` varchar(50) DEFAULT NULL,
  `Order_ID` int(11) NOT NULL,
  `BBank_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`H_ID`, `dis_ID`, `H_Name`, `Order_ID`, `BBank_no`) VALUES
(1, 1, 'Masr', 1, 1),
(1, 1, 'Masr', 2, 1),
(2, 2, 'Masr el kheer', 1, 1),
(2, 2, 'Masr el kheer', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `SSN` int(11) NOT NULL,
  `Bm_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`SSN`, `Bm_ID`) VALUES
(4009, 123456);

-- --------------------------------------------------------

--
-- Table structure for table `medical_staff`
--

CREATE TABLE `medical_staff` (
  `SSN` int(11) NOT NULL,
  `Position` varchar(15) DEFAULT NULL,
  `BBank_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medical_staff`
--

INSERT INTO `medical_staff` (`SSN`, `Position`, `BBank_no`) VALUES
(4007, 'receptioni', 1),
(4010, 'tech', 1);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `SSN` int(11) NOT NULL,
  `FName` char(10) DEFAULT NULL,
  `Minit` char(10) DEFAULT NULL,
  `LName` char(10) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`SSN`, `FName`, `Minit`, `LName`, `Age`, `Sex`, `Address`) VALUES
(4003, 'Tom', 'B.', 'Smith', 30, 'M', '22 Nasr city'),
(4004, 'john', 'B.', 'Smith', 24, 'M', '8554 Homestead Dr.\r\nCoraopolis'),
(4005, 'Michael', 'S', 'Scott', 50, 'M', 'Dunder mifflin'),
(4006, 'Dwight', 'K.', 'Schrutte', 40, 'M', 'Schrutte farms'),
(4007, 'Pam', 'F.', 'Peesly', 28, 'F', ' new york, art musem'),
(4008, 'kelly', 'M.', 'Kapoor', 24, 'F', 'Lake View Dr.\r\nBuford, GA 30518'),
(4009, 'walter', 'H.', 'White', 60, 'M', '308 Negra Arroyo Lane, Albuquerque, New Mexico'),
(4010, 'jim', 'C.', 'halpert', 45, 'M', '4777 Orange Grove Blvd, North Fort Myers'),
(4030, 'Amanda', 'L.', 'Smith', 34, 'F', '1544 Graduation Ln, Middleburg, FL'),
(4031, 'Anastassia', 'L.', 'Brooklyn', 37, 'F', 'Po Box 1256, Medical Lake'),
(4050, 'Raymond', 'S.', 'Smith', 38, 'M', '2011 River Reach Dr, Naples, FL');

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `SSN` int(11) NOT NULL,
  `rs_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`SSN`, `rs_ID`) VALUES
(4007, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tech`
--

CREATE TABLE `tech` (
  `SSN` int(11) NOT NULL,
  `Tech_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tech`
--

INSERT INTO `tech` (`SSN`, `Tech_ID`) VALUES
(4010, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD PRIMARY KEY (`BBank_no`),
  ADD KEY `Bm_ID` (`Bm_ID`);

--
-- Indexes for table `blood_recpient`
--
ALTER TABLE `blood_recpient`
  ADD PRIMARY KEY (`R_ID`),
  ADD KEY `SSN` (`SSN`),
  ADD KEY `H_ID` (`H_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `blood_sample`
--
ALTER TABLE `blood_sample`
  ADD PRIMARY KEY (`Sample_no`),
  ADD KEY `BBank_no` (`BBank_no`),
  ADD KEY `dID` (`dID`),
  ADD KEY `Tech_ID` (`Tech_ID`),
  ADD KEY `drecog_id` (`drecog_id`);

--
-- Indexes for table `disease_recognizer`
--
ALTER TABLE `disease_recognizer`
  ADD PRIMARY KEY (`drecog_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`dis_ID`);

--
-- Indexes for table `donner`
--
ALTER TABLE `donner`
  ADD PRIMARY KEY (`SSN`),
  ADD UNIQUE KEY `dID` (`dID`),
  ADD KEY `dis_ID` (`dis_ID`),
  ADD KEY `rs_ID` (`rs_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`H_ID`,`Order_ID`),
  ADD KEY `BBank_no` (`BBank_no`),
  ADD KEY `dis_ID` (`dis_ID`),
  ADD KEY `H_ID` (`H_ID`),
  ADD KEY `Order_ID` (`Order_ID`) USING BTREE;

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`SSN`),
  ADD UNIQUE KEY `Bm_ID` (`Bm_ID`);

--
-- Indexes for table `medical_staff`
--
ALTER TABLE `medical_staff`
  ADD PRIMARY KEY (`SSN`),
  ADD KEY `BBank_no` (`BBank_no`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`SSN`,`rs_ID`),
  ADD KEY `rs_ID` (`rs_ID`);

--
-- Indexes for table `tech`
--
ALTER TABLE `tech`
  ADD PRIMARY KEY (`SSN`,`Tech_ID`),
  ADD UNIQUE KEY `Tech_ID` (`Tech_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD CONSTRAINT `bloodbank_ibfk_1` FOREIGN KEY (`Bm_ID`) REFERENCES `manager` (`Bm_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `blood_recpient`
--
ALTER TABLE `blood_recpient`
  ADD CONSTRAINT `blood_recpient_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_recpient_ibfk_2` FOREIGN KEY (`H_ID`) REFERENCES `hospital` (`H_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_recpient_ibfk_3` FOREIGN KEY (`Order_ID`) REFERENCES `hospital` (`Order_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `blood_sample`
--
ALTER TABLE `blood_sample`
  ADD CONSTRAINT `blood_sample_ibfk_1` FOREIGN KEY (`BBank_no`) REFERENCES `bloodbank` (`BBank_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_sample_ibfk_2` FOREIGN KEY (`dID`) REFERENCES `donner` (`dID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_sample_ibfk_3` FOREIGN KEY (`Tech_ID`) REFERENCES `tech` (`Tech_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `blood_sample_ibfk_4` FOREIGN KEY (`drecog_id`) REFERENCES `disease_recognizer` (`drecog_id`) ON UPDATE CASCADE;

--
-- Constraints for table `donner`
--
ALTER TABLE `donner`
  ADD CONSTRAINT `donner_ibfk_1` FOREIGN KEY (`dis_ID`) REFERENCES `district` (`dis_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `donner_ibfk_2` FOREIGN KEY (`rs_ID`) REFERENCES `receptionist` (`rs_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `donner_ibfk_3` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`BBank_no`) REFERENCES `bloodbank` (`BBank_no`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hospital_ibfk_2` FOREIGN KEY (`dis_ID`) REFERENCES `district` (`dis_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `medical_staff`
--
ALTER TABLE `medical_staff`
  ADD CONSTRAINT `medical_staff_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE,
  ADD CONSTRAINT `medical_staff_ibfk_2` FOREIGN KEY (`BBank_no`) REFERENCES `bloodbank` (`BBank_no`) ON UPDATE CASCADE;

--
-- Constraints for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD CONSTRAINT `receptionist_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE;

--
-- Constraints for table `tech`
--
ALTER TABLE `tech`
  ADD CONSTRAINT `tech_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
