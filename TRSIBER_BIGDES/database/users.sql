
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
('Eren', 'Yılmaz', 'eren@eren.com', 'erenyilmaz', '$2b$12$xKt.cg8ZIZuyIJ0dFM.Jpunxvhm92.S8dDJBU.oDNkXA54xZE0HVm'),
('Ahmet', 'Kaya', 'ahmet@ahmet.com', 'ahmetkaya', '123456'),
('Ayşe', 'Demir', 'ayse@ayse.com', 'aysedemir', '123456'); 