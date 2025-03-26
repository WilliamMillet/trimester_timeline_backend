const express = require('express');
const courseController = require('../controllers/courseController');
const router = express.Router()

router.get("/", courseController.getAllCourses);
router.post("/get-assignments-duration-data", courseController.getAssignmentsAverage)

module.exports = router;

