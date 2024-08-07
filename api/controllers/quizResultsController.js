const QuizResults = require("../models/quizResultModel.js");
const jwt = require("jsonwebtoken");

const index = async (req, res) => {
  try {
    const response = await QuizResults.showAllQuizResults();

    res.status(200).json(response);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

const getResult = async (req, res) => {
  try {
    const id = req.params.id;

    const response = await QuizResults.showOneQuizResult(id);

    res.status(200).json(response);
  } catch (err) {
    res.status(404).json({ error: err.message });
  }
};

const createResult = async (req, res) => {
  try {
    const token = req.headers.authorization;
    console.log(token);
    var decoded = jwt.verify(token, process.env.SECRET_TOKEN);
    console.log(token, decoded);
    const data = req.body;
    const d = {
      student_id: decoded.userId,
      country_id: data.country_id,
      total_score: data.total_score,
      rank: data.rank,
      student_answer: "",
      time_taken: "00:01:00",
    };

    const response = await QuizResults.create(d);
    res.status(201).json(response);
  } catch (err) {
    console.error(err);
    res.status(404).json({ error: err.message });
  }
};

module.exports = { createResult, getResult, index };
