-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 04:57 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvl`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `CUSTOMER_ID` varchar(20) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(150) NOT NULL,
  `PRIVILEGES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`CUSTOMER_ID`, `USERNAME`, `PASSWORD`, `PRIVILEGES`) VALUES
('CID100000', 'dyasmir', 'eed20a72e5da2888138fd6f1b0770dc5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `USERNAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(150) NOT NULL,
  `PRIVILEGES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `USERNAME`, `PASSWORD`, `PRIVILEGES`) VALUES
(1000000, 'dyasmir', 'c93ccd78b2076528346216b3b2f701e6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `CUSTOMER_ID` varchar(20) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CUSTOMER_ID` varchar(20) NOT NULL,
  `FIRSTNAME` varchar(30) NOT NULL,
  `LASTNAME` varchar(30) NOT NULL,
  `BIRTHDAY` date NOT NULL,
  `AGE` int(11) NOT NULL,
  `ADDRESS` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUSTOMER_ID`, `FIRSTNAME`, `LASTNAME`, `BIRTHDAY`, `AGE`, `ADDRESS`) VALUES
('CID100000', 'Justmyr', 'Gutierrez', '2001-12-30', 20, 'Balete, Batangas City'),
('CID4048338', 'Justmyr', 'Gutierrez', '2001-12-02', 12, 'Balete Relocation Site');

-- --------------------------------------------------------

--
-- Table structure for table `orderline`
--

CREATE TABLE `orderline` (
  `ORDERLINE_ID` varchar(20) NOT NULL,
  `TRANSACTION_ID` varchar(20) NOT NULL,
  `PRODUCT_ID` varchar(20) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SUBTOTAL` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderline`
--

INSERT INTO `orderline` (`ORDERLINE_ID`, `TRANSACTION_ID`, `PRODUCT_ID`, `QUANTITY`, `SUBTOTAL`) VALUES
('OID1012516', 'TID709057100000', 'A10001', 1, '120.00'),
('OID1173154', 'TID709057100000', 'A10012', 1, '120.00'),
('OID1184796', 'TID363917100000', 'A10017', 1, '120.00'),
('OID1698875', 'TID363917100000', 'A10014', 1, '120.00'),
('OID2440558', 'TID363917100000', 'A10012', 1, '120.00'),
('OID2966825', 'TID363917100000', 'A10018', 1, '150.00'),
('OID2980042', 'TID335326100000', 'A10001', 1, '120.00'),
('OID6360732', 'TID363917100000', 'A10011', 1, '120.00'),
('OID6945487', 'TID550621100000', 'A10015', 1, '120.00'),
('OID7098784', 'TID709057100000', 'A10013', 1, '120.00'),
('OID7701666', 'TID709057100000', 'A10010', 1, '120.00'),
('OID8371403', 'TID363917100000', 'A10013', 1, '120.00'),
('OID9144601', 'TID70652100000', 'A10010', 1, '120.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `PRODUCT_ID` varchar(20) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PRICE` decimal(9,2) NOT NULL,
  `TYPE` varchar(20) NOT NULL,
  `STOCKS` int(11) DEFAULT NULL,
  `IMAGE` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`PRODUCT_ID`, `NAME`, `PRICE`, `TYPE`, `STOCKS`, `IMAGE`) VALUES
('A10000', 'GeekVape (GeekVape RTE)', '1560.00', 'Hardware', 60, 'GeekVape (GeekVape RTE).jpg'),
('A10001', 'Iced Pops (Premium E-liquid) 50ml', '120.00', 'Juice', 48, 'Iced Pops (Premium E-liquid) 50ml.jpg'),
('A10010', 'Gumble Grapes (Air Candies) 50ml', '120.00', 'Juice', 33, 'Gumble Grapes (Air Candies) 50ml.jpg'),
('A10011', 'Strawberry Yogurt (Air Candies) 50ml', '120.00', 'Juice', 48, 'Strawberry Yogurt (Air Candies) 50ml.jpg'),
('A10012', 'Raspberry Gum (Air Candies) 50ml', '120.00', 'Juice', 48, 'Raspberry Gum (Air Candies) 50ml.jpg'),
('A10013', 'Hazel Nut (Taro Delight) 50ml', '120.00', 'Juice', 48, 'Hazel Nut (Taro Delight) 50ml.jpg'),
('A10014', 'Taro Bavarian (Taro Delight) 50ml', '120.00', 'Juice', 49, 'Taro Bavarian (Taro Delight) 50ml.jpg'),
('A10015', 'Taro Custard (Taro Delight) 50ml', '120.00', 'Juice', 50, 'Taro Custard (Taro Delight) 50ml.jpg'),
('A10016', 'Taro RY4 (Taro Delight) 50ml', '120.00', 'Juice', 50, 'Taro RY4 (Taro Delight) 50ml.jpg'),
('A10017', 'Coffee Cheesecake (Cheesecake Delight) 60ml', '120.00', 'Juice', 49, 'Coffee Cheesecake (Cheesecake Delight) 60ml.jpg'),
('A10018', 'Chocolate Peanut Butter (Breakfast Cereal Series) 65ml', '150.00', 'Juice', 49, 'Chocolate Peanut Butter (Breakfast Cereal Series) 65ml.jpg'),
('A10019', 'Milky Flakes (Breakfast Cereal Series) 65ml', '150.00', 'Juice', 49, 'Milky Flakes (Breakfast Cereal Series) 65ml.jpg'),
('A1002', 'Iced Lychee  (Premium E-liquid) 50ml', '120.00', 'Juice', 50, 'Iced Lychee  (Premium E-liquid) 50ml.jpg'),
('A10020', 'Forest Breed (XHALE) 30ml', '150.00', 'Juice', 50, 'Forest Breed (XHALE) 30ml.jpg'),
('A10021', 'Blizz (XHALE) 30ml', '150.00', 'Juice', 50, 'Blizz (XHALE) 30ml.jpg'),
('A10022', 'Almond Cheesecake (Flava Jr) 65ml', '150.00', 'Juice', 50, 'Almond Cheesecake (Flava Jr) 65ml.jpg'),
('A10023', 'Banana Peanut Butter (Flava Jr) 65ml', '150.00', 'Juice', 50, 'Banana Peanut Butter (Flava Jr) 65ml.jpg'),
('A10024', 'Cream Puff (Sans Rival) 60ml', '150.00', 'Juice', 50, 'Cream Puff (Sans Rival) 60ml.jpg'),
('A10025', 'Glaze Cheesecake (Cheesecake Delight) 65ml', '150.00', 'Juice', 50, 'Glaze Cheesecake (Cheesecake Delight) 65ml.jpg'),
('A10026', 'Butter Cookie (Kalmado Premium) 60ml', '150.00', 'Juice', 50, 'Butter Cookie (Kalmado Premium) 60ml.jpg'),
('A10027', 'Strawberry Tobacco (Kalmado Premium) 60ml', '150.00', 'Juice', 50, 'Strawberry Tobacco (Kalmado Premium) 60ml.jpg'),
('A10028', 'Custard Cheesecake (Cheesecake Delight) 65ml', '150.00', 'Juice', 50, 'Custard Cheesecake (Cheesecake Delight) 65ml.jpg'),
('A10029', 'Double Cheesecake (Cheesecake Delight) 65ml', '150.00', 'Juice', 50, 'Double Cheesecake (Cheesecake Delight) 65ml.jpg'),
('A1003', 'Condensada Cheesecake (Cheesecake Delight) 60ml', '120.00', 'Juice', 50, 'Condensada Cheesecake (Cheesecake Delight) 60ml.jpg'),
('A10030', 'Crema (Vaporation) 65ml', '150.00', 'Juice', 50, 'Crema (Vaporation) 65ml.jpg'),
('A10032', 'Cheese (Vaporation) 65ml', '150.00', 'Juice', 50, 'Cheese (Vaporation) 65ml.jpg'),
('A10034', 'Hazelnut (Vaportini) 65ml', '200.00', 'Juice', 50, 'Hazelnut (Vaportini) 65ml.jpg'),
('A10035', 'Pistachio Cheesecake (Cheesecake Delight) 65ml', '150.00', 'Juice', 50, 'Pistachio Cheesecake (Cheesecake Delight) 65ml.jpg'),
('A10036', 'Cheese Tart (Classic Potion) 100ml', '200.00', 'Juice', 50, 'Cheese Tart (Classic Potion) 100ml.jpg'),
('A10037', 'Rolled CreamCake (Classic Potion) 100ml ', '200.00', 'Juice', 50, 'Rolled CreamCake (Classic Potion) 100ml .jpg'),
('A10038', 'Pudding De Leche (Classic Potion) 100ml', '200.00', 'Juice', 50, 'Pudding De Leche (Classic Potion) 100ml.jpg'),
('A10039', 'DLA (Di-zurt) 100ml', '200.00', 'Juice', 50, 'DLA (Di-zurt) 100ml.jpg'),
('A1004', 'Iced Double Apple  (Premium E-liquid) 50ml', '120.00', 'Juice', 50, 'Iced Double Apple  (Premium E-liquid) 50ml.jpg'),
('A10040', 'Banana Kreme (Island Mixed) 60ml', '250.00', 'Juice', 50, 'Banana Kreme (Island Mixed) 60ml.jpg'),
('A10041', 'Melon Punch (Island Mixed) 60ml', '250.00', 'Juice', 50, 'Melon Punch (Island Mixed) 60ml.jpg'),
('A10042', 'Strawberry Skies (Island Mixed) 60ml', '250.00', 'Juice', 50, 'Strawberry Skies (Island Mixed) 60ml.jpg'),
('A10043', 'Ube Sorbet (Island Mixed) 60ml', '250.00', 'Juice', 50, 'Ube Sorbet (Island Mixed) 60ml.jpg'),
('A10044', 'Cookie and Cereals 60ml', '250.00', 'Juice', 50, 'Cookie and Cereals 60ml.jpg'),
('A10045', 'Cheesecake Supreme 60ml', '250.00', 'Juice', 50, 'Cheesecake Supreme 60ml.jpg'),
('A10046', ' Choco Butternut (Vapin Donuts) 60ml', '250.00', 'Juice', 50, ' Choco Butternut (Vapin Donuts) 60ml.jpg'),
('A10047', 'Sans Rival 60ml', '250.00', 'Juice', 50, 'Sans Rival 60ml.jpg'),
('A10048', 'Creme Brulee RY4 60ml', '250.00', 'Juice', 50, 'Creme Brulee RY4 60ml.jpg'),
('A1005', 'Iced Coffee  (Premium E-liquid) 50ml', '120.00', 'Juice', 50, 'Iced Coffee  (Premium E-liquid) 50ml.jpg'),
('A1006', 'Iced Candy  (Premium E-liquid) 50ml', '120.00', 'Juice', 50, 'Iced Candy  (Premium E-liquid) 50ml.jpg'),
('A1007', 'Green Apple Gum (Air Candies) 50ml', '120.00', 'Juice', 50, 'Green Apple Gum (Air Candies) 50ml.jpg'),
('A1008', 'Water Falls (Air Candies) 50ml', '120.00', 'Juice', 50, 'Water Falls (Air Candies) 50ml.jpg'),
('A1009', 'Blueberry Bubble (Air Candies) 50ml', '120.00', 'Juice', 50, 'Blueberry Bubble (Air Candies) 50ml.jpg'),
('B1001', 'Strawberry Ice Cream (Boost Dispo) 6500 Puffs', '400.00', 'Disposable', 50, 'Strawberry Ice Cream (Boost Dispo) 6500 Puffs.jpg'),
('B1002', 'Cherry Mango (Flava Artery) 6500 Puffs', '400.00', 'Disposable', 50, 'Cherry Mango (Flava Artery) 6500 Puffs.jpg'),
('B1003', 'Cotton Candy (Flava Artery) 6500 Puffs', '400.00', 'Disposable', 50, 'Cotton Candy (Flava Artery) 6500 Puffs.jpg'),
('B1004', 'Black Ice Blast (Flava Artery) 6500 Puffs', '400.00', 'Disposable', 50, 'Black Ice Blast (Flava Artery) 6500 Puffs.jpg'),
('B1005', 'Fantatstic Grapes (Flava Artery) 6500 Puffs', '400.00', 'Disposable', 50, 'Fantatstic Grapes (Flava Artery) 6500 Puffs.jpg'),
('B1006', 'Cola Ice (Vabar Supra) 7000 Puffs', '400.00', 'Disposable', 50, 'Cola Ice (Vabar Supra) 7000 Puffs.jpg'),
('B1007', 'Strawberry Kiwi (flava Artery) 6500 Puffs', '400.00', 'Disposable', 50, 'Strawberry Kiwi (flava Artery) 6500 Puffs.jpg'),
('B1008', 'Lemon Iced Biscuit (Flava Artery) 6500 Puffs', '400.00', 'Disposable', 50, 'Lemon Iced Biscuit (Flava Artery) 6500 Puffs.jpg'),
('C1001', 'ORIGIN 2 (OXVA)', '1500.00', 'Pod/Mod (Available C', 50, 'ORIGIN 2 (OXVA).jpg'),
('C10010', 'SPL 10 Replacement Coil (NEVOKS)', '200.00', 'Hardware', 50, 'SPL 10 Replacement Coil (NEVOKS).jpg'),
('C10011', 'Replacement Coils (OXVA) 5pcs', '200.00', 'Hardware', 50, 'Replacement Coils (OXVA) 5pcs'),
('C10013', 'Battery', '150.00', 'Hardware', 50, 'Battery.jpg'),
('C10015', 'Popreel Pod Cartridge', '200.00', 'Hardware', 50, 'Popreel Pod Cartridge.jpg'),
('C10016', 'Frozen Cola', '150.00', 'Pods Juice', 50, 'Frozen Cola.jpg'),
('C10017', 'Tobacco', '150.00', 'Pods Juice', 50, 'Tobacco.jpg'),
('C10019', 'Vape Cotton (Toha) ', '100.00', 'Hardware', 50, 'Vape Cotton (Toha).jpg'),
('C1002', 'WENAX K1 SE (GreekVape) 2ml 600mAH', '850.00', 'Pod (Available Color', 50, 'WENAX K1 SE (GreekVape) 2ml 600mAH.jpg'),
('C10020', 'Q2 Smart Charger (Vapce)', '800.00', 'Hardware', 50, 'Q2 Smart Charger (Vapce).jpg'),
('C10021', '303 Wires', '150.00', 'Hardware', 50, '303 Wires.jpg'),
('C1003', '8in1 Drip Tip Kit', '700.00', 'Hardware', 50, '8in1 Drip Tip Kit.jpg'),
('C1004', 'Xlim Cartridge', '200.00', 'Hardware', 50, 'Xlim Cartridge.jpg'),
('C1005', 'BO4 Coil (GreekVape) 5pcs', '200.00', 'Hardware', 50, 'BO.4 Coil (GreekVape) 5pcs/Pack.jpg'),
('C1006', 'PnP-VM6 (voopoo)', '300.00', 'Hardware', 50, 'PnP-VM6 (voopoo).jpg'),
('C1007', 'Uniplus Coil (OXVA) 5pcs', '200.00', 'Hardware', 50, 'Uniplus Coil (OXVA) 5pcs.jpg'),
('C1008', 'RPM Coil (SMOK) ', '200.00', 'Hardware', 50, 'RPM Coil (SMOK) .jpg'),
('C1009', 'UB Lite (Lost Vape) 5pcs', '200.00', 'Hardware', 50, 'UB Lite (Lost Vape) 5pcs.jpg'),
('PID7000102', 'dyasmirr', '123.00', '37', 123123, 'IMG_20221128_210634.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TRANSACTION_ID` varchar(20) NOT NULL,
  `CUSTOMER_ID` varchar(20) NOT NULL,
  `TRANSACTION_DATE` date NOT NULL,
  `TOTAL` decimal(9,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TRANSACTION_ID`, `CUSTOMER_ID`, `TRANSACTION_DATE`, `TOTAL`) VALUES
('TID335326100000', 'CID100000', '2022-11-30', '120.00'),
('TID363917100000', 'CID100000', '2022-11-30', '750.00'),
('TID550621100000', 'CID100000', '2022-11-30', '120.00'),
('TID70652100000', 'CID100000', '2022-11-30', '120.00'),
('TID709057100000', 'CID100000', '2022-11-30', '480.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CUSTOMER_ID`);

--
-- Indexes for table `orderline`
--
ALTER TABLE `orderline`
  ADD PRIMARY KEY (`ORDERLINE_ID`),
  ADD KEY `TRANSACTION_ID` (`TRANSACTION_ID`),
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`PRODUCT_ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TRANSACTION_ID`),
  ADD KEY `CUSTOMER_ID` (`CUSTOMER_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);

--
-- Constraints for table `orderline`
--
ALTER TABLE `orderline`
  ADD CONSTRAINT `orderline_ibfk_1` FOREIGN KEY (`TRANSACTION_ID`) REFERENCES `transaction` (`TRANSACTION_ID`),
  ADD CONSTRAINT `orderline_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customer` (`CUSTOMER_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
