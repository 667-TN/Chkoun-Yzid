const router = require('express').Router();
const Controller = require("../controllers/index.js")

router.get("/users", Controller.userController.selectAll);
router.get("/cars", Controller.carController.selectAllCars);


// router.post("/", itemController.addItem );
// router.delete("/:id", itemController.deleteItem);


module.exports = router;
