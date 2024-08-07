const QuizResults = require("../models/quizResultModel.js");

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
    const data = req.body;
    const response = await QuizResults.create(data);
    res.status(201).json(response);
  } catch (err) {
    res.status(404).json({ error: err.message });
  }
};

module.exports = { createResult, getResult, index };
