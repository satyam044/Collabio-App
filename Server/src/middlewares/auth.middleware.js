const jwt = require("jsonwebtoken");
const User = require("../models/user.model");

async function protectRoute(req, res, next) {
    const token = req.cookies.token;
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const user = await User.findById(decoded.user).select("-password");

    if (!user) {
        return res.status(401).json({
            success: false,
            message: "Login Required!"
        })
    }
    req.user = user;
    next();
}

module.exports = { protectRoute };