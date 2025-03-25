const db = require("../config/db");

exports.postReview = (req, res) => {
    console.log(req.body)
    // Extract data from request body
    const {
        studentId,
        assignmentId,
        content,
        timeTakenInWeeks,
        reviewDate,
        is_anonymous
    } = req.body;

    // Basic validation (content is now optional)
    if (!studentId || !assignmentId || !timeTakenInWeeks || !reviewDate) {
        return res.status(400).json({
            success: false,
            error: 'Missing required fields'
        });
    }

    // First, verify that the assignment exists
    const checkAssignmentQuery = 'SELECT id FROM assignments WHERE id = ?';
    
    db.query(checkAssignmentQuery, [assignmentId], (err, assignmentResults) => {
        if (err) {
            return res.status(500).json({
                success: false,
                error: 'Database error checking assignment',
                details: err.message
            });
        }

        if (assignmentResults.length === 0) {
            return res.status(404).json({
                success: false,
                error: 'Assignment not found'
            });
        }

        // Then verify the user exists (assuming users table has zID as primary key)
        const checkUserQuery = 'SELECT zID FROM users WHERE zID = ?';
        
        db.query(checkUserQuery, [studentId], (err, userResults) => {
            if (err) {
                return res.status(500).json({
                    success: false,
                    error: 'Database error checking user',
                    details: err.message
                });
            }

            if (userResults.length === 0) {
                return res.status(404).json({
                    success: false,
                    error: 'User not found'
                });
            }

            // Prepare the review data, defaulting content to an empty string if not provided
            const reviewData = {
                user_zid: studentId,
                assignment_id: assignmentId,
                content: content || '',
                time_taken_in_weeks: timeTakenInWeeks,
                review_date: reviewDate,
                is_anonymous: is_anonymous || false
            };

            // Insert the review
            const insertQuery = `
                INSERT INTO reviews (
                    user_zid,
                    assignment_id,
                    content,
                    time_taken_in_weeks,
                    review_date,
                    is_anonymous
                ) VALUES (?, ?, ?, ?, ?, ?)
            `;

            db.query(
                insertQuery,
                [
                    reviewData.user_zid,
                    reviewData.assignment_id,
                    reviewData.content,
                    reviewData.time_taken_in_weeks,
                    reviewData.review_date,
                    reviewData.is_anonymous
                ],
                (err, result) => {
                    if (err) {
                        // Handle duplicate entry error (if review already exists for this user/assignment)
                        if (err.code === 'ER_DUP_ENTRY') {
                            return res.status(400).json({
                                success: false,
                                error: 'Review already exists for this user and assignment'
                            });
                        }
                        
                        return res.status(500).json({
                            success: false,
                            error: 'Database error creating review',
                            details: err.message
                        });
                    }

                    // Success response
                    res.status(201).json({
                        success: true,
                        data: {
                            id: result.insertId,
                            ...reviewData
                        },
                        message: 'Review created successfully'
                    });
                }
            );
        });
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