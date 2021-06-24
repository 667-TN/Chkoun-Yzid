const router = require('express').Router();
const carController = require("../controllers/car.controller.js")

router.get("/", carController.selectAllCars);
router.get('/:id', carController.selectOneCar);

module.exports = router;
