var db = require("../database-mysql");

var addQuestionAndAnswer = function (req, res) {
  const { question, answer, car_id, user_id } = req.body;
  console.log(req.body)
  const params = [question, answer, car_id, user_id];
  let syntax = "INSERT into QuestionAndAnswers (question, answer, car_id, user_id) values (?,?,?,?)";
  db.query(syntax, params, (err, QuestionAndAnswers) => {
    if (err) {
      res.status(500).send(err);
    } else {
      res.status(200).send(QuestionAndAnswers);
    }
  });
};

var selectAllQuestionAndAnswer = function (req, res) {
    db.query("SELECT * FROM QuestionAndAnswers", (err, QuestionAndAnswers, fields) => {
      if (err) {
        res.status(500).send(err);
      } else {
        res.status(200).send(QuestionAndAnswers);
      }
    });
  };

  module.exports = { addQuestionAndAnswer, selectAllQuestionAndAnswer };