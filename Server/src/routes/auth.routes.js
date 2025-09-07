const express = require("express");
const { registerUser, loginUser, logoutUser, updateProfile } = require("../controllers/auth.controller");
const { protectRoute } = require("../middlewares/auth.middleware.js");

const router = express.Router();

router.post("/user/register", registerUser);
router.post("/user/login", loginUser);
router.post("/user/update-profile", protectRoute, updateProfile);
router.post("/user/logout", protectRoute, logoutUser);

module.exports = router;