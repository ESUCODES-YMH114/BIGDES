-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 31 May 2025, 14:25:46
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
-- Tablo için tablo yapısı `denetim_sorulari`
--

CREATE TABLE `denetim_sorulari` (
  `soru_id` int(11) NOT NULL,
  `tedbir_id` int(11) NOT NULL,
  `soru_metni` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `konular`
--

CREATE TABLE `konular` (
  `konu_id` int(11) NOT NULL,
  `grup_id` int(11) NOT NULL,
  `konu_kodu` varchar(20) NOT NULL,
  `konu_adi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `konular`
--

INSERT INTO `konular` (`konu_id`, `grup_id`, `konu_kodu`, `konu_adi`) VALUES
(1, 1, '3.1.1', 'Donanım Varlıklarının Envanter Yönetimi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tedbirler`
--

CREATE TABLE `tedbirler` (
  `tedbir_id` int(11) NOT NULL,
  `konu_id` int(11) NOT NULL,
  `tedbir_no` varchar(20) NOT NULL,
  `tedbir_seviyesi` tinyint(4) NOT NULL,
  `tedbir_adi` varchar(255) NOT NULL,
  `tedbir_tanimi` text DEFAULT NULL,
  `denetim_yontemleri` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `tedbirler`
--

INSERT INTO `tedbirler` (`tedbir_id`, `konu_id`, `tedbir_no`, `tedbir_seviyesi`, `tedbir_adi`, `tedbir_tanimi`, `denetim_yontemleri`) VALUES
(1, 1, '3.1.1.1', 1, 'Donanım Envanterinin Yönetimi', 'Veri saklama, işleme ve iletme yeteneği olan tüm donanımların...', 'Mülakat;Gözden Geçirme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `varlik_gruplari`
--

CREATE TABLE `varlik_gruplari` (
  `grup_id` int(11) NOT NULL,
  `grup_kodu` varchar(20) NOT NULL,
  `grup_adi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Tablo döküm verisi `varlik_gruplari`
--

INSERT INTO `varlik_gruplari` (`grup_id`, `grup_kodu`, `grup_adi`) VALUES
(1, '3.1', 'Ağ ve Sistem Güvenliği');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `denetim_sorulari`
--
ALTER TABLE `denetim_sorulari`
  ADD PRIMARY KEY (`soru_id`),
  ADD KEY `tedbir_id` (`tedbir_id`);

--
-- Tablo için indeksler `konular`
--
ALTER TABLE `konular`
  ADD PRIMARY KEY (`konu_id`),
  ADD UNIQUE KEY `grup_id` (`grup_id`,`konu_kodu`);

--
-- Tablo için indeksler `tedbirler`
--
ALTER TABLE `tedbirler`
  ADD PRIMARY KEY (`tedbir_id`),
  ADD UNIQUE KEY `tedbir_no` (`tedbir_no`),
  ADD KEY `konu_id` (`konu_id`);

--
-- Tablo için indeksler `varlik_gruplari`
--
ALTER TABLE `varlik_gruplari`
  ADD PRIMARY KEY (`grup_id`),
  ADD UNIQUE KEY `grup_kodu` (`grup_kodu`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `denetim_sorulari`
--
ALTER TABLE `denetim_sorulari`
  MODIFY `soru_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `konular`
--
ALTER TABLE `konular`
  MODIFY `konu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `tedbirler`
--
ALTER TABLE `tedbirler`
  MODIFY `tedbir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `varlik_gruplari`
--
ALTER TABLE `varlik_gruplari`
  MODIFY `grup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `denetim_sorulari`
--
ALTER TABLE `denetim_sorulari`
  ADD CONSTRAINT `denetim_sorulari_ibfk_1` FOREIGN KEY (`tedbir_id`) REFERENCES `tedbirler` (`tedbir_id`);

--
-- Tablo kısıtlamaları `konular`
--
ALTER TABLE `konular`
  ADD CONSTRAINT `konular_ibfk_1` FOREIGN KEY (`grup_id`) REFERENCES `varlik_gruplari` (`grup_id`);

--
-- Tablo kısıtlamaları `tedbirler`
--
ALTER TABLE `tedbirler`
  ADD CONSTRAINT `tedbirler_ibfk_1` FOREIGN KEY (`konu_id`) REFERENCES `konular` (`konu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
