const jwt = require("jsonwebtoken");

function setUser(user) {
    return jwt.sign({ id: user }, process.env.JWT_SECRET);
}

module.exports = { setUser }