const bcrypt = require('bcrypt');

async function generateHash() {
  try {
    const password = '123456';
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

generateHash(); 