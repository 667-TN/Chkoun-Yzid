const router = require('express').Router();
const carController = require("../controllers/car.controller.js")

router.get("/", carController.selectAllCars);

module.exports = router;
