const User = require("../models/user.model.js");
const bcrypt = require("bcryptjs");
const { cloudinary } = require("../services/cloudinary.js");
const { setUser } = require("../services/auth.js");

// ✅ Get All Users
async function getUsers(req, res) {
    try {
        const users = await User.find();
        res.status(200).json({ success: true, users });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
}

// ✅ Register
async function registerUser(req, res) {
    try {
        const { email, password, profilePic, name, userName, bio } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ success: false, message: "User already exists" });
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        let profilePicUrl = "";
        if (profilePic) {
            const upload = await cloudinary.uploader.upload(profilePic);
            profilePicUrl = upload.secure_url;
        }

        const newUser = await User.create({
            email,
            password: hashedPassword,
            profilePic: profilePicUrl,
            name,
            userName,
            bio,
        });

        const token = setUser(newUser._id);

        res.status(201).json({
            success: true,
            message: "Account created successfully",
            token, // 👈 Flutter will store this
            userData: {
                id: newUser._id,
                profilePic: profilePicUrl,
                name: newUser.name,
                userName: newUser.userName,
                bio: newUser.bio,
            },
        });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
}

// ✅ Login
async function loginUser(req, res) {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ success: false, message: "Invalid email or password" });
        }

        const isPasswordCorrect = await bcrypt.compare(password, user.password);
        if (!isPasswordCorrect) {
            return res.status(400).json({ success: false, message: "Invalid email or password" });
        }

        const token = setUser(user._id);

        res.status(200).json({
            success: true,
            message: "Login successful",
            token, // 👈 Flutter stores this
            userData: {
                id: user._id,
                profilePic: user.profilePic,
                name: user.name,
                userName: user.userName,
                bio: user.bio,
            },
        });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
}

// ✅ Update Profile
async function updateProfile(req, res) {
    try {
        const { profilePic, name, userName, bio } = req.body;
        const userId = req.user._id;

        let updatedUser;
        if (profilePic) {
            const upload = await cloudinary.uploader.upload(profilePic);
            updatedUser = await User.findByIdAndUpdate(
                userId,
                { profilePic: upload.secure_url, name, userName, bio },
                { new: true }
            );
        } else {
            updatedUser = await User.findByIdAndUpdate(
                userId,
                { name, userName, bio },
                { new: true }
            );
        }

        res.status(200).json({ success: true, userData: updatedUser });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
}

async function logoutUser(req, res) {
    res.status(200).json({ success: true, message: "Logged out successfully. Please discard token on client side." });
}

module.exports = {
    getUsers,
    registerUser,
    loginUser,
    updateProfile,
    logoutUser,
};
