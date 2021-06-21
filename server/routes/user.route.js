const router = require('express').Router();
const userController = require("../controllers/user.controller.js")

router.post("/login", userController.login);
router.post("/signup", userController.signup);
router.post("/verify", userController.verify);

module.exports = router;
