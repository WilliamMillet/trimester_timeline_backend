const db = require("../config/db");

exports.postReview = (req, res) => {
    const {
      studentId,
      assignmentId,
      content = null,
      timeTakenInWeeks = null,
      reviewDate = null,
      is_anonymous
    } = req.body;
  
    // Required fields
    if (studentId === undefined || assignmentId === undefined || is_anonymous === undefined) {
      return res.status(400).json({ success: false, error: "Missing required fields: studentId, assignmentId, is_anonymous." });
    }
  
    // Parse & validate IDs
    const parsedStudentId = parseInt(studentId, 10);
    if (isNaN(parsedStudentId) || parsedStudentId <= 0) {
      return res.status(400).json({ success: false, error: "studentId must be a positive integer." });
    }
  
    const parsedAssignmentId = parseInt(assignmentId, 10);
    if (isNaN(parsedAssignmentId) || parsedAssignmentId <= 0) {
      return res.status(400).json({ success: false, error: "assignmentId must be a positive integer." });
    }
  
    // Optional content
    if (content !== null && typeof content !== "string") {
      return res.status(400).json({ success: false, error: "content must be a string." });
    }
    if (typeof content === "string" && content.length > 1000) {
      return res.status(400).json({ success: false, error: "content cannot exceed 1000 characters." });
    }
  
    // Optional timeTakenInWeeks
    let parsedTimeTakenInWeeks = null;
    if (timeTakenInWeeks !== null) {
      parsedTimeTakenInWeeks = parseFloat(timeTakenInWeeks);
      if (isNaN(parsedTimeTakenInWeeks) || parsedTimeTakenInWeeks < 0) {
        return res.status(400).json({ success: false, error: "timeTakenInWeeks must be a non‑negative number." });
      }
    }
  
    // Optional reviewDate
    let parsedReviewDate = null;
    if (reviewDate !== null) {
      parsedReviewDate = new Date(reviewDate);
      if (isNaN(parsedReviewDate.getTime())) {
        return res.status(400).json({ success: false, error: "reviewDate must be a valid ISO date string." });
      }
      // Prevent future dates
      if (parsedReviewDate > new Date()) {
        return res.status(400).json({ success: false, error: "reviewDate cannot be in the future." });
      }
      parsedReviewDate = parsedReviewDate.toISOString().split('T')[0];
    }
  
    // is_anonymous must be boolean
    if (typeof is_anonymous !== "boolean") {
      return res.status(400).json({ success: false, error: "is_anonymous must be a boolean." });
    }
  
    // All validations passed → insert
    const sql = `
      INSERT INTO reviews (
        studentId, assignmentId, content, timeTakenInWeeks, reviewDate, is_anonymous
      ) VALUES (?, ?, ?, ?, ?, ?)
    `;
    const data = [parsedStudentId, parsedAssignmentId, content, parsedTimeTakenInWeeks, parsedReviewDate, is_anonymous];
  
    db.query(sql, data, (err, result) => {
      if (err) {
        console.error("Database insert error:", err);
        return res.status(500).json({ success: false, error: "Database error, please try again later." });
      }
      return res.status(201).json({ success: true, message: "Review submitted successfully.", reviewId: result.insertId });
    });
  };
  

exports.getReviewsByAssignment = (req, res) => {
    const { assignmentId } = req.params;
    const parsedAssignmentId = parseInt(assignmentId, 10);
    if (isNaN(parsedAssignmentId)) {
        return res.status(400).send({ success: false, error: "assignmentId must be a valid integer." });
    }

    const sql = "SELECT * FROM reviews WHERE assignmentId = ?";
    db.query(sql, [parsedAssignmentId], (err, reviews) => {
        if (err) {
            console.error("Database query error:", err);
            return res.status(500).send({ success: false, error: "Database error, please try again later." });
        }
        res.status(200).send({ success: true, data: reviews });
    });
};