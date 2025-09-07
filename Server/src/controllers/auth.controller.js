const User = require("../models/user.model.js");
const bcrypt = require("bcryptjs");

async function reqisterUser(req, res) {
    const { email, password, profilePic, name, userName, bio } = req.body;
    const user = await User.findOne({ email });

    if (user) {
        return res.status(400).json({ success: false, message: "User Already Exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = await User.create({
        email,
        password: hashedPassword,
    })
}