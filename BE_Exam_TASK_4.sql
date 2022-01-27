-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for be_exam_t4
CREATE DATABASE IF NOT EXISTS `be_exam_t4` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `be_exam_t4`;

-- Dumping structure for table be_exam_t4.authors
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table be_exam_t4.authors: ~6 rows (approximately)
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT IGNORE INTO `authors` (`id`, `first_name`, `last_name`) VALUES
	(1, 'WILLIAM', 'FAULKNER'),
	(2, 'JOHN', 'GRISHAM'),
	(3, 'EDITH ', 'WHARTON'),
	(4, 'Ruskin', 'Bond'),
	(5, 'Narotam', 'Sekhsaria'),
	(6, 'Bala Krishna', 'Madhur');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;

-- Dumping structure for table be_exam_t4.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `publish_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table be_exam_t4.books: ~6 rows (approximately)
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT IGNORE INTO `books` (`id`, `author_id`, `book_name`, `publish_date`) VALUES
	(1, 1, 'ABSALOM, ABSALOM!', '2021-01-13 13:47:08'),
	(2, 2, 'A TIME TO KILL', '2021-01-02 13:50:07'),
	(3, 3, 'THE HOUSE OF MIRTH ', '2021-02-24 13:50:15'),
	(4, 4, 'The Ambuja Story: How a Group of Ordinary Men Created an Extraordinary Company', '2021-03-03 09:56:39'),
	(5, 5, 'At Home In The Universe', '2021-03-11 09:56:48'),
	(6, 6, 'Writing for My Life', '2022-01-27 09:58:38');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Dumping structure for view be_exam_t4.task_4
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `task_4` (
	`First Name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Last Name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Book Name` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`Publish Date` TIMESTAMP NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view be_exam_t4.task_4
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `task_4`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `task_4` AS SELECT distinct authors.first_name AS "First Name", authors.last_name AS "Last Name",books.book_name AS "Book Name", books.publish_date AS "Publish Date"

FROM authors 
INNER JOIN books ON authors.id = books.id

WHERE books.publish_date >= "2021-01-01 00:00:00" AND books.publish_date <= "2021-02-01 00:00:00" ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
