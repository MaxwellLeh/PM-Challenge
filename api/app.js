const express = require("express");
const cors=require('cors')
//const usersRouter = require("./routers/user.js");
// const countriesRouter = require("./routers/countriesRouter");
const quizResultsRouter = require("./routers/quizResultsRouter");
const feedbackRouter = require("./routers/feedbackRouter.js");
const quizQuestionsRouter = require("./routers/quizQuestionsRouter.js");
//const leaderboardRouter = require("./routers/leaderBoardRouter.js")
const app = express();
app.use(cors())
app.use(express.json());
//app.use("/users", usersRouter);
//app.use("/countries", countriesRouter);
app.use("/quiz-results", quizResultsRouter);
app.use("/feedback", feedbackRouter);
app.use("/quiz-questions", quizQuestionsRouter);
//app.use('/leaderboard', leaderboardRouter)


module.exports = app

