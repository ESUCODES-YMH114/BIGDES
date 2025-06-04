const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
const cookieParser = require('cookie-parser');
require('dotenv').config();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const verifyToken = require('./middleware/auth');

const app = express();

// CORS ayarlarını güvenli hale getir
const corsOptions = {
    origin: 'https://bigdes-3lh1.onrender.com',
    credentials: true,
    optionsSuccessStatus: 200
};
app.use(cors(corsOptions));

// Cookie parser middleware'ini ekle
app.use(cookieParser());

// X-Powered-By header'ını kaldır
app.disable('x-powered-by');

app.use(express.json());

// MongoDB bağlantısı
mongoose.connect(process.env.MONGODB_URI)
    .then(() => console.log('MongoDB bağlantısı başarılı'))
    .catch(err => console.error('MongoDB bağlantı hatası:', err));

// User modelini import et
const User = require('./models/User');

// Statik dosyaları serve et (public klasörü hariç)
app.use(express.static(path.join(__dirname, '../../public')));

// Ana sayfayı yönlendir (hem / hem de /index.html için)
app.get(['/', '/index.html'], (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/index.html'));
});

// Korumalı sayfalar için middleware
app.get('/Anasayfa.html', verifyToken, (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/Anasayfa.html'));
});

app.get('/profil.html', verifyToken, (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/profil.html'));
});

app.get('/admin_panel.html', verifyToken, (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/admin_panel.html'));
});

app.get('/denetimlerim.html', verifyToken, (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/denetimlerim.html'));
});

// Kullanıcı girişi
app.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        
        // Email parametresini sanitize et
        const sanitizedEmail = email.replace(/[^\w\s@.-]/g, '');
        
        console.log(`Giriş denemesi: ${sanitizedEmail}`);
        
        const user = await User.findOne({ email: sanitizedEmail }).select('+password');

        if (!user) {
            console.log(`Kullanıcı bulunamadı: ${sanitizedEmail}`);
            return res.status(401).json({ error: 'Giriş başarısız' });
        }

        const isPasswordValid = await bcrypt.compare(password, user.password);
        
        if (!isPasswordValid) {
            console.log(`Şifre eşleşmedi: ${sanitizedEmail}`);
            return res.status(401).json({ error: 'Giriş başarısız' });
        }

        // JWT token oluştur
        const token = jwt.sign(
            { 
                id: user._id,
                email: user.email,
                role: user.role 
            },
            process.env.JWT_SECRET || 'gizli-anahtar-buraya',
            { expiresIn: '24h' }
        );

        // Token'ı HTTP-only cookie olarak ayarla
        res.cookie('jwt', token, {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production',
            sameSite: 'strict',
            maxAge: 24 * 60 * 60 * 1000 // 24 saat
        });

        // Kullanıcı bilgilerini döndür (şifre hariç)
        const userResponse = {
            id: user._id,
            name: user.name,
            surname: user.surname,
            email: user.email,
            username: user.username,
            role: user.role
        };

        res.json({
            success: true,
            user: userResponse
        });
    } catch (error) {
        console.error('Bir hata oluştu:', error);
        res.status(500).json({ error: 'Giriş başarısız' });
    }
});

// Çıkış yapma endpoint'i
app.post('/logout', (req, res) => {
    res.clearCookie('jwt');
    res.json({ success: true });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Sunucu ${PORT} portunda çalışıyor`);
}); 