var db = require("../database-mysql");
const jwt = require('jsonwebtoken')

var selectAll = function (req, res) {
    db.query("SELECT * FROM User", (err, items, fields) => {
      if (err) {
        res.status(500).send(err);
      } else {
        res.status(200).send(items);
      }
    });
    
  };


  module.exports = { selectAll };
 