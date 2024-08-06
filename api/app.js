const express = require("express");
const usersRouter = require("./api/routers/usersRouter");
const countriesRouter = require("./api/routers/countriesRouter");
const quizResultsRouter = require("./api/routers/quizResultsRouter");
const feedbackRouter = require("./api/routers/feedbackRouter");
const quizQuestionsRouter = require("./api/routers/quizQuestionsRouter");

const app = express();
app.use(express.json());
app.use("/users", usersRouter);
app.use("/countries", countriesRouter);
app.use("/quiz-results", quizResultsRouter);
app.use("/feedback", feedbackRouter);
app.use("/quiz-questions", quizQuestionsRouter);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
