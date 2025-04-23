const mongoose = require('mongoose');
const User = require('../models/User');
require('dotenv').config();

// MongoDB bağlantısı
const mongoURI = process.env.MONGODB_URI;

async function migrateData() {
    try {
        // MongoDB'ye bağlan
        await mongoose.connect(mongoURI);
        console.log('MongoDB bağlantısı başarılı');

        // Örnek kullanıcıları direkt MongoDB'ye ekle
        const users = [
            {
                name: 'Eren',
                surname: 'Yılmaz',
                email: 'eren@eren.com',
                username: 'erenyilmaz',
                password: '123456'
            },
            {
                name: 'Ahmet',
                surname: 'Kaya',
                email: 'ahmet@ahmet.com',
                username: 'ahmetkaya',
                password: '123456'
            },
            {
                name: 'Ayşe',
                surname: 'Demir',
                email: 'ayse@ayse.com',
                username: 'aysedemir',
                password: '123456'
            }
        ];

        // Her kullanıcıyı MongoDB'ye ekle
        for (const user of users) {
            await User.create(user);
            console.log(`${user.username} eklendi`);
        }

        console.log('Veri aktarımı tamamlandı');
        
        // Bağlantıyı kapat
        await mongoose.disconnect();
        
        process.exit(0);
    } catch (error) {
        console.error('Hata:', error);
        process.exit(1);
    }
}

migrateData(); 