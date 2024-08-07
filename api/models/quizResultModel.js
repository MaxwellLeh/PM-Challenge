const db = require("../database/connect");

require("dotenv").config();
class QuizResults {
  constructor(entryObject) {
    this.result_id = entryObject.result_id;
    this.student_id = entryObject.student_id;
    this.country_id = entryObject.country_id;
    this.student_answer = entryObject.student_answer;
    this.total_score = entryObject.total_score;
    this.rank = entryObject.rank;
    this.time_taken = entryObject.time_taken;
  }

  static async showAllQuizResults() {
    const response = await db.query("SELECT * FROM quizresults;");
    if (response.rows.length === 0) {
      throw new Error("Table in database has no Entries");
    }
    return response.rows.map((item) => new QuizResults(item));
  }

  static async showOneQuizResult(id) {
    const response = await db.query(
      "SELECT * FROM quizresults WHERE result_id=$1;",
      [id]
    );
    if (response.rows.length !== 1) {
      throw new Error("Result is not in table.");
    }
    return new QuizResults(response.rows[0]);
  }

  static async create(data) {
    const country_id = data.country_id;
    const student_id = data.student_id;
    const student_answer = data.student_answer;
    const total_score = data.total_score;
    const rank = data.rank;
    const time_taken = data.time_taken;

    const response = await db.query(
      "INSERT INTO quizresults (student_id, country_id, student_answer, total_score, rank ,time_taken) VALUES ($1, $2, $3, $4, $5, $6) RETURNING *;",
      [student_id, country_id, student_answer, total_score, rank, time_taken]
    );
    if (response.rows.length !== 1) {
      throw new Error(" Result entry already exists.");
    }
    return new QuizResults(response.rows[0]);
  }
}

module.exports = QuizResults;
