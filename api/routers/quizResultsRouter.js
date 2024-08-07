/*const express = require("express");
const { createResult, getResult, index} = require("../controllers/quizResultsController");

const router = express.Router();
router.get("/", index);
router.get("/:id", getResult);
router.post("/", createResult);

module.exports = router
