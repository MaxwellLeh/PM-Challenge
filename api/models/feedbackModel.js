
/*
const db = require('../database/connect')

require('dotenv').config()
console.log("In mdoel line 3")
class Feedback{
    constructor(entryObject){
        console.log("In line 6 constructor model")
        this.feedback_id = entryObject.feedback_id
        this.role = entryObject.role
        this.comments=entryObject.comments
        this.improvement =entryObject.improvement
        this.additional_comments =entryObject.additional_comments
        this.rating =entryObject.rating
        this.submitted_at = entryObject.submitted_at
    }

    static async showAllFeedback(){
        console.log("In show ALL in Model")
        console.log("In Showall function  line 14")
        const response = await db.query('SELECT * FROM feedback;')
        if (response.rows.length === 0){
            throw new Error("Table in database has no Entries")
        } 
        return response.rows.map(item => new Feedback(item))
    }

    static async showOneFeedback(id){
        const response = await db.query('SELECT * FROM feedback WHERE feedback_id=$1;',[id])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error("User details are not in table i.e. cannot find username in users table.")
        } 
        return new Feedback(response.rows[0])
    }

    static async create(data){
        console.log("Increate in model")
        const role = data.role
        const improvement = data.improvement
        const comments= data.comments
        const additional_comments = data.additional_comments
        const rating = data.rating
    
        console.log("In create in Model")
        const response = await db.query('INSERT INTO feedback (role, comments, improvements, additional_comments,rating) VALUES ($1, $2, $3, $4, $5) RETURNING *;', [role, comments, improvement, additional_comments, rating])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error("feedback entry already exists.")
        } 
        return new Feedback(response.rows[0])
    }

    /*async update(data){
       const id= this.id
        const description = data.description
        console.log("Object in update in model", this)
        console.log("In create in Model")
        const response = await db.query('UPDATE diary_entries SET description=$1 WHERE id=$2 RETURNING *;', [description, id])
        console.log("This is response in Model, in update: ", response)
        if (response.rows.length !== 1){
            throw new Error("Diary entry does not exist, unable to update.")
        } 
        return new Entry(response.rows[0])
    }

    async delete(){
        const id= this.id
        const response = await db.query('DELETE FROM diary_entries WHERE id=$1 RETURNING *;', [id])
        return new Entry(response.rows[0])
    }*/

}

module.exports = Feedback