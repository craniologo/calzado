-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 14, 2022 at 11:49 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calzado`
--

-- --------------------------------------------------------

--
-- Table structure for table `box`
--

CREATE TABLE `box` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `box`
--

INSERT INTO `box` (`id`, `ref_id`, `admin_id`, `created_at`) VALUES
(1, 1, 2, '2021-07-07 16:02:04'),
(2, 2, 2, '2021-07-07 16:12:43'),
(3, 1, 4, '2021-07-07 16:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` text COLLATE latin1_spanish_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `admin_id`) VALUES
(1, 'NIKE', 1),
(2, 'TIGRE', 1),
(3, 'PLATANITOS', 1),
(4, 'ADIDAS', 1),
(5, 'I-RUN', 1),
(6, 'SKYBANG', 1),
(7, 'REEBOK', 1),
(8, 'PUMA', 1),
(9, 'SKECHERS', 1),
(10, 'NEW BALANCE', 1),
(11, 'CATERPILLAR', 1),
(12, 'CONVERSE', 1),
(13, 'FILA', 1),
(14, 'ASICS', 1),
(15, 'CAT', 1),
(16, 'VENUS', 1),
(17, 'UMBRO', 1),
(18, 'UNDER ARMOUR', 1),
(19, 'VANS', 1),
(20, 'DIBOXZ', 1),
(21, 'PerÃº', 4),
(22, 'Nike', 2),
(23, 'Calimod', 4);

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_spanish_ci NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`, `admin_id`) VALUES
(1, 'Azul', 1),
(2, 'Verde', 1),
(3, 'Violeta', 1),
(4, 'Negro', 1),
(5, 'Blanco', 1),
(6, 'MIckey', 1),
(7, 'Rosado', 1),
(8, 'Rojo', 1),
(9, 'Palo Rosa', 1),
(10, 'Verde Limón', 1),
(11, 'Amarillo', 1),
(12, 'Naranja', 1),
(13, 'MarrÃ³n', 1),
(14, 'Beige', 4),
(15, 'Negro', 2),
(16, 'MarÃ³n', 4);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `user_from` int(11) NOT NULL,
  `user_to` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `operation`
--

CREATE TABLE `operation` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `stock_destination_id` int(11) DEFAULT NULL,
  `operation_from_id` int(11) DEFAULT NULL,
  `q` float DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `price_in` double DEFAULT NULL,
  `price_out` double DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT NULL,
  `sell_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`id`, `product_id`, `stock_id`, `stock_destination_id`, `operation_from_id`, `q`, `size_id`, `price_in`, `price_out`, `operation_type_id`, `sell_id`, `status`, `is_draft`, `admin_id`, `created`, `created_at`) VALUES
(1, 1, 2, NULL, NULL, 10, 8, NULL, NULL, 1, NULL, 1, 0, 2, '2021-07-07', '2021-07-07 15:07:45'),
(2, 2, 2, NULL, NULL, 20, 9, NULL, NULL, 1, NULL, 1, 0, 2, '2021-07-07', '2021-07-07 15:07:45'),
(4, 1, 1, NULL, NULL, 2, 8, NULL, NULL, 2, 2, 1, 0, 2, '2021-07-07', '2021-07-07 15:50:47'),
(5, 2, 2, NULL, NULL, 2, 9, NULL, NULL, 2, 3, 1, 0, 2, '2021-07-07', '2021-07-07 16:03:50'),
(6, 3, 3, NULL, NULL, 30, 11, NULL, NULL, 1, NULL, 1, 0, 4, '2021-07-07', '2021-07-07 16:17:55'),
(7, 4, 3, NULL, NULL, 40, 12, NULL, NULL, 1, NULL, 1, 0, 4, '2021-07-07', '2021-07-07 16:17:55'),
(8, 3, 1, NULL, NULL, 3, 11, NULL, NULL, 2, 4, 1, 0, 4, '2021-07-07', '2021-07-07 16:19:10'),
(9, 5, 1, NULL, NULL, 5, 1, NULL, NULL, 1, NULL, 1, 0, 1, '2021-09-29', '2021-09-29 17:40:13'),
(10, 5, 1, NULL, NULL, 2, 1, NULL, NULL, 2, 5, 1, 0, 1, '2021-09-29', '2021-09-29 17:40:45'),
(11, 3, 1, NULL, NULL, 1, 11, NULL, NULL, 2, 6, 1, 0, 4, '2021-11-26', '2021-11-26 14:43:44'),
(12, 5, 1, NULL, NULL, 17, 1, NULL, NULL, 1, 7, 1, 0, 1, '2022-01-30', '2022-01-30 17:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `operation_type`
--

CREATE TABLE `operation_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `operation_type`
--

INSERT INTO `operation_type` (`id`, `name`) VALUES
(1, 'Entrada'),
(2, 'Salida'),
(3, 'Entrada-pendiente'),
(4, 'Salida-pendiente'),
(5, 'Devolucion'),
(6, 'Traspaso'),
(7, 'Reajuste');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `kind` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`, `lastname`, `ruc`, `address`, `phone`, `email`, `kind`, `user_id`, `admin_id`, `created_at`) VALUES
(1, 'Pablo', 'Marmol', '0', 'Cajamarca', '0', 'pmarmol@gmail.com', 1, 3, 2, '2021-07-07 15:18:24'),
(2, 'Pedro', 'Picapiedra', '0', 'Piedradura', '0', 'ppicapiedra@gmail.com', 1, 4, 4, '2021-07-07 16:18:57'),
(3, 'Micky', 'RatÃ³n', '0', 'Av. San salvador 6823 Jalisco', '987654321', 'demo@gmail.com', 1, 1, 1, '2021-09-29 17:40:36'),
(4, 'Pedro ', 'Suarez', '0', 'Lima', '0', 'pesuarez@gmail.com', 2, 1, 1, '2022-01-15 20:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `barcode` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modelo` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `sex` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `color_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `price_in` double NOT NULL,
  `price_out` double NOT NULL,
  `ubication` text COLLATE utf8_spanish_ci,
  `admin_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `barcode`, `image`, `modelo`, `sex`, `color_id`, `brand_id`, `size_id`, `qty`, `stock_min`, `price_in`, `price_out`, `ubication`, `admin_id`, `created_at`) VALUES
(1, '12201159', 'zapatilla_2.jpg', 'Verano 2021', 'Masculino', 15, 22, 8, 10, 5, 45, 80, 'Columna 1 estante 5', 2, '2021-07-07 15:07:45'),
(2, '22201159', 'zapatilla_3.jpg', 'Verano 2021', 'Masculino', 15, 22, 9, 20, 5, 45, 80, 'Columna 1 estante 5', 2, '2021-07-07 15:07:45'),
(3, '323011611', 'zapato.jpg', 'Vestir 2021', 'Masculino', 16, 23, 11, 30, 5, 50, 90, 'Estante 1 CajÃ³n A', 4, '2021-07-07 16:17:55'),
(4, '423011612', 'zapato_1.jpg', 'Vestir 2021', 'Masculino', 16, 23, 12, 40, 5, 50, 90, 'Estante 1 CajÃ³n A', 4, '2021-07-07 16:17:55'),
(5, '5402111', NULL, 'Verano 2023', 'Femenino', 11, 4, 1, 5, 5, 10, 40, 'Columna 1 estante 5', 1, '2021-09-29 17:40:13');

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `sell_from_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `stock_id` int(11) DEFAULT NULL,
  `operation_type_id` int(11) DEFAULT '2',
  `box_id` int(11) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  `pay` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `iva` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `is_draft` tinyint(1) NOT NULL DEFAULT '0',
  `stock_to_id` int(11) DEFAULT NULL,
  `stock_from_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created` date NOT NULL DEFAULT '2021-06-24',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sell`
--

INSERT INTO `sell` (`id`, `ref_id`, `sell_from_id`, `person_id`, `stock_id`, `operation_type_id`, `box_id`, `p_id`, `d_id`, `pay`, `total`, `cash`, `iva`, `discount`, `is_draft`, `stock_to_id`, `stock_from_id`, `status`, `user_id`, `admin_id`, `created`, `created_at`) VALUES
(2, 1, NULL, 1, 2, 2, 1, NULL, NULL, 90, 118, 120, NULL, 42, 0, NULL, NULL, 1, 2, 2, '2021-07-07', '2021-07-07 15:50:47'),
(3, 2, NULL, 1, 2, 2, 2, NULL, NULL, 90, 118, 120, NULL, 42, 0, NULL, NULL, 1, 3, 2, '2021-07-07', '2021-07-07 16:03:50'),
(4, 1, NULL, 2, 3, 2, 3, NULL, NULL, 150, 270, 270, NULL, 0, 0, NULL, NULL, 1, 4, 4, '2021-07-07', '2021-07-07 16:19:10'),
(5, 1, NULL, 3, 1, 2, NULL, NULL, NULL, 20, 80, 80, NULL, 0, 0, NULL, NULL, 1, 1, 1, '2021-09-29', '2021-09-29 17:40:45'),
(6, 2, NULL, 2, 3, 2, NULL, NULL, NULL, 50, 80, 80, NULL, 10, 0, NULL, NULL, 1, 4, 4, '2021-11-26', '2021-11-26 14:43:44'),
(7, 1, NULL, 4, NULL, 1, NULL, NULL, NULL, NULL, 170, NULL, NULL, NULL, 0, NULL, NULL, 1, 1, 1, '2022-01-30', '2022-01-30 17:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `serie_size`
--

CREATE TABLE `serie_size` (
  `id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `serie_size`
--

INSERT INTO `serie_size` (`id`, `serie_id`, `size`, `admin_id`) VALUES
(1, 1, 15, 1),
(2, 2, 16, 1),
(3, 3, 20, 1),
(4, 4, 30, 1),
(5, 5, 40, 1),
(6, 6, 50, 1),
(7, 1, 8, 2),
(8, 2, 10, 2),
(9, 2, 11, 2),
(10, 1, 13, 4),
(11, 2, 16, 4),
(12, 2, 17, 4);

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ruc` int(12) NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` int(13) NOT NULL,
  `tax` int(2) NOT NULL,
  `coin` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `image`, `company`, `ruc`, `address`, `phone`, `tax`, `coin`, `note`, `admin_id`) VALUES
(1, 'logo700x300.jpg', 'MI EMPRESA', 0, 'MI DIRECCION', 0, 18, '$', 'Mi descripciÃ³n', 1),
(2, 'sergestec_700x160_1.jpg', 'MI EMPRESA', 0, 'MI DIRECCION', 0, 18, 'S/', 'Detalles de la nota', 2),
(3, NULL, 'CALZABOOM EIRL', 2147483647, 'Av San SebastiÃ¡n 1639 - La colmena', 930431610, 10, '$$', '.', 4);

-- --------------------------------------------------------

--
-- Table structure for table `spend`
--

CREATE TABLE `spend` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spend`
--

INSERT INTO `spend` (`id`, `name`, `price`, `user_id`, `admin_id`, `created_at`) VALUES
(1, 'Papitas fritas', 30, 4, 4, '2021-11-26 14:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_principal` tinyint(1) NOT NULL,
  `admin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `name`, `address`, `phone`, `email`, `is_principal`, `admin_id`) VALUES
(1, 'MI SUCURSAL', 'MI CALLE', 'MI TELEFONO', 'eabanto2@hotmail.com', 1, 1),
(2, 'MI SUCURSAL', 'MI CALLE', 'MI TELEFONO', 'demo@gmail.com', 1, 2),
(3, 'MI SUCURSAL', 'MI CALLE', 'MI TELEFONO', 'ppalotes@gmail.com', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `kind` int(11) NOT NULL DEFAULT '1',
  `stock_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `limit_users` int(2) NOT NULL DEFAULT '3',
  `limit_services` int(2) NOT NULL DEFAULT '50',
  `counter` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `status`, `kind`, `stock_id`, `admin_id`, `limit_users`, `limit_services`, `counter`, `created_at`) VALUES
(1, 'Edgar', 'Abanto', 'eabanto2@hotmail.com', 'eabanto2@hotmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, 1, 1, 1, 1, 3, 50, 14, '2021-07-07 13:43:12'),
(2, 'Usuario', 'Demo', 'demo@gmail.com', 'demo@gmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', NULL, 1, 1, 2, 2, 3, 50, 3, '2021-07-07 13:44:12'),
(3, 'Micky', 'RatÃ³n', 'miky@gmail.com', 'demo@gmail.commiky', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '', 1, 2, 2, 2, 3, 50, 4, '2021-07-07 13:45:00'),
(4, 'Perico', 'Palotes', 'ppalotes@gmail.com', 'ppalotes@gmail.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', '', 1, 1, 3, 4, 3, 50, 5, '2021-07-07 16:14:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`id`),
  ADD KEY `box_ibfk_1` (`admin_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_ibfk_1` (`admin_id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_ibfk_1` (`admin_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `operation_ibfk_1` (`admin_id`),
  ADD KEY `operation_ibfk_2` (`product_id`);

--
-- Indexes for table `operation_type`
--
ALTER TABLE `operation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_ibfk_1` (`admin_id`),
  ADD KEY `person_ibfk_2` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `size_id` (`size_id`),
  ADD KEY `user_id` (`admin_id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_ibfk_2` (`person_id`),
  ADD KEY `sell_ibfk_1` (`user_id`),
  ADD KEY `sell_ibfk_3` (`admin_id`);

--
-- Indexes for table `serie_size`
--
ALTER TABLE `serie_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serie_size_ibfk_1` (`admin_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_ibfk_1` (`admin_id`);

--
-- Indexes for table `spend`
--
ALTER TABLE `spend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spend_ibfk_1` (`admin_id`),
  ADD KEY `spend_ibfk_2` (`user_id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_ibfk_1` (`admin_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `operation_type`
--
ALTER TABLE `operation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sell`
--
ALTER TABLE `sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `serie_size`
--
ALTER TABLE `serie_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `spend`
--
ALTER TABLE `spend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `box`
--
ALTER TABLE `box`
  ADD CONSTRAINT `box_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `color`
--
ALTER TABLE `color`
  ADD CONSTRAINT `color_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `operation`
--
ALTER TABLE `operation`
  ADD CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `product_ibfk_5` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_6` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `sell_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `serie_size`
--
ALTER TABLE `serie_size`
  ADD CONSTRAINT `serie_size_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `setting`
--
ALTER TABLE `setting`
  ADD CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `spend`
--
ALTER TABLE `spend`
  ADD CONSTRAINT `spend_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `spend_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
