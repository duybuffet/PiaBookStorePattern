-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2015 at 11:31 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bookstore`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser`(IN _username VARCHAR(255),
IN _password VARCHAR(255),
IN _email VARCHAR(255),
IN _dob DATE,
IN _gender TINYINT,
IN _house_no VARCHAR(255),
IN _town VARCHAR(255),
IN _district VARCHAR(255),
IN _city VARCHAR(255),
IN _first_name VARCHAR(255),
IN _mid_name VARCHAR(255),
IN _last_name VARCHAR(255))
BEGIN
DECLARE address_id INT;
DECLARE name_surname INT;
START TRANSACTION;
INSERT INTO tbladdress
(house_no,
town,
district,
city)
VALUES
(_house_no,
_town,
_district,
city);

SET address_id = (
SELECT LAST_INSERT_ID(id) FROM tbladdress ORDER BY id DESC LIMIT 1);

INSERT INTO tblnamesurname
(first_name,
mid_name,
last_name)
VALUES
(
_first_name,
_mid_name,
_last_name
);

SET name_surname = (
SELECT LAST_INSERT_ID(id) FROM tblnamesurname ORDER BY id DESC LIMIT 1);

INSERT INTO tbluser
(username,pass,email,dob,gender,address_id,name_surname_id)
VALUES
(_username,_password,_email,_dob,_gender,address_id,name_surname);

COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbladdress`
--

CREATE TABLE IF NOT EXISTS `tbladdress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house_no` varchar(250) DEFAULT NULL,
  `town` varchar(250) DEFAULT NULL,
  `district` varchar(250) DEFAULT NULL,
  `city` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `tbladdress`
--

INSERT INTO `tbladdress` (`id`, `house_no`, `town`, `district`, `city`) VALUES
(26, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(27, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(28, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(29, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(30, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(31, 'p', '', 'p', 'p'),
(32, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(33, 'p', '', 'p', 'p'),
(34, 'p', '', 'p', 'p'),
(35, 'p', '', 'p', 'p'),
(36, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(37, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(38, '123ABC', 'HD', 'Nguyen trai', 'HN'),
(39, 'o', 'Nguy?n trãi', 'hd', 'o'),
(40, 'b', 'Nguy?n trãi', 'b', 'b'),
(41, 'x', 'Nguy?n trãi', 'x', 'x'),
(42, '14', 'Cáº©áº©m pháº£', 'Cáº©m ÄÃ´ng', NULL),
(43, '14', 'Cáº©m Pháº£', 'Cáº©m ÄÃ´ng', NULL),
(44, '14', 'Cáº©m Pháº£', 'Cáº©m ÄÃ´ng', NULL),
(45, '14', 'Cáº©m Pháº£', 'Cáº©m ÄÃ´ng', NULL),
(46, '14', 'Cáº©m Pháº£', 'Cáº©m ÄÃ´ng', NULL),
(47, 'Tam', 'ChÃ­', 'Quá»c', NULL),
(48, 'Tam', 'ChÃ­', 'Quá»c', NULL),
(49, '1 Lê Ph?ng Hi?u', 'Hoàn Ki?m', 'Tràng Ti?n', 'Hà N?i'),
(50, '1 Lê Ph?ng Hi?u', 'Hoàn Ki?m', 'Tràng Ti?n', 'Hà N?i'),
(51, '1 Lê Ph?ng Hi?u', 'Hoàn Ki?m', 'Tràng Ti?n', 'Hà N?i'),
(52, '1 Lê Ph?ng Hi?u', 'Hoàn Ki?m', 'Tràng Ti?n', 'Hà N?i'),
(53, '1 Lê Ph?ng Hi?u', 'Hoàn Ki?m', 'Tràng Ti?n', 'Hà N?i'),
(54, '1 Lê Ph?ng Hi?u', 'Hoàn Ki?m', 'Tràng Ti?n', 'Hanoi'),
(55, '1', 'Trang Tien', 'Hoan Kiem', 'Ha Noi'),
(56, '1', 'Trang Tien', 'Hoan Kiem', 'Ha Noi');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE IF NOT EXISTS `tbladmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(5) NOT NULL,
  `fullnameID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `shiftID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `username`, `password`, `fullnameID`, `addressID`, `shiftID`) VALUES
(1, 'a', 'a', 1, 1, 1),
(2, 'a', 'a', 1, 1, 1),
(3, 'daodat', 'dyt', 16, 16, 1),
(4, 'daodat', 'dyt', 17, 17, 2),
(5, 'daodat', 'dyt', 18, 18, 5);

-- --------------------------------------------------------

--
-- Table structure for table `tblauthor`
--

CREATE TABLE IF NOT EXISTS `tblauthor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(250) DEFAULT NULL,
  `gender` bit(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tblauthor`
--

INSERT INTO `tblauthor` (`id`, `author_name`, `gender`, `description`) VALUES
(1, '1', '49', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tblbill`
--

CREATE TABLE IF NOT EXISTS `tblbill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) NOT NULL,
  `staffID` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblbook`
--

CREATE TABLE IF NOT EXISTS `tblbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `display_price` float DEFAULT NULL,
  `published_date` date DEFAULT NULL,
  `description` text,
  `stock_qtt` int(11) DEFAULT NULL,
  `image_url` varchar(200) NOT NULL,
  `title_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `publisher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tblbook`
--

INSERT INTO `tblbook` (`id`, `display_price`, `published_date`, `description`, `stock_qtt`, `image_url`, `title_id`, `category_id`, `author_id`, `publisher_id`) VALUES
(2, 123, '1993-05-13', 'oke', NULL, 'big_pic.jpg', 1, 2, 1, 1),
(3, 123, '1993-05-13', 'oke', NULL, 'thumb1.gif', 2, 2, 1, 1),
(4, 123, '1993-05-13', 'ngu quá', NULL, 'thumb2.gif', 3, 2, 1, 1),
(5, 123, '1993-05-13', 'ngu quá', NULL, 'thumb1.gif', 4, 2, 1, 1),
(6, 123, '1995-12-11', '1', NULL, 'prod2.gif', 5, 3, 1, 1),
(7, 12, '1995-12-11', 'qqq', NULL, 'thumb3.gif', 1, 2, 1, 1),
(8, 123, '1995-12-11', 'thumb2.gif', NULL, 'prod1.gif', 2, 2, 1, 1),
(9, 123, '1995-12-11', '1', NULL, 'big_pic.jpg', 3, 2, 1, 1),
(10, 123, '1995-12-11', 's', NULL, 'prod2.gif', 4, 3, 1, 1),
(11, 123, '1993-05-13', 'thumb2.gif', 0, 'thumb3.gif', 5, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE IF NOT EXISTS `tblcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `category_name`, `description`) VALUES
(2, 'kiem hiep', 'rất hay'),
(3, 'Tiểu thuyết', 'rất hay');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartment`
--

CREATE TABLE IF NOT EXISTS `tbldepartment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `alias` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbldepartment`
--

INSERT INTO `tbldepartment` (`id`, `name`, `description`, `alias`) VALUES
(8, 'Nhập kho', 'Nhập sách, thống kê sách trong kho', 'NHAPKHO'),
(9, 'Giao hàng', 'đi giao hàng', 'GIAOHANG'),
(10, 'Bán hàng', 'Bán hàng trong cửa hàng', 'BANHANG'),
(11, 'Kế toán', 'Thống kê sổ sách, tính tiền lương cho nhân viên', 'KETOAN');

-- --------------------------------------------------------

--
-- Table structure for table `tbldownloaded`
--

CREATE TABLE IF NOT EXISTS `tbldownloaded` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebookID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblnamesurname`
--

CREATE TABLE IF NOT EXISTS `tblnamesurname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) DEFAULT NULL,
  `mid_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `tblnamesurname`
--

INSERT INTO `tblnamesurname` (`id`, `first_name`, `mid_name`, `last_name`) VALUES
(47, 'Äá» ', 'Äá»©c', 'TÃº'),
(48, 'Äá»', 'Äá»©c', 'TÃº'),
(49, 'Äá»', 'Äá»©c', 'TÃº'),
(50, 'Hoa', 'ÄÃ ', 'Tiá»n sinh'),
(51, 'Hoa', 'ÄÃ ', 'Tiá»n sinh'),
(52, 'T?ng', 'Hoài ', 'Duy'),
(53, 'T?ng', 'Hoài ', 'Duy'),
(54, 'T?ng', 'Hoài ', 'Duy'),
(55, 'T?ng', 'Hoài ', 'Duy'),
(56, 'T?ng', 'Hoài ', 'Duy'),
(57, 'T?ng', 'Hoài ', 'Duy'),
(58, 'Do', 'Phuong', 'Anh'),
(59, 'Do', 'Phuong', 'Anh');

-- --------------------------------------------------------

--
-- Table structure for table `tblnews`
--

CREATE TABLE IF NOT EXISTS `tblnews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE IF NOT EXISTS `tblorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `receiver_address` varchar(250) DEFAULT NULL,
  `receiver_name` varchar(50) DEFAULT NULL,
  `receiver_phoneno` varchar(20) DEFAULT NULL,
  `note` text,
  `total_price` double DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`id`, `status`, `receiver_address`, `receiver_name`, `receiver_phoneno`, `note`, `total_price`, `user_id`) VALUES
(2, 0, 'PTIT', 'DUy', NULL, NULL, 0, 4),
(3, 0, 'PTIT', 'DUy', '0912932669', NULL, 123, 4),
(4, 0, 'bbbbbb', 'aaaaa', '01687265242', 'leuleu', 123, 4),
(5, 0, '2', '2', '22222222', '2', 123, 4),
(6, 0, 'def', 'abc', '01685117579', '', 123, 7);

-- --------------------------------------------------------

--
-- Table structure for table `tblorderdetail`
--

CREATE TABLE IF NOT EXISTS `tblorderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tblorderdetail`
--

INSERT INTO `tblorderdetail` (`id`, `book_id`, `quantity`, `price`, `order_id`) VALUES
(1, 2, 1, 123, 2),
(2, 2, 1, 123, 3),
(3, 2, 1, 123, 4),
(4, 2, 1, 123, 5),
(5, 3, 1, 123, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tblpublisher`
--

CREATE TABLE IF NOT EXISTS `tblpublisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(250) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tblpublisher`
--

INSERT INTO `tblpublisher` (`id`, `publisher_name`, `address`, `description`) VALUES
(1, 'thanh nien', 'Thanh niên', 'thanh niên online');

-- --------------------------------------------------------

--
-- Table structure for table `tblshift`
--

CREATE TABLE IF NOT EXISTS `tblshift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startTime` date NOT NULL,
  `endTime` date NOT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `tblshift`
--

INSERT INTO `tblshift` (`id`, `startTime`, `endTime`, `salary`) VALUES
(5, '1993-05-13', '1993-06-12', 345678),
(6, '1993-05-13', '1993-06-12', 345678),
(7, '1993-05-13', '1993-06-12', 345678),
(8, '1993-05-13', '1993-06-12', 345678),
(9, '1993-05-13', '1993-06-12', 345678),
(10, '1993-05-13', '1993-06-12', 345678),
(11, '1993-05-13', '1993-06-12', 345678),
(12, '1993-05-13', '1993-06-12', 345678),
(13, '1993-05-13', '1993-06-12', 345678),
(14, '1993-05-13', '1993-06-12', 345678),
(15, '1993-05-13', '1993-06-12', 345678),
(16, '1993-05-13', '1993-06-12', 345678),
(17, '1993-05-13', '1993-06-12', 345678),
(18, '1993-05-13', '1993-06-12', 345678),
(19, '1993-05-13', '1993-06-12', 345678),
(20, '1993-05-13', '1993-06-12', 345678),
(21, '1993-05-13', '1993-06-12', 345678),
(22, '1993-05-13', '1993-06-12', 345678),
(23, '1993-05-13', '1993-06-12', 345678),
(24, '1993-05-13', '1993-06-12', 345678),
(25, '1993-05-13', '1993-06-12', 345678),
(26, '1993-09-13', '2015-05-13', 1234),
(27, '1993-09-13', '2015-05-13', 1234);

-- --------------------------------------------------------

--
-- Table structure for table `tblstaff`
--

CREATE TABLE IF NOT EXISTS `tblstaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `departmentID` int(11) NOT NULL,
  `fullnameID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  `shiftID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tblstaff`
--

INSERT INTO `tblstaff` (`id`, `username`, `password`, `departmentID`, `fullnameID`, `addressID`, `shiftID`) VALUES
(5, 'daodat', 'dyt', 1, 30, 30, 16),
(6, 'daodat', 'dyt', 1, 31, 31, 17),
(7, 'daodat', 'dyt', 1, 32, 32, 18),
(8, 'daodat', 'dyt', 1, 33, 33, 19),
(9, 'daodat', 'dyt', 1, 34, 29, 20),
(10, 'daodat', 'dyt', 1, 35, 30, 21),
(11, 'daodat', 'dyt', 1, 37, 32, 22),
(12, 'daodat', 'dyt', 1, 41, 36, 23),
(13, 'daodat', 'dyt', 1, 42, 37, 24),
(14, 'daodat', 'dyt', 1, 43, 38, 25),
(15, 'b', 'b', 1, 45, 40, 26),
(16, 'x', 'x', 8, 46, 41, 27);

-- --------------------------------------------------------

--
-- Table structure for table `tbltitle`
--

CREATE TABLE IF NOT EXISTS `tbltitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbltitle`
--

INSERT INTO `tbltitle` (`id`, `name`, `description`) VALUES
(1, 'Conan', 'Truyện tranh'),
(2, 'tối nay ăn gì', 'không ăn gì'),
(3, 'Naruto', 'Truy?n tranh'),
(4, 'Yaiba', 'Truy?n tranh'),
(5, 'Yugi oh', 'Truy?n tranh');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE IF NOT EXISTS `tbluser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `dob` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `permission` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `name_surname_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`id`, `username`, `password`, `email`, `dob`, `gender`, `permission`, `address_id`, `name_surname_id`) VALUES
(1, '1', '1', '1', '2015-03-10', 1, 2, 49, 52),
(3, '1', '1', '1', '2015-03-10', 1, 2, 51, 54),
(4, 'duybuffet', '123456', 'duyth1993@gmail.com', '1993-09-01', 1, 0, 52, 55),
(5, 'duybuffet', '123456', 'duyth1993@gmail.com', '1993-09-01', 1, 0, 53, 56),
(6, 'duybuffet2222', '123456', 'meoham_410@yahoo.com.vn', '1990-01-01', 1, 0, 54, 57),
(7, 'pia', '123456', 'daydreaming016@gmail.com', '1993-12-24', 2, 0, 55, 58),
(8, 'pia', '123456', 'daydreaming016@gmail.com', '1993-12-24', 2, 0, 56, 59);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
