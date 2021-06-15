const router = require('express').Router();
const itemController = require("../controllers/item.controller");

router.get("/", itemController.selectAll);
router.post("/", itemController.addItem );
router.delete("/:id", itemController.deleteItem);


module.exports = router;
