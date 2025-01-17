# 🌍 Akciğer Kanseri Tespit Sistemi

Bu proje, **akciğer kanseri tespit sistemi** olarak tasarlanmış bir makine öğrenimi uygulamasıdır. Sistem, hastalığı erken evrede tespit etmeyi amaçlayarak, derin öğrenme ve istatistiksel modellerden yararlanmaktadır.

## 🗂 Proje Yapısı

### 🔧 Veri Seti
- **Klasör**: `Data`
- Projede kullanılan akciğer kanseri veri setleri burada saklanır. 
- Veri setleri, hastalığın semptomları ve hasta detayları gibi bilgileri içerir.

### 🔧 Kodlar (Scripts)
- **Klasör**: `Scripts`
- Makine öğrenimi modellerinin ve veri işleme işlevlerinin yer aldığı kodlar bu klasörde bulunur.
- Öne çıkan dosyalar:
  - `data_preprocessing.py`: Veri önişleme adımlarını gerçekleştirir.
  - `model_training.py`: Derin öğrenme modellerini eğitir.
  - `evaluation.py`: Model performansını değerlendirir.

## 🚀 Kurulum ve Çalıştırma

### Gereksinimler
- Python (v3.8 veya üzeri)
- Gerekli Python kütüphaneleri: TensorFlow, NumPy, Pandas, Matplotlib, Scikit-learn

### Adımlar
1. Bu projeyi klonlayın veya zip dosyasını çıkarın:
   ```bash
   git clone <proje-repo-url>
   ```
2. Gerekli kütüphaneleri yükleyin:
   ```bash
   pip install -r requirements.txt
   ```
3. Veri setini `Data` klasörünüze yerleştirin.
4. Kodları çalıştırmak için adımları takip edin:
   - Veri önişleme:
     ```bash
     python Scripts/data_preprocessing.py
     ```
   - Model eğitimi:
     ```bash
     python Scripts/model_training.py
     ```
   - Performans değerlendirme:
     ```bash
     python Scripts/evaluation.py
     ```

## ✨ Özellikler
- **Veri İşleme** 📊: Eksik verilerin tamamlanması, normalizasyon ve veri ayrıştırma.
- **Makine Öğrenimi** 🤖: Derin öğrenme ile kanser tespiti.
- **Performans Analizi** 🔄: Model başarı oranlarının değerlendirilmesi.

## 💪 Katkıda Bulunma
Katkıda bulunmak için:
1. Depoyu fork edin.
2. Yeni bir dal oluşturun:
   ```bash
   git checkout -b ozellik/yeni-ozellik
   ```
3. Değişikliklerinizi commit edin:
   ```bash
   git commit -m "Degisiklik mesajinizi ekleyin"
   ```
4. Dalınızı push edin:
   ```bash
   git push origin ozellik/yeni-ozellik
   ```
5. Bir pull request oluşturun.

## 📓 Lisans
Bu proje MIT Lisansı altında lisanslanmıştır.

