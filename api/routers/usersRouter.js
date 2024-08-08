const { Router } = require("express");

const usersController = require("../controllers/usersController.js");

const userRouter = Router();

userRouter.post("/register", usersController.register);
userRouter.post("/login", usersController.login);

module.exports = userRouter;
