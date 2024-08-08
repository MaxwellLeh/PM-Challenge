const quizQuestionModel = require("../models/quizQuestionModel");

const getCountryQuestions = async (req, res) => {
  try {
    const id = req.params.id;

    const response = await quizQuestionModel.showCountryQuestions(id);
    res.status(200).json(response);
  } catch (err) {
    res.status(404).json({ error: err.message });
  }
};

module.exports = { getCountryQuestions };
