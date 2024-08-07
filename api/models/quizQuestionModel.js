
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


    static async showCountryQuestions(id){
        console.log("In line 31 Model Country Questions")
        const response = await db.query('SELECT * FROM quizquestions WHERE country_id=$1;',[id])
        console.log("This is response in Model, in create: ", response)
        if (response.rows.length === 0){
            throw new Error("questions are not in table i.e. cannot find username in users table.")
        } 

        return response.rows.map(item => new quizQuestionModel(item))
    }


}

module.exports = quizQuestionModel