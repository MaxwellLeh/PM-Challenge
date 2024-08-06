const { Router } = require('express');
const leaderboardController = require('../controllers/leaderboard');
const leaderboardRouter = Router();

leaderboardRouter.get("/leaderboard", leaderboardController.index);

module.exports = leaderboardRouter;
