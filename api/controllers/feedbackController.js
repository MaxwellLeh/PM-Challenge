console.log("In entries controller line 1")
const Feedback= require('../models/Feedback')
const User = require('../models/User')

/*const index = async (req, res) =>{

    console.log("In index controller")
    try{
    console.log("try blcok in index")
    const response = await Entry.showAll()
    console.log("This is response in try block in index: ", response)

    res.status(200).json(response)
    } catch (err) {
        console.log('In catch line 14 index controller')
        res.status(500).json({error: err.message})
    }


}*/
/*const showOneForAuthentication = async (req, res) =>{

    try{
    const data=req.body
   
    const response = await User.showOneUserEntry(data)
    console.log("This is response in try block in index: ", response)

    res.status(200).json(response)
    } catch (err) {
        
        res.status(404).json({error: err.message})
    }


}*/

console.log('line 19 controller')
const create = async (req, res) =>{
    try{
        
        const data = req.body
        console.log('The data in create in controller is: ', data)
    
        const response = await Feedback.create(data)
        console.log('The response in create in controller is: ', response)
        res.status(201).json(response)
    } catch (err) {
        res.status(404).json({error: err.message})
    }


}


/*const update = async (req, res) =>{
    try{
        const data = req.body
        const id = req.params.id
        const entryObject = await Entry.showOneEntry(id)
        const response = await entryObject.update(data)
        console.log('The response in update in controller is: ', response)
        res.status(200).json(response)
    } catch (err) {
        res.status(404).json({error: err.message})
    }


}*/

/*const destroy = async (req, res) =>{
    try{
        const id = req.params.id
        const entryObject = await Entry.showOneEntry(id)
        const response = await entryObject.delete()
        console.log('The response in update in controller is: ', response)
        res.status(200).end()
    } catch (err) {
        res.status(409).json({error: err.message})
    }


}*/

module.exports = {create}