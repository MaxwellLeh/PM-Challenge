const db = require("../database/connect");

class Leaderboard {
  constructor({
    first_name,
    last_name,
    total_score,
    rank,
    role,
    advice,
    designation,
  }) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.total_score = total_score;
    this.rank = rank;
    this.role = role;
    this.designation = designation;
    this.advice = advice;
  }

  getFullName() {
    return `${this.first_name} ${this.last_name}`;
  }

  // static assignRank(total_score) {
  //   if (total_score === 105) {
  //     return "Prime Minister";
  //   } else if (total_score >= 85 && total_score < 105) {
  //     return "Deputy Prime Minister";
  //   } else if (total_score >= 65 && total_score < 85) {
  //     return "Minister of State";
  //   } else if (total_score >= 40 && total_score < 65) {
  //     return "Secretary of State";
  //   } else {
  //     return "Civil Servant";
  //   }
  // }

  // static async getDesignationById(user_id) {
  //   const data = `
  //       SELECT designation, total_score
  //       FROM QuizResults
  //       WHERE student_id = $1`;

  //   const designation = db.query(data, [user_id]);
  // }

  static async getStudentLeaderboard() {
    const data = `
        SELECT U.first_name, U.last_name, QR.designation, SUM(QR.total_score) as total_score
        FROM Users U
        JOIN QuizResults QR ON U.user_id = QR.student_id
        WHERE U.role = 'Student'
        GROUP BY U.user_id, U.first_name, U.last_name
        ORDER BY SUM(QR.total_score) DESC`;

    const results = await db.query(data);

    return results.rows.map((row) => {
      const rank = Leaderboard.assignRank(row.total_score);
      return new Leaderboard({ ...row, rank, role: "Student" });
    });
  }
}
//module
module.exports = Leaderboard;
