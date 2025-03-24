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

    if (studentId === undefined || assignmentId === undefined || is_anonymous === undefined) {
        return res.status(400).send({ error: "Missing required fields: studentId, assignmentId, and is_anonymous are required." });
    }

    const parsedStudentId = parseInt(studentId, 10);
    if (isNaN(parsedStudentId)) {
        return res.status(400).send({ error: "studentId must be a valid integer." });
    }

    const parsedAssignmentId = parseInt(assignmentId, 10);
    if (isNaN(parsedAssignmentId)) {
        return res.status(400).send({ error: "assignmentId must be a valid integer." });
    }

    if (content !== null && typeof content !== "string") {
        return res.status(400).send({ error: "content must be a string." });
    }

    let parsedTimeTakenInWeeks = null;
    if (timeTakenInWeeks !== null) {
        parsedTimeTakenInWeeks = parseFloat(timeTakenInWeeks);
        if (isNaN(parsedTimeTakenInWeeks)) {
            return res.status(400).send({ error: "timeTakenInWeeks must be a valid decimal number." });
        }
    }

    let parsedReviewDate = null;
    if (reviewDate !== null) {
        parsedReviewDate = new Date(reviewDate);
        if (isNaN(parsedReviewDate.getTime())) {
            return res.status(400).send({ error: "reviewDate must be a valid date." });
        }
        const year = parsedReviewDate.getFullYear();
        let month = (parsedReviewDate.getMonth() + 1).toString();
        let day = parsedReviewDate.getDate().toString();
        if (month.length < 2) month = '0' + month;
        if (day.length < 2) day = '0' + day;
        parsedReviewDate = `${year}-${month}-${day}`;
    }

    if (typeof is_anonymous !== "boolean") {
        return res.status(400).send({ error: "is_anonymous must be a boolean." });
    }

    exports.postReview = (req, res) => {
        const {
            studentId,
            assignmentId,
            content = null,
            timeTakenInWeeks = null,
            reviewDate = null,
            is_anonymous
        } = req.body;

        if (studentId === undefined || assignmentId === undefined || is_anonymous === undefined) {
            return res.status(400).send({ success: false, error: "Missing required fields: studentId, assignmentId, and is_anonymous are required." });
        }

        const parsedStudentId = parseInt(studentId, 10);
        if (isNaN(parsedStudentId)) {
            return res.status(400).send({ success: false, error: "studentId must be a valid integer." });
        }

        const parsedAssignmentId = parseInt(assignmentId, 10);
        if (isNaN(parsedAssignmentId)) {
            return res.status(400).send({ success: false, error: "assignmentId must be a valid integer." });
        }

        if (content !== null && typeof content !== "string") {
            return res.status(400).send({ success: false, error: "content must be a string." });
        }

        let parsedTimeTakenInWeeks = null;
        if (timeTakenInWeeks !== null) {
            parsedTimeTakenInWeeks = parseFloat(timeTakenInWeeks);
            if (isNaN(parsedTimeTakenInWeeks)) {
                return res.status(400).send({ success: false, error: "timeTakenInWeeks must be a valid decimal number." });
            }
        }

        let parsedReviewDate = null;
        if (reviewDate !== null) {
            parsedReviewDate = new Date(reviewDate);
            if (isNaN(parsedReviewDate.getTime())) {
                return res.status(400).send({ success: false, error: "reviewDate must be a valid date." });
            }
            const year = parsedReviewDate.getFullYear();
            let month = (parsedReviewDate.getMonth() + 1).toString();
            let day = parsedReviewDate.getDate().toString();
            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;
            parsedReviewDate = `${year}-${month}-${day}`;
        }

        if (typeof is_anonymous !== "boolean") {
            return res.status(400).send({ success: false, error: "is_anonymous must be a boolean." });
        }

        const sql = `
            INSERT INTO reviews (
                studentId,
                assignmentId,
                content,
                timeTakenInWeeks,
                reviewDate,
                is_anonymous
            ) VALUES (?, ?, ?, ?, ?, ?)
        `;

        const data = [
            parsedStudentId,
            parsedAssignmentId,
            content,
            parsedTimeTakenInWeeks,
            parsedReviewDate,
            is_anonymous
        ];

        db.query(sql, data, (err, result) => {
            if (err) {
                console.error("Database insert error:", err);
                return res.status(500).send({ success: false, error: "Database error, please try again later." });
            }
            res.status(201).send({ success: true, message: "Review submitted successfully.", reviewId: result.insertId });
        });
    }

    const data = [
        parsedStudentId,
        parsedAssignmentId,
        content,
        parsedTimeTakenInWeeks,
        parsedReviewDate,
        is_anonymous
    ];

    db.query(sql, data, (err, result) => {
        if (err) {
            console.error("Database insert error:", err);
            return res.status(500).send({ error: "Database error, please try again later." });
        }
        res.status(201).send({ message: "Review submitted successfully.", reviewId: result.insertId });
    });
}

exports.deleteReview = (req, res) => {
    const { reviewId } = req.params;
    const parsedReviewId = parseInt(reviewId, 10);
    if (isNaN(parsedReviewId)) {
        return res.status(400).send({ success: false, error: "reviewId must be a valid integer." });
    }

    const sql = `
        DELETE FROM reviews
        WHERE id = ?
    `;

    db.query(sql, [parsedReviewId], (err, result) => {
        if (err) {
            console.error("Database delete error:", err);
            return res.status(500).send({ success: false, error: "Database error, please try again later." });
        }
        if (result.affectedRows === 0) {
            return res.status(404).send({ success: false, error: "Review not found." });
        }
        res.status(200).send({ success: true, message: "Review deleted successfully." });
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