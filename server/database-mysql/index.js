var mysql = require("mysql2");

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "55691719Az",
  database: "chkounyzid"
});

module.exports = connection;
