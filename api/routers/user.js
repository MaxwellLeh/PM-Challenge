// const { Router } = require("express");
// const userController = require("../controllers/users");

// const userRouter = Router();

// userRouter.post("/login", userController.login);
// userRouter.post("/signup", userController.signup);

// module.exports = userRouter;
//
const express = require('express')
const usersControllers= require('../controllers/users.js')
const usersRouter = express.Router()
console.log("In entries Router line 4")
//usersRouter.post('/login', usersControllers.showOneForAuthentication)
//usersRouter.post('/register', usersControllers.createRegister)


module.exports = usersRouter