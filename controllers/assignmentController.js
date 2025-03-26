const db = require("../config/db");

const OpenAI = require("openai");
const client = new OpenAI();

exports.getAiAssignmentSummary = (req, res) => {
  const { id } = req.params;

  const query = `
    SELECT 
      time_taken_in_weeks,
      release_date,
      due_date,
      content
    FROM reviews
    WHERE assignment_id = ?
  `;

  db.query(query, [id], (err, result) => {
    console.log(result)
    if (err) {
      console.error('Database error:', err);
      return res.status(500).json({ error: 'Internal server error' });
    }

    if (result.length === 0) {
      return res.status(404).json({ error: 'No reviews found for this assignment' });
    }

    // Process data
    const reviewData = result;
    console.log(reviewData)

    const concatenatedContent = reviewData.map(review => review.content).join(' ');
    const reviewSnippet = concatenatedContent.slice(0, 500);
    const releaseDates = reviewData.map(review => review.release_date).slice(0, 30);
    const dueDates = reviewData.map(review => review.due_date).slice(0, 30);
    const weeks = reviewData.map(review => review.time_taken_in_weeks).slice(0, 30);

    const userPrompt = `Review Snippet: ${reviewSnippet}
    Release Dates: ${releaseDates.join(', ')}
    Due Dates: ${dueDates.join(', ')}
    Time Taken (in weeks): ${weeks.join(', ')}`;

    // Call the AI model
    client.chat.completions.create({
      model: 'gpt-4o',
      messages: [
        {
          role: 'system',
          content: 'You are responsible for looking at how long and difficult assignments are, then creating a helpful 45-55 word summary of the difficulty and length of the assignment. You are NOT to go on excessively talking about the assignment itself.'
        },
        { role: 'user', content: userPrompt }
      ]
    })
      .then(aiResponse => {
        // Send the AI-generated summary back to the client
        res.json({ summary: aiResponse.choices[0].message.content });
      })
      .catch(aiError => {
        console.error('AI error:', aiError);
        res.status(500).json({ error: 'Error generating AI summary' });
      });
  });
};


exports.getAllAssignments = (req, res) => {
    const sql = `
      SELECT a.*,
        AVG(r.time_taken_in_weeks) AS avg_time_taken,
        CAST(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(r.due_date))) AS DATE) AS avg_due_date,
        CAST(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(r.release_date))) AS DATE) AS avg_release_date
      FROM assignments a
      LEFT JOIN reviews r ON a.id = r.assignment_id
      GROUP BY a.id
    `;
    
    db.query(sql, (error, results) => {
      if (error) {
        console.error('Database error:', error);
        res.json({
          error: true,
          data: null,
          message: 'Database error occurred'
        });
      } else {
        res.json({
          error: false,
          data: results,
          message: 'Assignments retrieved successfully'
        });
      }
    });
  };
  
  exports.getAssignmentById = (req, res) => {
    const assignmentId = req.params.id;

    // Query to get the assignment details (you can keep your aggregated values as needed)
    const assignmentQuery = `
        SELECT a.*,
            AVG(r.time_taken_in_weeks) AS avg_time_taken,
            CAST(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(r.due_date))) AS DATE) AS avg_due_date,
            CAST(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(r.release_date))) AS DATE) AS avg_release_date
        FROM assignments a
        LEFT JOIN reviews r ON a.id = r.assignment_id
        WHERE a.id = ?
        GROUP BY a.id
    `;

    // Query for histogram data: group reviews by rounded weeks to complete and count each group
    const histogramQuery = `
        SELECT ROUND(time_taken_in_weeks) AS weeks, COUNT(*) AS count
        FROM reviews
        WHERE assignment_id = ?
        GROUP BY weeks
        ORDER BY weeks
    `;

    // First, get assignment details
    db.query(assignmentQuery, [assignmentId], (error, assignmentResults) => {
        if (error) {
            console.error('Database error:', error);
            return res.json({
                error: true,
                data: null,
                message: 'Database error occurred'
            });
        } else if (assignmentResults.length === 0) {
            return res.json({
                error: false,
                data: null,
                message: 'Assignment not found'
            });
        }

        // Then, retrieve histogram data
        db.query(histogramQuery, [assignmentId], (histError, histogramResults) => {
            if (histError) {
                console.error('Histogram query error:', histError);
                return res.json({
                    error: true,
                    data: null,
                    message: 'Database error occurred while fetching histogram data'
                });
            }
            
            // Return both assignment details and histogram data
            res.json({
                error: false,
                data: {
                    assignment: assignmentResults[0],
                    histogram: histogramResults
                },
                message: 'Assignment and histogram data retrieved successfully'
            });
        });
    });
};