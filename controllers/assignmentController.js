const db = require("../config/db");

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
    const sql = `
        SELECT a.*,
            AVG(r.time_taken_in_weeks) AS avg_time_taken,
            CAST(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(r.due_date))) AS DATE) AS avg_due_date,
            CAST(FROM_UNIXTIME(AVG(UNIX_TIMESTAMP(r.release_date))) AS DATE) AS avg_release_date
        FROM assignments a
        LEFT JOIN reviews r ON a.id = r.assignment_id
        WHERE a.id = ?
        GROUP BY a.id
    `;
    
    db.query(sql, [assignmentId], (error, results) => {
        if (error) {
            console.error('Database error:', error);
            res.json({
                error: true,
                data: null,
                message: 'Database error occurred'
            });
        } else if (results.length === 0) {
            res.json({
                error: false,
                data: null,
                message: 'Assignment not found'
            });
        } else {
            res.json({
                error: false,
                data: results[0],
                message: 'Assignment retrieved successfully'
            });
        }
    });
};