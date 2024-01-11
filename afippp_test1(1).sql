-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-afippp.alwaysdata.net
-- Generation Time: Jan 11, 2024 at 01:44 PM
-- Server version: 10.6.14-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `afippp_test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `rue` varchar(50) NOT NULL,
  `code postalle` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`id`, `pays`, `ville`, `rue`, `code postalle`) VALUES
(144, 'france', 'lyon', '40 Rue des Antonins', '69100 ');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `id_order_detaill` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `id_user`, `order_date`, `id_order_detaill`) VALUES
(348, 55, '2024-01-09', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_detaill`
--

CREATE TABLE `orders_detaill` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quentite` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_detaill`
--

INSERT INTO `orders_detaill` (`id`, `id_product`, `quentite`) VALUES
(1, 58, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `prix` float(10,2) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `prix`, `stock`) VALUES
(58, 'carte mère', 'Marque 	MSI\nSocket du CPU 	Socket AM5\nAppareils compatibles 	Ordinateur personnel\nTechnologie de mémoire RAM 	DDR5\nProcesseurs compatibles 	Ryzen 7000 series\nType de chipset 	AMD 7000\nVitesse d\'horloge de mémoire 	5600 MHz\nPlateforme 	Windows 11\nNom de modèle 	MAG B650 TOMAHAWK WIFI\nCapacité de stockage de la mémoire 	128 Go', 239.00, 152),
(59, 'redmi note 10', 'Xiaomi Redmi Note 10 5G 128 Go Gris graphite ', 155.00, 73);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `Iname` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `phone number` varchar(13) NOT NULL,
  `id_adress` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fname`, `Iname`, `mail`, `phone number`, `id_adress`) VALUES
(55, 'dumas', 'tristan', 'tristan.dumas@gmail.com', '0652489654', 144);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`) USING BTREE,
  ADD KEY `id_order_detaill` (`id_order_detaill`);

--
-- Indexes for table `orders_detaill`
--
ALTER TABLE `orders_detaill`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_adress` (`id_adress`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT for table `orders_detaill`
--
ALTER TABLE `orders_detaill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_order_detaill`) REFERENCES `orders_detaill` (`id`);

--
-- Constraints for table `orders_detaill`
--
ALTER TABLE `orders_detaill`
  ADD CONSTRAINT `orders_detaill_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_adress`) REFERENCES `adress` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
