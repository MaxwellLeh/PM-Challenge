const { Router } = require('express');

const leaderboardController = require('../controllers/leaderboardController');
const leaderboardRouter = Router();


leaderboardRouter.get("/leaderboard", leaderboardController.index);
leaderboardRouter.get("/leaderboard/:id", leaderboardController.show);
leaderboardRouter.patch("/leaderboard/:id", leaderboardController.update);
leaderboardRouter.post("/leaderboard", leaderboardController.create);

module.exports = leaderboardRouter;
