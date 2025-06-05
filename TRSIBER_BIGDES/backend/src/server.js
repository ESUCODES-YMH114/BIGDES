const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');
const cookieParser = require('cookie-parser');
require('dotenv').config();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const verifyToken = require('./middleware/auth');
const bcryptjs = require('bcryptjs');

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

// Statik dosyaları /assets path'i üzerinden serve et
app.use('/assets', express.static(path.join(__dirname, '../../assets')));

// Ana sayfayı (login page) yönlendir (hem / hem de /index.html için) - Bu sayfa korumasız olmalı
app.get(['/', '/index.html'], (req, res) => {
    res.sendFile(path.join(__dirname, '../../pages/index.html'));
});

// Korumalı sayfalar için middleware ve route'lar - Sadece verifyToken başarılı olursa sayfa serve edilecek
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

// Kullanıcı ekleme API'si
app.post('/api/users', verifyToken, async (req, res) => {
    try {
        // Admin kontrolü
        const adminUser = await User.findById(req.user.id);
        if (!adminUser || adminUser.role !== 'admin') {
            return res.status(403).json({ message: 'Bu işlem için yetkiniz yok!' });
        }

        const { name, surname, email, username, password, role } = req.body;

        // E-posta ve kullanıcı adı kontrolü
        const existingUser = await User.findOne({ 
            $or: [{ email }, { username }] 
        });

        if (existingUser) {
            return res.status(400).json({ 
                message: 'Bu e-posta adresi veya kullanıcı adı zaten kullanılıyor!' 
            });
        }

        // Şifreyi hashle
        const hashedPassword = await bcrypt.hash(password, 10);

        // Yeni kullanıcı oluştur
        const newUser = new User({
            name,
            surname,
            email,
            username,
            password: hashedPassword,
            role: role || 'user'
        });

        await newUser.save();

        res.status(201).json({ 
            message: 'Kullanıcı başarıyla oluşturuldu',
            user: {
                id: newUser._id,
                name: newUser.name,
                surname: newUser.surname,
                email: newUser.email,
                username: newUser.username,
                role: newUser.role
            }
        });
    } catch (error) {
        console.error('Kullanıcı ekleme hatası:', error);
        res.status(500).json({ message: 'Sunucu hatası!' });
    }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Sunucu ${PORT} portunda çalışıyor`);
}); 