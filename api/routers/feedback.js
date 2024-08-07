const express = require("express");
// const userController = require("../controllers/users");

// const userRouter = Router();

// userRouter.post("/login", userController.login);
// userRouter.post("/signup", userController.signup);

// module.exports = userRouter;
//

const feedbackControllers= require('../controllers/feedbackController.js')
const feedbackRouters = express.Router()
console.log("In entries Router line 4")
feedbackRouters.post('/feedback', feedbackControllers.create)
//usersRouter.post('/register', usersControllers.createRegister)


module.exports = feedbackRouters