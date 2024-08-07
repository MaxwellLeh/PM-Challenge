<<<<<<< HEAD
/*const express = require("express");
const { getQuizResults } = require("../controllers/quizResultsController");
=======
const express = require("express");
const { createResult, getResult, index} = require("../controllers/quizResultsController");
>>>>>>> 38f30b00a00f7b462969d6caa111bf3205dd064d

const router = express.Router();
router.get("/", index);
router.get("/:id", getResult);
router.post("/", createResult);

module.exports = router
