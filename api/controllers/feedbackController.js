console.log("In entries controller line 1")
const Feedback= require('../models/feedbackModel')
// const User = require('../models/User')

const index = async (req, res) =>{

    try{
    const response = await Feedback.showAllFeedback()

    res.status(200).json(response)
    } catch (err) {
        res.status(500).json({error: err.message})
    }


}

const getFeedback = async (req, res) =>{

    try{
    const id = req.params.id
   
    const response = await Feedback.showOneFeedback(id)

    res.status(200).json(response)
    } catch (err) {
        
        res.status(404).json({error: err.message})
    }


}

const createFeedback = async (req, res) =>{
    try{
        
        const data = req.body
    
        const response = await Feedback.create(data)
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

module.exports = {createFeedback, getFeedback, index}