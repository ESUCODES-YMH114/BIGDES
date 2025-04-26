const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
require('dotenv').config();
const bcrypt = require('bcrypt');

const app = express();

// CORS ayarlarını güvenli hale getir
const corsOptions = {
    origin: 'https://bigdes-3lh1.onrender.com',
    optionsSuccessStatus: 200
};
app.use(cors(corsOptions));

// X-Powered-By header'ını kaldır
app.disable('x-powered-by');

app.use(express.json());

// MongoDB bağlantısı
mongoose.connect(process.env.MONGODB_URI)
    .then(() => console.log('MongoDB bağlantısı başarılı'))
    .catch(err => console.error('MongoDB bağlantı hatası:', err));

// User modelini import et
const User = require('./models/User');

// Statik dosyaları serve et
app.use(express.static(path.join(__dirname, '../../')));

// Ana sayfayı yönlendir
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/index.html'));
});

// Diğer sayfalar için route'lar
app.get('/Anasayfa.html', (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/Anasayfa.html'));
});

app.get('/profil.html', (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/profil.html'));
});

app.get('/admin_panel.html', (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/admin_panel.html'));
});

app.get('/denetimlerim.html', (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/denetimlerim.html'));
});

// Kullanıcı girişi
app.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        
        // Sadece email loglanabilir, şifre asla şifre değerini loglamayın!
        console.log(`Giriş denemesi: ${email}`);
        
        // Şifre ile birlikte kullanıcıyı bul (normalde select:false olduğu için)
        const user = await User.findOne({ email }).select('+password');

        console.log(`Kullanıcı bulundu mu?: ${!!user}`);
        
        // Kullanıcı bulunamadıysa
        if (!user) {
            console.log(`Kullanıcı bulunamadı: ${email}`);
            return res.status(401).json({ error: 'Giriş başarısız' });
        }

        console.log(`Veritabanındaki hash: ${user.password}`);
        
        // Şifre doğrulama - bcrypt.compare kullanarak
        const isPasswordValid = await bcrypt.compare(password, user.password);
        
        console.log(`Şifre eşleşmesi: ${isPasswordValid}`);
        
        if (!isPasswordValid) {
            // Başarısız girişlerde özel hata mesajı yok
            console.log(`Şifre eşleşmedi: ${email}`);
            return res.status(401).json({ error: 'Giriş başarısız' });
        }

        // Başarılı giriş durumunda
        console.log(`Başarılı giriş: ${email}`);
        res.json({
            success: true,
            user: {
                id: user._id,
                name: user.name,
                surname: user.surname,
                email: user.email,
                username: user.username
                // Şifreyi client'a gönderme
            }
        });
    } catch (error) {
        // Genel hata durumunda spesifik hata vermeden genel bir mesaj döndür
        console.error('Bir hata oluştu:', error);
        res.status(500).json({ error: 'Giriş başarısız' });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Sunucu ${PORT} portunda çalışıyor`);
}); 