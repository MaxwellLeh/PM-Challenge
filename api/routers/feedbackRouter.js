const express = require("express");
const {
  getFeedback,
  createFeedback,
  index
} = require("../controllers/feedbackController");

const router = express.Router();
// in line 9 added dynamic parameter id, where id is the feedback_id in feedback table.
router.get("/", index )
router.get("/:id", getFeedback);
router.post("/", createFeedback);

module.exports = router;
