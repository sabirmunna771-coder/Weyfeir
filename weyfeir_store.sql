-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2026 at 09:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weyfeir_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `fullName`, `email`, `phoneNumber`, `password`, `role`, `created_at`) VALUES
(2, 'Sabir Hussain', 'sabirmunna771@gmail.com', '0355545070771', '1234', 'customer', '2026-03-29 06:04:03'),
(5, 'Hussain', 'sabirmunna7@gmail.com', '23452345098', '1234', 'customer', '2026-03-29 06:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `sender` enum('customer','seller') NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_url` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `customer_id`, `seller_id`, `sender`, `message`, `created_at`, `image_url`) VALUES
(1, 2, 2, 'customer', 'ello', '2026-03-31 13:36:23', NULL),
(2, 2, 2, 'customer', 'sdfsd', '2026-03-31 13:49:46', NULL),
(3, 2, 1, 'customer', 'asfd\\', '2026-03-31 13:50:47', NULL),
(4, 2, 1, 'seller', 'elllo', '2026-03-31 13:51:00', NULL),
(5, 2, 1, 'customer', '', '2026-03-31 14:07:41', 'http://localhost:5000/uploads/1774966061445-image_1774471524354.png'),
(6, 2, 1, 'seller', 'ok', '2026-03-31 14:13:02', NULL),
(7, 2, 1, 'customer', 'Hi, I am interested in this product: Men\'s Jacket ($79.99)', '2026-03-31 14:21:23', 'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=300&q=80'),
(8, 2, 1, 'seller', 'yes', '2026-03-31 14:21:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_qty` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `profit` decimal(10,2) NOT NULL,
  `status` varchar(50) DEFAULT 'Active',
  `image_url` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `seller_id`, `title`, `category`, `price`, `stock_qty`, `description`, `profit`, `status`, `image_url`, `created_at`) VALUES
(1, 1, 'Women\'s Blouse', 'Women Clothing & Fashion', 9.99, 50, 'ANRABESS Women Tops Cap Sleeve Textured Dress...', 2.30, 'Active', 'https://images.unsplash.com/photo-1551163943-3f6a855d1153?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(2, 1, 'Men\'s Jacket', 'Men Clothing & Fashion', 79.99, 20, 'High-quality men\'s jacket from our menClothing collection...', 18.40, 'Active', 'https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(3, 1, 'Women\'s Skirt', 'Women Clothing & Fashion', 34.99, 30, 'High-quality women\'s skirt from our womenClothing collection...', 8.05, 'Active', 'https://images.unsplash.com/photo-1583496661160-c5f110d10d15?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(4, 1, 'Women\'s Skirt', 'Women Clothing & Fashion', 34.99, 30, 'Caracilia Skorts for Women Boho Casual Beach Mini...', 8.05, 'Active', 'https://images.unsplash.com/photo-1572804013309-59a88b7e92f1?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(5, 1, 'luvamia Wide Leg Jeans for Women\'s', 'Women Clothing & Fashion', 44.99, 40, 'luvamia Wide Leg Jeans for Women Trendy High Waisted...', 10.35, 'Active', 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(6, 1, 'Women\'s Blouse with Built in Bra', 'Women Clothing & Fashion', 19.99, 60, 'CHICME Women Built-in Bra Tank Tops Sleeveless Casual...', 4.60, 'Active', 'https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(7, 1, 'Men\'s Polo Shirt', 'Men Clothing & Fashion', 29.99, 45, 'High-quality men\'s polo shirt from our menClothing collection...', 6.90, 'Active', 'https://images.unsplash.com/photo-1581655353564-df123a1eb820?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(8, 1, 'Bluetooth Speaker', 'Computers-Cameras-Accessories', 79.99, 100, 'High-quality bluetooth speaker from our electronic collection...', 18.40, 'Active', 'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(9, 1, 'Men\'s T-Shirt', 'Men Clothing & Fashion', 11.99, 80, 'Men\'s t-shirt from our menClothing collection...', 2.76, 'Active', 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(10, 1, 'Women\'s Skirt', 'Women Clothing & Fashion', 34.99, 30, 'Women\'s skirt from our womenClothing collection...', 8.05, 'Active', 'https://images.unsplash.com/photo-1577900232427-18219b9166a0?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(11, 1, 'Women\'s Blouse', 'Women Clothing & Fashion', 14.99, 50, 'High-quality women\'s blouse from our womenClothing...', 3.45, 'Active', 'https://images.unsplash.com/photo-1564584217132-2271feabf3c5?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(12, 1, 'Puzzle', 'Kids & toy', 12.99, 25, 'Butterfly puzzle from our toys collection...', 2.99, 'Active', 'https://images.unsplash.com/photo-1596461404969-9ce20c714228?auto=format&fit=crop&w=300&q=80', '2026-03-31 13:19:59'),
(13, 2, 'Queen', 'bed', 500.00, 100, 'afsd', 100.00, 'Active', 'http://localhost:5000/uploads/1774963314109-image_1774471522330.png', '2026-03-31 13:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phoneNumber` varchar(50) NOT NULL,
  `shopName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idProofType` varchar(100) NOT NULL,
  `role` varchar(50) DEFAULT 'seller',
  `isVerified` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `fullName`, `email`, `phoneNumber`, `shopName`, `password`, `idProofType`, `role`, `isVerified`, `created_at`) VALUES
(1, 'Sabir Hussain', 'sabirmunna771@gmail.com', '03555070771', 'Ello', '1234', 'Id Card', 'seller', 0, '2026-03-29 06:10:07'),
(2, 'sad', 'sabirmunna1@gmail.com', '03555070971', 'NorthMart', '1234', 'Id Card', 'seller', 0, '2026-03-29 06:36:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
