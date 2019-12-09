-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2019 at 09:58 PM
-- Server version: 5.6.34
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `l2c`
--
CREATE DATABASE IF NOT EXISTS `l2c` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `l2c`;

-- --------------------------------------------------------

--
-- Table structure for table `loginhistory`
--

CREATE TABLE `loginhistory` (
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `unique_id` varchar(50) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `client` varchar(25) NOT NULL,
  `sno` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loginhistory`
--

INSERT INTO `loginhistory` (`username`, `password`, `unique_id`, `salt`, `created_at`, `client`, `sno`) VALUES
('ivan@test.mk', 'proba', '548812', '592', '0000-00-00 00:00:00', 'Lazarus', 26),
('ivan@test.mk', 'proba', '715188', '843', '0000-00-00 00:00:00', 'Lazarus', 27),
('ivan@test.mk', 'proba', '602762', '857', '0000-00-00 00:00:00', 'Lazarus', 28),
('ivan@test.mk', 'proba', '548812', '592', '0000-00-00 00:00:00', 'Lazarus', 29),
('test@test.mk', 'test', '548812', '592', '0000-00-00 00:00:00', 'Lazarus', 30),
('ivan@test.mk', 'proba', '548812', '592', '0000-00-00 00:00:00', 'Lazarus', 31),
('ivan@test.mk', 'proba', '15482498', 'as6d598s1', '2019-06-05 17:00:00', 'Android', 32),
('ivan@test.mk', 'proba', '15482498', 'as6d598s1', '2019-06-05 17:00:00', 'Android', 33);

-- --------------------------------------------------------

--
-- Table structure for table `names`
--

CREATE TABLE `names` (
  `sno` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `unique_id` varchar(3) NOT NULL,
  `surname` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `names`
--

INSERT INTO `names` (`sno`, `name`, `email`, `created_at`, `unique_id`, `surname`) VALUES
(2, 'Ivan', 'ivan@test.mk', '2019-05-26 18:47:42', '2ce', 'Vasilevski'),
(9, 'Ana-Marija', 'anamarija@gmail.com', '2019-06-05 17:18:03', '9ma', 'Petrushevska'),
(10, 'Predrag', 'nikolikj@hotmail.com', '2019-06-05 17:18:27', '10n', 'Nikolikj');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `sno` int(11) NOT NULL,
  `unique_id` varchar(23) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `encrypted_password` varchar(256) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `password` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`sno`, `unique_id`, `name`, `email`, `encrypted_password`, `salt`, `created_at`, `password`) VALUES
(20, '5ceac1f77a1390.39518010', 'Ivan', 'ivan@test.mk', '$2y$10$ofwno1KV.yeJ3A/0IUpN3uIrg5VTQehT0YANAGliJI6px/7pu.Rmi', '87808aa0b7', '2019-05-26 18:42:31', 'proba'),
(37, '5cf7dd2b6f8f98.25430326', 'Ana-Marija', 'anamarija@gmail.com', '$2y$10$WT6EJ7Wc/dTF4V8ILTvSNejZleE/MgUcWI.jsCpW3wBE7ZDRme41S', '8e94e861eb', '2019-06-05 17:18:03', 'anamarija'),
(38, '5cf7dd43573464.26889042', 'Predrag', 'nikolikj@hotmail.com', '$2y$10$z4377DZlt/vmwYx7M6AAHOnu7tuOhk3Faa1U4fBFHJ23OWwBP07N6', '24cce6b719', '2019-06-05 17:18:27', 'predrag');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `loginhistory`
--
ALTER TABLE `loginhistory`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `names`
--
ALTER TABLE `names`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `loginhistory`
--
ALTER TABLE `loginhistory`
  MODIFY `sno` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `names`
--
ALTER TABLE `names`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
