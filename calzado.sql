-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 18, 2025 at 02:32 AM
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
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `box`
--

INSERT INTO `box` (`id`, `created_at`) VALUES
(1, '2021-04-19 16:27:55');

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` text COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'NIKE'),
(2, 'TIGRE'),
(3, 'PLATANITOS'),
(4, 'ADIDAS'),
(5, 'I-RUN'),
(6, 'SKYBANG'),
(7, 'REEBOK'),
(8, 'PUMA'),
(9, 'SKECHERS'),
(10, 'NEW BALANCE'),
(11, 'CATERPILLAR'),
(12, 'CONVERSE'),
(13, 'FILA'),
(14, 'ASICS'),
(15, 'CAT'),
(16, 'VENUS'),
(17, 'UMBRO'),
(18, 'UNDER ARMOUR'),
(19, 'VANS'),
(20, 'DIBOXZ'),
(21, 'IPANEMA');

-- --------------------------------------------------------

--
-- Table structure for table `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `color`
--

INSERT INTO `color` (`id`, `name`) VALUES
(1, 'Azul'),
(2, 'Verde'),
(3, 'Violeta'),
(4, 'Negro'),
(5, 'Blanco'),
(6, 'MIckey'),
(7, 'Rosado'),
(8, 'Rojo'),
(9, 'Palo Rosa'),
(10, 'Verde Limón'),
(11, 'Amarillo'),
(12, 'Naranja'),
(13, 'MarrÃ³n'),
(14, 'Uu');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `short` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind` int(11) NOT NULL,
  `val` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `short`, `name`, `kind`, `val`) VALUES
(1, 'company_name', 'Nombre de la empresa', 2, 'UNIVERSAL TECNOLOGÃAS Y CONSULTORES SAC'),
(2, 'title', 'Titulo del Sistema', 2, 'UNIVERSAL TECNOLOGÃAS Y CONSULTORES SAC'),
(3, 'ticket_title', 'Titulo en el Ticket', 2, 'UNIVERSAL TECNOLOGÃAS Y CONSULTORES SAC'),
(4, 'admin_email', 'Email Administracion', 2, 'correo@gmail.com'),
(5, 'report_image', 'Imagen en Reportes', 4, 'Penguins.jpg'),
(6, 'imp-name', 'Nombre Impuesto', 2, 'IVA'),
(7, 'imp-val', 'Valor Impuesto (%)', 2, '10'),
(8, 'currency', 'Simbolo de Moneda', 2, '$'),
(9, 'confirmation', 'Confirmacion', 2, '654321'),
(10, 'address', 'Direccion', 2, 'Cajamarca'),
(11, 'phone', 'TelÃ©fono', 2, '987654321'),
(12, 'note', 'Nota de factura', 6, '1. El producto debe estar en condiciones aptas para su venta (sin uso, sin armar, en el empaque original, catÃ¡logos, manuales y todas sus piezas).\r\n2. Debe presentar la factura de pago de compra, en caso de no contar con ella, puede solicitar la constancia y/o certificado de compra.\r\n3. El plazo mÃ¡ximo para solicitar el cambio de productos serÃ¡ de 30 dÃ­as calendario a partir de la fecha de compra.\r\n4. PodrÃ¡ realizar la devoluciÃ³n en nuestros almacenes.\r\n5. Para productos comprados por telÃ©fono o internet, que no han sido recibidos, comunÃ­quese a las lÃ­neas telefÃ³nicas: 02 2334098  02 2331381.\r\n6. No se aceptarÃ¡n cambios o devoluciones de productos diseÃ±ados, cortados o elaborados a la medida, bajo especificaciones particulares.\r\n7. La devoluciÃ³n se realizarÃ¡ a travÃ©s de una nota de crÃ©dito equivalente al valor real pagado por el producto.\r\n8. Las compras realizadas en la pÃ¡gina de internet www.casadelperno.com y venta telefÃ³nica estÃ¡n sujetas al Derecho de retracto.');

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
  `created` date NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operation`
--

INSERT INTO `operation` (`id`, `product_id`, `stock_id`, `stock_destination_id`, `operation_from_id`, `q`, `size_id`, `price_in`, `price_out`, `operation_type_id`, `sell_id`, `status`, `is_draft`, `created`, `created_at`) VALUES
(1, 1, 1, NULL, NULL, 3, 26, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:22:20'),
(2, 2, 1, NULL, NULL, 5, 27, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:22:21'),
(3, 3, 1, NULL, NULL, 7, 29, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:22:21'),
(4, 4, 1, NULL, NULL, 4, 2, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:32:26'),
(5, 5, 1, NULL, NULL, 7, 9, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:32:26'),
(6, 6, 1, NULL, NULL, 3, 10, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:32:26'),
(7, 7, 1, NULL, NULL, 6, 11, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:32:26'),
(8, 8, 1, NULL, NULL, 8, 12, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:32:26'),
(9, 9, 1, NULL, NULL, 5, 13, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:32:26'),
(10, 10, 1, NULL, NULL, 3, 1, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:34:56'),
(11, 11, 1, NULL, NULL, 5, 4, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:34:56'),
(12, 12, 1, NULL, NULL, 4, 5, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:34:56'),
(13, 13, 1, NULL, NULL, 7, 6, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:34:56'),
(14, 14, 1, NULL, NULL, 4, 7, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:34:56'),
(15, 15, 1, NULL, NULL, 3, 8, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:34:56'),
(16, 16, 1, NULL, NULL, 5, 1, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:39:38'),
(17, 17, 1, NULL, NULL, 4, 4, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:39:38'),
(18, 18, 1, NULL, NULL, 3, 5, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:39:38'),
(19, 19, 1, NULL, NULL, 8, 6, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:39:38'),
(20, 20, 1, NULL, NULL, 3, 7, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:39:38'),
(21, 21, 1, NULL, NULL, 2, 8, NULL, NULL, 1, NULL, 1, 0, '2020-12-18', '2020-12-18 12:39:38'),
(25, 3, 1, NULL, NULL, 2, 29, NULL, NULL, 2, 1, 1, 0, '2020-12-18', '2020-12-18 12:43:18'),
(26, 19, 1, NULL, NULL, 2, 6, NULL, NULL, 2, 1, 1, 0, '2020-12-18', '2020-12-18 12:43:18'),
(27, 8, 1, NULL, NULL, 2, 12, NULL, NULL, 2, 1, 1, 0, '2020-12-18', '2020-12-18 12:43:18'),
(28, 2, 2, NULL, NULL, 2, 27, NULL, NULL, 2, 2, 1, 0, '2020-12-18', '2020-12-18 12:46:01'),
(29, 5, 1, NULL, NULL, 2, 9, NULL, NULL, 2, 3, 1, 0, '2020-12-18', '2020-12-18 12:47:20'),
(30, 19, 1, NULL, NULL, 1, 6, NULL, NULL, 2, 3, 1, 0, '2020-12-18', '2020-12-18 12:47:20'),
(31, 7, 1, NULL, NULL, 3, 11, NULL, NULL, 2, 3, 1, 0, '2020-12-18', '2020-12-18 12:47:20'),
(32, 5, 1, NULL, NULL, 3, 9, NULL, NULL, 2, 4, 1, 0, '2020-12-21', '2020-12-21 09:58:29'),
(33, 9, 1, NULL, NULL, 2, 13, NULL, NULL, 2, 4, 1, 0, '2020-12-21', '2020-12-21 09:58:29'),
(34, 8, 2, NULL, NULL, 3, 12, NULL, NULL, 2, 5, 1, 0, '2020-12-25', '2020-12-25 15:43:04'),
(35, 3, 2, NULL, NULL, 2, 29, NULL, NULL, 2, 5, 1, 0, '2020-12-25', '2020-12-25 15:43:04'),
(36, 19, 2, NULL, NULL, 2, 6, NULL, NULL, 2, 5, 1, 0, '2020-12-25', '2020-12-25 15:43:04'),
(37, 12, 1, NULL, NULL, 2, 5, NULL, NULL, 2, 6, 1, 0, '2020-12-27', '2020-12-27 08:38:18'),
(38, 11, 1, NULL, NULL, 3, 4, NULL, NULL, 2, 6, 1, 0, '2020-12-27', '2020-12-27 08:38:18'),
(39, 22, 1, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 0, '2021-01-02', '2021-01-02 12:22:07'),
(40, 23, 1, NULL, NULL, 1, 4, NULL, NULL, 1, NULL, 1, 0, '2021-01-02', '2021-01-02 12:22:07'),
(41, 24, 1, NULL, NULL, 1, 5, NULL, NULL, 1, NULL, 1, 0, '2021-01-02', '2021-01-02 12:22:07'),
(42, 25, 1, NULL, NULL, 1, 6, NULL, NULL, 1, NULL, 1, 0, '2021-01-02', '2021-01-02 12:22:07'),
(43, 26, 1, NULL, NULL, 1, 7, NULL, NULL, 1, NULL, 1, 0, '2021-01-02', '2021-01-02 12:22:07'),
(44, 27, 1, NULL, NULL, 0, 8, NULL, NULL, 1, NULL, 1, 0, '2021-01-02', '2021-01-02 12:22:07'),
(45, 13, 1, NULL, NULL, 3, 6, NULL, NULL, 2, 7, 1, 0, '2021-01-05', '2021-01-05 21:27:49'),
(46, 20, 1, NULL, NULL, 2, 7, NULL, NULL, 2, 7, 1, 0, '2021-01-05', '2021-01-05 21:27:49'),
(47, 23, 1, NULL, NULL, 5, 4, NULL, NULL, 1, 8, 1, 0, '2021-01-05', '2021-01-05 21:28:26'),
(48, 2, 2, NULL, NULL, 2, 27, NULL, NULL, 2, 9, 1, 0, '2021-01-13', '2021-01-13 07:21:17'),
(49, 4, 2, NULL, NULL, 2, 2, NULL, NULL, 2, 9, 1, 0, '2021-01-13', '2021-01-13 07:21:17'),
(50, 23, 1, NULL, NULL, 3, 4, NULL, NULL, 2, 10, 1, 0, '2021-01-16', '2021-01-16 18:45:25'),
(51, 16, 1, NULL, NULL, 2, 1, NULL, NULL, 2, 10, 1, 0, '2021-01-16', '2021-01-16 18:45:25'),
(52, 28, 1, NULL, NULL, 1, 2, NULL, NULL, 1, NULL, 1, 0, '2021-01-19', '2021-01-19 16:40:35'),
(53, 29, 1, NULL, NULL, 2, 9, NULL, NULL, 1, NULL, 1, 0, '2021-01-19', '2021-01-19 16:40:36'),
(54, 30, 1, NULL, NULL, 2, 10, NULL, NULL, 1, NULL, 1, 0, '2021-01-19', '2021-01-19 16:40:37'),
(55, 31, 1, NULL, NULL, 2, 11, NULL, NULL, 1, NULL, 1, 0, '2021-01-19', '2021-01-19 16:40:39'),
(56, 32, 1, NULL, NULL, 2, 12, NULL, NULL, 1, NULL, 1, 0, '2021-01-19', '2021-01-19 16:40:40'),
(57, 33, 1, NULL, NULL, 1, 13, NULL, NULL, 1, NULL, 1, 0, '2021-01-19', '2021-01-19 16:40:41'),
(58, 33, 1, NULL, NULL, 1, 13, NULL, NULL, 2, 11, 1, 0, '2021-01-19', '2021-01-19 16:42:20'),
(59, 33, 1, NULL, NULL, 5, 2, NULL, NULL, 1, NULL, 1, 0, '2021-02-02', '2021-02-02 14:45:54'),
(60, 33, 1, NULL, NULL, 5, 9, NULL, NULL, 1, NULL, 1, 0, '2021-02-02', '2021-02-02 14:45:54'),
(61, 33, 1, NULL, NULL, 5, 10, NULL, NULL, 1, NULL, 1, 0, '2021-02-02', '2021-02-02 14:45:54'),
(62, 33, 1, NULL, NULL, 5, 11, NULL, NULL, 1, NULL, 1, 0, '2021-02-02', '2021-02-02 14:45:54'),
(63, 33, 1, NULL, NULL, 5, 12, NULL, NULL, 1, NULL, 1, 0, '2021-02-02', '2021-02-02 14:45:54'),
(64, 33, 1, NULL, NULL, 5, 13, NULL, NULL, 1, NULL, 1, 0, '2021-02-02', '2021-02-02 14:45:54'),
(65, 40, 1, NULL, NULL, 2, 2, NULL, NULL, 1, NULL, 1, 0, '2021-02-04', '2021-02-04 14:52:34'),
(66, 41, 1, NULL, NULL, 2, 9, NULL, NULL, 1, NULL, 1, 0, '2021-02-04', '2021-02-04 14:52:34'),
(67, 42, 1, NULL, NULL, 2, 10, NULL, NULL, 1, NULL, 1, 0, '2021-02-04', '2021-02-04 14:52:34'),
(68, 43, 1, NULL, NULL, 2, 11, NULL, NULL, 1, NULL, 1, 0, '2021-02-04', '2021-02-04 14:52:35'),
(69, 44, 1, NULL, NULL, 2, 12, NULL, NULL, 1, NULL, 1, 0, '2021-02-04', '2021-02-04 14:52:35'),
(70, 45, 1, NULL, NULL, 2, 13, NULL, NULL, 1, NULL, 1, 0, '2021-02-04', '2021-02-04 14:52:35'),
(71, 13, 1, NULL, NULL, 2, 6, NULL, NULL, 2, 12, 1, 0, '2021-02-15', '2021-02-15 06:38:36'),
(72, 6, 1, NULL, NULL, 2, 10, NULL, NULL, 2, 12, 1, 0, '2021-02-15', '2021-02-15 06:38:36'),
(73, 45, 1, NULL, NULL, 1, 13, NULL, NULL, 2, 12, 1, 0, '2021-02-15', '2021-02-15 06:38:36'),
(74, 1, 1, NULL, NULL, 1, 26, NULL, NULL, 2, 13, 1, 0, '2021-02-22', '2021-02-22 17:16:29'),
(75, 17, 1, NULL, NULL, 2, 4, NULL, NULL, 2, 13, 1, 0, '2021-02-22', '2021-02-22 17:16:29'),
(76, 23, 1, NULL, NULL, 2, 4, NULL, NULL, 2, 14, 1, 0, '2021-03-04', '2021-03-04 17:21:46'),
(77, 14, 1, NULL, NULL, 3, 7, NULL, NULL, 2, 14, 1, 0, '2021-03-04', '2021-03-04 17:21:46'),
(78, 46, 1, NULL, NULL, 2, 26, NULL, NULL, 1, NULL, 1, 0, '2021-03-07', '2021-03-07 21:45:16'),
(79, 47, 1, NULL, NULL, 2, 27, NULL, NULL, 1, NULL, 1, 0, '2021-03-07', '2021-03-07 21:45:16'),
(80, 48, 1, NULL, NULL, 2, 29, NULL, NULL, 1, NULL, 1, 0, '2021-03-07', '2021-03-07 21:45:16'),
(83, 1, 1, NULL, NULL, 1, 26, NULL, NULL, 2, 15, 1, 0, '2021-03-10', '2021-03-10 18:45:05'),
(84, 3, 1, NULL, NULL, 2, 29, NULL, NULL, 2, 16, 1, 0, '2021-03-16', '2021-03-16 16:24:15'),
(85, 46, 1, NULL, NULL, 1, 26, NULL, NULL, 2, 16, 1, 0, '2021-03-16', '2021-03-16 16:24:15'),
(86, 2, 1, NULL, NULL, 1, 27, NULL, NULL, 2, 17, 1, 0, '2021-03-22', '2021-03-22 18:07:06'),
(87, 1, 1, NULL, NULL, 1, 26, NULL, NULL, 2, 18, 1, 0, '2021-03-22', '2021-03-22 18:08:09'),
(88, 8, 1, NULL, NULL, 2, 12, NULL, NULL, 2, 19, 1, 0, '2021-03-24', '2021-03-24 07:26:16'),
(89, 15, 1, NULL, NULL, 2, 8, NULL, NULL, 2, 19, 1, 0, '2021-03-24', '2021-03-24 07:26:16'),
(90, 1, 1, NULL, NULL, 20, 26, NULL, NULL, 1, 20, 1, 0, '2021-03-24', '2021-03-24 20:22:33'),
(91, 1, 1, NULL, NULL, 2, 26, NULL, NULL, 2, 21, 1, 0, '2021-03-24', '2021-03-24 20:25:45'),
(92, 1, 1, NULL, NULL, 5, 26, NULL, NULL, 1, 22, 1, 0, '2021-03-24', '2021-03-24 21:04:07'),
(93, 1, 1, NULL, NULL, 2, 26, NULL, NULL, 2, 23, 1, 0, '2021-04-01', '2021-04-01 21:11:58'),
(94, 11, 1, NULL, NULL, 1, 4, NULL, NULL, 2, 23, 1, 0, '2021-04-01', '2021-04-01 21:11:58'),
(95, 51, 1, NULL, NULL, 1, 1, NULL, NULL, 1, NULL, 1, 0, '2021-04-09', '2021-04-09 17:16:11'),
(96, 52, 1, NULL, NULL, 1, 4, NULL, NULL, 1, NULL, 1, 0, '2021-04-09', '2021-04-09 17:16:11'),
(97, 53, 1, NULL, NULL, 1, 5, NULL, NULL, 1, NULL, 1, 0, '2021-04-09', '2021-04-09 17:16:11'),
(98, 54, 1, NULL, NULL, 1, 6, NULL, NULL, 1, NULL, 1, 0, '2021-04-09', '2021-04-09 17:16:11'),
(99, 55, 1, NULL, NULL, 1, 7, NULL, NULL, 1, NULL, 1, 0, '2021-04-09', '2021-04-09 17:16:11'),
(100, 56, 1, NULL, NULL, 1, 8, NULL, NULL, 1, NULL, 1, 0, '2021-04-09', '2021-04-09 17:16:11'),
(103, 57, 1, NULL, NULL, 0, 1, NULL, NULL, 1, NULL, 1, 0, '2021-04-20', '2021-04-20 17:19:57'),
(104, 58, 1, NULL, NULL, 1, 4, NULL, NULL, 1, NULL, 1, 0, '2021-04-20', '2021-04-20 17:19:57'),
(105, 59, 1, NULL, NULL, 0, 5, NULL, NULL, 1, NULL, 1, 0, '2021-04-20', '2021-04-20 17:19:57'),
(106, 60, 1, NULL, NULL, 0, 6, NULL, NULL, 1, NULL, 1, 0, '2021-04-20', '2021-04-20 17:19:57'),
(107, 61, 1, NULL, NULL, 0, 7, NULL, NULL, 1, NULL, 1, 0, '2021-04-20', '2021-04-20 17:19:57'),
(108, 62, 1, NULL, NULL, 0, 8, NULL, NULL, 1, NULL, 1, 0, '2021-04-20', '2021-04-20 17:19:57'),
(109, 63, 1, NULL, NULL, 18, 26, NULL, NULL, 1, NULL, 1, 0, '2021-04-21', '2021-04-21 06:07:04'),
(110, 64, 1, NULL, NULL, 0, 27, NULL, NULL, 1, NULL, 1, 0, '2021-04-21', '2021-04-21 06:07:05'),
(111, 65, 1, NULL, NULL, 0, 29, NULL, NULL, 1, NULL, 1, 0, '2021-04-21', '2021-04-21 06:07:05'),
(112, 66, 1, NULL, NULL, 0, 30, NULL, NULL, 1, NULL, 1, 0, '2021-04-21', '2021-04-21 06:07:05'),
(113, 67, 1, NULL, NULL, 0, 31, NULL, NULL, 1, NULL, 1, 0, '2021-04-21', '2021-04-21 06:07:05'),
(114, 68, 1, NULL, NULL, 0, 32, NULL, NULL, 1, NULL, 1, 0, '2021-04-21', '2021-04-21 06:07:05'),
(115, 42, 1, NULL, NULL, 1, 10, NULL, NULL, 2, 26, 1, 0, '2021-05-18', '2021-05-18 21:35:32'),
(116, 1, 1, NULL, NULL, 3, 26, NULL, NULL, 2, 26, 1, 0, '2021-05-18', '2021-05-18 21:35:32'),
(117, 1, 2, NULL, NULL, 3, 26, NULL, NULL, 2, 27, 1, 0, '2021-06-21', '2021-06-21 14:14:29'),
(118, 18, 2, NULL, NULL, 2, 5, NULL, NULL, 2, 27, 1, 0, '2021-06-21', '2021-06-21 14:14:29'),
(119, 47, 1, NULL, NULL, 1, 27, NULL, NULL, 2, 28, 1, 0, '2021-06-21', '2021-06-21 14:16:02'),
(120, 1, 1, NULL, NULL, 2, 26, NULL, NULL, 2, 28, 1, 0, '2021-06-21', '2021-06-21 14:16:02'),
(121, 1, 1, NULL, NULL, 1, 26, NULL, NULL, 2, 29, 1, 0, '2021-07-04', '2021-07-04 22:33:10'),
(122, 1, 1, NULL, NULL, 4, 26, NULL, NULL, 2, 30, 1, 0, '2021-08-24', '2021-08-24 14:59:46'),
(123, 1, 1, NULL, NULL, 1, 26, NULL, NULL, 2, 31, 1, 0, '2021-09-21', '2021-09-21 13:43:59'),
(124, 5, 1, NULL, NULL, 1, 9, NULL, NULL, 2, 31, 1, 0, '2021-09-21', '2021-09-21 13:43:59'),
(125, 10, 1, NULL, NULL, 2, 1, NULL, NULL, 2, 31, 1, 0, '2021-09-21', '2021-09-21 13:43:59'),
(126, 69, 1, NULL, NULL, 10, 3, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(127, 70, 1, NULL, NULL, 10, 14, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(128, 71, 1, NULL, NULL, 10, 15, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(129, 72, 1, NULL, NULL, 10, 16, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(130, 73, 1, NULL, NULL, 10, 17, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(131, 74, 1, NULL, NULL, 10, 18, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(132, 75, 1, NULL, NULL, 6, 19, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(133, 76, 1, NULL, NULL, 6, 20, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(134, 77, 1, NULL, NULL, 6, 21, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(135, 78, 1, NULL, NULL, 6, 22, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(136, 79, 1, NULL, NULL, 6, 25, NULL, NULL, 1, NULL, 1, 0, '2022-12-22', '2022-12-22 10:53:13'),
(137, 6, 1, NULL, NULL, 1, 10, NULL, NULL, 2, 32, 1, 0, '2022-12-22', '2022-12-22 10:59:24'),
(138, 40, 1, NULL, NULL, 10, 2, NULL, NULL, 1, 33, 1, 0, '2023-01-16', '2023-01-16 13:55:48'),
(139, 1, 1, NULL, NULL, 2, 26, NULL, NULL, 2, 34, 1, 0, '2023-05-31', '2023-05-31 05:43:09');

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
(3, 'entrada-pendiente'),
(4, 'salida-pendiente'),
(5, 'devolucion'),
(6, 'traspaso'),
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
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`, `lastname`, `ruc`, `address`, `phone`, `email`, `kind`, `created_at`) VALUES
(1, 'Pedro', 'Picapiedra', '10411422718', 'Av. Piedradura 123 ', '984239238', 'ppica@gmail.com', 1, '2020-07-24 09:04:40'),
(2, 'Pablo', 'Marmol', '12345678910', 'jr. Andahuaylas 955 int 46 primer nivel', '945904950', 'pmarmol@gmail.com', 2, '2020-07-24 09:09:22'),
(3, 'Martín', 'Adán', '0', 'Av. Los rosales 145', '0', 'madan@gmail.com', 1, '2020-07-28 10:34:28'),
(4, 'Rosa', 'Salas', '0', 'Av. Legión Peruana 143', '0', 'rsalas@gmail.com', 1, '2020-07-30 05:30:53'),
(5, 'Matias', 'Rivera', '0', 'Cll. Los nogales 397', '967453467', 'river023@gmail.com', 1, '2020-08-02 09:39:05'),
(6, 'Ricardo', 'Melendez ', '0', 'Cll. San Geronimo 485 San Borja', '937658665', 'rmel@gmail.com', 1, '2020-08-08 06:13:23'),
(7, 'Víctor', 'Romel', '0', 'Av. Los libertadores 232 Chorrillos', '999999223', 'vromel@gmail.com', 1, '2020-08-18 20:03:55'),
(8, 'David', 'Huari', '0', 'Av. San salvador 126', '0', 'dhuari@gmail.com', 1, '2020-08-19 07:31:43'),
(9, 'Perico ', 'Palotes', '0', '', '', '', 2, '2020-09-04 07:27:34'),
(10, 'Vicente', 'Fernandez', '0', 'Av. Jacarandá 1287', '0', 'vfernandez@gmail.com', 1, '2020-11-19 18:37:32'),
(11, 'Simon', 'Valverde', '0', 'Av. Los ornamentos 435', '967534321', 'svalverde@gmail.com', 1, '2020-11-20 00:07:35'),
(12, 'Israel Genaro', 'Allayca Tenesaca', '0605265263', 'Av Eloy Alfaro y Chile', '', '', 1, '2020-11-20 16:30:08'),
(13, 'Consumidor ', 'Final', '0000000000', 's/n', '', '', 1, '2020-11-20 16:38:40'),
(14, 'israel genaro ', 'allayca tenesaca ', '0605265263', 'oledo y carabobo', '', '', 1, '2020-12-09 11:45:23');

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
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `barcode`, `image`, `modelo`, `sex`, `color_id`, `brand_id`, `size_id`, `qty`, `stock_min`, `price_in`, `price_out`, `ubication`, `user_id`, `created_at`) VALUES
(1, '14014266', 'CR7_4.jpg', 'Cristiano Ronaldo 2015', 'Masculino', 13, 9, 26, 3, 2, 80, 150, 'Columna 166 6 y6g', 1, '2020-12-18 12:22:20'),
(2, '2401427', 'CR7_4_1.jpg', 'Cristiano Ronaldo 2015', 'Masculino', 4, 4, 27, 5, 2, 80, 150, 'Columna 1', 1, '2020-12-18 12:22:21'),
(3, '3401429', 'CR7_4_2.jpg', 'Cristiano Ronaldo 2015', 'Masculino', 4, 4, 29, 7, 2, 80, 150, 'Columna 1', 1, '2020-12-18 12:22:21'),
(4, '440272', 'Fahin_6.jpg', 'Urbano Chick', 'Femenino', 7, 4, 2, 4, 2, 27, 80, 'Columna 2', 1, '2020-12-18 12:32:26'),
(5, '540279', 'Fahin_7.jpg', 'Urbano Chick', 'Femenino', 7, 4, 9, 7, 2, 27, 80, 'Columna 2', 1, '2020-12-18 12:32:26'),
(6, '6402710', 'Fahin_8.jpg', 'Urbano Chick', 'Femenino', 7, 4, 10, 3, 2, 27, 80, 'Columna 2', 1, '2020-12-18 12:32:26'),
(7, '7402711', 'Fahin_9.jpg', 'Urbano Chick', 'Femenino', 7, 4, 11, 6, 2, 27, 80, 'Columna 2', 1, '2020-12-18 12:32:26'),
(8, '8402712', 'Fahin_10.jpg', 'Urbano Chick', 'Femenino', 7, 4, 12, 8, 2, 27, 80, 'Columna 2', 1, '2020-12-18 12:32:26'),
(9, '9402713', 'Fahin_11.jpg', 'Urbano Chick', 'Femenino', 7, 4, 13, 5, 2, 27, 80, 'Columna 2', 1, '2020-12-18 12:32:26'),
(10, '1050141', 'oxford-costura.jpg', 'Moderno vestir', 'Masculino', 4, 5, 1, 3, 2, 43, 145, 'Columna 4', 1, '2020-12-18 12:34:56'),
(11, '1150144', 'oxford-costura_1.jpg', 'Moderno vestir', 'Masculino', 4, 5, 4, 5, 2, 43, 145, 'Columna 4', 1, '2020-12-18 12:34:56'),
(12, '1250145', 'oxford-costura_2.jpg', 'Moderno vestir', 'Masculino', 4, 5, 5, 4, 2, 43, 145, 'Columna 4', 1, '2020-12-18 12:34:56'),
(13, '1350146', 'oxford-costura_3.jpg', 'Moderno vestir', 'Masculino', 4, 5, 6, 7, 2, 43, 145, 'Columna 4', 1, '2020-12-18 12:34:56'),
(14, '1450147', 'oxford-costura_4.jpg', 'Moderno vestir', 'Masculino', 4, 5, 7, 4, 2, 43, 145, 'Columna 4', 1, '2020-12-18 12:34:56'),
(15, '1550148', 'oxford-costura_5.jpg', 'Moderno vestir', 'Masculino', 4, 5, 8, 3, 2, 43, 145, 'Columna 4', 1, '2020-12-18 12:34:56'),
(16, '1670141', 'rural.jpg', 'Caminata Larga', 'Masculino', 4, 7, 1, 5, 2, 80, 250, 'Columna 5', 1, '2020-12-18 12:39:38'),
(17, '1770144', 'rural_1.jpg', 'Caminata Larga', 'Masculino', 4, 7, 4, 4, 2, 80, 250, 'Columna 5', 1, '2020-12-18 12:39:38'),
(18, '1870145', 'rural_2.jpg', 'Caminata Larga', 'Masculino', 4, 7, 5, 3, 2, 80, 250, 'Columna 5', 1, '2020-12-18 12:39:38'),
(19, '1970146', 'rural_3.jpg', 'Caminata Larga', 'Masculino', 4, 7, 6, 8, 2, 80, 250, 'Columna 5', 1, '2020-12-18 12:39:38'),
(20, '2070147', 'rural_4.jpg', 'Caminata Larga', 'Masculino', 4, 7, 7, 3, 2, 80, 250, 'Columna 5', 1, '2020-12-18 12:39:38'),
(21, '2170148', 'rural_5.jpg', 'Caminata Larga', 'Masculino', 4, 7, 8, 2, 2, 80, 250, 'Columna 5', 1, '2020-12-18 12:39:38'),
(22, '2250141', NULL, 'IRUM NEGRO FORWAR', 'Masculino', 4, 5, 1, 1, 0, 25, 30, 'P', 1, '2021-01-02 12:22:07'),
(23, '2350144', NULL, 'IRUM NEGRO FORWAR', 'Masculino', 4, 5, 4, 1, 0, 25, 30, 'P', 1, '2021-01-02 12:22:07'),
(24, '2450145', NULL, 'IRUM NEGRO FORWAR', 'Masculino', 4, 5, 5, 1, 0, 25, 30, 'P', 1, '2021-01-02 12:22:07'),
(25, '2550146', NULL, 'IRUM NEGRO FORWAR', 'Masculino', 4, 5, 6, 1, 0, 25, 30, 'P', 1, '2021-01-02 12:22:07'),
(26, '2650147', NULL, 'IRUM NEGRO FORWAR', 'Masculino', 4, 5, 7, 1, 0, 25, 30, 'P', 1, '2021-01-02 12:22:07'),
(27, '2750148', NULL, 'IRUM NEGRO FORWAR', 'Masculino', 4, 5, 8, 0, 0, 25, 30, 'P', 1, '2021-01-02 12:22:07'),
(28, '2840142', 'F36163-0_2.jpg', '123456', 'Masculino', 4, 4, 2, 1, 1, 100, 150, 'DEP01', 1, '2021-01-19 16:40:35'),
(29, '2940149', 'F36163-0_2_1.jpg', '123456', 'Masculino', 4, 4, 9, 2, 1, 100, 150, 'DEP01', 1, '2021-01-19 16:40:36'),
(30, '30401410', 'F36163-0_2_2.jpg', '123456', 'Masculino', 4, 4, 10, 2, 1, 100, 150, 'DEP01', 1, '2021-01-19 16:40:37'),
(31, '31401411', 'F36163-0_2_3.jpg', '123456', 'Masculino', 4, 4, 11, 2, 1, 100, 150, 'DEP01', 1, '2021-01-19 16:40:39'),
(32, '32401412', 'F36163-0_2_4.jpg', '123456', 'Masculino', 4, 4, 12, 2, 1, 100, 150, 'DEP01', 1, '2021-01-19 16:40:40'),
(33, '33401413', 'F36163-0_2_5.jpg', '123456', 'Masculino', 4, 4, 13, 1, 1, 100, 150, 'DEP01', 1, '2021-01-19 16:40:41'),
(40, '123', 'FB_IMG_1612113648984.jpg', 'PUNTO FORWARD NEGRO CAPSULA ', 'Masculino', 4, 5, 2, 2, 0, 25, 30, 'Percha', 1, '2021-02-04 14:52:34'),
(41, '4150149', 'FB_IMG_1612113648984_1.jpg', 'PUNTO FORWARD NEGRO CAPSULA ', 'Masculino', 4, 5, 9, 2, 0, 25, 30, 'Percha', 1, '2021-02-04 14:52:34'),
(42, '42501410', 'FB_IMG_1612113648984_2.jpg', 'PUNTO FORWARD NEGRO CAPSULA ', 'Masculino', 4, 5, 10, 2, 0, 25, 30, 'Percha', 1, '2021-02-04 14:52:34'),
(43, '43501411', 'FB_IMG_1612113648984_3.jpg', 'PUNTO FORWARD NEGRO CAPSULA ', 'Masculino', 4, 5, 11, 2, 0, 25, 30, 'Percha', 1, '2021-02-04 14:52:35'),
(44, '44501412', 'FB_IMG_1612113648984_4.jpg', 'PUNTO FORWARD NEGRO CAPSULA ', 'Masculino', 4, 5, 12, 2, 0, 25, 30, 'Percha', 1, '2021-02-04 14:52:35'),
(45, '45501413', 'FB_IMG_1612113648984_5.jpg', 'PUNTO FORWARD NEGRO CAPSULA ', 'Masculino', 4, 5, 13, 2, 0, 25, 30, 'Percha', 1, '2021-02-04 14:52:35'),
(46, '3', NULL, 'ORTOPEDICO', 'Masculino', 4, 15, 26, 2, 0, 5, 10, 'perrcha', 1, '2021-03-07 21:45:16'),
(47, '3', NULL, 'ORTOPEDICO', 'Masculino', 4, 15, 27, 2, 0, 5, 10, 'perrcha', 1, '2021-03-07 21:45:16'),
(48, '3', NULL, 'ORTOPEDICO', 'Masculino', 4, 15, 29, 2, 0, 5, 10, 'perrcha', 1, '2021-03-07 21:45:16'),
(51, '500', 'I.jpg', 'IRUM', 'Masculino', 2, 5, 1, 1, 0, 25, 30, 'P', 1, '2021-04-09 17:16:11'),
(52, '500', 'I_1.jpg', 'IRUM', 'Masculino', 2, 5, 4, 1, 0, 25, 30, 'P', 1, '2021-04-09 17:16:11'),
(53, '500', 'I_2.jpg', 'IRUM', 'Masculino', 2, 5, 5, 1, 0, 25, 30, 'P', 1, '2021-04-09 17:16:11'),
(54, '5450126', 'I_3.jpg', 'IRUM', 'Masculino', 2, 5, 6, 1, 0, 25, 30, 'P', 1, '2021-04-09 17:16:11'),
(55, '5550127', 'I_4.jpg', 'IRUM', 'Masculino', 2, 5, 7, 1, 0, 25, 30, 'P', 1, '2021-04-09 17:16:11'),
(56, '5650128', 'I_5.jpg', 'IRUM', 'Masculino', 2, 5, 8, 1, 0, 25, 30, 'P', 1, '2021-04-09 17:16:11'),
(57, '5740111', 'saludo.jpg', '2005', 'Masculino', 1, 4, 1, 0, 90000, 100000, 125000, 'ESTANTE 1', 1, '2021-04-20 17:19:57'),
(58, '5840114', 'saludo_1.jpg', '2005', 'Masculino', 1, 4, 4, 1, 90000, 100000, 125000, 'ESTANTE 1', 1, '2021-04-20 17:19:57'),
(59, '5940115', 'saludo_2.jpg', '2005', 'Masculino', 1, 4, 5, 0, 90000, 100000, 125000, 'ESTANTE 1', 1, '2021-04-20 17:19:57'),
(60, '6040116', 'saludo_3.jpg', '2005', 'Masculino', 1, 4, 6, 0, 90000, 100000, 125000, 'ESTANTE 1', 1, '2021-04-20 17:19:57'),
(61, '6140117', 'saludo_4.jpg', '2005', 'Masculino', 1, 4, 7, 0, 90000, 100000, 125000, 'ESTANTE 1', 1, '2021-04-20 17:19:57'),
(62, '6240118', 'saludo_5.jpg', '2005', 'Masculino', 1, 4, 8, 0, 90000, 100000, 125000, 'ESTANTE 1', 1, '2021-04-20 17:19:57'),
(63, '63401526', NULL, 'LAS ROCAS', 'Masculino', 5, 4, 26, 18, 1, 78, 150, 'ESTANT 1', 1, '2021-04-21 06:07:04'),
(64, '64401527', NULL, 'LAS ROCAS', 'Masculino', 5, 4, 27, 0, 1, 78, 150, 'ESTANT 1', 1, '2021-04-21 06:07:05'),
(65, '65401529', NULL, 'LAS ROCAS', 'Masculino', 5, 4, 29, 0, 1, 78, 150, 'ESTANT 1', 1, '2021-04-21 06:07:05'),
(66, '66401530', NULL, 'LAS ROCAS', 'Masculino', 5, 4, 30, 0, 1, 78, 150, 'ESTANT 1', 1, '2021-04-21 06:07:05'),
(67, '67401531', NULL, 'LAS ROCAS', 'Masculino', 5, 4, 31, 0, 1, 78, 150, 'ESTANT 1', 1, '2021-04-21 06:07:05'),
(68, '68401532', NULL, 'LAS ROCAS', 'Masculino', 5, 4, 32, 0, 1, 78, 150, 'ESTANT 1', 1, '2021-04-21 06:07:05'),
(69, '69150143', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 3, 10, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(70, '701501414', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 14, 10, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(71, '711501415', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 15, 10, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(72, '721501416', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 16, 10, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(73, '731501417', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 17, 10, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(74, '741501418', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 18, 10, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(75, '751501419', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 19, 6, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(76, '761501420', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 20, 6, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(77, '771501421', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 21, 6, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(78, '781501422', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 22, 6, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13'),
(79, '791501425', NULL, 'LAM-4A-03', 'Masculino', 4, 15, 25, 6, 5, 20, 30, 'ALAMCEN GENERAL ', 1, '2022-12-22 10:53:13');

-- --------------------------------------------------------

--
-- Table structure for table `sell`
--

CREATE TABLE `sell` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `sell_from_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
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
  `created_at` datetime DEFAULT NULL,
  `created` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sell`
--

INSERT INTO `sell` (`id`, `ref_id`, `sell_from_id`, `person_id`, `user_id`, `stock_id`, `operation_type_id`, `box_id`, `p_id`, `d_id`, `pay`, `total`, `cash`, `iva`, `discount`, `is_draft`, `stock_to_id`, `stock_from_id`, `status`, `created_at`, `created`) VALUES
(1, 1, NULL, 13, 1, 1, 2, 1, NULL, NULL, 374, 960, 1000, NULL, 0, 0, NULL, NULL, 1, '2020-12-18 12:43:18', '2020-12-18'),
(2, 2, NULL, 8, 2, 2, 2, 1, NULL, NULL, 160, 300, 400, NULL, 0, 0, NULL, NULL, 1, '2020-12-18 12:46:01', '2020-12-18'),
(3, 3, NULL, 10, 3, 1, 2, 1, NULL, NULL, 215, 650, 700, NULL, 0, 0, NULL, NULL, 1, '2020-12-18 12:47:20', '2020-12-18'),
(4, 4, NULL, 5, 3, 1, 2, 1, NULL, NULL, 135, 400, 400, NULL, 0, 0, NULL, NULL, 1, '2020-12-21 09:58:29', '2020-12-21'),
(5, 5, NULL, 11, 2, 2, 2, 1, NULL, NULL, 401, 1040, 1050, NULL, 0, 0, NULL, NULL, 1, '2020-12-25 15:43:04', '2020-12-25'),
(6, 6, NULL, 5, 3, 1, 2, 1, NULL, NULL, 215, 725, 800, NULL, 0, 0, NULL, NULL, 1, '2020-12-27 08:38:18', '2020-12-27'),
(7, 7, NULL, 10, 1, 1, 2, 1, NULL, NULL, 289, 935, 1000, NULL, 0, 0, NULL, NULL, 1, '2021-01-05 21:27:49', '2021-01-05'),
(8, 1, NULL, 9, 1, NULL, 1, NULL, NULL, NULL, NULL, 125, NULL, NULL, NULL, 0, NULL, NULL, 1, '2021-01-05 21:28:26', '2021-01-05'),
(9, 8, NULL, 14, 2, 2, 2, 1, NULL, NULL, 214, 460, 500, NULL, 0, 0, NULL, NULL, 1, '2021-01-13 07:21:17', '2021-01-13'),
(10, 9, NULL, 10, 1, 1, 2, 1, NULL, NULL, 235, 590, 600, NULL, 0, 0, NULL, NULL, 1, '2021-01-16 18:45:25', '2021-01-16'),
(11, 10, NULL, 13, 1, 1, 2, 1, NULL, NULL, 100, 150, 150, NULL, 0, 0, NULL, NULL, 1, '2021-01-19 16:42:20', '2021-01-19'),
(12, 11, NULL, 3, 1, 1, 2, 1, NULL, NULL, 165, 480, 700, NULL, 0, 0, NULL, NULL, 1, '2021-02-15 06:38:36', '2021-02-15'),
(13, 12, NULL, 10, 1, 1, 2, 1, NULL, NULL, 240, 650, 800, NULL, 0, 0, NULL, NULL, 1, '2021-02-22 17:16:29', '2021-02-22'),
(14, 13, NULL, 3, 1, 1, 2, 1, NULL, NULL, 179, 495, 500, NULL, 0, 0, NULL, NULL, 1, '2021-03-04 17:21:46', '2021-03-04'),
(15, 14, NULL, 13, 1, 1, 2, 1, NULL, NULL, 80, 150, 0, NULL, 0, 0, NULL, NULL, 1, '2021-03-10 18:45:05', '2021-03-10'),
(16, 15, NULL, 12, 1, 1, 2, 1, NULL, NULL, 165, 310, 400, NULL, 0, 0, NULL, NULL, 1, '2021-03-16 16:24:15', '2021-03-16'),
(17, 16, NULL, 3, 1, 1, 2, 1, NULL, NULL, 80, 150, 150, NULL, 0, 0, NULL, NULL, 1, '2021-03-22 18:07:06', '2021-03-22'),
(18, 17, NULL, 10, 1, 1, 2, 1, NULL, NULL, 80, 150, 150, NULL, 0, 0, NULL, NULL, 1, '2021-03-22 18:08:09', '2021-03-22'),
(19, 18, NULL, 6, 3, 1, 2, 1, NULL, NULL, 140, 450, 500, NULL, 0, 0, NULL, NULL, 1, '2021-03-24 07:26:16', '2021-03-24'),
(20, 2, NULL, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, 1600, NULL, NULL, NULL, 0, NULL, NULL, 1, '2021-03-24 20:22:33', '2021-03-24'),
(21, 19, NULL, 13, 1, 1, 2, 1, NULL, NULL, 160, 300, 300, NULL, 0, 0, NULL, NULL, 1, '2021-03-24 20:25:45', '2021-03-24'),
(22, 3, NULL, 2, 1, NULL, 1, NULL, NULL, NULL, NULL, 400, NULL, NULL, NULL, 0, NULL, NULL, 1, '2021-03-24 21:04:07', '2021-03-24'),
(23, 20, NULL, 13, 1, 1, 2, 1, NULL, NULL, 203, 445, 15000, NULL, 0, 0, NULL, NULL, 1, '2021-04-01 21:11:58', '2021-04-01'),
(26, 23, NULL, 13, 1, 1, 2, NULL, NULL, NULL, 265, 480, 500, NULL, 0, 0, NULL, NULL, 1, '2021-05-18 21:35:32', '2021-05-18'),
(27, 24, NULL, 13, 2, 2, 2, NULL, NULL, NULL, 400, 950, 1000, NULL, 0, 0, NULL, NULL, 1, '2021-06-21 14:14:29', '2021-06-21'),
(28, 25, NULL, 13, 3, 1, 2, NULL, NULL, NULL, 165, 310, 400, NULL, 0, 0, NULL, NULL, 1, '2021-06-21 14:16:02', '2021-06-21'),
(29, 26, NULL, 13, 1, 1, 2, NULL, NULL, NULL, 80, 150, 150, NULL, 0, 0, NULL, NULL, 1, '2021-07-04 22:33:10', '2021-07-04'),
(30, 27, NULL, 13, 1, 1, 2, NULL, NULL, NULL, 320, 600, 610, NULL, 0, 0, NULL, NULL, 1, '2021-08-24 14:59:46', '2021-08-24'),
(31, 28, NULL, 13, 1, 1, 2, NULL, NULL, NULL, 193, 520, 600, NULL, 0, 0, NULL, NULL, 1, '2021-09-21 13:43:59', '2021-09-21'),
(32, 29, NULL, 5, 1, 1, 2, NULL, NULL, NULL, 27, 75, 100, NULL, 5, 0, NULL, NULL, 1, '2022-12-22 10:59:24', '2022-12-22'),
(33, 4, NULL, 2, 1, 3, 1, NULL, NULL, NULL, NULL, 250, NULL, NULL, NULL, 0, NULL, NULL, 1, '2023-01-16 13:55:48', '2023-01-16'),
(34, 30, NULL, 13, 1, 1, 2, NULL, NULL, NULL, 160, 300, 300, NULL, 0, 0, NULL, NULL, 1, '2023-05-31 05:43:09', '2023-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `serie_size`
--

CREATE TABLE `serie_size` (
  `id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `serie_size`
--

INSERT INTO `serie_size` (`id`, `serie_id`, `size`) VALUES
(1, 1, 39),
(2, 2, 35),
(3, 3, 22),
(4, 1, 40),
(5, 1, 41),
(6, 1, 42),
(7, 1, 43),
(8, 1, 44),
(9, 2, 36),
(10, 2, 37),
(11, 2, 38),
(12, 2, 39),
(13, 2, 40),
(14, 3, 23),
(15, 3, 24),
(16, 3, 25),
(17, 3, 26),
(18, 3, 27),
(19, 3, 28),
(20, 3, 29),
(21, 3, 30),
(22, 3, 31),
(25, 3, 32),
(26, 0, 18),
(27, 0, 19),
(29, 0, 20),
(30, 0, 21),
(31, 0, 45),
(32, 0, 42),
(33, 1, 35);

-- --------------------------------------------------------

--
-- Table structure for table `spend`
--

CREATE TABLE `spend` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spend`
--

INSERT INTO `spend` (`id`, `name`, `price`, `user_id`, `created_at`) VALUES
(1, 'Gasto prueba', 100, 2, '2021-06-16 20:58:24');

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
  `is_principal` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `name`, `address`, `phone`, `email`, `is_principal`) VALUES
(1, 'STAND EL ZAPATÃ“N', 'Av. Los Reformistas B - 24 Av. Los Reformistas B - 24 Av. Los Reformistas B - 24', '945343333', 'eabanto2@hotmail.com', 1),
(2, 'Almacen 1', NULL, NULL, NULL, 0),
(3, 'Almacen 2', 'Av. Piedradura 123 ', '984239238', 'raul@gvs.pe', 0);

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
  `counter` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `image`, `status`, `kind`, `stock_id`, `counter`, `created_at`) VALUES
(1, 'Berta', 'P', 'admin', 'jperez@hotmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 'gato.jpg', 1, 1, 1, 323, '2017-03-18 14:55:46'),
(2, 'Vendedor1', 'Apellido', 'vendedor1', 'vendedor1@hotmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '', 1, 2, 2, 49, '2017-05-14 22:24:48'),
(3, 'Vendedor2', 'Apellido', 'vendedor2', 'vendedor2@hotmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', '', 1, 2, 1, 27, '2017-05-14 22:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `xx`
--

CREATE TABLE `xx` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xx`
--

INSERT INTO `xx` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `box`
--
ALTER TABLE `box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_type`
--
ALTER TABLE `operation_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_id` (`color_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `size_id` (`size_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sell`
--
ALTER TABLE `sell`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sell_ibfk_2` (`person_id`);

--
-- Indexes for table `serie_size`
--
ALTER TABLE `serie_size`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spend`
--
ALTER TABLE `spend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xx`
--
ALTER TABLE `xx`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `box`
--
ALTER TABLE `box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `operation_type`
--
ALTER TABLE `operation_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `sell`
--
ALTER TABLE `sell`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `serie_size`
--
ALTER TABLE `serie_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xx`
--
ALTER TABLE `xx`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`color_id`) REFERENCES `color` (`id`),
  ADD CONSTRAINT `product_ibfk_5` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `product_ibfk_6` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `sell`
--
ALTER TABLE `sell`
  ADD CONSTRAINT `sell_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `sell_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
