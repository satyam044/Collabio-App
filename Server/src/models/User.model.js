const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
    email: {
        type: String,
        required: true,
        unique: true,
    },
    password: {
        type: String,
        required: true,
    },
    profilePic: {
        type: String,
        default: "",
    },
    name: {
        type: String,
        required: true,
        maxLength: 20,
    },
    userName: {
        type: String,
        required: true,
        unique: true,
        maxLength: 20,
    },
    bio: {
        type: String,
        maxLength: 120,
    }
}, { timestamps: true })

const User = mongoose.model("user", userSchema);

module.exports = User;