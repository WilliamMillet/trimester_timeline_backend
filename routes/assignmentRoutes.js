const express = require('express');
const assignmentController = require('../controllers/assignmentController');
const router = express.Router()

router.get("/", assignmentController.getAllAssignments);
router.get("/:id", assignmentController.getAssignmentById);

module.exports = router;

