# 📌 Proje Adı: BIGDES

## 📅 Tarih: 2025-04-27

## Berkay sen de sonarcloud hesabını açtıktan sonra bana mailini iletmelisin. Hemen ardından hepinize sonarcloud üzerinden de görevlendirme yapacağım.

---

## ✅ Yapılanlar (Günlük/Haftalık)

- [🛑] [server.js üzerindeki güvenlik açıkları.] SonarCloud üzerinde hata hala gözüküyor.
- [✅] [backend/update-password.js dosyasında bulunan salt değişkeni hatası fixlendi.] (Kim yaptı: [Berkay])
- [✅] [Rutin güvenlik analizi yapıldı.] (Kim yaptı: [Umut])
- [🟨] [Medium seviye Intentionality hataları fixlendi.](Kim yaptı: [Egemen]) 

---

## 🚨 SonarCloud Analiz Raporu

### Bulunan ÖNEMLİ Hatalar
| Tür | Dosya/Yol | Satır | Açıklama | Önem Derecesi |
|:---|:----------|:------|:---------|:--------------|
| Security | backend/src/server.js | 64 | SQL Injection riski var. | Blocker |
| Maintainability | database/users.sql | 17 | Bu sabiti üç kez kopyalamak yerine bir sabit olarak tanımlayın. | Major |

---

## 📋 Görev Dağılımı

- [Selameddin] → server.js dosyasındaki güvenlik açığını düzeltmek.| Deadline 28/04/2025 20.00
- [Berkay] → Sonarcloudda bulunan Reliability hatalarının fixlenmesi | Deadline 29/04/2025 20.00
- [Umut] → Sonarcloudda bulunan low seviye Reliabilty hatalarının giderilmesi. | Deadline 29/04/2025 20.00
- [Umut] → Sonarcloudda bulunan Maintainability hatalarının giderilmesi. | Deadline 29/04/2025 20.00
- [Eren] → Sonarcloudda bulunan medium seviye Consistency hatalarının giderilmesi. | Deadline 28/04/2025 20.00
- [Eren] → Sonarcloudda sana atılan user.sql sorununun fixlenmesi. | Deadline 28/04/2025 20.00
 
---

## 🎯 Sonraki Plan

- Minor ve Medium tüm kod hatalarının giderilmesi.
- Kod review yapılması.
- Yeni SonarCloud taraması.
- Testlerin güncellenmesi.
