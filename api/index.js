const app = require('./app.js')
require('dotenv').config()
const port = process.env.PORT

app.listen(port, (req, res) => {
    console.log(`server is listening at port number ${port}`)
})

//app.get('/', (req,res)=>{
    //res.send("Welcome to Diary API")
//})
