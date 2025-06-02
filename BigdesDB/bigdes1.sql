-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 03 Haz 2025, 02:53:34
-- Sunucu sürümü: 10.5.27-MariaDB
-- PHP Sürümü: 8.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `bigdes1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tedbirler`
--

CREATE TABLE `tedbirler` (
  `id` int(11) NOT NULL,
  `varlik_grubu` varchar(100) DEFAULT NULL,
  `konu` varchar(150) DEFAULT NULL,
  `tedbir_no` varchar(20) DEFAULT NULL,
  `tedbir_seviyesi` int(11) DEFAULT NULL,
  `tedbir_adi` varchar(150) DEFAULT NULL,
  `tedbir_tanimi` text DEFAULT NULL,
  `denetim_soru` text DEFAULT NULL,
  `denetim_yontem` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `tedbirler`
--
ALTER TABLE `tedbirler`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
