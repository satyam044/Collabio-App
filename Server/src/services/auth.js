const jwt = require("jsonwebtoken");

function setUser(userId) {
    return jwt.sign({ user: userId }, process.env.JWT_SECRET, { expiresIn: "7d" });
}

module.exports = { setUser };
