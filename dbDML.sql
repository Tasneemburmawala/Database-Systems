

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_bookstore`
--
USE `university_bookstore`;
--
-- Dumping data for table `bookstores`
--

INSERT INTO `bookstores` (`Bookstore_ID`, `B_University_name`) VALUES
(10, 'Austin Community College'),
(8, 'Dallas City College'),
(9, 'Houston City College'),
(3, 'North Texas'),
(4, 'Texas Community'),
(1, 'UT Arlington'),
(2, 'UT Austin'),
(5, 'UT Dallas'),
(7, 'UT Houston'),
(6, 'UT San Antonio');

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`University_ID`, `University_Name`, `U_BookStore_ID`, `City`, `State`) VALUES
(1, 'UT Arlington', 1, 'Arlington', 'Texas'),
(2, 'UT Austin', 2, 'Austin', 'Texas'),
(3, 'North Texas', 3, 'Irving', 'Texas'),
(4, 'Texas Community', 4, 'Addison', 'Texas'),
(5, 'UT Dallas', 5, 'Dallas', 'Texas'),
(6, 'UT San Antonio', 6, 'San Antonio', 'Texas'),
(7, 'UT Houston', 7, 'Houston', 'Texas'),
(8, 'Dallas City College', 8, 'Dallas', 'Texas'),
(9, 'Houston City College', 9, 'Houston', 'Texas'),
(10, 'Austin Community College', 10, 'Austin', 'Texas');

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Student_ID`, `Password`, `S_University_ID`, `Student_name`, `Email_Address`, `S_Major`) VALUES
(1001, 'abcd', 1, 'andrew ', 'andrew@mavs.uta.edu', 'Computer science'),
(1002, 'ghjgjh', 1, 'lokesh', 'lokesh@mavs.uta.edu', 'Music'),
(1003, 'hvdhjbd', 1, 'bani', 'bani@mavs.uta.edu', 'Music'),
(1004, 'gdhjg', 1, 'Vishwa', 'vishwa@mavs.uta.edu', 'Computer Science'),
(2001, 'abcd', 2, 'kajal', 'kajal@utaustin.com', 'Information System'),
(3001, 'abcde', 3, 'mitali', 'mitali@northtexas.com', 'Information System'),
(4001, 'mhyfhg', 4, 'muffa', 'muffa@texascommunity.com', 'Computer Science'),
(5001, 'jkjdghjdgjh', 5, 'jerrin', 'jerrin@utdallas.com', 'Music'),
(6001, 'bhjdhjb', 6, 'lionel', 'lionel@utsanantonio.com', 'Music'),
(7001, 'hhjgfdj', 7, 'zara', 'zara@uthouston.com', 'English'),
(8001, 'ghdhd', 8, 'Yusuf', 'yusuf@dallascity.com', 'English'),
(9001, 'gghfgh', 9, 'Fei', 'Fei@houstoncity.com', 'Psychology'),
(10001, 'tfhgfhjg', 10, 'Manish', 'manish@austincommunity.com', 'Psychology');

--
-- Dumping data for table `semesters`
--

INSERT INTO `semesters` (`Semester_ID`, `Semester_Name`, `Sem_University_ID`) VALUES
(1168, 'Fall', 1),
(1172, 'Spring', 1),
(2168, 'Fall', 2),
(2172, 'Spring', 2),
(3168, 'Fall', 3),
(3172, 'Spring', 3),
(4168, 'Fall', 4),
(4172, 'Spring', 4),
(5168, 'Fall', 5),
(5172, 'Spring', 5);


--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`Course_ID`, `C_Semester_ID`, `C_University_ID`, `C_Textbook_Name`, `C_Major`, `C_Type_Textbook`, `Students_enrolled`) VALUES
(11, 1168, 1, 'Fudamentals of database Systems', 'Computer Science', 'Standard', 40),
(11, 1172, 1, 'Fudamentals of database Systems', 'Computer Science', 'Standard', 20),
(12, 1168, 1, 'Musical Instruments', 'Music', 'Custom', 20),
(13, 1172, 1, 'Introduction to data Mining', 'Computer Science', 'Standard', 30),
(14, 1168, 1, 'Algorithms', 'Computer Science', 'Standard', 40),
(15, 1172, 1, 'Data Analysis and Modelling', 'Computer Science', 'Standard', 50),
(16, 1172, 1, 'Machine Learning', 'Computer Science', 'Standard', 35),
(21, 2168, 2, 'Big data', 'Information System', 'Custom', 50),
(22, 2172, 2, 'Object Oriented', 'Information System', 'Custom', 20),
(23, 2172, 2, 'ERP', 'Information System', 'Custom', 65),
(24, 2168, 2, 'Data Analytics', 'Information Systems', 'Custom', 20),
(24, 2172, 2, 'Data Analytics', 'Information Systems', 'Custom', 20),
(25, 2168, 2, 'Marketing', 'Information System', 'Custom', 80),
(34, 3168, 3, 'Fudamentals of database Systems', 'Computer Science', 'Standard', 40),
(34, 3172, 3, 'Fudamentals of database Systems', 'Computer Science', 'Standard', 30),
(51, 5168, 5, 'Introduction to Music', 'Music', 'Standard', 70),
(52, 5172, 5, 'Musical Instruments', 'Music', 'Custom', 20);

--
-- Dumping data for table `textbooks`
--

INSERT INTO `textbooks` (`Book_Code`, `T_BookStore_ID`) VALUES
(111, 1),
(121, 1),
(131, 1),
(141, 1),
(151, 1),
(161, 1),
(211, 2),
(221, 2),
(231, 2),
(241, 2),
(251, 2),
(341, 3),
(511, 5),
(521, 5);


--
-- Dumping data for table `standard_books`
--

INSERT INTO `standard_books` (`ISBN`, `Textbook_Name`, `Author`, `Std_Price`, `No_of_books_available`, `S_BookStore_ID`) VALUES
(111, 'Fudamentals of database Systems', 'Dr Elmasari', 50, 20, 1),
(131, 'Introduction to data Mining', 'Dr Ding', 65, 20, 1),
(141, 'Algorithms', 'Dr Das', 65, 20, 1),
(151, 'Data Analysis and Modelling', 'Dr Gao', 50, 20, 1),
(161, 'Machine Learning', 'Dr Huang', 70, 19, 1),
(341, 'Fudamentals of database Systems', 'Dr Elmasari', 50, 20, 3),
(511, 'Introduction to Music', 'Dr A R Rahman', 40, 20, 5);

--
-- Dumping data for table `customized_books`
--

INSERT INTO `customized_books` (`SKU_Code`, `Textbook_Name`, `Author`, `Cust_Price`, `No_of_books_available`, `C_BookStore_ID`) VALUES
(121, 'Musical Instruments', 'Dr Shankar ', 90, 15, 1),
(211, 'Big data', 'Dr Nerur', 50, 15, 2),
(221, 'Object Oriented', 'Dr Dantu', 55, 15, 5),
(231, 'ERP', 'Dr Pushkar', 72, 15, 2),
(241, 'Data Analytics', 'Dr Bing', 90, 15, 2),
(251, 'Marketing', 'Dr Virat', 100, 15, 2),
(521, 'Musical Instruments', 'Dr Salim', 45, 15, 5);

--
-- Dumping data for table `buy`
--

INSERT INTO `buy` (`B_Student_ID`, `B_Book_Code`, `Date_Sold`, `Buy_Price`, `Qty_bought`, `B_Tpe_Textbook`, `B_BookStore_ID`) VALUES
(1001, 111, '2016-11-02', 50, 1, 'Standard', 1),
(1001, 131, '2016-11-02', 130, 2, 'Standard', 1),
(1001, 141, '2016-11-01', 65, 1, 'Standard', 1),
(1001, 151, '2016-11-01', 150, 3, 'Standard', 1),
(1002, 121, '2016-11-01', 90, 1, 'Custom', 1),
(2001, 211, '2016-11-07', 50, 1, 'Custom', 2),
(2001, 221, '2016-11-08', 110, 2, 'Custom', 2);



--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`R_Student_ID`, `R_ISBN`, `Date_Rented`, `Rent_Price`, `Qty_bought`, `Renewal`, `R_BookStore_ID`) VALUES
(1004, 111, '2016-11-03', 25, 1, 1, 1),
(1004, 131, '2016-11-02', 30, 1, 0, 1),
(1004, 141, '2016-11-09', 30, 1, 0, 1),
(1004, 151, '2016-11-09', 25, 1, 0, 1),
(1004, 161, '2016-11-09', 35, 1, 0, 1),
(3001, 341, '2016-11-11', 25, 1, 0, 3),
(5001, 511, '2016-11-11', 40, 2, 0, 5);





/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
