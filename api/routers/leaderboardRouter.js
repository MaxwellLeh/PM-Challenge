const express = require("express");

const {
  getStudentLeaderboard,
  getTeacherLeaderboard,
} = require("../controllers/leaderboardController");

console.log("hey", getStudentLeaderboard);

const router = express.Router();

router.get("/students", getStudentLeaderboard);
router.get("/teachers", getTeacherLeaderboard);

module.exports = router;
