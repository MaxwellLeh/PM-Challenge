const express = require('express')
const cors = require('cors')
const feedbackRouter = require('./routers/feedback.js')
const app = express()

app.use(cors())
app.use(express.json())
app.use('/', feedbackRouter)

module.exports = app