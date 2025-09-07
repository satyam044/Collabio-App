const User = require("../models/user.model.js");
const bcrypt = require("bcryptjs");
const { cloudinary } = require("../services/cloudinary.js");

async function registerUser(req, res) {
    const { email, password, profilePic, name, userName, bio } = req.body;
    const user = await User.findOne({ email });

    if (user) {
        return res.status(400).json({ success: false, message: "User Already Exists" });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    let profilePicUrl = "";
    if (profilePic) {
        const upload = await cloudinary.uploader.upload(profilePic);
        profilePic = upload.secure_url;
    }

    const newUser = await User.create({
        email,
        password: hashedPassword,
        profilePic: profilePicUrl,
        name,
        userName,
        bio,
    })


}