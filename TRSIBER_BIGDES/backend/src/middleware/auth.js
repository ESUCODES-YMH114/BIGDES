const jwt = require('jsonwebtoken');

const verifyToken = (req, res, next) => {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
        return res.status(401).json({ message: 'Yetkilendirme token\'ı bulunamadı!' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET || 'gizli-anahtar');
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ message: 'Geçersiz token!' });
    }
};

module.exports = verifyToken; 