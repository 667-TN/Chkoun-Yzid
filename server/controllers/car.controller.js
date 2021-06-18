// DELETE THIS LINE


// UNCOMMENT THE DATABASE YOU'D LIKE TO USE
var db = require("../database-mysql");
// var Item = require('../database-mongo/Item.model.js');

// UNCOMMENT IF USING MYSQL WITH CALLBACKS
////



var selectAllCars = function (req, res) {
  db.query("SELECT * FROM Car", (err, items, fields) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(items);
    }
  });
};
// var addItem = function(req, res) {
//   db.query("INSERT INTO items (name, quantity,  price, description) VALUES (?, ?, ?, ?)",[req.body.name, req.body.quantity, req.body.price, req.body.description ], function (err,result) {
//     if(err) res.status(404).send(err)
//     console.log(result)
//      res.status(201).json(result)
//   } )
// }
// var deleteItem = function (req, res) {
//   console.log(req.params)
//   db.query("DELETE FROM items WHERE id = ? ",[req.params.id], (err,result)=>{  
//     if(err) res.status(500).send(err)
//     res.status(202).send(result)
//   })
// }


module.exports = { selectAllCars };
