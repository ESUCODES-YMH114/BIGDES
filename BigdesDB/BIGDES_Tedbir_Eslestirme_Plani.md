
# 📊 BIGDES – Otomatik Tedbir Eşleştirme ve Değerlendirme Sistemi

## 🧠 Amaç
Kullanıcıların yüklediği denetim dosyalarını kullanarak:
- Uygulanabilir tedbir alanlarını tespit etmek
- Tedbirler tablosuyla eşleştirme yapmak
- Her varlık grubu için uygulanması gereken tedbirleri otomatik analiz etmek

---

## 📥 1. Kullanıcı Excel Dosyası Yükler
Beklenen kolonlar:
- `varlik_grubu_adi`
- Tedbir alanları (örn. `sunucu_sikilastirma`, `kisisel_veri_guvenligi`)
- Hücrelerde: “Uygulanabilir”, “Uygulanabilir Değil”, “Boş” vb.

---

## 🔍 2. Uygulanabilir Alanları Tespit Et
```python
melted = df.melt(id_vars=["varlik_grubu_adi"], var_name="tedbir_alani", value_name="durum")
uygulanabilir = melted[melted["durum"] == "Uygulanabilir"]
```

---

## 🔗 3. Tedbir Tablosuyla Eşleştir
### Yöntem 1: Doğrudan metin araması
```python
eslesen = tedbirler[tedbirler["konu"].str.contains(tedbir_alani, case=False)]
```

### Yöntem 2: Anahtar – Konu eşleştirme sözlüğü
```python
alan_eslestirme = {
  "sunucu_sikilastirma": "3.1.2 Sunucu Güvenliği",
  "kisisel_veri_guvenligi": "3.5.1 KVKK Tedbirleri",
  ...
}
```

---

## 📊 4. Raporlama ve Çıktı
Her varlık grubu için eşleşen tedbirler:
- `tedbir_no`
- `tedbir_seviyesi`
- `tedbir_adi`
- `tedbir_tanimi`

Gerekirse:
- `tedbir_seviyesi >= 2` ise öncelikli uyarı
- `denetim_kapsaminda_mi == Evet` ise öne çıkar

---

## ⚙️ Geliştirilecek Modüller
1. `load_uploaded_excel(file)`
2. `get_applicable_fields(df)`
3. `match_with_tedbirler(applicable_df, tedbirler_df)`
4. `generate_report(matched_df)`

---

## 🧱 İsteğe Bağlı Güçlü Özellikler
- Seviye filtresi
- Excel/PDF çıktı üretimi
- Admin panelinde özet analiz
