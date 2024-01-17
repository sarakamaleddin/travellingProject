-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 09:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travellingproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone_number` int(30) NOT NULL,
  `num_of_guests` int(10) NOT NULL,
  `checkin_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `destination` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `city_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `payment` varchar(40) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `phone_number`, `num_of_guests`, `checkin_date`, `destination`, `status`, `city_id`, `user_id`, `payment`, `created_at`) VALUES
(1, 'James', 87433570, 3, '0000-00-00 00:00:00.000000', 'Berlin', 'pending', 2, 1, '', '2024-01-02 19:20:44'),
(2, 'John', 987654, 2, '0000-00-00 00:00:00.000000', 'Frankfurt', 'pending', 3, 1, '', '2024-01-02 19:20:44'),
(3, 'David', 44456597, 2, '0000-00-00 00:00:00.000000', 'Berlin', 'pending', 2, 1, '', '2024-01-02 19:47:21'),
(4, 'George', 34637564, 4, '0000-00-00 00:00:00.000000', 'Giza', 'pending', 1, 1, '', '2024-01-02 20:27:26'),
(5, 'Sarah', 2147483647, 2, '2024-01-13 10:53:22.972057', 'Frankfurt', 'Pending', 3, 1, '', '2024-01-13 10:48:20'),
(6, 'Adam', 4567890, 2, '2024-01-13 11:39:11.071404', 'Frankfurt', 'Pending', 3, 1, '1000', '2024-01-13 11:37:45'),
(17, 'Sandy', 2147483647, 2, '2024-01-21 22:00:00.000000', 'Berlin', 'Pending', 2, 1, '900', '2024-01-14 11:54:18'),
(18, 'Ahmad', 2147483647, 3, '2024-01-29 22:00:00.000000', 'Sharm el sheikh', 'Pending', 4, 1, '1296', '2024-01-16 12:51:28'),
(19, 'Mira', 2147483647, 2, '2024-02-07 22:00:00.000000', 'Giza', 'Pending', 1, 1, '400', '2024-01-16 13:14:17');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `trip_days` int(4) NOT NULL,
  `price` varchar(4) NOT NULL,
  `country_id` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `image`, `trip_days`, `price`, `country_id`, `created_at`) VALUES
(1, 'Giza', 'giza.jpg', 4, '200', 1, '2024-01-02 16:32:54'),
(2, 'Berlin', 'berlin.jpg', 6, '450', 2, '2024-01-02 16:32:54'),
(3, 'Frankfurt', 'frankfurt.jpg', 5, '500', 2, '2024-01-02 17:18:40'),
(4, 'Sharm el sheikh', 'sharmelsheikh.jpg', 6, '432', 1, '2024-01-02 17:21:03'),
(5, 'Byblos', 'byblos.jpeg', 3, '150', 3, '2024-01-16 20:45:40'),
(6, 'Tyre', 'tyre.jpg', 4, '180', 3, '2024-01-16 20:45:40');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `continent` varchar(200) NOT NULL,
  `population` varchar(30) NOT NULL,
  `territory` varchar(30) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `image`, `continent`, `population`, `territory`, `description`, `created_at`) VALUES
(1, 'Egypt', 'egypt.png', 'Africa', '110', '1.002', 'Egypt (Arabic: مصر Miṣr [mesˁr], Egyptian Arabic pronunciation: [mɑsˤr]), officially the Arab Republic of Egypt, is a transcontinental country spanning the northeast corner of Africa and the Sinai Peninsula in the southwest corner of Asia.', '2024-01-02 16:19:44'),
(2, 'Germany', 'germany.png', 'Europe', '83.2', '357.592', 'Germany, officially the Federal Republic of Germany, is a country in the western region of Central Europe. It is the second-most populous country in Europe after Russia,[g] and the most populous member state of the European Union. Germany lies between the Baltic and North Sea to the north and the Alps to the south.', '2024-01-02 16:19:44'),
(3, 'Lebanon', 'lebanon.png', 'Asia', '5', '10.452', 'Lebanon is a country in West Asia.\r\nLocated in the Levant region of the Eastern Mediterranean, the country has a population of more than five million people and covers an area of 10,452 square kilometres (4,036 sq mi). Lebanon\'s capital and largest city is Beirut, followed by Tripoli and Jounieh. While Arabic is the official language, French is also recognized in a formal capacity;', '2024-01-16 20:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `mypassword` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `mypassword`, `created_at`) VALUES
(1, 'sarahh.kdd', 'sarakamaldin@gmail.com', '$2y$10$GjT0HiHrUuIwep5qEVsbVu.rWPovihRo4wGSskpi8RbRgq/5Vcud.', '2024-01-02 11:28:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
