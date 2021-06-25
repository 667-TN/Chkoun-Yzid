const router = require('express').Router();
const bidController = require("../controllers/bid.controller.js")

router.get("", bidController.selectAllBids);
router.post("", bidController.addBid);


module.exports = router;