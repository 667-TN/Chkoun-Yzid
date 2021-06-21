// DELETE THIS LINE


// UNCOMMENT THE DATABASE YOU'D LIKE TO USE
var db = require("../database-mysql");




var selectAllCars = function (req, res) {
  db.query("SELECT * FROM Car", (err, cars, fields) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(cars);
    }
  });
};

module.exports = { selectAllCars };
