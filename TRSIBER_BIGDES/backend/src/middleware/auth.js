const jwt = require('jsonwebtoken');

const JWT_SECRET = process.env.JWT_SECRET || 'gizli-anahtar-buraya';

const verifyToken = (req, res, next) => {
    const token = req.cookies.jwt;

    if (!token) {
        return res.redirect('/login.html');
    }

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        req.user = decoded;
        next();
    } catch (error) {
        res.clearCookie('jwt');
        return res.redirect('/login.html');
    }
};

module.exports = verifyToken; 