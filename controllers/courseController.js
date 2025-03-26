const db = require("../config/db");

exports.getAllCourses = (req, res) => {
    const sql = "SELECT * FROM subjects";
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ success: true, courses: results });
    });
};

exports.getAssignmentsAverage = async (req, res) => {
    try {
      const { courseCodes } = req.body;
      if (!Array.isArray(courseCodes) || courseCodes.length === 0) {
        return res.status(400).json({ error: "courseCodes must be a non-empty array." });
      }
  
      for (const code of courseCodes) {
        if (typeof code !== "string" || code.length > 10) {
          return res.status(400).json({ error: `Invalid course code: ${code}` });
        }
      }
  
      const placeholders = courseCodes.map(() => "?").join(",");
      const sql = `
        SELECT 
          a.course_code, 
          a.id, 
          a.name, 
          ROUND(COALESCE(AVG(r.time_taken_in_weeks), 0), 2) AS averageWeeksToComplete,
          FROM_UNIXTIME(ROUND(COALESCE(AVG(UNIX_TIMESTAMP(r.due_date)), 0))) AS averageDueDate,
          FROM_UNIXTIME(ROUND(COALESCE(AVG(UNIX_TIMESTAMP(r.release_date)), 0))) AS averageReleaseDate
        FROM assignments a
        LEFT JOIN reviews r ON a.id = r.assignment_id
        WHERE a.course_code IN (${placeholders})
          AND a.is_obsolete = FALSE
        GROUP BY a.course_code, a.id, a.name
        ORDER BY a.course_code, a.id
      `;
  
      const [rows] = await db.promise().query(sql, courseCodes);
  
      const coursesMap = rows.reduce((acc, { course_code, id, name, averageWeeksToComplete, averageDueDate, averageReleaseDate }) => {
        acc[course_code] ??= { courseCode: course_code, assignments: [] };
        acc[course_code].assignments.push({
          id,
          name,
          averageWeeksToComplete: Number(averageWeeksToComplete),
          averageDueDate,
          averageReleaseDate
        });
        return acc;
      }, {});
  
      const response = courseCodes.map(code => coursesMap[code] || { courseCode: code, assignments: [] });
      return res.json(response);
  
    } catch (err) {
      console.error("DB error in getAssignmentsAverage:", err);
      return res.status(500).json({ error: "Internal server error." });
    }
  };