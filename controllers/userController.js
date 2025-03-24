const db = require("../config/db");

exports.handleSignup = async (req, res) => {
    const { name, zid, password, degree, year } = req.body;
    const missingFields = [];
    if (!name) missingFields.push("name");
    if (!zid) missingFields.push("zid");
    if (!password) missingFields.push("password");
    if (!degree) missingFields.push("degree");
    if (!year) missingFields.push("year");
  
    if (missingFields.length > 0) {
      return res
        .status(400)
        .json({
          success: false,
          error: `Missing required field(s): ${missingFields.join(", ")}`,
        });
    }
  
    if (
      typeof name !== "string" ||
      typeof zid !== "string" ||
      typeof password !== "string" ||
      typeof degree !== "string" ||
      typeof year !== "number"
    ) {
      return res
        .status(400)
        .json({
          success: false,
          error:
            "Invalid data types provided. Expected types: name, zid, password, degree as string and year as number.",
        });
    }

    const query = `SELECT 1 FROM users WHERE zID = ?`

    db.query(query, [zid], (err, results) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({
                success: false,
                error: "Internal server error while checking user existence.",
            });
        }
        if (results.rows && results.rows.length > 0) {
            return res.status(400).json({
                success: false,
                error: "User with this zID already exists.",
            });
        }

        bcrypt.hash(password, 10, (err, hashedPassword) => {
            if (err) {
                console.error("Error hashing password:", err);
                return res.status(500).json({
                    success: false,
                    error: "Error processing signup."
                });
            }
            
            const insertQuery = `INSERT INTO users (name, zID, password, degree, year) VALUES (?, ?, ?, ?, ?)`;
            db.query(insertQuery, [name, zid, hashedPassword, degree, year], (err, result) => {
                if (err) {
                    console.error("Database error during user insertion:", err);
                    return res.status(500).json({
                        success: false,
                        error: "Internal server error during signup."
                    });
                }
                return res.status(201).json({ success: true, message: "Signup was successful" });
            });
        });
    });
  };
  
  
exports.handleLogin = (req, res) => {
    const { zid, password } = req.body;
    const missingFields = [];
    if (!zid) missingFields.push("zid");
    if (!password) missingFields.push("password");

    if (missingFields.length > 0) {
        return res
            .status(400)
            .json({ success: false, error: `Missing required field(s): ${missingFields.join(", ")}` });
    }

    if (typeof zid !== "string" || typeof password !== "string") {
        return res
            .status(400)
            .json({ success: false, error: "Invalid data types provided. Expected zid and password to be strings." });
    }

    const query = `SELECT name, password FROM users WHERE zID = ?`;
    db.query(query, [zid], (err, results) => {
        if (err) {
            console.error("Database error:", err);
            return res.status(500).json({ success: false, error: "Internal server error during login." });
        }
        if (!results || results.length === 0) {
            return res.status(401).json({ success: false, error: "Invalid zID or password." });
        }

        const dbPassword = results[0].password;
        const name = results[0].name;

        bcrypt.compare(password, dbPassword, (err, result) => {
            if (err) {
                console.error("Error comparing passwords:", err);
                return res.status(500).json({ success: false, error: "Error processing login." });
            }
            if (!result) {
                return res.status(401).json({ success: false, error: "Incorrect password" });
            }

            return res.status(200).json({ success: true, data: { zid, name } });
        });
    });
};

exports.handleDeleteUser = (req, res) => {
    const { zid, password } = req.body;
    const missingFields = [];
    if (!zid) missingFields.push("zid");
    if (!password) missingFields.push("password");
    if (missingFields.length > 0) {
        return res.status(400).json({ success: false, error: `Missing required field(s): ${missingFields.join(", ")}` });
    }
    if (typeof zid !== "string" || typeof password !== "string") {
        return res.status(400).json({ success: false, error: "Invalid data types provided. Expected zid and password to be strings." });
    }
    
    const selectQuery = `SELECT password FROM users WHERE zID = ?`;
    db.query(selectQuery, [zid], (err, results) => {
        if (err) {
            return res.status(500).json({ success: false, error: "Internal server error while verifying user." });
        }
        if (!results || results.length === 0) {
            return res.status(401).json({ success: false, error: "Invalid zID or password." });
        }
        const dbPassword = results[0].password;
        bcrypt.compare(password, dbPassword, (err, isMatch) => {
            if (err) {
                return res.status(500).json({ success: false, error: "Error processing deletion." });
            }
            if (!isMatch) {
                return res.status(401).json({ success: false, error: "Incorrect password" });
            }
            const deleteQuery = `DELETE FROM users WHERE zID = ?`;
            db.query(deleteQuery, [zid], (err, result) => {
                if (err) {
                    return res.status(500).json({ success: false, error: "Internal server error during deletion." });
                }
                return res.status(200).json({ success: true, message: "User deletion was successful" });
            });
        });
    });
};