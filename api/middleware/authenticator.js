const User = require('../models/User')
const controller = require('../controllers/users')
const authenticator = async (req, res) =>{

    try{
    const data=req.body
   
    const response = await User.showOneUserEntry(data)
    console.log("This is response in try block in index: ", response)

    res.status(200).json(response)
    } catch (err) {
        
        res.status(404).json({error: err.message})
    }


}
module.exports(authenticator)
