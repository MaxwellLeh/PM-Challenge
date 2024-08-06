const { Router } = require('express');
const leaderboardController = require('../controllers/leaderboardController');
const leaderboardRouter = Router();

leaderboardRouter.get('/leaderboard/students', leaderboardController.getStudentLeaderboard);
leaderboardRouter.get('/leaderboard/teachers', leaderboardController.getTeacherLeaderboard);

module.exports = leaderboardRouter;