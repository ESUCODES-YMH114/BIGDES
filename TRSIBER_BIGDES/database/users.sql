-- Veritabanını oluştur
CREATE DATABASE IF NOT EXISTS trsiber;
USE trsiber;

-- Users tablosunu oluştur
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);

-- Örnek kullanıcıları ekle
INSERT INTO users (name, surname, email, username, password) VALUES
('Eren', 'Yılmaz', 'eren@eren.com', 'erenyilmaz', '123456'),
('Ahmet', 'Kaya', 'ahmet@ahmet.com', 'ahmetkaya', '123456'),
('Ayşe', 'Demir', 'ayse@ayse.com', 'aysedemir', '123456'); 