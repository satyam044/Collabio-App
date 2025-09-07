const User = require("../models/user.model.js");
const bcrypt = require("bcryptjs");
const { cloudinary } = require("../services/cloudinary.js");
const { setUser } = require("../services/auth.js");

async function getUsers(req, res) {
    try {
        const users = await User.find();
        res.status(200).json({ success: true, message: "Users fetched successfully", users });
    } catch (err) {
        res.status(500).json({ success: false, message: "Failed to fetch users", error: err.message });
    }
}

async function registerUser(req, res) {
    try {
        const { email, password, profilePic, name, userName, bio } = req.body;
        const user = await User.findOne({ email });

        if (user) {
            return res.status(400).json({ success: false, message: "User Already Exists" });
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
        })

        const token = setUser(newUser._id);
        res.cookie("token", token);

        res.status(201).json({
            success: true,
            userData: {
                id: newUser._id,
                profilePic: profilePicUrl,
                name: newUser.name,
                userName: newUser.userName,
                bio: newUser.bio,
            },
            token,
            message: "Account Created Successfully"
        })
    } catch (err) {
        res.json({
            success: false,
            message: "Something went wrong!",
        });
    }
}

async function loginUser(req, res) {
    try {
        const { email, password } = req.body;
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({
                success: false,
                message: "Invalid Email or Password",
            });
        }

        const isPasswordCorrect = await bcrypt.compare(password, user.password);
        if (!isPasswordCorrect) {
            return res.status(400).json({
                success: false,
                message: "Invalid Email or Password",
            });
        }

        const token = setUser(user._id);
        res.cookie("token", token);
        res.status(200).json({
            success: true,
            userData: {
                id: user._id,
                profilePic: user.profilePic,
                name: user.name,
                userName: user.userName,
                bio: user.bio,
            },
            token,
            message: "Login Successfully"
        })
    } catch (err) {
        res.json({ success: false, message: "Something went wrong" });
    }
}

async function updateProfile(req, res) {
    try {
        const { profilePic, name, userName, bio } = req.body;
        const userId = req.user._id;
        let updatedUser;

        if (!profilePic) {
            updatedUser = await User.findByIdAndUpdate(userId, { name, userName, bio }, { new: true });
        } else {
            const upload = await cloudinary.uploader.upload(profilePic);
            updatedUser = await User.findByIdAndUpdate(userId, { profilePic: upload.secure_url, name, userName, bio }, { new: true });
        }
        res.status(200).json({
            success: true,
            userData: updatedUser,
        });
    } catch (err) {
        res.json({ success: false, message: "Something went wrong" });
    }
}

async function logoutUser(req, res) {
    try {
        res.clearCookie("token");
        res.status(200).json({
            success: true,
            message: "User Logged Out Successfully"
        })
    } catch (err) {
        res.json({ success: false, message: "Something went wrong" });
    }
}

module.exports = {
    getUsers,
    registerUser,
    loginUser,
    updateProfile,
    logoutUser
}