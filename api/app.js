const express = require("express");
const cors = require("cors")
const logger = require("./middleware/logger")

const usersRouter = require("./api/routers/usersRouter");
const countriesRouter = require("./api/routers/countriesRouter");
const quizResultsRouter = require("./api/routers/quizResultsRouter");
const feedbackRouter = require("./api/routers/feedbackRouter");
const quizQuestionsRouter = require("./api/routers/quizQuestionsRouter");
const leaderboardRouter = require("./routers/leaderboardRouter")

const app = express();
app.use(express.json());
app.use(cors())
app.use(logger)

app.use("/users", usersRouter);
app.use("/countries", countriesRouter);
app.use("/quiz-results", quizResultsRouter);
app.use("/feedback", feedbackRouter);
app.use("/quiz-questions", quizQuestionsRouter);
app.use("/leaderboard", leaderboardRouter)

app.get("/", (req, res) => {
  res.status(200).json({
    title: "Geography Game",
    description: "Play our game!"
  })
})
module.exports = app

