const Leaderboard = require("../models/leaderBoard");


const getStudentLeaderboard = async (req, res) => {
    try {
        const leaderboardData = await Leaderboard.getStudentLeaderboard();
        const data = leaderboardData.map((entry, index) => ({
            name: entry.getFullName(),
            score: entry.total_score,
            rank: index + 1
        }));
        res.json({ userRole: 'Student', data });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error fetching student leaderboard' });
    }
};

/*const getStudentLeaderboard = async (req, res) => {
    try {
        const data = await Leaderboard.getStudentLeaderboard(); 
        res.status(200).json({ role: 'Student', data });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error fetching student leaderboard' });
    }
};*/


const getTeacherLeaderboard = async (req, res) => {
    try {
        const leaderboardData = await Leaderboard.getTeacherLeaderboard();
        const data = leaderboardData.map(entry => ({
            name: entry.getFullName(),
            score: entry.total_score,
            advice: entry.advice
        }));
        res.json({ userRole: 'teacher', data });
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Error fetching teacher leaderboard' });
    }
};

module.exports = {
    getStudentLeaderboard,
    getTeacherLeaderboard
};
