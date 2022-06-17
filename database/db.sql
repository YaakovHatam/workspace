-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2022 at 08:46 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `code` varchar(8) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `code`) VALUES
(10, 'AAA 123'),
(8, 'ABCD 222'),
(11, 'BBBB 123'),
(7, 'XFGF 087'),
(9, 'XYZT 123');

-- --------------------------------------------------------

--
-- Table structure for table `booking_journies`
--

CREATE TABLE `booking_journies` (
  `booking_id` int(11) NOT NULL,
  `journey_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking_journies`
--

INSERT INTO `booking_journies` (`booking_id`, `journey_key`) VALUES
(11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `booking_passengers`
--

CREATE TABLE `booking_passengers` (
  `booking_id` int(11) NOT NULL,
  `passenger_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `booking_passengers`
--

INSERT INTO `booking_passengers` (`booking_id`, `passenger_key`) VALUES
(7, 4),
(8, 6),
(8, 7),
(9, 8),
(9, 9),
(10, 10),
(10, 11),
(11, 12),
(11, 13);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_key` int(11) NOT NULL,
  `aircraft` enum('A320','A380','Boeing707','Boeing717','Boeing737') COLLATE utf8_bin NOT NULL,
  `arrive_date` date NOT NULL,
  `arrive_station` varchar(11) COLLATE utf8_bin NOT NULL,
  `departure_date` date NOT NULL,
  `departure_station` varchar(11) COLLATE utf8_bin NOT NULL,
  `number` varchar(11) COLLATE utf8_bin NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_key`, `aircraft`, `arrive_date`, `arrive_station`, `departure_date`, `departure_station`, `number`, `price`) VALUES
(1, 'Boeing707', '2022-06-07', 'JFK', '2022-06-14', 'TLV', 'NY001', 180),
(2, 'Boeing707', '2022-06-07', 'JFK', '2022-06-14', 'TLV', 'NY001', 180),
(3, 'Boeing707', '2022-06-07', 'JFK', '2022-06-14', 'TLV', 'NY001', 180);

-- --------------------------------------------------------

--
-- Table structure for table `journey`
--

CREATE TABLE `journey` (
  `journey_key` int(11) NOT NULL,
  `arrive_date` date NOT NULL,
  `arrive_station` varchar(11) COLLATE utf8_bin NOT NULL,
  `departure_date` date NOT NULL,
  `departure_station` varchar(11) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `flight_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `journey`
--

INSERT INTO `journey` (`journey_key`, `arrive_date`, `arrive_station`, `departure_date`, `departure_station`, `description`, `flight_key`) VALUES
(1, '2022-06-07', 'JFK', '2022-06-14', 'TLV', 'nice trip to shlomo house', 1),
(2, '2022-06-07', 'JFK', '2022-06-14', 'TLV', 'nice trip to shlomo house', 3);

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `passenger_key` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `email` varchar(11) COLLATE utf8_bin NOT NULL,
  `name` varchar(11) COLLATE utf8_bin NOT NULL,
  `passenger_type` enum('Male','Female','Infant','Unknown') COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_key`, `age`, `email`, `name`, `passenger_type`) VALUES
(4, 23, 'pass1@mail.', 'passaenger ', 'Male'),
(5, 30, 'pass2@mail.', 'passaenger ', 'Female'),
(6, 23, 'pass3@mail.', 'passaenger ', 'Male'),
(7, 30, 'pass4@mail.', 'passaenger ', 'Female'),
(8, 23, 'pass3@mail.', 'passaenger ', 'Male'),
(9, 30, 'pass4@mail.', 'passaenger ', 'Female'),
(10, 23, 'pass3@mail.', 'passaenger ', 'Male'),
(11, 30, 'pass4@mail.', 'passaenger ', 'Female'),
(12, 23, 'pass3@mail.', 'passaenger ', 'Male'),
(13, 30, 'pass4@mail.', 'passaenger ', 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `booking_journies`
--
ALTER TABLE `booking_journies`
  ADD PRIMARY KEY (`booking_id`,`journey_key`),
  ADD KEY `fk_booking_journies_journey_key` (`journey_key`);

--
-- Indexes for table `booking_passengers`
--
ALTER TABLE `booking_passengers`
  ADD PRIMARY KEY (`booking_id`,`passenger_key`),
  ADD KEY `fk_booking_passengers_passenger_key` (`passenger_key`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_key`);

--
-- Indexes for table `journey`
--
ALTER TABLE `journey`
  ADD PRIMARY KEY (`journey_key`),
  ADD KEY `flight_id` (`flight_key`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passenger_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `journey`
--
ALTER TABLE `journey`
  MODIFY `journey_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passenger_key` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_journies`
--
ALTER TABLE `booking_journies`
  ADD CONSTRAINT `fk_booking_journies_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `fk_booking_journies_journey_key` FOREIGN KEY (`journey_key`) REFERENCES `journey` (`journey_key`);

--
-- Constraints for table `booking_passengers`
--
ALTER TABLE `booking_passengers`
  ADD CONSTRAINT `fk_booking_passengers_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  ADD CONSTRAINT `fk_booking_passengers_passenger_key` FOREIGN KEY (`passenger_key`) REFERENCES `passenger` (`passenger_key`);

--
-- Constraints for table `journey`
--
ALTER TABLE `journey`
  ADD CONSTRAINT `fk_journey_flight_key` FOREIGN KEY (`flight_key`) REFERENCES `flight` (`flight_key`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
