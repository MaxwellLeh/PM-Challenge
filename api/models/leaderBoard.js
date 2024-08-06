const db = require('../database/connect');

class Leaderboard {
    constructor({ first_name, last_name, total_score, role, advice }) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.total_score = total_score;
        this.role = role;
        this.advice = advice;
    }

    getFullName() {
        return `${this.first_name} ${this.last_name}`;
    }

    static async getStudentLeaderboard() {
        const query = `
        SELECT U.first_name, U.last_name, SUM(QR.total_score) as total_score
        FROM Users U
        JOIN QuizResults QR ON U.user_id = QR.student_id
        WHERE U.role = 'Student'
        GROUP BY U.user_id, U.first_name, U.last_name
        ORDER BY SUM(QR.total_score) DESC
    `;
    const [results] = await db.execute(query);
    return results.map(row => new Leaderboard({ ...row, role: 'Student' }));
    }

    static async getTeacherLeaderboard() {
        const query = `
            SELECT first_name, last_name, total_score, advice 
            FROM teachers 
            ORDER BY total_score DESC
        `;
        const [results] = await db.execute(query);
        return results.map(row => new Leaderboard({ ...row, role: 'Teacher' }));
    }
}

module.exports = Leaderboard;