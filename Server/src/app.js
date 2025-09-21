const express = require("express");
const cors = require("cors");
const authRoutes = require("../src/routes/auth.routes.js");

const app = express();
app.use(cors());
app.use(express.json());

app.get("/", (req, res) => res.send("Hemlo World!"));
app.use("/api/auth", authRoutes);

module.exports = app;