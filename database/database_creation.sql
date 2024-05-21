-- Database creation
CREATE DATABASE IF NOT EXISTS `restaurantdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Switch to the created database
USE `restaurantdb`;

-- Create Client table
CREATE TABLE IF NOT EXISTS `Client` (
  `ClientID` INT AUTO_INCREMENT PRIMARY KEY,
  `ClientName` VARCHAR(50),
  `ClientSurname` VARCHAR(50),
  `Username` VARCHAR(50) UNIQUE,
  `Email` VARCHAR(100),
  `Password` VARCHAR(255),
  `Type` VARCHAR(50),
);

-- Create Country table
CREATE TABLE IF NOT EXISTS `Menu` (
  `MenuID` INT AUTO_INCREMENT PRIMARY KEY,
  `MenuName` VARCHAR(100),
  `MenuPrice` TEXT,
  `MenuCategory` TEXT,
  `MenuImage` TEXT,
  `MenuIngredients` TEXT,
);
