
questionNumber = 1
score=0


function showFirstQuestion(e){
    const jsonData = getQuestions()
    const firstQuestion=jsonData
    if (result = true){
        score+=1
    }
    questionNumber+=1
    addQuestionToHtml(jsonData, questionNumber)   

}


function checkResultAndChangeQuestion(e, questionNumber){
    const jsonData = getQuestions()
    const result= checkScoreQuestion(e, jsonData)
    if (result = true){
        score+=1
    }
    questionNumber+=1
    addQuestionToHtml(jsonData, questionNumber)   

}

function getQuestions(){
    const quizJson = require('./quiz.json')
    return quizJson
}

function addQuestionToHtml(json, questionNumber){
    try{
        if (questionNumber <= 20) {
        const question = json[questionNumber]
        const questionOptions = question["options"]
        const h2=document.querySelector("h2")
        h2.textContent = question["question"]
        
        for (let i=0; i<questionOptions; i++){
            const div=document.createElement("div")
            const input= document.createElement("input")
            input.value=questionOptions[i]
            input.className="quizInput"
            div.appendChild(input)
        }
        } else {
            throw new Error("questionNumber is above 20.")
            
        }
    } catch (err){
        return {error: err.message}
    }
        
    


}

function checkScoreQuestion(e, jsonData){
    const userInput = e.target.value.toLowercase()
    const answer = jsonData[questionNumber]["correct-answer"].toLowercase()

    if (userInput === answer){
        return true
    }
    else{
        return false
    }


}



module.exports = {addQuestionToHtml, getQuestions}