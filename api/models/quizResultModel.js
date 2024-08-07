// c

const db = require('../database/connect')

require('dotenv').config()
console.log("In mdoel line 3")
class QuizResults{
    constructor(entryObject){
        console.log("In line 6 constructor model")
        this.result_id = entryObject.result_id
        this.student_id = entryObject.student_id
        this.country_id=entryObject.country_id
        this.student_answer =entryObject.student_answer
        this.total_score=entryObject.total_score
        this.rank=entryObject.rank
        this.time_taken = entryObject.time_taken
    }

    static async showAllQuizResults(){
        console.log("In show ALL in Model")
        console.log("In Showall function  line 14")
        const response = await db.query('SELECT * FROM quizresults;')
        if (response.rows.length === 0){
            throw new Error("Table in database has no Entries")
        } 
        return response.rows.map(item => new QuizResults(item))
    }

    static async showOneQuizResult(id){
        const response = await db.query('SELECT * FROM quizresults WHERE result_id=$1;',[id])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error("Result is not in table.")
        } 
        return new QuizResults(response.rows[0])
    }

    static async create(data){
        console.log("Increate in model")
        const country_id = data.country_id
        const student_id = data.student_id
        const student_answer = data.student_answer
        const total_score= data.total_score
        const rank = data.rank
        const time_taken= data.time_taken
    
        console.log("In create in Model")
        const response = await db.query('INSERT INTO quizresults (student_id, country_id, student_answer, total_score, rank ,time_taken) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *;', [student_id, country_id, student_answer, total_score, rank ,time_taken])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length !== 1){
            throw new Error(" Result entry already exists.")
        } 
        return new QuizResults(response.rows[0])
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

module.exports = QuizResults