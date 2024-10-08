const express = require("express");
const {
  createResult,
  getResult,
  index,
} = require("../controllers/quizResultsController");

const quizResultsRouter = express.Router();
quizResultsRouter.get("/", index);
quizResultsRouter.get("/:id", getResult);
quizResultsRouter.post("/", createResult);

module.exports = quizResultsRouter;
