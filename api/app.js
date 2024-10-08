const express = require("express");
const cors = require("cors");
const logger = require("./middleware/logger");
const usersRouter = require("./routers/usersRouter");
//const countriesRouter = require("./routers/countriesRouter");
const quizResultsRouter = require("./routers/quizResultsRouter");
const feedbackRouter = require("./routers/feedbackRouter");
const quizQuestionsRouter = require("./routers/quizQuestionsRouter");
const leaderboardRouter = require("./routers/leaderboardRouter");

const app = express();
app.use(cors());
app.use(express.json());
app.use(logger);
app.use("/", express.static("../client"));
app.use("/users", usersRouter);
app.use("/quiz-results", quizResultsRouter);
app.use("/feedback", feedbackRouter);
app.use("/quiz-questions", quizQuestionsRouter);

app.use("/leaderboard", leaderboardRouter);

module.exports = app;
