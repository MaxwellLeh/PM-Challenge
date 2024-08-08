const express = require("express");
const quizQuestionController = require("../controllers/quizQuestionController.js");
const quizQuestionsRouter = express.Router();

quizQuestionsRouter.get("/:id", quizQuestionController.getCountryQuestions);

module.exports = quizQuestionsRouter;
