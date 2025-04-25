const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
require('dotenv').config();

// MongoDB bağlantısı
mongoose.connect(process.env.MONGODB_URI)
    .then(() => console.log('MongoDB bağlantısı başarılı'))
    .catch(err => console.error('MongoDB bağlantı hatası:', err));

// User modelini import et
const User = require('./src/models/User');

async function updatePassword() {
    try {
        // Şifreyi hash'le
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash('123456', 10);
        
        console.log('Oluşturulan hash:', hashedPassword);
        
        // Kullanıcının şifresini güncelle
        const result = await User.updateOne(
            { email: "eren@eren.com" },
            { $set: { password: hashedPassword } }
        );
        
        console.log('Güncelleme sonucu:', result);
        console.log('Şifre başarıyla güncellendi');
        
        // Bağlantıyı kapat
        mongoose.connection.close();
    } catch (error) {
        console.error('Hata:', error);
    }
}

updatePassword(); 