const express = require("express");
const itemRoutes = require("./routes/item.routes");
const cors = require('cors')
// TODO: Update this
// UNCOMMENT THE DATABASE YOU'D LIKE TO USE
var items = require("./database-mysql");
// var items = require('./database-mongo');

const app = express();
const PORT = process.env.PORT || 8000;

app.use(cors())
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(__dirname + "../build/build.js"));

app.use("/api", itemRoutes);
// app.use("/api/users", userRoutes);

app.listen(PORT, function() {
  console.log("listening on port 8000!");
});
