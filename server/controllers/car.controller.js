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

  const { car_name, car_price, location, user_id, url  , make , model , VIN , description , mileage , transimission } = req.body;
  console.log("body",req.body)
  const params =[car_name, car_price, location, user_id, url , make , model , VIN , description , mileage , transimission];
  let syntax = `INSERT INTO Car (car_name, car_price, location, user_id, url , make , model , VIN , description , mileage , transimission) VALUES (?,?,?,?,?,?,?,?,?,?,?);`


  db.query(syntax, params, (err, car) => {
    if (err) {
      res.status(500).send(err);
      console.log("error post car:", err)
    } else {
      res.status(200).send(car);
      console.log("posted:", car)
    }
  });
};

var  updateACar = function(req, res) {
  let id = Number(req.params.id)
  let updatedCar=req.body
  delete updatedCar.id
  const query=Object.keys(updatedCar).join(" = ? , ")+"=?"
  const values=Object.values(updatedCar)
  let syntax = `UPDATE car SET ${query} WHERE car.id=${id}`
  console.log("query",query,"values",values,"syntax",syntax)
   db.query(syntax,values,(err, cars)=> {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(cars);
    }
   })
};

module.exports = { selectAllCars, selectOneCar, addACar, updateACar };
