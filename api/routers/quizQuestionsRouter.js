
const express = require('express')
const quizQuestionController= require('../controllers/quizQuestionController.js')
const quizQuestionsRouter = express.Router()
console.log("In entries Router line 4")
//In
quizQuestionsRouter.get('/:id', quizQuestionController.getCountryQuestions)
//usersRouter.post('/register', usersControllers.createRegister)


module.exports = quizQuestionsRouter