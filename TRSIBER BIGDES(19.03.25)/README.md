# TRSİBER BIGDES Uyum ve Denetim Sistemi

Bu proje, TRSİBER BIGDES Uyum ve Denetim Sistemi'nin web arayüzünü içermektedir.

## Proje Yapısı

```
TRSIBER BIGDES/
├── src/                    # Backend kaynak kodları
│   └── server.js          # Ana sunucu dosyası
├── assets/                # Statik dosyalar
│   ├── css/              # CSS dosyaları
│   ├── js/               # JavaScript dosyaları
│   └── images/           # Görseller
├── pages/                 # HTML sayfaları
├── users.sql             # Veritabanı şeması ve örnek veriler
├── package.json          # Proje bağımlılıkları
└── README.md             # Proje dokümantasyonu
```

## Kurulum

1. MySQL veritabanını kurun ve `users.sql` dosyasını çalıştırın:
```sql
mysql -u root -p < users.sql
```

2. Proje bağımlılıklarını yükleyin:
```bash
npm install
```

3. Sunucuyu başlatın:
```bash
npm start
```

4. Tarayıcınızda `http://localhost:3000/loginpage.html` adresine gidin

## Geliştirme

Geliştirme modunda çalıştırmak için:
```bash
npm run dev
```

## Test Kullanıcıları

- Email: eren@eren.com
- Şifre: 123456

## Teknolojiler

- Node.js
- Express.js
- MySQL
- HTML5
- CSS3
- JavaScript 