const express = require("express");

const {
  getStudentLeaderboard,
  getTeacherLeaderboard,
} = require("../controllers/leaderboardController");

const router = express.Router();

router.get("/students", getStudentLeaderboard);
//router.get("/teachers", getTeacherLeaderboard);

module.exports = router;
