const router = require('express').Router();
const questionAndAnswersController = require("../controllers/question.and.answer.controller.js")

router.get("", questionAndAnswersController.addQuestionAndAnswer);
router.post("", questionAndAnswersController.selectAllQuestionAndAnswer);


module.exports = router;