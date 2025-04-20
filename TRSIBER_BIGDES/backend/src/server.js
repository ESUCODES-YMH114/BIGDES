const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json());

// Ana dizini statik dosyalar için ayarla
app.use(express.static(path.join(__dirname, '../../')));

// Ana sayfayı yönlendir
app.get('/', (req, res) => {
    res.redirect('/pages/loginpage.html');
});

// MySQL bağlantısı
const connection = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || '',
    database: process.env.DB_NAME || 'trsiber'
});

connection.connect((err) => {
    if (err) {
        console.error('MySQL bağlantı hatası:', err);
        return;
    }
    console.log('MySQL veritabanına bağlandı');
});

// Kullanıcı girişi
app.post('/login', (req, res) => {
    const { email, password } = req.body;

    const sql = 'SELECT * FROM users WHERE email = ? AND password = ?';
    connection.query(sql, [email, password], (err, results) => {
        if (err) {
            console.error('Sorgu hatası:', err);
            res.status(500).json({ error: 'Giriş başarısız' });
            return;
        }

        if (results.length === 0) {
            res.status(401).json({ error: 'Geçersiz email veya şifre' });
            return;
        }

        const user = results[0];
        res.json({
            success: true,
            user: {
                id: user.id,
                name: user.name,
                surname: user.surname,
                email: user.email,
                username: user.username
            }
        });
    });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Sunucu ${PORT} portunda çalışıyor`);
}); 