-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 01:41 PM
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
-- Database: `restdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `people` int(11) NOT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `email`, `phone`, `date`, `time`, `people`, `message`) VALUES
(1, 'Indrit', 'ditiboyboy@gmail.com', '093058349348', '2024-05-31', '22:31:00', 4, 'Dinner for 4');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `ingredients` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`, `category`, `image`, `ingredients`) VALUES
(7, 'Angel', 9000.00, 'Desert', '', 'A lot of red bull and pizzas and shrek'),
(8, 'Margherita Pizza', 11.99, 'Pizza', '', 'Pizza dough, tomato sauce, fresh mozzarella cheese, basil leaves, olive oil'),
(9, 'Chicken Alfredo Pasta', 13.49, 'Pasta', '', 'Fettuccine pasta, grilled chicken breast, Alfredo sauce, Parmesan cheese, garlic, butter'),
(10, 'Classic Cheeseburger', 9.99, 'Burgers', '', 'Beef patty, cheddar cheese, lettuce, tomato, onion, pickles, ketchup, mustard, sesame seed bun'),
(11, 'Caprese Salad', 7.99, 'Salad', '', 'Fresh tomatoes, mozzarella cheese, fresh basil leaves, balsamic glaze, olive oil, salt, pepper'),
(12, 'Chicken Tikka Masala', 12.99, 'Indian', '', 'Chicken thighs, yogurt, tomato sauce, onion, garlic, ginger, garam masala, cumin, coriander, cream'),
(13, 'Shrimp Scampi', 15.99, 'Seafood', '', 'Shrimp, linguine pasta, garlic, white wine, lemon juice, parsley, butter, olive oil'),
(14, 'Vegetable Lasagna', 10.99, 'Vegetarian', '', 'Lasagna noodles, marinara sauce, ricotta cheese, mozzarella cheese, spinach, zucchini, mushrooms, bell peppers'),
(15, 'Beef Stir-Fry', 11.49, 'Asian', '', 'Beef sirloin, bell peppers, broccoli, carrots, snow peas, soy sauce, garlic, ginger, sesame oil'),
(16, 'Mushroom Risotto', 12.99, 'Italian', '', 'Arborio rice, mushrooms, onion, garlic, white wine, vegetable broth, Parmesan cheese, butter'),
(17, 'Cobb Salad', 10.99, 'Salad', '', 'Lettuce, grilled chicken breast, avocado, bacon, hard-boiled eggs, tomato, blue cheese, ranch dressing'),
(18, 'Veggie Burger', 8.99, 'Vegetarian', '', 'Veggie patty, lettuce, tomato, onion, pickles, ketchup, mustard, whole wheat bun'),
(19, 'Fish Tacos', 13.49, 'Mexican', '', 'Fish fillets (cod or tilapia), taco seasoning, corn tortillas, cabbage slaw, avocado, lime wedges, cilantro'),
(20, 'Chicken Caesar Wrap', 9.99, 'Wraps', '', 'Grilled chicken breast, romaine lettuce, Caesar dressing, Parmesan cheese, flour tortilla'),
(21, 'Teriyaki Salmon', 14.99, 'Asian', '', 'Salmon fillet, teriyaki sauce, sesame seeds, green onions, jasmine rice, steamed broccoli'),
(22, 'BBQ Pulled Pork Sandwich', 11.49, 'Sandwiches', '', 'Pulled pork, barbecue sauce, coleslaw, brioche bun'),
(23, 'Margherita Flatbread', 10.99, 'Pizza', '', 'Flatbread, tomato sauce, fresh mozzarella cheese, cherry tomatoes, fresh basil, balsamic glaze'),
(24, 'Greek Salad', 8.99, 'Salad', '', 'Lettuce, tomato, cucumber, red onion'),
(25, 'Premium', 121.00, 'Pasta', '', 'A lot of things'),
(27, 'Basic', 9000.00, 'Pasta', '', 'A lot of red bull and pizzas and shrek'),
(32, 'dish2', 499.00, 'Pasta', '', 'A lot of red bull and pizzas');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(75) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `type`) VALUES
(5, 'diti_ferati', 'indritferati04@gmail.com', '$2y$10$HAporaPmG0PIm51teP/HoO5fjdQIlNnDIIlmsZTIWP37P5AfP9EoG', 'admin'),
(8, 'client', 'cli@gmail.com', '$2y$10$OmYIfDmBGaTRVUrrV5y4aOoSH2UP7y2N3mABmJhYouoRd8vctVvDG', 'client'),
(10, 'erii', 'eir@gmail.com', '$2y$10$ksag1gwJgeKdjcTe4Uf/LORAvno7ql8c.vzLtaZTmq81sSmwKbGpO', 'client'),
(11, 'Thanas', 'tpapa@gmail.com', '$2y$10$8rEnakAuXuRp7hcToOzTbuNL6utcxTtCZ9tXiDkAmvTA13Gq1fKVu', 'client');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
