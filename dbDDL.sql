

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_bookstore`
--


CREATE DATABASE IF NOT EXISTS `university_bookstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `university_bookstore`;

-- --------------------------------------------------------

--
-- Table structure for table `bookstores`
--

CREATE TABLE `bookstores` (
  `Bookstore_ID` int(11) NOT NULL,
  `B_University_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buy`
--

CREATE TABLE `buy` (
  `B_Student_ID` int(11) NOT NULL,
  `B_Book_Code` int(11) NOT NULL,
  `Date_Sold` date NOT NULL,
  `Buy_Price` int(3) NOT NULL,
  `Qty_bought` int(11) NOT NULL,
  `B_Tpe_Textbook` varchar(15) DEFAULT NULL,
  `B_BookStore_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `Course_ID` int(11) NOT NULL,
  `C_Semester_ID` int(4) NOT NULL,
  `C_University_ID` int(11) NOT NULL,
  `C_Textbook_Name` varchar(50) DEFAULT NULL,
  `C_Major` varchar(50) NOT NULL,
  `C_Type_Textbook` varchar(15) DEFAULT NULL,
  `Students_enrolled` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customized_books`
--

CREATE TABLE `customized_books` (
  `SKU_Code` int(11) NOT NULL,
  `Textbook_Name` varchar(50) NOT NULL,
  `Author` varchar(30) NOT NULL,
  `Cust_Price` int(3) NOT NULL,
  `No_of_books_available` int(11) NOT NULL,
  `C_BookStore_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `R_Student_ID` int(11) NOT NULL,
  `R_ISBN` int(11) NOT NULL,
  `Date_Rented` date NOT NULL,
  `Rent_Price` int(3) NOT NULL,
  `Qty_bought` int(11) NOT NULL,
  `Renewal` tinyint(1) NOT NULL,
  `R_BookStore_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `semesters`
--

CREATE TABLE `semesters` (
  `Semester_ID` int(4) NOT NULL,
  `Semester_Name` varchar(20) NOT NULL,
  `Sem_University_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `standard_books`
--

CREATE TABLE `standard_books` (
  `ISBN` int(11) NOT NULL,
  `Textbook_Name` varchar(50) NOT NULL,
  `Author` varchar(30) NOT NULL,
  `Std_Price` int(3) NOT NULL,
  `No_of_books_available` int(11) NOT NULL,
  `S_BookStore_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Student_ID` int(11) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `S_University_ID` int(11) DEFAULT NULL,
  `Student_name` varchar(50) NOT NULL,
  `Email_Address` varchar(50) NOT NULL,
  `S_Major` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `students`
--
DELIMITER $$
CREATE TRIGGER `removespace` BEFORE INSERT ON `students` FOR EACH ROW SET NEW.Student_name = TRIM(NEW.Student_name)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `textbooks`
--

CREATE TABLE `textbooks` (
  `Book_Code` int(11) NOT NULL,
  `T_BookStore_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `University_ID` int(11) NOT NULL,
  `University_Name` varchar(50) NOT NULL,
  `U_BookStore_ID` int(11) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookstores`
--
ALTER TABLE `bookstores`
  ADD PRIMARY KEY (`Bookstore_ID`),
  ADD UNIQUE KEY `B_University_name` (`B_University_name`);

--
-- Indexes for table `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`B_Student_ID`,`B_Book_Code`,`B_BookStore_ID`),
  ADD KEY `B_BookStore_ID` (`B_BookStore_ID`),
  ADD KEY `B_Book_Code` (`B_Book_Code`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_ID`,`C_Semester_ID`,`C_University_ID`),
  ADD KEY `C_University_ID` (`C_University_ID`),
  ADD KEY `C_Semester_ID` (`C_Semester_ID`);

--
-- Indexes for table `customized_books`
--
ALTER TABLE `customized_books`
  ADD PRIMARY KEY (`SKU_Code`,`C_BookStore_ID`),
  ADD KEY `C_BookStore_ID` (`C_BookStore_ID`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`R_Student_ID`,`R_ISBN`,`R_BookStore_ID`),
  ADD KEY `R_BookStore_ID` (`R_BookStore_ID`),
  ADD KEY `R_ISBN` (`R_ISBN`);

--
-- Indexes for table `semesters`
--
ALTER TABLE `semesters`
  ADD PRIMARY KEY (`Semester_ID`),
  ADD KEY `Sem_University_ID` (`Sem_University_ID`);

--
-- Indexes for table `standard_books`
--
ALTER TABLE `standard_books`
  ADD PRIMARY KEY (`ISBN`,`S_BookStore_ID`),
  ADD KEY `S_BookStore_ID` (`S_BookStore_ID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Student_ID`),
  ADD UNIQUE KEY `Email_Address` (`Email_Address`),
  ADD KEY `S_University_ID` (`S_University_ID`);

--
-- Indexes for table `textbooks`
--
ALTER TABLE `textbooks`
  ADD PRIMARY KEY (`Book_Code`,`T_BookStore_ID`),
  ADD KEY `T_BookStore_ID` (`T_BookStore_ID`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`University_ID`),
  ADD UNIQUE KEY `University_Name` (`University_Name`),
  ADD KEY `U_BookStore_ID` (`U_BookStore_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`B_BookStore_ID`) REFERENCES `textbooks` (`T_BookStore_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`B_Book_Code`) REFERENCES `textbooks` (`Book_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buy_ibfk_3` FOREIGN KEY (`B_Student_ID`) REFERENCES `students` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`C_University_ID`) REFERENCES `university` (`University_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`C_Semester_ID`) REFERENCES `semesters` (`Semester_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customized_books`
--
ALTER TABLE `customized_books`
  ADD CONSTRAINT `customized_books_ibfk_1` FOREIGN KEY (`C_BookStore_ID`) REFERENCES `textbooks` (`T_BookStore_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customized_books_ibfk_2` FOREIGN KEY (`SKU_Code`) REFERENCES `textbooks` (`Book_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`R_BookStore_ID`) REFERENCES `textbooks` (`T_BookStore_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rent_ibfk_2` FOREIGN KEY (`R_ISBN`) REFERENCES `textbooks` (`Book_Code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rent_ibfk_3` FOREIGN KEY (`R_Student_ID`) REFERENCES `students` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `semesters`
--
ALTER TABLE `semesters`
  ADD CONSTRAINT `semesters_ibfk_1` FOREIGN KEY (`Sem_University_ID`) REFERENCES `university` (`University_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `standard_books`
--
ALTER TABLE `standard_books`
  ADD CONSTRAINT `standard_books_ibfk_1` FOREIGN KEY (`S_BookStore_ID`) REFERENCES `textbooks` (`T_BookStore_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `standard_books_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `textbooks` (`Book_Code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`S_University_ID`) REFERENCES `university` (`University_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `textbooks`
--
ALTER TABLE `textbooks`
  ADD CONSTRAINT `textbooks_ibfk_1` FOREIGN KEY (`T_BookStore_ID`) REFERENCES `bookstores` (`Bookstore_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_ibfk_1` FOREIGN KEY (`U_BookStore_ID`) REFERENCES `bookstores` (`Bookstore_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
