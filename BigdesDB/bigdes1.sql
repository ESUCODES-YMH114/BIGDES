-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 03 Haz 2025, 02:31:53
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

--
-- Tablo döküm verisi `denetim_sorulari`
--

INSERT INTO `denetim_sorulari` (`soru_id`, `tedbir_id`, `soru_metni`) VALUES
(2, 1, 'Envanter yönetim süreci tanımlanmış mıdır?'),
(3, 1, 'Donanım envanterine hangi personelin erişim yetkisi bulunmaktadır?'),
(4, 3, 'Donanım envanterinde; her bir donanım için ağ adresi, donanım adresi, makine adı, seri numarası, marka, model, donanımın sorumlusu ve donanımın kurum tarafından onaylı olup olmadığı bilgisi tutulmakta mıdır?'),
(5, 3, 'Donanım envanterinde yer alan varlıklara ait hangi bilgiler detaylandırılmaktadır?'),
(6, 3, 'Donanım envanter içeriğinde yapılan değişiklikler kayıt altına alınmakta mıdır?'),
(7, 4, 'Donanım varlık envanterine kaydedilmemiş olan donanımlar kurum ağına nasıl bağlanmaktadır?'),
(8, 4, 'Donanım envanterinde yer almayan donanımların yönetimi ile ilgili politika/prosedür bulunmakta mıdır?'),
(9, 4, 'İlgili politika/prosedürler uygulanmakta mıdır?'),
(10, 5, 'Kurumda, ağa bağlanılan cihazları tanımak ve donanım envanterindeki değişiklikleri takip etmek amacıyla aktif keşif araçları kullanılmakta mıdır?'),
(11, 5, 'Aktif keşif araçları ile keşif işlemi en son ne zaman yapılmıştır?'),
(12, 5, 'Keşif sonuçları nasıl analiz edilmektedir?'),
(13, 5, 'Keşif sonuçları nasıl saklanmaktadır?'),
(14, 6, 'Kuruma ait DHCP sunucularında kayıt tutulmakta mıdır?'),
(15, 6, 'Tespit edilen yeni donanımlar, donanım envanterine kontrollü olarak eklenmekte midir?'),
(16, 6, 'Varsa IP adres yönetimi aracında ilgili kayıt tutulmakta mıdır?'),
(17, 7, 'Kullanım ömrünü tamamlayan cihazların imha edilmesine veya tekrar kullanılmasına yönelik bir politika/prosedür tanımlanmış mıdır?'),
(18, 7, 'İlgili politika/prosedür uygulanmakta mıdır?'),
(19, 7, 'Cihazların veri depolama ünitelerini güvenli silmek amacıyla hangi yöntemler kullanılmaktadır?'),
(20, 7, 'Kullanım ömrünü tamamlayan cihazların veri depolama ünitelerini imha etmek için hangi yöntemler kullanılmaktadır?'),
(21, 8, 'Port seviyesinde erişim kontrolü yapılmakta mıdır?'),
(22, 8, 'Kurum ağına bağlanan cihazlar için 802.1x veya NAC çözümleri kullanılarak kimlik denetimi yapılmakta mıdır?'),
(23, 9, 'Kuruma ait güvenli ağlara bağlanan hangi donanımlar için istemci sertifikası ile kimlik doğrulaması yapılmaktadır?'),
(24, 9, 'Sertifika, yetkilendirilmiş personel tarafından güvenli bir alanda oluşturulmakta mıdır?'),
(25, 9, 'Sertifikanın anahtar uzunluğu, tipi (NES/NES olmayan) ve oluşturulma yöntemi seçilirken bilgi güvenliği gereksinimleri dikkate alınmakta mıdır?'),
(26, 9, 'Oluşturulan sertifika güvenli alanda saklanmakta mıdır?'),
(27, 9, 'Sertifika yaşam döngüsünün takibi yapılmakta mıdır?'),
(28, 10, 'Kurum tarafından temin edilen ve kullanıcı bilgisayarlarında kullanılması planlanan sabit diskleri sisteme dâhil etmek amacıyla bir süreç tanımlanmış ve uygulanmakta mıdır?'),
(29, 10, 'Temin edilen sabit diskler, sisteme dâhil edilmeden önce hangi güvenli silme işlemlerine tabi tutulmaktadır?');

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
  `id` int(11) NOT NULL,
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

INSERT INTO `tedbirler` (`id`, `konu_id`, `tedbir_no`, `tedbir_seviyesi`, `tedbir_adi`, `tedbir_tanimi`, `denetim_yontemleri`) VALUES
(1, 1, '3.1.1.1', 1, 'Donanım Envanterinin Yönetimi', 'Veri saklama, işleme ve iletme yeteneği olan tüm donanımların...', 'Mülakat;Gözden Geçirme'),
(3, 1, '3.1.1.2', 1, 'Donanım Envanter İçeriğinin Yönetimi', 'Donanım envanteri en az; her bir donanımın ağ adresini, donanım adresini, makine adını, seri numarasını, markasını, modelini, destek alınan tedarikçi sözleşme bilgilerini (bakım süresi, kapsamı vb.), donanımın sorumlusunu, sorumlu kişinin birimini ve donanımın kurum tarafından onaylı olup olmadığı bilgisini içermelidir. Donanım envanter içeriğinde yapılan değişiklikler kayıt altına alınmalıdır.', 'Mülakat;Gözden Geçirme'),
(4, 1, '3.1.1.3', 1, 'Donanım Envanterine Kaydedilmemiş Donanımların Yönetimi', 'Yeni tedarik edilen ya da ağa yeni bağlanacak donanımların, donanım varlık envanterine kaydı yapılmadan kurum ağına bağlanmamasına yönelik politika ve prosedürler oluşturulmalı ve uygulanmalıdır.', 'Mülakat;Güvenlik Denetimi'),
(5, 1, '3.1.1.4', 2, 'Aktif Keşif Araçlarının Kullanılması', 'Kurum ağına bağlı cihazları tanımlamak ve donanım varlık envanterindeki değişiklikleri takip etmek için aktif keşif araçları kullanılmalıdır.', 'Mülakat;Gözden Geçirme;Güvenlik Denetimi'),
(6, 1, '3.1.1.5', 2, 'DHCP Kayıt Mekanizması ile Yeni Donanımların Tespiti', 'Kurumun donanım envanterini güncel tutmak için tüm DHCP sunucularında ya da IP adres yönetim araçlarında kayıt mekanizmasının kullanımı sağlanmalıdır.', 'Mülakat;Güvenlik Denetimi'),
(7, 1, '3.1.1.6', 2, 'Kullanım Ömrünü Tamamlayan Cihazların Veri Depolama Üniteleri', 'Kullanım ömrünü tamamlayan cihazların veri depolama üniteleri (HDD, SSD, USB, disk, harici bellek vb.) güvenli bir şekilde imha edilmelidir. Kurum içinde tekrar kullanılması durumunda ise veri kurtarmaya imkân sağlamayacak şekilde güvenli silme işlemine tabi tutulduktan sonra kullanıma alınmalıdır.', 'Mülakat;Gözden Geçirme'),
(8, 1, '3.1.1.7', 2, 'Kurum Ağı Bağlantı Noktalarında Kimlik Denetimi Yapılması', 'Sadece onaylı donanımların kurum ağına bağlanabilmesi için, 802.1x standardı veya NAC çözümleri kullanılarak kurum ağına bağlanan cihazlara kimlik denetimi yapılmalıdır.', 'Mülakat;Sızma Testi'),
(9, 1, '3.1.1.8', 3, 'Donanım Varlıklarının Kimlik Denetimi için İstemci Sertifikalarının Kullanılması', 'Destekleyen cihazlarda, kurumun güvenli ağlarına bağlanan donanım varlıklarının kimlik denetimi için istemci sertifikaları kullanılmalıdır. Sertifika, yetkilendirilmiş personel tarafından güvenli alanda oluşturulmalıdır. Sertifikanın anahtar uzunluğu, tipi (NES/NES olmayan) ve oluşturulma yöntemi bilgi güvenliği gereksinimleri doğrultusunda seçilmelidir. Oluşturulan sertifika güvenli alanda saklanmalı ve sertifika yaşam döngüsünün takibi yapılmalıdır.', 'Mülakat;Gözden Geçirme;Güvenlik Denetimi'),
(10, 1, '3.1.1.9', 3, 'Sabit Disk Güvenliği', 'Kurum tarafından satın alınan kullanıcı bilgisayarlarına ait sabit diskler, veri kurtarmaya imkân sağlamayacak şekilde güvenli silme işlemine tabi tutulduktan sonra sistemlere dâhil edilmelidir.', 'Mülakat;Gözden Geçirme');

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
  ADD PRIMARY KEY (`id`),
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
  MODIFY `soru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Tablo için AUTO_INCREMENT değeri `konular`
--
ALTER TABLE `konular`
  MODIFY `konu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `tedbirler`
--
ALTER TABLE `tedbirler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `varlik_gruplari`
--
ALTER TABLE `varlik_gruplari`
  MODIFY `grup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `denetim_sorulari`
--
ALTER TABLE `denetim_sorulari`
  ADD CONSTRAINT `denetim_sorulari_ibfk_1` FOREIGN KEY (`tedbir_id`) REFERENCES `tedbirler` (`id`);

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
