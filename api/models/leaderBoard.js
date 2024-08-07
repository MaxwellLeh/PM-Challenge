const db = require('../database/connect');

console.log("MODEL 0.5")

class Leaderboard {
    constructor({ first_name, last_name, total_score, role, advice }) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.total_score = total_score;
        this.role = role;
        this.advice = advice;
    }
    getFullName() {
        console.log("MODEL 0.7")
        return `${this.first_name} ${this.last_name}`;
    }

    static async getStudentLeaderboard() {
       console.log("MODEL 1")
        const data = `
        SELECT U.first_name, U.last_name, SUM(QR.total_score) as total_score
        FROM Users U
        JOIN QuizResults QR ON U.user_id = QR.student_id
        WHERE U.role = 'Student'
        GROUP BY U.user_id, U.first_name, U.last_name
        ORDER BY SUM(QR.total_score) DESC`;
    const results = await db.query(data);
    return results.rows.map(row => new Leaderboard({ ...row, role: 'Student' }));
    }

    static async getTeacherLeaderboard() {
        const query = `
            SELECT first_name, last_name, total_score, advice  
            FROM teachers 
            ORDER BY total_score DESC
        `;
        const results = await db.query(query);
        return results.rows.map(row => new Leaderboard({ ...row, role: 'Teacher' }));
    }
}

module.exports = Leaderboard;