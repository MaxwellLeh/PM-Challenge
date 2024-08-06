const express = require("express");
<<<<<<< HEAD
const cors = require("cors")
const logger = require("./middleware/logger")

=======

const usersRouter = require("./routers/usersRouter");
>>>>>>> 5b91687f90b450260a6e480d41d93645fc4e3eee
const countriesRouter = require("./routers/countriesRouter");
const quizResultsRouter = require("./routers/quizResultsRouter");
const feedbackRouter = require("./routers/feedbackRouter");
const quizQuestionsRouter = require("./routers/quizQuestionsRouter");
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

