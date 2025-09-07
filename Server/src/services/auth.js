const jwt = require("jsonwebtoken");

export function setUser(user) {
    return jwt.sign({ id: user }, process.env.JWT_SECRET);
}