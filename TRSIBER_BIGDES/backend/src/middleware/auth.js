const jwt = require('jsonwebtoken');

const JWT_SECRET = process.env.JWT_SECRET || 'gizli-anahtar-buraya';


const verifyToken = (req, res, next) => {
    const token = req.headers.authorization?.split(' ')[1];

    if (!token) {
        return res.redirect('/');
    }

    try {
        const decoded = jwt.verify(token, JWT_SECRET);
        req.user = decoded;
        next();
    } catch (error) {
               res.clearCookie('jwt');
        return res.redirect('/');
    }
};

module.exports = verifyToken; 