const express = require("express");
const { registerUser, loginUser, logoutUser, updateProfile, getUsers } = require("../controllers/auth.controller");
const { protectRoute } = require("../middlewares/auth.middleware.js");

const router = express.Router();

router.get("/user/users", protectRoute, getUsers);
router.post("/user/register", registerUser);
router.post("/user/login", loginUser);
router.post("/user/update-profile", protectRoute, updateProfile);
router.post("/user/logout", protectRoute, logoutUser);

module.exports = router;