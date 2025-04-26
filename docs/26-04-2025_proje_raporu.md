# 📌 Proje Adı: BIGDES

## 📅 Tarih: 2025-04-26

## Herkes sonarcloud hesabı açıp github'unu bağlasın ardından eğer projede user
## olarak gözükmüyorlarsa maillerini de bana iletsinler. 

---

## ✅ Yapılanlar (Günlük/Haftalık)

- [✅] [Bcypt ile login sayfasondaki hashleme işlemi yapıldı.] (Kim yaptı: [Selameddin] [Berkay])


---

## 🚨 SonarCloud Analiz Raporu

### Bulunan ÖNEMLİ Hatalar
| Tür | Dosya/Yol | Satır | Açıklama | Önem Derecesi |
|:---|:----------|:------|:---------|:--------------|
| Security | backend/src/server.js | 54 | SQL Injection riski var. | Blocker |
| Maintainability | backend/update-password.js | 16 | Kullanılmayan "salt" değişkeni var. | Major |

---

### Fix Önerileri
- server.js dosyasında SQL sorguları parametreli hale getirilmeli. (PreparedStatement kullanımı)
- update-password.js dosyasında kullanılmayan salt değişkeni silinmeli.

---

## 📋 Görev Dağılımı

- [Selameddin] → server.js dosyasındaki güvenlik açığını düzeltmek.| Deadline 27/04/2025 20.00
- [Berkay] → update-password.js kod temizliği yapmak. Deadline 27/04/2025 20.00
- [Umut] → Sonarcloudda bulunan low seviye Reliabilty hatalarının giderilmesi. | Deadline 28/04/2025 20.00
- [Egemen] → Sonarcloudda bulunan medium seviye Intentionality hatalarının giderilmesi. | Deadline 28/04/2025 20.00
- [Eren] → Sonarcloudda bulunan medium seviye Consistency hatalarının giderilmesi. | Deadline 28/04/2025 20.00
 
---

## 🎯 Sonraki Plan

- Minor ve Medium tüm kod hatalarının giderilmesi.
- Kod review yapılması.
- Yeni SonarCloud taraması.
- Testlerin güncellenmesi.
