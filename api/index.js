require("dotenv").config();

const app = require('./app')


const port = process.env.PORT

console.log("module check 1")


app.listen(port, (req, res) => {
    console.log(`server is listening at port number ${port}`)
})



