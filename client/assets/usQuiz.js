const form = document.querySelector(".form");
let questions = [];
let currentQuestion = [];
let score = 0;
form.addEventListener("submit", async function (e) {
  e.preventDefault();
  console.log("Listening event");
  const clicked = e.submitter.textContent;
  const index = questions.indexOf(currentQuestion);
  // if send after every question fetch request here
  if (index + 1 !== questions.length) {
    if (clicked === currentQuestion.correct_answer) {
      score++;
    }
    currentQuestion = questions[index + 1];
    updatedom();
  } else {
    await saveResults(score, 1, Math.floor(score / questions.length)); // Change conuntry code 2
    // if send at end to results fetch request here
    window.location.assign("leaderboard.html");
  }
});
const saveResults = async (score, country_id, rank) => {
  const options = {
    method: "POST",
    headers: {
      authorization: localStorage.getItem("token"),
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      total_score: score,
      country_id: country_id,
      rank: rank,
    }),
  };
  const response = await fetch("http://localhost:3000/quiz-results/", options);
  console.log("save result ", response);
  return response.ok;
};
const fetchQuestions = async () => {
  const response = await fetch("http://localhost:3000/quiz-questions/1"); // Change conuntry code 2

  if (!response.ok) {
    console.log("err");
  }

  const data = await response.json();
  questions = data;
  currentQuestion = questions[0];
  updatedom();
};

fetchQuestions();

const updatedom = () => {
  const titleEl = document.querySelector(".question");
  titleEl.textContent = currentQuestion.question_text;

  const scoreEl = document.querySelector(".score");
  scoreEl.textContent = score;

  const { correct_answer, option_2, option_3, option_4 } = currentQuestion;
  const options = [correct_answer, option_2, option_3, option_4];
  const elements = document.querySelectorAll(".quiz-buttons");
  elements.forEach((el, i) => {
    el.textContent = options[i];
  });
};
