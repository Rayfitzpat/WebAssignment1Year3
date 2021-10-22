-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2021 at 01:26 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `films`
--

-- --------------------------------------------------------

--
-- Table structure for table `filmlist`
--

CREATE TABLE `filmlist` (
  `id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL,
  `yearReleased` int(4) NOT NULL,
  `category` varchar(25) NOT NULL,
  `director` varchar(30) NOT NULL,
  `producer` varchar(30) NOT NULL,
  `star` varchar(30) NOT NULL,
  `coStar` varchar(30) NOT NULL,
  `grossBoxOffice` bigint(14) NOT NULL,
  `oscarNominations` int(2) NOT NULL,
  `oscarWins` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `filmlist`
--

INSERT INTO `filmlist` (`id`, `name`, `yearReleased`, `category`, `director`, `producer`, `star`, `coStar`, `grossBoxOffice`, `oscarNominations`, `oscarWins`) VALUES
(1, 'The Matrix', 1999, 'Sci-fi', 'The Wachowski\'s', 'Joel Silver', 'Keanu Reeves', 'Carrie Ann Moss', 465300000, 4, 4),
(2, 'The Shawshank Redemption', 1995, 'Drama', 'Frank Darabont', 'Niki Marvin', 'Tim Robbins', 'Morgan Freeman', 58300000, 7, 0),
(3, 'Inception', 2010, 'Sci-fi', 'Christopher Nolan', 'Emma Thomas', 'Leonardo DiCaprio', 'Joseph Gordon Levitt', 836800000, 8, 4),
(4, 'Dead Poets Society', 1989, 'Drama', 'Peter Weir', 'Steven Haft', 'Robin Williams', 'Ethan Hawke', 95860000, 4, 1),
(5, 'Seven', 1995, 'Thriller', 'David Fincher', 'Stephen Brown', 'Morgan Freeman', 'Brad Pitt', 10010000, 1, 0),
(6, 'The Usual Suspects', 1995, 'Thriller', 'Bryan Singer', 'Hans Brockmann', 'Kevin Spacey', 'Gabriel Byrne', 23340000, 2, 2),
(7, 'Braveheart', 1995, 'Drama', 'Mel Gibson', 'Bruce Davey', 'Mel Gibson', 'Sophie Marceau', 75600000, 10, 5),
(8, 'Twelve Monkeys', 1995, 'Sci-fi', 'Terry Gilliam', 'Robert Carvallo', 'Bruce Willis', 'Brad Pitt', 57140000, 2, 0),
(9, 'Good Will Hunting', 1997, 'Drama', 'Gus Van Sant', 'Su Armstrong', 'Robin Williams', 'Matt Damon', 138430000, 9, 2),
(10, 'Snatch', 2000, 'Comedy', 'Guy Ritchie', 'Michael Dreyer', 'Jason Statham', 'Brad Pitt', 30330000, 0, 0),
(11, 'LOTR The Fellowship of the Ring', 2001, 'Drama', 'Peter Jackson', 'Peter Jackson', 'Ian McKellen', 'Elijah Wood', 315540000, 13, 4),
(12, 'LOTR The Return of The King', 2003, 'Drama', 'Peter Jackson', 'Peter Jackson', 'Ian McKellen', 'Elijah Wood', 377850000, 11, 11),
(13, 'Arrival', 2016, 'Sci-fi', 'Denis Vileneuve', '', 'Amy Adams', 'Jeremy Renner', 24074047, 8, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `filmlist`
--
ALTER TABLE `filmlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `filmlist`
--
ALTER TABLE `filmlist`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
