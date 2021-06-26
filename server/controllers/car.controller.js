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



var selectOneCar = function(req, res) {
  let id = req.params.id
  let syntax = `SELECT * from Car WHERE id="${id}"`
   db.query(syntax,(err, cars)=> {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(cars);
    }
   })
};

var addACar = function(req,res){
  const { car_name, car_price, location, user_id, url , status , nb_bids , make , model , VIN , description , mileage , transimission } = req.body;
  const params =[car_name, car_price, location, user_id, url , status , nb_bids , make , model , VIN , description , mileage , transimission];
  let syntax = "INSERT into Car (car_name, car_price, location, user_id, url , status , nb_bids , make , model , VIN , description , mileage , transimission) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
  db.query(syntax, params, (err, car) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(car);
    }
  });
}

module.exports = { selectAllCars, selectOneCar, addACar };
