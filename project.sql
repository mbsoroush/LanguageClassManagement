-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2022 at 07:08 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `Class_ID` int(11) NOT NULL,
  `Language` varchar(25) COLLATE utf8_persian_ci NOT NULL,
  `Teacher` int(5) DEFAULT NULL,
  `Start_Date` date NOT NULL,
  `Finish_Date` date NOT NULL,
  `Number_sessions` int(11) NOT NULL,
  `Term` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`Class_ID`, `Language`, `Teacher`, `Start_Date`, `Finish_Date`, `Number_sessions`, `Term`) VALUES
(1001, 'Persian', 201, '2020-06-11', '2020-09-17', 20, 2001),
(1002, 'English', 202, '2022-07-05', '2022-09-20', 10, 2024),
(1003, 'Spanish', 203, '2021-04-27', '2021-06-27', 14, 2011),
(1004, 'Arabic', 204, '2022-09-15', '2023-01-07', 40, 2029),
(1007, 'Persian', 207, '2022-07-13', '2022-07-29', 2, 2002),
(1009, 'Russian', 205, '2022-08-11', '2022-11-13', 11, 2021),
(1010, 'French', 210, '2023-01-11', '2023-11-13', 12, 2022),
(1011, 'Italian', 211, '2023-06-06', '2023-12-12', 14, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `class_days`
--

CREATE TABLE `class_days` (
  `ID` int(4) NOT NULL,
  `Class_ID` int(5) NOT NULL,
  `Language` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Days` varchar(25) COLLATE utf8_persian_ci NOT NULL,
  `Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `class_days`
--


INSERT INTO `class_days` (`ID`, `Class_ID`, `Language`, `Days`, `Time`) VALUES
(1, 1001, 'Persian', 'Saturday', '14:20:00'),
(2, 1001, 'Persian', 'Sunday', '15:45:00'),
(3, 1002, 'English', 'Monday', '16:00:00'),
(4, 1002, 'English', 'Tuesday', '08:00:00'),
(5, 1003, 'Spanish', 'Wednesday', '17:30:00'),
(6, 1004, 'Arabic', 'Thursday', '20:00:00'),
(7, 1009, 'Russian', 'Sunday', '15:25:00'),
(8, 1010, 'French', 'Monday', '18:00:00'),
(9, 1011, 'Italian', 'Thursday', '08:00:00');


-- --------------------------------------------------------

--
-- Table structure for table `class_student`
--

CREATE TABLE `class_student` (
  `ID` int(4) NOT NULL,
  `Class_ID` int(5) NOT NULL,
  `Student_ID` int(5) NOT NULL,
  `Grade` int(2) DEFAULT NULL,
  `Term` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `class_student`
--

INSERT INTO `class_student` (`ID`, `Class_ID`, `Student_ID`, `Grade`, `Term`) VALUES
(1, 1001, 123, 15, 2001),
(2, 1001, 125, 20, 2001),
(3, 1002, 124, 19, 2024),
(4, 1003, 126, 18, 2011),
(5, 1004, 127, 10, 2029),
(6, 1007, 129, 12, 2002),
(7, 1007, 128, 16, 2002),
(8, 1008, 129, 19, 2023),
(9, 1011, 131, 12, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `class_teacher`
--

CREATE TABLE `class_teacher` (
  `Class_ID` int(5) NOT NULL,
  `Teacher_ID` int(5) NOT NULL,
  `Term` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `class_teacher`
--

INSERT INTO `class_teacher` (`Class_ID`, `Teacher_ID`, `Term`) VALUES
(1001, 201, 2001),
(1002, 202, 2024),
(1003, 203, 2011),
(1004, 204, 2029),
(1007, 207, 2002),
(1009, 205, 2021),
(1010, 210, 2022),
(1011, 211, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `ID` int(3) NOT NULL,
  `FName` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `LName` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `National_ID` int(15) NOT NULL,
  `Sex` varchar(5) COLLATE utf8_persian_ci NOT NULL,
  `Phone_Number` varchar(16) COLLATE utf8_persian_ci NOT NULL,
  `Address` text COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`ID`, `FName`, `LName`, `National_ID`, `Sex`, `Phone_Number`, `Address`) VALUES
(13, 'Reza', 'Rezaei', 881234353, 'man', '09175654325', 'Tehran ...'),
(124, 'Zahra', 'Asadi', 3457253, 'woman', '09145678942', 'Arak ...'),
(125, 'Ali', 'Hassani', 22444678, 'man', '09123234275', 'tehran ....'),
(126, 'Maryam', 'Lotfi', 789878340, 'woman', '09158789030', 'Mazandran ....'),
(127, 'Hassan', 'Hassani', 980562431, 'man', '09356836776', 'Kordestan ...'),
(128, 'Kiarash', 'Azizi', 237858844, 'man', '09182349086', 'Tabriz'),
(201, 'Hoda', 'Taheri', 987654321, 'woman', '09336667777', 'Tehran ...'),
(202, 'Amir', 'Amiri', 556663212, 'man', '09213459090', 'Mashhad ...'),
(203, 'Fateme', 'Moradi', 667773322, 'woman', '09187675656', 'Abadan ...'),
(204, 'Amin', 'Amini', 460347812, 'man', '09228883454', 'Zanjan ...'),
(205, 'Ahmad', 'Mosavi', 446789432, 'man', '09165438749', 'Tehran ...'),
(206, 'Alireza', 'Naghavi', 326789455, 'man', '09185438749', 'Hamedan ...'),
(207, 'Narges', 'Merdasi', 866319005, 'woman', '09017586813', 'Hamedan ...');

-- --------------------------------------------------------

--
-- Table structure for table `responsible`
--

CREATE TABLE `responsible` (
  `Responsible_ID` int(5) NOT NULL,
  `Responsibility` varchar(200) COLLATE utf8_persian_ci NOT NULL,
  `Works_hours` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `responsible`
--

INSERT INTO `responsible` (`Responsible_ID`, `Responsibility`, `Works_hours`) VALUES
(13, 'Responsible for registration', 8);

-- --------------------------------------------------------

--
-- Table structure for table `roll_call_student`
--

CREATE TABLE `roll_call_student` (
  `ID` int(3) NOT NULL,
  `Class_ID` int(5) NOT NULL,
  `Student_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Attendance` varchar(7) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `roll_call_student`
--

INSERT INTO `roll_call_student` (`ID`, `Class_ID`, `Student_ID`, `Date`, `Attendance`) VALUES
(2, 1001, 125, '2022-07-06', 'Absent'),
(3, 1002, 124, '2022-07-20', 'Present'),
(4, 1003, 126, '2022-07-30', 'Absent'),
(5, 1004, 127, '2022-08-01', 'Present'),
(6, 1009, 128, '2022-08-22', 'Present'),
(8, 1008, 130, '2022-03-04', 'Present'),
(9, 1010, 129, '2023-03-04', 'Absent'),
(10, 1011, 130, '2023-08-17', 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `roll_call_teacher`
--

CREATE TABLE `roll_call_teacher` (
  `ID` int(3) NOT NULL,
  `Class_ID` int(5) NOT NULL,
  `Language` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Teacher_ID` int(5) NOT NULL,
  `Date` date NOT NULL,
  `Attendance` varchar(7) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `roll_call_teacher`
--

INSERT INTO `roll_call_teacher` (`ID`, `Class_ID`, `Language`, `Teacher_ID`, `Date`, `Attendance`) VALUES
(1, 1002, 'English', 202, '2022-07-22', 'Present'),
(2, 1001, 'Persian', 201, '2022-07-23', 'Absent'),
(3, 1003, 'Spanish', 203, '2022-08-26', 'Present'),
(4, 1004, 'Arabic', 204, '2022-07-21', 'Present'),
(5, 1009, 'Russian', 205, '2022-05-20', 'Absent'),
(5, 1010, 'French', 210, '2023-02-10', 'Present'),
(6, 1011, 'Italian', 211, '2023-09-03', 'Present');


-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` int(3) NOT NULL,
  `Student_ID` int(5) NOT NULL,
  `Learn_Language` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Passed_Term` int(4) NOT NULL,
  `Start_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `Student_ID`, `Learn_Language`, `Passed_Term`, `Start_Date`) VALUES
(2, 124, 'English', 4, '2021-05-19'),
(3, 125, 'Persion', 3, '2021-07-21'),
(4, 126, 'Spanish', 5, '2021-04-15'),
(5, 127, 'Arabic', 3, '2022-04-12'),
(6, 128, 'Russian', 1, '2022-07-04'),
(7, 129, 'French', 4, '2023-01-30'),
(8, 130, 'Italian', 7, '2023-06-25')

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `ID` int(3) NOT NULL,
  `Startwork_Date` date NOT NULL,
  `Finishwork_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`ID`, `Startwork_Date`, `Finishwork_Date`) VALUES
(201, '2021-10-07', '2021-11-05'),
(202, '2021-07-08', '2022-07-06'),
(203, '2022-07-21', '2022-08-18'),
(204, '2022-08-26', '2022-09-15'),
(205, '2021-05-07', '2022-07-11'),
(210, '2023-02-30', '2022-05-10'),
(211, '2023-06-12', '2022-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_languages`
--

CREATE TABLE `teacher_languages` (
  `ID` int(3) NOT NULL,
  `Teacher_ID` int(5) NOT NULL,
  `Languages` varchar(50) COLLATE utf8_persian_ci NOT NULL,
  `Certificate` varchar(50) COLLATE utf8_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `teacher_languages`
--

INSERT INTO `teacher_languages` (`ID`, `Teacher_ID`, `Languages`, `Certificate`) VALUES
(1, 201, 'Persion', 'Doctor'),
(2, 202, 'English', 'Master'),
(3, 203, 'Spanish', 'Post-Doctor'),
(4, 204, 'Arabic', 'Doctor'),
(5, 205, 'Russian', 'Master'),
(6, 210, 'French', 'Post-Doctor'),
(7, 211, 'Italian', 'Master');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`Class_ID`);

--
-- Indexes for table `class_days`
--
ALTER TABLE `class_days`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `class_student`
--
ALTER TABLE `class_student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `class_teacher`
--
ALTER TABLE `class_teacher`
  ADD PRIMARY KEY (`Class_ID`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `responsible`
--
ALTER TABLE `responsible`
  ADD PRIMARY KEY (`Responsible_ID`);

--
-- Indexes for table `roll_call_student`
--
ALTER TABLE `roll_call_student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roll_call_teacher`
--
ALTER TABLE `roll_call_teacher`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teacher_languages`
--
ALTER TABLE `teacher_languages`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_days`
--
ALTER TABLE `class_days`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `class_student`
--
ALTER TABLE `class_student`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roll_call_student`
--
ALTER TABLE `roll_call_student`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roll_call_teacher`
--
ALTER TABLE `roll_call_teacher`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `teacher_languages`
--
ALTER TABLE `teacher_languages`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
