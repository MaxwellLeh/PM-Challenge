const db = require('../database/connect')

require('dotenv').config()
console.log("In mdoel line 3")
class quizQuestionModel{
    constructor(entryObject){
        console.log("In line 10 constructor model Question ")
        this.question_id = entryObject.question_id
        this.country_id = entryObject.country_id
        this.question_text=entryObject.question_text
        this.correct_answer=entryObject.correct_answer
        this.option_2 =entryObject.option_2
        this.option_3 =entryObject.option_3
        this.option_4 =entryObject.option_4
        this.difficulty = entryObject.difficulty
    }

    /*static async showAll(){
    
        const response = await db.query('SELECT * FROM diary_entries;')
        if (response.rows.length === 0){
            throw new Error("Table in database has no Entries")
        } 
        return response.rows.map(item => new Entry(item))
    }*/

    static async showCountryQuestions(id){
        console.log("In line 31 Model Country Questions")
        const response = await db.query('SELECT * FROM quizquestions WHERE country_id=$1;',[id])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length === 0){
            throw new Error("questions are not in table i.e. cannot find username in users table.")
        } 

        return response.rows.map(item => new quizQuestionModel(item))
    }

    /*static async create(data){
        console.log("Increate in model")
        const role = data.role
        const improvement = data.improvement
        const comments= data.comments
        const additional_comments = data.additional_comments
        const rating = data.rating
    
        console.log("In create in Model")
        const response = await db.query('INSERT INTO feedback_form (role, comments, improvement, additional_comments,rating) VALUES ($1, $2, $3, $4, $5) RETURNING *;', [role, comments, improvement, additional_comments, rating])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error("feedback entry already exists.")
        } 
        return new Feedback(response.rows[0])
    }
    */
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

module.exports = quizQuestionModel