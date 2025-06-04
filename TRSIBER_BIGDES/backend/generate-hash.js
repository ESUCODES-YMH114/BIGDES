const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

const JWT_SECRET = 'gizli-anahtar-buraya'; // Production'da environment variable olarak saklanmalı

async function generateHash() {
  try {
    const password = 'ornek';
    const saltRounds = 10;
    const hash = await bcrypt.hash(password, saltRounds);
    
    console.log(`Orijinal şifre: ${password}`);
    console.log(`Hashlenmiş şifre: ${hash}`);
    
    // Test et
    const isMatch = await bcrypt.compare(password, hash);
    console.log(`Hash doğrulama testi: ${isMatch}`);
    
    // MongoDB güncelleme sorgusu
    console.log(`\nMongoDB güncelleme sorgusu:`);
    console.log(`db.users.updateOne({ email: "eren@eren.com" }, { $set: { password: "${hash}" } })`);
  } catch (error) {
    console.error('Hata:', error);
  }
}

const generateToken = (user) => {
    return jwt.sign(
        { 
            id: user.id,
            username: user.username,
            role: user.role 
        },
        JWT_SECRET,
        { expiresIn: '24h' }
    );
};

generateHash(); 