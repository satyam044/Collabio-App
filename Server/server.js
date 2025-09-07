const dotenv = require("dotenv");
const app = require("./src/app.js");
const connectDB = require("./src/db/db.js");
dotenv.config();
const PORT = process.env.PORT || 3000;

connectDB();
app.listen(PORT, () => {
    console.log("Server is running on PORT:", PORT);
})
