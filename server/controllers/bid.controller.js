var db = require("../database-mysql");

var addBid = function (req, res) {
  const { amount, time_stamp, car_id, user_id } = req.body;
  console.log(req.body)
  const params = [amount, time_stamp, car_id, user_id];
  let syntax = "INSERT into Bid (amount, time_stamp, car_id, user_id) values (?,?,?,?)";
  db.query(syntax, params, (err, bid) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(bid);
    }
  });
};

var selectAllBids = function (req, res) {
    db.query("SELECT * FROM Bid", (err, cars, fields) => {
      if (err) {
        res.status(500).send(err);
      } else {
        res.status(200).send(cars);
      }
    });
  };

  module.exports = { selectAllBids, addBid };