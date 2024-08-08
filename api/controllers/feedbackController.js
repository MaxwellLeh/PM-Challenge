console.log("In entries controller line 1")
const Feedback= require('../models/feedbackModel.js')
//const User = require('../models/User')

const index = async (req, res) =>{

    console.log("In index controller")
    try{
    console.log("try blcok in index")
    const response = await Feedback.showAllFeedback()
    console.log("This is response in try block in index: ", response)

    res.status(200).json(response)
    } catch (err) {
        console.log('In catch line 14 index controller')
        res.status(500).json({error: err.message})
    }


}

const getFeedback = async (req, res) =>{

    try{
    const id = req.params.id
   
    const response = await Feedback.showOneFeedback(id)
    console.log("This is response in try block in index: ", response)

    res.status(200).json(response)
    } catch (err) {
        
        res.status(404).json({error: err.message})
    }


}

console.log('line 19 controller')
const createFeedback = async (req, res) =>{
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

module.exports = {createFeedback, getFeedback, index}